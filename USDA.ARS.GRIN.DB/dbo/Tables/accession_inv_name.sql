CREATE TABLE [dbo].[accession_inv_name] (
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
    CONSTRAINT [fk_ain_c] FOREIGN KEY ([name_source_cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ain_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ain_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_ain_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ain_ng] FOREIGN KEY ([name_group_id]) REFERENCES [dbo].[name_group] ([name_group_id]),
    CONSTRAINT [fk_ain_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ain_c]
    ON [dbo].[accession_inv_name]([name_source_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ain_created]
    ON [dbo].[accession_inv_name]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ain_i]
    ON [dbo].[accession_inv_name]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ain_modified]
    ON [dbo].[accession_inv_name]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ain_ng]
    ON [dbo].[accession_inv_name]([name_group_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ain_owned]
    ON [dbo].[accession_inv_name]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ain]
    ON [dbo].[accession_inv_name]([inventory_id] ASC, [plant_name] ASC, [name_group_id] ASC, [category_code] ASC);


GO
CREATE STATISTICS [_dta_stat_213575799_5_2]
    ON [dbo].[accession_inv_name]([plant_name_rank], [inventory_id]);


GO
CREATE STATISTICS [_dta_stat_213575799_5_1]
    ON [dbo].[accession_inv_name]([plant_name_rank], [accession_inv_name_id]);

