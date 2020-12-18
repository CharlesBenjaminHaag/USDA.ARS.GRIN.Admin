CREATE TABLE [sys_application] (
    [sys_application_id] INT             IDENTITY (1, 1) NOT NULL,
    [code]               NVARCHAR (20)   NOT NULL,
    [title]              NVARCHAR (120)  NOT NULL,
    [description]        NVARCHAR (500)  NULL,
    [url]                NVARCHAR (2000) NULL,
    [color_code]         NVARCHAR (20)   NULL,
    [image_file_name]    NVARCHAR (500)  NULL,
    [sys_group_id]       INT             NULL,
    CONSTRAINT [PK_sys_application] PRIMARY KEY CLUSTERED ([sys_application_id] ASC)
);

