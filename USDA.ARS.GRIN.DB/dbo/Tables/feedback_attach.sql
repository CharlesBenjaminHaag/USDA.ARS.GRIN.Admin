CREATE TABLE [dbo].[feedback_attach] (
    [feedback_attach_id]     INT            IDENTITY (1, 1) NOT NULL,
    [feedback_id]            INT            NOT NULL,
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
    CONSTRAINT [PK_feedback_attach] PRIMARY KEY CLUSTERED ([feedback_attach_id] ASC),
    CONSTRAINT [fk_fa_f] FOREIGN KEY ([feedback_id]) REFERENCES [dbo].[feedback] ([feedback_id])
);

