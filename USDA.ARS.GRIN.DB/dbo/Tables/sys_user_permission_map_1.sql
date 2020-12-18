CREATE TABLE [sys_user_permission_map] (
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
    CONSTRAINT [fk_sup_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sup_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sup_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sup_sp] FOREIGN KEY ([sys_permission_id]) REFERENCES [sys_permission] ([sys_permission_id]),
    CONSTRAINT [fk_sup_su] FOREIGN KEY ([sys_user_id]) REFERENCES [sys_user] ([sys_user_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sup_created]
    ON [sys_user_permission_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sup_modified]
    ON [sys_user_permission_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sup_owned]
    ON [sys_user_permission_map]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sup_sp]
    ON [sys_user_permission_map]([sys_permission_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sup_su]
    ON [sys_user_permission_map]([sys_user_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sup]
    ON [sys_user_permission_map]([sys_permission_id] ASC, [sys_user_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[sys_user_permission_map] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_user_permission_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_user_permission_map] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_user_permission_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_user_permission_map] TO [gg_search]
    AS [dbo];

