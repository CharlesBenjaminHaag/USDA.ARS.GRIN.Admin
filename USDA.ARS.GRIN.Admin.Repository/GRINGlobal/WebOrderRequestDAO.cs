using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;

namespace USDA.ARS.GRIN.Admin.Repository.GRINGlobal
{
    public class WebOrderRequestDAO : BaseDAO, IRepository<WebOrderRequest>
    {
        public WebOrderRequestDAO(string context)
        {
            _context = context;
        }

        public int Add(WebOrderRequest entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<WebOrderRequest> FindAll()
        {
            throw new NotImplementedException();
        }

        public WebOrderRequest Get(int id)
        {
            const string COMMAND_TEXT = "usp_WebOrderRequest_Select";
            WebOrderRequest webOrderRequest = new WebOrderRequest();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        cmd.Parameters.AddWithValue("@web_order_request_id", id);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                webOrderRequest = new WebOrderRequest();
                                webOrderRequest.ID = GetInt(reader["web_order_request_id"].ToString());
                                webOrderRequest.WebCooperator.ID = GetInt(reader["web_cooperator_id"].ToString());
                                webOrderRequest.WebCooperator.LastName = reader["last_name"].ToString();
                                webOrderRequest.WebCooperator.FirstName = reader["first_name"].ToString();
                                webOrderRequest.WebCooperator.EmailAddress = reader["email"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.PersonFullName = reader["full_name"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.OrganizationName = reader["organization"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.AddressLine1 = reader["address_line1"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.AddressLine2 = reader["address_line2"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.AddressLine3 = reader["address_line3"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.City = reader["city"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.State = "STATE";
                                webOrderRequest.WebCooperator.PrimaryAddress.ZIP = reader["postal_index"].ToString();
                                webOrderRequest.OrderDate = GetDate(reader["ordered_date"].ToString());
                                webOrderRequest.IntendedUseCode = reader["intended_use_code"].ToString();
                                webOrderRequest.IntendedUseNote = reader["intended_use_note"].ToString();
                                webOrderRequest.Note = reader["note"].ToString();
                                webOrderRequest.SpecialInstruction = reader["special_instruction"].ToString();
                                webOrderRequest.WebOrderRequestItems = SearchItems(webOrderRequest.ID);
                                
                            }
                        }
                    }
                }

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return webOrderRequest;
        }

        public int Remove(WebOrderRequest entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<WebOrderRequest> Search(Query query)
        {
            const string COMMAND_TEXT = "usp_WebOrderRequests_Select";
            string sqlWhereClause = String.Empty;
            List<WebOrderRequest> webOrderRequests = new List<WebOrderRequest>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        //cmd.Parameters.AddWithValue("@sql_where_clause", sqlWhereClause);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                // TO DO
                            }                            }
                        }
                    }
                
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return webOrderRequests.AsQueryable();
        }

        public IQueryable<WebOrderRequest> Search(string statusCode)
        {
            const string COMMAND_TEXT = "usp_WebOrderRequestsByStatus_Select";
            List<WebOrderRequest> webOrderRequests = new List<WebOrderRequest>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        cmd.Parameters.AddWithValue("@status_code", statusCode);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                WebOrderRequest webOrderRequest = new WebOrderRequest();
                                webOrderRequest.ID = GetInt(reader["web_order_request_id"].ToString());
                                webOrderRequest.WebCooperator.ID = GetInt(reader["web_cooperator_id"].ToString());
                                webOrderRequest.WebCooperator.LastName = reader["last_name"].ToString();
                                webOrderRequest.WebCooperator.FirstName = reader["first_name"].ToString();
                                webOrderRequest.WebCooperator.EmailAddress = reader["email"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.PersonFullName = reader["full_name"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.OrganizationName = reader["organization"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.AddressLine1 = reader["address_line1"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.AddressLine2 = reader["address_line2"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.AddressLine3 = reader["address_line3"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.City = reader["city"].ToString();
                                webOrderRequest.WebCooperator.PrimaryAddress.State = "STATE";
                                webOrderRequest.WebCooperator.PrimaryAddress.ZIP = reader["postal_index"].ToString();

                                webOrderRequest.OrderDate = GetDate(reader["ordered_date"].ToString());
                                webOrderRequest.IntendedUseCode = reader["intended_use_code"].ToString();
                                webOrderRequest.IntendedUseNote = reader["intended_use_note"].ToString();
                                webOrderRequest.Note = reader["note"].ToString();
                                webOrderRequest.SpecialInstruction = reader["special_instruction"].ToString();
                                webOrderRequest.WebOrderRequestItems = SearchItems(webOrderRequest.ID);
                                webOrderRequests.Add(webOrderRequest);
                            }
                        }
                    }
                }

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return webOrderRequests.AsQueryable();
        }

        public IQueryable<WebOrderRequestItem> SearchItems(int webOrderRequestId)
        {
            const string COMMAND_TEXT = "usp_WebOrderRequestItems_Select";
            List<WebOrderRequestItem> webOrderRequestItems = new List<WebOrderRequestItem>();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        cmd.Parameters.AddWithValue("@web_order_request_id", webOrderRequestId);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                WebOrderRequestItem webOrderRequestItem = new WebOrderRequestItem();
                                webOrderRequestItem.ID = GetInt(reader["web_order_request_item_id"].ToString());
                                webOrderRequestItem.SequenceNumber = GetInt(reader["sequence_number"].ToString());
                                webOrderRequestItem.Accession.ID = GetInt(reader["accession_id"].ToString());
                                webOrderRequestItem.Accession.Descriptor = reader["accession_text"].ToString();
                                webOrderRequestItem.StatusCode = reader["status_code"].ToString();
                                webOrderRequestItem.Site.ID = GetInt(reader["site_id"].ToString());
                                webOrderRequestItem.Site.LongName = reader["site_long_name"].ToString();
                                webOrderRequestItem.QuantityShipped = GetInt(reader["quantity_shipped"].ToString());
                                webOrderRequestItem.UnitShipped = reader["unit_of_shipped"].ToString();
                                webOrderRequestItem.DistributionForm = reader["distribution_form"].ToString();
                                webOrderRequestItem.Species.ID = GetInt(reader["taxonomy_species_id"].ToString());
                                webOrderRequestItem.Species.Name = reader["species_name"].ToString();
                                webOrderRequestItems.Add(webOrderRequestItem);
                            }
                        }
                    }
                }

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return webOrderRequestItems.AsQueryable();
        }

        public ResultContainer Update(WebOrderRequest entity)
        {
            const string COMMAND_TEXT = "usp_WebOrderRequest_Update";
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

                        cmd.Parameters.AddWithValue("@web_order_request_id", entity.ID);
                        cmd.Parameters.AddWithValue("@status_code", entity.StatusCode);

                        if (String.IsNullOrEmpty(entity.Note))
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@note", entity.Note);

                        cmd.Parameters.AddWithValue("@modified_by", entity.ModifiedByCooperatorID);

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

        int IRepository<WebOrderRequest>.Update(WebOrderRequest entity)
        {
            throw new NotImplementedException();
        }
    }
}
