CREATE TABLE [dbo].[feedback_inventory] (
    [feedback_inventory_id] INT           IDENTITY (1, 1) NOT NULL,
    [feedback_id]           INT           NOT NULL,
    [inventory_id]          INT           NOT NULL,
    [created_date]          DATETIME2 (7) NOT NULL,
    [created_by]            INT           NOT NULL,
    [modified_date]         DATETIME2 (7) NULL,
    [modified_by]           INT           NULL,
    [owned_date]            DATETIME2 (7) NULL,
    [owned_by]              INT           NOT NULL,
    CONSTRAINT [PK_feedback_inventory] PRIMARY KEY CLUSTERED ([feedback_inventory_id] ASC),
    CONSTRAINT [fk_fi_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fi_f] FOREIGN KEY ([feedback_id]) REFERENCES [dbo].[feedback] ([feedback_id]),
    CONSTRAINT [fk_fi_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_fi_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fi_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fi_created]
    ON [dbo].[feedback_inventory]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fi_modified]
    ON [dbo].[feedback_inventory]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fi_owned]
    ON [dbo].[feedback_inventory]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_fi]
    ON [dbo].[feedback_inventory]([feedback_id] ASC, [inventory_id] ASC);

