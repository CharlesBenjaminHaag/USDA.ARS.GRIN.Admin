CREATE TABLE [dbo].[app_user_gui_setting] (
    [app_user_gui_setting_id] INT             IDENTITY (1, 1) NOT NULL,
    [cooperator_id]           INT             NOT NULL,
    [app_name]                NVARCHAR (50)   NULL,
    [form_name]               NVARCHAR (100)  NULL,
    [resource_name]           NVARCHAR (100)  NOT NULL,
    [resource_key]            NVARCHAR (100)  NOT NULL,
    [resource_value]          NVARCHAR (2000) NULL,
    [created_date]            DATETIME2 (7)   NOT NULL,
    [created_by]              INT             NOT NULL,
    [modified_date]           DATETIME2 (7)   NULL,
    [modified_by]             INT             NULL,
    [owned_date]              DATETIME2 (7)   NOT NULL,
    [owned_by]                INT             NOT NULL,
    CONSTRAINT [PK_app_user_gui_setting] PRIMARY KEY CLUSTERED ([app_user_gui_setting_id] ASC),
    CONSTRAINT [fk_sugs_co] FOREIGN KEY ([cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sugs_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sugs_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sugs_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sugs_co]
    ON [dbo].[app_user_gui_setting]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sugs_created]
    ON [dbo].[app_user_gui_setting]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sugs_modified]
    ON [dbo].[app_user_gui_setting]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sugs_owned]
    ON [dbo].[app_user_gui_setting]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sugs]
    ON [dbo].[app_user_gui_setting]([cooperator_id] ASC, [app_name] ASC, [form_name] ASC, [resource_name] ASC, [resource_key] ASC);

