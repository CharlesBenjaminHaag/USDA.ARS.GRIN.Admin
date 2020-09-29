CREATE TABLE [dbo].[pvp_application] (
    [pvp_application_number]    INT            NOT NULL,
    [cultivar_name]             NVARCHAR (150) NULL,
    [experimental_name]         NVARCHAR (150) NULL,
    [pvp_common_name_id]        INT            NULL,
    [scientific_name]           NVARCHAR (150) NULL,
    [pvp_applicant_id]          INT            NULL,
    [application_date]          DATETIME2 (7)  NULL,
    [is_certified_seed]         BIT            NULL,
    [pvp_application_status_id] INT            NULL,
    [status_date]               DATETIME2 (7)  NULL,
    [certificate_issued_date]   DATETIME2 (7)  NULL,
    [years_protected]           INT            NULL,
    CONSTRAINT [PK_pvp_application] PRIMARY KEY CLUSTERED ([pvp_application_number] ASC),
    CONSTRAINT [FK_pvp_application_pvp_applicant] FOREIGN KEY ([pvp_applicant_id]) REFERENCES [dbo].[pvp_applicant] ([pvp_applicant_id])
);

