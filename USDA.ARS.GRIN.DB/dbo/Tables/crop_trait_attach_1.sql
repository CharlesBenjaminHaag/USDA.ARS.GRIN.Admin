CREATE TABLE [crop_trait_attach] (
    [crop_trait_attach_id]   INT            IDENTITY (1, 1) NOT NULL,
    [crop_trait_id]          INT            NOT NULL,
    [virtual_path]           NVARCHAR (255) NOT NULL,
    [thumbnail_virtual_path] NVARCHAR (255) NULL,
    [sort_order]             INT            NULL,
    [title]                  NVARCHAR (500) NULL,
    [description]            NVARCHAR (500) NULL,
    [content_type]           NVARCHAR (100) NULL,
    [category_code]          NVARCHAR (20)  NULL,
    [attach_cooperator_id]   INT            NULL,
    [is_web_visible]         NVARCHAR (1)   DEFAULT ('Y') NOT NULL,
    [attach_date]            DATETIME2 (7)  NULL,
    [attach_date_code]       NVARCHAR (20)  NULL,
    [note]                   NVARCHAR (MAX) NULL,
    [created_date]           DATETIME2 (7)  NOT NULL,
    [created_by]             INT            NOT NULL,
    [modified_date]          DATETIME2 (7)  NULL,
    [modified_by]            INT            NULL,
    [owned_date]             DATETIME2 (7)  NOT NULL,
    [owned_by]               INT            NOT NULL,
    CONSTRAINT [PK_crop_trait_attach] PRIMARY KEY CLUSTERED ([crop_trait_attach_id] ASC),
    CONSTRAINT [fk_cta_c] FOREIGN KEY ([attach_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cta_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cta_ct] FOREIGN KEY ([crop_trait_id]) REFERENCES [crop_trait] ([crop_trait_id]),
    CONSTRAINT [fk_cta_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cta_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cta_c]
    ON [crop_trait_attach]([attach_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cta_created]
    ON [crop_trait_attach]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cta_ct]
    ON [crop_trait_attach]([crop_trait_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cta_modified]
    ON [crop_trait_attach]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cta_owned]
    ON [crop_trait_attach]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_cta]
    ON [crop_trait_attach]([crop_trait_id] ASC, [virtual_path] ASC);


GO
GRANT DELETE
    ON OBJECT::[crop_trait_attach] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[crop_trait_attach] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[crop_trait_attach] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[crop_trait_attach] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[crop_trait_attach] TO [gg_search]
    AS [dbo];

