CREATE TABLE [dbo].[crop_germplasm_committee] (
    [crop_germplasm_committee_id]   INT           IDENTITY (1, 1) NOT NULL,
    [crop_germplasm_committee_name] NVARCHAR (80) NOT NULL,
    [roster_url]                    VARCHAR (120) NULL,
    [created_date]                  DATETIME2 (7) NULL,
    [created_by]                    INT           NULL,
    [modified_date]                 DATETIME2 (7) NULL,
    [modified_by]                   INT           NULL,
    CONSTRAINT [PK_crop_germplasm_committee] PRIMARY KEY CLUSTERED ([crop_germplasm_committee_id] ASC)
);

