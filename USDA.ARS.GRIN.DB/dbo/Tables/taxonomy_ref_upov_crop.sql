CREATE TABLE [dbo].[taxonomy_ref_upov_crop] (
    [taxonomy_ref_upov_crop_id] INT            IDENTITY (1, 1) NOT NULL,
    [upov_code]                 NVARCHAR (20)  NOT NULL,
    [url]                       NVARCHAR (250) NULL,
    [created_date]              DATETIME2 (7)  CONSTRAINT [DF_taxonomy_ref_upov_crop_created_date] DEFAULT (getdate()) NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  CONSTRAINT [DF_taxonomy_ref_upov_crop_modified_date] DEFAULT (getdate()) NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  CONSTRAINT [DF_taxonomy_ref_upov_crop_owned_date] DEFAULT (getdate()) NOT NULL,
    [owned_by]                  INT            NOT NULL,
    [upov_crop_id]              INT            NULL,
    CONSTRAINT [PK_taxonomy_ref_upov_crop] PRIMARY KEY CLUSTERED ([taxonomy_ref_upov_crop_id] ASC)
);

