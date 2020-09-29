CREATE TABLE [dbo].[email_attach] (
    [email_attach_id]        INT            IDENTITY (1, 1) NOT NULL,
    [email_id]               INT            NOT NULL,
    [virtual_path]           NVARCHAR (255) NOT NULL,
    [thumbnail_virtual_path] NVARCHAR (255) NULL,
    [sort_order]             INT            NULL,
    [title]                  NVARCHAR (500) NULL,
    [description]            NVARCHAR (500) NULL,
    [content_type]           NVARCHAR (100) NULL,
    [category_code]          NVARCHAR (20)  NULL,
    [is_web_visible]         NVARCHAR (1)   NOT NULL,
    [note]                   NVARCHAR (MAX) NULL,
    [created_date]           DATETIME2 (7)  NOT NULL,
    [created_by]             INT            NOT NULL,
    [modified_date]          DATETIME2 (7)  NULL,
    [modified_by]            INT            NULL,
    [owned_date]             DATETIME2 (7)  NOT NULL,
    [owned_by]               INT            NOT NULL,
    CONSTRAINT [PK_email_attach] PRIMARY KEY CLUSTERED ([email_attach_id] ASC),
    CONSTRAINT [fk_ea_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ea_e] FOREIGN KEY ([email_id]) REFERENCES [dbo].[email] ([email_id]),
    CONSTRAINT [fk_ea_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ea_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ea_created]
    ON [dbo].[email_attach]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ea_e]
    ON [dbo].[email_attach]([email_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ea_modified]
    ON [dbo].[email_attach]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ea_owned]
    ON [dbo].[email_attach]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ea]
    ON [dbo].[email_attach]([email_id] ASC, [virtual_path] ASC);

