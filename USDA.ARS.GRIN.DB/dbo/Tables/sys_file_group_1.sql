CREATE TABLE [sys_file_group] (
    [sys_file_group_id] INT            IDENTITY (1, 1) NOT NULL,
    [group_name]        NVARCHAR (100) NOT NULL,
    [version_name]      NVARCHAR (50)  NOT NULL,
    [is_enabled]        NVARCHAR (1)   NOT NULL,
    [created_date]      DATETIME2 (7)  NOT NULL,
    [created_by]        INT            NOT NULL,
    [modified_date]     DATETIME2 (7)  NULL,
    [modified_by]       INT            NULL,
    [owned_date]        DATETIME2 (7)  NOT NULL,
    [owned_by]          INT            NOT NULL,
    CONSTRAINT [PK_sys_file_group] PRIMARY KEY CLUSTERED ([sys_file_group_id] ASC),
    CONSTRAINT [ndx_fk_sfg_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sfg_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sfg_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sfg]
    ON [sys_file_group]([group_name] ASC);


GO
GRANT DELETE
    ON OBJECT::[sys_file_group] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_file_group] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_file_group] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_file_group] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_file_group] TO [gg_search]
    AS [dbo];

