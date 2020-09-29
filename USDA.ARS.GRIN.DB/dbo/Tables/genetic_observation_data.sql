CREATE TABLE [dbo].[genetic_observation_data] (
    [genetic_observation_data_id] INT             IDENTITY (1, 1) NOT NULL,
    [genetic_observation_id]      INT             NULL,
    [genetic_annotation_id]       INT             NOT NULL,
    [inventory_id]                INT             NOT NULL,
    [individual]                  INT             NULL,
    [individual_allele_number]    INT             NULL,
    [value]                       NVARCHAR (1000) NOT NULL,
    [created_date]                DATETIME2 (7)   NOT NULL,
    [created_by]                  INT             NOT NULL,
    [modified_date]               DATETIME2 (7)   NULL,
    [modified_by]                 INT             NULL,
    [owned_date]                  DATETIME2 (7)   NOT NULL,
    [owned_by]                    INT             NOT NULL,
    CONSTRAINT [PK_genetic_observation_data] PRIMARY KEY CLUSTERED ([genetic_observation_data_id] ASC),
    CONSTRAINT [fk_god_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_god_ga] FOREIGN KEY ([genetic_annotation_id]) REFERENCES [dbo].[genetic_annotation] ([genetic_annotation_id]),
    CONSTRAINT [fk_god_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_god_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_god_ob] FOREIGN KEY ([genetic_observation_id]) REFERENCES [dbo].[genetic_observation] ([genetic_observation_id]),
    CONSTRAINT [fk_god_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_god_created]
    ON [dbo].[genetic_observation_data]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_god_ga]
    ON [dbo].[genetic_observation_data]([genetic_annotation_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_god_i]
    ON [dbo].[genetic_observation_data]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_god_modified]
    ON [dbo].[genetic_observation_data]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_god_ob]
    ON [dbo].[genetic_observation_data]([genetic_observation_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_god_owned]
    ON [dbo].[genetic_observation_data]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_god]
    ON [dbo].[genetic_observation_data]([genetic_annotation_id] ASC, [inventory_id] ASC, [individual] ASC, [individual_allele_number] ASC);

