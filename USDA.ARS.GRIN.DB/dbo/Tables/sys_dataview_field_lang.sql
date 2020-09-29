CREATE TABLE [dbo].[sys_dataview_field_lang] (
    [sys_dataview_field_lang_id] INT            IDENTITY (1, 1) NOT NULL,
    [sys_dataview_field_id]      INT            NOT NULL,
    [sys_lang_id]                INT            NOT NULL,
    [title]                      NVARCHAR (500) NOT NULL,
    [description]                NVARCHAR (MAX) NULL,
    [created_date]               DATETIME2 (7)  NOT NULL,
    [created_by]                 INT            NOT NULL,
    [modified_date]              DATETIME2 (7)  NULL,
    [modified_by]                INT            NULL,
    [owned_date]                 DATETIME2 (7)  NOT NULL,
    [owned_by]                   INT            NOT NULL,
    CONSTRAINT [PK_sys_dataview_field_lang] PRIMARY KEY CLUSTERED ([sys_dataview_field_lang_id] ASC),
    CONSTRAINT [fk_srfl_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_srfl_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_srfl_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_srfl_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [dbo].[sys_lang] ([sys_lang_id]),
    CONSTRAINT [fk_srfl_srf] FOREIGN KEY ([sys_dataview_field_id]) REFERENCES [dbo].[sys_dataview_field] ([sys_dataview_field_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srfl_created]
    ON [dbo].[sys_dataview_field_lang]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srfl_modified]
    ON [dbo].[sys_dataview_field_lang]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srfl_owned]
    ON [dbo].[sys_dataview_field_lang]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srfl_sl]
    ON [dbo].[sys_dataview_field_lang]([sys_lang_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srfl_srf]
    ON [dbo].[sys_dataview_field_lang]([sys_dataview_field_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sdfl]
    ON [dbo].[sys_dataview_field_lang]([sys_dataview_field_id] ASC, [sys_lang_id] ASC);

