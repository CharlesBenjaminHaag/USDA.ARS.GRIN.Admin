﻿CREATE TABLE [dbo].[sys_permission_lang] (
    [sys_permission_lang_id] INT            IDENTITY (1, 1) NOT NULL,
    [sys_permission_id]      INT            NOT NULL,
    [sys_lang_id]            INT            NOT NULL,
    [title]                  NVARCHAR (500) NOT NULL,
    [description]            NVARCHAR (MAX) NULL,
    [created_date]           DATETIME2 (7)  NOT NULL,
    [created_by]             INT            NOT NULL,
    [modified_date]          DATETIME2 (7)  NULL,
    [modified_by]            INT            NULL,
    [owned_date]             DATETIME2 (7)  NOT NULL,
    [owned_by]               INT            NOT NULL,
    CONSTRAINT [PK_sys_permission_lang] PRIMARY KEY CLUSTERED ([sys_permission_lang_id] ASC),
    CONSTRAINT [fk_spl_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [dbo].[sys_lang] ([sys_lang_id]),
    CONSTRAINT [fk_spl_sp] FOREIGN KEY ([sys_permission_id]) REFERENCES [dbo].[sys_permission] ([sys_permission_id]),
    CONSTRAINT [ndx_fk_spl_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_spl_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_spl_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_spl]
    ON [dbo].[sys_permission_lang]([sys_permission_id] ASC, [sys_lang_id] ASC);

