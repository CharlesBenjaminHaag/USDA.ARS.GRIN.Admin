CREATE TABLE [dbo].[cooperator] (
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
    CONSTRAINT [fk_c_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_c_cur] FOREIGN KEY ([current_cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_c_g] FOREIGN KEY ([geography_id]) REFERENCES [dbo].[geography] ([geography_id]),
    CONSTRAINT [fk_c_g2] FOREIGN KEY ([secondary_geography_id]) REFERENCES [dbo].[geography] ([geography_id]),
    CONSTRAINT [fk_c_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_c_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_c_s] FOREIGN KEY ([site_id]) REFERENCES [dbo].[site] ([site_id]),
    CONSTRAINT [fk_c_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [dbo].[sys_lang] ([sys_lang_id]),
    CONSTRAINT [fk_c_wc] FOREIGN KEY ([web_cooperator_id]) REFERENCES [dbo].[web_cooperator] ([web_cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_co_full_name]
    ON [dbo].[cooperator]([last_name] ASC, [first_name] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_co_org_code]
    ON [dbo].[cooperator]([organization_abbrev] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_c_created]
    ON [dbo].[cooperator]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_c_cur_c]
    ON [dbo].[cooperator]([current_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_c_modified]
    ON [dbo].[cooperator]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_c_owned]
    ON [dbo].[cooperator]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_c_sl]
    ON [dbo].[cooperator]([sys_lang_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_c_wc]
    ON [dbo].[cooperator]([web_cooperator_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_co]
    ON [dbo].[cooperator]([last_name] ASC, [first_name] ASC, [organization] ASC, [geography_id] ASC, [address_line1] ASC);


GO
CREATE STATISTICS [_dta_stat_693577509_3_1]
    ON [dbo].[cooperator]([site_id], [cooperator_id]);

