CREATE TABLE [web_help] (
    [web_help_id]    INT            IDENTITY (1, 1) NOT NULL,
    [sys_lang_id]    INT            NOT NULL,
    [web_help_tag]   NVARCHAR (100) NULL,
    [virtual_path]   NVARCHAR (255) NULL,
    [heading]        NVARCHAR (50)  NULL,
    [title]          NVARCHAR (50)  NULL,
    [help_text_html] NVARCHAR (MAX) NULL,
    [created_date]   DATETIME2 (7)  NOT NULL,
    [created_by]     INT            NOT NULL,
    [modified_date]  DATETIME2 (7)  NULL,
    [modified_by]    INT            NULL,
    [owned_date]     DATETIME2 (7)  NOT NULL,
    [owned_by]       INT            NOT NULL,
    CONSTRAINT [PK_web_help] PRIMARY KEY CLUSTERED ([web_help_id] ASC),
    CONSTRAINT [fk_wh_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_wh_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_wh_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_wh_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [sys_lang] ([sys_lang_id])
);


GO
GRANT DELETE
    ON OBJECT::[web_help] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[web_help] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_help] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[web_help] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_help] TO [gg_search]
    AS [dbo];

