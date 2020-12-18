CREATE TABLE [method_map] (
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
    CONSTRAINT [fk_mm_c] FOREIGN KEY ([cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_mm_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_mm_m] FOREIGN KEY ([method_id]) REFERENCES [method] ([method_id]),
    CONSTRAINT [fk_mm_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_mm_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mm_c]
    ON [method_map]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mm_created]
    ON [method_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mm_m]
    ON [method_map]([method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mm_modified]
    ON [method_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mm_owned]
    ON [method_map]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_mm]
    ON [method_map]([cooperator_id] ASC, [method_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[method_map] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[method_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[method_map] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[method_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[method_map] TO [gg_search]
    AS [dbo];

