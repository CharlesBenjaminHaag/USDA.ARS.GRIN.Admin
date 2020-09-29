CREATE TABLE [dbo].[sys_table_field] (
    [sys_table_field_id]         INT            IDENTITY (1, 1) NOT NULL,
    [sys_table_id]               INT            NOT NULL,
    [field_name]                 NVARCHAR (50)  NOT NULL,
    [field_ordinal]              INT            NULL,
    [field_purpose]              NVARCHAR (50)  NOT NULL,
    [field_type]                 NVARCHAR (50)  NOT NULL,
    [default_value]              NVARCHAR (50)  NULL,
    [is_primary_key]             NVARCHAR (1)   NOT NULL,
    [is_foreign_key]             NVARCHAR (1)   NOT NULL,
    [foreign_key_table_field_id] INT            NULL,
    [foreign_key_dataview_name]  NVARCHAR (100) NULL,
    [is_nullable]                NVARCHAR (1)   NOT NULL,
    [gui_hint]                   NVARCHAR (50)  NOT NULL,
    [is_readonly]                NVARCHAR (1)   NOT NULL,
    [min_length]                 INT            NOT NULL,
    [max_length]                 INT            NOT NULL,
    [numeric_precision]          INT            NOT NULL,
    [numeric_scale]              INT            NOT NULL,
    [is_autoincrement]           NVARCHAR (1)   NOT NULL,
    [group_name]                 NVARCHAR (100) NULL,
    [created_date]               DATETIME2 (7)  NOT NULL,
    [created_by]                 INT            NOT NULL,
    [modified_date]              DATETIME2 (7)  NULL,
    [modified_by]                INT            NULL,
    [owned_date]                 DATETIME2 (7)  NOT NULL,
    [owned_by]                   INT            NOT NULL,
    CONSTRAINT [PK_sys_table_field] PRIMARY KEY CLUSTERED ([sys_table_field_id] ASC),
    CONSTRAINT [fk_stf_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_stf_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_stf_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_stf_st] FOREIGN KEY ([sys_table_id]) REFERENCES [dbo].[sys_table] ([sys_table_id]),
    CONSTRAINT [fk_stf_stffk] FOREIGN KEY ([foreign_key_table_field_id]) REFERENCES [dbo].[sys_table_field] ([sys_table_field_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_stf_cdgrp]
    ON [dbo].[sys_table_field]([group_name] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_stf_created]
    ON [dbo].[sys_table_field]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_stf_modified]
    ON [dbo].[sys_table_field]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_stf_owned]
    ON [dbo].[sys_table_field]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_stf_st]
    ON [dbo].[sys_table_field]([sys_table_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_stf]
    ON [dbo].[sys_table_field]([sys_table_id] ASC, [field_name] ASC);

