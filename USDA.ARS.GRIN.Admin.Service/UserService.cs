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

        public User GetUser(int id)
        {
            return _userDAO.Get(id);
        }

        public IQueryable<User> Search(Query query)
        {
            return _userDAO.Search(query);        
        }
    }
}
