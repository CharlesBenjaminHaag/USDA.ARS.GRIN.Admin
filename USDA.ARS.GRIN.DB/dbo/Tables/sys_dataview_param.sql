CREATE TABLE [dbo].[sys_dataview_param] (
    [sys_dataview_param_id] INT           IDENTITY (1, 1) NOT NULL,
    [sys_dataview_id]       INT           NOT NULL,
    [param_name]            NVARCHAR (50) NOT NULL,
    [param_type]            NVARCHAR (50) NULL,
    [sort_order]            INT           NULL,
    [created_date]          DATETIME2 (7) NOT NULL,
    [created_by]            INT           NOT NULL,
    [modified_date]         DATETIME2 (7) NULL,
    [modified_by]           INT           NULL,
    [owned_date]            DATETIME2 (7) NOT NULL,
    [owned_by]              INT           NOT NULL,
    CONSTRAINT [PK_sys_dataview_param] PRIMARY KEY CLUSTERED ([sys_dataview_param_id] ASC),
    CONSTRAINT [fk_srp_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_srp_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_srp_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_srp_sr] FOREIGN KEY ([sys_dataview_id]) REFERENCES [dbo].[sys_dataview] ([sys_dataview_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srp_created]
    ON [dbo].[sys_dataview_param]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srp_modified]
    ON [dbo].[sys_dataview_param]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srp_owned]
    ON [dbo].[sys_dataview_param]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_srp_sr]
    ON [dbo].[sys_dataview_param]([sys_dataview_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_sdp]
    ON [dbo].[sys_dataview_param]([sys_dataview_id] ASC, [param_name] ASC);

