CREATE TABLE [dbo].[accession_inv_group_map] (
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
    CONSTRAINT [fk_aigm_aig] FOREIGN KEY ([accession_inv_group_id]) REFERENCES [dbo].[accession_inv_group] ([accession_inv_group_id]),
    CONSTRAINT [fk_aigm_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aigm_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_aigm_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aigm_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aigm_ag]
    ON [dbo].[accession_inv_group_map]([accession_inv_group_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aigm_created]
    ON [dbo].[accession_inv_group_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aigm_i]
    ON [dbo].[accession_inv_group_map]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aigm_modified]
    ON [dbo].[accession_inv_group_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aigm_owned]
    ON [dbo].[accession_inv_group_map]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_aigm]
    ON [dbo].[accession_inv_group_map]([inventory_id] ASC, [accession_inv_group_id] ASC);

