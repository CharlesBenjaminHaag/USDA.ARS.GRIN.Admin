CREATE TABLE [dbo].[taxonomy_cwr] (
    [taxonomy_cwr_id]           INT             IDENTITY (1, 1) NOT NULL,
    [taxonomy_species_id]       INT             NOT NULL,
    [crop_name]                 NVARCHAR (100)  NOT NULL,
    [display_name]              NVARCHAR (100)  NULL,
    [crop_common_name]          NVARCHAR (100)  NULL,
    [is_crop]                   NVARCHAR (1)    NOT NULL,
    [genepool_code]             NVARCHAR (20)   NULL,
    [is_graftstock_genepool]    NVARCHAR (1)    DEFAULT ('N') NOT NULL,
    [trait_class_code]          NVARCHAR (20)   NULL,
    [is_potential]              NVARCHAR (1)    NOT NULL,
    [breeding_type_code]        NVARCHAR (20)   NULL,
    [breeding_usage]            NVARCHAR (1000) NULL,
    [ontology_trait_identifier] NVARCHAR (20)   NULL,
    [citation_id]               INT             NULL,
    [note]                      NVARCHAR (MAX)  NULL,
    [created_date]              DATETIME2 (7)   NOT NULL,
    [created_by]                INT             NOT NULL,
    [modified_date]             DATETIME2 (7)   NULL,
    [modified_by]               INT             NULL,
    [owned_date]                DATETIME2 (7)   NOT NULL,
    [owned_by]                  INT             NOT NULL,
    CONSTRAINT [PK_taxonomy_cwr] PRIMARY KEY CLUSTERED ([taxonomy_cwr_id] ASC),
    CONSTRAINT [fk_tcwr_cit] FOREIGN KEY ([citation_id]) REFERENCES [dbo].[citation] ([citation_id]),
    CONSTRAINT [fk_tcwr_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcwr_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcwr_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcwr_ts] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tcwr]
    ON [dbo].[taxonomy_cwr]([taxonomy_species_id] ASC, [display_name] ASC, [citation_id] ASC, [crop_name] ASC, [crop_common_name] ASC, [genepool_code] ASC, [is_graftstock_genepool] ASC, [is_potential] ASC, [ontology_trait_identifier] ASC, [breeding_type_code] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwr_ts]
    ON [dbo].[taxonomy_cwr]([taxonomy_species_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwr_created]
    ON [dbo].[taxonomy_cwr]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwr_modified]
    ON [dbo].[taxonomy_cwr]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwr_owned]
    ON [dbo].[taxonomy_cwr]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwr_c]
    ON [dbo].[taxonomy_cwr]([citation_id] ASC);

