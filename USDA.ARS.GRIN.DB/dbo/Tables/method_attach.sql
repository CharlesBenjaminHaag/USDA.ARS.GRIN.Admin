CREATE TABLE [dbo].[method_attach] (
    [method_attach_id]       INT            IDENTITY (1, 1) NOT NULL,
    [method_id]              INT            NOT NULL,
    [virtual_path]           NVARCHAR (255) NOT NULL,
    [thumbnail_virtual_path] NVARCHAR (255) NULL,
    [sort_order]             INT            NULL,
    [title]                  NVARCHAR (500) NULL,
    [description]            NVARCHAR (500) NULL,
    [content_type]           NVARCHAR (100) NULL,
    [category_code]          NVARCHAR (20)  NULL,
    [is_web_visible]         NVARCHAR (1)   NOT NULL,
    [copyright_information]  NVARCHAR (100) NULL,
    [attach_cooperator_id]   INT            NULL,
    [attach_date]            DATETIME2 (7)  NULL,
    [attach_date_code]       NVARCHAR (20)  NULL,
    [note]                   NVARCHAR (MAX) NULL,
    [created_date]           DATETIME2 (7)  NOT NULL,
    [created_by]             INT            NOT NULL,
    [modified_date]          DATETIME2 (7)  NULL,
    [modified_by]            INT            NULL,
    [owned_date]             DATETIME2 (7)  NOT NULL,
    [owned_by]               INT            NOT NULL,
    CONSTRAINT [PK_method_attach] PRIMARY KEY CLUSTERED ([method_attach_id] ASC),
    CONSTRAINT [fk_mat_c] FOREIGN KEY ([attach_cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_mat_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_mat_m] FOREIGN KEY ([method_id]) REFERENCES [dbo].[method] ([method_id]),
    CONSTRAINT [fk_mat_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_mat_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mat_c]
    ON [dbo].[method_attach]([attach_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mat_created]
    ON [dbo].[method_attach]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mat_m]
    ON [dbo].[method_attach]([method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mat_modified]
    ON [dbo].[method_attach]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_mat_owned]
    ON [dbo].[method_attach]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_mat]
    ON [dbo].[method_attach]([method_id] ASC, [virtual_path] ASC);

