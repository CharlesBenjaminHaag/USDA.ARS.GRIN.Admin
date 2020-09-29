CREATE TABLE [dbo].[taxonomy_cwr_trait] (
    [taxonomy_cwr_trait_id]     INT             IDENTITY (1, 1) NOT NULL,
    [taxonomy_cwr_map_id]       INT             NOT NULL,
    [trait_class_code]          NVARCHAR (20)   NULL,
    [is_potential]              NVARCHAR (1)    NOT NULL,
    [breeding_type_code]        NVARCHAR (20)   NULL,
    [breeding_usage_note]       NVARCHAR (1000) NULL,
    [ontology_trait_identifier] NVARCHAR (20)   NULL,
    [citation_id]               INT             NULL,
    [note]                      NVARCHAR (MAX)  NULL,
    [created_date]              DATETIME2 (7)   NOT NULL,
    [created_by]                INT             NOT NULL,
    [modified_date]             DATETIME2 (7)   NULL,
    [modified_by]               INT             NULL,
    [owned_date]                DATETIME2 (7)   NOT NULL,
    [owned_by]                  INT             NOT NULL,
    CONSTRAINT [PK_taxonomy_cwr_trait] PRIMARY KEY CLUSTERED ([taxonomy_cwr_trait_id] ASC),
    CONSTRAINT [fk_tcwrt_cit] FOREIGN KEY ([citation_id]) REFERENCES [dbo].[citation] ([citation_id]),
    CONSTRAINT [fk_tcwrt_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcwrt_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcwrt_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcwrt_tc] FOREIGN KEY ([taxonomy_cwr_map_id]) REFERENCES [dbo].[taxonomy_cwr_map] ([taxonomy_cwr_map_id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrt_tcc]
    ON [dbo].[taxonomy_cwr_trait]([taxonomy_cwr_map_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrt_cit]
    ON [dbo].[taxonomy_cwr_trait]([citation_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrt_created]
    ON [dbo].[taxonomy_cwr_trait]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrt_modified]
    ON [dbo].[taxonomy_cwr_trait]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrt_owned]
    ON [dbo].[taxonomy_cwr_trait]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tcwrt]
    ON [dbo].[taxonomy_cwr_trait]([taxonomy_cwr_map_id] ASC, [citation_id] ASC, [ontology_trait_identifier] ASC, [breeding_type_code] ASC, [is_potential] ASC);

