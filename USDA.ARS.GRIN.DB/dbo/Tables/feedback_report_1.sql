CREATE TABLE [feedback_report] (
    [feedback_report_id]       INT            IDENTITY (1, 1) NOT NULL,
    [feedback_id]              INT            NOT NULL,
    [feedback_form_id]         INT            NOT NULL,
    [title]                    NVARCHAR (100) NOT NULL,
    [is_observation_data]      NVARCHAR (1)   NOT NULL,
    [is_web_visible]           NVARCHAR (1)   NOT NULL,
    [due_interval]             INT            NOT NULL,
    [interval_length_code]     NVARCHAR (20)  NOT NULL,
    [interval_type_code]       NVARCHAR (20)  NOT NULL,
    [custom_due_date]          DATETIME2 (7)  NULL,
    [sort_order]               INT            NOT NULL,
    [is_notified_initially]    NVARCHAR (1)   NOT NULL,
    [is_notified_30days_prior] NVARCHAR (1)   NOT NULL,
    [is_notified_15days_prior] NVARCHAR (1)   NOT NULL,
    [initial_email_text]       NVARCHAR (MAX) NULL,
    [initial_email_subject]    NVARCHAR (500) NULL,
    [prior30_email_text]       NVARCHAR (MAX) NULL,
    [prior30_email_subject]    NVARCHAR (500) NULL,
    [prior15_email_text]       NVARCHAR (MAX) NULL,
    [prior15_email_subject]    NVARCHAR (500) NULL,
    [created_date]             DATETIME2 (7)  NOT NULL,
    [created_by]               INT            NOT NULL,
    [modified_date]            DATETIME2 (7)  NULL,
    [modified_by]              INT            NULL,
    [owned_date]               DATETIME2 (7)  NOT NULL,
    [owned_by]                 INT            NOT NULL,
    CONSTRAINT [PK_feedback_report] PRIMARY KEY CLUSTERED ([feedback_report_id] ASC),
    CONSTRAINT [fk_fr_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fr_f] FOREIGN KEY ([feedback_id]) REFERENCES [feedback] ([feedback_id]),
    CONSTRAINT [fk_fr_ff] FOREIGN KEY ([feedback_form_id]) REFERENCES [feedback_form] ([feedback_form_id]),
    CONSTRAINT [fk_fr_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fr_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fr_created]
    ON [feedback_report]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fr_modified]
    ON [feedback_report]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fr_owned]
    ON [feedback_report]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_fr]
    ON [feedback_report]([title] ASC);


GO
GRANT DELETE
    ON OBJECT::[feedback_report] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[feedback_report] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback_report] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[feedback_report] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback_report] TO [gg_search]
    AS [dbo];

