CREATE TABLE [dbo].[sys_database_migration_lang] (
    [sys_database_migration_lang_id] INT            IDENTITY (1, 1) NOT NULL,
    [sys_database_migration_id]      INT            NOT NULL,
    [language_iso_639_3_code]        NVARCHAR (5)   NOT NULL,
    [title]                          NVARCHAR (500) NOT NULL,
    [description]                    NVARCHAR (MAX) NULL,
    [created_date]                   DATETIME2 (7)  NOT NULL,
    [created_by]                     INT            NOT NULL,
    [modified_date]                  DATETIME2 (7)  NULL,
    [modified_by]                    INT            NULL,
    [owned_date]                     DATETIME2 (7)  NOT NULL,
    [owned_by]                       INT            NOT NULL,
    CONSTRAINT [PK_sys_database_migration_lang] PRIMARY KEY CLUSTERED ([sys_database_migration_lang_id] ASC),
    CONSTRAINT [fk_sdbml_sdbm] FOREIGN KEY ([sys_database_migration_id]) REFERENCES [dbo].[sys_database_migration] ([sys_database_migration_id]),
    CONSTRAINT [ndx_fk_sdbml_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sdbml_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sdbml_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sdbml]
    ON [dbo].[sys_database_migration_lang]([sys_database_migration_id] ASC, [language_iso_639_3_code] ASC);

