CREATE TABLE [sys_table_relationship] (
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
    CONSTRAINT [fk_str_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_str_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_str_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_str_stf] FOREIGN KEY ([sys_table_field_id]) REFERENCES [sys_table_field] ([sys_table_field_id]),
    CONSTRAINT [fk_str_stf_other] FOREIGN KEY ([other_table_field_id]) REFERENCES [sys_table_field] ([sys_table_field_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_str]
    ON [sys_table_relationship]([sys_table_field_id] ASC, [relationship_type_tag] ASC, [other_table_field_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[sys_table_relationship] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[sys_table_relationship] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_table_relationship] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[sys_table_relationship] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[sys_table_relationship] TO [gg_search]
    AS [dbo];

