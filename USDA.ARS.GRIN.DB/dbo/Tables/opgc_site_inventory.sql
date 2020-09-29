CREATE TABLE [dbo].[opgc_site_inventory] (
    [opgc_site_inventory_id]     INT             IDENTITY (1, 1) NOT NULL,
    [inventory_id]               INT             NOT NULL,
    [hundred_weight]             DECIMAL (18, 5) NULL,
    [location_code]              NVARCHAR (20)   NULL,
    [location_type_code]         NVARCHAR (20)   NULL,
    [old_inventory_identifier]   NVARCHAR (30)   NULL,
    [farm_field_identifier_code] NVARCHAR (20)   NULL,
    [cage_greenhouse]            INT             NULL,
    [technique_code]             NVARCHAR (20)   NULL,
    [pollination_control_code]   NVARCHAR (20)   NULL,
    [note]                       NVARCHAR (MAX)  NULL,
    [created_date]               DATETIME2 (7)   NOT NULL,
    [created_by]                 INT             NOT NULL,
    [modified_date]              DATETIME2 (7)   NULL,
    [modified_by]                INT             NULL,
    [owned_date]                 DATETIME2 (7)   NOT NULL,
    [owned_by]                   INT             NOT NULL,
    CONSTRAINT [PK_opgc_site_inventory] PRIMARY KEY CLUSTERED ([opgc_site_inventory_id] ASC),
    CONSTRAINT [fk_opgcsi_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_opgcsi_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_opgcsi_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_opgcsi_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_opgcsi_created]
    ON [dbo].[opgc_site_inventory]([created_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_fk_opgcsi_i]
    ON [dbo].[opgc_site_inventory]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_opgcsi_modified]
    ON [dbo].[opgc_site_inventory]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_opgcsi_owned]
    ON [dbo].[opgc_site_inventory]([owned_by] ASC);

