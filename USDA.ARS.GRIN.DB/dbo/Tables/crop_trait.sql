CREATE TABLE [dbo].[crop_trait] (
    [crop_trait_id]            INT             IDENTITY (1, 1) NOT NULL,
    [crop_id]                  INT             NOT NULL,
    [coded_name]               NVARCHAR (30)   NOT NULL,
    [is_peer_reviewed]         NVARCHAR (1)    NOT NULL,
    [category_code]            NVARCHAR (20)   NOT NULL,
    [data_type_code]           NVARCHAR (20)   NOT NULL,
    [is_coded]                 NVARCHAR (1)    NOT NULL,
    [max_length]               INT             NULL,
    [numeric_format]           NVARCHAR (15)   NULL,
    [numeric_maximum]          DECIMAL (18, 5) NULL,
    [numeric_minimum]          DECIMAL (18, 5) NULL,
    [original_value_type_code] NVARCHAR (20)   NULL,
    [original_value_format]    NVARCHAR (50)   NULL,
    [is_archived]              NVARCHAR (1)    NOT NULL,
    [ontology_url]             NVARCHAR (300)  NULL,
    [note]                     NVARCHAR (MAX)  NULL,
    [created_date]             DATETIME2 (7)   NOT NULL,
    [created_by]               INT             NOT NULL,
    [modified_date]            DATETIME2 (7)   NULL,
    [modified_by]              INT             NULL,
    [owned_date]               DATETIME2 (7)   NOT NULL,
    [owned_by]                 INT             NOT NULL,
    CONSTRAINT [PK_crop_trait] PRIMARY KEY CLUSTERED ([crop_trait_id] ASC),
    CONSTRAINT [fk_ct_cr] FOREIGN KEY ([crop_id]) REFERENCES [dbo].[crop] ([crop_id]),
    CONSTRAINT [fk_ct_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ct_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ct_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ct_cr]
    ON [dbo].[crop_trait]([crop_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ct_created]
    ON [dbo].[crop_trait]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ct_modified]
    ON [dbo].[crop_trait]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ct_owned]
    ON [dbo].[crop_trait]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ct]
    ON [dbo].[crop_trait]([coded_name] ASC, [crop_id] ASC);

