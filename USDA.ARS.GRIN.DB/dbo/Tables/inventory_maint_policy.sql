CREATE TABLE [dbo].[inventory_maint_policy] (
    [inventory_maint_policy_id]      INT             IDENTITY (1, 1) NOT NULL,
    [maintenance_name]               NVARCHAR (50)   NOT NULL,
    [form_type_code]                 NVARCHAR (20)   NOT NULL,
    [quantity_on_hand_unit_code]     NVARCHAR (20)   NULL,
    [web_availability_note]          NVARCHAR (MAX)  NULL,
    [is_auto_deducted]               NVARCHAR (1)    NOT NULL,
    [distribution_default_form_code] NVARCHAR (20)   NOT NULL,
    [distribution_default_quantity]  DECIMAL (18, 5) NULL,
    [distribution_unit_code]         NVARCHAR (20)   NULL,
    [distribution_critical_quantity] DECIMAL (18, 5) NULL,
    [regeneration_critical_quantity] DECIMAL (18, 5) NULL,
    [regeneration_method_code]       NVARCHAR (20)   NULL,
    [curator_cooperator_id]          INT             NULL,
    [note]                           NVARCHAR (MAX)  NULL,
    [created_date]                   DATETIME2 (7)   NOT NULL,
    [created_by]                     INT             NOT NULL,
    [modified_date]                  DATETIME2 (7)   NULL,
    [modified_by]                    INT             NULL,
    [owned_date]                     DATETIME2 (7)   NOT NULL,
    [owned_by]                       INT             NOT NULL,
    CONSTRAINT [PK_inventory_maint_policy] PRIMARY KEY CLUSTERED ([inventory_maint_policy_id] ASC),
    CONSTRAINT [fk_im_co] FOREIGN KEY ([curator_cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_im_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_im_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_im_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_im_co]
    ON [dbo].[inventory_maint_policy]([curator_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_im_created]
    ON [dbo].[inventory_maint_policy]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_im_modified]
    ON [dbo].[inventory_maint_policy]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_im_owned]
    ON [dbo].[inventory_maint_policy]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_im]
    ON [dbo].[inventory_maint_policy]([maintenance_name] ASC);

