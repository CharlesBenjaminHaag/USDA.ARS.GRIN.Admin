﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using System.Runtime.Caching;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class ReferenceDAO : BaseDAO
    {
        protected DataContext _dataContext = null;

        public ReferenceDAO(string context)
        {
            _context = context;
        }

        public List<ReferenceItem> GenePoolCodes()
        {
            List<ReferenceItem> genepoolCodes = new List<ReferenceItem>();
            return genepoolCodes;
        }

        public IEnumerable<Author> FindAuthors(string searchString)
        {
            List<Author> authors = new List<Author>();

            try 
            {
                String commandText = "usp_SearchAuthors";

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
                                Author author = new Author();
                                author.ID = Int32.Parse(reader["taxonomy_author_id"].ToString());
                                author.ShortName = reader["short_name"].ToString();
                                author.FullName = reader["full_name"].ToString();
                                author.ShortNameExpandedDiacritic = reader["short_name_expanded_diacritic"].ToString();
                                author.FullNameExpandedDiacritic = reader["full_name_expanded_diacritic"].ToString();
                                author.Note = reader["note"].ToString();
                                //author.CreatedDate = DateTime.Parse(reader["created_date"].ToString());
                                //author.CreatedByCooperatorID = Int32.Parse(reader["created_by"].ToString());
                                //author.ModifiedDate = DateTime.Parse(reader["modified_date"].ToString());
                                //author.ModifiedByCooperatorID = Int32.Parse(reader["modified_by"].ToString());
                                //author.OwnedDate = DateTime.Parse(reader["owned_date"].ToString());
                                //author.OwnedByCooperatorID = Int32.Parse(reader["owned_by"].ToString());
                                authors.Add(author);   
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return authors.AsEnumerable();
        }

        public List<Protologue> FindProtologues(string searchString)
        {
            List<Protologue> protologues = new List<Protologue>();

            try
            {
                String commandText = "usp_SearchProtologues";
         
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
                                protologues.Add(new Protologue { ID = Int32.Parse(reader["protologue_id"].ToString()), Text = reader["protologue"].ToString() });
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return protologues;
        }

        public IEnumerable<Note> NoteSearch(string tableName, string searchText)
        {
            List<Note> notes = new List<Note>();

            try 
            {
                const string COMMAND_TEXT = "usp_TaxonomyNote_Search";
                StringBuilder sbSqlStatement = new StringBuilder();

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@sys_table_name", tableName);
                        cmd.Parameters.AddWithValue("@search_string", searchText);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                notes.Add(new Note { NoteText = reader["note_text"].ToString() });
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return notes.AsEnumerable();
        }

        public IEnumerable<Authority> AuthoritySearch(string tableName, string searchText)
        {
            List<Authority> authors = new List<Authority>();

            try
            {
                const string COMMAND_TEXT = "usp_TaxonomyAuthority_Search";
                StringBuilder sbSqlStatement = new StringBuilder();

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@sys_table_name", tableName);
                        cmd.Parameters.AddWithValue("@search_text", searchText);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                authors.Add(new Authority { TableName = reader["table_name"].ToString(), ColumnName = reader["column_name"].ToString(), AuthorityText = reader["authority_text"].ToString() });
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return authors.AsEnumerable();
        }

        public IEnumerable<Protologue> ProtologueSearch(string searchText)
        {
            const string COMMAND_TEXT = "usp_TaxonomySpeciesProtologue_Search";
            List<Protologue> protologues = new List<Protologue>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@search_text", searchText);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                protologues.Add(new Protologue { Text = reader["protologue"].ToString(), URL = reader["protologue_virtual_path"].ToString() });
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return protologues.AsEnumerable();
        }

        public IEnumerable<Citation> CitationSearch(string searchText)
        {
            const string COMMAND_TEXT = "usp_TaxonomyCitation_Search";
            List<Citation> citations = new List<Citation>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@search_string", searchText);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Citation citation = new Citation();
                                citation.ID = Int32.Parse(reader["citation_id"].ToString());
                                citation.CitationText = reader["citation_text"].ToString();
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
            return citations;
        }

        public List<Citation> GetCitations(int speciesId)
        {
            List<Citation> citations = new List<Citation>();

            try
            {
                String commandText = "usp_TaxonomyCitationsBySpecies_Select";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", speciesId);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Citation citation = new Citation();
                                citation.ID = Int32.Parse(reader["citation_id"].ToString());
                                citation.Title = reader["citation_text"].ToString();
                                //citation.CitationLiterature = new Literature { ID = GetInt(reader["literature_id"].ToString()), ReferenceTitle = reader["reference_title"].ToString() };
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
            return citations;
        }
        public IEnumerable<ReferenceItem> FindReferenceItems(string searchString)
        {
            List<ReferenceItem> referenceItems = new List<ReferenceItem>();

            try
            {
                String commandText = "usp_GetTaxonomyLookupData";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return referenceItems.AsEnumerable();
        }
        public IEnumerable<Protologue> FindAllProtologues()
        {
            string CacheKey = "PROTOLOGUES";
            List<Protologue> protologues = new List<Protologue>();

            ObjectCache cache = MemoryCache.Default;

            if (cache.Contains(CacheKey))
                protologues = (List<Protologue>)cache.Get(CacheKey);
            else
            {
                protologues = GetProtologues();

                CacheItemPolicy cacheItemPolicy = new CacheItemPolicy();
                cacheItemPolicy.AbsoluteExpiration = DateTime.Now.AddHours(1.0);
                cache.Add(CacheKey, protologues, cacheItemPolicy);
            }

            return protologues;
        }

        public IEnumerable<CommonName> GetCommonNames(int speciesId)
        {
            List<CommonName> commonNames = new List<CommonName>();

            try
            {
                String commandText = "usp_TaxonomyCommonNames_Select";

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@taxonomy_species_id", speciesId);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                CommonName commonName = new CommonName();
                                commonName.ID = GetInt(reader["taxonomy_common_name_id"].ToString());
                                commonName.SpeciesID = GetInt(reader["taxonomy_species_id"].ToString());
                                commonName.LanguageDescription = reader["language_description"].ToString();
                                commonName.Name = reader["name"].ToString();
                                commonName.SimplifiedName = reader["simplified_name"].ToString();
                                commonName.AlternateTranscription = reader["alternate_transcription"].ToString();
                                commonNames.Add(commonName);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return commonNames;
        }

        private List<Protologue> GetProtologues()
        {
            String commandText = "usp_GetProtologues";
            List<Protologue> protologues = new List<Protologue>();

            using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
            {
                using (SqlCommand cmd = new SqlCommand(commandText, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            protologues.Add(new Protologue { Text = reader["protologue"].ToString() });
                        }
                    }
                }
            }
            return protologues;
        }

        public ResultContainer GetAuthorMatch(string authorities)
        {
            const string COMMAND_TEXT = "usp_TaxonomyAuthorName_Select";
            ResultContainer resultContainer = new ResultContainer();

            using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
            {
                using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@short_name", authorities);
                    SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            resultContainer.RecordsAffected = reader.GetFieldValue<int>("author_match_count");
                        }
                    }
                }
            }
            return resultContainer;

        }
    }
}
