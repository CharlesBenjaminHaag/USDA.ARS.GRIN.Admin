CREATE TABLE [pvp_status] (
    [status_id]   INT           IDENTITY (1, 1) NOT NULL,
    [description] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_pvp_status] PRIMARY KEY CLUSTERED ([status_id] ASC)
);

