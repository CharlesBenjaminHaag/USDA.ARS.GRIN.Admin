CREATE TABLE [dbo].[taxonomy_family] (
    [taxonomy_family_id]         INT            IDENTITY (1, 1) NOT NULL,
    [current_taxonomy_family_id] INT            NULL,
    [type_taxonomy_genus_id]     INT            NULL,
    [suprafamily_rank_code]      NVARCHAR (20)  NULL,
    [suprafamily_rank_name]      NVARCHAR (100) NULL,
    [family_name]                NVARCHAR (25)  NOT NULL,
    [family_authority]           NVARCHAR (100) NULL,
    [alternate_name]             NVARCHAR (25)  NULL,
    [subfamily_name]             NVARCHAR (25)  NULL,
    [tribe_name]                 NVARCHAR (25)  NULL,
    [subtribe_name]              NVARCHAR (25)  NULL,
    [note]                       NVARCHAR (MAX) NULL,
    [created_date]               DATETIME2 (7)  NOT NULL,
    [created_by]                 INT            NOT NULL,
    [modified_date]              DATETIME2 (7)  NULL,
    [modified_by]                INT            NULL,
    [owned_date]                 DATETIME2 (7)  NOT NULL,
    [owned_by]                   INT            NOT NULL,
    CONSTRAINT [PK_taxonomy_family] PRIMARY KEY CLUSTERED ([taxonomy_family_id] ASC),
    CONSTRAINT [fk_tf_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tf_cur_tf] FOREIGN KEY ([current_taxonomy_family_id]) REFERENCES [dbo].[taxonomy_family] ([taxonomy_family_id]),
    CONSTRAINT [fk_tf_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tf_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tf_tg] FOREIGN KEY ([type_taxonomy_genus_id]) REFERENCES [dbo].[taxonomy_genus] ([taxonomy_genus_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tf_created]
    ON [dbo].[taxonomy_family]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tf_cur_tf]
    ON [dbo].[taxonomy_family]([current_taxonomy_family_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tf_modified]
    ON [dbo].[taxonomy_family]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tf_owned]
    ON [dbo].[taxonomy_family]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_tf_alt_name]
    ON [dbo].[taxonomy_family]([alternate_name] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_tf_name]
    ON [dbo].[taxonomy_family]([family_name] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tf]
    ON [dbo].[taxonomy_family]([family_name] ASC, [family_authority] ASC, [subfamily_name] ASC, [tribe_name] ASC, [subtribe_name] ASC);

