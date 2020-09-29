CREATE TABLE [dbo].[sys_database] (
    [sys_database_id]  INT           IDENTITY (1, 1) NOT NULL,
    [migration_number] INT           NOT NULL,
    [created_date]     DATETIME2 (7) NOT NULL,
    [created_by]       INT           NOT NULL,
    [modified_date]    DATETIME2 (7) NULL,
    [modified_by]      INT           NULL,
    [owned_date]       DATETIME2 (7) NOT NULL,
    [owned_by]         INT           NOT NULL,
    CONSTRAINT [PK_sys_database] PRIMARY KEY CLUSTERED ([sys_database_id] ASC),
    CONSTRAINT [ndx_fk_sdb_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sdb_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sdb_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sdb]
    ON [dbo].[sys_database]([migration_number] ASC);

