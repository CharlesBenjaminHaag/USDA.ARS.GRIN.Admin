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
                                citation.Description = reader["description"].ToString();
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

        public IQueryable<Citation> Search(string searchString)
        {
            List<Citation> citations = new List<Citation>();

            try
            {
                String commandText = "usp_TaxonomyCitation_Search";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@search_string", searchString);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Citation citation = new Citation();
                                citation.ID = Int32.Parse(reader["citation_id"].ToString());
                                citation.Title = reader["citation_text"].ToString();
                                citation.LiteratureReferenceTitle = reader["reference_title"].ToString();
                                citation.LiteratureAbbreviation = reader["abbreviation"].ToString();
                                citation.AuthorName = reader["editor_author_name"].ToString();
                                citation.CitationYear = reader["publication_year"].ToString();
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
            ResultContainer resultContainer = new ResultContainer();

            try 
            { 
            
            }
            catch (SqlException ex)
            { 
            
            }
            return resultContainer;
        }
    }
}
