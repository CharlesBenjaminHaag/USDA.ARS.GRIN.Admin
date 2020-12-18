CREATE TABLE [feedback_result_group] (
    [feedback_result_group_id]  INT           IDENTITY (1, 1) NOT NULL,
    [feedback_report_id]        INT           NOT NULL,
    [participant_cooperator_id] INT           NOT NULL,
    [order_request_id]          INT           NOT NULL,
    [started_date]              DATETIME2 (7) NULL,
    [submitted_date]            DATETIME2 (7) NULL,
    [accepted_date]             DATETIME2 (7) NULL,
    [rejected_date]             DATETIME2 (7) NULL,
    [due_date]                  DATETIME2 (7) NULL,
    [created_date]              DATETIME2 (7) NOT NULL,
    [created_by]                INT           NOT NULL,
    [modified_date]             DATETIME2 (7) NULL,
    [modified_by]               INT           NULL,
    [owned_date]                DATETIME2 (7) NOT NULL,
    [owned_by]                  INT           NOT NULL,
    CONSTRAINT [PK_feedback_result_group] PRIMARY KEY CLUSTERED ([feedback_result_group_id] ASC),
    CONSTRAINT [fk_frg_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_frg_fr] FOREIGN KEY ([feedback_report_id]) REFERENCES [feedback_report] ([feedback_report_id]),
    CONSTRAINT [fk_frg_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_frg_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_frg_created]
    ON [feedback_result_group]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_frg_modified]
    ON [feedback_result_group]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_frg_owned]
    ON [feedback_result_group]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_frg_c]
    ON [feedback_result_group]([participant_cooperator_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_fres]
    ON [feedback_result_group]([feedback_report_id] ASC, [participant_cooperator_id] ASC, [order_request_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[feedback_result_group] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[feedback_result_group] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback_result_group] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[feedback_result_group] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback_result_group] TO [gg_search]
    AS [dbo];

