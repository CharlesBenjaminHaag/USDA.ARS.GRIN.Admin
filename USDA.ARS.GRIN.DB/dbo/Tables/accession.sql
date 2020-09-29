CREATE TABLE [dbo].[accession] (
    [accession_id]                 INT            IDENTITY (1, 1) NOT NULL,
    [doi]                          NVARCHAR (20)  NULL,
    [accession_number_part1]       NVARCHAR (50)  NOT NULL,
    [accession_number_part2]       INT            NULL,
    [accession_number_part3]       NVARCHAR (50)  NULL,
    [is_core]                      NVARCHAR (1)   NOT NULL,
    [is_backed_up]                 NVARCHAR (1)   NOT NULL,
    [backup_location1_site_id]     INT            NULL,
    [backup_location2_site_id]     INT            NULL,
    [status_code]                  NVARCHAR (20)  NOT NULL,
    [life_form_code]               NVARCHAR (20)  NULL,
    [improvement_status_code]      NVARCHAR (20)  NULL,
    [reproductive_uniformity_code] NVARCHAR (20)  NULL,
    [initial_received_form_code]   NVARCHAR (20)  NULL,
    [initial_received_date]        DATETIME2 (7)  NULL,
    [initial_received_date_code]   NVARCHAR (20)  NULL,
    [taxonomy_species_id]          INT            NOT NULL,
    [is_web_visible]               NVARCHAR (1)   CONSTRAINT [DF__accession__is_we__7F60ED59] DEFAULT ('Y') NOT NULL,
    [note]                         NVARCHAR (MAX) NULL,
    [created_date]                 DATETIME2 (7)  NOT NULL,
    [created_by]                   INT            NOT NULL,
    [modified_date]                DATETIME2 (7)  NULL,
    [modified_by]                  INT            NULL,
    [owned_date]                   DATETIME2 (7)  NOT NULL,
    [owned_by]                     INT            NOT NULL,
    CONSTRAINT [PK_accession] PRIMARY KEY CLUSTERED ([accession_id] ASC),
    CONSTRAINT [fk_a_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_a_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_a_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_a_s1] FOREIGN KEY ([backup_location1_site_id]) REFERENCES [dbo].[site] ([site_id]),
    CONSTRAINT [fk_a_s2] FOREIGN KEY ([backup_location2_site_id]) REFERENCES [dbo].[site] ([site_id]),
    CONSTRAINT [fk_a_t] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_a_part1]
    ON [dbo].[accession]([accession_number_part1] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_a_part2]
    ON [dbo].[accession]([accession_number_part2] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_a_part3]
    ON [dbo].[accession]([accession_number_part3] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_a_created]
    ON [dbo].[accession]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_a_modified]
    ON [dbo].[accession]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_a_owned]
    ON [dbo].[accession]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_a_t]
    ON [dbo].[accession]([taxonomy_species_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ac]
    ON [dbo].[accession]([accession_number_part1] ASC, [accession_number_part2] ASC, [accession_number_part3] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_doi]
    ON [dbo].[accession]([doi] ASC) WHERE ([doi] IS NOT NULL);

