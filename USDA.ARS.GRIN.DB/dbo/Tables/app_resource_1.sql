CREATE TABLE [app_resource] (
    [app_resource_id]   INT             IDENTITY (1, 1) NOT NULL,
    [sys_lang_id]       INT             NOT NULL,
    [app_name]          NVARCHAR (100)  NOT NULL,
    [form_name]         NVARCHAR (100)  NOT NULL,
    [app_resource_name] NVARCHAR (100)  NOT NULL,
    [description]       NVARCHAR (2000) NULL,
    [display_member]    NVARCHAR (2000) NOT NULL,
    [value_member]      NVARCHAR (2000) NULL,
    [sort_order]        INT             NULL,
    [properties]        NVARCHAR (2000) NULL,
    [created_date]      DATETIME2 (7)   NOT NULL,
    [created_by]        INT             NOT NULL,
    [modified_date]     DATETIME2 (7)   NULL,
    [modified_by]       INT             NULL,
    [owned_date]        DATETIME2 (7)   NOT NULL,
    [owned_by]          INT             NOT NULL,
    CONSTRAINT [PK_app_resource] PRIMARY KEY CLUSTERED ([app_resource_id] ASC),
    CONSTRAINT [fk_are_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_are_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_are_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_are_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [sys_lang] ([sys_lang_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_are_created]
    ON [app_resource]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_are_modified]
    ON [app_resource]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_are_owned]
    ON [app_resource]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_are_sl]
    ON [app_resource]([sys_lang_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ar]
    ON [app_resource]([sys_lang_id] ASC, [app_name] ASC, [form_name] ASC, [app_resource_name] ASC, [sort_order] ASC);


GO
GRANT DELETE
    ON OBJECT::[app_resource] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[app_resource] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[app_resource] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[app_resource] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[app_resource] TO [gg_search]
    AS [dbo];

