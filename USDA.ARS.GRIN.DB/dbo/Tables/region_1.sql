CREATE TABLE [region] (
    [region_id]                 INT            IDENTITY (1, 1) NOT NULL,
    [continent]                 NVARCHAR (20)  NOT NULL,
    [subcontinent]              NVARCHAR (30)  NULL,
    [sequence_number]           INT            NULL,
    [continent_abbreviation]    NVARCHAR (20)  NULL,
    [subcontinent_abbreviation] NVARCHAR (20)  NULL,
    [note]                      NVARCHAR (MAX) NULL,
    [created_date]              DATETIME2 (7)  NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  NOT NULL,
    [owned_by]                  INT            NOT NULL,
    CONSTRAINT [PK_region] PRIMARY KEY CLUSTERED ([region_id] ASC),
    CONSTRAINT [fk_r_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_r_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_r_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_r_created]
    ON [region]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_r_modified]
    ON [region]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_r_owned]
    ON [region]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_re]
    ON [region]([continent] ASC, [subcontinent] ASC);


GO
GRANT DELETE
    ON OBJECT::[region] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[region] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[region] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[region] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[region] TO [gg_search]
    AS [dbo];

