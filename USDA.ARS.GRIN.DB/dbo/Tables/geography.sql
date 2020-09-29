CREATE TABLE [dbo].[geography] (
    [geography_id]         INT            IDENTITY (1, 1) NOT NULL,
    [current_geography_id] INT            NULL,
    [country_code]         NVARCHAR (20)  NOT NULL,
    [adm1]                 NVARCHAR (100) NULL,
    [adm1_type_code]       NVARCHAR (20)  NULL,
    [adm1_abbrev]          NVARCHAR (10)  NULL,
    [adm2]                 NVARCHAR (50)  NULL,
    [adm2_type_code]       NVARCHAR (20)  NULL,
    [adm2_abbrev]          NVARCHAR (10)  NULL,
    [adm3]                 NVARCHAR (50)  NULL,
    [adm3_type_code]       NVARCHAR (20)  NULL,
    [adm3_abbrev]          NVARCHAR (10)  NULL,
    [adm4]                 NVARCHAR (50)  NULL,
    [adm4_type_code]       NVARCHAR (20)  NULL,
    [adm4_abbrev]          NVARCHAR (10)  NULL,
    [changed_date]         DATETIME2 (7)  NULL,
    [is_valid]             NVARCHAR (1)   NOT NULL,
    [note]                 NVARCHAR (MAX) NULL,
    [created_date]         DATETIME2 (7)  NOT NULL,
    [created_by]           INT            NOT NULL,
    [modified_date]        DATETIME2 (7)  NULL,
    [modified_by]          INT            NULL,
    [owned_date]           DATETIME2 (7)  NOT NULL,
    [owned_by]             INT            NOT NULL,
    CONSTRAINT [PK_geography] PRIMARY KEY CLUSTERED ([geography_id] ASC),
    CONSTRAINT [fk_g_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_g_cur_g] FOREIGN KEY ([current_geography_id]) REFERENCES [dbo].[geography] ([geography_id]),
    CONSTRAINT [fk_g_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_g_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_g_created]
    ON [dbo].[geography]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_g_cur_g]
    ON [dbo].[geography]([current_geography_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_g_modified]
    ON [dbo].[geography]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_g_owned]
    ON [dbo].[geography]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_g_adm1]
    ON [dbo].[geography]([adm1] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_g_adm2]
    ON [dbo].[geography]([adm2] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_g_adm3]
    ON [dbo].[geography]([adm3] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_g_adm4]
    ON [dbo].[geography]([adm4] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_g_country_code]
    ON [dbo].[geography]([country_code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_geo]
    ON [dbo].[geography]([country_code] ASC, [adm1] ASC, [adm1_type_code] ASC, [adm2] ASC, [adm3] ASC, [adm4] ASC);

