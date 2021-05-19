USE [gringlobal]
GO
/****** Object:  Table [dbo].[taxonomy_cwr_crop]    Script Date: 4/11/2021 5:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_crop]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[taxonomy_cwr_crop](
	[taxonomy_cwr_crop_id] [int] IDENTITY(1,1) NOT NULL,
	[crop_name] [nvarchar](150) NULL,
	[note] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
 CONSTRAINT [PK_taxonomy_cwr_crop] PRIMARY KEY CLUSTERED 
(
	[taxonomy_cwr_crop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[taxonomy_cwr_map]    Script Date: 4/11/2021 5:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[taxonomy_cwr_map](
	[taxonomy_cwr_map_id] [int] IDENTITY(1,1) NOT NULL,
	[taxonomy_species_id] [int] NOT NULL,
	[taxonomy_cwr_crop_id] [int] NOT NULL,
	[crop_common_name] [nvarchar](100) NULL,
	[is_crop] [nvarchar](1) NOT NULL,
	[genepool_code] [nvarchar](20) NULL,
	[is_graftstock] [nvarchar](1) NOT NULL,
	[is_potential] [nvarchar](1) NOT NULL,
	[citation_id] [int] NULL,
	[note] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
 CONSTRAINT [PK_taxonomy_cwr_map] PRIMARY KEY CLUSTERED 
(
	[taxonomy_cwr_map_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[taxonomy_cwr_priority]    Script Date: 4/11/2021 5:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_priority]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[taxonomy_cwr_priority](
	[taxonomy_cwr_priority_id] [int] IDENTITY(1,1) NOT NULL,
	[taxonomy_species_id] [int] NOT NULL,
	[priority_year] [int] NOT NULL,
	[status_code] [nvarchar](20) NOT NULL,
	[in_situ_code] [nvarchar](20) NULL,
	[ex_situ_code] [nvarchar](20) NULL,
	[citation_id] [int] NULL,
	[note] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
 CONSTRAINT [PK_taxonomy_cwr_priority] PRIMARY KEY CLUSTERED 
(
	[taxonomy_cwr_priority_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[taxonomy_cwr_trait]    Script Date: 4/11/2021 5:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_trait]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[taxonomy_cwr_trait](
	[taxonomy_cwr_trait_id] [int] IDENTITY(1,1) NOT NULL,
	[taxonomy_cwr_map_id] [int] NOT NULL,
	[trait_class_code] [nvarchar](20) NULL,
	[is_potential] [nvarchar](1) NOT NULL,
	[breeding_type_code] [nvarchar](20) NULL,
	[breeding_usage_note] [nvarchar](1000) NULL,
	[ontology_trait_identifier] [nvarchar](20) NULL,
	[citation_id] [int] NULL,
	[note] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
 CONSTRAINT [PK_taxonomy_cwr_trait] PRIMARY KEY CLUSTERED 
(
	[taxonomy_cwr_trait_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[taxonomy_folder]    Script Date: 4/11/2021 5:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_folder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[taxonomy_folder](
	[taxonomy_folder_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[description] [nvarchar](max) NULL,
	[note] [nvarchar](2000) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[is_shared] [bit] NULL,
	[modified_by] [int] NULL,
	[modified_date] [datetime] NULL,
	[data_source] [nvarchar](150) NULL,
 CONSTRAINT [PK_taxonomy_folder] PRIMARY KEY CLUSTERED 
(
	[taxonomy_folder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[taxonomy_folder_item_map]    Script Date: 4/11/2021 5:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[taxonomy_folder_item_map](
	[taxonomy_folder_item_id] [int] IDENTITY(1,1) NOT NULL,
	[taxonomy_folder_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[data_source] [nvarchar](150) NULL,
 CONSTRAINT [PK_taxonomy_folder_item] PRIMARY KEY CLUSTERED 
(
	[taxonomy_folder_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[taxonomy_ista_seed]    Script Date: 4/11/2021 5:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[taxonomy_ista_seed](
	[taxonomy_ista_seed_id] [int] IDENTITY(1,1) NOT NULL,
	[taxonomy_species_id] [int] NULL,
	[name_status] [nvarchar](20) NULL,
	[accepted_taxonomy_species_id] [int] NULL,
	[primary_family_id] [int] NULL,
	[alternate_family_id_1] [int] NULL,
	[alternate_family_id_2] [int] NULL,
	[alternate_family_id_3] [int] NULL,
	[url] [nvarchar](250) NULL,
	[note] [nvarchar](250) NULL,
	[comment] [nvarchar](250) NULL,
	[taxonomy_upov_crop_map_id] [int] NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
	[family_id_2] [int] NULL,
	[family_id_3] [int] NULL,
	[taxonomy_genus_id] [int] NULL,
	[taxonomy_upov_crop_id] [int] NULL,
	[TEMP_UPOV] [nvarchar](50) NULL,
	[primary_family_name] [nvarchar](50) NULL,
	[family_name_2] [nvarchar](50) NULL,
 CONSTRAINT [PK_taxonomy_upov_seed] PRIMARY KEY CLUSTERED 
(
	[taxonomy_ista_seed_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[taxonomy_ref_upov_crop]    Script Date: 4/11/2021 5:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_ref_upov_crop]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[taxonomy_ref_upov_crop](
	[taxonomy_ref_upov_crop_id] [int] IDENTITY(1,1) NOT NULL,
	[upov_code] [nvarchar](20) NOT NULL,
	[url] [nvarchar](250) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
	[upov_crop_id] [int] NULL,
 CONSTRAINT [PK_taxonomy_ref_upov_crop] PRIMARY KEY CLUSTERED 
(
	[taxonomy_ref_upov_crop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[taxonomy_regulation]    Script Date: 4/11/2021 5:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[taxonomy_regulation](
	[taxonomy_regulation_id] [int] IDENTITY(1,1) NOT NULL,
	[geography_id] [int] NOT NULL,
	[regulation_type_code] [nvarchar](20) NOT NULL,
	[regulation_level_code] [nvarchar](20) NULL,
	[description] [nvarchar](80) NULL,
	[url_1] [nvarchar](250) NULL,
	[url_2] [nvarchar](250) NULL,
	[note] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
 CONSTRAINT [PK_taxonomy_regulation_level] PRIMARY KEY CLUSTERED 
(
	[taxonomy_regulation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[taxonomy_regulation_map]    Script Date: 4/11/2021 5:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[taxonomy_regulation_map](
	[taxonomy_regulation_map_id] [int] IDENTITY(1,1) NOT NULL,
	[taxonomy_family_id] [int] NULL,
	[taxonomy_genus_id] [int] NULL,
	[taxonomy_species_id] [int] NULL,
	[taxonomy_regulation_id] [int] NOT NULL,
	[note] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
	[is_exempt] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_taxonomy_regulation] PRIMARY KEY CLUSTERED 
(
	[taxonomy_regulation_map_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[taxonomy_upov_crop_map]    Script Date: 4/11/2021 5:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_upov_crop_map]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[taxonomy_upov_crop_map](
	[taxonomy_upov_crop_map_id] [int] IDENTITY(1,1) NOT NULL,
	[taxonomy_upov_crop_id] [int] NOT NULL,
	[taxonomy_species_id] [int] NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
 CONSTRAINT [PK_taxonomy_upov_crop_map] PRIMARY KEY CLUSTERED 
(
	[taxonomy_upov_crop_map_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_folder_created_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_folder] ADD  CONSTRAINT [DF_taxonomy_folder_created_date]  DEFAULT (getdate()) FOR [created_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_folder_item_created_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_folder_item_map] ADD  CONSTRAINT [DF_taxonomy_folder_item_created_date]  DEFAULT (getdate()) FOR [created_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_ista_seed_created_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_ista_seed] ADD  CONSTRAINT [DF_taxonomy_ista_seed_created_date]  DEFAULT (getdate()) FOR [created_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_ista_seed_modified_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_ista_seed] ADD  CONSTRAINT [DF_taxonomy_ista_seed_modified_date]  DEFAULT (getdate()) FOR [modified_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_ista_seed_owned_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_ista_seed] ADD  CONSTRAINT [DF_taxonomy_ista_seed_owned_date]  DEFAULT (getdate()) FOR [owned_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_ref_upov_crop_created_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_ref_upov_crop] ADD  CONSTRAINT [DF_taxonomy_ref_upov_crop_created_date]  DEFAULT (getdate()) FOR [created_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_ref_upov_crop_modified_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_ref_upov_crop] ADD  CONSTRAINT [DF_taxonomy_ref_upov_crop_modified_date]  DEFAULT (getdate()) FOR [modified_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_ref_upov_crop_owned_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_ref_upov_crop] ADD  CONSTRAINT [DF_taxonomy_ref_upov_crop_owned_date]  DEFAULT (getdate()) FOR [owned_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_regulation_map_is_exempt]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_regulation_map] ADD  CONSTRAINT [DF_taxonomy_regulation_map_is_exempt]  DEFAULT (N'N') FOR [is_exempt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_upov_crop_map_created_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_upov_crop_map] ADD  CONSTRAINT [DF_taxonomy_upov_crop_map_created_date]  DEFAULT (getdate()) FOR [created_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_upov_crop_map_modified_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_upov_crop_map] ADD  CONSTRAINT [DF_taxonomy_upov_crop_map_modified_date]  DEFAULT (getdate()) FOR [modified_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_upov_crop_map_owned_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_upov_crop_map] ADD  CONSTRAINT [DF_taxonomy_upov_crop_map_owned_date]  DEFAULT (getdate()) FOR [owned_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcc_created]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_crop]'))
ALTER TABLE [dbo].[taxonomy_cwr_crop]  WITH CHECK ADD  CONSTRAINT [fk_tcc_created] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcc_created]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_crop]'))
ALTER TABLE [dbo].[taxonomy_cwr_crop] CHECK CONSTRAINT [fk_tcc_created]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcc_modified]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_crop]'))
ALTER TABLE [dbo].[taxonomy_cwr_crop]  WITH CHECK ADD  CONSTRAINT [fk_tcc_modified] FOREIGN KEY([modified_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcc_modified]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_crop]'))
ALTER TABLE [dbo].[taxonomy_cwr_crop] CHECK CONSTRAINT [fk_tcc_modified]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcc_owned]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_crop]'))
ALTER TABLE [dbo].[taxonomy_cwr_crop]  WITH CHECK ADD  CONSTRAINT [fk_tcc_owned] FOREIGN KEY([owned_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcc_owned]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_crop]'))
ALTER TABLE [dbo].[taxonomy_cwr_crop] CHECK CONSTRAINT [fk_tcc_owned]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrm_cit]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]'))
ALTER TABLE [dbo].[taxonomy_cwr_map]  WITH CHECK ADD  CONSTRAINT [fk_tcwrm_cit] FOREIGN KEY([citation_id])
REFERENCES [dbo].[citation] ([citation_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrm_cit]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]'))
ALTER TABLE [dbo].[taxonomy_cwr_map] CHECK CONSTRAINT [fk_tcwrm_cit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrm_created]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]'))
ALTER TABLE [dbo].[taxonomy_cwr_map]  WITH CHECK ADD  CONSTRAINT [fk_tcwrm_created] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrm_created]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]'))
ALTER TABLE [dbo].[taxonomy_cwr_map] CHECK CONSTRAINT [fk_tcwrm_created]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrm_modified]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]'))
ALTER TABLE [dbo].[taxonomy_cwr_map]  WITH CHECK ADD  CONSTRAINT [fk_tcwrm_modified] FOREIGN KEY([modified_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrm_modified]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]'))
ALTER TABLE [dbo].[taxonomy_cwr_map] CHECK CONSTRAINT [fk_tcwrm_modified]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrm_owned]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]'))
ALTER TABLE [dbo].[taxonomy_cwr_map]  WITH CHECK ADD  CONSTRAINT [fk_tcwrm_owned] FOREIGN KEY([owned_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrm_owned]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]'))
ALTER TABLE [dbo].[taxonomy_cwr_map] CHECK CONSTRAINT [fk_tcwrm_owned]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrm_tc]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]'))
ALTER TABLE [dbo].[taxonomy_cwr_map]  WITH CHECK ADD  CONSTRAINT [fk_tcwrm_tc] FOREIGN KEY([taxonomy_cwr_crop_id])
REFERENCES [dbo].[taxonomy_cwr_crop] ([taxonomy_cwr_crop_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrm_tc]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]'))
ALTER TABLE [dbo].[taxonomy_cwr_map] CHECK CONSTRAINT [fk_tcwrm_tc]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrm_ts]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]'))
ALTER TABLE [dbo].[taxonomy_cwr_map]  WITH CHECK ADD  CONSTRAINT [fk_tcwrm_ts] FOREIGN KEY([taxonomy_species_id])
REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrm_ts]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_map]'))
ALTER TABLE [dbo].[taxonomy_cwr_map] CHECK CONSTRAINT [fk_tcwrm_ts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrp_cit]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_priority]'))
ALTER TABLE [dbo].[taxonomy_cwr_priority]  WITH CHECK ADD  CONSTRAINT [fk_tcwrp_cit] FOREIGN KEY([citation_id])
REFERENCES [dbo].[citation] ([citation_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrp_cit]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_priority]'))
ALTER TABLE [dbo].[taxonomy_cwr_priority] CHECK CONSTRAINT [fk_tcwrp_cit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrp_created]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_priority]'))
ALTER TABLE [dbo].[taxonomy_cwr_priority]  WITH CHECK ADD  CONSTRAINT [fk_tcwrp_created] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrp_created]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_priority]'))
ALTER TABLE [dbo].[taxonomy_cwr_priority] CHECK CONSTRAINT [fk_tcwrp_created]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrp_modified]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_priority]'))
ALTER TABLE [dbo].[taxonomy_cwr_priority]  WITH CHECK ADD  CONSTRAINT [fk_tcwrp_modified] FOREIGN KEY([modified_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrp_modified]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_priority]'))
ALTER TABLE [dbo].[taxonomy_cwr_priority] CHECK CONSTRAINT [fk_tcwrp_modified]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrp_owned]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_priority]'))
ALTER TABLE [dbo].[taxonomy_cwr_priority]  WITH CHECK ADD  CONSTRAINT [fk_tcwrp_owned] FOREIGN KEY([owned_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrp_owned]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_priority]'))
ALTER TABLE [dbo].[taxonomy_cwr_priority] CHECK CONSTRAINT [fk_tcwrp_owned]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrp_ts]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_priority]'))
ALTER TABLE [dbo].[taxonomy_cwr_priority]  WITH CHECK ADD  CONSTRAINT [fk_tcwrp_ts] FOREIGN KEY([taxonomy_species_id])
REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrp_ts]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_priority]'))
ALTER TABLE [dbo].[taxonomy_cwr_priority] CHECK CONSTRAINT [fk_tcwrp_ts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrt_cit]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_trait]'))
ALTER TABLE [dbo].[taxonomy_cwr_trait]  WITH CHECK ADD  CONSTRAINT [fk_tcwrt_cit] FOREIGN KEY([citation_id])
REFERENCES [dbo].[citation] ([citation_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrt_cit]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_trait]'))
ALTER TABLE [dbo].[taxonomy_cwr_trait] CHECK CONSTRAINT [fk_tcwrt_cit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrt_created]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_trait]'))
ALTER TABLE [dbo].[taxonomy_cwr_trait]  WITH CHECK ADD  CONSTRAINT [fk_tcwrt_created] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrt_created]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_trait]'))
ALTER TABLE [dbo].[taxonomy_cwr_trait] CHECK CONSTRAINT [fk_tcwrt_created]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrt_modified]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_trait]'))
ALTER TABLE [dbo].[taxonomy_cwr_trait]  WITH CHECK ADD  CONSTRAINT [fk_tcwrt_modified] FOREIGN KEY([modified_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrt_modified]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_trait]'))
ALTER TABLE [dbo].[taxonomy_cwr_trait] CHECK CONSTRAINT [fk_tcwrt_modified]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrt_owned]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_trait]'))
ALTER TABLE [dbo].[taxonomy_cwr_trait]  WITH CHECK ADD  CONSTRAINT [fk_tcwrt_owned] FOREIGN KEY([owned_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrt_owned]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_trait]'))
ALTER TABLE [dbo].[taxonomy_cwr_trait] CHECK CONSTRAINT [fk_tcwrt_owned]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrt_tc]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_trait]'))
ALTER TABLE [dbo].[taxonomy_cwr_trait]  WITH CHECK ADD  CONSTRAINT [fk_tcwrt_tc] FOREIGN KEY([taxonomy_cwr_map_id])
REFERENCES [dbo].[taxonomy_cwr_map] ([taxonomy_cwr_map_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tcwrt_tc]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_cwr_trait]'))
ALTER TABLE [dbo].[taxonomy_cwr_trait] CHECK CONSTRAINT [fk_tcwrt_tc]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_folder_cooperator]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_folder]'))
ALTER TABLE [dbo].[taxonomy_folder]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_folder_cooperator] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_folder_cooperator]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_folder]'))
ALTER TABLE [dbo].[taxonomy_folder] CHECK CONSTRAINT [FK_taxonomy_folder_cooperator]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_folder_item_cooperator]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]'))
ALTER TABLE [dbo].[taxonomy_folder_item_map]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_folder_item_cooperator] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_folder_item_cooperator]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]'))
ALTER TABLE [dbo].[taxonomy_folder_item_map] CHECK CONSTRAINT [FK_taxonomy_folder_item_cooperator]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_folder_item_taxonomy_folder]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]'))
ALTER TABLE [dbo].[taxonomy_folder_item_map]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_folder_item_taxonomy_folder] FOREIGN KEY([taxonomy_folder_id])
REFERENCES [dbo].[taxonomy_folder] ([taxonomy_folder_id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_folder_item_taxonomy_folder]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]'))
ALTER TABLE [dbo].[taxonomy_folder_item_map] CHECK CONSTRAINT [FK_taxonomy_folder_item_taxonomy_folder]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_family]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_family] FOREIGN KEY([primary_family_id])
REFERENCES [dbo].[taxonomy_family] ([taxonomy_family_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_family]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed] CHECK CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_family]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_family1]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_family1] FOREIGN KEY([alternate_family_id_1])
REFERENCES [dbo].[taxonomy_family] ([taxonomy_family_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_family1]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed] CHECK CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_family1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_family2]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_family2] FOREIGN KEY([alternate_family_id_2])
REFERENCES [dbo].[taxonomy_family] ([taxonomy_family_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_family2]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed] CHECK CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_family2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_family3]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_family3] FOREIGN KEY([alternate_family_id_3])
REFERENCES [dbo].[taxonomy_family] ([taxonomy_family_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_family3]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed] CHECK CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_family3]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_genus]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_genus] FOREIGN KEY([taxonomy_genus_id])
REFERENCES [dbo].[taxonomy_genus] ([taxonomy_genus_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_genus]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed] CHECK CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_genus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_ref_upov_crop]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_ref_upov_crop] FOREIGN KEY([taxonomy_upov_crop_id])
REFERENCES [dbo].[taxonomy_ref_upov_crop] ([taxonomy_ref_upov_crop_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_ref_upov_crop]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed] CHECK CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_ref_upov_crop]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_species]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_species] FOREIGN KEY([taxonomy_species_id])
REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_ista_seed_taxonomy_species]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_ista_seed]'))
ALTER TABLE [dbo].[taxonomy_ista_seed] CHECK CONSTRAINT [FK_taxonomy_ista_seed_taxonomy_species]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tr_created]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation]'))
ALTER TABLE [dbo].[taxonomy_regulation]  WITH CHECK ADD  CONSTRAINT [fk_tr_created] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tr_created]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation]'))
ALTER TABLE [dbo].[taxonomy_regulation] CHECK CONSTRAINT [fk_tr_created]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tr_g]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation]'))
ALTER TABLE [dbo].[taxonomy_regulation]  WITH CHECK ADD  CONSTRAINT [fk_tr_g] FOREIGN KEY([geography_id])
REFERENCES [dbo].[geography] ([geography_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tr_g]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation]'))
ALTER TABLE [dbo].[taxonomy_regulation] CHECK CONSTRAINT [fk_tr_g]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tr_modified]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation]'))
ALTER TABLE [dbo].[taxonomy_regulation]  WITH CHECK ADD  CONSTRAINT [fk_tr_modified] FOREIGN KEY([modified_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tr_modified]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation]'))
ALTER TABLE [dbo].[taxonomy_regulation] CHECK CONSTRAINT [fk_tr_modified]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tr_owned]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation]'))
ALTER TABLE [dbo].[taxonomy_regulation]  WITH CHECK ADD  CONSTRAINT [fk_tr_owned] FOREIGN KEY([owned_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_tr_owned]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation]'))
ALTER TABLE [dbo].[taxonomy_regulation] CHECK CONSTRAINT [fk_tr_owned]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_created]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map]  WITH CHECK ADD  CONSTRAINT [fk_trm_created] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_created]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map] CHECK CONSTRAINT [fk_trm_created]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_modified]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map]  WITH CHECK ADD  CONSTRAINT [fk_trm_modified] FOREIGN KEY([modified_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_modified]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map] CHECK CONSTRAINT [fk_trm_modified]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_owned]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map]  WITH CHECK ADD  CONSTRAINT [fk_trm_owned] FOREIGN KEY([owned_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_owned]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map] CHECK CONSTRAINT [fk_trm_owned]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_tf]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map]  WITH CHECK ADD  CONSTRAINT [fk_trm_tf] FOREIGN KEY([taxonomy_family_id])
REFERENCES [dbo].[taxonomy_family] ([taxonomy_family_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_tf]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map] CHECK CONSTRAINT [fk_trm_tf]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_tg]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map]  WITH CHECK ADD  CONSTRAINT [fk_trm_tg] FOREIGN KEY([taxonomy_genus_id])
REFERENCES [dbo].[taxonomy_genus] ([taxonomy_genus_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_tg]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map] CHECK CONSTRAINT [fk_trm_tg]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_tr]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map]  WITH CHECK ADD  CONSTRAINT [fk_trm_tr] FOREIGN KEY([taxonomy_regulation_id])
REFERENCES [dbo].[taxonomy_regulation] ([taxonomy_regulation_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_tr]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map] CHECK CONSTRAINT [fk_trm_tr]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_ts]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map]  WITH CHECK ADD  CONSTRAINT [fk_trm_ts] FOREIGN KEY([taxonomy_species_id])
REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_trm_ts]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_regulation_map]'))
ALTER TABLE [dbo].[taxonomy_regulation_map] CHECK CONSTRAINT [fk_trm_ts]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_upov_crop_map_taxonomy_ref_upov_crop]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_upov_crop_map]'))
ALTER TABLE [dbo].[taxonomy_upov_crop_map]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_upov_crop_map_taxonomy_ref_upov_crop] FOREIGN KEY([taxonomy_upov_crop_id])
REFERENCES [dbo].[taxonomy_ref_upov_crop] ([taxonomy_ref_upov_crop_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_upov_crop_map_taxonomy_ref_upov_crop]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_upov_crop_map]'))
ALTER TABLE [dbo].[taxonomy_upov_crop_map] CHECK CONSTRAINT [FK_taxonomy_upov_crop_map_taxonomy_ref_upov_crop]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_upov_crop_map_taxonomy_species]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_upov_crop_map]'))
ALTER TABLE [dbo].[taxonomy_upov_crop_map]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_upov_crop_map_taxonomy_species] FOREIGN KEY([taxonomy_species_id])
REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_upov_crop_map_taxonomy_species]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_upov_crop_map]'))
ALTER TABLE [dbo].[taxonomy_upov_crop_map] CHECK CONSTRAINT [FK_taxonomy_upov_crop_map_taxonomy_species]
GO
