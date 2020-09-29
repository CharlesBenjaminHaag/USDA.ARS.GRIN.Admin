CREATE TABLE [dbo].[crop_trait_code_attach] (
    [crop_trait_code_attach_id] INT            IDENTITY (1, 1) NOT NULL,
    [crop_trait_code_id]        INT            NOT NULL,
    [virtual_path]              NVARCHAR (255) NOT NULL,
    [thumbnail_virtual_path]    NVARCHAR (255) NULL,
    [sort_order]                INT            NULL,
    [title]                     NVARCHAR (500) NULL,
    [description]               NVARCHAR (500) NULL,
    [content_type]              NVARCHAR (100) NULL,
    [category_code]             NVARCHAR (20)  NULL,
    [attach_cooperator_id]      INT            NULL,
    [is_web_visible]            NVARCHAR (1)   DEFAULT ('Y') NOT NULL,
    [attach_date]               DATETIME2 (7)  NULL,
    [attach_date_code]          NVARCHAR (20)  NULL,
    [note]                      NVARCHAR (MAX) NULL,
    [created_date]              DATETIME2 (7)  NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  NOT NULL,
    [owned_by]                  INT            NOT NULL,
    CONSTRAINT [PK_crop_trait_code_attach] PRIMARY KEY CLUSTERED ([crop_trait_code_attach_id] ASC),
    CONSTRAINT [fk_ctca_c] FOREIGN KEY ([attach_cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ctca_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ctca_ctc] FOREIGN KEY ([crop_trait_code_id]) REFERENCES [dbo].[crop_trait_code] ([crop_trait_code_id]),
    CONSTRAINT [fk_ctca_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ctca_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctca_c]
    ON [dbo].[crop_trait_code_attach]([attach_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctca_created]
    ON [dbo].[crop_trait_code_attach]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctca_ctc]
    ON [dbo].[crop_trait_code_attach]([crop_trait_code_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctca_modified]
    ON [dbo].[crop_trait_code_attach]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctca_owned]
    ON [dbo].[crop_trait_code_attach]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ctca]
    ON [dbo].[crop_trait_code_attach]([crop_trait_code_id] ASC, [virtual_path] ASC);

