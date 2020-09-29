CREATE TABLE [dbo].[taxonomy_species] (
    [taxonomy_species_id]         INT             IDENTITY (1, 1) NOT NULL,
    [current_taxonomy_species_id] INT             NULL,
    [nomen_number]                INT             NULL,
    [is_specific_hybrid]          NVARCHAR (1)    NOT NULL,
    [species_name]                NVARCHAR (30)   NOT NULL,
    [species_authority]           NVARCHAR (100)  NULL,
    [is_subspecific_hybrid]       NVARCHAR (1)    NOT NULL,
    [subspecies_name]             NVARCHAR (30)   NULL,
    [subspecies_authority]        NVARCHAR (100)  NULL,
    [is_varietal_hybrid]          NVARCHAR (1)    NOT NULL,
    [variety_name]                NVARCHAR (30)   NULL,
    [variety_authority]           NVARCHAR (100)  NULL,
    [is_subvarietal_hybrid]       NVARCHAR (1)    NOT NULL,
    [subvariety_name]             NVARCHAR (30)   NULL,
    [subvariety_authority]        NVARCHAR (100)  NULL,
    [is_forma_hybrid]             NVARCHAR (1)    NOT NULL,
    [forma_rank_type]             NVARCHAR (30)   NULL,
    [forma_name]                  NVARCHAR (30)   NULL,
    [forma_authority]             NVARCHAR (100)  NULL,
    [taxonomy_genus_id]           INT             NOT NULL,
    [priority1_site_id]           INT             NULL,
    [priority2_site_id]           INT             NULL,
    [curator1_cooperator_id]      INT             NULL,
    [curator2_cooperator_id]      INT             NULL,
    [restriction_code]            NVARCHAR (20)   NULL,
    [life_form_code]              NVARCHAR (20)   NULL,
    [common_fertilization_code]   NVARCHAR (20)   NULL,
    [is_name_pending]             NVARCHAR (1)    NOT NULL,
    [synonym_code]                NVARCHAR (20)   NULL,
    [verifier_cooperator_id]      INT             NULL,
    [name_verified_date]          DATETIME2 (7)   NULL,
    [name]                        NVARCHAR (100)  NOT NULL,
    [name_authority]              NVARCHAR (100)  NULL,
    [protologue]                  NVARCHAR (500)  NULL,
    [protologue_virtual_path]     NVARCHAR (255)  NULL,
    [note]                        NVARCHAR (MAX)  NULL,
    [site_note]                   NVARCHAR (MAX)  NULL,
    [alternate_name]              NVARCHAR (2000) NULL,
    [created_date]                DATETIME2 (7)   NOT NULL,
    [created_by]                  INT             NOT NULL,
    [modified_date]               DATETIME2 (7)   NULL,
    [modified_by]                 INT             NULL,
    [owned_date]                  DATETIME2 (7)   NOT NULL,
    [owned_by]                    INT             NOT NULL,
    CONSTRAINT [PK_taxonomy_species] PRIMARY KEY CLUSTERED ([taxonomy_species_id] ASC),
    CONSTRAINT [fk_ts_c] FOREIGN KEY ([verifier_cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ts_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ts_cur_t] FOREIGN KEY ([current_taxonomy_species_id]) REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id]),
    CONSTRAINT [fk_ts_curator1] FOREIGN KEY ([curator1_cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ts_curator2] FOREIGN KEY ([curator2_cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ts_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ts_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ts_s] FOREIGN KEY ([priority1_site_id]) REFERENCES [dbo].[site] ([site_id]),
    CONSTRAINT [fk_ts_s2] FOREIGN KEY ([priority2_site_id]) REFERENCES [dbo].[site] ([site_id]),
    CONSTRAINT [fk_ts_tg] FOREIGN KEY ([taxonomy_genus_id]) REFERENCES [dbo].[taxonomy_genus] ([taxonomy_genus_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ts_c]
    ON [dbo].[taxonomy_species]([verifier_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ts_created]
    ON [dbo].[taxonomy_species]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ts_cur_t]
    ON [dbo].[taxonomy_species]([current_taxonomy_species_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ts_modified]
    ON [dbo].[taxonomy_species]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ts_owned]
    ON [dbo].[taxonomy_species]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ts_s]
    ON [dbo].[taxonomy_species]([priority1_site_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ts_s2]
    ON [dbo].[taxonomy_species]([priority2_site_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ts_tg]
    ON [dbo].[taxonomy_species]([taxonomy_genus_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_ts_name]
    ON [dbo].[taxonomy_species]([name] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_ts_nomen]
    ON [dbo].[taxonomy_species]([nomen_number] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_ts_s_name]
    ON [dbo].[taxonomy_species]([species_name] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ts]
    ON [dbo].[taxonomy_species]([name] ASC, [name_authority] ASC);

