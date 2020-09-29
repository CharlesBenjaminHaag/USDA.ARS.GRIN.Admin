CREATE TABLE [dbo].[exploration_map] (
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
    CONSTRAINT [fk_exm_c] FOREIGN KEY ([cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_exm_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_exm_ex] FOREIGN KEY ([exploration_id]) REFERENCES [dbo].[exploration] ([exploration_id]),
    CONSTRAINT [fk_exm_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_exm_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_exm_c]
    ON [dbo].[exploration_map]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_exm_created]
    ON [dbo].[exploration_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_exm_ex]
    ON [dbo].[exploration_map]([exploration_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_exm_modified]
    ON [dbo].[exploration_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_exm_owned]
    ON [dbo].[exploration_map]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_exm]
    ON [dbo].[exploration_map]([exploration_id] ASC, [cooperator_id] ASC);

