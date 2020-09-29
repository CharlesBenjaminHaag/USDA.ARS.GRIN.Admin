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
    public class UserRepository 
    {
        protected DataContext _dataContext = null;

        public User Find(string userId)
        {
            User user = new User();

            try
            {
                SqlParameter param = new SqlParameter("@user_name", SqlDbType.NVarChar);
                param.Value = userId;

                SqlDataReader reader = DataContext.ExecuteReader("usp_GetUser ", param);

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        user.UserName = reader.GetString(0);
                        user.Password = reader.GetString(1);
                        user.CooperatorID = reader.GetInt32(2);
                        user.FirstName = reader.GetString(3);
                        user.LastName = reader.GetString(4);
                        user.Email = reader.GetString(5);
                        user.OrganizationName = reader.GetString(6);
                        user.JobTitle = reader.GetString(7);
                    }
                }
                reader.Close();
            }
            catch (Exception e)
            { }
            return user;
        }
    }
}
