using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Configuration.Internal;
using USDA.ARS.GRIN.Admin;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class DataContext
    {
        public DataContext()
        {
        }

        public static SqlConnection GetConnection(string connectionName)
        {
            string cnstr = String.Empty;
            SqlConnection cn = null;

            try
            {
                cnstr = ConfigurationHelper.GetConnectionString(connectionName);
                if (cnstr == "NA")
                {
                    throw new Exception("Connection string has not been configured.");
                }

                cn = new SqlConnection(cnstr);
                if (cn == null)
                {
                    throw new Exception("Unable to initialize database connection");
                }
                cn.Open();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return cn;
        }

        //public static SqlDataReader ExecuteReader(String commandText, params SqlParameter[] parameters)
        //{
        //    SqlConnection conn = GetConnection(this.GetConnectionStringKey(_context));

        //    using (SqlCommand cmd = new SqlCommand(commandText, conn))
        //    {
        //        cmd.CommandType = CommandType.StoredProcedure;

        //        if (parameters != null)
        //        {
        //            cmd.Parameters.AddRange(parameters);
        //        }
        //        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        //        return reader;
        //    }
        //}

        //public static SqlDataReader ExecuteQuery(string storedProcName, Dictionary<string, SqlParameter> procParameters)
        //{
        //    using (SqlConnection cn = GetConnection(this.GetConnectionStringKey(_context)))
        //    {
                
        //        // create a SQL command to execute the stored procedure
        //        SqlCommand cmd = new SqlCommand();
        //        cmd.Connection = cn;
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = storedProcName;

        //        // assign parameters passed in to the command
        //        if (procParameters != null)
        //        {
        //            foreach (var procParameter in procParameters)
        //            {
        //                cmd.Parameters.Add(procParameter.Value);
        //            }
        //        }

        //        return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        //    }
        //}

       // public static int ExecuteCommand(
           
       //    string storedProcName,
       //    Dictionary<string, SqlParameter> procParameters
       //)
       // {
       //     int rc;

       //     using (SqlConnection cn = GetConnection(this.GetConnectionStringKey(_context)))
       //     {
       //         // create a SQL command to execute the stored procedure
       //         SqlCommand cmd = new SqlCommand();
       //         cmd.Connection = cn;
       //         cmd.CommandType = CommandType.StoredProcedure;
       //         cmd.CommandText = storedProcName;

       //         // assign parameters passed in to the command
       //         foreach (var procParameter in procParameters)
       //         {
       //             cmd.Parameters.Add(procParameter.Value);
       //         }

       //         rc = cmd.ExecuteNonQuery();
       //     }

       //     return rc;
       // }


    }
}
