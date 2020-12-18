CREATE TABLE [nssl_site_inventory] (
    [nssl_site_inventory_id] INT             IDENTITY (1, 1) NOT NULL,
    [inventory_id]           INT             NOT NULL,
    [next_test]              NVARCHAR (10)   NULL,
    [hundred_weight]         DECIMAL (18, 5) NULL,
    [moisture_1]             DECIMAL (18, 5) NULL,
    [moisture_1_type_code]   NVARCHAR (20)   NULL,
    [moisture_1_date]        DATETIME2 (7)   NULL,
    [moisture_2]             DECIMAL (18, 5) NULL,
    [moisture_2_type_code]   NVARCHAR (20)   NULL,
    [moisture_2_date]        DATETIME2 (7)   NULL,
    [moisture_3]             DECIMAL (18, 5) NULL,
    [moisture_3_type_code]   NVARCHAR (20)   NULL,
    [moisture_3_date]        DATETIME2 (7)   NULL,
    [moisture_4]             DECIMAL (18, 5) NULL,
    [moisture_4_type_code]   NVARCHAR (20)   NULL,
    [moisture_4_date]        DATETIME2 (7)   NULL,
    [moisture_5]             DECIMAL (18, 5) NULL,
    [moisture_5_type_code]   NVARCHAR (20)   NULL,
    [moisture_5_date]        DATETIME2 (7)   NULL,
    [percent_cleanout]       DECIMAL (18, 5) NULL,
    [estimated_in_LN2]       INT             NULL,
    [note]                   NVARCHAR (MAX)  NULL,
    [created_date]           DATETIME2 (7)   NOT NULL,
    [created_by]             INT             NOT NULL,
    [modified_date]          DATETIME2 (7)   NULL,
    [modified_by]            INT             NULL,
    [owned_date]             DATETIME2 (7)   NOT NULL,
    [owned_by]               INT             NOT NULL,
    [shoots_per_vial]        INT             NULL,
    CONSTRAINT [PK_nssl_site_inventory] PRIMARY KEY CLUSTERED ([nssl_site_inventory_id] ASC),
    CONSTRAINT [fk_nsslsi_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_nsslsi_i] FOREIGN KEY ([inventory_id]) REFERENCES [inventory] ([inventory_id]),
    CONSTRAINT [fk_nsslsi_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_nsslsi_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_nsslsi_created]
    ON [nssl_site_inventory]([created_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_fk_nsslsi_i]
    ON [nssl_site_inventory]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_nsslsi_modified]
    ON [nssl_site_inventory]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_nsslsi_owned]
    ON [nssl_site_inventory]([owned_by] ASC);


GO
GRANT DELETE
    ON OBJECT::[nssl_site_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[nssl_site_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[nssl_site_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[nssl_site_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[nssl_site_inventory] TO [gg_search]
    AS [dbo];

