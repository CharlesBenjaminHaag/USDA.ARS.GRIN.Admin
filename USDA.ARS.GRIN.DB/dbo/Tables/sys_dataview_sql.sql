CREATE TABLE [dbo].[sys_dataview_sql] (
    [sys_dataview_sql_id] INT            IDENTITY (1, 1) NOT NULL,
    [sys_dataview_id]     INT            NOT NULL,
    [database_engine_tag] NVARCHAR (10)  NOT NULL,
    [sql_statement]       NVARCHAR (MAX) NOT NULL,
    [created_date]        DATETIME2 (7)  NOT NULL,
    [created_by]          INT            NOT NULL,
    [modified_date]       DATETIME2 (7)  NULL,
    [modified_by]         INT            NULL,
    [owned_date]          DATETIME2 (7)  NOT NULL,
    [owned_by]            INT            NOT NULL,
    CONSTRAINT [PK_sys_dataview_sql] PRIMARY KEY CLUSTERED ([sys_dataview_sql_id] ASC),
    CONSTRAINT [fk_srs_createdby] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_srs_modifiedby] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_srs_ownedby] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_srs_sr] FOREIGN KEY ([sys_dataview_id]) REFERENCES [dbo].[sys_dataview] ([sys_dataview_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sds]
    ON [dbo].[sys_dataview_sql]([sys_dataview_id] ASC, [database_engine_tag] ASC);

