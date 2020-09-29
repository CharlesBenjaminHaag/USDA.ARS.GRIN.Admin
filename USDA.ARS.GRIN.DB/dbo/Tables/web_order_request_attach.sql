CREATE TABLE [dbo].[web_order_request_attach] (
    [web_order_request_attach_id] INT            IDENTITY (1, 1) NOT NULL,
    [web_cooperator_id]           INT            NOT NULL,
    [web_order_request_id]        INT            NOT NULL,
    [virtual_path]                NVARCHAR (255) NOT NULL,
    [content_type]                NVARCHAR (100) NULL,
    [title]                       NVARCHAR (500) NULL,
    [status]                      NVARCHAR (50)  NULL,
    [note]                        NVARCHAR (MAX) NULL,
    [created_date]                DATETIME2 (7)  NOT NULL,
    [created_by]                  INT            NOT NULL,
    [modified_date]               DATETIME2 (7)  NULL,
    [modified_by]                 INT            NULL,
    [owned_date]                  DATETIME2 (7)  NOT NULL,
    [owned_by]                    INT            NOT NULL,
    CONSTRAINT [PK_web_order_request_attach] PRIMARY KEY CLUSTERED ([web_order_request_attach_id] ASC),
    CONSTRAINT [fk_worat_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_worat_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_worat_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_worat_wc] FOREIGN KEY ([web_cooperator_id]) REFERENCES [dbo].[web_cooperator] ([web_cooperator_id]),
    CONSTRAINT [fk_worat_wor] FOREIGN KEY ([web_order_request_id]) REFERENCES [dbo].[web_order_request] ([web_order_request_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_worat]
    ON [dbo].[web_order_request_attach]([virtual_path] ASC);

