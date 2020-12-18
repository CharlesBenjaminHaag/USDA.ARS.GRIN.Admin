CREATE TABLE [crop] (
    [crop_id]       INT            IDENTITY (1, 1) NOT NULL,
    [name]          NVARCHAR (20)  NOT NULL,
    [note]          NVARCHAR (MAX) NULL,
    [created_date]  DATETIME2 (7)  NOT NULL,
    [created_by]    INT            NOT NULL,
    [modified_date] DATETIME2 (7)  NULL,
    [modified_by]   INT            NULL,
    [owned_date]    DATETIME2 (7)  NOT NULL,
    [owned_by]      INT            NOT NULL,
    CONSTRAINT [PK_crop] PRIMARY KEY CLUSTERED ([crop_id] ASC),
    CONSTRAINT [fk_cr_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cr_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cr_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cr_created]
    ON [crop]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cr_modified]
    ON [crop]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cr_owned]
    ON [crop]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_crop]
    ON [crop]([name] ASC);


GO
GRANT DELETE
    ON OBJECT::[crop] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[crop] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[crop] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[crop] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[crop] TO [gg_search]
    AS [dbo];

