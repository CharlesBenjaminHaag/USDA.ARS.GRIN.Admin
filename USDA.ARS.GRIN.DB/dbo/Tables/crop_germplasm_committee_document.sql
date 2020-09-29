CREATE TABLE [dbo].[crop_germplasm_committee_document] (
    [crop_germplasm_committee_document_id] INT            IDENTITY (1, 1) NOT NULL,
    [crop_germplasm_committee_id]          INT            NULL,
    [url]                                  NVARCHAR (120) NOT NULL,
    [created_date]                         DATETIME2 (7)  CONSTRAINT [DF_crop_germplasm_committee_document_created_date] DEFAULT (getdate()) NULL,
    [created_by]                           INT            NULL,
    [modified_date]                        DATETIME2 (7)  CONSTRAINT [DF_crop_germplasm_committee_document_modified_date] DEFAULT (getdate()) NULL,
    [modified_by]                          INT            NULL,
    [title]                                VARCHAR (250)  NULL,
    CONSTRAINT [PK_document] PRIMARY KEY CLUSTERED ([crop_germplasm_committee_document_id] ASC)
);

