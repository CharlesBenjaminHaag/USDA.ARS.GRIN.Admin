CREATE TABLE [accession_ipr] (
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
    CONSTRAINT [fk_ar_a] FOREIGN KEY ([accession_id]) REFERENCES [accession] ([accession_id]),
    CONSTRAINT [fk_ar_c] FOREIGN KEY ([cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ar_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ar_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ar_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ar_a]
    ON [accession_ipr]([accession_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ar_c]
    ON [accession_ipr]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ar_created]
    ON [accession_ipr]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ar_modified]
    ON [accession_ipr]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ar_owned]
    ON [accession_ipr]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_ipr_crop]
    ON [accession_ipr]([ipr_crop_name] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_ipr_number]
    ON [accession_ipr]([ipr_number] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ipr]
    ON [accession_ipr]([accession_id] ASC, [type_code] ASC, [ipr_number] ASC);


GO
GRANT DELETE
    ON OBJECT::[accession_ipr] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[accession_ipr] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_ipr] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[accession_ipr] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_ipr] TO [gg_search]
    AS [dbo];

