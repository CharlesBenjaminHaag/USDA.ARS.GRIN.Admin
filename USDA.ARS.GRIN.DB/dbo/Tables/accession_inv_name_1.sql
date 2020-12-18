CREATE TABLE [accession_inv_name] (
    [accession_inv_name_id]     INT            IDENTITY (1, 1) NOT NULL,
    [inventory_id]              INT            NOT NULL,
    [category_code]             NVARCHAR (20)  NOT NULL,
    [plant_name]                NVARCHAR (200) NOT NULL,
    [plant_name_rank]           INT            NULL,
    [name_group_id]             INT            NULL,
    [name_source_cooperator_id] INT            NULL,
    [is_web_visible]            NVARCHAR (1)   DEFAULT ('Y') NOT NULL,
    [note]                      NVARCHAR (MAX) NULL,
    [created_date]              DATETIME2 (7)  NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  NOT NULL,
    [owned_by]                  INT            NOT NULL,
    CONSTRAINT [PK_accession_inv_name] PRIMARY KEY CLUSTERED ([accession_inv_name_id] ASC),
    CONSTRAINT [fk_ain_c] FOREIGN KEY ([name_source_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ain_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ain_i] FOREIGN KEY ([inventory_id]) REFERENCES [inventory] ([inventory_id]),
    CONSTRAINT [fk_ain_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ain_ng] FOREIGN KEY ([name_group_id]) REFERENCES [name_group] ([name_group_id]),
    CONSTRAINT [fk_ain_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ain_c]
    ON [accession_inv_name]([name_source_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ain_created]
    ON [accession_inv_name]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ain_i]
    ON [accession_inv_name]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ain_modified]
    ON [accession_inv_name]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ain_ng]
    ON [accession_inv_name]([name_group_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ain_owned]
    ON [accession_inv_name]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ain]
    ON [accession_inv_name]([inventory_id] ASC, [plant_name] ASC, [name_group_id] ASC, [category_code] ASC);


GO
CREATE STATISTICS [_dta_stat_213575799_5_2]
    ON [accession_inv_name]([plant_name_rank], [inventory_id]);


GO
CREATE STATISTICS [_dta_stat_213575799_5_1]
    ON [accession_inv_name]([plant_name_rank], [accession_inv_name_id]);


GO
GRANT DELETE
    ON OBJECT::[accession_inv_name] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[accession_inv_name] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_inv_name] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[accession_inv_name] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_inv_name] TO [gg_search]
    AS [dbo];

