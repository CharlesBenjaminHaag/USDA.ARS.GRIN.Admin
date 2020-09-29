CREATE TABLE [dbo].[taxonomy_upov_crop_map] (
    [taxonomy_upov_crop_map_id] INT           IDENTITY (1, 1) NOT NULL,
    [taxonomy_upov_crop_id]     INT           NOT NULL,
    [taxonomy_species_id]       INT           NOT NULL,
    [created_date]              DATETIME2 (7) CONSTRAINT [DF_taxonomy_upov_crop_map_created_date] DEFAULT (getdate()) NOT NULL,
    [created_by]                INT           NOT NULL,
    [modified_date]             DATETIME2 (7) CONSTRAINT [DF_taxonomy_upov_crop_map_modified_date] DEFAULT (getdate()) NULL,
    [modified_by]               INT           NULL,
    [owned_date]                DATETIME2 (7) CONSTRAINT [DF_taxonomy_upov_crop_map_owned_date] DEFAULT (getdate()) NOT NULL,
    [owned_by]                  INT           NOT NULL,
    CONSTRAINT [PK_taxonomy_upov_crop_map] PRIMARY KEY CLUSTERED ([taxonomy_upov_crop_map_id] ASC),
    CONSTRAINT [FK_taxonomy_upov_crop_map_taxonomy_ref_upov_crop] FOREIGN KEY ([taxonomy_upov_crop_id]) REFERENCES [dbo].[taxonomy_ref_upov_crop] ([taxonomy_ref_upov_crop_id]),
    CONSTRAINT [FK_taxonomy_upov_crop_map_taxonomy_species] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
);

