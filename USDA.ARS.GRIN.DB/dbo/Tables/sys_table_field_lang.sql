CREATE TABLE [dbo].[sys_table_field_lang] (
    [sys_table_field_lang_id] INT            IDENTITY (1, 1) NOT NULL,
    [sys_table_field_id]      INT            NOT NULL,
    [sys_lang_id]             INT            NOT NULL,
    [title]                   NVARCHAR (500) NOT NULL,
    [description]             NVARCHAR (MAX) NULL,
    [created_date]            DATETIME2 (7)  NOT NULL,
    [created_by]              INT            NOT NULL,
    [modified_date]           DATETIME2 (7)  NULL,
    [modified_by]             INT            NULL,
    [owned_date]              DATETIME2 (7)  NOT NULL,
    [owned_by]                INT            NOT NULL,
    CONSTRAINT [PK_sys_table_field_lang] PRIMARY KEY CLUSTERED ([sys_table_field_lang_id] ASC),
    CONSTRAINT [fk_stfl_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_stfl_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_stfl_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_stfl_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [dbo].[sys_lang] ([sys_lang_id]),
    CONSTRAINT [fk_stfl_stf] FOREIGN KEY ([sys_table_field_id]) REFERENCES [dbo].[sys_table_field] ([sys_table_field_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndk_uniq_stfl]
    ON [dbo].[sys_table_field_lang]([sys_table_field_id] ASC, [sys_lang_id] ASC);

