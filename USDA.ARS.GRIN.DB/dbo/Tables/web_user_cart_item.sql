CREATE TABLE [dbo].[web_user_cart_item] (
    [web_user_cart_item_id] INT            IDENTITY (1, 1) NOT NULL,
    [web_user_cart_id]      INT            NOT NULL,
    [accession_id]          INT            NOT NULL,
    [quantity]              INT            NOT NULL,
    [form_type_code]        NVARCHAR (20)  NOT NULL,
    [usage_code]            NVARCHAR (20)  NULL,
    [note]                  NVARCHAR (MAX) NULL,
    [created_date]          DATETIME2 (7)  NOT NULL,
    [created_by]            INT            NOT NULL,
    [modified_date]         DATETIME2 (7)  NULL,
    [modified_by]           INT            NULL,
    [owned_date]            DATETIME2 (7)  NOT NULL,
    [owned_by]              INT            NOT NULL,
    CONSTRAINT [PK_web_user_cart_item] PRIMARY KEY CLUSTERED ([web_user_cart_item_id] ASC),
    CONSTRAINT [fk_wuci_a] FOREIGN KEY ([accession_id]) REFERENCES [dbo].[accession] ([accession_id]),
    CONSTRAINT [fk_wuci_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wuci_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wuci_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wuci_wuc] FOREIGN KEY ([web_user_cart_id]) REFERENCES [dbo].[web_user_cart] ([web_user_cart_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_wuci]
    ON [dbo].[web_user_cart_item]([web_user_cart_id] ASC, [accession_id] ASC);

