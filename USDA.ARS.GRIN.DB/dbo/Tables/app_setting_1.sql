CREATE TABLE [app_setting] (
    [app_setting_id] INT            IDENTITY (1, 1) NOT NULL,
    [category_tag]   NVARCHAR (200) NULL,
    [sort_order]     INT            NULL,
    [name]           NVARCHAR (200) NOT NULL,
    [value]          NVARCHAR (MAX) NULL,
    [created_date]   DATETIME2 (7)  NOT NULL,
    [created_by]     INT            NOT NULL,
    [modified_date]  DATETIME2 (7)  NULL,
    [modified_by]    INT            NULL,
    [owned_date]     DATETIME2 (7)  NOT NULL,
    [owned_by]       INT            NOT NULL,
    CONSTRAINT [PK_app_setting] PRIMARY KEY CLUSTERED ([app_setting_id] ASC),
    CONSTRAINT [ndx_fk_aset_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_aset_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [ndx_fk_aset_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_as]
    ON [app_setting]([category_tag] ASC, [sort_order] ASC, [name] ASC);


GO
GRANT DELETE
    ON OBJECT::[app_setting] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[app_setting] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[app_setting] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[app_setting] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[app_setting] TO [gg_search]
    AS [dbo];

