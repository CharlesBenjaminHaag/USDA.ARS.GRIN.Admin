CREATE TABLE [dbo].[email] (
    [email_id]                 INT             IDENTITY (1, 1) NOT NULL,
    [id_type]                  NVARCHAR (100)  NULL,
    [id_number]                INT             NULL,
    [email_from]               NVARCHAR (200)  NULL,
    [email_to]                 NVARCHAR (1000) NULL,
    [email_cc]                 NVARCHAR (1000) NULL,
    [email_bcc]                NVARCHAR (1000) NULL,
    [email_reply_to]           NVARCHAR (200)  NULL,
    [subject]                  NVARCHAR (500)  NULL,
    [body]                     NVARCHAR (MAX)  NULL,
    [is_html]                  NVARCHAR (1)    NOT NULL,
    [to_be_sent_date]          DATETIME2 (7)   NOT NULL,
    [sent_date]                DATETIME2 (7)   NULL,
    [retry_count]              INT             NOT NULL,
    [last_retry_date]          DATETIME2 (7)   NULL,
    [last_retry_error_message] NVARCHAR (MAX)  NULL,
    [created_date]             DATETIME2 (7)   NOT NULL,
    [created_by]               INT             NOT NULL,
    [modified_date]            DATETIME2 (7)   NULL,
    [modified_by]              INT             NULL,
    [owned_date]               DATETIME2 (7)   NOT NULL,
    [owned_by]                 INT             NOT NULL,
    CONSTRAINT [PK_email] PRIMARY KEY CLUSTERED ([email_id] ASC),
    CONSTRAINT [fk_e_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_e_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_e_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_e_created]
    ON [dbo].[email]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_e_modified]
    ON [dbo].[email]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_e_owned]
    ON [dbo].[email]([owned_by] ASC);

