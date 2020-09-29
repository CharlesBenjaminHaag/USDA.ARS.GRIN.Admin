CREATE TABLE [dbo].[taxonomy_alt_family_map] (
    [taxonomy_alt_family_map_id] INT           IDENTITY (1, 1) NOT NULL,
    [taxonomy_genus_id]          INT           NOT NULL,
    [taxonomy_family_id]         INT           NOT NULL,
    [created_date]               DATETIME2 (7) NOT NULL,
    [created_by]                 INT           NOT NULL,
    [modified_date]              DATETIME2 (7) NULL,
    [modified_by]                INT           NULL,
    [owned_date]                 DATETIME2 (7) NOT NULL,
    [owned_by]                   INT           NOT NULL,
    CONSTRAINT [PK_taxonomy_alt_family_map] PRIMARY KEY CLUSTERED ([taxonomy_alt_family_map_id] ASC),
    CONSTRAINT [fk_tafm_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tafm_f] FOREIGN KEY ([taxonomy_family_id]) REFERENCES [dbo].[taxonomy_family] ([taxonomy_family_id]),
    CONSTRAINT [fk_tafm_g] FOREIGN KEY ([taxonomy_genus_id]) REFERENCES [dbo].[taxonomy_genus] ([taxonomy_genus_id]),
    CONSTRAINT [fk_tafm_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tafm_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tafm_created]
    ON [dbo].[taxonomy_alt_family_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tafm_f]
    ON [dbo].[taxonomy_alt_family_map]([taxonomy_family_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tafm_g]
    ON [dbo].[taxonomy_alt_family_map]([taxonomy_genus_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tafm_modified]
    ON [dbo].[taxonomy_alt_family_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tafm_owned]
    ON [dbo].[taxonomy_alt_family_map]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tafm]
    ON [dbo].[taxonomy_alt_family_map]([taxonomy_genus_id] ASC, [taxonomy_family_id] ASC);

