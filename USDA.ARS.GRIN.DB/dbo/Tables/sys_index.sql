CREATE TABLE [dbo].[sys_index] (
    [sys_index_id]  INT           IDENTITY (1, 1) NOT NULL,
    [sys_table_id]  INT           NOT NULL,
    [index_name]    NVARCHAR (50) NOT NULL,
    [is_unique]     NVARCHAR (1)  NOT NULL,
    [created_date]  DATETIME2 (7) NOT NULL,
    [created_by]    INT           NOT NULL,
    [modified_date] DATETIME2 (7) NULL,
    [modified_by]   INT           NULL,
    [owned_date]    DATETIME2 (7) NOT NULL,
    [owned_by]      INT           NOT NULL,
    CONSTRAINT [PK_sys_index] PRIMARY KEY CLUSTERED ([sys_index_id] ASC),
    CONSTRAINT [fk_si_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_si_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_si_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_si_st] FOREIGN KEY ([sys_table_id]) REFERENCES [dbo].[sys_table] ([sys_table_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_si_created]
    ON [dbo].[sys_index]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_si_modified]
    ON [dbo].[sys_index]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_si_owned]
    ON [dbo].[sys_index]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_si_st]
    ON [dbo].[sys_index]([sys_table_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_si]
    ON [dbo].[sys_index]([index_name] ASC, [sys_table_id] ASC);

