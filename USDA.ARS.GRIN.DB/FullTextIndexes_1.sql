
GO
CREATE FULLTEXT INDEX ON [accession_inv_name]
    ([plant_name] LANGUAGE 1033)
    KEY INDEX [PK_accession_inv_name]
    ON [gringlobalftsc]
    WITH STOPLIST OFF;

