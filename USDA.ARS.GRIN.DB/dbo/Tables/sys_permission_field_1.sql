CREATE TABLE [sys_permission_field] (
    [sys_permission_field_id] INT            IDENTITY (1, 1) NOT NULL,
    [sys_permission_id]       INT            NOT NULL,
    [sys_dataview_field_id]   INT            NULL,
    [sys_table_field_id]      INT            NULL,
    [field_type]              NVARCHAR (20)  NULL,
    [compare_operator]        NVARCHAR (20)  NULL,
    [compare_value]           NVARCHAR (MAX) NULL,
    [parent_table_field_id]   INT            NULL,
    [parent_field_type]       NVARCHAR (20)  NULL,
    [parent_compare_operator] NVARCHAR (20)  NULL,
    [parent_compare_value]    NVARCHAR (MAX) NULL,
    [compare_mode]            NVARCHAR (20)  NULL,
    [created_date]            DATETIME2 (7)  NOT NULL,
    [created_by]              INT            NOT NULL,
    [modified_date]           DATETIME2 (7)  NULL,
    [modified_by]             INT            NULL,
    [owned_date]              DATETIME2 (7)  NOT NULL,
    [owned_by]                INT            NOT NULL,
    CONSTRAINT [PK_sys_permission_field] PRIMARY KEY CLUSTERED ([sys_permission_field_id] ASC),
    CONSTRAINT [fk_sp_srf] FOREIGN KEY ([sys_dataview_field_id]) REFERENCES [sys_dataview_field] ([sys_dataview_field_id]),
    CONSTRAINT [fk_sp_stf] FOREIGN KEY ([sys_table_field_id]) REFERENCES [sys_table_field] ([sys_table_field_id]),
    CONSTRAINT [fk_spf_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_spf_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_spf_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_spf_sp] FOREIGN KEY ([sys_permission_id]) REFERENCES [sys_permission] ([sys_permission_id]),
    CONSTRAINT [fk_spf_stf] FOREIGN KEY ([parent_table_field_id]) REFERENCES [sys_table_field] ([sys_table_field_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_spf]
    ON [sys_permission_field]([sys_permission_id] ASC, [sys_dataview_field_id] ASC, [sys_table_field_id] ASC, [compare_mode] ASC, [compare_operator] ASC, [parent_compare_operator] ASC);


GO
GRANT DELETE
    ON OBJECT::[sys_permission_field] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_permission_field] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_permission_field] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_permission_field] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_permission_field] TO [gg_search]
    AS [dbo];

