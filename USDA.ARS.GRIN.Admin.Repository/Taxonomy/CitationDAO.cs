using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Runtime.Caching;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
namespace USDA.ARS.GRIN.Admin.Repository.Taxonomy
{
    public class CitationDAO : BaseDAO, IRepository<Citation>
    {
        FolderDAO _folderDAO = null;

        public CitationDAO(string context)
        {
            _context = context;
            _folderDAO = new FolderDAO(context);
        }
        public ResultContainer Add(Citation entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCitation_Insert";
            ResultContainer resultContainer = new ResultContainer();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@literature_id", entity.LiteratureID);

                        if (!String.IsNullOrEmpty(entity.CitationTitle))
                            cmd.Parameters.AddWithValue("@citation_title", entity.CitationTitle);
                        else
                            cmd.Parameters.AddWithValue("@citation_title", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.LiteratureEditorAuthorName))
                            cmd.Parameters.AddWithValue("@author_name", entity.LiteratureEditorAuthorName);
                        else
                            cmd.Parameters.AddWithValue("@author_name", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.CitationYear))
                            cmd.Parameters.AddWithValue("@citation_year", entity.CitationYear);
                        else
                            cmd.Parameters.AddWithValue("@citation_year", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Reference))
                            cmd.Parameters.AddWithValue("@reference", entity.Reference);
                        else
                            cmd.Parameters.AddWithValue("@reference", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.DOIReference))
                            cmd.Parameters.AddWithValue("@doi_reference", entity.DOIReference);
                        else
                            cmd.Parameters.AddWithValue("@doi_reference", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.URL))
                            cmd.Parameters.AddWithValue("@url", entity.URL);
                        else
                            cmd.Parameters.AddWithValue("@url", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Title))
                            cmd.Parameters.AddWithValue("@title", entity.Title);
                        else
                            cmd.Parameters.AddWithValue("@title", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.Description))
                            cmd.Parameters.AddWithValue("@description", entity.Description);
                        else
                            cmd.Parameters.AddWithValue("@description", DBNull.Value);
                                 
                        cmd.Parameters.AddWithValue("@accession_id", DBNull.Value);
                        cmd.Parameters.AddWithValue("@method_id", DBNull.Value);


                        if (entity.SpeciesID > 0)
                            cmd.Parameters.AddWithValue("@taxonomy_species_id", entity.SpeciesID);
                        else
                            cmd.Parameters.AddWithValue("@taxonomy_species_id", DBNull.Value);

                        if (entity.GenusID > 0)
                            cmd.Parameters.AddWithValue("@taxonomy_genus_id", entity.GenusID);
                        else
                            cmd.Parameters.AddWithValue("@taxonomy_genus_id", DBNull.Value);

                        if (entity.FamilyID > 0)
                            cmd.Parameters.AddWithValue("@taxonomy_family_id", entity.FamilyID);
                        else
                            cmd.Parameters.AddWithValue("@taxonomy_family_id", DBNull.Value);

                        cmd.Parameters.AddWithValue("@accession_ipr_id", DBNull.Value);
                        cmd.Parameters.AddWithValue("@accession_pedigree_id", DBNull.Value);
                        cmd.Parameters.AddWithValue("@genetic_marker_id", DBNull.Value);
                        cmd.Parameters.AddWithValue("@unique_key", DBNull.Value);

                        if (!String.IsNullOrEmpty(entity.TypeCode))
                            cmd.Parameters.AddWithValue("@type_code", entity.TypeCode);
                        else
                            cmd.Parameters.AddWithValue("@type_code", DBNull.Value);

                        cmd.Parameters.AddWithValue("@is_accepted_name", UnBool(entity.IsAcceptedName));

                        if (!String.IsNullOrEmpty(entity.Note))
                            cmd.Parameters.AddWithValue("@note", entity.Note);
                        else
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);

                        cmd.Parameters.AddWithValue("@created_by", entity.CreatedByCooperatorID);

                        SqlParameter errorParam = new SqlParameter();
                        errorParam.SqlDbType = System.Data.SqlDbType.Int;
                        errorParam.ParameterName = "@out_error_number";
                        errorParam.Direction = System.Data.ParameterDirection.Output;
                        errorParam.Value = 0;
                        cmd.Parameters.Add(errorParam);

                        SqlParameter genusIdParam = new SqlParameter();
                        genusIdParam.SqlDbType = System.Data.SqlDbType.Int;
                        genusIdParam.ParameterName = "@out_citation_id";
                        genusIdParam.Direction = System.Data.ParameterDirection.Output;
                        genusIdParam.Value = 0;
                        cmd.Parameters.Add(genusIdParam);

                        cmd.ExecuteNonQuery();
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
                        if (!String.IsNullOrEmpty(resultContainer.ResultCode))
                        {
                            if (Int32.Parse(resultContainer.ResultCode) > 0)
                            {
                                throw new Exception(resultContainer.ResultCode + resultContainer.ResultMessage);
                            }
                        }
                        resultContainer.EntityID = GetInt(cmd.Parameters["@out_citation_id"].Value.ToString());
                    }
                }
            }
            catch (SqlException ex)
            {
                switch (ex.Errors[0].Number)
                {
                    case 547: // Foreign Key violation
                        string s = ex.Message;
                        s = s.Substring(s.IndexOf("column "));
                        string[] array = s.Split('.');
                        s = array[0].Substring(array[0].IndexOf('\''));
                        break;
                }
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public IQueryable<Citation> FindAll()
        {
            throw new NotImplementedException();
        }

        public Citation Get(int id)
        {
            Citation citation = new Citation();

            try
            {
                String commandText = "usp_TaxonomyCitation_Select";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@citation_id", id);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                citation.ID = Int32.Parse(reader["citation_id"].ToString());
                                citation.FamilyID = GetInt(reader["taxonomy_family_id"].ToString());
                                citation.GenusID = GetInt(reader["taxonomy_genus_id"].ToString());
                                citation.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                                citation.CitationText = reader["citation_text"].ToString();
                                citation.URL = reader["url"].ToString();
                                citation.LiteratureID = Int32.Parse(reader["literature_id"].ToString());
                                citation.LiteratureReferenceTitle = reader["reference_title"].ToString();
                                citation.LiteratureEditorAuthorName = reader["editor_author_name"].ToString();
                                citation.LiteraturePublicationYear = reader["publication_year"].ToString();
                                citation.Title = reader["citation_title"].ToString();
                                citation.CitationAuthorName = reader["author_name"].ToString();
                                citation.CitationYear = reader["citation_year"].ToString();
                                citation.Reference = reader["reference"].ToString();
                                citation.DOIReference = reader["doi_reference"].ToString();
                                citation.Title = reader["title"].ToString();
                                citation.Description = reader["description"].ToString();
                                citation.TypeCode = reader["type_code"].ToString();
                                citation.IsAcceptedName = ParseBool(reader["is_accepted_name"].ToString());
                                citation.CreatedDate = GetDate(reader["created_date"].ToString());
                                citation.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                citation.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                citation.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                citation.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                                citation.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return citation;
        }
     
        public ResultContainer Remove(Citation entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Citation> Search(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<Citation> citations = new List<Citation>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                citations = Search(sqlWhereClause);
                return citations;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public IQueryable<Citation> GetByCategory(string category, int id)
        {
            List<Citation> citations = new List<Citation>();

            try
            {
                String commandText = "usp_TaxonomyCitationsByCategory_Select";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@source", category);
                        cmd.Parameters.AddWithValue("@id", id);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Citation citation = new Citation();
                                citation.ID = Int32.Parse(reader["citation_id"].ToString());
                                citation.TypeCode = reader["type_code"].ToString();
                                citation.TaxonName = reader["taxon_name"].ToString();
                                citation.Title = reader["citation_title"].ToString();
                                citation.LiteratureAbbreviation = reader["abbreviation"].ToString();
                                citation.LiteratureReferenceTitle = reader["reference_title"].ToString();
                                citation.LiteratureEditorAuthorName = reader["author_name"].ToString();
                                citation.Reference = reader["reference"].ToString();
                                citation.CitationYear = reader["citation_year"].ToString();
                                citation.IsAcceptedName = ParseBool(reader["is_accepted_name"].ToString());
                                
                                citations.Add(citation);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return citations.AsQueryable();
        }

        public IQueryable<Citation> GetByLiterature(int literatureId)
        {
            List<Citation> citations = new List<Citation>();

            try
            {
                String commandText = "usp_TaxonomyCitationsByLiterature_Select";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@literature_id", literatureId );
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Citation citation = new Citation();
                                citation.ID = Int32.Parse(reader["citation_id"].ToString());
                                citation.Title = reader["citation_title"].ToString();
                                citation.TypeCode = reader["type_code"].ToString();
                                citation.DOIReference = reader["doi_reference"].ToString();
                                citation.CitationYear = reader["citation_year"].ToString();
                                citation.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                                citation.SpeciesName = reader["species_name"].ToString();
                                citation.TaxonName = reader["species_name"].ToString();
                                citation.LiteratureEditorAuthorName = reader["editor_author_name"].ToString();
                                citation.LiteratureReferenceTitle = reader["reference_title"].ToString();
                                citation.LiteratureAbbreviation = reader["abbreviation"].ToString();
                                citation.Note = reader["note"].ToString();
                                citations.Add(citation);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return citations.AsQueryable();
        }

        //public IQueryable<Citation> Search(int searchType, Query query)
        //{
        //    int i = 0;
        //    StringBuilder sbWhereClause = new StringBuilder();
        //    foreach (QueryCriterion queryCriterion in query.QueryCriteria)
        //    {
        //        if (i == 0)
        //            sbWhereClause.Append(" WHERE ");
        //        else
        //            sbWhereClause.Append(" AND ");

        //        sbWhereClause.Append(queryCriterion.FieldName);
        //        sbWhereClause.Append(" ");
        //        sbWhereClause.Append(queryCriterion.SearchOperatorCode);
        //        sbWhereClause.Append(" ");

        //        if (queryCriterion.DataType == "NVARCHAR")
        //        {
        //            if (queryCriterion.FieldValue == "NULL")
        //            {
        //                sbWhereClause.Append(queryCriterion.FieldValue);
        //            }
        //            else
        //            {
        //                sbWhereClause.Append("'");
        //                if (queryCriterion.SearchOperatorCode == "LIKE")
        //                {
        //                    sbWhereClause.Append("%");
        //                }
        //                sbWhereClause.Append(queryCriterion.FieldValue);
        //                if (queryCriterion.SearchOperatorCode == "LIKE")
        //                {
        //                    sbWhereClause.Append("%");
        //                }
        //                sbWhereClause.Append("'");
        //            }
        //        }
        //        i++;
        //    }
           
        //    return Search(searchType, sbWhereClause.ToString());
        //}

        public IQueryable<Citation> Search(string searchString)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCitations_Search";
            List<Citation> citations = new List<Citation>();

            try
            {

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@sql_where_clause", searchString);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Citation citation = new Citation();
                                citation.ID = Int32.Parse(reader["citation_id"].ToString());
                                citation.FamilyID = GetInt(reader["taxonomy_family_id"].ToString());
                                citation.GenusID = GetInt(reader["taxonomy_genus_id"].ToString());
                                citation.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                                citation.CitationText = reader["citation_text"].ToString();
                                citation.URL = reader["url"].ToString();
                                citation.Literature.ID = GetInt(reader["literature_id"].ToString());
                                citation.Literature.ReferenceTitle = reader["reference_title"].ToString();
                                citation.Literature.EditorAuthorName = reader["editor_author_name"].ToString();
                                citation.Literature.PublicationYear = reader["publication_year"].ToString();
                                citation.Title = reader["citation_title"].ToString();
                                citation.LiteratureEditorAuthorName = reader["author_name"].ToString();
                                citation.CitationYear = reader["citation_year"].ToString();
                                citation.Reference = reader["reference"].ToString();
                                citation.DOIReference = reader["doi_reference"].ToString();
                                citation.TypeCode = reader["type_code"].ToString();
                                citation.Note = reader["note"].ToString();
                                citations.Add(citation);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return citations.AsQueryable();
        }

        public ResultContainer Update(Citation entity)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCitation_Update";
            ResultContainer resultContainer = new ResultContainer();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;
                    cmd.Parameters.AddWithValue("@citation_id", entity.ID);
                    cmd.Parameters.AddWithValue("@literature_id", entity.LiteratureID);

                    if (!String.IsNullOrEmpty(entity.CitationTitle))
                        cmd.Parameters.AddWithValue("@citation_title", entity.CitationTitle);
                    else
                        cmd.Parameters.AddWithValue("@citation_title", DBNull.Value);

                    if (!String.IsNullOrEmpty(entity.LiteratureEditorAuthorName))
                        cmd.Parameters.AddWithValue("@author_name", entity.LiteratureEditorAuthorName);
                    else
                        cmd.Parameters.AddWithValue("@author_name", DBNull.Value);

                    if (!String.IsNullOrEmpty(entity.CitationYear))
                        cmd.Parameters.AddWithValue("@citation_year", entity.CitationYear);
                    else
                        cmd.Parameters.AddWithValue("@citation_year", DBNull.Value);

                    if (!String.IsNullOrEmpty(entity.Reference))
                        cmd.Parameters.AddWithValue("@reference", entity.Reference);
                    else
                        cmd.Parameters.AddWithValue("@reference", DBNull.Value);

                    if (!String.IsNullOrEmpty(entity.DOIReference))
                        cmd.Parameters.AddWithValue("@doi_reference", entity.DOIReference);
                    else
                        cmd.Parameters.AddWithValue("@doi_reference", DBNull.Value);

                    if (!String.IsNullOrEmpty(entity.URL))
                        cmd.Parameters.AddWithValue("@url", entity.URL);
                    else
                        cmd.Parameters.AddWithValue("@url", DBNull.Value);

                    if (!String.IsNullOrEmpty(entity.Title))
                        cmd.Parameters.AddWithValue("@title", entity.Title);
                    else
                        cmd.Parameters.AddWithValue("@title", DBNull.Value);

                    if (!String.IsNullOrEmpty(entity.Description))
                        cmd.Parameters.AddWithValue("@description", entity.Description);
                    else
                        cmd.Parameters.AddWithValue("@description", DBNull.Value);

                    if (entity.SpeciesID > 0)
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", entity.SpeciesID);
                    else
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", DBNull.Value);

                    if (entity.GenusID > 0)
                        cmd.Parameters.AddWithValue("@taxonomy_genus_id", entity.GenusID);
                    else
                        cmd.Parameters.AddWithValue("@taxonomy_genus_id", DBNull.Value);

                    if (entity.FamilyID > 0)
                        cmd.Parameters.AddWithValue("@taxonomy_family_id", entity.FamilyID);
                    else
                        cmd.Parameters.AddWithValue("@taxonomy_family_id", DBNull.Value);

                    if (!String.IsNullOrEmpty(entity.TypeCode))
                        cmd.Parameters.AddWithValue("@type_code", entity.TypeCode);
                    else
                        cmd.Parameters.AddWithValue("@type_code", DBNull.Value);

                    cmd.Parameters.AddWithValue("@is_accepted_name", UnBool(entity.IsAcceptedName));

                    if (!String.IsNullOrEmpty(entity.Note))
                        cmd.Parameters.AddWithValue("@note", entity.Note);
                    else
                        cmd.Parameters.AddWithValue("@note", DBNull.Value);

                    cmd.Parameters.AddWithValue("@modified_by", entity.ModifiedByCooperatorID);

                    SqlParameter errorParam = new SqlParameter();
                    errorParam.SqlDbType = System.Data.SqlDbType.Int;
                    errorParam.ParameterName = "@out_error_number";
                    errorParam.Direction = System.Data.ParameterDirection.Output;
                    errorParam.Value = 0;
                    cmd.Parameters.Add(errorParam);
                    cmd.ExecuteNonQuery();
                    resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        #region Literature

        public Literature GetLiterature(int id)
        {
            Literature literature = new Literature();
            try
            {
                String commandText = "usp_TaxonomyLiterature_Select";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@literature_id", id);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                literature.ID = GetInt(reader["literature_id"].ToString());
                                literature.Abbreviation = reader["abbreviation"].ToString();
                                literature.StandardAbbreviation = reader["standard_abbreviation"].ToString();
                                literature.ReferenceTitle = reader["reference_title"].ToString();
                                literature.EditorAuthorName = reader["editor_author_name"].ToString();
                                literature.TypeCode = reader["literature_type_code"].ToString();
                                literature.PublicationYear = reader["publication_year"].ToString();
                                literature.PublisherName = reader["publisher_name"].ToString();
                                literature.URL = reader["url"].ToString();
                                literature.Note = reader["note"].ToString();
                                literature.CreatedDate = GetDate(reader["created_date"].ToString());
                                literature.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                literature.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                literature.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                literature.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                                literature.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return literature;
        }

        public ResultContainer InsertLiterature(Literature literature)
        {
            return null;
        }
        public ResultContainer UpdateLiterature(Literature literature)
        {
            return null;
        }

        public IQueryable<Literature> SearchLiterature(string searchText)
        {
            List<Literature> literatures = new List<Literature>();

            try
            {
                String commandText = "usp_TaxonomyLiterature_Search";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@sql_where_clause", searchText);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Literature literature = new Literature();
                                literature.ID = GetInt(reader["literature_id"].ToString());
                                literature.Abbreviation = reader["abbreviation"].ToString();
                                literature.StandardAbbreviation = reader["standard_abbreviation"].ToString();
                                literature.ReferenceTitle = reader["reference_title"].ToString();
                                literature.EditorAuthorName = reader["editor_author_name"].ToString();
                                literature.TypeCode = reader["literature_type_code"].ToString();
                                literature.PublicationYear = reader["publication_year"].ToString();
                                literature.PublisherName = reader["publisher_name"].ToString();
                                literature.URL = reader["url"].ToString();
                                literature.Note = reader["note"].ToString();
                                literature.CitationCount = GetInt(reader["citation_count"].ToString());
                                literatures.Add(literature);

                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return literatures.AsQueryable();
        }

        public IQueryable<Literature> SearchLiterature(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<Literature> literatures = new List<Literature>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                literatures = SearchLiterature(sqlWhereClause).AsQueryable();
                return literatures;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public ResultContainer AddTaxonCitation(int citationId, int taxonId, string dataSource)
        {
            string commandText = String.Empty;
            string taxonIdParamName = String.Empty; 
            ResultContainer resultContainer = new ResultContainer();

            try
            {
                switch (dataSource)
                {
                    case "taxonomy_family":
                        commandText = "usp_TaxonomyCitationFamilyClone_Insert";
                        taxonIdParamName = "@taxonomy_family_id";
                        break;
                    case "taxonomy_genus":
                        commandText = "usp_TaxonomyCitationGenusClone_Insert";
                        taxonIdParamName = "@taxonomy_genus_id";
                        break;
                    case "taxonomy_species":
                        commandText = "usp_TaxonomyCitationSpeciesClone_Insert";
                        taxonIdParamName = "@taxonomy_species_id";
                        break;
                }

                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = commandText;
                        cmd.Parameters.AddWithValue("@citation_id", citationId);
                        cmd.Parameters.AddWithValue(taxonIdParamName, taxonId);

                        SqlParameter errorParam = new SqlParameter();
                        errorParam.SqlDbType = System.Data.SqlDbType.Int;
                        errorParam.ParameterName = "@out_error_number";
                        errorParam.Direction = System.Data.ParameterDirection.Output;
                        errorParam.Value = 0;
                        cmd.Parameters.Add(errorParam);

                        SqlParameter familyIdParam = new SqlParameter();
                        familyIdParam.SqlDbType = System.Data.SqlDbType.Int;
                        familyIdParam.ParameterName = "@out_citation_id";
                        familyIdParam.Direction = System.Data.ParameterDirection.Output;
                        familyIdParam.Value = 0;
                        cmd.Parameters.Add(familyIdParam);

                        cmd.ExecuteNonQuery();
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
                        if (!String.IsNullOrEmpty(resultContainer.ResultCode))
                        {
                            if (Int32.Parse(resultContainer.ResultCode) > 0)
                            {
                                throw new Exception(resultContainer.ResultCode + resultContainer.ResultMessage);
                            }
                        }
                        resultContainer.EntityID = GetInt(cmd.Parameters["@out_citation_id"].Value.ToString());
                    }
                }
            }
            catch (SqlException ex)
            {
                switch (ex.Errors[0].Number)
                {
                    case 547: // Foreign Key violation
                        string s = ex.Message;
                        s = s.Substring(s.IndexOf("column "));
                        string[] array = s.Split('.');
                        s = array[0].Substring(array[0].IndexOf('\''));
                        break;
                }
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        #endregion
    }
}
