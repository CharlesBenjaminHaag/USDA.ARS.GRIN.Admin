CREATE TABLE [app_user_item_list] (
    [app_user_item_list_id] INT             IDENTITY (1, 1) NOT NULL,
    [cooperator_id]         INT             NOT NULL,
    [tab_name]              NVARCHAR (100)  NOT NULL,
    [list_name]             NVARCHAR (300)  NOT NULL,
    [id_number]             INT             NULL,
    [id_type]               NVARCHAR (100)  NOT NULL,
    [sort_order]            INT             NULL,
    [title]                 NVARCHAR (1000) NOT NULL,
    [description]           NVARCHAR (MAX)  NULL,
    [properties]            NVARCHAR (MAX)  NULL,
    [created_date]          DATETIME2 (7)   NOT NULL,
    [created_by]            INT             NOT NULL,
    [modified_date]         DATETIME2 (7)   NULL,
    [modified_by]           INT             NULL,
    [owned_date]            DATETIME2 (7)   NOT NULL,
    [owned_by]              INT             NOT NULL,
    CONSTRAINT [PK_app_user_item_list] PRIMARY KEY CLUSTERED ([app_user_item_list_id] ASC),
    CONSTRAINT [fk_auil_c] FOREIGN KEY ([cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_auil_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_auil_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_auil_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_auil_c]
    ON [app_user_item_list]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_auil_created]
    ON [app_user_item_list]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_auil_modified]
    ON [app_user_item_list]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_auil_owned]
    ON [app_user_item_list]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_uil_group]
    ON [app_user_item_list]([cooperator_id] ASC, [list_name] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_uil_tab]
    ON [app_user_item_list]([cooperator_id] ASC, [tab_name] ASC, [list_name] ASC);


GO
GRANT DELETE
    ON OBJECT::[app_user_item_list] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[app_user_item_list] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[app_user_item_list] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[app_user_item_list] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[app_user_item_list] TO [gg_search]
    AS [dbo];

