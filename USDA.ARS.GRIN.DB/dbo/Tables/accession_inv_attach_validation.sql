CREATE TABLE [dbo].[accession_inv_attach_validation] (
    [accession_inv_attach_validation_id] INT           IDENTITY (1, 1) NOT NULL,
    [accession_inv_attach_id]            INT           NOT NULL,
    [created_date]                       DATETIME2 (7) NOT NULL,
    [created_by]                         INT           NOT NULL,
    [image_url_is_valid]                 INT           DEFAULT ((-1)) NULL,
    [image_thumbnail_url_is_valid]       INT           DEFAULT ((-1)) NULL,
    CONSTRAINT [PK_accession_inv_attach_validation] PRIMARY KEY CLUSTERED ([accession_inv_attach_validation_id] ASC),
    CONSTRAINT [FK_accession_inv_attach_validation_accession_inv_attach] FOREIGN KEY ([accession_inv_attach_id]) REFERENCES [dbo].[accession_inv_attach] ([accession_inv_attach_id])
);

