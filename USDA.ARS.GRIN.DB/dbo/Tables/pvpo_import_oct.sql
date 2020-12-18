CREATE TABLE [pvpo_import_oct] (
    [Application]        TIME (7)       NULL,
    [APP_NO]             NVARCHAR (250) NULL,
    [Variety_Name]       NVARCHAR (250) NULL,
    [Experimental_Name]  NVARCHAR (250) NULL,
    [Scientific_Name]    NVARCHAR (250) NULL,
    [Common_Name]        NVARCHAR (250) NULL,
    [Applicant]          NVARCHAR (250) NULL,
    [Application_Date]   DATE           NULL,
    [Certified_Seed]     NVARCHAR (250) NULL,
    [Certificate_Status] NVARCHAR (250) NULL,
    [Status_Date]        DATE           NULL,
    [Issued_Date]        DATE           NULL,
    [Years_Protected]    TINYINT        NULL,
    [STATUS_ID]          INT            NULL,
    [APPLICANT_ID]       INT            NULL,
    [COMMON_NAME_ID]     INT            NULL,
    [EXP_DATE]           DATETIME       NULL,
    [IMPORT_STATUS]      NVARCHAR (20)  NULL
);

