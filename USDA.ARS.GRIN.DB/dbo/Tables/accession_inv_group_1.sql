CREATE TABLE [accession_inv_group] (
    [accession_inv_group_id] INT            IDENTITY (1, 1) NOT NULL,
    [group_name]             NVARCHAR (100) NOT NULL,
    [method_id]              INT            NULL,
    [is_web_visible]         NVARCHAR (1)   CONSTRAINT [DF__accession__is_we__09DE7BCC] DEFAULT ('N') NOT NULL,
    [note]                   NVARCHAR (MAX) NULL,
    [created_date]           DATETIME2 (7)  NOT NULL,
    [created_by]             INT            NOT NULL,
    [modified_date]          DATETIME2 (7)  NULL,
    [modified_by]            INT            NULL,
    [owned_date]             DATETIME2 (7)  NOT NULL,
    [owned_by]               INT            NOT NULL,
    CONSTRAINT [PK_accession_inv_group] PRIMARY KEY CLUSTERED ([accession_inv_group_id] ASC),
    CONSTRAINT [fk_aig_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aig_m] FOREIGN KEY ([method_id]) REFERENCES [method] ([method_id]),
    CONSTRAINT [fk_aig_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aig_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aig_created]
    ON [accession_inv_group]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aig_modified]
    ON [accession_inv_group]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aig_owned]
    ON [accession_inv_group]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_aig]
    ON [accession_inv_group]([group_name] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aig_m]
    ON [accession_inv_group]([method_id] ASC);


GO
GRANT SELECT
    ON OBJECT::[accession_inv_group] TO [gg_search]
    AS [dbo];

