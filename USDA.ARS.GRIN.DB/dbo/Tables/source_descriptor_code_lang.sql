CREATE TABLE [dbo].[source_descriptor_code_lang] (
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
    CONSTRAINT [fk_sodcl_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sodcl_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sodcl_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_sodcl_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [dbo].[sys_lang] ([sys_lang_id]),
    CONSTRAINT [fk_sodcl_sodc] FOREIGN KEY ([source_descriptor_code_id]) REFERENCES [dbo].[source_descriptor_code] ([source_descriptor_code_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodcl_created]
    ON [dbo].[source_descriptor_code_lang]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodcl_modified]
    ON [dbo].[source_descriptor_code_lang]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodcl_owned]
    ON [dbo].[source_descriptor_code_lang]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodcl_sl]
    ON [dbo].[source_descriptor_code_lang]([sys_lang_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_sodcl_sodc]
    ON [dbo].[source_descriptor_code_lang]([source_descriptor_code_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sodcl]
    ON [dbo].[source_descriptor_code_lang]([source_descriptor_code_id] ASC, [sys_lang_id] ASC);

