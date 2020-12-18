CREATE TABLE [sys_dataview_field] (
    [sys_dataview_field_id]     INT            IDENTITY (1, 1) NOT NULL,
    [sys_dataview_id]           INT            NOT NULL,
    [field_name]                NVARCHAR (50)  NOT NULL,
    [sys_table_field_id]        INT            NULL,
    [is_readonly]               NVARCHAR (1)   NOT NULL,
    [is_primary_key]            NVARCHAR (1)   NOT NULL,
    [is_transform]              NVARCHAR (1)   NOT NULL,
    [sort_order]                INT            NOT NULL,
    [gui_hint]                  NVARCHAR (100) NULL,
    [foreign_key_dataview_name] NVARCHAR (50)  NULL,
    [group_name]                NVARCHAR (100) NULL,
    [table_alias_name]          NVARCHAR (100) NULL,
    [is_visible]                NVARCHAR (1)   NOT NULL,
    [configuration_options]     NVARCHAR (500) NULL,
    [created_date]              DATETIME2 (7)  NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  NOT NULL,
    [owned_by]                  INT            NOT NULL,
    CONSTRAINT [PK_sys_dataview_field] PRIMARY KEY CLUSTERED ([sys_dataview_field_id] ASC),
    CONSTRAINT [fk_srf_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_srf_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_srf_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_srf_sr] FOREIGN KEY ([sys_dataview_id]) REFERENCES [sys_dataview] ([sys_dataview_id]),
    CONSTRAINT [fk_srf_stf] FOREIGN KEY ([sys_table_field_id]) REFERENCES [sys_table_field] ([sys_table_field_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srf_created]
    ON [sys_dataview_field]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srf_modified]
    ON [sys_dataview_field]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srf_owned]
    ON [sys_dataview_field]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srf_sr]
    ON [sys_dataview_field]([sys_dataview_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srf_stf]
    ON [sys_dataview_field]([sys_table_field_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sdf]
    ON [sys_dataview_field]([sys_dataview_id] ASC, [field_name] ASC);


GO
GRANT DELETE
    ON OBJECT::[sys_dataview_field] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_dataview_field] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_dataview_field] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_dataview_field] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_dataview_field] TO [gg_search]
    AS [dbo];

