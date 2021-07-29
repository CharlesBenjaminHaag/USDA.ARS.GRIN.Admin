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
    public class EmailTemplateDAO : BaseDAO, IRepository<EmailTemplate>
    {
        public EmailTemplateDAO(string context)
        {
            _context = context;
        }

        public ResultContainer Add(EmailTemplate entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<EmailTemplate> FindAll()
        {
            const string COMMAND_TEXT = "usp_SysEmailTemplates_Select";
            List<EmailTemplate> emailTemplates = new List<EmailTemplate>();

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
                                EmailTemplate emailTemplate = new EmailTemplate();
                                emailTemplate.ID = GetInt(reader["email_template_id"].ToString());
                                emailTemplate.Title = reader["title"].ToString();
                                emailTemplate.Category = reader["category_code"].ToString();
                                emailTemplate.From = reader["email_from"].ToString();
                                emailTemplate.To = reader["email_to"].ToString();
                                emailTemplate.CC = reader["email_cc"].ToString();
                                emailTemplate.BCC = reader["email_bcc"].ToString();
                                emailTemplate.ReplyTo = reader["email_reply_to"].ToString();
                                emailTemplate.Subject = reader["subject"].ToString();
                                emailTemplate.Body = reader["body"].ToString();
                                emailTemplate.IsHtml = ParseBool(reader["is_html"].ToString());
                                emailTemplate.CreatedDate = GetDate(reader["created_date"].ToString());
                                //emailTemplate.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                emailTemplate.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                //emailTemplate.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                                //emailTemplate.OwnedDate = GetDate(reader["owned_date"].ToString());
                                //emailTemplate.OwnedByCooperatorID = GetInt(reader["owned_by"].ToString());
                                //emailTemplate.OwnedByCooperatorName = reader["owned_by_name"].ToString();
                                emailTemplates.Add(emailTemplate);
                            }
                        }
                    }
                }

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return emailTemplates.AsQueryable();

        }

        public EmailTemplate Get(int id)
        {
            const string COMMAND_TEXT = "usp_SysEmailTemplate_Select";
            EmailTemplate emailTemplate = new EmailTemplate();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        cmd.Parameters.AddWithValue("@email_template_id", id);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                emailTemplate = new EmailTemplate();
                                emailTemplate.ID = GetInt(reader["email_template_id"].ToString());
                                emailTemplate.Title = reader["title"].ToString();
                                emailTemplate.Category = reader["category_code"].ToString();
                                emailTemplate.From = reader["email_from"].ToString();
                                emailTemplate.To = reader["email_to"].ToString();
                                emailTemplate.CC = reader["email_cc"].ToString();
                                emailTemplate.BCC = reader["email_bcc"].ToString();
                                emailTemplate.ReplyTo = reader["email_reply_to"].ToString();
                                emailTemplate.Subject = reader["subject"].ToString();
                                emailTemplate.Body = reader["body"].ToString();
                                emailTemplate.IsHtml = ParseBool(reader["is_html"].ToString());
                                emailTemplate.CreatedDate = GetDate(reader["created_date"].ToString());
                                emailTemplate.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                emailTemplate.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                emailTemplate.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                emailTemplate.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                                emailTemplate.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                            }
                        }
                    }
                }

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return emailTemplate;
        }

        public ResultContainer Remove(EmailTemplate entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<EmailTemplate> Search(Query query)
        {
            throw new NotImplementedException();
        }

        public IQueryable<EmailTemplate> Search(string searchString)
        {
            const string COMMAND_TEXT = "usp_SysEmailTemplate_Search";
            EmailTemplate emailTemplate = new EmailTemplate();

            try
            {
                using (SqlConnection cn = DataContext.GetConnection(this.GetConnectionStringKey(_context)))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = COMMAND_TEXT;
                        cmd.Parameters.AddWithValue("@category_code", searchString);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                emailTemplate = new EmailTemplate();
                                emailTemplate.ID = GetInt(reader["email_template_id"].ToString());
                                emailTemplate.Title = reader["title"].ToString();
                                emailTemplate.Category = reader["category_code"].ToString();
                                emailTemplate.From = reader["email_from"].ToString();
                                emailTemplate.To = reader["email_to"].ToString();
                                emailTemplate.CC = reader["email_cc"].ToString();
                                emailTemplate.BCC = reader["email_bcc"].ToString();
                                emailTemplate.ReplyTo = reader["email_reply_to"].ToString();
                                emailTemplate.Subject = reader["subject"].ToString();
                                emailTemplate.Body = reader["body"].ToString();
                                emailTemplate.IsHtml = ParseBool(reader["is_html"].ToString());
                                emailTemplate.CreatedDate = GetDate(reader["created_date"].ToString());
                                emailTemplate.CreatedByCooperatorID = GetInt(reader["created_by"].ToString());
                                emailTemplate.CreatedByCooperatorName = reader["created_by_name"].ToString();
                                emailTemplate.ModifiedDate = GetDate(reader["modified_date"].ToString());
                                emailTemplate.ModifiedByCooperatorID = GetInt(reader["modified_by"].ToString());
                                emailTemplate.ModifiedByCooperatorName = reader["modified_by_name"].ToString();
                            }
                        }
                    }
                }

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return new List<EmailTemplate> { emailTemplate }.AsQueryable();
        }

        public ResultContainer Update(EmailTemplate entity)
        {
            const string COMMAND_TEXT = "usp_SysEmailTemplate_Update";
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
                        cmd.Parameters.AddWithValue("@email_template_id", entity.ID);
                        //cmd.Parameters.AddWithValue("@title", entity.Title);
                        cmd.Parameters.AddWithValue("@email_from", entity.From);
                        //cmd.Parameters.AddWithValue("@email_to", entity.To);
                        cmd.Parameters.AddWithValue("@subject", entity.Subject);
                        cmd.Parameters.AddWithValue("@body", entity.Body);
                        cmd.Parameters.AddWithValue("@is_html", entity.IsHtml);
                        //cmd.Parameters.AddWithValue("@modified_by", entity.ModifiedByCooperatorID);

                        SqlParameter errorParam = new SqlParameter();
                        errorParam.SqlDbType = System.Data.SqlDbType.Int;
                        errorParam.ParameterName = "@out_error_number";
                        errorParam.Direction = System.Data.ParameterDirection.Output;
                        errorParam.Value = 0;
                        cmd.Parameters.Add(errorParam);
                        cmd.ExecuteNonQuery();
                        resultContainer.ResultCode = cmd.Parameters["@out_error_number"].Value.ToString();
                        if (!String.IsNullOrEmpty(resultContainer.ResultCode))
                        {
                            if (Int32.Parse(resultContainer.ResultCode) > 0)
                            {
                                throw new Exception(resultContainer.ResultCode);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                switch (ex.Errors[0].Number)
                {
                    case 547: // Foreign Key violation
                        string s = ex.Message;
                        s = s.Substring(s.IndexOf("column "));
                        string[] array = s.Split('.');
                        s = array[0].Substring(array[0].IndexOf('\''));
                        break;
                }
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultContainer;
        }
    }
}
