CREATE TABLE [exploration_map] (
    [exploration_map_id] INT           IDENTITY (1, 1) NOT NULL,
    [exploration_id]     INT           NOT NULL,
    [cooperator_id]      INT           NOT NULL,
    [created_date]       DATETIME2 (7) NOT NULL,
    [created_by]         INT           NOT NULL,
    [modified_date]      DATETIME2 (7) NULL,
    [modified_by]        INT           NULL,
    [owned_date]         DATETIME2 (7) NOT NULL,
    [owned_by]           INT           NOT NULL,
    CONSTRAINT [PK_exploration_map] PRIMARY KEY CLUSTERED ([exploration_map_id] ASC),
    CONSTRAINT [fk_exm_c] FOREIGN KEY ([cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_exm_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_exm_ex] FOREIGN KEY ([exploration_id]) REFERENCES [exploration] ([exploration_id]),
    CONSTRAINT [fk_exm_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_exm_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_exm_c]
    ON [exploration_map]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_exm_created]
    ON [exploration_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_exm_ex]
    ON [exploration_map]([exploration_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_exm_modified]
    ON [exploration_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_exm_owned]
    ON [exploration_map]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_exm]
    ON [exploration_map]([exploration_id] ASC, [cooperator_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[exploration_map] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[exploration_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[exploration_map] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[exploration_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[exploration_map] TO [gg_search]
    AS [dbo];

