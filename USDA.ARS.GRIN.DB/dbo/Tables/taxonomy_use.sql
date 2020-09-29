CREATE TABLE [dbo].[taxonomy_use] (
    [taxonomy_use_id]     INT            IDENTITY (1, 1) NOT NULL,
    [taxonomy_species_id] INT            NOT NULL,
    [economic_usage_code] NVARCHAR (20)  NOT NULL,
    [usage_type]          NVARCHAR (100) NULL,
    [plant_part_code]     NVARCHAR (20)  NULL,
    [citation_id]         INT            NULL,
    [note]                NVARCHAR (MAX) NULL,
    [created_date]        DATETIME2 (7)  NOT NULL,
    [created_by]          INT            NOT NULL,
    [modified_date]       DATETIME2 (7)  NULL,
    [modified_by]         INT            NULL,
    [owned_date]          DATETIME2 (7)  NOT NULL,
    [owned_by]            INT            NOT NULL,
    CONSTRAINT [PK_taxonomy_use] PRIMARY KEY CLUSTERED ([taxonomy_use_id] ASC),
    CONSTRAINT [fk_tu_cit] FOREIGN KEY ([citation_id]) REFERENCES [dbo].[citation] ([citation_id]),
    CONSTRAINT [fk_tus_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tus_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tus_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tus_ts] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tus_created]
    ON [dbo].[taxonomy_use]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tus_modified]
    ON [dbo].[taxonomy_use]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tus_owned]
    ON [dbo].[taxonomy_use]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tus_ts]
    ON [dbo].[taxonomy_use]([taxonomy_species_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_tu_usage]
    ON [dbo].[taxonomy_use]([economic_usage_code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tu]
    ON [dbo].[taxonomy_use]([taxonomy_species_id] ASC, [economic_usage_code] ASC, [usage_type] ASC, [citation_id] ASC);

