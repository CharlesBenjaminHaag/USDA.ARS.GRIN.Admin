CREATE TABLE [dbo].[sys_user_permission_map] (
    [sys_user_permission_map_id] INT           IDENTITY (1, 1) NOT NULL,
    [sys_user_id]                INT           NOT NULL,
    [sys_permission_id]          INT           NOT NULL,
    [is_enabled]                 NVARCHAR (1)  NOT NULL,
    [created_date]               DATETIME2 (7) NOT NULL,
    [created_by]                 INT           NOT NULL,
    [modified_date]              DATETIME2 (7) NULL,
    [modified_by]                INT           NULL,
    [owned_date]                 DATETIME2 (7) NOT NULL,
    [owned_by]                   INT           NOT NULL,
    CONSTRAINT [PK_sys_user_permission_map] PRIMARY KEY CLUSTERED ([sys_user_permission_map_id] ASC),
    CONSTRAINT [fk_sup_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sup_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sup_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sup_sp] FOREIGN KEY ([sys_permission_id]) REFERENCES [dbo].[sys_permission] ([sys_permission_id]),
    CONSTRAINT [fk_sup_su] FOREIGN KEY ([sys_user_id]) REFERENCES [dbo].[sys_user] ([sys_user_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sup_created]
    ON [dbo].[sys_user_permission_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sup_modified]
    ON [dbo].[sys_user_permission_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sup_owned]
    ON [dbo].[sys_user_permission_map]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sup_sp]
    ON [dbo].[sys_user_permission_map]([sys_permission_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sup_su]
    ON [dbo].[sys_user_permission_map]([sys_user_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sup]
    ON [dbo].[sys_user_permission_map]([sys_permission_id] ASC, [sys_user_id] ASC);

