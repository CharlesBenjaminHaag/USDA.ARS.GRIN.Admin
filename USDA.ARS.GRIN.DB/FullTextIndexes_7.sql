
GO
CREATE FULLTEXT INDEX ON [accession_source]
    ([collector_verbatim_locality] LANGUAGE 1033, [environment_description] LANGUAGE 1033, [associated_species] LANGUAGE 1033)
    KEY INDEX [PK_accession_source]
    ON [gringlobalftsc]
    WITH STOPLIST OFF;

