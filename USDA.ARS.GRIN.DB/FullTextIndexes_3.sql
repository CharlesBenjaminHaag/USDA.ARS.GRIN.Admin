
GO
CREATE FULLTEXT INDEX ON [accession_pedigree]
    ([description] LANGUAGE 1033)
    KEY INDEX [PK_accession_pedigree]
    ON [gringlobalftsc]
    WITH STOPLIST OFF;

