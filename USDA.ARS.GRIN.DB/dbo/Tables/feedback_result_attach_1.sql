CREATE TABLE [feedback_result_attach] (
    [feedback_result_attach_id] INT            IDENTITY (1, 1) NOT NULL,
    [feedback_result_id]        INT            NOT NULL,
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
    CONSTRAINT [PK_feedback_result_attach] PRIMARY KEY CLUSTERED ([feedback_result_attach_id] ASC),
    CONSTRAINT [fk_fresa_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fresa_fres] FOREIGN KEY ([feedback_result_id]) REFERENCES [feedback_result] ([feedback_result_id]),
    CONSTRAINT [fk_fresa_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fresa_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresa]
    ON [feedback_result_attach]([feedback_result_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresa_created]
    ON [feedback_result_attach]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresa_modified]
    ON [feedback_result_attach]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fresa_owned]
    ON [feedback_result_attach]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_fresa]
    ON [feedback_result_attach]([feedback_result_id] ASC, [virtual_path] ASC);


GO
GRANT DELETE
    ON OBJECT::[feedback_result_attach] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[feedback_result_attach] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback_result_attach] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[feedback_result_attach] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback_result_attach] TO [gg_search]
    AS [dbo];

