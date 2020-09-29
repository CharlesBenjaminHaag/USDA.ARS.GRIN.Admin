CREATE TABLE [dbo].[pvp_applicant] (
    [pvp_applicant_id] INT             IDENTITY (1, 1) NOT NULL,
    [name]             NVARCHAR (4000) NOT NULL,
    [applicant_name]   NVARCHAR (200)  NULL,
    CONSTRAINT [PK_pvp_applicant] PRIMARY KEY CLUSTERED ([pvp_applicant_id] ASC)
);

