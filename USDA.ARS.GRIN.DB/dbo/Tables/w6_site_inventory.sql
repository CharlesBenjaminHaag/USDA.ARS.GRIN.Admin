CREATE TABLE [dbo].[w6_site_inventory] (
    [w6_site_inventory_id]  INT             IDENTITY (1, 1) NOT NULL,
    [inventory_id]          INT             NOT NULL,
    [seed_quantity]         INT             NULL,
    [seed_age]              NVARCHAR (20)   NULL,
    [hundred_weight]        DECIMAL (18, 7) NULL,
    [increase_location]     NVARCHAR (20)   NULL,
    [increase_year]         NVARCHAR (4)    NULL,
    [lot_type_code]         NVARCHAR (20)   NULL,
    [pollen_vector_code]    NVARCHAR (20)   NULL,
    [pollen_environment]    NVARCHAR (20)   NULL,
    [pollen_procedure_code] NVARCHAR (20)   NULL,
    [split_inventory_id]    INT             NULL,
    [plot]                  NVARCHAR (30)   NULL,
    [note]                  NVARCHAR (240)  NULL,
    [created_date]          DATETIME2 (7)   NOT NULL,
    [created_by]            INT             NOT NULL,
    [modified_date]         DATETIME2 (7)   NULL,
    [modified_by]           INT             NULL,
    [owned_date]            DATETIME2 (7)   NOT NULL,
    [owned_by]              INT             NOT NULL,
    CONSTRAINT [PK_w6_site_inventory] PRIMARY KEY CLUSTERED ([w6_site_inventory_id] ASC),
    CONSTRAINT [fk_w6ivsi_i] FOREIGN KEY ([split_inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_w6si_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_w6si_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_w6si_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_w6si_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_w6ivsi_i]
    ON [dbo].[w6_site_inventory]([split_inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_w6si_created]
    ON [dbo].[w6_site_inventory]([created_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_fk_w6si_i]
    ON [dbo].[w6_site_inventory]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_w6si_modified]
    ON [dbo].[w6_site_inventory]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_w6si_owned]
    ON [dbo].[w6_site_inventory]([owned_by] ASC);

