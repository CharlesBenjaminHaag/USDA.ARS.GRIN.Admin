CREATE TABLE [dbo].[sys_group_user_map] (
    [sys_group_user_map_id] INT           IDENTITY (1, 1) NOT NULL,
    [sys_group_id]          INT           NOT NULL,
    [sys_user_id]           INT           NOT NULL,
    [created_date]          DATETIME2 (7) NOT NULL,
    [created_by]            INT           NOT NULL,
    [modified_date]         DATETIME2 (7) NULL,
    [modified_by]           INT           NULL,
    [owned_date]            DATETIME2 (7) NOT NULL,
    [owned_by]              INT           NOT NULL,
    CONSTRAINT [PK_sys_group_user_map] PRIMARY KEY CLUSTERED ([sys_group_user_map_id] ASC),
    CONSTRAINT [fk_sgum_sg] FOREIGN KEY ([sys_group_id]) REFERENCES [dbo].[sys_group] ([sys_group_id]),
    CONSTRAINT [fk_sgum_su] FOREIGN KEY ([sys_user_id]) REFERENCES [dbo].[sys_user] ([sys_user_id]),
    CONSTRAINT [ndx_fk_sgum_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sgum_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_sgum_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sgum]
    ON [dbo].[sys_group_user_map]([sys_group_id] ASC, [sys_user_id] ASC);

