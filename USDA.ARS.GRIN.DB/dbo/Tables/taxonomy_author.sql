CREATE TABLE [dbo].[taxonomy_author] (
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
    CONSTRAINT [fk_ta_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ta_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ta_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ta_created]
    ON [dbo].[taxonomy_author]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ta_modified]
    ON [dbo].[taxonomy_author]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ta_owned]
    ON [dbo].[taxonomy_author]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_ta_name]
    ON [dbo].[taxonomy_author]([short_name_expanded_diacritic] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ta]
    ON [dbo].[taxonomy_author]([short_name] ASC);

