CREATE TABLE [web_user_preference] (
    [web_user_preference_id] INT            IDENTITY (1, 1) NOT NULL,
    [web_user_id]            INT            NOT NULL,
    [preference_name]        NVARCHAR (100) NOT NULL,
    [preference_value]       NVARCHAR (100) NOT NULL,
    [created_date]           DATETIME2 (7)  NOT NULL,
    [created_by]             INT            NOT NULL,
    [modified_date]          DATETIME2 (7)  NULL,
    [modified_by]            INT            NULL,
    [owned_date]             DATETIME2 (7)  NOT NULL,
    [owned_by]               INT            NOT NULL,
    CONSTRAINT [PK_web_user_preference] PRIMARY KEY CLUSTERED ([web_user_preference_id] ASC),
    CONSTRAINT [fk_wup_created] FOREIGN KEY ([created_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_wup_modified] FOREIGN KEY ([modified_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_wup_owned] FOREIGN KEY ([owned_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_wup_wu] FOREIGN KEY ([web_user_id]) REFERENCES [web_user] ([web_user_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_wup]
    ON [web_user_preference]([web_user_id] ASC, [preference_name] ASC);


GO
GRANT DELETE
    ON OBJECT::[web_user_preference] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[web_user_preference] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_user_preference] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[web_user_preference] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_user_preference] TO [gg_search]
    AS [dbo];

