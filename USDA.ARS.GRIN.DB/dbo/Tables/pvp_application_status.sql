CREATE TABLE [dbo].[pvp_application_status] (
    [pvp_application_status_id] INT           IDENTITY (1, 1) NOT NULL,
    [description]               NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_pvp_application_status] PRIMARY KEY CLUSTERED ([pvp_application_status_id] ASC)
);

