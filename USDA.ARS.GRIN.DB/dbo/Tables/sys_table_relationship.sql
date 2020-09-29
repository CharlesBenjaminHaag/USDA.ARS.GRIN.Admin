CREATE TABLE [dbo].[sys_table_relationship] (
    [sys_table_relationship_id] INT           IDENTITY (1, 1) NOT NULL,
    [sys_table_field_id]        INT           NULL,
    [relationship_type_tag]     NVARCHAR (20) NOT NULL,
    [other_table_field_id]      INT           NULL,
    [created_by]                INT           NOT NULL,
    [created_date]              DATETIME2 (7) NOT NULL,
    [modified_by]               INT           NULL,
    [modified_date]             DATETIME2 (7) NULL,
    [owned_by]                  INT           NOT NULL,
    [owned_date]                DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_sys_table_relationship] PRIMARY KEY CLUSTERED ([sys_table_relationship_id] ASC),
    CONSTRAINT [fk_str_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_str_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_str_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_str_stf] FOREIGN KEY ([sys_table_field_id]) REFERENCES [dbo].[sys_table_field] ([sys_table_field_id]),
    CONSTRAINT [fk_str_stf_other] FOREIGN KEY ([other_table_field_id]) REFERENCES [dbo].[sys_table_field] ([sys_table_field_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_str]
    ON [dbo].[sys_table_relationship]([sys_table_field_id] ASC, [relationship_type_tag] ASC, [other_table_field_id] ASC);

