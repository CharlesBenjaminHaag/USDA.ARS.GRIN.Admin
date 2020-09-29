CREATE TABLE [dbo].[taxonomy_regulation] (
    [taxonomy_regulation_id] INT            IDENTITY (1, 1) NOT NULL,
    [geography_id]           INT            NOT NULL,
    [regulation_type_code]   NVARCHAR (20)  NOT NULL,
    [regulation_level_code]  NVARCHAR (20)  NULL,
    [description]            NVARCHAR (80)  NULL,
    [url_1]                  NVARCHAR (250) NULL,
    [url_2]                  NVARCHAR (250) NULL,
    [note]                   NVARCHAR (MAX) NULL,
    [created_date]           DATETIME2 (7)  NOT NULL,
    [created_by]             INT            NOT NULL,
    [modified_date]          DATETIME2 (7)  NULL,
    [modified_by]            INT            NULL,
    [owned_date]             DATETIME2 (7)  NOT NULL,
    [owned_by]               INT            NOT NULL,
    CONSTRAINT [PK_taxonomy_regulation_level] PRIMARY KEY CLUSTERED ([taxonomy_regulation_id] ASC),
    CONSTRAINT [fk_tr_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tr_g] FOREIGN KEY ([geography_id]) REFERENCES [dbo].[geography] ([geography_id]),
    CONSTRAINT [fk_tr_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tr_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tr_g]
    ON [dbo].[taxonomy_regulation]([geography_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tr_created]
    ON [dbo].[taxonomy_regulation]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tr_modified]
    ON [dbo].[taxonomy_regulation]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tr_owned]
    ON [dbo].[taxonomy_regulation]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_tr]
    ON [dbo].[taxonomy_regulation]([geography_id] ASC, [regulation_type_code] ASC, [regulation_level_code] ASC);

