CREATE TABLE [accession_source_map] (
    [accession_source_map_id] INT           IDENTITY (1, 1) NOT NULL,
    [accession_source_id]     INT           NOT NULL,
    [cooperator_id]           INT           NOT NULL,
    [created_date]            DATETIME2 (7) NOT NULL,
    [created_by]              INT           NOT NULL,
    [modified_date]           DATETIME2 (7) NULL,
    [modified_by]             INT           NULL,
    [owned_date]              DATETIME2 (7) NOT NULL,
    [owned_by]                INT           NOT NULL,
    CONSTRAINT [PK_accession_source_map] PRIMARY KEY CLUSTERED ([accession_source_map_id] ASC),
    CONSTRAINT [fk_asm_as] FOREIGN KEY ([accession_source_id]) REFERENCES [accession_source] ([accession_source_id]),
    CONSTRAINT [fk_asm_c] FOREIGN KEY ([cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_asm_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_asm_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_asm_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_asm_as]
    ON [accession_source_map]([accession_source_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_asm_c]
    ON [accession_source_map]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_asm_created]
    ON [accession_source_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_asm_modified]
    ON [accession_source_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_asm_owned]
    ON [accession_source_map]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sm]
    ON [accession_source_map]([accession_source_id] ASC, [cooperator_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[accession_source_map] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[accession_source_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_source_map] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[accession_source_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_source_map] TO [gg_search]
    AS [dbo];

