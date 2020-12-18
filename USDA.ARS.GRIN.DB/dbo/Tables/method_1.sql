CREATE TABLE [method] (
    [method_id]                  INT             IDENTITY (1, 1) NOT NULL,
    [name]                       NVARCHAR (100)  NOT NULL,
    [geography_id]               INT             NULL,
    [elevation_meters]           INT             NULL,
    [latitude]                   DECIMAL (18, 8) NULL,
    [longitude]                  DECIMAL (18, 8) NULL,
    [uncertainty]                INT             NULL,
    [formatted_locality]         NVARCHAR (MAX)  NULL,
    [georeference_datum]         NVARCHAR (10)   NULL,
    [georeference_protocol_code] NVARCHAR (20)   NULL,
    [georeference_annotation]    NVARCHAR (MAX)  NULL,
    [materials_and_methods]      NVARCHAR (MAX)  NULL,
    [study_reason_code]          NVARCHAR (20)   NULL,
    [created_date]               DATETIME2 (7)   NOT NULL,
    [created_by]                 INT             NOT NULL,
    [modified_date]              DATETIME2 (7)   NULL,
    [modified_by]                INT             NULL,
    [owned_date]                 DATETIME2 (7)   NOT NULL,
    [owned_by]                   INT             NOT NULL,
    CONSTRAINT [PK_method] PRIMARY KEY CLUSTERED ([method_id] ASC),
    CONSTRAINT [fk_m_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_m_g] FOREIGN KEY ([geography_id]) REFERENCES [geography] ([geography_id]),
    CONSTRAINT [fk_m_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_m_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_m_created]
    ON [method]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_m_g]
    ON [method]([geography_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_m_modified]
    ON [method]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_m_owned]
    ON [method]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_m]
    ON [method]([name] ASC);


GO
GRANT DELETE
    ON OBJECT::[method] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[method] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[method] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[method] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[method] TO [gg_search]
    AS [dbo];

