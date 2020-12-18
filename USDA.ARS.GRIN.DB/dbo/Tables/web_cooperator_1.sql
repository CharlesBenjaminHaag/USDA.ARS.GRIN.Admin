CREATE TABLE [web_cooperator] (
    [web_cooperator_id]   INT            IDENTITY (1, 1) NOT NULL,
    [last_name]           NVARCHAR (100) NULL,
    [title]               NVARCHAR (10)  NULL,
    [first_name]          NVARCHAR (100) NULL,
    [job]                 NVARCHAR (100) NULL,
    [organization]        NVARCHAR (100) NULL,
    [organization_code]   NVARCHAR (10)  NULL,
    [address_line1]       NVARCHAR (100) NULL,
    [address_line2]       NVARCHAR (100) NULL,
    [address_line3]       NVARCHAR (100) NULL,
    [city]                NVARCHAR (100) NULL,
    [postal_index]        NVARCHAR (100) NULL,
    [geography_id]        INT            NULL,
    [primary_phone]       NVARCHAR (30)  NULL,
    [secondary_phone]     NVARCHAR (30)  NULL,
    [fax]                 NVARCHAR (30)  NULL,
    [email]               NVARCHAR (100) NULL,
    [is_active]           NVARCHAR (1)   NOT NULL,
    [category_code]       NVARCHAR (4)   NULL,
    [organization_region] NVARCHAR (20)  NULL,
    [discipline]          NVARCHAR (50)  NULL,
    [initials]            NVARCHAR (10)  NULL,
    [note]                NVARCHAR (MAX) NULL,
    [created_date]        DATETIME2 (7)  NOT NULL,
    [created_by]          INT            NOT NULL,
    [modified_date]       DATETIME2 (7)  NULL,
    [modified_by]         INT            NULL,
    [owned_date]          DATETIME2 (7)  NOT NULL,
    [owned_by]            INT            NOT NULL,
    CONSTRAINT [PK_web_cooperator] PRIMARY KEY CLUSTERED ([web_cooperator_id] ASC),
    CONSTRAINT [fk_wc_created] FOREIGN KEY ([created_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_wc_g] FOREIGN KEY ([geography_id]) REFERENCES [geography] ([geography_id]),
    CONSTRAINT [fk_wc_modified] FOREIGN KEY ([modified_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_wc_owned] FOREIGN KEY ([owned_by]) REFERENCES [web_user] ([web_user_id])
);


GO
GRANT DELETE
    ON OBJECT::[web_cooperator] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[web_cooperator] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_cooperator] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[web_cooperator] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_cooperator] TO [gg_search]
    AS [dbo];

