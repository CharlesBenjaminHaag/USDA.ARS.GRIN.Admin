CREATE TABLE [dbo].[sys_search_autofield] (
    [sys_search_autofield_id] INT           IDENTITY (1, 1) NOT NULL,
    [sys_table_field_id]      INT           NOT NULL,
    [created_date]            DATETIME2 (7) NOT NULL,
    [created_by]              INT           NOT NULL,
    [modified_date]           DATETIME2 (7) NULL,
    [modified_by]             INT           NULL,
    [owned_date]              DATETIME2 (7) NOT NULL,
    [owned_by]                INT           NOT NULL,
    CONSTRAINT [PK_sys_search_autofield] PRIMARY KEY CLUSTERED ([sys_search_autofield_id] ASC),
    CONSTRAINT [fk_ssa_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ssa_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ssa_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ssa_stf] FOREIGN KEY ([sys_table_field_id]) REFERENCES [dbo].[sys_table_field] ([sys_table_field_id])
);

