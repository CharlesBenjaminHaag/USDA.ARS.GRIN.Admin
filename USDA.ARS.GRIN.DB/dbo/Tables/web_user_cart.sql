CREATE TABLE [dbo].[web_user_cart] (
    [web_user_cart_id] INT           IDENTITY (1, 1) NOT NULL,
    [web_user_id]      INT           NOT NULL,
    [cart_type_code]   NVARCHAR (20) NOT NULL,
    [expiration_date]  DATETIME2 (7) NOT NULL,
    [created_date]     DATETIME2 (7) NOT NULL,
    [created_by]       INT           NOT NULL,
    [modified_date]    DATETIME2 (7) NULL,
    [modified_by]      INT           NULL,
    [owned_date]       DATETIME2 (7) NOT NULL,
    [owned_by]         INT           NOT NULL,
    CONSTRAINT [PK_web_user_cart] PRIMARY KEY CLUSTERED ([web_user_cart_id] ASC),
    CONSTRAINT [fk_wuc_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wuc_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wuc_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[web_user] ([web_user_id]),
    CONSTRAINT [fk_wuc_wu] FOREIGN KEY ([web_user_id]) REFERENCES [dbo].[web_user] ([web_user_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_wuc]
    ON [dbo].[web_user_cart]([web_user_id] ASC, [cart_type_code] ASC);

