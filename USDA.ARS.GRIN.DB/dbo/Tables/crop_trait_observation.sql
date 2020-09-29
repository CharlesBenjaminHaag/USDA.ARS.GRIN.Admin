CREATE TABLE [dbo].[crop_trait_observation] (
    [crop_trait_observation_id] INT             IDENTITY (1, 1) NOT NULL,
    [inventory_id]              INT             NOT NULL,
    [crop_trait_id]             INT             NOT NULL,
    [crop_trait_code_id]        INT             NULL,
    [numeric_value]             DECIMAL (18, 5) NULL,
    [string_value]              NVARCHAR (255)  NULL,
    [method_id]                 INT             NOT NULL,
    [is_archived]               NVARCHAR (1)    NOT NULL,
    [data_quality_code]         NVARCHAR (20)   NULL,
    [original_value]            NVARCHAR (30)   NULL,
    [frequency]                 DECIMAL (18, 5) NULL,
    [rank]                      INT             NULL,
    [mean_value]                DECIMAL (18, 5) NULL,
    [maximum_value]             DECIMAL (18, 5) NULL,
    [minimum_value]             DECIMAL (18, 5) NULL,
    [standard_deviation]        DECIMAL (18, 5) NULL,
    [sample_size]               INT             NULL,
    [note]                      NVARCHAR (MAX)  NULL,
    [created_date]              DATETIME2 (7)   NOT NULL,
    [created_by]                INT             NOT NULL,
    [modified_date]             DATETIME2 (7)   NULL,
    [modified_by]               INT             NULL,
    [owned_date]                DATETIME2 (7)   NOT NULL,
    [owned_by]                  INT             NOT NULL,
    CONSTRAINT [PK_crop_trait_observation] PRIMARY KEY CLUSTERED ([crop_trait_observation_id] ASC),
    CONSTRAINT [fk_cto_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cto_ct] FOREIGN KEY ([crop_trait_id]) REFERENCES [dbo].[crop_trait] ([crop_trait_id]),
    CONSTRAINT [fk_cto_ctc] FOREIGN KEY ([crop_trait_code_id]) REFERENCES [dbo].[crop_trait_code] ([crop_trait_code_id]),
    CONSTRAINT [fk_cto_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_cto_m] FOREIGN KEY ([method_id]) REFERENCES [dbo].[method] ([method_id]),
    CONSTRAINT [fk_cto_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cto_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cto_created]
    ON [dbo].[crop_trait_observation]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cto_ct]
    ON [dbo].[crop_trait_observation]([crop_trait_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cto_ctc]
    ON [dbo].[crop_trait_observation]([crop_trait_code_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cto_i]
    ON [dbo].[crop_trait_observation]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cto_m]
    ON [dbo].[crop_trait_observation]([method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cto_modified]
    ON [dbo].[crop_trait_observation]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cto_owned]
    ON [dbo].[crop_trait_observation]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_cto]
    ON [dbo].[crop_trait_observation]([inventory_id] ASC, [crop_trait_id] ASC, [crop_trait_code_id] ASC, [numeric_value] ASC, [string_value] ASC, [method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_cto_maize]
    ON [dbo].[crop_trait_observation]([crop_trait_id] ASC, [crop_trait_code_id] ASC, [is_archived] ASC)
    INCLUDE([inventory_id], [numeric_value], [string_value]);

