using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;
using USDA.ARS.GRIN.Admin.Repository;
using USDA.ARS.GRIN.Admin.Models;
using Microsoft.Win32;

namespace USDA.ARS.GRIN.Admin.Service
{
    public class UserService
    {
        protected UserDAO _userDAO = null;

        public UserService(string context)
        {
           _userDAO = new UserDAO(context);
        }

        public DataTable Find(Query searchObject, string sql)
        {
            return _userDAO.Find(searchObject, sql);
        }

        public IQueryable<User> GetActiveUsers()
        {
            return _userDAO.FindAll();
        }

        public User GetUser(string userName)
        {
            User user = new User();
            user = _userDAO.Search(userName);
            user.Applications = _userDAO.GetUserApplications(user.ID);
            user.Groups = _userDAO.GetUserGroups(user.ID);
            return user;
        }

        public User GetUser(int id)
        {
            return _userDAO.Get(id);
        }
    }
}
