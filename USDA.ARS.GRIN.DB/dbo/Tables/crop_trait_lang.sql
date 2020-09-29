CREATE TABLE [dbo].[crop_trait_lang] (
    [crop_trait_lang_id] INT            IDENTITY (1, 1) NOT NULL,
    [crop_trait_id]      INT            NOT NULL,
    [sys_lang_id]        INT            NOT NULL,
    [title]              NVARCHAR (500) NULL,
    [description]        NVARCHAR (MAX) NULL,
    [created_date]       DATETIME2 (7)  NOT NULL,
    [created_by]         INT            NOT NULL,
    [modified_date]      DATETIME2 (7)  NULL,
    [modified_by]        INT            NULL,
    [owned_date]         DATETIME2 (7)  NOT NULL,
    [owned_by]           INT            NOT NULL,
    CONSTRAINT [PK_crop_trait_lang] PRIMARY KEY CLUSTERED ([crop_trait_lang_id] ASC),
    CONSTRAINT [fk_ctl_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ctl_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ctl_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ctl_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [dbo].[sys_lang] ([sys_lang_id]),
    CONSTRAINT [fk_ctl_t] FOREIGN KEY ([crop_trait_id]) REFERENCES [dbo].[crop_trait] ([crop_trait_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctl_created]
    ON [dbo].[crop_trait_lang]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctl_modified]
    ON [dbo].[crop_trait_lang]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctl_owned]
    ON [dbo].[crop_trait_lang]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctl_sl]
    ON [dbo].[crop_trait_lang]([sys_lang_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctl_t]
    ON [dbo].[crop_trait_lang]([crop_trait_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ctl]
    ON [dbo].[crop_trait_lang]([crop_trait_id] ASC, [sys_lang_id] ASC);

