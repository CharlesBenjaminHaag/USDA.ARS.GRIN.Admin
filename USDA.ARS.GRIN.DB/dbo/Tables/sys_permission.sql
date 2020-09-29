CREATE TABLE [dbo].[sys_permission] (
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
    CONSTRAINT [fk_sp_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sp_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sp_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sp_sr] FOREIGN KEY ([sys_dataview_id]) REFERENCES [dbo].[sys_dataview] ([sys_dataview_id]),
    CONSTRAINT [fk_sp_st] FOREIGN KEY ([sys_table_id]) REFERENCES [dbo].[sys_table] ([sys_table_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sp_created]
    ON [dbo].[sys_permission]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sp_modified]
    ON [dbo].[sys_permission]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sp_owned]
    ON [dbo].[sys_permission]([owned_by] ASC);

