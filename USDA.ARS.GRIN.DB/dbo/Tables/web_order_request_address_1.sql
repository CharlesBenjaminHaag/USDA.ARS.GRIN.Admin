CREATE TABLE [web_order_request_address] (
    [web_order_request_address_id] INT            IDENTITY (1, 1) NOT NULL,
    [web_order_request_id]         INT            NOT NULL,
    [address_line1]                NVARCHAR (100) NULL,
    [address_line2]                NVARCHAR (100) NULL,
    [address_line3]                NVARCHAR (100) NULL,
    [city]                         NVARCHAR (100) NULL,
    [postal_index]                 NVARCHAR (100) NULL,
    [geography_id]                 INT            NULL,
    [carrier]                      NVARCHAR (20)  NULL,
    [carrier_account]              NVARCHAR (50)  NULL,
    [created_date]                 DATETIME2 (7)  NOT NULL,
    [created_by]                   INT            NOT NULL,
    [modified_date]                DATETIME2 (7)  NULL,
    [modified_by]                  INT            NULL,
    [owned_date]                   DATETIME2 (7)  NOT NULL,
    [owned_by]                     INT            NOT NULL,
    CONSTRAINT [PK_web_order_request_address] PRIMARY KEY CLUSTERED ([web_order_request_address_id] ASC),
    CONSTRAINT [fk_worad_created] FOREIGN KEY ([created_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_worad_g] FOREIGN KEY ([geography_id]) REFERENCES [geography] ([geography_id]),
    CONSTRAINT [fk_worad_owned] FOREIGN KEY ([owned_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_worad_wor] FOREIGN KEY ([web_order_request_id]) REFERENCES [web_order_request] ([web_order_request_id]),
    CONSTRAINT [fk_wurad_modified] FOREIGN KEY ([modified_by]) REFERENCES [web_user] ([web_user_id])
);


GO
GRANT DELETE
    ON OBJECT::[web_order_request_address] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[web_order_request_address] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_order_request_address] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[web_order_request_address] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_order_request_address] TO [gg_search]
    AS [dbo];

