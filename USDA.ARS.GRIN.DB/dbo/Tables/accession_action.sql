CREATE TABLE [dbo].[accession_action] (
    [accession_action_id] INT            IDENTITY (1, 1) NOT NULL,
    [accession_id]        INT            NOT NULL,
    [action_name_code]    NVARCHAR (20)  NOT NULL,
    [started_date]        DATETIME2 (7)  NULL,
    [started_date_code]   NVARCHAR (20)  NULL,
    [completed_date]      DATETIME2 (7)  NULL,
    [completed_date_code] NVARCHAR (20)  NULL,
    [is_web_visible]      NVARCHAR (1)   NOT NULL,
    [note]                NVARCHAR (MAX) NULL,
    [cooperator_id]       INT            NULL,
    [method_id]           INT            NULL,
    [created_date]        DATETIME2 (7)  NOT NULL,
    [created_by]          INT            NOT NULL,
    [modified_date]       DATETIME2 (7)  NULL,
    [modified_by]         INT            NULL,
    [owned_date]          DATETIME2 (7)  NOT NULL,
    [owned_by]            INT            NOT NULL,
    CONSTRAINT [PK_accession_action] PRIMARY KEY CLUSTERED ([accession_action_id] ASC),
    CONSTRAINT [fk_aa_a] FOREIGN KEY ([accession_id]) REFERENCES [dbo].[accession] ([accession_id]),
    CONSTRAINT [fk_aa_c] FOREIGN KEY ([cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aa_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aa_m] FOREIGN KEY ([method_id]) REFERENCES [dbo].[method] ([method_id]),
    CONSTRAINT [fk_aa_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aa_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aa_a]
    ON [dbo].[accession_action]([accession_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aa_c]
    ON [dbo].[accession_action]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aa_created]
    ON [dbo].[accession_action]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aa_m]
    ON [dbo].[accession_action]([method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aa_modified]
    ON [dbo].[accession_action]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aa_owned]
    ON [dbo].[accession_action]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_aa]
    ON [dbo].[accession_action]([accession_id] ASC, [action_name_code] ASC, [started_date] ASC, [completed_date] ASC);

