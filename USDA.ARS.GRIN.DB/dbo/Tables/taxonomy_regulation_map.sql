CREATE TABLE [dbo].[taxonomy_regulation_map] (
    [taxonomy_regulation_map_id] INT            IDENTITY (1, 1) NOT NULL,
    [taxonomy_family_id]         INT            NULL,
    [taxonomy_genus_id]          INT            NULL,
    [taxonomy_species_id]        INT            NULL,
    [taxonomy_regulation_id]     INT            NOT NULL,
    [note]                       NVARCHAR (MAX) NULL,
    [created_date]               DATETIME2 (7)  NOT NULL,
    [created_by]                 INT            NOT NULL,
    [modified_date]              DATETIME2 (7)  NULL,
    [modified_by]                INT            NULL,
    [owned_date]                 DATETIME2 (7)  NOT NULL,
    [owned_by]                   INT            NOT NULL,
    [is_exempt]                  NVARCHAR (1)   NULL,
    CONSTRAINT [PK_taxonomy_regulation] PRIMARY KEY CLUSTERED ([taxonomy_regulation_map_id] ASC),
    CONSTRAINT [fk_trm_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_trm_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_trm_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_trm_tf] FOREIGN KEY ([taxonomy_family_id]) REFERENCES [dbo].[taxonomy_family] ([taxonomy_family_id]),
    CONSTRAINT [fk_trm_tg] FOREIGN KEY ([taxonomy_genus_id]) REFERENCES [dbo].[taxonomy_genus] ([taxonomy_genus_id]),
    CONSTRAINT [fk_trm_tr] FOREIGN KEY ([taxonomy_regulation_id]) REFERENCES [dbo].[taxonomy_regulation] ([taxonomy_regulation_id]),
    CONSTRAINT [fk_trm_ts] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_trm_created]
    ON [dbo].[taxonomy_regulation_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_trm_modified]
    ON [dbo].[taxonomy_regulation_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_trm_owned]
    ON [dbo].[taxonomy_regulation_map]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_trm_taxonomy_family]
    ON [dbo].[taxonomy_regulation_map]([taxonomy_family_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_trm_taxonomy_genus]
    ON [dbo].[taxonomy_regulation_map]([taxonomy_genus_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_trm_taxonomy_regulation]
    ON [dbo].[taxonomy_regulation_map]([taxonomy_regulation_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_trm_taxonomy_species]
    ON [dbo].[taxonomy_regulation_map]([taxonomy_species_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_trm]
    ON [dbo].[taxonomy_regulation_map]([taxonomy_family_id] ASC, [taxonomy_genus_id] ASC, [taxonomy_species_id] ASC, [taxonomy_regulation_id] ASC);

