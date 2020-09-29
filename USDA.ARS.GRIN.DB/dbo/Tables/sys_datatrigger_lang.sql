CREATE TABLE [dbo].[sys_datatrigger_lang] (
    [sys_datatrigger_lang_id] INT            IDENTITY (1, 1) NOT NULL,
    [sys_datatrigger_id]      INT            NOT NULL,
    [sys_lang_id]             INT            NOT NULL,
    [title]                   NVARCHAR (500) NOT NULL,
    [description]             NVARCHAR (MAX) NULL,
    [created_date]            DATETIME2 (7)  NOT NULL,
    [created_by]              INT            NOT NULL,
    [modified_date]           DATETIME2 (7)  NULL,
    [modified_by]             INT            NULL,
    [owned_date]              DATETIME2 (7)  NOT NULL,
    [owned_by]                INT            NOT NULL,
    CONSTRAINT [PK_sys_datatrigger_lang] PRIMARY KEY CLUSTERED ([sys_datatrigger_lang_id] ASC),
    CONSTRAINT [fk_sdtl_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sdtl_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sdtl_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sdtl_sdt] FOREIGN KEY ([sys_datatrigger_id]) REFERENCES [dbo].[sys_datatrigger] ([sys_datatrigger_id]),
    CONSTRAINT [fk_sdtl_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [dbo].[sys_lang] ([sys_lang_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sdtl]
    ON [dbo].[sys_datatrigger_lang]([sys_datatrigger_id] ASC, [sys_lang_id] ASC);

