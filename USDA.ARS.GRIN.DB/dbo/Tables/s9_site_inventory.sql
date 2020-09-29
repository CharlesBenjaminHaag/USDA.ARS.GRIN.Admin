CREATE TABLE [dbo].[s9_site_inventory] (
    [s9_site_inventory_id]       INT             IDENTITY (1, 1) NOT NULL,
    [inventory_id]               INT             NOT NULL,
    [increase_location_code]     NVARCHAR (20)   NULL,
    [plot_number]                NVARCHAR (20)   NULL,
    [hundred_weight]             DECIMAL (18, 5) NULL,
    [pollination_procedure_code] NVARCHAR (20)   NULL,
    [virus_status_code]          NVARCHAR (20)   NULL,
    [note]                       NVARCHAR (MAX)  NULL,
    [created_date]               DATETIME2 (7)   NOT NULL,
    [created_by]                 INT             NOT NULL,
    [modified_date]              DATETIME2 (7)   NULL,
    [modified_by]                INT             NULL,
    [owned_date]                 DATETIME2 (7)   NOT NULL,
    [owned_by]                   INT             NOT NULL,
    CONSTRAINT [PK_s9_site_inventory] PRIMARY KEY CLUSTERED ([s9_site_inventory_id] ASC),
    CONSTRAINT [fk_s9si_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_s9si_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_s9si_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_s9si_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_s9si_created]
    ON [dbo].[s9_site_inventory]([created_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_fk_s9si_i]
    ON [dbo].[s9_site_inventory]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_s9si_modified]
    ON [dbo].[s9_site_inventory]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_s9si_owned]
    ON [dbo].[s9_site_inventory]([owned_by] ASC);

