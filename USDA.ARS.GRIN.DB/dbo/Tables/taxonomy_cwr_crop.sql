CREATE TABLE [dbo].[taxonomy_cwr_crop] (
    [taxonomy_cwr_crop_id] INT            IDENTITY (1, 1) NOT NULL,
    [crop_name]            NVARCHAR (150) NULL,
    [note]                 NVARCHAR (MAX) NULL,
    [created_date]         DATETIME2 (7)  NOT NULL,
    [created_by]           INT            NOT NULL,
    [modified_date]        DATETIME2 (7)  NULL,
    [modified_by]          INT            NULL,
    [owned_date]           DATETIME2 (7)  NOT NULL,
    [owned_by]             INT            NOT NULL,
    CONSTRAINT [PK_taxonomy_cwr_crop] PRIMARY KEY CLUSTERED ([taxonomy_cwr_crop_id] ASC),
    CONSTRAINT [fk_tcc_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcc_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcc_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcc_created]
    ON [dbo].[taxonomy_cwr_crop]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcc_modified]
    ON [dbo].[taxonomy_cwr_crop]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcc_owned]
    ON [dbo].[taxonomy_cwr_crop]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tcc]
    ON [dbo].[taxonomy_cwr_crop]([crop_name] ASC);

