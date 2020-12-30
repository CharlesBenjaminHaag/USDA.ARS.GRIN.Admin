﻿CREATE TABLE [geneva_site_inventory] (
    [geneva_site_inventory_id] INT            IDENTITY (1, 1) NOT NULL,
    [inventory_id]             INT            NOT NULL,
    [restriction_code]         NVARCHAR (20)  NULL,
    [flower_type_code]         NVARCHAR (20)  NULL,
    [trueness_to_type_code]    NVARCHAR (20)  NULL,
    [note]                     NVARCHAR (MAX) NULL,
    [created_date]             DATETIME2 (7)  NOT NULL,
    [created_by]               INT            NOT NULL,
    [modified_date]            DATETIME2 (7)  NULL,
    [modified_by]              INT            NULL,
    [owned_date]               DATETIME2 (7)  NOT NULL,
    [owned_by]                 INT            NOT NULL,
    CONSTRAINT [PK_geneva_site_inventory] PRIMARY KEY CLUSTERED ([geneva_site_inventory_id] ASC),
    CONSTRAINT [fk_gsi_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_gsi_i] FOREIGN KEY ([inventory_id]) REFERENCES [inventory] ([inventory_id]),
    CONSTRAINT [fk_gsi_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_gsi_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_gsi_created]
    ON [geneva_site_inventory]([created_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_fk_gsi_i]
    ON [geneva_site_inventory]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_gsi_modified]
    ON [geneva_site_inventory]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_gsi_owned]
    ON [geneva_site_inventory]([owned_by] ASC);


GO
GRANT DELETE
    ON OBJECT::[geneva_site_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[geneva_site_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[geneva_site_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[geneva_site_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[geneva_site_inventory] TO [gg_search]
    AS [dbo];
