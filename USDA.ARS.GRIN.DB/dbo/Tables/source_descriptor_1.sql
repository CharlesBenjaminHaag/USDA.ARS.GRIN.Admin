CREATE TABLE [source_descriptor] (
    [source_descriptor_id]     INT             IDENTITY (1, 1) NOT NULL,
    [coded_name]               NVARCHAR (30)   NOT NULL,
    [category_code]            NVARCHAR (20)   NOT NULL,
    [data_type_code]           NVARCHAR (20)   NOT NULL,
    [is_coded]                 NVARCHAR (1)    NOT NULL,
    [max_length]               INT             NULL,
    [numeric_format]           NVARCHAR (15)   NULL,
    [numeric_maximum]          DECIMAL (18, 5) NULL,
    [numeric_minimum]          DECIMAL (18, 5) NULL,
    [original_value_type_code] NVARCHAR (20)   NULL,
    [original_value_format]    NVARCHAR (50)   NULL,
    [ontology_url]             NVARCHAR (300)  NULL,
    [note]                     NVARCHAR (MAX)  NULL,
    [created_date]             DATETIME2 (7)   NOT NULL,
    [created_by]               INT             NOT NULL,
    [modified_date]            DATETIME2 (7)   NULL,
    [modified_by]              INT             NULL,
    [owned_date]               DATETIME2 (7)   NOT NULL,
    [owned_by]                 INT             NOT NULL,
    CONSTRAINT [PK_source_descriptor] PRIMARY KEY CLUSTERED ([source_descriptor_id] ASC),
    CONSTRAINT [fk_sd_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sd_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sd_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sd_created]
    ON [source_descriptor]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sd_modified]
    ON [source_descriptor]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sd_owned]
    ON [source_descriptor]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sd]
    ON [source_descriptor]([coded_name] ASC);


GO
GRANT DELETE
    ON OBJECT::[source_descriptor] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[source_descriptor] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[source_descriptor] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[source_descriptor] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[source_descriptor] TO [gg_search]
    AS [dbo];

