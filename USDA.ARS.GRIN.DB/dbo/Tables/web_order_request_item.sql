CREATE TABLE [dbo].[web_order_request_item] (
    [web_order_request_item_id] INT            IDENTITY (1, 1) NOT NULL,
    [web_cooperator_id]         INT            NOT NULL,
    [web_order_request_id]      INT            NOT NULL,
    [sequence_number]           INT            NOT NULL,
    [accession_id]              INT            NOT NULL,
    [name]                      NVARCHAR (200) NULL,
    [quantity_shipped]          INT            NULL,
    [unit_of_shipped_code]      NVARCHAR (20)  NULL,
    [distribution_form_code]    NVARCHAR (20)  NULL,
    [status_code]               NVARCHAR (20)  NULL,
    [curator_note]              NVARCHAR (MAX) NULL,
    [user_note]                 NVARCHAR (MAX) NULL,
    [created_date]              DATETIME2 (7)  NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  NOT NULL,
    [owned_by]                  INT            NOT NULL,
    CONSTRAINT [PK_web_order_request_item] PRIMARY KEY CLUSTERED ([web_order_request_item_id] ASC),
    CONSTRAINT [fk_wori_a] FOREIGN KEY ([accession_id]) REFERENCES [dbo].[accession] ([accession_id]),
    CONSTRAINT [fk_wori_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wori_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wori_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wori_wc] FOREIGN KEY ([web_cooperator_id]) REFERENCES [dbo].[web_cooperator] ([web_cooperator_id]),
    CONSTRAINT [fk_wori_wor] FOREIGN KEY ([web_order_request_id]) REFERENCES [dbo].[web_order_request] ([web_order_request_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_wori]
    ON [dbo].[web_order_request_item]([web_order_request_id] ASC, [web_cooperator_id] ASC, [sequence_number] ASC);

