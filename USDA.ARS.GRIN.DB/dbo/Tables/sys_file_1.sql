CREATE TABLE [sys_file] (
    [sys_file_id]       INT            IDENTITY (1, 1) NOT NULL,
    [is_enabled]        NVARCHAR (1)   NOT NULL,
    [virtual_file_path] NVARCHAR (255) NOT NULL,
    [file_name]         NVARCHAR (255) NULL,
    [file_version]      NVARCHAR (255) NULL,
    [file_size]         DECIMAL (18)   NULL,
    [display_name]      NVARCHAR (255) NULL,
    [created_date]      DATETIME2 (7)  NOT NULL,
    [created_by]        INT            NOT NULL,
    [modified_date]     DATETIME2 (7)  NULL,
    [modified_by]       INT            NULL,
    [owned_date]        DATETIME2 (7)  NOT NULL,
    [owned_by]          INT            NOT NULL,
    CONSTRAINT [PK_sys_file] PRIMARY KEY CLUSTERED ([sys_file_id] ASC),
    CONSTRAINT [ndx_fk_sf_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sf_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sf_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sf]
    ON [sys_file]([virtual_file_path] ASC);


GO
GRANT DELETE
    ON OBJECT::[sys_file] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_file] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_file] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_file] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_file] TO [gg_search]
    AS [dbo];

