using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models.Taxonomy;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.Repository.Taxonomy
{
    public class GenusDAO : BaseDAO, IRepository<Genus>
    {
        private string _context;
        public GenusDAO(string context)
        {
            _context = context;
        }

        public IQueryable<Genus> Find(string searchExpression)
        {
            const string COMMAND_TEXT = "usp_TaxonomyGenii_Search";
            List<Genus> genusList = new List<Genus>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = COMMAND_TEXT;
                    cmd.Parameters.AddWithValue("search_string", searchExpression);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        genusList.Add(new Genus { ID = GetInt(reader["taxonomy_genus_id"].ToString()), Name = reader["genus_name"].ToString() });
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return genusList.AsQueryable();
        }


        public IQueryable<Genus> Find(int familyId)
        {
            const string COMMAND_TEXT = "usp_TaxonomyGenii_Select";
            List<Genus> genii = new List<Genus>();
            
            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(this._context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        cmd.Parameters.AddWithValue("@taxonomy_family_id", familyId);
                        
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Genus genus = new Genus();
                                genus.Name = reader["genus_name"].ToString();
                                genii.Add(genus);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return genii.AsQueryable();

        }

        public int AddREFACTOR(Genus entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Genus> FindAll()
        {
            throw new NotImplementedException();
        }

        public int Remove(Genus entity)
        {
            throw new NotImplementedException();
        }

        public int Update(Genus entity)
        {
            throw new NotImplementedException();
        }

        public int Add(Genus entity)
        {
            throw new NotImplementedException();
        }

        public Genus Get(int id)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Genus> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Genus> Search(int parentId)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Genus> Search(string searchString)
        {
            throw new NotImplementedException();
        }
    }
}
