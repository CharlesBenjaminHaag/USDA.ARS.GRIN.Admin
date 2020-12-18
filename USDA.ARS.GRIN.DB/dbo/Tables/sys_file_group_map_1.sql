CREATE TABLE [sys_file_group_map] (
    [sys_file_group_map_id] INT           IDENTITY (1, 1) NOT NULL,
    [sys_file_group_id]     INT           NOT NULL,
    [sys_file_id]           INT           NOT NULL,
    [created_date]          DATETIME2 (7) NOT NULL,
    [created_by]            INT           NOT NULL,
    [modified_date]         DATETIME2 (7) NULL,
    [modified_by]           INT           NULL,
    [owned_date]            DATETIME2 (7) NOT NULL,
    [owned_by]              INT           NOT NULL,
    CONSTRAINT [PK_sys_file_group_map] PRIMARY KEY CLUSTERED ([sys_file_group_map_id] ASC),
    CONSTRAINT [fk_sfgm_sf] FOREIGN KEY ([sys_file_id]) REFERENCES [sys_file] ([sys_file_id]),
    CONSTRAINT [fk_sfgm_sfg] FOREIGN KEY ([sys_file_group_id]) REFERENCES [sys_file_group] ([sys_file_group_id]),
    CONSTRAINT [ndx_fk_sfgm_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sfgm_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sfgm_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_sfgm]
    ON [sys_file_group_map]([sys_file_group_id] ASC, [sys_file_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[sys_file_group_map] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_file_group_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_file_group_map] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_file_group_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_file_group_map] TO [gg_search]
    AS [dbo];

