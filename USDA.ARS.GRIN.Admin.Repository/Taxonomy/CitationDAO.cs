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
        public CitationDAO(string context)
        {
            _context = context;
        }
        public ResultContainer Add(Citation entity)
        {
            ResultContainer resultContainer = new ResultContainer();

            try
            {

            }
            catch (SqlException ex)
            {

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
                                citation.LiteratureID = Int32.Parse(reader["literature_id"].ToString());
                                citation.Title = reader["citation_title"].ToString();
                                citation.AuthorName = reader["author_name"].ToString();
                                citation.CitationYear = reader["citation_year"].ToString();
                                citation.Reference = reader["reference"].ToString();
                                citation.DOIReference = reader["doi_reference"].ToString();
                                citation.URL = reader["url"].ToString();
                                citation.Title = reader["title"].ToString();
                                citation.Description = reader["description"].ToString();
                                citation.AccessionID = GetInt(reader["accession_id"].ToString());
                                citation.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                                citation.GenusID = GetInt(reader["taxonomy_genus_id"].ToString());
                                citation.FamilyID = GetInt(reader["taxonomy_family_id"].ToString());
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

        public List<Literature> SearchLiterature(string searchText)
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
                        cmd.Parameters.AddWithValue("@search_string", searchText);
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
            return literatures;
        }

        public ResultContainer Remove(Citation entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Citation> Search(Query query)
        {
            throw new NotImplementedException();
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
                                citation.AuthorName = reader["author_name"].ToString();
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

        public IQueryable<Citation> Search(int searchType, Query query)
        {
            int i = 0;
            StringBuilder sbWhereClause = new StringBuilder();
            foreach (QueryCriterion queryCriterion in query.QueryCriteria)
            {
                if (i == 0)
                    sbWhereClause.Append(" WHERE ");
                else
                    sbWhereClause.Append(" AND ");

                sbWhereClause.Append(queryCriterion.FieldName);
                sbWhereClause.Append(" ");
                sbWhereClause.Append(queryCriterion.SearchOperatorCode);
                sbWhereClause.Append(" ");

                if (queryCriterion.DataType == "NVARCHAR")
                {
                    if (queryCriterion.FieldValue == "NULL")
                    {
                        sbWhereClause.Append(queryCriterion.FieldValue);
                    }
                    else
                    {
                        sbWhereClause.Append("'");
                        if (queryCriterion.SearchOperatorCode == "LIKE")
                        {
                            sbWhereClause.Append("%");
                        }
                        sbWhereClause.Append(queryCriterion.FieldValue);
                        if (queryCriterion.SearchOperatorCode == "LIKE")
                        {
                            sbWhereClause.Append("%");
                        }
                        sbWhereClause.Append("'");
                    }
                }
                i++;
            }
           
            return Search(searchType, sbWhereClause.ToString());
        }

        public IQueryable<Citation> Search(int searchType, string searchString)
        {
            String commandText = String.Empty;
            List<Citation> citations = new List<Citation>();

            try
            {
                switch (searchType)
                {
                    case 1:
                        commandText = "usp_TaxonomyCitationsBySpecies_Search";
                        break;
                    case 2:
                        commandText = "usp_TaxonomyCitationsByGenus_Search";
                        break;
                    case 3:
                        commandText = "usp_TaxonomyCitationsByFamily_Search";
                        break;
                    case 4:
                        commandText = "usp_TaxonomyCitationsByAccession_Search";
                        break;
                }

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
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
                                citation.Title = reader["citation_title"].ToString();
                                citation.TypeCode = reader["type_code"].ToString();
                                citation.CitationYear = reader["citation_year"].ToString();
                                citation.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                                citation.SpeciesName = reader["species_name"].ToString();
                                citation.TaxonName = reader["species_name"].ToString();
                                citation.AuthorName = reader["editor_author_name"].ToString();
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
                    
                    if (String.IsNullOrEmpty(entity.Title))
                        cmd.Parameters.AddWithValue("@citation_title", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@citation_title", entity.Title);

                    if (String.IsNullOrEmpty(entity.AuthorName))
                        cmd.Parameters.AddWithValue("@author_name", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@author_name", entity.AuthorName);

                    if (String.IsNullOrEmpty(entity.CitationYear))
                        cmd.Parameters.AddWithValue("@citation_year", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@citation_year", entity.CitationYear);

                    if (String.IsNullOrEmpty(entity.Reference))
                        cmd.Parameters.AddWithValue("@reference", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@reference", entity.Reference);

                    if (String.IsNullOrEmpty(entity.URL))
                        cmd.Parameters.AddWithValue("@url", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@url", entity.URL);

                    cmd.Parameters.AddWithValue("@accession_id", entity.AccessionID);
                    cmd.Parameters.AddWithValue("@taxonomy_species_id", entity.SpeciesID);
                    cmd.Parameters.AddWithValue("@taxonomy_genus_id", entity.GenusID);
                    cmd.Parameters.AddWithValue("@taxonomy_family_id", entity.FamilyID);

                    if (String.IsNullOrEmpty(entity.TypeCode))
                        cmd.Parameters.AddWithValue("@type_code", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@type_code", entity.TypeCode);

                    cmd.Parameters.AddWithValue("@is_accepted_name", UnBool(entity.IsAcceptedName));

                    if (String.IsNullOrEmpty(entity.Note))
                        cmd.Parameters.AddWithValue("@note", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@note", entity.Note);

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

        public IQueryable<Citation> Search(string searchString)
        {
            throw new NotImplementedException();
        }
    }
}
