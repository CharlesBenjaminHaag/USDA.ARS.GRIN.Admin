CREATE TABLE [plant_immigrant_index] (
    [plant_immigrant_index_id] INT IDENTITY (1, 1) NOT NULL,
    [plant_immigrant_volumn]   INT NOT NULL,
    [first_number]             INT NOT NULL,
    [last_number]              INT NOT NULL,
    [plant_immigrant_page]     INT NOT NULL,
    CONSTRAINT [PK_plant_immigrant_index_id] PRIMARY KEY CLUSTERED ([plant_immigrant_index_id] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[plant_immigrant_index] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[plant_immigrant_index] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[plant_immigrant_index] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[plant_immigrant_index] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[plant_immigrant_index] TO [gg_search]
    AS [dbo];

