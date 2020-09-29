CREATE TABLE [dbo].[sys_database_migration] (
    [sys_database_migration_id] INT            IDENTITY (1, 1) NOT NULL,
    [migration_number]          INT            NOT NULL,
    [sort_order]                INT            NOT NULL,
    [action_type]               NVARCHAR (50)  NOT NULL,
    [action_up]                 NVARCHAR (MAX) NULL,
    [action_down]               NVARCHAR (MAX) NULL,
    [created_date]              DATETIME2 (7)  NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  NOT NULL,
    [owned_by]                  INT            NOT NULL,
    CONSTRAINT [PK_sys_database_migration] PRIMARY KEY CLUSTERED ([sys_database_migration_id] ASC),
    CONSTRAINT [ndx_fk_sdbm_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sdbm_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sdbm_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sdbm]
    ON [dbo].[sys_database_migration]([migration_number] ASC, [sort_order] ASC);

