CREATE TABLE [dbo].[feedback_result_trait_obs] (
    [feedback_result_trait_obs_id] INT             IDENTITY (1, 1) NOT NULL,
    [feedback_result_id]           INT             NOT NULL,
    [feedback_form_trait_id]       INT             NOT NULL,
    [inventory_id]                 INT             NOT NULL,
    [crop_trait_id]                INT             NOT NULL,
    [crop_trait_code_id]           INT             NULL,
    [numeric_value]                DECIMAL (18, 5) NULL,
    [string_value]                 NVARCHAR (255)  NULL,
    [admin_value]                  NVARCHAR (255)  NULL,
    [method_id]                    INT             NULL,
    [is_archived]                  NVARCHAR (1)    NOT NULL,
    [data_quality_code]            NVARCHAR (20)   NULL,
    [original_value]               NVARCHAR (30)   NULL,
    [frequency]                    DECIMAL (18, 5) NULL,
    [rank]                         INT             NULL,
    [mean_value]                   DECIMAL (18, 5) NULL,
    [maximum_value]                DECIMAL (18, 5) NULL,
    [minimum_value]                DECIMAL (18, 5) NULL,
    [standard_deviation]           DECIMAL (18, 5) NULL,
    [sample_size]                  INT             NULL,
    [note]                         NVARCHAR (MAX)  NULL,
    [created_date]                 DATETIME2 (7)   NOT NULL,
    [created_by]                   INT             NOT NULL,
    [modified_date]                DATETIME2 (7)   NULL,
    [modified_by]                  INT             NULL,
    [owned_date]                   DATETIME2 (7)   NOT NULL,
    [owned_by]                     INT             NOT NULL,
    CONSTRAINT [PK_feedback_result_trait_obs] PRIMARY KEY CLUSTERED ([feedback_result_trait_obs_id] ASC),
    CONSTRAINT [fk_fresto_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fresto_ct] FOREIGN KEY ([crop_trait_id]) REFERENCES [dbo].[crop_trait] ([crop_trait_id]),
    CONSTRAINT [fk_fresto_ctc] FOREIGN KEY ([crop_trait_code_id]) REFERENCES [dbo].[crop_trait_code] ([crop_trait_code_id]),
    CONSTRAINT [fk_fresto_fr] FOREIGN KEY ([feedback_result_id]) REFERENCES [dbo].[feedback_result] ([feedback_result_id]),
    CONSTRAINT [fk_fresto_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_fresto_m] FOREIGN KEY ([method_id]) REFERENCES [dbo].[method] ([method_id]),
    CONSTRAINT [fk_fresto_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fresto_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresto_created]
    ON [dbo].[feedback_result_trait_obs]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresto_ct]
    ON [dbo].[feedback_result_trait_obs]([crop_trait_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresto_ctc]
    ON [dbo].[feedback_result_trait_obs]([crop_trait_code_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresto_i]
    ON [dbo].[feedback_result_trait_obs]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresto_m]
    ON [dbo].[feedback_result_trait_obs]([method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresto_modified]
    ON [dbo].[feedback_result_trait_obs]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresto_owned]
    ON [dbo].[feedback_result_trait_obs]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_fresto]
    ON [dbo].[feedback_result_trait_obs]([feedback_result_id] ASC, [inventory_id] ASC, [crop_trait_id] ASC, [crop_trait_code_id] ASC, [numeric_value] ASC, [string_value] ASC, [method_id] ASC);

