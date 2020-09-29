CREATE TABLE [dbo].[feedback_result] (
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
    CONSTRAINT [fk_fres_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fres_fresg] FOREIGN KEY ([feedback_result_group_id]) REFERENCES [dbo].[feedback_result_group] ([feedback_result_group_id]),
    CONSTRAINT [fk_fres_i] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_fres_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_fres_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndf_fk_fres_fresg]
    ON [dbo].[feedback_result]([feedback_result_group_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fres_created]
    ON [dbo].[feedback_result]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fres_i]
    ON [dbo].[feedback_result]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fres_modified]
    ON [dbo].[feedback_result]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_fres_owned]
    ON [dbo].[feedback_result]([owned_by] ASC);

