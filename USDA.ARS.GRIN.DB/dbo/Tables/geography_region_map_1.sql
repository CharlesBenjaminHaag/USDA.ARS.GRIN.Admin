CREATE TABLE [geography_region_map] (
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
    CONSTRAINT [fk_grm_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_grm_g] FOREIGN KEY ([geography_id]) REFERENCES [geography] ([geography_id]),
    CONSTRAINT [fk_grm_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_grm_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fo_grm_r] FOREIGN KEY ([region_id]) REFERENCES [region] ([region_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_grm_created]
    ON [geography_region_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_grm_g]
    ON [geography_region_map]([geography_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_grm_modified]
    ON [geography_region_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_grm_owned]
    ON [geography_region_map]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_grm_r]
    ON [geography_region_map]([region_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_grm]
    ON [geography_region_map]([geography_id] ASC, [region_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[geography_region_map] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[geography_region_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[geography_region_map] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[geography_region_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[geography_region_map] TO [gg_search]
    AS [dbo];

