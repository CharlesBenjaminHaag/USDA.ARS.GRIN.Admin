USE [gringlobal]
GO

/****** Object:  Table [dbo].[web_order_request]    Script Date: 4/8/2021 4:27:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[web_order_request](
	[web_order_request_id] [int] IDENTITY(1,1) NOT NULL,
	[web_cooperator_id] [int] NULL,
	[ordered_date] [datetime2](7) NULL,
	[intended_use_code] [nvarchar](20) NULL,
	[intended_use_note] [nvarchar](max) NULL,
	[status_code] [nvarchar](20) NULL,
	[note] [nvarchar](max) NULL,
	[special_instruction] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
	[is_locked] [bit] NULL,
 CONSTRAINT [PK_web_order_request] PRIMARY KEY CLUSTERED 
(
	[web_order_request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[web_order_request] ADD  CONSTRAINT [DF_web_order_request_is_locked]  DEFAULT ((0)) FOR [is_locked]
GO

ALTER TABLE [dbo].[web_order_request]  WITH CHECK ADD  CONSTRAINT [fk_wor_created] FOREIGN KEY([created_by])
REFERENCES [dbo].[web_user] ([web_user_id])
GO

ALTER TABLE [dbo].[web_order_request] CHECK CONSTRAINT [fk_wor_created]
GO

ALTER TABLE [dbo].[web_order_request]  WITH CHECK ADD  CONSTRAINT [fk_wor_owned] FOREIGN KEY([owned_by])
REFERENCES [dbo].[web_user] ([web_user_id])
GO

ALTER TABLE [dbo].[web_order_request] CHECK CONSTRAINT [fk_wor_owned]
GO

ALTER TABLE [dbo].[web_order_request]  WITH CHECK ADD  CONSTRAINT [fk_wor_wc] FOREIGN KEY([web_cooperator_id])
REFERENCES [dbo].[web_cooperator] ([web_cooperator_id])
GO

ALTER TABLE [dbo].[web_order_request] CHECK CONSTRAINT [fk_wor_wc]
GO


