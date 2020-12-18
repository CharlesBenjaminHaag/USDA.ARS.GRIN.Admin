CREATE TABLE [sys_lang] (
    [sys_lang_id]      INT            IDENTITY (1, 1) NOT NULL,
    [iso_639_3_tag]    NVARCHAR (5)   NOT NULL,
    [ietf_tag]         NVARCHAR (30)  NOT NULL,
    [script_direction] NVARCHAR (3)   NULL,
    [title]            NVARCHAR (500) NOT NULL,
    [description]      NVARCHAR (MAX) NULL,
    [created_date]     DATETIME2 (7)  NOT NULL,
    [created_by]       INT            NOT NULL,
    [modified_date]    DATETIME2 (7)  NULL,
    [modified_by]      INT            NULL,
    [owned_date]       DATETIME2 (7)  NOT NULL,
    [owned_by]         INT            NOT NULL,
    CONSTRAINT [PK_sys_lang] PRIMARY KEY CLUSTERED ([sys_lang_id] ASC),
    CONSTRAINT [fk_sl_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sl_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sl_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sl_created]
    ON [sys_lang]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sl_modified]
    ON [sys_lang]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sl_owned]
    ON [sys_lang]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sl_tag]
    ON [sys_lang]([ietf_tag] ASC);


GO
GRANT DELETE
    ON OBJECT::[sys_lang] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_lang] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_lang] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_lang] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_lang] TO [gg_search]
    AS [dbo];

