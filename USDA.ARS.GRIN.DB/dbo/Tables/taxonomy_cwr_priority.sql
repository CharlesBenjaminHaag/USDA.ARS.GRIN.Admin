CREATE TABLE [dbo].[taxonomy_cwr_priority] (
    [taxonomy_cwr_priority_id] INT            IDENTITY (1, 1) NOT NULL,
    [taxonomy_species_id]      INT            NOT NULL,
    [priority_year]            INT            NOT NULL,
    [status_code]              NVARCHAR (20)  NOT NULL,
    [in_situ_code]             NVARCHAR (20)  NULL,
    [ex_situ_code]             NVARCHAR (20)  NULL,
    [citation_id]              INT            NULL,
    [note]                     NVARCHAR (MAX) NULL,
    [created_date]             DATETIME2 (7)  NOT NULL,
    [created_by]               INT            NOT NULL,
    [modified_date]            DATETIME2 (7)  NULL,
    [modified_by]              INT            NULL,
    [owned_date]               DATETIME2 (7)  NOT NULL,
    [owned_by]                 INT            NOT NULL,
    CONSTRAINT [PK_taxonomy_cwr_priority] PRIMARY KEY CLUSTERED ([taxonomy_cwr_priority_id] ASC),
    CONSTRAINT [fk_tcwrp_cit] FOREIGN KEY ([citation_id]) REFERENCES [dbo].[citation] ([citation_id]),
    CONSTRAINT [fk_tcwrp_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcwrp_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcwrp_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tcwrp_ts] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrp_cit]
    ON [dbo].[taxonomy_cwr_priority]([citation_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrp_created]
    ON [dbo].[taxonomy_cwr_priority]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrp_modified]
    ON [dbo].[taxonomy_cwr_priority]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrp_owned]
    ON [dbo].[taxonomy_cwr_priority]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tcwrp_ts]
    ON [dbo].[taxonomy_cwr_priority]([taxonomy_species_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tcwrp]
    ON [dbo].[taxonomy_cwr_priority]([taxonomy_species_id] ASC, [priority_year] ASC, [status_code] ASC);

