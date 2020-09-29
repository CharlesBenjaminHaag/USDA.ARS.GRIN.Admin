CREATE TABLE [dbo].[order_request_phyto_log] (
    [order_request_phyto_log_id]   INT            IDENTITY (1, 1) NOT NULL,
    [order_request_id]             INT            NOT NULL,
    [received_date]                DATETIME2 (7)  NOT NULL,
    [opened_date]                  DATETIME2 (7)  NULL,
    [number_of_packages]           NVARCHAR (20)  NULL,
    [number_of_items]              INT            NULL,
    [major_genus]                  NVARCHAR (100) NULL,
    [import_permit_identifier]     NVARCHAR (60)  NULL,
    [setup_inspection_date]        DATETIME2 (7)  NULL,
    [inspected_date]               DATETIME2 (7)  NULL,
    [inspected_by_cooperator_id]   INT            NULL,
    [phyto_certificate_type_code]  NVARCHAR (20)  NULL,
    [certificate_cost]             INT            NULL,
    [phyto_certificate_identifier] NVARCHAR (60)  NULL,
    [shipped_date]                 DATETIME2 (7)  NULL,
    [shipping_carrier]             NVARCHAR (60)  NULL,
    [tracking_identifier]          NVARCHAR (100) NULL,
    [passed_inspection]            NVARCHAR (1)   NULL,
    [delivered]                    NVARCHAR (1)   NULL,
    [delivered_date]               DATETIME2 (7)  NULL,
    [note]                         NVARCHAR (MAX) NULL,
    [created_date]                 DATETIME2 (7)  NOT NULL,
    [created_by]                   INT            NOT NULL,
    [modified_date]                DATETIME2 (7)  NULL,
    [modified_by]                  INT            NULL,
    [owned_date]                   DATETIME2 (7)  NOT NULL,
    [owned_by]                     INT            NOT NULL,
    CONSTRAINT [PK_order_request_phyto_log] PRIMARY KEY CLUSTERED ([order_request_phyto_log_id] ASC),
    CONSTRAINT [fk_orpl_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_orpl_inspected_c] FOREIGN KEY ([inspected_by_cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_orpl_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_orpl_or] FOREIGN KEY ([order_request_id]) REFERENCES [dbo].[order_request] ([order_request_id]),
    CONSTRAINT [fk_orpl_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_orpl_created]
    ON [dbo].[order_request_phyto_log]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_orpl_inspected_c]
    ON [dbo].[order_request_phyto_log]([inspected_by_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_orpl_modified]
    ON [dbo].[order_request_phyto_log]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_orpl_or]
    ON [dbo].[order_request_phyto_log]([order_request_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_orpl_owned]
    ON [dbo].[order_request_phyto_log]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_orpl]
    ON [dbo].[order_request_phyto_log]([order_request_id] ASC, [phyto_certificate_type_code] ASC, [phyto_certificate_identifier] ASC);

