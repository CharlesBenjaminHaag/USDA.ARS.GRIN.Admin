CREATE TABLE [literature] (
    [literature_id]         INT             IDENTITY (1, 1) NOT NULL,
    [abbreviation]          NVARCHAR (20)   NOT NULL,
    [standard_abbreviation] NVARCHAR (2000) NULL,
    [reference_title]       NVARCHAR (2000) NULL,
    [editor_author_name]    NVARCHAR (2000) NULL,
    [literature_type_code]  NVARCHAR (20)   NULL,
    [publication_year]      NVARCHAR (50)   NULL,
    [publisher_name]        NVARCHAR (2000) NULL,
    [publisher_location]    NVARCHAR (2000) NULL,
    [url]                   NVARCHAR (500)  NULL,
    [note]                  NVARCHAR (MAX)  NULL,
    [created_date]          DATETIME2 (7)   NOT NULL,
    [created_by]            INT             NOT NULL,
    [modified_date]         DATETIME2 (7)   NULL,
    [modified_by]           INT             NULL,
    [owned_date]            DATETIME2 (7)   NOT NULL,
    [owned_by]              INT             NOT NULL,
    CONSTRAINT [PK_literature] PRIMARY KEY CLUSTERED ([literature_id] ASC),
    CONSTRAINT [fk_l_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_l_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_l_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_l_created]
    ON [literature]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_l_modified]
    ON [literature]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_l_owned]
    ON [literature]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_l]
    ON [literature]([abbreviation] ASC);


GO
GRANT DELETE
    ON OBJECT::[literature] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[literature] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[literature] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[literature] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[literature] TO [gg_search]
    AS [dbo];

