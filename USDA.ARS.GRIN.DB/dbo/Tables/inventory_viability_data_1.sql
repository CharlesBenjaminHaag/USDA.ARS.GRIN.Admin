CREATE TABLE [inventory_viability_data] (
    [inventory_viability_data_id] INT            IDENTITY (1, 1) NOT NULL,
    [inventory_viability_id]      INT            NOT NULL,
    [order_request_item_id]       INT            NULL,
    [counter_cooperator_id]       INT            NULL,
    [replication_number]          INT            NOT NULL,
    [count_number]                INT            NOT NULL,
    [count_date]                  DATETIME2 (7)  NOT NULL,
    [normal_count]                INT            NOT NULL,
    [abnormal_count]              INT            NULL,
    [dormant_count]               INT            NULL,
    [hard_count]                  INT            NULL,
    [empty_count]                 INT            NULL,
    [infested_count]              INT            NULL,
    [dead_count]                  INT            NULL,
    [unknown_count]               INT            NULL,
    [estimated_dormant_count]     INT            NULL,
    [treated_dormant_count]       INT            NULL,
    [confirmed_dormant_count]     INT            NULL,
    [replication_count]           INT            NULL,
    [note]                        NVARCHAR (MAX) NULL,
    [created_date]                DATETIME2 (7)  NOT NULL,
    [created_by]                  INT            NOT NULL,
    [modified_date]               DATETIME2 (7)  NULL,
    [modified_by]                 INT            NULL,
    [owned_date]                  DATETIME2 (7)  NOT NULL,
    [owned_by]                    INT            NOT NULL,
    CONSTRAINT [PK_inventory_viability_data] PRIMARY KEY CLUSTERED ([inventory_viability_data_id] ASC),
    CONSTRAINT [fk_ivd_c] FOREIGN KEY ([counter_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ivd_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ivd_iv] FOREIGN KEY ([inventory_viability_id]) REFERENCES [inventory_viability] ([inventory_viability_id]),
    CONSTRAINT [fk_ivd_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ivd_ori] FOREIGN KEY ([order_request_item_id]) REFERENCES [order_request_item] ([order_request_item_id]),
    CONSTRAINT [fk_ivd_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivd_c]
    ON [inventory_viability_data]([counter_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivd_created]
    ON [inventory_viability_data]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivd_iv]
    ON [inventory_viability_data]([inventory_viability_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivd_modified]
    ON [inventory_viability_data]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivd_ori]
    ON [inventory_viability_data]([order_request_item_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivd_owned]
    ON [inventory_viability_data]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ivd]
    ON [inventory_viability_data]([inventory_viability_id] ASC, [replication_number] ASC, [count_number] ASC);


GO
GRANT DELETE
    ON OBJECT::[inventory_viability_data] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[inventory_viability_data] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[inventory_viability_data] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[inventory_viability_data] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[inventory_viability_data] TO [gg_search]
    AS [dbo];

