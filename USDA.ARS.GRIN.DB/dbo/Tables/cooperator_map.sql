CREATE TABLE [dbo].[cooperator_map] (
    [cooperator_map_id]   INT            IDENTITY (1, 1) NOT NULL,
    [cooperator_id]       INT            NOT NULL,
    [cooperator_group_id] INT            NOT NULL,
    [note]                NVARCHAR (MAX) NULL,
    [created_date]        DATETIME2 (7)  NOT NULL,
    [created_by]          INT            NOT NULL,
    [modified_date]       DATETIME2 (7)  NULL,
    [modified_by]         INT            NULL,
    [owned_date]          DATETIME2 (7)  NOT NULL,
    [owned_by]            INT            NOT NULL,
    CONSTRAINT [PK_cooperator_map] PRIMARY KEY CLUSTERED ([cooperator_map_id] ASC),
    CONSTRAINT [fk_cm_c] FOREIGN KEY ([cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cm_cg] FOREIGN KEY ([cooperator_group_id]) REFERENCES [dbo].[cooperator_group] ([cooperator_group_id]),
    CONSTRAINT [fk_cm_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cm_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cm_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cm_c]
    ON [dbo].[cooperator_map]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cm_cg]
    ON [dbo].[cooperator_map]([cooperator_group_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cm_created]
    ON [dbo].[cooperator_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cm_modified]
    ON [dbo].[cooperator_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cm_owned]
    ON [dbo].[cooperator_map]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_cm]
    ON [dbo].[cooperator_map]([cooperator_id] ASC, [cooperator_group_id] ASC);

