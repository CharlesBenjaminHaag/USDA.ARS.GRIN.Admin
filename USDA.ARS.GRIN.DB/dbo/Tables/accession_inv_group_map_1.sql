CREATE TABLE [accession_inv_group_map] (
    [accession_inv_group_map_id] INT            IDENTITY (1, 1) NOT NULL,
    [inventory_id]               INT            NOT NULL,
    [accession_inv_group_id]     INT            NOT NULL,
    [note]                       NVARCHAR (MAX) NULL,
    [created_date]               DATETIME2 (7)  NOT NULL,
    [created_by]                 INT            NOT NULL,
    [modified_date]              DATETIME2 (7)  NULL,
    [modified_by]                INT            NULL,
    [owned_date]                 DATETIME2 (7)  NOT NULL,
    [owned_by]                   INT            NOT NULL,
    CONSTRAINT [PK_accession_inv_group_map] PRIMARY KEY CLUSTERED ([accession_inv_group_map_id] ASC),
    CONSTRAINT [fk_aigm_aig] FOREIGN KEY ([accession_inv_group_id]) REFERENCES [accession_inv_group] ([accession_inv_group_id]),
    CONSTRAINT [fk_aigm_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aigm_i] FOREIGN KEY ([inventory_id]) REFERENCES [inventory] ([inventory_id]),
    CONSTRAINT [fk_aigm_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aigm_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aigm_ag]
    ON [accession_inv_group_map]([accession_inv_group_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aigm_created]
    ON [accession_inv_group_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aigm_i]
    ON [accession_inv_group_map]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aigm_modified]
    ON [accession_inv_group_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aigm_owned]
    ON [accession_inv_group_map]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_aigm]
    ON [accession_inv_group_map]([inventory_id] ASC, [accession_inv_group_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[accession_inv_group_map] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[accession_inv_group_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_inv_group_map] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[accession_inv_group_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_inv_group_map] TO [gg_search]
    AS [dbo];

