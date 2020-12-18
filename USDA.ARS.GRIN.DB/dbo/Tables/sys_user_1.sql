CREATE TABLE [sys_user] (
    [sys_user_id]   INT             IDENTITY (1, 1) NOT NULL,
    [user_name]     NVARCHAR (50)   NOT NULL,
    [password]      NVARCHAR (2000) NOT NULL,
    [is_enabled]    NVARCHAR (1)    NOT NULL,
    [cooperator_id] INT             NULL,
    [created_date]  DATETIME2 (7)   NOT NULL,
    [created_by]    INT             NOT NULL,
    [modified_date] DATETIME2 (7)   NULL,
    [modified_by]   INT             NULL,
    [owned_date]    DATETIME2 (7)   NOT NULL,
    [owned_by]      INT             NOT NULL,
    CONSTRAINT [PK_sys_user] PRIMARY KEY CLUSTERED ([sys_user_id] ASC),
    CONSTRAINT [fk_su_co] FOREIGN KEY ([cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_su_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_su_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_su_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_su_co]
    ON [sys_user]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_su_created]
    ON [sys_user]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_su_modified]
    ON [sys_user]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_su_owned]
    ON [sys_user]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_su_name]
    ON [sys_user]([user_name] ASC);


GO
GRANT DELETE
    ON OBJECT::[sys_user] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_user] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_user] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_user] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_user] TO [gg_search]
    AS [dbo];

