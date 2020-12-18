CREATE TABLE [pvp_application] (
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
    [created_by]                INT            NULL,
    [created_date]              DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    CONSTRAINT [PK_pvp_application] PRIMARY KEY CLUSTERED ([pvp_application_number] ASC),
    CONSTRAINT [FK_pvp_application_pvp_applicant] FOREIGN KEY ([pvp_applicant_id]) REFERENCES [pvp_applicant] ([pvp_applicant_id]),
    CONSTRAINT [FK_pvp_application_pvp_application_status] FOREIGN KEY ([pvp_application_status_id]) REFERENCES [pvp_application_status] ([pvp_application_status_id]),
    CONSTRAINT [FK_pvp_application_pvp_common_name] FOREIGN KEY ([pvp_common_name_id]) REFERENCES [pvp_common_name] ([pvp_common_name_id])
);


GO
CREATE NONCLUSTERED INDEX [idx_cultivar_name]
    ON [pvp_application]([cultivar_name] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_experimental_name]
    ON [pvp_application]([experimental_name] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_scientific_name]
    ON [pvp_application]([scientific_name] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_pvp_common_name_id]
    ON [pvp_application]([pvp_common_name_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_pvp_application_status_id]
    ON [pvp_application]([pvp_application_status_id] ASC);

