CREATE TABLE [sys_group] (
    [sys_group_id]  INT             IDENTITY (1, 1) NOT NULL,
    [group_tag]     NVARCHAR (1000) NOT NULL,
    [is_enabled]    NVARCHAR (1)    NOT NULL,
    [created_date]  DATETIME2 (7)   NOT NULL,
    [created_by]    INT             NOT NULL,
    [modified_date] DATETIME2 (7)   NULL,
    [modified_by]   INT             NULL,
    [owned_date]    DATETIME2 (7)   NOT NULL,
    [owned_by]      INT             NOT NULL,
    CONSTRAINT [PK_sys_group] PRIMARY KEY CLUSTERED ([sys_group_id] ASC),
    CONSTRAINT [ndx_fk_sg_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sg_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sg_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
GRANT DELETE
    ON OBJECT::[sys_group] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_group] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_group] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_group] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_group] TO [gg_search]
    AS [dbo];

