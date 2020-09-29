CREATE TABLE [dbo].[web_order_request_action] (
    [web_order_request_action_id] INT            IDENTITY (1, 1) NOT NULL,
    [web_order_request_id]        INT            NOT NULL,
    [action_code]                 NVARCHAR (20)  NOT NULL,
    [acted_date]                  DATETIME2 (7)  NOT NULL,
    [action_for_id]               NVARCHAR (MAX) NULL,
    [note]                        NVARCHAR (MAX) NULL,
    [web_cooperator_id]           INT            NULL,
    [created_date]                DATETIME2 (7)  NOT NULL,
    [created_by]                  INT            NOT NULL,
    [modified_date]               DATETIME2 (7)  NULL,
    [modified_by]                 INT            NULL,
    [owned_date]                  DATETIME2 (7)  NOT NULL,
    [owned_by]                    INT            NOT NULL,
    CONSTRAINT [PK_web_order_request_action] PRIMARY KEY CLUSTERED ([web_order_request_action_id] ASC),
    CONSTRAINT [fk_wora_c] FOREIGN KEY ([web_cooperator_id]) REFERENCES [dbo].[web_cooperator] ([web_cooperator_id]),
    CONSTRAINT [fk_wora_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wora_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wora_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wora_wor] FOREIGN KEY ([web_order_request_id]) REFERENCES [dbo].[web_order_request] ([web_order_request_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_wora]
    ON [dbo].[web_order_request_action]([web_order_request_id] ASC, [web_cooperator_id] ASC, [acted_date] ASC);

