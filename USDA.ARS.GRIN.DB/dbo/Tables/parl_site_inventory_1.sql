CREATE TABLE [parl_site_inventory] (
    [parl_site_inventory_id]     INT             IDENTITY (1, 1) NOT NULL,
    [inventory_id]               INT             NOT NULL,
    [seed_quantity]              INT             NULL,
    [seed_quantity_type]         INT             NULL,
    [seed_age]                   NVARCHAR (20)   NULL,
    [hundred_weight]             DECIMAL (18, 5) NULL,
    [increase_location]          NVARCHAR (20)   NULL,
    [increase_year]              INT             NULL,
    [lot_type_code]              NVARCHAR (20)   NULL,
    [pollination_vector_code]    NVARCHAR (20)   NULL,
    [pollination_environment]    NVARCHAR (20)   NULL,
    [pollination_procedure_code] NVARCHAR (20)   NULL,
    [plot]                       NVARCHAR (20)   NULL,
    [note]                       NVARCHAR (MAX)  NULL,
    [created_date]               DATETIME2 (7)   NOT NULL,
    [created_by]                 INT             NOT NULL,
    [modified_date]              DATETIME2 (7)   NULL,
    [modified_by]                INT             NULL,
    [owned_date]                 DATETIME2 (7)   NOT NULL,
    [owned_by]                   INT             NOT NULL,
    CONSTRAINT [PK_parl_site_inventory] PRIMARY KEY CLUSTERED ([parl_site_inventory_id] ASC),
    CONSTRAINT [fk_parlsi_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_parlsi_i] FOREIGN KEY ([inventory_id]) REFERENCES [inventory] ([inventory_id]),
    CONSTRAINT [fk_parlsi_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_parlsi_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_parlsi_created]
    ON [parl_site_inventory]([created_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_fk_parlsi_i]
    ON [parl_site_inventory]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_parlsi_modified]
    ON [parl_site_inventory]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_parlsi_owned]
    ON [parl_site_inventory]([owned_by] ASC);


GO
GRANT DELETE
    ON OBJECT::[parl_site_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[parl_site_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[parl_site_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[parl_site_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[parl_site_inventory] TO [gg_search]
    AS [dbo];

