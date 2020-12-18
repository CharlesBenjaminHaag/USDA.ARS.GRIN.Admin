CREATE TABLE [feedback] (
    [feedback_id]                INT            IDENTITY (1, 1) NOT NULL,
    [title]                      NVARCHAR (100) NOT NULL,
    [start_date]                 DATETIME2 (7)  NOT NULL,
    [end_date]                   DATETIME2 (7)  NOT NULL,
    [is_restricted_by_inventory] NVARCHAR (1)   NOT NULL,
    [created_date]               DATETIME2 (7)  NOT NULL,
    [created_by]                 INT            NOT NULL,
    [modified_date]              DATETIME2 (7)  NULL,
    [modified_by]                INT            NULL,
    [owned_date]                 DATETIME2 (7)  NOT NULL,
    [owned_by]                   INT            NOT NULL,
    CONSTRAINT [PK_feedback] PRIMARY KEY CLUSTERED ([feedback_id] ASC),
    CONSTRAINT [fk_f_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_f_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_f_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_f_created]
    ON [feedback]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_f_modified]
    ON [feedback]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_f_owned]
    ON [feedback]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_f]
    ON [feedback]([title] ASC);


GO
GRANT DELETE
    ON OBJECT::[feedback] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[feedback] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[feedback] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback] TO [gg_search]
    AS [dbo];

