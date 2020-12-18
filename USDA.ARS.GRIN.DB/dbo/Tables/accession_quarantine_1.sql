CREATE TABLE [accession_quarantine] (
    [accession_quarantine_id] INT            IDENTITY (1, 1) NOT NULL,
    [accession_id]            INT            NOT NULL,
    [quarantine_type_code]    NVARCHAR (20)  NOT NULL,
    [progress_status_code]    NVARCHAR (20)  NULL,
    [custodial_cooperator_id] INT            NOT NULL,
    [entered_date]            DATETIME2 (7)  NULL,
    [established_date]        DATETIME2 (7)  NULL,
    [expected_release_date]   DATETIME2 (7)  NULL,
    [released_date]           DATETIME2 (7)  NULL,
    [note]                    NVARCHAR (MAX) NULL,
    [created_date]            DATETIME2 (7)  NOT NULL,
    [created_by]              INT            NOT NULL,
    [modified_date]           DATETIME2 (7)  NULL,
    [modified_by]             INT            NULL,
    [owned_date]              DATETIME2 (7)  NOT NULL,
    [owned_by]                INT            NOT NULL,
    CONSTRAINT [PK_accession_quarantine] PRIMARY KEY CLUSTERED ([accession_quarantine_id] ASC),
    CONSTRAINT [fk_aq_a] FOREIGN KEY ([accession_id]) REFERENCES [accession] ([accession_id]),
    CONSTRAINT [fk_aq_c] FOREIGN KEY ([custodial_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aq_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aq_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aq_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aq_a]
    ON [accession_quarantine]([accession_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aq_c]
    ON [accession_quarantine]([custodial_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aq_created]
    ON [accession_quarantine]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aq_modified]
    ON [accession_quarantine]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aq_owned]
    ON [accession_quarantine]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_qr]
    ON [accession_quarantine]([accession_id] ASC, [quarantine_type_code] ASC);


GO
GRANT DELETE
    ON OBJECT::[accession_quarantine] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[accession_quarantine] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_quarantine] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[accession_quarantine] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_quarantine] TO [gg_search]
    AS [dbo];

