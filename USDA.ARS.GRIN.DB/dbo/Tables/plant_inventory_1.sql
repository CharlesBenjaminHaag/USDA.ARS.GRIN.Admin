CREATE TABLE [plant_inventory] (
    [plant_inventory_id]     INT IDENTITY (1, 1) NOT NULL,
    [plant_inventory_volumn] INT NOT NULL,
    [plant_inventory_year]   INT NOT NULL,
    [starting_pi_number]     INT NOT NULL,
    CONSTRAINT [PK_plant_inventory_id] PRIMARY KEY CLUSTERED ([plant_inventory_id] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[plant_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[plant_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[plant_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[plant_inventory] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[plant_inventory] TO [gg_search]
    AS [dbo];

