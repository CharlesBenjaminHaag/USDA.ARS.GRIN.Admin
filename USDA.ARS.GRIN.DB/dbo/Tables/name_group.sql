CREATE TABLE [dbo].[name_group] (
    [name_group_id] INT             IDENTITY (1, 1) NOT NULL,
    [group_name]    NVARCHAR (20)   NOT NULL,
    [note]          NVARCHAR (MAX)  NULL,
    [url]           NVARCHAR (2000) NULL,
    [created_date]  DATETIME2 (7)   NOT NULL,
    [created_by]    INT             NOT NULL,
    [modified_date] DATETIME2 (7)   NULL,
    [modified_by]   INT             NULL,
    [owned_date]    DATETIME2 (7)   NOT NULL,
    [owned_by]      INT             NOT NULL,
    CONSTRAINT [PK_name_group] PRIMARY KEY CLUSTERED ([name_group_id] ASC),
    CONSTRAINT [fk_ng_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ng_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ng_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ng_created]
    ON [dbo].[name_group]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ng_modified]
    ON [dbo].[name_group]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ng_owned]
    ON [dbo].[name_group]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ng]
    ON [dbo].[name_group]([group_name] ASC);

