CREATE TABLE [web_user] (
    [web_user_id]       INT            IDENTITY (1, 1) NOT NULL,
    [user_name]         NVARCHAR (50)  NOT NULL,
    [password]          NVARCHAR (255) NOT NULL,
    [is_enabled]        NVARCHAR (1)   NOT NULL,
    [sys_lang_id]       INT            NOT NULL,
    [last_login_date]   DATETIME2 (7)  NULL,
    [web_cooperator_id] INT            NULL,
    [created_date]      DATETIME2 (7)  NOT NULL,
    [modified_date]     DATETIME2 (7)  NULL,
    CONSTRAINT [PK_web_user] PRIMARY KEY CLUSTERED ([web_user_id] ASC),
    CONSTRAINT [fk_wu_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [sys_lang] ([sys_lang_id]),
    CONSTRAINT [fk_wu_wc] FOREIGN KEY ([web_cooperator_id]) REFERENCES [web_cooperator] ([web_cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_wu]
    ON [web_user]([user_name] ASC);


GO
GRANT DELETE
    ON OBJECT::[web_user] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[web_user] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_user] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[web_user] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_user] TO [gg_search]
    AS [dbo];

