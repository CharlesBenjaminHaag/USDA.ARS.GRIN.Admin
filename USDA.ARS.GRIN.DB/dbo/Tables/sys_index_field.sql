CREATE TABLE [dbo].[sys_index_field] (
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
    CONSTRAINT [fk_sif_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sif_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sif_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sif_si] FOREIGN KEY ([sys_index_id]) REFERENCES [dbo].[sys_index] ([sys_index_id]),
    CONSTRAINT [fk_sif_stf] FOREIGN KEY ([sys_table_field_id]) REFERENCES [dbo].[sys_table_field] ([sys_table_field_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sif_created]
    ON [dbo].[sys_index_field]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sif_modified]
    ON [dbo].[sys_index_field]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sif_owned]
    ON [dbo].[sys_index_field]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sif_si]
    ON [dbo].[sys_index_field]([sys_index_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sif_stf]
    ON [dbo].[sys_index_field]([sys_table_field_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sif]
    ON [dbo].[sys_index_field]([sys_index_id] ASC, [sys_index_field_id] ASC);

