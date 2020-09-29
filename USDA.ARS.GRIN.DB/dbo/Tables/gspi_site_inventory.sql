CREATE TABLE [dbo].[gspi_site_inventory] (
    [gspi_site_inventory_id] INT             IDENTITY (1, 1) NOT NULL,
    [inventory_id]           INT             NOT NULL,
    [seed_quantity]          INT             NULL,
    [seed_age]               NVARCHAR (20)   NULL,
    [hundred_weight]         DECIMAL (18, 5) NULL,
    [increase_location]      NVARCHAR (20)   NULL,
    [increase_year]          NVARCHAR (4)    NULL,
    [lot_type_code]          NVARCHAR (20)   NULL,
    [pollen_vector_code]     NVARCHAR (20)   NULL,
    [pollen_environment]     NVARCHAR (20)   NULL,
    [pollen_procedure_code]  NVARCHAR (20)   NULL,
    [split_inventory_id]     INT             NULL,
    [plot]                   NVARCHAR (30)   NULL,
    [note]                   NVARCHAR (240)  NULL,
    [created_date]           DATETIME2 (7)   NOT NULL,
    [created_by]             INT             NOT NULL,
    [modified_date]          DATETIME2 (7)   NULL,
    [modified_by]            INT             NULL,
    [owned_date]             DATETIME2 (7)   NOT NULL,
    [owned_by]               INT             NOT NULL,
    CONSTRAINT [PK_gspi_site_inventory] PRIMARY KEY CLUSTERED ([gspi_site_inventory_id] ASC),
    CONSTRAINT [fk_gspiivsi_i] FOREIGN KEY ([split_inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_gspisi_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_gspisi_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_gspisi_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_gspisi_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_gspiivsi_i]
    ON [dbo].[gspi_site_inventory]([split_inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_gspisi_created]
    ON [dbo].[gspi_site_inventory]([created_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_fk_gspisi_i]
    ON [dbo].[gspi_site_inventory]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_gspisi_modified]
    ON [dbo].[gspi_site_inventory]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_gspisi_owned]
    ON [dbo].[gspi_site_inventory]([owned_by] ASC);

