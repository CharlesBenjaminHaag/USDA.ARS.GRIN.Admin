CREATE TABLE [dbo].[taxonomy_attach] (
    [taxonomy_attach_id]     INT            IDENTITY (1, 1) NOT NULL,
    [taxonomy_family_id]     INT            NULL,
    [taxonomy_genus_id]      INT            NULL,
    [taxonomy_species_id]    INT            NULL,
    [virtual_path]           NVARCHAR (255) NOT NULL,
    [thumbnail_virtual_path] NVARCHAR (255) NULL,
    [sort_order]             INT            NULL,
    [title]                  NVARCHAR (500) NULL,
    [description]            NVARCHAR (500) NULL,
    [content_type]           NVARCHAR (100) NULL,
    [category_code]          NVARCHAR (20)  NULL,
    [is_web_visible]         NVARCHAR (1)   DEFAULT ('Y') NOT NULL,
    [copyright_information]  NVARCHAR (100) NULL,
    [attach_cooperator_id]   INT            NULL,
    [note]                   NVARCHAR (MAX) NULL,
    [created_date]           DATETIME2 (7)  NOT NULL,
    [created_by]             INT            NOT NULL,
    [modified_date]          DATETIME2 (7)  NULL,
    [modified_by]            INT            NULL,
    [owned_date]             DATETIME2 (7)  NOT NULL,
    [owned_by]               INT            NOT NULL,
    CONSTRAINT [PK_taxonomy_attach] PRIMARY KEY CLUSTERED ([taxonomy_attach_id] ASC),
    CONSTRAINT [fk_tat_c] FOREIGN KEY ([attach_cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tat_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tat_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tat_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tat_tf] FOREIGN KEY ([taxonomy_family_id]) REFERENCES [dbo].[taxonomy_family] ([taxonomy_family_id]),
    CONSTRAINT [fk_tat_tg] FOREIGN KEY ([taxonomy_genus_id]) REFERENCES [dbo].[taxonomy_genus] ([taxonomy_genus_id]),
    CONSTRAINT [fk_tat_ts] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tat_created]
    ON [dbo].[taxonomy_attach]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tat_modified]
    ON [dbo].[taxonomy_attach]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tat_owned]
    ON [dbo].[taxonomy_attach]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tat_tf]
    ON [dbo].[taxonomy_attach]([taxonomy_family_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tat_tg]
    ON [dbo].[taxonomy_attach]([taxonomy_genus_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tat_ts]
    ON [dbo].[taxonomy_attach]([taxonomy_species_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tat]
    ON [dbo].[taxonomy_attach]([taxonomy_family_id] ASC, [taxonomy_genus_id] ASC, [taxonomy_species_id] ASC, [virtual_path] ASC);

