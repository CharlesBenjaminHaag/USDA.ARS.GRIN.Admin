CREATE TABLE [web_user_shipping_address] (
    [web_user_shipping_address_id] INT            IDENTITY (1, 1) NOT NULL,
    [web_user_id]                  INT            NOT NULL,
    [address_name]                 NVARCHAR (50)  NOT NULL,
    [address_line1]                NVARCHAR (100) NOT NULL,
    [address_line2]                NVARCHAR (100) NULL,
    [address_line3]                NVARCHAR (100) NULL,
    [city]                         NVARCHAR (100) NOT NULL,
    [postal_index]                 NVARCHAR (100) NOT NULL,
    [geography_id]                 INT            NOT NULL,
    [is_default]                   NVARCHAR (1)   NULL,
    [created_date]                 DATETIME2 (7)  NOT NULL,
    [created_by]                   INT            NOT NULL,
    [modified_date]                DATETIME2 (7)  NULL,
    [modified_by]                  INT            NULL,
    [owned_date]                   DATETIME2 (7)  NOT NULL,
    [owned_by]                     INT            NOT NULL,
    CONSTRAINT [PK_web_user_shipping_address] PRIMARY KEY CLUSTERED ([web_user_shipping_address_id] ASC),
    CONSTRAINT [fk_wusa_created] FOREIGN KEY ([created_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_wusa_g] FOREIGN KEY ([geography_id]) REFERENCES [geography] ([geography_id]),
    CONSTRAINT [fk_wusa_modified] FOREIGN KEY ([modified_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_wusa_owned] FOREIGN KEY ([owned_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_wusa_wu] FOREIGN KEY ([web_user_id]) REFERENCES [web_user] ([web_user_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_wusa]
    ON [web_user_shipping_address]([web_user_id] ASC, [address_name] ASC);


GO
GRANT DELETE
    ON OBJECT::[web_user_shipping_address] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[web_user_shipping_address] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_user_shipping_address] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[web_user_shipping_address] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_user_shipping_address] TO [gg_search]
    AS [dbo];

