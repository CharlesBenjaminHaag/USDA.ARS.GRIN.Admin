CREATE TABLE [dbo].[order_request_item_action] (
    [order_request_item_action_id] INT             IDENTITY (1, 1) NOT NULL,
    [order_request_item_id]        INT             NOT NULL,
    [action_name_code]             NVARCHAR (20)   NOT NULL,
    [started_date]                 DATETIME2 (7)   NOT NULL,
    [started_date_code]            NVARCHAR (20)   NULL,
    [completed_date]               DATETIME2 (7)   NULL,
    [completed_date_code]          NVARCHAR (20)   NULL,
    [action_information]           NVARCHAR (MAX)  NULL,
    [action_cost]                  DECIMAL (18, 5) NULL,
    [cooperator_id]                INT             NULL,
    [note]                         NVARCHAR (MAX)  NULL,
    [created_date]                 DATETIME2 (7)   NOT NULL,
    [created_by]                   INT             NOT NULL,
    [modified_date]                DATETIME2 (7)   NULL,
    [modified_by]                  INT             NULL,
    [owned_date]                   DATETIME2 (7)   NOT NULL,
    [owned_by]                     INT             NOT NULL,
    CONSTRAINT [PK_order_request_item_action] PRIMARY KEY CLUSTERED ([order_request_item_action_id] ASC),
    CONSTRAINT [fk_oria_c] FOREIGN KEY ([cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_oria_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_oria_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_oria_ori] FOREIGN KEY ([order_request_item_id]) REFERENCES [dbo].[order_request_item] ([order_request_item_id]),
    CONSTRAINT [fk_oria_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_oria_c]
    ON [dbo].[order_request_item_action]([cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_oria_created]
    ON [dbo].[order_request_item_action]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_oria_modified]
    ON [dbo].[order_request_item_action]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_oria_ori]
    ON [dbo].[order_request_item_action]([order_request_item_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_oria_owned]
    ON [dbo].[order_request_item_action]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_oria]
    ON [dbo].[order_request_item_action]([order_request_item_id] ASC, [action_name_code] ASC, [started_date] ASC);

