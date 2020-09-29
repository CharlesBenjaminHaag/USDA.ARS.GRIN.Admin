CREATE TABLE [dbo].[source_descriptor_code] (
    [source_descriptor_code_id] INT           IDENTITY (1, 1) NOT NULL,
    [source_descriptor_id]      INT           NOT NULL,
    [code]                      NVARCHAR (30) NOT NULL,
    [created_date]              DATETIME2 (7) NOT NULL,
    [created_by]                INT           NOT NULL,
    [modified_date]             DATETIME2 (7) NULL,
    [modified_by]               INT           NULL,
    [owned_date]                DATETIME2 (7) NOT NULL,
    [owned_by]                  INT           NOT NULL,
    CONSTRAINT [PK_source_descriptor_code] PRIMARY KEY CLUSTERED ([source_descriptor_code_id] ASC),
    CONSTRAINT [fk_sodc_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sodc_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sodc_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sodc_sd] FOREIGN KEY ([source_descriptor_id]) REFERENCES [dbo].[source_descriptor] ([source_descriptor_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodc_created]
    ON [dbo].[source_descriptor_code]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodc_modified]
    ON [dbo].[source_descriptor_code]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodc_owned]
    ON [dbo].[source_descriptor_code]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodc_sd]
    ON [dbo].[source_descriptor_code]([source_descriptor_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sodc]
    ON [dbo].[source_descriptor_code]([source_descriptor_id] ASC, [code] ASC);

