CREATE TABLE [sys_group_lang] (
    [sys_group_lang_id] INT            IDENTITY (1, 1) NOT NULL,
    [sys_group_id]      INT            NOT NULL,
    [sys_lang_id]       INT            NOT NULL,
    [title]             NVARCHAR (500) NOT NULL,
    [description]       NVARCHAR (MAX) NULL,
    [created_date]      DATETIME2 (7)  NOT NULL,
    [created_by]        INT            NOT NULL,
    [modified_date]     DATETIME2 (7)  NULL,
    [modified_by]       INT            NULL,
    [owned_date]        DATETIME2 (7)  NOT NULL,
    [owned_by]          INT            NOT NULL,
    CONSTRAINT [PK_sys_group_lang] PRIMARY KEY CLUSTERED ([sys_group_lang_id] ASC),
    CONSTRAINT [fk_sgl_sg] FOREIGN KEY ([sys_group_id]) REFERENCES [sys_group] ([sys_group_id]),
    CONSTRAINT [fk_sgl_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [sys_lang] ([sys_lang_id]),
    CONSTRAINT [ndx_fk_sgl_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sgl_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sgl_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sgl]
    ON [sys_group_lang]([sys_group_id] ASC, [sys_lang_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[sys_group_lang] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_group_lang] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_group_lang] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_group_lang] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_group_lang] TO [gg_search]
    AS [dbo];

