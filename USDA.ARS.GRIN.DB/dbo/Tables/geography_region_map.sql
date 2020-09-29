CREATE TABLE [dbo].[geography_region_map] (
    [geography_region_map_id] INT           IDENTITY (1, 1) NOT NULL,
    [geography_id]            INT           NOT NULL,
    [region_id]               INT           NOT NULL,
    [created_date]            DATETIME2 (7) NOT NULL,
    [created_by]              INT           NOT NULL,
    [modified_date]           DATETIME2 (7) NULL,
    [modified_by]             INT           NULL,
    [owned_date]              DATETIME2 (7) NOT NULL,
    [owned_by]                INT           NOT NULL,
    CONSTRAINT [PK_geography_region_map] PRIMARY KEY CLUSTERED ([geography_region_map_id] ASC),
    CONSTRAINT [fk_grm_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_grm_g] FOREIGN KEY ([geography_id]) REFERENCES [dbo].[geography] ([geography_id]),
    CONSTRAINT [fk_grm_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_grm_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fo_grm_r] FOREIGN KEY ([region_id]) REFERENCES [dbo].[region] ([region_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_grm_created]
    ON [dbo].[geography_region_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_grm_g]
    ON [dbo].[geography_region_map]([geography_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_grm_modified]
    ON [dbo].[geography_region_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_grm_owned]
    ON [dbo].[geography_region_map]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_grm_r]
    ON [dbo].[geography_region_map]([region_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_grm]
    ON [dbo].[geography_region_map]([geography_id] ASC, [region_id] ASC);

