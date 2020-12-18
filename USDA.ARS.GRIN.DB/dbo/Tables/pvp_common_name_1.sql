CREATE TABLE [pvp_common_name] (
    [pvp_common_name_id] INT            IDENTITY (1, 1) NOT NULL,
    [name]               NVARCHAR (150) NULL,
    CONSTRAINT [PK_pvp_common_name] PRIMARY KEY CLUSTERED ([pvp_common_name_id] ASC)
);

