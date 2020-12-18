CREATE TABLE [site] (
    [site_id]              INT            IDENTITY (1, 1) NOT NULL,
    [site_short_name]      NVARCHAR (20)  NOT NULL,
    [site_long_name]       NVARCHAR (200) NOT NULL,
    [provider_identifier]  NVARCHAR (6)   NULL,
    [organization_abbrev]  NVARCHAR (20)  NULL,
    [is_internal]          NVARCHAR (1)   NOT NULL,
    [is_distribution_site] NVARCHAR (1)   NOT NULL,
    [type_code]            NVARCHAR (20)  NULL,
    [fao_institute_number] NVARCHAR (20)  NULL,
    [note]                 NVARCHAR (MAX) NULL,
    [created_date]         DATETIME2 (7)  NOT NULL,
    [created_by]           INT            NOT NULL,
    [modified_date]        DATETIME2 (7)  NULL,
    [modified_by]          INT            NULL,
    [owned_date]           DATETIME2 (7)  NOT NULL,
    [owned_by]             INT            NOT NULL,
    CONSTRAINT [PK_site] PRIMARY KEY CLUSTERED ([site_id] ASC),
    CONSTRAINT [fk_s_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_s_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_s_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_s_created]
    ON [site]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_s_modified]
    ON [site]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_s_owned]
    ON [site]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_s]
    ON [site]([site_short_name] ASC, [site_long_name] ASC, [organization_abbrev] ASC, [fao_institute_number] ASC);


GO
GRANT DELETE
    ON OBJECT::[site] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[site] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[site] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[site] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[site] TO [gg_search]
    AS [dbo];

