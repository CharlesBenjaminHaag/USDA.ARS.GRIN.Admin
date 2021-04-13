﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using USDA.ARS.GRIN.Admin.Models;
using USDA.ARS.GRIN.Admin.Models.GRINGlobal;
using System.Net;

namespace USDA.ARS.GRIN.Admin.Repository.GRINGlobal
{
    public class WebOrderRequestDAO : BaseDAO, IRepository<WebOrderRequest>
    {
        static string StatusUpdateCommand = "usp_WebOrderRequestStatus_Update";

        public WebOrderRequestDAO(string context)
        {
            InsertCommmand = "usp_WebOrderRequest_Insert";
            UpdateCommmand = "usp_WebOrderRequest_Update";
            SelectCommmand = "usp_WebOrderRequest_Select";
            _context = context;
        }

        #region WebOrderRequest

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
            WebOrderRequest webOrderRequest = new WebOrderRequest();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = SelectCommmand;
                        cmd.Parameters.AddWithValue("@web_order_request_id", id);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                webOrderRequest = new WebOrderRequest();
                                webOrderRequest.ID = GetInt(reader["web_order_request_id"].ToString());

                                Cooperator webCooperator = new Cooperator();
                                webCooperator.ID = GetInt(reader["web_cooperator_id"].ToString());
                                webCooperator.Type = 2;
                                webCooperator.Title = reader["web_cooperator_title"].ToString();
                                webCooperator.LastName = reader["web_cooperator_last_name"].ToString();
                                webCooperator.FirstName = reader["web_cooperator_first_name"].ToString();
                                webCooperator.Organization = reader["web_cooperator_organization"].ToString();
                                webCooperator.Address.AddressLine1 = reader["web_cooperator_address_line_1"].ToString();
                                webCooperator.Address.AddressLine2 = reader["web_cooperator_address_line_2"].ToString();
                                webCooperator.Address.AddressLine3 = reader["web_cooperator_address_line_3"].ToString();
                                webCooperator.Address.City = reader["web_cooperator_address_city"].ToString();
                                webCooperator.Address.ZIP = reader["web_cooperator_address_postal_index"].ToString();
                                webCooperator.Address.State = reader["web_cooperator_address_state"].ToString();
                                webCooperator.PrimaryPhoneNumber = reader["web_cooperator_primary_phone"].ToString();
                                webCooperator.EmailAddress = reader["web_cooperator_email"].ToString();
                                webCooperator.CreatedDate = GetDate(reader["web_cooperator_created_date"].ToString());
                                webCooperator.ModifiedDate = GetDate(reader["web_cooperator_modified_date"].ToString());
                                webOrderRequest.Cooperators.Add(webCooperator);

                                //if (reader["cooperator_id"] != DBNull.Value)
                                //{
                                //    Cooperator cooperator = new Cooperator();
                                //    cooperator.ID = GetInt(reader["cooperator_id"].ToString());
                                //    cooperator.Type = 1;
                                //    cooperator.Title = reader["cooperator_title"].ToString();
                                //    cooperator.LastName = reader["cooperator_last_name"].ToString();
                                //    cooperator.FirstName = reader["cooperator_first_name"].ToString();
                                //    cooperator.Organization = reader["cooperator_organization"].ToString();
                                //    cooperator.Address.AddressLine1 = reader["cooperator_address_line_1"].ToString();
                                //    cooperator.Address.AddressLine2 = reader["cooperator_address_line_2"].ToString();
                                //    cooperator.Address.AddressLine3 = reader["cooperator_address_line_3"].ToString();
                                //    cooperator.Address.City = reader["cooperator_address_city"].ToString();
                                //    cooperator.Address.ZIP = reader["cooperator_address_postal_index"].ToString();
                                //    cooperator.Address.State = reader["cooperator_address_state"].ToString();
                                //    cooperator.PrimaryPhoneNumber = reader["cooperator_primary_phone"].ToString();
                                //    cooperator.EmailAddress = reader["cooperator_email"].ToString();
                                //    cooperator.CreatedDate = GetDate(reader["cooperator_created_date"].ToString());
                                //    cooperator.ModifiedDate = GetDate(reader["cooperator_modified_date"].ToString());
                                //    webOrderRequest.Cooperators.Add(cooperator);
                                //}
                                
