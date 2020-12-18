CREATE TABLE [feedback_form_field] (
    [feedback_form_field_id]    INT            IDENTITY (1, 1) NOT NULL,
    [feedback_form_id]          INT            NOT NULL,
    [title]                     NVARCHAR (100) NULL,
    [description]               NVARCHAR (MAX) NULL,
    [field_type_code]           NVARCHAR (20)  NOT NULL,
    [gui_hint]                  NVARCHAR (100) NULL,
    [foreign_key_dataview_name] NVARCHAR (50)  NULL,
    [group_name]                NVARCHAR (100) NULL,
    [sort_order]                INT            NULL,
    [is_readonly]               NVARCHAR (1)   NOT NULL,
    [is_required]               NVARCHAR (1)   NOT NULL,
    [references_tag]            NVARCHAR (50)  NULL,
    [default_value]             NVARCHAR (100) NULL,
    [created_date]              DATETIME2 (7)  NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  NOT NULL,
    [owned_by]                  INT            NOT NULL,
    CONSTRAINT [PK_feedback_form_field] PRIMARY KEY CLUSTERED ([feedback_form_field_id] ASC),
    CONSTRAINT [fk_fff_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fff_ff] FOREIGN KEY ([feedback_form_id]) REFERENCES [feedback_form] ([feedback_form_id]),
    CONSTRAINT [fk_fff_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fff_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fff_created]
    ON [feedback_form_field]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fff_modified]
    ON [feedback_form_field]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fff_owned]
    ON [feedback_form_field]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_fff]
    ON [feedback_form_field]([feedback_form_id] ASC, [title] ASC);


GO
GRANT DELETE
    ON OBJECT::[feedback_form_field] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[feedback_form_field] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback_form_field] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[feedback_form_field] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback_form_field] TO [gg_search]
    AS [dbo];

