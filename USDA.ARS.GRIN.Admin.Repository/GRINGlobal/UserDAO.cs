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
    public class UserDAO : BaseDAO, IRepository<User>
    {
        private string _context;
        public UserDAO(string contextName)
        {
            //InsertCommmand = "usp_AcctMgmtSysUser_Insert";
            //UpdateCommmand = "usp_AcctMgmtSysUser_Update";
            //DeleteCommmand = "usp_AcctMgmtSysUser_Delete";
            //SelectCommmand = "usp_AcctMgmtSysUser_Select";
            
            _context = contextName;
        }
        
        public User Get(int id)
        {
            const string COMMAND_TEXT = "usp_AcctMgmtSysUser_Select";
            User user = new User();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;

                    cmd.Parameters.AddWithValue("@sys_user_id", id);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            user.ID = GetInt(reader["sys_user_id"].ToString());
                            user.UserName = reader["user_name"].ToString();
                            user.Password = reader["password"].ToString();
                            //is_enabled
                            user.CreatedDate = GetDate(reader["created_date"].ToString());
                            //created_by
                            user.ModifiedDate = GetDate(reader["modified_date"].ToString());
                            //modified_by
                            user.WebUserID = GetInt(reader["web_user_id"].ToString());
                            user.WebUserName = reader["web_user_name"].ToString();
                            user.CooperatorID = GetInt(reader["cooperator_id"].ToString());
                            user.Cooperator.ID = user.CooperatorID;
                            user.Cooperator.WebCooperator.ID = GetInt(reader["web_cooperator_id"].ToString());
                            user.Cooperator.FirstName = reader["first_name"].ToString();
                            user.Cooperator.LastName = reader["last_name"].ToString();
                            user.Cooperator.EmailAddress = reader["email"].ToString();
                            user.Cooperator.Organization = reader["organization"].ToString();
                            //org abbrev
                            //org region code
                            user.Cooperator.Job = reader["job"].ToString();
                            user.Cooperator.Address.AddressLine1 = reader["address_line1"].ToString();
                            user.Cooperator.Address.AddressLine2 = reader["address_line2"].ToString();
                            user.Cooperator.Address.AddressLine3 = reader["address_line3"].ToString();
                            user.Cooperator.Address.City = reader["city"].ToString();
                            // geo id
                            user.Cooperator.Address.State = reader["state"].ToString();
                            user.Cooperator.Address.ZIP = reader["postal_index"].ToString();

                            if (user.ID > 0)
                            {
                                user.Applications = GetUserApplications(user.ID);
                                user.Groups = GetUserGroups(user.ID);
                            }
                        }
                    }
                    if (user.ID > 0)
                    {
                        user.Applications = GetUserApplications(user.ID);
                        user.Groups = GetUserGroups(user.ID);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return user;
        }

        public int AddREFACTOR(User entity)
        {
            throw new NotImplementedException();
        }

        public int Remove(User entity)
        {
            throw new NotImplementedException();
        }

        public ResultContainer Update(User entity)
        {
            const string COMMAND_TEXT = "usp_AcctMgmtSysUser_Update";
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

                        cmd.Parameters.AddWithValue("@sys_user_id", entity.ID);
                        cmd.Parameters.AddWithValue("@user_name", entity.UserName);
                        cmd.Parameters.AddWithValue("@password", entity.Password);

                        SqlParameter errorParam = new SqlParameter();
                        errorParam.SqlDbType = System.Data.SqlDbType.Int;
                        errorParam.ParameterName = "@out_error_number";
                        errorParam.Direction = System.Data.ParameterDirection.Output;
                        errorParam.Value = 0;
                        cmd.Parameters.Add(errorParam);
                        cmd.ExecuteNonQuery();

                        resultContainer.EntityID = entity.ID;
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }

        public IQueryable<SysUser> FindAll()
        {
            const string COMMAND_TEXT = "usp_AcctMgmtSysUsers_Select";
            List<SysUser> sysUsers = new List<SysUser>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                SysUser sysUser = new SysUser();
                                sysUser.ID = GetInt(reader["sys_user_id"].ToString());
                                sysUser.UserName = reader["user_name"].ToString();
                                sysUser.Password = reader["password"].ToString();
                                sysUsers.Add(sysUser);
                            }
                        }
                    }
                }                                   
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return sysUsers.AsQueryable();
        }

        public List<Application> GetUserApplications(int userId)
        {
            const string COMMAND_TEXT = "usp_AcctMgmtUserApplications_Select";
            List<Application> applications = new List<Application>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;
                    cmd.Parameters.AddWithValue("@sys_user_id", userId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                Application application = new Application();
                                application.ID = GetInt(reader["sys_application_id"].ToString());
                                application.GroupID = GetInt(reader["sys_group_id"].ToString());
                                application.ApplicationCode = reader["code"].ToString();
                                application.Title = reader["title"].ToString();
                                application.Description = reader["description"].ToString();
                                application.URL = reader["url"].ToString();
                                application.ColorCode = reader["color_code"].ToString();
                                application.ImageFileName = reader["image_file_name"].ToString();
                                application.IsAuthorized = ParseBool(reader["is_authorized"].ToString());
                                applications.Add(application);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return applications;
        }

        public List<Group> GetUserGroups(int userId)
        {
            const string COMMAND_TEXT = "usp_AcctMgmtSysUserGroups_Select";
            List<Group> userGroups = new List<Group>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@sys_user_id", userId);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Group userGroup = new Group();
                                userGroup.ID = Int32.Parse(reader["sys_group_id"].ToString());
                                userGroup.GroupTag = reader["group_tag"].ToString();
                                userGroups.Add(userGroup);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return userGroups;
        }

        public int Add(User entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<User> Search(Query query)
        {
            String commandText = "usp_AcctMgmtSysUsers_Search";
            List<User> users = new List<User>();
            string sqlWhereClause = string.Empty;

            try
            {
                sqlWhereClause = query.GetSQLSyntax();

                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@sql_where_clause", sqlWhereClause);
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                User user = new User();
                                user.ID = GetInt(reader["sys_user_id"].ToString());
                                user.UserName = reader["user_name"].ToString();
                                user.Password = reader["password"].ToString();
                                //is_enabled
                                user.CreatedDate = GetDate(reader["created_date"].ToString());
                                //created_by
                                user.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                //modified_by
                                user.WebUserID = GetInt(reader["web_user_id"].ToString());
                                user.WebUserName = reader["web_user_name"].ToString();
                                user.CooperatorID = GetInt(reader["cooperator_id"].ToString());
                                user.Cooperator.ID = user.CooperatorID;
                                user.Cooperator.FirstName = reader["first_name"].ToString();
                                user.Cooperator.LastName = reader["last_name"].ToString();
                                user.Cooperator.EmailAddress = reader["email"].ToString();
                                user.Cooperator.Organization = reader["organization"].ToString();
                                user.Cooperator.WebCooperator.ID = GetInt(reader["web_cooperator_id"].ToString());
                                user.Cooperator.WebCooperator.FirstName = reader["web_cooperator_first_name"].ToString();
                                user.Cooperator.WebCooperator.LastName = reader["web_cooperator_last_name"].ToString();
                                user.Cooperator.Job = reader["job"].ToString();
                                user.Cooperator.Address.AddressLine1 = reader["address_line1"].ToString();
                                user.Cooperator.Address.AddressLine2 = reader["address_line2"].ToString();
                                user.Cooperator.Address.AddressLine3 = reader["address_line3"].ToString();
                                user.Cooperator.Address.City = reader["city"].ToString();
                                // geo id
                                user.Cooperator.Address.State = reader["state"].ToString();
                                user.Cooperator.Address.ZIP = reader["postal_index"].ToString();
                             
                                if (user.ID > 0)
                                {
                                    user.Applications = GetUserApplications(user.ID);
                                    user.Groups = GetUserGroups(user.ID);
                                }
                                users.Add(user);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return users.AsQueryable();
        }

        public IQueryable<User> Search(int parentId)
        {
            throw new NotImplementedException();
        }

        IQueryable<User> IRepository<User>.Search(string searchString)
        {
            throw new NotImplementedException();
        }

        IQueryable<User> IRepository<User>.FindAll()
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<User>.Add(User entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<User>.Remove(User entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<User>.Update(User entity)
        {
            throw new NotImplementedException();
        }
    }
}
