CREATE TABLE [source_descriptor_code_lang] (
    [source_descriptor_code_lang_id] INT            IDENTITY (1, 1) NOT NULL,
    [source_descriptor_code_id]      INT            NOT NULL,
    [sys_lang_id]                    INT            NOT NULL,
    [title]                          NVARCHAR (500) NULL,
    [description]                    NVARCHAR (MAX) NULL,
    [created_date]                   DATETIME2 (7)  NOT NULL,
    [created_by]                     INT            NOT NULL,
    [modified_date]                  DATETIME2 (7)  NULL,
    [modified_by]                    INT            NULL,
    [owned_date]                     DATETIME2 (7)  NOT NULL,
    [owned_by]                       INT            NOT NULL,
    CONSTRAINT [PK_source_descriptor_code_lang] PRIMARY KEY CLUSTERED ([source_descriptor_code_lang_id] ASC),
    CONSTRAINT [fk_sodcl_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sodcl_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sodcl_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sodcl_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [sys_lang] ([sys_lang_id]),
    CONSTRAINT [fk_sodcl_sodc] FOREIGN KEY ([source_descriptor_code_id]) REFERENCES [source_descriptor_code] ([source_descriptor_code_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodcl_created]
    ON [source_descriptor_code_lang]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodcl_modified]
    ON [source_descriptor_code_lang]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodcl_owned]
    ON [source_descriptor_code_lang]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodcl_sl]
    ON [source_descriptor_code_lang]([sys_lang_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodcl_sodc]
    ON [source_descriptor_code_lang]([source_descriptor_code_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sodcl]
    ON [source_descriptor_code_lang]([source_descriptor_code_id] ASC, [sys_lang_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[source_descriptor_code_lang] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[source_descriptor_code_lang] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[source_descriptor_code_lang] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[source_descriptor_code_lang] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[source_descriptor_code_lang] TO [gg_search]
    AS [dbo];

