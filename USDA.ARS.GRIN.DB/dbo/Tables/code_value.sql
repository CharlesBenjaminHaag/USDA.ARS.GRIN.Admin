CREATE TABLE [dbo].[code_value] (
    [code_value_id] INT            IDENTITY (1, 1) NOT NULL,
    [group_name]    NVARCHAR (100) NOT NULL,
    [value]         NVARCHAR (20)  NOT NULL,
    [created_date]  DATETIME2 (7)  NOT NULL,
    [created_by]    INT            NOT NULL,
    [modified_date] DATETIME2 (7)  NULL,
    [modified_by]   INT            NULL,
    [owned_date]    DATETIME2 (7)  NOT NULL,
    [owned_by]      INT            NOT NULL,
    CONSTRAINT [PK_code_value] PRIMARY KEY CLUSTERED ([code_value_id] ASC),
    CONSTRAINT [fk_cdval_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cdval_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cdval_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cdval_cdgrp]
    ON [dbo].[code_value]([group_name] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cdval_created]
    ON [dbo].[code_value]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cdval_modified]
    ON [dbo].[code_value]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cdval_owned]
    ON [dbo].[code_value]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_cv]
    ON [dbo].[code_value]([group_name] ASC, [value] ASC);


GO
CREATE STATISTICS [_dta_stat_629577281_3_1]
    ON [dbo].[code_value]([value], [code_value_id]);


GO
CREATE STATISTICS [_dta_stat_629577281_2_1_3]
    ON [dbo].[code_value]([group_name], [code_value_id], [value]);

