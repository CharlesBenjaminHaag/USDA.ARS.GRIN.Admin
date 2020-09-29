CREATE TABLE [dbo].[inventory_action] (
    [inventory_action_id] INT             IDENTITY (1, 1) NOT NULL,
    [inventory_id]        INT             NOT NULL,
    [action_name_code]    NVARCHAR (20)   NOT NULL,
    [started_date]        DATETIME2 (7)   NULL,
    [started_date_code]   NVARCHAR (20)   NULL,
    [completed_date]      DATETIME2 (7)   NULL,
    [completed_date_code] NVARCHAR (20)   NULL,
    [quantity]            DECIMAL (18, 5) NULL,
    [quantity_unit_code]  NVARCHAR (20)   NULL,
    [form_code]           NVARCHAR (20)   NULL,
    [cooperator_id]       INT             NULL,
    [method_id]           INT             NULL,
    [note]                NVARCHAR (MAX)  NULL,
    [created_date]        DATETIME2 (7)   NOT NULL,
    [created_by]          INT             NOT NULL,
    [modified_date]       DATETIME2 (7)   NULL,
    [modified_by]         INT             NULL,
    [owned_date]          DATETIME2 (7)   NOT NULL,
    [owned_by]            INT             NOT NULL,
    CONSTRAINT [PK_inventory_action] PRIMARY KEY CLUSTERED ([inventory_action_id] ASC),
    CONSTRAINT [fk_ia_c] FOREIGN KEY ([cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ia_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ia_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_ia_m] FOREIGN KEY ([method_id]) REFERENCES [dbo].[method] ([method_id]),
    CONSTRAINT [fk_ia_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ia_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ia_c]
    ON [dbo].[inventory_action]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ia_created]
    ON [dbo].[inventory_action]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ia_i]
    ON [dbo].[inventory_action]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ia_m]
    ON [dbo].[inventory_action]([method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ia_modified]
    ON [dbo].[inventory_action]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ia_owned]
    ON [dbo].[inventory_action]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ia]
    ON [dbo].[inventory_action]([inventory_id] ASC, [action_name_code] ASC, [started_date] ASC, [completed_date] ASC, [form_code] ASC, [quantity] ASC, [method_id] ASC, [cooperator_id] ASC);

