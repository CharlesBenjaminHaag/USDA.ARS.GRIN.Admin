using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models;


namespace USDA.ARS.GRIN.Admin.Repository
{
    public class ApplicationDAO : BaseDAO, IRepository<Application>
    {
        private string _context;
        public ApplicationDAO()
        { }

        public ApplicationDAO(string contextName)
        {
            _context = contextName;
        }

        public ResultContainer Add(Application entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Application> FindAll()
        {
            throw new NotImplementedException();
        }

        public Application Get(int id)
        {
            throw new NotImplementedException();
        }

        public Application Get(string context)
        {
            const string COMMAND_TEXT = "usp_SysApplicationByURL_Select";
            Application application = new Application();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                    cmd.Parameters.AddWithValue("@url", context);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            application.ID = GetInt(reader["sys_application_id"].ToString());
                            application.GroupID = GetInt(reader["sys_group_id"].ToString());
                            application.ApplicationCode = reader["code"].ToString();
                            application.Title = reader["title"].ToString();
                            application.Description = reader["description"].ToString();
                            application.URL = reader["url"].ToString();
                            application.ColorCode = reader["color_code"].ToString();
                            application.ImageFileName = reader["image_file_name"].ToString();
                        }
                    }
                    if (application.ID > 0)
                    {
                        application.Cooperators = GetCooperators(application.GroupID); 
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return application;
        }

        public List<Cooperator> GetCooperators(int id)
        {
            const string COMMAND_TEXT = "usp_SysApplicationCooperators_Select";
            List<Cooperator> cooperators = new List<Cooperator>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                    cmd.Parameters.AddWithValue("@sys_group_id", id);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            cooperators.Add(new Cooperator { ID = GetInt(reader["cooperator_id"].ToString()), LastName = reader["last_name"].ToString(), FirstName = reader["first_name"].ToString(), FullName = reader["full_name"].ToString() });     
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cooperators;
        }

        public ResultContainer Remove(Application entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Application> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Application> Search(string searchString)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Update(Application entity)
        {
            throw new NotImplementedException();
        }
    }
}