                                webOrderRequest.OrderDate = GetDate(reader["ordered_date"].ToString());
                                webOrderRequest.IntendedUseCode = reader["intended_use_code"].ToString();
                                webOrderRequest.IntendedUseNote = reader["intended_use_note"].ToString();
                                webOrderRequest.Note = reader["note"].ToString();
                                webOrderRequest.SpecialInstruction = reader["special_instruction"].ToString();
                                webOrderRequest.WebOrderRequestItems = SearchItems(webOrderRequest.ID);
                                webOrderRequest.WebOrderRequestActions = SearchActions(webOrderRequest.ID);
                                
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

        public ResultContainer Update(WebOrderRequest entity)
        {
            ResultContainer resultContainer = new ResultContainer();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = UpdateCommmand;

                        cmd.Parameters.AddWithValue("@web_order_request_id", entity.ID);
                        cmd.Parameters.AddWithValue("@web_cooperator_id", entity.WebCooperatorID);
                        cmd.Parameters.AddWithValue("@status_code", entity.StatusCode);

                        if (String.IsNullOrEmpty(entity.Note))
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@note", entity.Note);

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

        public ResultContainer UpdateStatus(int id, string statusCode, int webCooperatorId)
        {
            const string COMMAND_TEXT = "usp_WebOrderRequestStatus_Update";
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

                        //cmd.Parameters.AddWithValue("@web_order_request_id", id);
                        //cmd.Parameters.AddWithValue("@is_locked", locked);
                        //cmd.Parameters.AddWithValue("@web_cooperator_id", webCooperatorId);

                        SqlParameter errorParam = new SqlParameter();
                        errorParam.SqlDbType = System.Data.SqlDbType.Int;
                        errorParam.ParameterName = "@out_error_number";
                        errorParam.Direction = System.Data.ParameterDirection.Output;
                        errorParam.Value = 0;
                        cmd.Parameters.Add(errorParam);

                        cmd.ExecuteNonQuery();

                        resultContainer.EntityID = id;
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

        public ResultContainer UpdateLockStatus(int id, int webCooperatorId, bool locked)
        {
            const string COMMAND_TEXT = "usp_WebOrderRequestLock_Update";
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

                        cmd.Parameters.AddWithValue("@web_order_request_id", id);
                        cmd.Parameters.AddWithValue("@is_locked", locked);
                        cmd.Parameters.AddWithValue("@web_cooperator_id", webCooperatorId);

                        SqlParameter errorParam = new SqlParameter();
                        errorParam.SqlDbType = System.Data.SqlDbType.Int;
                        errorParam.ParameterName = "@out_error_number";
                        errorParam.Direction = System.Data.ParameterDirection.Output;
                        errorParam.Value = 0;
                        cmd.Parameters.Add(errorParam);

                        cmd.ExecuteNonQuery();

                        resultContainer.EntityID = id;
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

        public int Remove(WebOrderRequest entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<WebOrderRequest> Search(Query query)
        {
            const string COMMAND_TEXT = "usp_WebOrderRequests_Select";
            StringBuilder sbWhereClause = new StringBuilder();
            List<WebOrderRequest> webOrderRequests = new List<WebOrderRequest>();

            try
            {
                // TO DO: BUILD WHERE CLAUSE
                foreach (var queryCriterion in query.QueryCriteria)
                {
                    sbWhereClause.Append(" WHERE ");
                    sbWhereClause.Append(queryCriterion.FieldName);
                    sbWhereClause.Append(queryCriterion.SearchOperatorCode);
                    // TO DO: IF FIELD IS STRING, APPEND SINGLE QUOTES AND LIKE OPERATOR
                    
                }


                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        cmd.Parameters.AddWithValue("@sql_where_clause", sbWhereClause.ToString());

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

        public List<WebOrderRequest> SearchByStatus(string statusCode, int timeFrameCode)
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
                        cmd.Parameters.AddWithValue("@time_frame_code", timeFrameCode);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                WebOrderRequest webOrderRequest = new WebOrderRequest();
                                webOrderRequest.ID = GetInt(reader["web_order_request_id"].ToString());
                                webOrderRequest.IsLocked = ParseBool(reader["is_locked"].ToString());
                                webOrderRequest.StatusCode = reader["status_code"].ToString();
                                webOrderRequest.WebCooperator.ID = GetInt(reader["web_cooperator_id"].ToString());
                                webOrderRequest.WebCooperator.LastName = reader["web_cooperator_last_name"].ToString();
                                webOrderRequest.WebCooperator.FirstName = reader["web_cooperator_first_name"].ToString();
                                webOrderRequest.WebCooperator.EmailAddress = reader["web_cooperator_email"].ToString();
                                webOrderRequest.WebCooperator.Address.PersonFullName = reader["web_cooperator_full_name"].ToString();
                                webOrderRequest.WebCooperator.Address.OrganizationName = reader["web_cooperator_organization"].ToString();
                                webOrderRequest.WebCooperator.Address.AddressLine1 = reader["web_cooperator_address_line_1"].ToString();
                                webOrderRequest.WebCooperator.Address.AddressLine2 = reader["web_cooperator_address_line_2"].ToString();
                                webOrderRequest.WebCooperator.Address.AddressLine3 = reader["web_cooperator_address_line_3"].ToString();
                                webOrderRequest.WebCooperator.Address.City = reader["web_cooperator_address_city"].ToString();
                                webOrderRequest.WebCooperator.Address.State = reader["web_cooperator_address_state"].ToString();
                                webOrderRequest.WebCooperator.Address.ZIP = reader["web_cooperator_address_postal_index"].ToString();
                                webOrderRequest.WebCooperator.CreatedDate = GetDate(reader["web_cooperator_created_date"].ToString());
                                webOrderRequest.WebCooperator.ModifiedDate = GetDate(reader["web_cooperator_modified_date"].ToString());
                                webOrderRequest.OrderDate = GetDate(reader["ordered_date"].ToString());
                                webOrderRequest.IntendedUseCode = reader["intended_use_code"].ToString();
                                webOrderRequest.IntendedUseNote = reader["intended_use_note"].ToString();
                                webOrderRequest.Note = reader["note"].ToString();
                                webOrderRequest.SpecialInstruction = reader["special_instruction"].ToString();
                                webOrderRequest.CreatedDate = GetDate(reader["created_date"].ToString());
                                webOrderRequest.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                webOrderRequest.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                webOrderRequest.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                                webOrderRequest.OwnedDate = GetDate(reader["owned_date"].ToString());
                                webOrderRequest.OwnedByCooperatorID = GetInt(reader["owned_by"].ToString());
                                webOrderRequest.OwnedByCooperatorName = reader["owned_by_name"].ToString();
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
            return webOrderRequests;
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
                                webOrderRequest.IsLocked = ParseBool(reader["is_locked"].ToString());
                                webOrderRequest.WebCooperator.ID = GetInt(reader["web_cooperator_id"].ToString());
                                webOrderRequest.WebCooperator.LastName = reader["web_cooperator_last_name"].ToString();
                                webOrderRequest.WebCooperator.FirstName = reader["web_cooperator_first_name"].ToString();
                                webOrderRequest.WebCooperator.EmailAddress = reader["web_cooperator_email"].ToString();
                                webOrderRequest.WebCooperator.Address.PersonFullName = reader["web_cooperator_full_name"].ToString();
                                webOrderRequest.WebCooperator.Address.OrganizationName = reader["web_cooperator_organization"].ToString();
                                webOrderRequest.WebCooperator.Address.AddressLine1 = reader["web_cooperator_address_line_1"].ToString();
                                webOrderRequest.WebCooperator.Address.AddressLine2 = reader["web_cooperator_address_line_2"].ToString();
                                webOrderRequest.WebCooperator.Address.AddressLine3 = reader["web_cooperator_address_line_3"].ToString();
                                webOrderRequest.WebCooperator.Address.City = reader["web_cooperator_address_city"].ToString();
                                webOrderRequest.WebCooperator.Address.State = reader["web_cooperator_address_state"].ToString();
                                webOrderRequest.WebCooperator.Address.ZIP = reader["web_cooperator_address_postal_index"].ToString();
                                webOrderRequest.WebCooperator.CreatedDate = GetDate(reader["web_cooperator_created_date"].ToString());
                                webOrderRequest.WebCooperator.ModifiedDate = GetDate(reader["web_cooperator_modified_date"].ToString());
                                webOrderRequest.OrderDate = GetDate(reader["ordered_date"].ToString());
                                webOrderRequest.IntendedUseCode = reader["intended_use_code"].ToString();
                                webOrderRequest.IntendedUseNote = reader["intended_use_note"].ToString();
                                webOrderRequest.Note = reader["note"].ToString();
                                webOrderRequest.SpecialInstruction = reader["special_instruction"].ToString();
                                webOrderRequest.CreatedDate = GetDate(reader["created_date"].ToString());
                                webOrderRequest.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                webOrderRequest.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                webOrderRequest.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                                webOrderRequest.OwnedDate = GetDate(reader["owned_date"].ToString());
                                webOrderRequest.OwnedByCooperatorName = reader["owned_by_name"].ToString();
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

        #endregion WebOrderRequest

        #region Web Order Request Items

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

        #endregion

        #region Web Order Request Actions
        public IQueryable<WebOrderRequestAction> SearchActions(int webOrderRequestId)
        {
            const string COMMAND_TEXT = "usp_WebOrderRequestActions_Select";
            List<WebOrderRequestAction> webOrderRequestActions = new List<WebOrderRequestAction>();

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
                                WebOrderRequestAction webOrderRequestAction = new WebOrderRequestAction();
                                webOrderRequestAction.ID = GetInt(reader["web_order_request_action_id"].ToString());
                                webOrderRequestAction.WebOrderRequestID = webOrderRequestId;
                                webOrderRequestAction.Title = reader["action_title"].ToString();
                                webOrderRequestAction.ActionCode = reader["action_code"].ToString();
                                webOrderRequestAction.ActionDateTime = GetDate(reader["action_date"].ToString());
                                webOrderRequestAction.ActionDate = GetDate(reader["action_date_converted"].ToString());
                                webOrderRequestAction.Note = reader["note"].ToString();
                                webOrderRequestAction.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                webOrderRequestAction.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                webOrderRequestActions.Add(webOrderRequestAction);
                            }
                        }
                    }
                }

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return webOrderRequestActions.AsQueryable();
        }

        public ResultContainer AddAction(WebOrderRequestAction entity)
        {
            const string COMMAND_TEXT = "usp_WebOrderRequestAction_Insert";
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
                        cmd.Parameters.AddWithValue("@web_order_request_id", entity.WebOrderRequestID);
                        cmd.Parameters.AddWithValue("@action_code", entity.ActionCode);
                        cmd.Parameters.AddWithValue("@created_by", entity.CreatedByCooperatorID);

                        if (String.IsNullOrEmpty(entity.Note))
                            cmd.Parameters.AddWithValue("@note", DBNull.Value);
                        else
                            cmd.Parameters.AddWithValue("@note", entity.Note);

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

        ResultContainer IRepository<WebOrderRequest>.Add(WebOrderRequest entity)
        {
            throw new NotImplementedException();
        }

        ResultContainer IRepository<WebOrderRequest>.Remove(WebOrderRequest entity)
        {
            throw new NotImplementedException();
        }


        #endregion

        #region Web Order Request Status

        public List<ReferenceItem> GetStatuses()
        {
            const string COMMAND_TEXT = "usp_WebOrderRequestStatuses_Select";
            List<ReferenceItem> statuses = new List<ReferenceItem>();

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
                                ReferenceItem status = new ReferenceItem { ID = GetInt(reader["web_order_request_count"].ToString()), Name = reader["status_code"].ToString() };
                                statuses.Add(status);
                            }
                        }
                    }
                }

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return statuses;
        }

        #endregion
    }
}
