CREATE TABLE [dbo].[sys_dataview] (
    [sys_dataview_id]               INT            IDENTITY (1, 1) NOT NULL,
    [dataview_name]                 NVARCHAR (100) NOT NULL,
    [is_enabled]                    NVARCHAR (1)   NOT NULL,
    [is_readonly]                   NVARCHAR (1)   NOT NULL,
    [category_code]                 NVARCHAR (100) NULL,
    [database_area_code]            NVARCHAR (50)  NULL,
    [database_area_code_sort_order] INT            NULL,
    [is_transform]                  NVARCHAR (1)   NOT NULL,
    [transform_field_for_names]     NVARCHAR (50)  NULL,
    [transform_field_for_captions]  NVARCHAR (50)  NULL,
    [transform_field_for_values]    NVARCHAR (50)  NULL,
    [configuration_options]         NVARCHAR (500) NULL,
    [created_date]                  DATETIME2 (7)  NOT NULL,
    [created_by]                    INT            NOT NULL,
    [modified_date]                 DATETIME2 (7)  NULL,
    [modified_by]                   INT            NULL,
    [owned_date]                    DATETIME2 (7)  NOT NULL,
    [owned_by]                      INT            NOT NULL,
    CONSTRAINT [PK_sys_dataview] PRIMARY KEY CLUSTERED ([sys_dataview_id] ASC),
    CONSTRAINT [fk_sr_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sr_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sr_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sr_created]
    ON [dbo].[sys_dataview]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sr_modified]
    ON [dbo].[sys_dataview]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sr_owned]
    ON [dbo].[sys_dataview]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_dataview]
    ON [dbo].[sys_dataview]([dataview_name] ASC);

