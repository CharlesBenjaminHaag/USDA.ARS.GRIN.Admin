CREATE TABLE [dbo].[plant_immigrant_index] (
    [plant_immigrant_index_id] INT IDENTITY (1, 1) NOT NULL,
    [plant_immigrant_volumn]   INT NOT NULL,
    [first_number]             INT NOT NULL,
    [last_number]              INT NOT NULL,
    [plant_immigrant_page]     INT NOT NULL,
    CONSTRAINT [PK_plant_immigrant_index_id] PRIMARY KEY CLUSTERED ([plant_immigrant_index_id] ASC)
);

