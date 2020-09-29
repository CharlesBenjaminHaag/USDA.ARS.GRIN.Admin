CREATE TABLE [dbo].[crop_germplasm_committee_meeting] (
    [crop_germplasm_committee_meeting_id] INT           IDENTITY (1, 1) NOT NULL,
    [crop_germplasm_committee_id]         INT           NOT NULL,
    [title]                               NVARCHAR (80) NOT NULL,
    [url]                                 VARCHAR (120) NULL,
    [created_date]                        DATETIME2 (7) NULL,
    [created_by]                          INT           NULL,
    [modified_date]                       DATETIME2 (7) NULL,
    [modified_by]                         INT           NULL,
    CONSTRAINT [PK_crop_germplasm_committee_meeting] PRIMARY KEY CLUSTERED ([crop_germplasm_committee_meeting_id] ASC)
);

