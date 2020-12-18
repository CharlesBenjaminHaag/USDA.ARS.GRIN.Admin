CREATE TABLE [sys_index_field] (
    [sys_index_field_id] INT           IDENTITY (1, 1) NOT NULL,
    [sys_index_id]       INT           NOT NULL,
    [sys_table_field_id] INT           NOT NULL,
    [sort_order]         INT           NOT NULL,
    [created_date]       DATETIME2 (7) NOT NULL,
    [created_by]         INT           NOT NULL,
    [modified_date]      DATETIME2 (7) NULL,
    [modified_by]        INT           NULL,
    [owned_date]         DATETIME2 (7) NOT NULL,
    [owned_by]           INT           NOT NULL,
    CONSTRAINT [PK_sys_index_field] PRIMARY KEY CLUSTERED ([sys_index_field_id] ASC),
    CONSTRAINT [fk_sif_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sif_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sif_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sif_si] FOREIGN KEY ([sys_index_id]) REFERENCES [sys_index] ([sys_index_id]),
    CONSTRAINT [fk_sif_stf] FOREIGN KEY ([sys_table_field_id]) REFERENCES [sys_table_field] ([sys_table_field_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sif_created]
    ON [sys_index_field]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sif_modified]
    ON [sys_index_field]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sif_owned]
    ON [sys_index_field]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sif_si]
    ON [sys_index_field]([sys_index_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sif_stf]
    ON [sys_index_field]([sys_table_field_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sif]
    ON [sys_index_field]([sys_index_id] ASC, [sys_index_field_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[sys_index_field] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_index_field] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_index_field] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_index_field] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_index_field] TO [gg_search]
    AS [dbo];

