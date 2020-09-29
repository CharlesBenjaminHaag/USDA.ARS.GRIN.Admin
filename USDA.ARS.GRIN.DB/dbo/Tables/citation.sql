CREATE TABLE [dbo].[citation] (
    [citation_id]           INT             IDENTITY (1, 1) NOT NULL,
    [literature_id]         INT             NULL,
    [citation_title]        NVARCHAR (400)  NULL,
    [author_name]           NVARCHAR (2000) NULL,
    [citation_year]         INT             NULL,
    [reference]             NVARCHAR (200)  NULL,
    [doi_reference]         NVARCHAR (500)  NULL,
    [url]                   NVARCHAR (500)  NULL,
    [title]                 NVARCHAR (500)  NULL,
    [description]           NVARCHAR (500)  NULL,
    [accession_id]          INT             NULL,
    [method_id]             INT             NULL,
    [taxonomy_species_id]   INT             NULL,
    [taxonomy_genus_id]     INT             NULL,
    [taxonomy_family_id]    INT             NULL,
    [accession_ipr_id]      INT             NULL,
    [accession_pedigree_id] INT             NULL,
    [genetic_marker_id]     INT             NULL,
    [type_code]             NVARCHAR (20)   NULL,
    [unique_key]            INT             NULL,
    [is_accepted_name]      NVARCHAR (1)    NOT NULL,
    [note]                  NVARCHAR (MAX)  NULL,
    [created_date]          DATETIME2 (7)   NOT NULL,
    [created_by]            INT             NOT NULL,
    [modified_date]         DATETIME2 (7)   NULL,
    [modified_by]           INT             NULL,
    [owned_date]            DATETIME2 (7)   NOT NULL,
    [owned_by]              INT             NOT NULL,
    CONSTRAINT [PK_citation] PRIMARY KEY CLUSTERED ([citation_id] ASC),
    CONSTRAINT [fk_ci_a] FOREIGN KEY ([accession_id]) REFERENCES [dbo].[accession] ([accession_id]),
    CONSTRAINT [fk_ci_aipr] FOREIGN KEY ([accession_ipr_id]) REFERENCES [dbo].[accession_ipr] ([accession_ipr_id]),
    CONSTRAINT [fk_ci_ap] FOREIGN KEY ([accession_pedigree_id]) REFERENCES [dbo].[accession_pedigree] ([accession_pedigree_id]),
    CONSTRAINT [fk_ci_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ci_gm] FOREIGN KEY ([genetic_marker_id]) REFERENCES [dbo].[genetic_marker] ([genetic_marker_id]),
    CONSTRAINT [fk_ci_l] FOREIGN KEY ([literature_id]) REFERENCES [dbo].[literature] ([literature_id]),
    CONSTRAINT [fk_ci_m] FOREIGN KEY ([method_id]) REFERENCES [dbo].[method] ([method_id]),
    CONSTRAINT [fk_ci_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ci_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ci_tf] FOREIGN KEY ([taxonomy_family_id]) REFERENCES [dbo].[taxonomy_family] ([taxonomy_family_id]),
    CONSTRAINT [fk_ci_tg] FOREIGN KEY ([taxonomy_genus_id]) REFERENCES [dbo].[taxonomy_genus] ([taxonomy_genus_id]),
    CONSTRAINT [fk_ci_ts] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ci_a]
    ON [dbo].[citation]([accession_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ci_aipr]
    ON [dbo].[citation]([accession_ipr_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ci_ap]
    ON [dbo].[citation]([accession_pedigree_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ci_created]
    ON [dbo].[citation]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ci_gm]
    ON [dbo].[citation]([genetic_marker_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ci_l]
    ON [dbo].[citation]([literature_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ci_m]
    ON [dbo].[citation]([method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ci_modified]
    ON [dbo].[citation]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ci_owned]
    ON [dbo].[citation]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ci_tf]
    ON [dbo].[citation]([taxonomy_family_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ci_tg]
    ON [dbo].[citation]([taxonomy_genus_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ci_ts]
    ON [dbo].[citation]([taxonomy_species_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_cit]
    ON [dbo].[citation]([literature_id] ASC, [citation_title] ASC, [accession_id] ASC, [method_id] ASC, [taxonomy_species_id] ASC, [taxonomy_genus_id] ASC, [taxonomy_family_id] ASC, [accession_ipr_id] ASC, [accession_pedigree_id] ASC, [genetic_marker_id] ASC, [type_code] ASC, [unique_key] ASC);

