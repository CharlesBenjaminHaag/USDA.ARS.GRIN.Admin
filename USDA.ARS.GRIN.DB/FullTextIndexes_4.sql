
GO
CREATE FULLTEXT INDEX ON [taxonomy_common_name]
    ([name] LANGUAGE 1033, [simplified_name] LANGUAGE 1033)
    KEY INDEX [PK_taxonomy_common_name]
    ON [gringlobalftsc];

