CREATE TABLE [genetic_marker] (
    [genetic_marker_id] INT             IDENTITY (1, 1) NOT NULL,
    [crop_id]           INT             NOT NULL,
    [name]              NVARCHAR (100)  NOT NULL,
    [synonyms]          NVARCHAR (200)  NULL,
    [repeat_motif]      NVARCHAR (100)  NULL,
    [primers]           NVARCHAR (200)  NULL,
    [assay_conditions]  NVARCHAR (4000) NULL,
    [range_products]    NVARCHAR (60)   NULL,
    [genbank_number]    NVARCHAR (20)   NULL,
    [known_standards]   NVARCHAR (MAX)  NULL,
    [map_location]      NVARCHAR (100)  NULL,
    [position]          NVARCHAR (1000) NULL,
    [poly_type_code]    NVARCHAR (20)   NULL,
    [note]              NVARCHAR (MAX)  NULL,
    [created_date]      DATETIME2 (7)   NOT NULL,
    [created_by]        INT             NOT NULL,
    [modified_date]     DATETIME2 (7)   NULL,
    [modified_by]       INT             NULL,
    [owned_date]        DATETIME2 (7)   NOT NULL,
    [owned_by]          INT             NOT NULL,
    CONSTRAINT [PK_genetic_marker] PRIMARY KEY CLUSTERED ([genetic_marker_id] ASC),
    CONSTRAINT [fk_gm_cr] FOREIGN KEY ([crop_id]) REFERENCES [crop] ([crop_id]),
    CONSTRAINT [fk_gm_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_gm_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_gm_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_gm_cr]
    ON [genetic_marker]([crop_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_gm_created]
    ON [genetic_marker]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_gm_modified]
    ON [genetic_marker]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_gm_owned]
    ON [genetic_marker]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_gm_crop]
    ON [genetic_marker]([crop_id] ASC, [name] ASC);


GO
GRANT DELETE
    ON OBJECT::[genetic_marker] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[genetic_marker] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[genetic_marker] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[genetic_marker] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[genetic_marker] TO [gg_search]
    AS [dbo];

