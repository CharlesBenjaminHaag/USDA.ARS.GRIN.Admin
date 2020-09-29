CREATE TABLE [dbo].[genetic_observation] (
    [genetic_observation_id] INT             IDENTITY (1, 1) NOT NULL,
    [inventory_id]           INT             NOT NULL,
    [genetic_annotation_id]  INT             NULL,
    [is_archived]            NVARCHAR (1)    NOT NULL,
    [data_quality_code]      NVARCHAR (20)   NULL,
    [frequency]              DECIMAL (18, 5) NULL,
    [value]                  NVARCHAR (1000) NULL,
    [rank]                   INT             NULL,
    [mean_value]             DECIMAL (18, 5) NULL,
    [maximum_value]          DECIMAL (18, 5) NULL,
    [minimum_value]          DECIMAL (18, 5) NULL,
    [standard_deviation]     DECIMAL (18, 5) NULL,
    [sample_size]            INT             NULL,
    [note]                   NVARCHAR (MAX)  NULL,
    [created_date]           DATETIME2 (7)   NOT NULL,
    [created_by]             INT             NOT NULL,
    [modified_date]          DATETIME2 (7)   NULL,
    [modified_by]            INT             NULL,
    [owned_date]             DATETIME2 (7)   NOT NULL,
    [owned_by]               INT             NOT NULL,
    CONSTRAINT [PK_genetic_observation] PRIMARY KEY CLUSTERED ([genetic_observation_id] ASC),
    CONSTRAINT [fk_go_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_go_ga] FOREIGN KEY ([genetic_annotation_id]) REFERENCES [dbo].[genetic_annotation] ([genetic_annotation_id]),
    CONSTRAINT [fk_go_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_go_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_go_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_go_created]
    ON [dbo].[genetic_observation]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_go_ga]
    ON [dbo].[genetic_observation]([genetic_annotation_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_go_modified]
    ON [dbo].[genetic_observation]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_go_owned]
    ON [dbo].[genetic_observation]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_go]
    ON [dbo].[genetic_observation]([inventory_id] ASC, [genetic_annotation_id] ASC);

