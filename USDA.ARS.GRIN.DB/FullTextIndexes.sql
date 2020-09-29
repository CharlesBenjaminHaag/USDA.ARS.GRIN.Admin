CREATE FULLTEXT INDEX ON [dbo].[accession_inv_name]
    ([plant_name] LANGUAGE 1033)
    KEY INDEX [PK_accession_inv_name]
    ON [gringlobalftsc]
    WITH STOPLIST OFF;


GO
CREATE FULLTEXT INDEX ON [dbo].[accession_ipr]
    ([ipr_number] LANGUAGE 1033)
    KEY INDEX [PK_accession_ipr]
    ON [gringlobalftsc]
    WITH STOPLIST OFF;


GO
CREATE FULLTEXT INDEX ON [dbo].[accession_pedigree]
    ([description] LANGUAGE 1033)
    KEY INDEX [PK_accession_pedigree]
    ON [gringlobalftsc]
    WITH STOPLIST OFF;


GO
CREATE FULLTEXT INDEX ON [dbo].[taxonomy_common_name]
    ([name] LANGUAGE 1033, [simplified_name] LANGUAGE 1033)
    KEY INDEX [PK_taxonomy_common_name]
    ON [gringlobalftsc];


GO
CREATE FULLTEXT INDEX ON [dbo].[taxonomy_species]
    ([name] LANGUAGE 1033)
    KEY INDEX [PK_taxonomy_species]
    ON [gringlobalftsc];


GO
CREATE FULLTEXT INDEX ON [dbo].[accession]
    ([note] LANGUAGE 1033)
    KEY INDEX [PK_accession]
    ON [gringlobalftsc];


GO
CREATE FULLTEXT INDEX ON [dbo].[accession_source]
    ([collector_verbatim_locality] LANGUAGE 1033, [environment_description] LANGUAGE 1033, [associated_species] LANGUAGE 1033)
    KEY INDEX [PK_accession_source]
    ON [gringlobalftsc]
    WITH STOPLIST OFF;

