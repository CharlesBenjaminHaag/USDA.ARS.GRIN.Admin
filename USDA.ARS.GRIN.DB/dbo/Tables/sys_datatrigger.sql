CREATE TABLE [dbo].[sys_datatrigger] (
    [sys_datatrigger_id]         INT            IDENTITY (1, 1) NOT NULL,
    [sys_dataview_id]            INT            NULL,
    [sys_table_id]               INT            NULL,
    [virtual_file_path]          NVARCHAR (255) NULL,
    [assembly_name]              NVARCHAR (255) NOT NULL,
    [fully_qualified_class_name] NVARCHAR (255) NOT NULL,
    [is_enabled]                 NVARCHAR (1)   NOT NULL,
    [is_system]                  NVARCHAR (1)   NOT NULL,
    [sort_order]                 INT            NOT NULL,
    [created_date]               DATETIME2 (7)  NOT NULL,
    [created_by]                 INT            NOT NULL,
    [modified_date]              DATETIME2 (7)  NULL,
    [modified_by]                INT            NULL,
    [owned_date]                 DATETIME2 (7)  NOT NULL,
    [owned_by]                   INT            NOT NULL,
    CONSTRAINT [PK_sys_datatrigger] PRIMARY KEY CLUSTERED ([sys_datatrigger_id] ASC),
    CONSTRAINT [fk_sdt_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sdt_dv] FOREIGN KEY ([sys_dataview_id]) REFERENCES [dbo].[sys_dataview] ([sys_dataview_id]),
    CONSTRAINT [fk_sdt_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sdt_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sdt_st] FOREIGN KEY ([sys_table_id]) REFERENCES [dbo].[sys_table] ([sys_table_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sdt]
    ON [dbo].[sys_datatrigger]([sys_dataview_id] ASC, [sys_table_id] ASC, [fully_qualified_class_name] ASC);

