CREATE TABLE [dbo].[taxonomy_cwr_map] (
    [taxonomy_cwr_map_id]  INT            IDENTITY (1, 1) NOT NULL,
    [taxonomy_species_id]  INT            NOT NULL,
    [taxonomy_cwr_crop_id] INT            NOT NULL,
    [crop_common_name]     NVARCHAR (100) NULL,
    [is_crop]              NVARCHAR (1)   NOT NULL,
    [genepool_code]        NVARCHAR (20)  NULL,
    [is_graftstock]        NVARCHAR (1)   NOT NULL,
    [is_potential]         NVARCHAR (1)   NOT NULL,
    [citation_id]          INT            NULL,
    [note]                 NVARCHAR (MAX) NULL,
    [created_date]         DATETIME2 (7)  NOT NULL,
    [created_by]           INT            NOT NULL,
    [modified_date]        DATETIME2 (7)  NULL,
    [modified_by]          INT            NULL,
    [owned_date]           DATETIME2 (7)  NOT NULL,
    [owned_by]             INT            NOT NULL,
    CONSTRAINT [PK_taxonomy_cwr_map] PRIMARY KEY CLUSTERED ([taxonomy_cwr_map_id] ASC),
    CONSTRAINT [fk_tcwrm_cit] FOREIGN KEY ([citation_id]) REFERENCES [dbo].[citation] ([citation_id]),
    CONSTRAINT [fk_tcwrm_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcwrm_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcwrm_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcwrm_tc] FOREIGN KEY ([taxonomy_cwr_crop_id]) REFERENCES [dbo].[taxonomy_cwr_crop] ([taxonomy_cwr_crop_id]),
    CONSTRAINT [fk_tcwrm_ts] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrm_ts]
    ON [dbo].[taxonomy_cwr_map]([taxonomy_species_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrm_tc]
    ON [dbo].[taxonomy_cwr_map]([taxonomy_cwr_crop_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrm_cit]
    ON [dbo].[taxonomy_cwr_map]([citation_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrm_created]
    ON [dbo].[taxonomy_cwr_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrm_modified]
    ON [dbo].[taxonomy_cwr_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrm_owned]
    ON [dbo].[taxonomy_cwr_map]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tcwrm]
    ON [dbo].[taxonomy_cwr_map]([taxonomy_species_id] ASC, [taxonomy_cwr_crop_id] ASC, [citation_id] ASC, [genepool_code] ASC, [is_graftstock] ASC, [is_potential] ASC);

