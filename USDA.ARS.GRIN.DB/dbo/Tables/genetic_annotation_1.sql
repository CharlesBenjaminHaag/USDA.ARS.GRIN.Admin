CREATE TABLE [genetic_annotation] (
    [genetic_annotation_id]     INT            IDENTITY (1, 1) NOT NULL,
    [genetic_marker_id]         INT            NOT NULL,
    [method_id]                 INT            NOT NULL,
    [assay_method]              NVARCHAR (MAX) NULL,
    [scoring_method]            NVARCHAR (MAX) NULL,
    [control_values]            NVARCHAR (MAX) NULL,
    [observation_alleles_count] INT            NULL,
    [max_gob_alleles]           INT            NULL,
    [size_alleles]              NVARCHAR (100) NULL,
    [unusual_alleles]           NVARCHAR (100) NULL,
    [note]                      NVARCHAR (MAX) NULL,
    [created_date]              DATETIME2 (7)  NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  NOT NULL,
    [owned_by]                  INT            NOT NULL,
    CONSTRAINT [PK_genetic_annotation] PRIMARY KEY CLUSTERED ([genetic_annotation_id] ASC),
    CONSTRAINT [fk_ga_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ga_gm] FOREIGN KEY ([genetic_marker_id]) REFERENCES [genetic_marker] ([genetic_marker_id]),
    CONSTRAINT [fk_ga_m] FOREIGN KEY ([method_id]) REFERENCES [method] ([method_id]),
    CONSTRAINT [fk_ga_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ga_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ga_created]
    ON [genetic_annotation]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ga_gm]
    ON [genetic_annotation]([genetic_marker_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ga_m]
    ON [genetic_annotation]([method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ga_modified]
    ON [genetic_annotation]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ga_owned]
    ON [genetic_annotation]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ga]
    ON [genetic_annotation]([genetic_marker_id] ASC, [method_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[genetic_annotation] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[genetic_annotation] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[genetic_annotation] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[genetic_annotation] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[genetic_annotation] TO [gg_search]
    AS [dbo];

