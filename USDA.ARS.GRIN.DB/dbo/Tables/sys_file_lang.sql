CREATE TABLE [dbo].[sys_file_lang] (
    [sys_file_lang_id] INT            IDENTITY (1, 1) NOT NULL,
    [sys_file_id]      INT            NOT NULL,
    [sys_lang_id]      INT            NOT NULL,
    [title]            NVARCHAR (500) NOT NULL,
    [description]      NVARCHAR (MAX) NULL,
    [created_date]     DATETIME2 (7)  NOT NULL,
    [created_by]       INT            NOT NULL,
    [modified_date]    DATETIME2 (7)  NULL,
    [modified_by]      INT            NULL,
    [owned_date]       DATETIME2 (7)  NOT NULL,
    [owned_by]         INT            NOT NULL,
    CONSTRAINT [PK_sys_file_lang] PRIMARY KEY CLUSTERED ([sys_file_lang_id] ASC),
    CONSTRAINT [fk_sec_file_lang_sec_file] FOREIGN KEY ([sys_file_id]) REFERENCES [dbo].[sys_file] ([sys_file_id]),
    CONSTRAINT [fk_sfl_sf] FOREIGN KEY ([sys_lang_id]) REFERENCES [dbo].[sys_lang] ([sys_lang_id]),
    CONSTRAINT [ndx_fk_sfl_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sfl_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sfl_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sfl]
    ON [dbo].[sys_file_lang]([sys_file_id] ASC, [sys_lang_id] ASC);

