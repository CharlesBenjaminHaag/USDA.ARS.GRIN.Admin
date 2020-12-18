CREATE TABLE [cooperator] (
    [cooperator_id]                 INT            IDENTITY (1, 1) NOT NULL,
    [current_cooperator_id]         INT            NULL,
    [site_id]                       INT            NULL,
    [last_name]                     NVARCHAR (100) NULL,
    [title]                         NVARCHAR (10)  NULL,
    [first_name]                    NVARCHAR (100) NULL,
    [job]                           NVARCHAR (100) NULL,
    [organization]                  NVARCHAR (100) NULL,
    [organization_abbrev]           NVARCHAR (10)  NULL,
    [address_line1]                 NVARCHAR (100) NULL,
    [address_line2]                 NVARCHAR (100) NULL,
    [address_line3]                 NVARCHAR (100) NULL,
    [city]                          NVARCHAR (100) NULL,
    [postal_index]                  NVARCHAR (100) NULL,
    [geography_id]                  INT            NULL,
    [secondary_organization]        NVARCHAR (100) NULL,
    [secondary_organization_abbrev] NVARCHAR (10)  NULL,
    [secondary_address_line1]       NVARCHAR (100) NULL,
    [secondary_address_line2]       NVARCHAR (100) NULL,
    [secondary_address_line3]       NVARCHAR (100) NULL,
    [secondary_city]                NVARCHAR (100) NULL,
    [secondary_postal_index]        NVARCHAR (100) NULL,
    [secondary_geography_id]        INT            NULL,
    [primary_phone]                 NVARCHAR (30)  NULL,
    [secondary_phone]               NVARCHAR (30)  NULL,
    [fax]                           NVARCHAR (30)  NULL,
    [email]                         NVARCHAR (100) NULL,
    [secondary_email]               NVARCHAR (100) NULL,
    [status_code]                   NVARCHAR (20)  NOT NULL,
    [category_code]                 NVARCHAR (20)  NULL,
    [organization_region_code]      NVARCHAR (20)  NULL,
    [discipline_code]               NVARCHAR (20)  NULL,
    [note]                          NVARCHAR (MAX) NULL,
    [sys_lang_id]                   INT            NOT NULL,
    [web_cooperator_id]             INT            NULL,
    [created_date]                  DATETIME2 (7)  NOT NULL,
    [created_by]                    INT            NOT NULL,
    [modified_date]                 DATETIME2 (7)  NULL,
    [modified_by]                   INT            NULL,
    [owned_date]                    DATETIME2 (7)  NOT NULL,
    [owned_by]                      INT            NOT NULL,
    CONSTRAINT [PK_cooperator] PRIMARY KEY CLUSTERED ([cooperator_id] ASC),
    CONSTRAINT [fk_c_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_c_cur] FOREIGN KEY ([current_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_c_g] FOREIGN KEY ([geography_id]) REFERENCES [geography] ([geography_id]),
    CONSTRAINT [fk_c_g2] FOREIGN KEY ([secondary_geography_id]) REFERENCES [geography] ([geography_id]),
    CONSTRAINT [fk_c_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_c_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_c_s] FOREIGN KEY ([site_id]) REFERENCES [site] ([site_id]),
    CONSTRAINT [fk_c_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [sys_lang] ([sys_lang_id]),
    CONSTRAINT [fk_c_wc] FOREIGN KEY ([web_cooperator_id]) REFERENCES [web_cooperator] ([web_cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_co_full_name]
    ON [cooperator]([last_name] ASC, [first_name] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_co_org_code]
    ON [cooperator]([organization_abbrev] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_c_created]
    ON [cooperator]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_c_cur_c]
    ON [cooperator]([current_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_c_modified]
    ON [cooperator]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_c_owned]
    ON [cooperator]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_c_sl]
    ON [cooperator]([sys_lang_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_c_wc]
    ON [cooperator]([web_cooperator_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_co]
    ON [cooperator]([last_name] ASC, [first_name] ASC, [organization] ASC, [geography_id] ASC, [address_line1] ASC);


GO
CREATE STATISTICS [_dta_stat_693577509_3_1]
    ON [cooperator]([site_id], [cooperator_id]);


GO
GRANT DELETE
    ON OBJECT::[cooperator] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[cooperator] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[cooperator] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[cooperator] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[cooperator] TO [gg_search]
    AS [dbo];

