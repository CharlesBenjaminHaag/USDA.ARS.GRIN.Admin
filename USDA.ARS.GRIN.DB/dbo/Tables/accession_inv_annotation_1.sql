CREATE TABLE [accession_inv_annotation] (
    [accession_inv_annotation_id] INT            IDENTITY (1, 1) NOT NULL,
    [annotation_type_code]        NVARCHAR (20)  NOT NULL,
    [annotation_date]             DATETIME2 (7)  NOT NULL,
    [annotation_date_code]        NVARCHAR (20)  NULL,
    [annotation_cooperator_id]    INT            NULL,
    [inventory_id]                INT            NOT NULL,
    [order_request_id]            INT            NULL,
    [old_taxonomy_species_id]     INT            NULL,
    [new_taxonomy_species_id]     INT            NULL,
    [note]                        NVARCHAR (MAX) NULL,
    [created_date]                DATETIME2 (7)  NOT NULL,
    [created_by]                  INT            NOT NULL,
    [modified_date]               DATETIME2 (7)  NULL,
    [modified_by]                 INT            NULL,
    [owned_date]                  DATETIME2 (7)  NOT NULL,
    [owned_by]                    INT            NOT NULL,
    CONSTRAINT [PK_accession_inv_annotation] PRIMARY KEY CLUSTERED ([accession_inv_annotation_id] ASC),
    CONSTRAINT [fk_aian_c] FOREIGN KEY ([annotation_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aian_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aian_i] FOREIGN KEY ([inventory_id]) REFERENCES [inventory] ([inventory_id]),
    CONSTRAINT [fk_aian_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aian_or] FOREIGN KEY ([order_request_id]) REFERENCES [order_request] ([order_request_id]),
    CONSTRAINT [fk_aian_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aian_t_new] FOREIGN KEY ([new_taxonomy_species_id]) REFERENCES [taxonomy_species] ([taxonomy_species_id]),
    CONSTRAINT [fk_aian_t_old] FOREIGN KEY ([old_taxonomy_species_id]) REFERENCES [taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aian_c]
    ON [accession_inv_annotation]([annotation_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aian_created]
    ON [accession_inv_annotation]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aian_i]
    ON [accession_inv_annotation]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aian_modified]
    ON [accession_inv_annotation]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aian_or]
    ON [accession_inv_annotation]([order_request_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aian_owned]
    ON [accession_inv_annotation]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aian_t_new]
    ON [accession_inv_annotation]([new_taxonomy_species_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aian_t_old]
    ON [accession_inv_annotation]([old_taxonomy_species_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_aian]
    ON [accession_inv_annotation]([inventory_id] ASC, [annotation_type_code] ASC, [annotation_date] ASC);


GO
GRANT DELETE
    ON OBJECT::[accession_inv_annotation] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[accession_inv_annotation] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_inv_annotation] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[accession_inv_annotation] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_inv_annotation] TO [gg_search]
    AS [dbo];

