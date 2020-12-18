CREATE TABLE [cooperator_group] (
    [cooperator_group_id] INT             IDENTITY (1, 1) NOT NULL,
    [name]                NVARCHAR (60)   NOT NULL,
    [is_group_active]     NVARCHAR (1)    NOT NULL,
    [site_id]             INT             NULL,
    [category_code]       NVARCHAR (20)   NULL,
    [group_tag]           NVARCHAR (1000) NULL,
    [note]                NVARCHAR (MAX)  NULL,
    [created_date]        DATETIME2 (7)   NOT NULL,
    [created_by]          INT             NOT NULL,
    [modified_date]       DATETIME2 (7)   NULL,
    [modified_by]         INT             NULL,
    [owned_date]          DATETIME2 (7)   NOT NULL,
    [owned_by]            INT             NOT NULL,
    CONSTRAINT [PK_cooperator_group] PRIMARY KEY CLUSTERED ([cooperator_group_id] ASC),
    CONSTRAINT [fk_cg_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cg_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cg_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cg_s] FOREIGN KEY ([site_id]) REFERENCES [site] ([site_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cg_created]
    ON [cooperator_group]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cg_modified]
    ON [cooperator_group]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cg_owned]
    ON [cooperator_group]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_cg_name]
    ON [cooperator_group]([name] ASC);


GO
GRANT DELETE
    ON OBJECT::[cooperator_group] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[cooperator_group] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[cooperator_group] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[cooperator_group] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[cooperator_group] TO [gg_search]
    AS [dbo];

