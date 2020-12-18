CREATE TABLE [feedback_result] (
    [feedback_result_id]       INT           IDENTITY (1, 1) NOT NULL,
    [feedback_result_group_id] INT           NOT NULL,
    [inventory_id]             INT           NOT NULL,
    [created_date]             DATETIME2 (7) NOT NULL,
    [created_by]               INT           NOT NULL,
    [modified_date]            DATETIME2 (7) NULL,
    [modified_by]              INT           NULL,
    [owned_date]               DATETIME2 (7) NOT NULL,
    [owned_by]                 INT           NOT NULL,
    CONSTRAINT [PK_feedback_result] PRIMARY KEY CLUSTERED ([feedback_result_id] ASC),
    CONSTRAINT [fk_fres_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fres_fresg] FOREIGN KEY ([feedback_result_group_id]) REFERENCES [feedback_result_group] ([feedback_result_group_id]),
    CONSTRAINT [fk_fres_i] FOREIGN KEY ([inventory_id]) REFERENCES [inventory] ([inventory_id]),
    CONSTRAINT [fk_fres_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fres_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndf_fk_fres_fresg]
    ON [feedback_result]([feedback_result_group_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fres_created]
    ON [feedback_result]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fres_i]
    ON [feedback_result]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fres_modified]
    ON [feedback_result]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fres_owned]
    ON [feedback_result]([owned_by] ASC);


GO
GRANT DELETE
    ON OBJECT::[feedback_result] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[feedback_result] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback_result] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[feedback_result] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[feedback_result] TO [gg_search]
    AS [dbo];

