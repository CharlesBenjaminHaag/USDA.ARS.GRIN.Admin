using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using USDA.ARS.GRIN.Admin.Models;
using System.Runtime.Caching;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class BaseDAO
    {
        protected string _context;
        private static string _key = "foo";
        private static readonly MemoryCache _cache = MemoryCache.Default;

        public static string InsertCommmand;
        public static string UpdateCommmand;
        public static string DeleteCommmand;
        public static string SelectCommmand;
        public static string SelectAllCommmand;

        protected string GetConnectionStringKey(string context)
        {
            switch (context)
            {
                case "LOCAL":
                    return "DataManagerLocal";
                case "PRODCOPY":
                    return "DataManagerProdCopy";
                case "DEVELOPMENT":
                    return "DataManagerDev";
                case "TEST":
                    return "DataManagerTest";
                case "TRAINING":
                    return "DataManagerTraining";
                case "PRODUCTION":
                    return "DataManagerProd";
                default:
                    return "";
            }
        }

        public SqlConnection GetConnection(string connectionName)
        {
            string cnstr = ConfigurationManager.ConnectionStrings[this.GetConnectionStringKey(connectionName)].ConnectionString;
            if (String.IsNullOrEmpty(cnstr))
            {
                throw new Exception("Connection string has not been configured.");
            }

            SqlConnection cn = new SqlConnection(cnstr);
            if (cn == null)
            {
                throw new Exception("Unable to initialize database connection");
            }

            cn.Open();
            return cn;
        }

        public DataTable Find(Query searchObject, string sql)
        {
            const string COMMAND_TEXT = "usp_GetSearchResults";

            StringBuilder sqlWhereClause = new StringBuilder();
            DataTable searchResults = new DataTable();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adapter = null;
            SqlConnection conn = null;

            try
            {
                using (conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                    // Construct dynamic WHERE clause, based on search criteria.
                    if (searchObject != null)
                    {
                        foreach (var searchCriterion in searchObject.QueryCriteria)
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
                        sql = sql + sqlWhereClause.ToString();
                    }
                    cmd.Parameters.AddWithValue("@sql_statement", sql);
                    adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(searchResults);
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
                adapter.Dispose();
            }
            return searchResults;
        }

        //public DataTable Find(string sql)
        //{
        //    const string COMMAND_TEXT = "usp_Search";
        //    DataTable results = new DataTable();
        //    SqlCommand cmd = new SqlCommand();
        //    SqlDataAdapter adapter = null;
        //    SqlConnection conn = null;

        //    using (conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
        //    {
        //        cmd.Connection = conn;
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = COMMAND_TEXT;
        //        cmd.Parameters.AddWithValue("@sql_statement", sql);
        //        adapter = new SqlDataAdapter(cmd);
        //        adapter.Fill(results);
        //    }
        //    return results;
        //}

        protected string GetSearchSyntax(string searchOperatorCode, string searchCriterion)
        {
            string searchSyntax = String.Empty;
            IEnumerable<SearchOperator> searchOperators = null;
            searchOperators = this.GetAllSearchOperators().AsEnumerable();

            searchSyntax = searchOperators.Where(x => x.Code == searchOperatorCode).First().SearchOperatorSyntax.Replace(":search_criterion", searchCriterion);
            return searchSyntax;
        }

        protected string GetWhereClause(Query searchObject)
        {
            StringBuilder sqlWhereClause = new StringBuilder();

            foreach (var searchCriterion in searchObject.QueryCriteria)
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
            return sqlWhereClause.ToString();
        }

        public string UnBool(bool boolValue)
        {
            if (boolValue)
                return "Y";
            else
                return "N";
        }

        public int ConvertBool(bool boolValue)
        {
            if (boolValue)
                return 1;
            else
                return 0;
        }

        protected int GetInt(string intValue)
        {
            int convertedInt = 0;

            if (Int32.TryParse(intValue, out convertedInt))
            {
                return convertedInt;
            }
            else
            {
                return -9;
            }
        }

        protected DateTime GetDate(string dateTime)
        {
            DateTime convertedDateTime;

            if (DateTime.TryParse(dateTime, out convertedDateTime))
            {
                return convertedDateTime;
            }
            else
                return DateTime.MinValue;
        }

        public bool ParseBool(string boolValue)
        {
             
            bool boolResult = false;

            if ((boolValue.ToUpper() == "Y") || (boolValue == "1") || (boolValue.ToUpper() == "TRUE"))
            {
                boolResult = true;
            }
            return boolResult;
        }

        public DateTime ParseDate(string dateTime)
        {
            DateTime dateTimeResult;

            if (String.IsNullOrEmpty(dateTime))
            {
                return DateTime.MinValue;
            }
            else
            {
                if (DateTime.TryParse(dateTime, out dateTimeResult))
                {
                    return dateTimeResult;
                }
                else
                {
                    return DateTime.MinValue;
                }
            }
        }

       

        public IEnumerable<SearchOperator> GetAllSearchOperators()
        {
            const string COMMAND_TEXT = "usp_SearchOperators_Select";
            List<SearchOperator> searchOperators = new List<SearchOperator>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        searchOperators.Add(new SearchOperator { Code = reader["code"].ToString(), Title = reader["title"].ToString(), SearchOperatorSyntax = reader["syntax"].ToString() });
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return searchOperators.AsQueryable();
        }

        public string GetDatabaseFieldName(string fieldName)
        {
            string databaseFieldName = String.Empty;
            const string COMMAND_TEXT = "usp_TableFieldName_Select";

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;
                    cmd.Parameters.AddWithValue("@title", fieldName);

                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        databaseFieldName = reader["field_name"].ToString();
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            return databaseFieldName;

        }
    }
}
