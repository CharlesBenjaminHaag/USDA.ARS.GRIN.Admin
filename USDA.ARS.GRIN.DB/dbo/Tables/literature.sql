CREATE TABLE [dbo].[literature] (
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
    CONSTRAINT [fk_l_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_l_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_l_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_l_created]
    ON [dbo].[literature]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_l_modified]
    ON [dbo].[literature]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_l_owned]
    ON [dbo].[literature]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_l]
    ON [dbo].[literature]([abbreviation] ASC);

