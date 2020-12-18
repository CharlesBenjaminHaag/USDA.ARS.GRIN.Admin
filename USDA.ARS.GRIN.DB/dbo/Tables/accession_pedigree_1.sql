CREATE TABLE [accession_pedigree] (
    [accession_pedigree_id]     INT            IDENTITY (1, 1) NOT NULL,
    [accession_id]              INT            NOT NULL,
    [released_date]             DATETIME2 (7)  NULL,
    [released_date_code]        NVARCHAR (20)  NULL,
    [male_accession_id]         INT            NULL,
    [male_external_accession]   NVARCHAR (50)  NULL,
    [female_accession_id]       INT            NULL,
    [female_external_accession] NVARCHAR (50)  NULL,
    [cross_code]                NVARCHAR (20)  NULL,
    [description]               NVARCHAR (MAX) NULL,
    [created_date]              DATETIME2 (7)  NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  NOT NULL,
    [owned_by]                  INT            NOT NULL,
    CONSTRAINT [PK_accession_pedigree] PRIMARY KEY CLUSTERED ([accession_pedigree_id] ASC),
    CONSTRAINT [fk_ap_a] FOREIGN KEY ([accession_id]) REFERENCES [accession] ([accession_id]),
    CONSTRAINT [fk_ap_a_female] FOREIGN KEY ([female_accession_id]) REFERENCES [accession] ([accession_id]),
    CONSTRAINT [fk_ap_a_male] FOREIGN KEY ([male_accession_id]) REFERENCES [accession] ([accession_id]),
    CONSTRAINT [fk_ap_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ap_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ap_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ap_created]
    ON [accession_pedigree]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ap_modified]
    ON [accession_pedigree]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ap_owned]
    ON [accession_pedigree]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_pd]
    ON [accession_pedigree]([accession_id] ASC);


GO
CREATE STATISTICS [_dta_stat_325576198_1_2]
    ON [accession_pedigree]([accession_pedigree_id], [accession_id]);


GO
GRANT DELETE
    ON OBJECT::[accession_pedigree] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[accession_pedigree] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_pedigree] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[accession_pedigree] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_pedigree] TO [gg_search]
    AS [dbo];

