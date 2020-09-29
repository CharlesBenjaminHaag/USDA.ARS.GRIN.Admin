CREATE TABLE [dbo].[plant_inventory] (
    [plant_inventory_id]     INT IDENTITY (1, 1) NOT NULL,
    [plant_inventory_volumn] INT NOT NULL,
    [plant_inventory_year]   INT NOT NULL,
    [starting_pi_number]     INT NOT NULL,
    CONSTRAINT [PK_plant_inventory_id] PRIMARY KEY CLUSTERED ([plant_inventory_id] ASC)
);

