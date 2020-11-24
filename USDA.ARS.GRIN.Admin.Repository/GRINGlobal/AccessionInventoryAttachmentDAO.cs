using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.Repository
{
    public class AccessionInventoryAttachmentDAO : BaseDAO, IRepository<AccessionInventoryAttachment>
    {
        private string _context;
        public AccessionInventoryAttachmentDAO(string context)
        {
            _context = context;
        }
       
        public IQueryable<AccessionInventoryAttachment> FindAll()
        {
            throw new NotImplementedException();
        }

        public AccessionInventoryAttachment Get(int id)
        {
            const string COMMAND_TEXT = "usp_AccessionInvAttach_Select";
            AccessionInventoryAttachment accessionInventoryAttachment = new AccessionInventoryAttachment();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        cmd.Parameters.AddWithValue("@accession_inv_attach_id", id);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                accessionInventoryAttachment.ID = GetInt(reader["accession_inv_attach_id"].ToString());
                                accessionInventoryAttachment.VirtualPath = reader["virtual_path"].ToString();
                                accessionInventoryAttachment.ThumbnailVirtualPath = reader["thumbnail_virtual_path"].ToString();
                                accessionInventoryAttachment.Title = reader["title"].ToString();
                                accessionInventoryAttachment.ThumbnailImageURLIsValid = GetInt(reader["image_url_is_valid"].ToString());
                                accessionInventoryAttachment.ThumbnailImageURLIsValid = GetInt(reader["image_thumbnail_url_is_valid"].ToString());
                                accessionInventoryAttachment.ValidatedDate = GetDate(reader["validated_date"].ToString());
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return accessionInventoryAttachment;
        }

        public Dictionary<string, int> GetValidationCounts()
        {
            //validationCounts.Add("Australia", 21);
            const string COMMAND_TEXT = "usp_AccessionInvAttachValidationCounts_Select";
            Dictionary<string, int> validationCounts = new Dictionary<string, int>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                validationCounts.Add(reader["category"].ToString(), GetInt(reader["record_count"].ToString()));
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return validationCounts;
        }

        public IQueryable<AccessionInventoryAttachment> Find(int batchSize = 0, string validationStatus = "")
        {
            const string COMMAND_TEXT = "usp_AccessionInventoryAttachments_Select";
            List<AccessionInventoryAttachment> accessionInventoryAttachments = new List<AccessionInventoryAttachment>();
           
            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        cmd.Parameters.AddWithValue("@batch_size", batchSize);
                        cmd.Parameters.AddWithValue("@status_code", validationStatus);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                AccessionInventoryAttachment accessionInventoryAttachment = new AccessionInventoryAttachment();
                                accessionInventoryAttachment.ID = GetInt(reader["accession_inv_attach_id"].ToString());
                                accessionInventoryAttachment.VirtualPath = reader["virtual_path"].ToString();
                                accessionInventoryAttachment.ThumbnailVirtualPath = reader["thumbnail_virtual_path"].ToString();
                                accessionInventoryAttachment.Title = reader["title"].ToString();
                                accessionInventoryAttachment.ImageURLIsValid = GetInt(reader["image_url_is_valid"].ToString());
                                accessionInventoryAttachment.ThumbnailImageURLIsValid = GetInt(reader["image_thumbnail_url_is_valid"].ToString());
                                accessionInventoryAttachment.ValidatedDate = GetDate(reader["validated_date"].ToString());
                                accessionInventoryAttachments.Add(accessionInventoryAttachment);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return accessionInventoryAttachments.AsQueryable();

        }

        public int Remove(AccessionInventoryAttachment entity)
        {
            throw new NotImplementedException();
        }

        public int Update(AccessionInventoryAttachment entity)
        {
            throw new NotImplementedException();
        }

        public void AddValidation(int accessionInventoryAttachId, bool imageUrlIsValid, bool thumbnailImageUrlIsValid)
        {
            int retVal = 0;
            int imageVirtualPathStatusID = 2;
            int imageThumbnailVirtualPathStatusID = 2;
            const string COMMAND_TEXT = "usp_AccessionInvAttachValidation_Insert";
            ResultContainer resultContainer = new ResultContainer();

            try
            {
                if (imageUrlIsValid) 
                    imageVirtualPathStatusID = 1;

                if (thumbnailImageUrlIsValid)
                    imageThumbnailVirtualPathStatusID = 1;

                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;

                        cmd.Parameters.AddWithValue("@accession_inv_attach_id", accessionInventoryAttachId);
                        cmd.Parameters.AddWithValue("@image_url_is_valid", imageVirtualPathStatusID);
                        cmd.Parameters.AddWithValue("@image_thumbnail_url_is_valid", imageThumbnailVirtualPathStatusID);

                        //SqlParameter retParam = new SqlParameter();
                        //retParam.SqlDbType = System.Data.SqlDbType.Int;
                        //retParam.ParameterName = "@out_taxonomy_cwr_crop_id";
                        //retParam.Direction = System.Data.ParameterDirection.Output;
                        //retParam.Value = 0;
                        //cmd.Parameters.Add(retParam);

                        //SqlParameter errorParam = new SqlParameter();
                        //errorParam.SqlDbType = System.Data.SqlDbType.Int;
                        //errorParam.ParameterName = "@out_error_number";
                        //errorParam.Direction = System.Data.ParameterDirection.Output;
                        //errorParam.Value = 0;
                        //cmd.Parameters.Add(errorParam);

                        retVal = cmd.ExecuteNonQuery();

                        //string resultString = cmd.Parameters["@out_taxonomy_cwr_crop_id"].Value.ToString();
                        //if (!String.IsNullOrEmpty(resultString))
                        //{
                        //    resultContainer.EntityID = Int32.Parse(resultString);
                        //}
                        //resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();

                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            //return resultContainer;
        }

        public int AddREFACTOR(AccessionInventoryAttachment entity)
        {
            throw new NotImplementedException();
        }

        public int Add(AccessionInventoryAttachment entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<AccessionInventoryAttachment> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<AccessionInventoryAttachment> Search(int parentId)
        {
            throw new NotImplementedException();
        }

        public IQueryable<AccessionInventoryAttachment> Search(string searchString)
        {
            throw new NotImplementedException();
        }
    }
}
