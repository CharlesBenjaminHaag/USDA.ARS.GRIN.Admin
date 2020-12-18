CREATE TABLE [order_request_item] (
    [order_request_item_id]      INT             IDENTITY (1, 1) NOT NULL,
    [order_request_id]           INT             NOT NULL,
    [web_order_request_item_id]  INT             NULL,
    [sequence_number]            INT             NULL,
    [name]                       NVARCHAR (200)  NULL,
    [quantity_shipped]           DECIMAL (18, 5) NULL,
    [quantity_shipped_unit_code] NVARCHAR (20)   NULL,
    [distribution_form_code]     NVARCHAR (20)   NULL,
    [status_code]                NVARCHAR (20)   NOT NULL,
    [status_date]                DATETIME2 (7)   NULL,
    [inventory_id]               INT             NOT NULL,
    [external_taxonomy]          NVARCHAR (100)  NULL,
    [source_cooperator_id]       INT             NULL,
    [note]                       NVARCHAR (MAX)  NULL,
    [web_user_note]              NVARCHAR (MAX)  NULL,
    [created_date]               DATETIME2 (7)   NOT NULL,
    [created_by]                 INT             NOT NULL,
    [modified_date]              DATETIME2 (7)   NULL,
    [modified_by]                INT             NULL,
    [owned_date]                 DATETIME2 (7)   NOT NULL,
    [owned_by]                   INT             NOT NULL,
    CONSTRAINT [PK_order_request_item] PRIMARY KEY CLUSTERED ([order_request_item_id] ASC),
    CONSTRAINT [fk_ori_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ori_i] FOREIGN KEY ([inventory_id]) REFERENCES [inventory] ([inventory_id]),
    CONSTRAINT [fk_ori_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ori_or] FOREIGN KEY ([order_request_id]) REFERENCES [order_request] ([order_request_id]),
    CONSTRAINT [fk_ori_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ori_sc] FOREIGN KEY ([source_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ori_wori] FOREIGN KEY ([web_order_request_item_id]) REFERENCES [web_order_request_item] ([web_order_request_item_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ori_created]
    ON [order_request_item]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ori_i]
    ON [order_request_item]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ori_modified]
    ON [order_request_item]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ori_or]
    ON [order_request_item]([order_request_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ori_owned]
    ON [order_request_item]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ori_sc]
    ON [order_request_item]([source_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_ori_item]
    ON [order_request_item]([order_request_id] ASC, [name] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ori_wori]
    ON [order_request_item]([web_order_request_item_id] ASC);


GO
CREATE STATISTICS [_dta_stat_434100587_1_2]
    ON [order_request_item]([order_request_item_id], [order_request_id]);


GO
CREATE STATISTICS [_dta_stat_434100587_1_11_2]
    ON [order_request_item]([order_request_item_id], [inventory_id], [order_request_id]);


GO
GRANT DELETE
    ON OBJECT::[order_request_item] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[order_request_item] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[order_request_item] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[order_request_item] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[order_request_item] TO [gg_search]
    AS [dbo];

