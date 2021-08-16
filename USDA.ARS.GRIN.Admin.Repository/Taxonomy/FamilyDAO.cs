﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using System.Runtime.InteropServices;

namespace USDA.ARS.GRIN.Admin.Repository.Taxonomy
{
    public class FamilyDAO : BaseDAO, IRepository<Family>
    {
        public FamilyDAO(string context)
        {
            base._context = context;
        }
        public IQueryable<Family> Search(Query query)
        {
            string sqlWhereClause = String.Empty;
            IQueryable<Family> familyList = new List<Family>().AsQueryable();

            try
            {
                sqlWhereClause = query.GetSQLSyntax();
                familyList = Search(sqlWhereClause);
                return familyList;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }
        public IQueryable<Family> Search(string searchString)
        {
            const string COMMAND_TEXT_NAME = "usp_TaxonomyFamily_Search";
            List<Family> families = new List<Family>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT_NAME;
                    cmd.Parameters.AddWithValue("@sql_where_clause", searchString);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Family family = new Family();
                        family.ID = GetInt(reader["taxonomy_family_id"].ToString());
                        family.Name = reader["family_name"].ToString();
                        family.Authority = reader["family_authority"].ToString();
                        family.Note = reader["note"].ToString();
                        family.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        family.CreatedByCooperatorName = reader["created_by_name"].ToString();
                        family.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        family.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                        families.Add(family);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return families.AsQueryable();
        }
        public Family Get(int id)
        {
            const string COMMAND_TEXT_NAME = "usp_TaxonomyFamily_Select";
            Family family = new Family();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT_NAME;
                    cmd.Parameters.AddWithValue("@taxonomy_family_id", id);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        family.ID = GetInt(reader["taxonomy_family_id"].ToString());
                        family.ParentID = GetInt(reader["current_taxonomy_family_id"].ToString());
                        family.SuprafamilyRankCode = reader["suprafamily_rank_code"].ToString();
                        family.SuprafamilyRankName = reader["suprafamily_rank_name"].ToString();
                        family.Name = reader["family_name"].ToString();
                        family.Authority = reader["family_authority"].ToString();
                        family.AlternateName = reader["alternate_name"].ToString();
                        family.SubFamilyName = reader["subfamily_name"].ToString();
                        family.TribeName = reader["tribe_name"].ToString();
                        family.SubTribeName = reader["subtribe_name"].ToString();
                        family.Note = reader["note"].ToString();
                        family.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                        family.CreatedByCooperatorName = reader["created_by_name"].ToString();
                        family.CreatedDate = GetDate(reader["created_date"].ToString());
                        family.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                        family.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                        family.ModifiedDate = GetDate(reader["modified_date"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return family;
        }

        public IQueryable<Family> Find(Query query = null)
        {
            const string COMMAND_TEXT = "usp_TaxonomyFamilies_Search";
            StringBuilder sqlWhereClause = new StringBuilder();
            List<Family> familyList = new List<Family>();

            try
            {
                if (query != null)
                {
                    foreach (var searchCriterion in query.QueryCriteria)
                    {
                        searchCriterion.SearchSyntax = GetSearchSyntax(searchCriterion.SearchOperatorCode, searchCriterion.FieldValue);
                        if (sqlWhereClause.Length == 0)
                        {
                            sqlWhereClause.Append(" WHERE ");
                        }
                        else
                        {
                            if (sqlWhereClause.Length > 0)
                            {
                                sqlWhereClause.Append(" OR ");
                            }
                        }

                        searchCriterion.FieldName = GetDatabaseFieldName(searchCriterion.FieldName);
                        sqlWhereClause.Append(searchCriterion.FieldName);
                        sqlWhereClause.Append(" ");
                        sqlWhereClause.Append(searchCriterion.SearchSyntax);
                    }
                }

                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        if (sqlWhereClause.Length > 0)
                        { 
                            cmd.Parameters.AddWithValue("@sql_where_clause", sqlWhereClause);
                        }     
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Family family = new Family();
                                family.ID = GetInt(reader["taxonomy_family_id"].ToString());
                                family.Name = reader["family_name"].ToString();
                                //family.Genii = _genusDAO.Find(family.ID);
                                familyList.Add(family);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return familyList.AsQueryable();
        }

        public IQueryable<Family> FindAll()
        {
            throw new NotImplementedException();
        }

      

        public IQueryable<Family> Search(int parentId)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Family>.Add(Family entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Family>.Remove(Family entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<Family>.Update(Family entity)
        {
            throw new NotImplementedException();
        }
    }
}
