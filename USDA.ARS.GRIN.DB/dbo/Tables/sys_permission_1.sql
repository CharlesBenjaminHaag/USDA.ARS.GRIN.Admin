CREATE TABLE [sys_permission] (
    [sys_permission_id] INT             IDENTITY (1, 1) NOT NULL,
    [sys_dataview_id]   INT             NULL,
    [sys_table_id]      INT             NULL,
    [permission_tag]    NVARCHAR (1000) NULL,
    [is_enabled]        NVARCHAR (1)    NOT NULL,
    [create_permission] NVARCHAR (1)    NOT NULL,
    [read_permission]   NVARCHAR (1)    NOT NULL,
    [update_permission] NVARCHAR (1)    NOT NULL,
    [delete_permission] NVARCHAR (1)    NOT NULL,
    [created_date]      DATETIME2 (7)   NOT NULL,
    [created_by]        INT             NOT NULL,
    [modified_date]     DATETIME2 (7)   NULL,
    [modified_by]       INT             NULL,
    [owned_date]        DATETIME2 (7)   NOT NULL,
    [owned_by]          INT             NOT NULL,
    CONSTRAINT [PK_sys_permission] PRIMARY KEY CLUSTERED ([sys_permission_id] ASC),
    CONSTRAINT [fk_sp_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sp_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sp_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sp_sr] FOREIGN KEY ([sys_dataview_id]) REFERENCES [sys_dataview] ([sys_dataview_id]),
    CONSTRAINT [fk_sp_st] FOREIGN KEY ([sys_table_id]) REFERENCES [sys_table] ([sys_table_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sp_created]
    ON [sys_permission]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sp_modified]
    ON [sys_permission]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sp_owned]
    ON [sys_permission]([owned_by] ASC);


GO
GRANT DELETE
    ON OBJECT::[sys_permission] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_permission] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_permission] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_permission] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_permission] TO [gg_search]
    AS [dbo];

