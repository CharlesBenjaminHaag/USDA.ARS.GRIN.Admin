USE gringlobal

ALTER TABLE web_cooperator
ADD [status_code] [nvarchar](20) NULL

ALTER TABLE web_order_request
ADD [is_locked] [bit] NULL

ALTER TABLE web_order_request
ADD [email_sent] [bit] NULL

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[email_template]') AND type in (N'U'))
ALTER TABLE [dbo].[email_template] DROP CONSTRAINT IF EXISTS [fk_et_owned]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[email_template]') AND type in (N'U'))
ALTER TABLE [dbo].[email_template] DROP CONSTRAINT IF EXISTS [fk_et_modified]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[email_template]') AND type in (N'U'))
ALTER TABLE [dbo].[email_template] DROP CONSTRAINT IF EXISTS [fk_et_created]
GO
/****** Object:  Table [dbo].[email_template]    Script Date: 7/22/2021 6:33:32 PM ******/
DROP TABLE IF EXISTS [dbo].[email_template]
GO
/****** Object:  Table [dbo].[email_template]    Script Date: 7/22/2021 6:33:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email_template](
	[email_template_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](120) NULL,
	[category_code] [nvarchar](3) NULL,
	[email_from] [nvarchar](200) NULL,
	[email_to] [nvarchar](1000) NULL,
	[email_cc] [nvarchar](1000) NULL,
	[email_bcc] [nvarchar](1000) NULL,
	[email_reply_to] [nvarchar](200) NULL,
	[subject] [nvarchar](500) NULL,
	[body] [nvarchar](max) NULL,
	[is_html] [nvarchar](1) NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
 CONSTRAINT [PK_email_template] PRIMARY KEY CLUSTERED 
(
	[email_template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[email_template] ON 
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (3, N'Requestor Rejection Letter', NULL, N'gringlobal-.orders@usda.gov', NULL, NULL, NULL, NULL, N'Regarding Your Germplasm Request', N'Dear Germplasm Requestor,<p>Thank you for your interest in our germplasm collection.The mission of the National Plant Germplasm System(NPGS). is to provide materials in small quantities to research and education entities when genetic diversity or genetic standards are a requirement.The accessions maintained by NPGS are not intended for home or personal use that can be better served by commercially - available varieties.</p>', N'1', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (4, N'Curator Approval Notification', N'', N'gringlobal-.orders@usda.gov', NULL, NULL, NULL, NULL, N'NULLOrder :web_order_request_id Approved', N'Order # " + webOrderRequest.ID + " has been approved. You may now process it normally via the Order Wizard.', N'1', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (5, N'Curator Cancellation Notiification', NULL, N'gringlobal-.orders@usda.gov', NULL, NULL, NULL, NULL, N'Order :web_order_request_id Cancelled', N'"Order # " + webOrderRequest.ID + " has been determined to be a Non-Research Request (NRR), and has been cancelled. You may reference this order within the Order Wizard.', N'1', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (6, N'Request For Information', NULL, NULL, NULL, NULL, NULL, NULL, N'Request For Additional Information: Order :web_order_request_id', NULL, N'1', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
GO
SET IDENTITY_INSERT [dbo].[email_template] OFF
GO
ALTER TABLE [dbo].[email_template]  WITH CHECK ADD  CONSTRAINT [fk_et_created] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
ALTER TABLE [dbo].[email_template] CHECK CONSTRAINT [fk_et_created]
GO
ALTER TABLE [dbo].[email_template]  WITH CHECK ADD  CONSTRAINT [fk_et_modified] FOREIGN KEY([modified_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
ALTER TABLE [dbo].[email_template] CHECK CONSTRAINT [fk_et_modified]
GO
ALTER TABLE [dbo].[email_template]  WITH CHECK ADD  CONSTRAINT [fk_et_owned] FOREIGN KEY([owned_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
ALTER TABLE [dbo].[email_template] CHECK CONSTRAINT [fk_et_owned]
GO
