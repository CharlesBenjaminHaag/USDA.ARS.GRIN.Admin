CREATE TABLE [dbo].[web_order_request] (
    [web_order_request_id] INT            IDENTITY (1, 1) NOT NULL,
    [web_cooperator_id]    INT            NULL,
    [ordered_date]         DATETIME2 (7)  NULL,
    [intended_use_code]    NVARCHAR (20)  NULL,
    [intended_use_note]    NVARCHAR (MAX) NULL,
    [status_code]          NVARCHAR (20)  NULL,
    [note]                 NVARCHAR (MAX) NULL,
    [special_instruction]  NVARCHAR (MAX) NULL,
    [created_date]         DATETIME2 (7)  NOT NULL,
    [created_by]           INT            NOT NULL,
    [modified_date]        DATETIME2 (7)  NULL,
    [modified_by]          INT            NULL,
    [owned_date]           DATETIME2 (7)  NOT NULL,
    [owned_by]             INT            NOT NULL,
    CONSTRAINT [PK_web_order_request] PRIMARY KEY CLUSTERED ([web_order_request_id] ASC),
    CONSTRAINT [fk_wor_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wor_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wor_wc] FOREIGN KEY ([web_cooperator_id]) REFERENCES [dbo].[web_cooperator] ([web_cooperator_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_wor]
    ON [dbo].[web_order_request]([web_cooperator_id] ASC, [ordered_date] ASC);

