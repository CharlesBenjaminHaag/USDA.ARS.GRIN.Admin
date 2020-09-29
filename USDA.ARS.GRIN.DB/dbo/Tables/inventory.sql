CREATE TABLE [dbo].[inventory] (
    [inventory_id]                   INT             IDENTITY (1, 1) NOT NULL,
    [inventory_number_part1]         NVARCHAR (50)   NOT NULL,
    [inventory_number_part2]         INT             NULL,
    [inventory_number_part3]         NVARCHAR (50)   NULL,
    [form_type_code]                 NVARCHAR (20)   NOT NULL,
    [inventory_maint_policy_id]      INT             NOT NULL,
    [is_distributable]               NVARCHAR (1)    NOT NULL,
    [storage_location_part1]         NVARCHAR (20)   NULL,
    [storage_location_part2]         NVARCHAR (20)   NULL,
    [storage_location_part3]         NVARCHAR (20)   NULL,
    [storage_location_part4]         NVARCHAR (20)   NULL,
    [latitude]                       DECIMAL (18, 8) NULL,
    [longitude]                      DECIMAL (18, 8) NULL,
    [is_available]                   NVARCHAR (1)    NOT NULL,
    [web_availability_note]          NVARCHAR (MAX)  NULL,
    [availability_status_code]       NVARCHAR (20)   NOT NULL,
    [availability_status_note]       NVARCHAR (MAX)  NULL,
    [availability_start_date]        DATETIME2 (7)   NULL,
    [availability_end_date]          DATETIME2 (7)   NULL,
    [quantity_on_hand]               DECIMAL (18, 5) NULL,
    [quantity_on_hand_unit_code]     NVARCHAR (20)   NULL,
    [is_auto_deducted]               NVARCHAR (1)    NOT NULL,
    [distribution_default_form_code] NVARCHAR (20)   NULL,
    [distribution_default_quantity]  DECIMAL (18, 5) NULL,
    [distribution_unit_code]         NVARCHAR (20)   NULL,
    [distribution_critical_quantity] DECIMAL (18, 5) NULL,
    [regeneration_critical_quantity] DECIMAL (18, 5) NULL,
    [pathogen_status_code]           NVARCHAR (20)   NULL,
    [accession_id]                   INT             NOT NULL,
    [parent_inventory_id]            INT             NULL,
    [backup_inventory_id]            INT             NULL,
    [rootstock]                      NVARCHAR (200)  NULL,
    [hundred_seed_weight]            DECIMAL (18, 7) NULL,
    [pollination_method_code]        NVARCHAR (20)   NULL,
    [pollination_vector_code]        NVARCHAR (20)   NULL,
    [preservation_method_id]         INT             NULL,
    [regeneration_method_id]         INT             NULL,
    [plant_sex_code]                 NVARCHAR (20)   NULL,
    [propagation_date]               DATETIME2 (7)   NULL,
    [propagation_date_code]          NVARCHAR (20)   NULL,
    [note]                           NVARCHAR (MAX)  NULL,
    [created_date]                   DATETIME2 (7)   NOT NULL,
    [created_by]                     INT             NOT NULL,
    [modified_date]                  DATETIME2 (7)   NULL,
    [modified_by]                    INT             NULL,
    [owned_date]                     DATETIME2 (7)   NOT NULL,
    [owned_by]                       INT             NOT NULL,
    [digital_object_identifier]      NVARCHAR (200)  NULL,
    CONSTRAINT [PK_inventory] PRIMARY KEY CLUSTERED ([inventory_id] ASC),
    CONSTRAINT [fk_i_a] FOREIGN KEY ([accession_id]) REFERENCES [dbo].[accession] ([accession_id]),
    CONSTRAINT [fk_i_backup_i] FOREIGN KEY ([backup_inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_i_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_i_im] FOREIGN KEY ([inventory_maint_policy_id]) REFERENCES [dbo].[inventory_maint_policy] ([inventory_maint_policy_id]),
    CONSTRAINT [fk_i_m1] FOREIGN KEY ([preservation_method_id]) REFERENCES [dbo].[method] ([method_id]),
    CONSTRAINT [fk_i_m2] FOREIGN KEY ([regeneration_method_id]) REFERENCES [dbo].[method] ([method_id]),
    CONSTRAINT [fk_i_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_i_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_i_parent_i] FOREIGN KEY ([parent_inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_i_a]
    ON [dbo].[inventory]([accession_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_i_backup_i]
    ON [dbo].[inventory]([backup_inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_i_created]
    ON [dbo].[inventory]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_i_im]
    ON [dbo].[inventory]([inventory_maint_policy_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_i_m1]
    ON [dbo].[inventory]([preservation_method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_i_m2]
    ON [dbo].[inventory]([regeneration_method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_i_modified]
    ON [dbo].[inventory]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_i_owned]
    ON [dbo].[inventory]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_i_parent_i]
    ON [dbo].[inventory]([parent_inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_inv_number]
    ON [dbo].[inventory]([inventory_number_part2] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_inv_part3]
    ON [dbo].[inventory]([inventory_number_part3] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_inv_prefix]
    ON [dbo].[inventory]([inventory_number_part1] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_inv]
    ON [dbo].[inventory]([inventory_number_part1] ASC, [inventory_number_part2] ASC, [inventory_number_part3] ASC, [form_type_code] ASC);


GO
CREATE STATISTICS [_dta_stat_1957582012_29_1]
    ON [dbo].[inventory]([accession_id], [inventory_id]);

