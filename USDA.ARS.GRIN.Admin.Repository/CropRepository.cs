using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class CropRepository : IRepository<DEPRECATEDCrop>
    {
        protected DataContext _dataContext = null;

        public CropRepository()
        {
            this._dataContext = new DataContext();
        }

        public int Add(DEPRECATEDCrop entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<DEPRECATEDCrop> FindCrops(string searchExpression)
        {
            return null;
        }

        public IQueryable<DEPRECATEDCrop> FindAll()
        {
            String commandText = "usp_GetCrops";
            List<DEPRECATEDCrop> cropList = new List<DEPRECATEDCrop>();

            try
            {
                using (SqlConnection conn = DataContext.GetConnection("DataManager"))
                {
                    using (SqlCommand cmd = new SqlCommand(commandText, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                DEPRECATEDCrop crop = new DEPRECATEDCrop();
                                crop.ID = Int32.Parse(reader["taxonomy_crop_id"].ToString());
                                crop.Name = reader["crop_name"].ToString();
                                crop.Note = reader["note"].ToString();
                                crop.ModifiedDate = DateTime.Parse(reader["modified_date"].ToString());
                                cropList.Add(crop);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return cropList.AsQueryable();
        }

        public DEPRECATEDCrop GetCropMap(int ID)
        {
            throw new NotImplementedException();
        }

        public int Remove(DEPRECATEDCrop entity)
        {
            throw new NotImplementedException();
        }

        public int Update(DEPRECATEDCrop entity)
        {
            throw new NotImplementedException();
        }
    }
}
