CREATE TABLE [feedback_report_attach] (
    [feedback_report_attach_id] INT            IDENTITY (1, 1) NOT NULL,
    [feedback_report_id]        INT            NOT NULL,
    [virtual_path]              NVARCHAR (255) NOT NULL,
    [thumbnail_virtual_path]    NVARCHAR (255) NULL,
    [sort_order]                INT            NULL,
    [title]                     NVARCHAR (500) NULL,
    [description]               NVARCHAR (500) NULL,
    [content_type]              NVARCHAR (100) NULL,
    [category_code]             NVARCHAR (20)  NULL,
    [is_web_visible]            NVARCHAR (1)   NOT NULL,
    [note]                      NVARCHAR (MAX) NULL,
    [created_date]              DATETIME2 (7)  NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  NOT NULL,
    [owned_by]                  INT            NOT NULL,
    CONSTRAINT [PK_feedback_report_attach] PRIMARY KEY CLUSTERED ([feedback_report_attach_id] ASC),
    CONSTRAINT [fk_fa_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fa_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fa_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_frepa_frep] FOREIGN KEY ([feedback_report_id]) REFERENCES [feedback_report] ([feedback_report_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fa_created]
    ON [feedback_report_attach]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fa_modified]
    ON [feedback_report_attach]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fa_owned]
    ON [feedback_report_attach]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_frepa]
    ON [feedback_report_attach]([feedback_report_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_fa]
    ON [feedback_report_attach]([feedback_report_id] ASC, [virtual_path] ASC);


GO
GRANT DELETE
    ON OBJECT::[feedback_report_attach] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[feedback_report_attach] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback_report_attach] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[feedback_report_attach] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback_report_attach] TO [gg_search]
    AS [dbo];

