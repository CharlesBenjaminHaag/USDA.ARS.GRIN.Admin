CREATE TABLE [taxonomy_crop_map] (
    [taxonomy_crop_map_id]    INT            IDENTITY (1, 1) NOT NULL,
    [taxonomy_species_id]     INT            NOT NULL,
    [crop_id]                 INT            NOT NULL,
    [alternate_crop_name]     NVARCHAR (100) NOT NULL,
    [common_crop_name]        NVARCHAR (100) NULL,
    [is_primary_genepool]     NVARCHAR (1)   NOT NULL,
    [is_secondary_genepool]   NVARCHAR (1)   NOT NULL,
    [is_tertiary_genepool]    NVARCHAR (1)   NOT NULL,
    [is_quaternary_genepool]  NVARCHAR (1)   NOT NULL,
    [is_graftstock_genepool]  NVARCHAR (1)   DEFAULT ('N') NOT NULL,
    [crop_genepool_reviewers] NVARCHAR (500) NULL,
    [note]                    NVARCHAR (MAX) NULL,
    [created_date]            DATETIME2 (7)  NOT NULL,
    [created_by]              INT            NOT NULL,
    [modified_date]           DATETIME2 (7)  NULL,
    [modified_by]             INT            NULL,
    [owned_date]              DATETIME2 (7)  NOT NULL,
    [owned_by]                INT            NOT NULL,
    CONSTRAINT [PK_taxonomy_crop_map] PRIMARY KEY CLUSTERED ([taxonomy_crop_map_id] ASC),
    CONSTRAINT [fc_tcm_cr] FOREIGN KEY ([crop_id]) REFERENCES [crop] ([crop_id]),
    CONSTRAINT [fk_tcm_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcm_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcm_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcm_ts] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcm_cr]
    ON [taxonomy_crop_map]([crop_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcm_created]
    ON [taxonomy_crop_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcm_modfied]
    ON [taxonomy_crop_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcm_owned]
    ON [taxonomy_crop_map]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcm_ts]
    ON [taxonomy_crop_map]([taxonomy_species_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tcm]
    ON [taxonomy_crop_map]([taxonomy_species_id] ASC, [crop_id] ASC, [alternate_crop_name] ASC, [common_crop_name] ASC, [is_primary_genepool] ASC, [is_secondary_genepool] ASC, [is_tertiary_genepool] ASC, [is_quaternary_genepool] ASC, [is_graftstock_genepool] ASC);


GO
GRANT DELETE
    ON OBJECT::[taxonomy_crop_map] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[taxonomy_crop_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[taxonomy_crop_map] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[taxonomy_crop_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[taxonomy_crop_map] TO [gg_search]
    AS [dbo];

