CREATE TABLE [dbo].[ne9_site_inventory] (
    [ne9_site_inventory_id]   INT             IDENTITY (1, 1) NOT NULL,
    [inventory_id]            INT             NOT NULL,
    [lot_type_code]           NVARCHAR (20)   NULL,
    [inventory_purpose_code]  NVARCHAR (20)   NULL,
    [pollination_proc_code]   NVARCHAR (20)   NULL,
    [pollination_vector_code] NVARCHAR (20)   NULL,
    [pollination_env_code]    NVARCHAR (20)   NULL,
    [hundred_weight]          DECIMAL (18, 5) NULL,
    [parent_2]                NVARCHAR (25)   NULL,
    [parent_3]                NVARCHAR (25)   NULL,
    [parent_4]                NVARCHAR (25)   NULL,
    [parent_5]                NVARCHAR (25)   NULL,
    [note]                    NVARCHAR (MAX)  NULL,
    [created_date]            DATETIME2 (7)   NOT NULL,
    [created_by]              INT             NOT NULL,
    [modified_date]           DATETIME2 (7)   NULL,
    [modified_by]             INT             NULL,
    [owned_date]              DATETIME2 (7)   NOT NULL,
    [owned_by]                INT             NOT NULL,
    CONSTRAINT [PK_ne9_site_inventory] PRIMARY KEY CLUSTERED ([ne9_site_inventory_id] ASC),
    CONSTRAINT [fk_ne9si_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ne9si_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_ne9si_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ne9si_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ne9si_created]
    ON [dbo].[ne9_site_inventory]([created_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_fk_ne9si_i]
    ON [dbo].[ne9_site_inventory]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ne9si_modified]
    ON [dbo].[ne9_site_inventory]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ne9si_owned]
    ON [dbo].[ne9_site_inventory]([owned_by] ASC);

