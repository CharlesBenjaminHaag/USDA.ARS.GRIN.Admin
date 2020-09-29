CREATE TABLE [dbo].[method_map] (
    [method_map_id] INT           IDENTITY (1, 1) NOT NULL,
    [cooperator_id] INT           NOT NULL,
    [method_id]     INT           NOT NULL,
    [created_date]  DATETIME2 (7) NOT NULL,
    [created_by]    INT           NOT NULL,
    [modified_date] DATETIME2 (7) NULL,
    [modified_by]   INT           NULL,
    [owned_date]    DATETIME2 (7) NOT NULL,
    [owned_by]      INT           NOT NULL,
    CONSTRAINT [PK_method_map] PRIMARY KEY CLUSTERED ([method_map_id] ASC),
    CONSTRAINT [fk_mm_c] FOREIGN KEY ([cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_mm_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_mm_m] FOREIGN KEY ([method_id]) REFERENCES [dbo].[method] ([method_id]),
    CONSTRAINT [fk_mm_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_mm_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mm_c]
    ON [dbo].[method_map]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mm_created]
    ON [dbo].[method_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mm_m]
    ON [dbo].[method_map]([method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mm_modified]
    ON [dbo].[method_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mm_owned]
    ON [dbo].[method_map]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_mm]
    ON [dbo].[method_map]([cooperator_id] ASC, [method_id] ASC);

