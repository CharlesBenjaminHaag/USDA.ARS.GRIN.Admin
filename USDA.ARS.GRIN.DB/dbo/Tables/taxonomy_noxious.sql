CREATE TABLE [dbo].[taxonomy_noxious] (
    [taxonomy_noxious_id] INT            IDENTITY (1, 1) NOT NULL,
    [taxonomy_species_id] INT            NOT NULL,
    [geography_id]        INT            NOT NULL,
    [noxious_type_code]   NVARCHAR (20)  NOT NULL,
    [noxious_level_code]  NVARCHAR (20)  NULL,
    [url]                 NVARCHAR (300) NULL,
    [note]                NVARCHAR (MAX) NULL,
    [created_date]        DATETIME2 (7)  NOT NULL,
    [created_by]          INT            NOT NULL,
    [modified_date]       DATETIME2 (7)  NULL,
    [modified_by]         INT            NULL,
    [owned_date]          DATETIME2 (7)  NOT NULL,
    [owned_by]            INT            NOT NULL,
    CONSTRAINT [PK_taxonomy_noxious] PRIMARY KEY CLUSTERED ([taxonomy_noxious_id] ASC),
    CONSTRAINT [fk_tn_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tn_g] FOREIGN KEY ([geography_id]) REFERENCES [dbo].[geography] ([geography_id]),
    CONSTRAINT [fk_tn_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tn_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tn_ts] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tn_created]
    ON [dbo].[taxonomy_noxious]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tn_g]
    ON [dbo].[taxonomy_noxious]([geography_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tn_modified]
    ON [dbo].[taxonomy_noxious]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tn_owned]
    ON [dbo].[taxonomy_noxious]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tn_ts]
    ON [dbo].[taxonomy_noxious]([taxonomy_species_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tn]
    ON [dbo].[taxonomy_noxious]([taxonomy_species_id] ASC, [geography_id] ASC, [noxious_type_code] ASC);

