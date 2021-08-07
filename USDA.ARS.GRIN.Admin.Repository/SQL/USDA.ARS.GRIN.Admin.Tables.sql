USE gringlobal

ALTER TABLE web_cooperator
ADD [status_code] [nvarchar](20) NULL

ALTER TABLE web_order_request
ADD [is_locked] [bit] NULL

ALTER TABLE web_order_request
ADD [email_sent] [bit] NULL

ALTER TABLE [dbo].[web_order_request] ADD  CONSTRAINT [DF_web_order_request_is_locked]  DEFAULT ((0)) FOR [is_locked]
GO

ALTER TABLE [dbo].[web_order_request] ADD  CONSTRAINT [DF_web_order_request_email_sent]  DEFAULT ((0)) FOR [email_sent]
GO
