CREATE TABLE [dbo].[feedback_form] (
    [feedback_form_id] INT            IDENTITY (1, 1) NOT NULL,
    [title]            NVARCHAR (100) NOT NULL,
    [created_date]     DATETIME2 (7)  NOT NULL,
    [created_by]       INT            NOT NULL,
    [modified_date]    DATETIME2 (7)  NULL,
    [modified_by]      INT            NULL,
    [owned_date]       DATETIME2 (7)  NOT NULL,
    [owned_by]         INT            NOT NULL,
    CONSTRAINT [PK_feedback_form] PRIMARY KEY CLUSTERED ([feedback_form_id] ASC),
    CONSTRAINT [fk_ff_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ff_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ff_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ff_created]
    ON [dbo].[feedback_form]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ff_modified]
    ON [dbo].[feedback_form]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ff_owned]
    ON [dbo].[feedback_form]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ff]
    ON [dbo].[feedback_form]([title] ASC);

