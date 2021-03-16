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
                String commandText = "usp_Citation_Select";

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
                                citation.Title = reader["citation_title"].ToString();
                                citation.AuthorName = reader["author_name"].ToString();
                                citation.CitationYear = reader["citation_year"].ToString();
                                citation.Reference = reader["reference"].ToString();
                                citation.DOIReference = reader["doi_reference"].ToString();
                                citation.URL = reader["url"].ToString();
                                citation.Title = reader["title"].ToString();
                                citation.Description = reader["description"].ToString();
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
            throw new NotImplementedException();
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
