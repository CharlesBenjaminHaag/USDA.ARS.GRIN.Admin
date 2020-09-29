CREATE TABLE [dbo].[sys_group_permission_map] (
    [sys_group_permission_map_id] INT           IDENTITY (1, 1) NOT NULL,
    [sys_group_id]                INT           NOT NULL,
    [sys_permission_id]           INT           NOT NULL,
    [created_date]                DATETIME2 (7) NOT NULL,
    [created_by]                  INT           NOT NULL,
    [modified_date]               DATETIME2 (7) NULL,
    [modified_by]                 INT           NULL,
    [owned_date]                  DATETIME2 (7) NOT NULL,
    [owned_by]                    INT           NOT NULL,
    CONSTRAINT [PK_sys_group_permission_map] PRIMARY KEY CLUSTERED ([sys_group_permission_map_id] ASC),
    CONSTRAINT [fk_sgpm_sg] FOREIGN KEY ([sys_group_id]) REFERENCES [dbo].[sys_group] ([sys_group_id]),
    CONSTRAINT [fk_sgpm_sp] FOREIGN KEY ([sys_permission_id]) REFERENCES [dbo].[sys_permission] ([sys_permission_id]),
    CONSTRAINT [ndx_fk_sgpm_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sgpm_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sgpm_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sgpm]
    ON [dbo].[sys_group_permission_map]([sys_group_id] ASC, [sys_permission_id] ASC);

