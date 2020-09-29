CREATE TABLE [dbo].[feedback_result_field] (
    [feedback_result_field_id] INT            IDENTITY (1, 1) NOT NULL,
    [feedback_result_id]       INT            NOT NULL,
    [feedback_form_field_id]   INT            NOT NULL,
    [string_value]             NVARCHAR (500) NULL,
    [admin_value]              NVARCHAR (500) NULL,
    [created_date]             DATETIME2 (7)  NULL,
    [created_by]               INT            NOT NULL,
    [modified_date]            DATETIME2 (7)  NULL,
    [modified_by]              INT            NULL,
    [owned_date]               DATETIME2 (7)  NOT NULL,
    [owned_by]                 INT            NOT NULL,
    CONSTRAINT [PK_feedback_result_field] PRIMARY KEY CLUSTERED ([feedback_result_field_id] ASC),
    CONSTRAINT [fk_fresf_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fresf_fff] FOREIGN KEY ([feedback_form_field_id]) REFERENCES [dbo].[feedback_form_field] ([feedback_form_field_id]),
    CONSTRAINT [fk_fresf_fres] FOREIGN KEY ([feedback_result_id]) REFERENCES [dbo].[feedback_result] ([feedback_result_id]),
    CONSTRAINT [fk_fresf_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fresf_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [fk_fresf_fff]
    ON [dbo].[feedback_result_field]([feedback_form_field_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresf_created]
    ON [dbo].[feedback_result_field]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresf_modified]
    ON [dbo].[feedback_result_field]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresf_owned]
    ON [dbo].[feedback_result_field]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_fresf]
    ON [dbo].[feedback_result_field]([feedback_result_id] ASC, [feedback_form_field_id] ASC);

