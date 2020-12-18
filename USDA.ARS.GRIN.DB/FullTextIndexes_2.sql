
GO
CREATE FULLTEXT INDEX ON [accession_ipr]
    ([ipr_number] LANGUAGE 1033)
    KEY INDEX [PK_accession_ipr]
    ON [gringlobalftsc]
    WITH STOPLIST OFF;

