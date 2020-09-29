CREATE TABLE [dbo].[accession_ipr] (
    [accession_ipr_id] INT             IDENTITY (1, 1) NOT NULL,
    [accession_id]     INT             NOT NULL,
    [type_code]        NVARCHAR (20)   NOT NULL,
    [ipr_number]       NVARCHAR (50)   NULL,
    [ipr_crop_name]    NVARCHAR (100)  NULL,
    [ipr_full_name]    NVARCHAR (2000) NULL,
    [issued_date]      DATETIME2 (7)   NULL,
    [expired_date]     DATETIME2 (7)   NULL,
    [cooperator_id]    INT             NULL,
    [note]             NVARCHAR (MAX)  NULL,
    [accepted_date]    DATETIME2 (7)   NULL,
    [expected_date]    DATETIME2 (7)   NULL,
    [created_date]     DATETIME2 (7)   NOT NULL,
    [created_by]       INT             NOT NULL,
    [modified_date]    DATETIME2 (7)   NULL,
    [modified_by]      INT             NULL,
    [owned_date]       DATETIME2 (7)   NOT NULL,
    [owned_by]         INT             NOT NULL,
    CONSTRAINT [PK_accession_ipr] PRIMARY KEY CLUSTERED ([accession_ipr_id] ASC),
    CONSTRAINT [fk_ar_a] FOREIGN KEY ([accession_id]) REFERENCES [dbo].[accession] ([accession_id]),
    CONSTRAINT [fk_ar_c] FOREIGN KEY ([cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ar_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ar_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ar_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ar_a]
    ON [dbo].[accession_ipr]([accession_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ar_c]
    ON [dbo].[accession_ipr]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ar_created]
    ON [dbo].[accession_ipr]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ar_modified]
    ON [dbo].[accession_ipr]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ar_owned]
    ON [dbo].[accession_ipr]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_ipr_crop]
    ON [dbo].[accession_ipr]([ipr_crop_name] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_ipr_number]
    ON [dbo].[accession_ipr]([ipr_number] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ipr]
    ON [dbo].[accession_ipr]([accession_id] ASC, [type_code] ASC, [ipr_number] ASC);

