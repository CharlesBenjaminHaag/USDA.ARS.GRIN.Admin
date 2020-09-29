CREATE TABLE [dbo].[accession_source] (
    [accession_source_id]          INT             IDENTITY (1, 1) NOT NULL,
    [accession_id]                 INT             NOT NULL,
    [geography_id]                 INT             NULL,
    [acquisition_source_code]      NVARCHAR (20)   NULL,
    [source_type_code]             NVARCHAR (20)   NOT NULL,
    [source_date]                  DATETIME2 (7)   NULL,
    [source_date_code]             NVARCHAR (20)   NULL,
    [is_origin]                    NVARCHAR (1)    NOT NULL,
    [quantity_collected]           DECIMAL (18, 5) NULL,
    [unit_quantity_collected_code] NVARCHAR (20)   NULL,
    [collected_form_code]          NVARCHAR (20)   NULL,
    [number_plants_sampled]        INT             NULL,
    [elevation_meters]             INT             NULL,
    [collector_verbatim_locality]  NVARCHAR (MAX)  NULL,
    [latitude]                     DECIMAL (18, 8) NULL,
    [longitude]                    DECIMAL (18, 8) NULL,
    [uncertainty]                  INT             NULL,
    [formatted_locality]           NVARCHAR (MAX)  NULL,
    [georeference_datum]           NVARCHAR (10)   NULL,
    [georeference_protocol_code]   NVARCHAR (20)   NULL,
    [georeference_annotation]      NVARCHAR (MAX)  NULL,
    [environment_description]      NVARCHAR (MAX)  NULL,
    [associated_species]           NVARCHAR (MAX)  NULL,
    [is_web_visible]               NVARCHAR (1)    CONSTRAINT [DF__accession__is_we__1920BF5C] DEFAULT ('Y') NOT NULL,
    [note]                         NVARCHAR (MAX)  NULL,
    [created_date]                 DATETIME2 (7)   NOT NULL,
    [created_by]                   INT             NOT NULL,
    [modified_date]                DATETIME2 (7)   NULL,
    [modified_by]                  INT             NULL,
    [owned_date]                   DATETIME2 (7)   NOT NULL,
    [owned_by]                     INT             NOT NULL,
    CONSTRAINT [PK_accession_source] PRIMARY KEY CLUSTERED ([accession_source_id] ASC),
    CONSTRAINT [fk_as_a] FOREIGN KEY ([accession_id]) REFERENCES [dbo].[accession] ([accession_id]),
    CONSTRAINT [fk_as_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_as_g] FOREIGN KEY ([geography_id]) REFERENCES [dbo].[geography] ([geography_id]),
    CONSTRAINT [fk_as_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_as_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_as_a]
    ON [dbo].[accession_source]([accession_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_as_created]
    ON [dbo].[accession_source]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_as_g]
    ON [dbo].[accession_source]([geography_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_as_modified]
    ON [dbo].[accession_source]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_as_owned]
    ON [dbo].[accession_source]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sr]
    ON [dbo].[accession_source]([accession_id] ASC, [source_type_code] ASC, [source_date] ASC, [geography_id] ASC);

