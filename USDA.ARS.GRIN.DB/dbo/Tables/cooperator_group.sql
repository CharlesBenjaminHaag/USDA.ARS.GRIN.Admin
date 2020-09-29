CREATE TABLE [dbo].[cooperator_group] (
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
    CONSTRAINT [fk_cg_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cg_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cg_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cg_s] FOREIGN KEY ([site_id]) REFERENCES [dbo].[site] ([site_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cg_created]
    ON [dbo].[cooperator_group]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cg_modified]
    ON [dbo].[cooperator_group]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cg_owned]
    ON [dbo].[cooperator_group]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_cg_name]
    ON [dbo].[cooperator_group]([name] ASC);

