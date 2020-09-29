CREATE TABLE [dbo].[nc7_site_inventory] (
    [nc7_site_inventory_id]         INT             IDENTITY (1, 1) NOT NULL,
    [inventory_id]                  INT             NOT NULL,
    [hundred_weight]                DECIMAL (18, 5) NULL,
    [pollination_control_code]      NVARCHAR (20)   NULL,
    [farm_field_identifier_code]    NVARCHAR (20)   NULL,
    [location_type_code]            NVARCHAR (20)   NULL,
    [location_low]                  NVARCHAR (10)   NULL,
    [location_high]                 NVARCHAR (10)   NULL,
    [sublocation_type_code]         NVARCHAR (20)   NULL,
    [sublocation_low]               NVARCHAR (10)   NULL,
    [sublocation_high]              NVARCHAR (10)   NULL,
    [old_inventory_identifier]      NVARCHAR (30)   NULL,
    [inventory_site_note]           NVARCHAR (MAX)  NULL,
    [inventory_location1_latitude]  DECIMAL (18, 8) NULL,
    [inventory_location1_longitude] DECIMAL (18, 8) NULL,
    [inventory_location1_precision] INT             NULL,
    [inventory_location2_latitude]  DECIMAL (18, 8) NULL,
    [inventory_location2_longitude] DECIMAL (18, 8) NULL,
    [inventory_location2_precision] INT             NULL,
    [inventory_datum_code]          NVARCHAR (20)   NULL,
    [coordinates_apply_to_code]     NVARCHAR (20)   NULL,
    [coordinates_comment]           NVARCHAR (MAX)  NULL,
    [coordinates_voucher_location]  NVARCHAR (500)  NULL,
    [irregular_inventory_location]  NVARCHAR (500)  NULL,
    [is_increase_success_flag]      NVARCHAR (1)    NULL,
    [reason_unsuccessfull1_code]    NVARCHAR (20)   NULL,
    [reason_unsuccessfull2_code]    NVARCHAR (20)   NULL,
    [reason_unsuccessfull3_code]    NVARCHAR (20)   NULL,
    [reason_unsuccessfull_note]     NVARCHAR (MAX)  NULL,
    [created_date]                  DATETIME2 (7)   NOT NULL,
    [created_by]                    INT             NOT NULL,
    [modified_date]                 DATETIME2 (7)   NULL,
    [modified_by]                   INT             NULL,
    [owned_date]                    DATETIME2 (7)   NOT NULL,
    [owned_by]                      INT             NOT NULL,
    CONSTRAINT [PK_nc7_site_inventory] PRIMARY KEY CLUSTERED ([nc7_site_inventory_id] ASC),
    CONSTRAINT [fk_nc7si_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_nc7si_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_nc7si_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_nc7si_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_nc7si_created]
    ON [dbo].[nc7_site_inventory]([created_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_fk_nc7si_i]
    ON [dbo].[nc7_site_inventory]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_nc7si_modified]
    ON [dbo].[nc7_site_inventory]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_nc7si_owned]
    ON [dbo].[nc7_site_inventory]([owned_by] ASC);

