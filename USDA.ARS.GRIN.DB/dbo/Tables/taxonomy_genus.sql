CREATE TABLE [dbo].[taxonomy_genus] (
    [taxonomy_genus_id]         INT            IDENTITY (1, 1) NOT NULL,
    [current_taxonomy_genus_id] INT            NULL,
    [taxonomy_family_id]        INT            NOT NULL,
    [qualifying_code]           NVARCHAR (20)  NULL,
    [hybrid_code]               NVARCHAR (20)  NULL,
    [genus_name]                NVARCHAR (30)  NOT NULL,
    [genus_authority]           NVARCHAR (100) NULL,
    [subgenus_name]             NVARCHAR (30)  NULL,
    [section_name]              NVARCHAR (30)  NULL,
    [subsection_name]           NVARCHAR (30)  NULL,
    [series_name]               NVARCHAR (30)  NULL,
    [subseries_name]            NVARCHAR (30)  NULL,
    [note]                      NVARCHAR (MAX) NULL,
    [created_date]              DATETIME2 (7)  NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  NOT NULL,
    [owned_by]                  INT            NOT NULL,
    CONSTRAINT [PK_taxonomy_genus] PRIMARY KEY CLUSTERED ([taxonomy_genus_id] ASC),
    CONSTRAINT [fk_tg_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tg_cur_tgt] FOREIGN KEY ([current_taxonomy_genus_id]) REFERENCES [dbo].[taxonomy_genus] ([taxonomy_genus_id]),
    CONSTRAINT [fk_tg_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tg_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tg_tf] FOREIGN KEY ([taxonomy_family_id]) REFERENCES [dbo].[taxonomy_family] ([taxonomy_family_id])
);


GO
CREATE NONCLUSTERED INDEX [fk_tg_cur_tg]
    ON [dbo].[taxonomy_genus]([current_taxonomy_genus_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tg_created]
    ON [dbo].[taxonomy_genus]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tg_modified]
    ON [dbo].[taxonomy_genus]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tg_owned]
    ON [dbo].[taxonomy_genus]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tg_tf]
    ON [dbo].[taxonomy_genus]([taxonomy_family_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_tg_name]
    ON [dbo].[taxonomy_genus]([genus_name] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tg]
    ON [dbo].[taxonomy_genus]([taxonomy_family_id] ASC, [genus_name] ASC, [genus_authority] ASC, [subgenus_name] ASC, [section_name] ASC, [subsection_name] ASC, [series_name] ASC, [subseries_name] ASC);

