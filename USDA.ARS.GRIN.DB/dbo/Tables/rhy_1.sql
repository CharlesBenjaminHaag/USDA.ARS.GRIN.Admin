CREATE TABLE [rhy] (
    [rhy_id]     INT            IDENTITY (1, 1) NOT NULL,
    [usda_acces] INT            NOT NULL,
    [synonym_1]  NVARCHAR (26)  NULL,
    [synonym_2]  NVARCHAR (243) NULL,
    [synonym_3]  NVARCHAR (11)  NULL,
    [synonym_4]  NVARCHAR (10)  NULL,
    [host_plant] NVARCHAR (254) NULL,
    [common_nam] NVARCHAR (29)  NULL,
    [source]     NVARCHAR (39)  NULL,
    [geo_source] NVARCHAR (47)  NULL,
    [serogroup]  NVARCHAR (9)   NULL,
    [hosts_nodu] NVARCHAR (25)  NULL,
    [comments]   NVARCHAR (71)  NULL,
    [genus_spp]  NVARCHAR (100) NULL,
    CONSTRAINT [PK_rhy] PRIMARY KEY CLUSTERED ([rhy_id] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[rhy] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[rhy] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[rhy] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[rhy] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[rhy] TO [gg_search]
    AS [dbo];

