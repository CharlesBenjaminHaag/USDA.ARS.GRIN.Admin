CREATE TABLE [code_value] (
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
    CONSTRAINT [fk_cdval_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cdval_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cdval_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cdval_cdgrp]
    ON [code_value]([group_name] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cdval_created]
    ON [code_value]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cdval_modified]
    ON [code_value]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cdval_owned]
    ON [code_value]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_cv]
    ON [code_value]([group_name] ASC, [value] ASC);


GO
CREATE STATISTICS [_dta_stat_629577281_3_1]
    ON [code_value]([value], [code_value_id]);


GO
CREATE STATISTICS [_dta_stat_629577281_2_1_3]
    ON [code_value]([group_name], [code_value_id], [value]);


GO
GRANT DELETE
    ON OBJECT::[code_value] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[code_value] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[code_value] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[code_value] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[code_value] TO [gg_search]
    AS [dbo];

