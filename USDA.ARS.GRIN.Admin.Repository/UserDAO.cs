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
            _context = contextName;
        }
        
        public User Get(int id)
        {
            const string COMMAND_TEXT = "usp_User_Select";
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
                            user.CooperatorID = GetInt(reader["cooperator_id"].ToString());
                            user.WebCooperatorID = GetInt(reader["web_cooperator_id"].ToString());
                            user.FirstName = reader["first_name"].ToString();
                            user.LastName = reader["last_name"].ToString();
                            user.Email = reader["email"].ToString();
                            user.PrimaryPhone = reader["primary_phone"].ToString();
                            user.OrganizationName = reader["organization"].ToString();
                            user.OrganizationAbbreviation = reader["organization_abbrev"].ToString();
                            user.JobTitle = reader["job"].ToString();

                            user.Site.ID = GetInt(reader["site_id"].ToString());
                            user.Site.ShortName = reader["site_short_name"].ToString();
                            user.Site.LongName = reader["site_long_name"].ToString();

                            // TO DO: ALLOW FOR MULT. ADDRESSES (?)
                            Address address = new Address();
                            address.AddressLine1 = reader["address_line1"].ToString();
                            address.AddressLine2 = reader["address_line2"].ToString();
                            address.AddressLine3 = reader["address_line3"].ToString();
                            address.City = reader["city"].ToString();
                            address.State = reader["state"].ToString();
                            address.ZIP = reader["postal_index"].ToString();
                            user.Addresses.Add(address);
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

        public User Search(string userName)
        {
            const string COMMAND_TEXT = "usp_User_Search";
            string connectionType = _context;
            User user = new User();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand(COMMAND_TEXT, cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@user_name", userName);
                       
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                user.ID = GetInt(reader["sys_user_id"].ToString());
                                user.UserName = reader["user_name"].ToString();
                                user.Password = reader["password"].ToString();
                                user.CooperatorID = GetInt(reader["cooperator_id"].ToString());
                                user.WebCooperatorID = GetInt(reader["web_cooperator_id"].ToString());
                                user.FirstName = reader["first_name"].ToString();
                                user.LastName = reader["last_name"].ToString();
                                user.Email = reader["email"].ToString();
                                user.PrimaryPhone = reader["primary_phone"].ToString();
                                user.OrganizationName = reader["organization"].ToString();
                                user.OrganizationAbbreviation = reader["organization_abbrev"].ToString();
                                user.JobTitle = reader["job"].ToString();

                                user.Site.ID = GetInt(reader["site_id"].ToString());
                                user.Site.ShortName = reader["site_short_name"].ToString();
                                user.Site.LongName = reader["site_long_name"].ToString();

                                // TO DO: ALLOW FOR MULT. ADDRESSES (?)
                                Address address = new Address();
                                address.AddressLine1 = reader["address_line1"].ToString();
                                address.AddressLine2 = reader["address_line2"].ToString();
                                address.AddressLine3 = reader["address_line3"].ToString();
                                address.City = reader["city"].ToString();
                                address.State = reader["state"].ToString();
                                address.ZIP = reader["postal_index"].ToString();
                                user.Addresses.Add(address);
                            }
                        }
                        if (user.ID > 0)
                        {
                            user.Applications = GetUserApplications(user.ID);
                            user.Groups = GetUserGroups(user.ID);
                        }
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

        public int Update(User entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<SysUser> FindAll()
        {
            const string COMMAND_TEXT = "usp_Users_Select";
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

                                // TO DO: ADD RELATED COOP DATA HERE? (2/3/2021)
                                //        user.ID = GetInt(reader["sys_user_id"].ToString());
                                //        user.UserName = reader["user_name"].ToString();
                                //        //user.Password = reader["password"].ToString();
                                //        //user.CooperatorID = GetInt(reader["cooperator_id"].ToString());
                                //        user.FirstName = reader["first_name"].ToString();
                                //        user.LastName = reader["last_name"].ToString();
                                //        //user.Email = reader["email"].ToString();
                                //        //user.OrganizationName = reader["organization"].ToString();
                                //        //user.OrganizationAbbreviation = reader["organization_abbrev"].ToString();

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
            const string COMMAND_TEXT = "usp_UserApplications_Select";
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
            const string COMMAND_TEXT = "usp_SysUserGroups_Select";
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
            throw new NotImplementedException();
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
