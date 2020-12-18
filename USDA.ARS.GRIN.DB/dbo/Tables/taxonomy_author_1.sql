CREATE TABLE [taxonomy_author] (
    [taxonomy_author_id]            INT            IDENTITY (1, 1) NOT NULL,
    [short_name]                    NVARCHAR (30)  NOT NULL,
    [full_name]                     NVARCHAR (100) NOT NULL,
    [short_name_expanded_diacritic] NVARCHAR (30)  NULL,
    [full_name_expanded_diacritic]  NVARCHAR (100) NULL,
    [note]                          NVARCHAR (MAX) NULL,
    [created_date]                  DATETIME2 (7)  NOT NULL,
    [created_by]                    INT            NOT NULL,
    [modified_date]                 DATETIME2 (7)  NULL,
    [modified_by]                   INT            NULL,
    [owned_date]                    DATETIME2 (7)  NOT NULL,
    [owned_by]                      INT            NOT NULL,
    CONSTRAINT [PK_taxonomy_author] PRIMARY KEY CLUSTERED ([taxonomy_author_id] ASC),
    CONSTRAINT [fk_ta_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ta_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ta_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ta_created]
    ON [taxonomy_author]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ta_modified]
    ON [taxonomy_author]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ta_owned]
    ON [taxonomy_author]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_ta_name]
    ON [taxonomy_author]([short_name_expanded_diacritic] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ta]
    ON [taxonomy_author]([short_name] ASC);


GO
GRANT DELETE
    ON OBJECT::[taxonomy_author] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[taxonomy_author] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[taxonomy_author] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[taxonomy_author] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[taxonomy_author] TO [gg_search]
    AS [dbo];

