CREATE TABLE [inventory_viability] (
    [inventory_viability_id]      INT            IDENTITY (1, 1) NOT NULL,
    [inventory_id]                INT            NOT NULL,
    [inventory_viability_rule_id] INT            NULL,
    [tested_date]                 DATETIME2 (7)  NOT NULL,
    [tested_date_code]            NVARCHAR (20)  NULL,
    [percent_normal]              INT            NULL,
    [percent_abnormal]            INT            NULL,
    [percent_dormant]             INT            NULL,
    [percent_viable]              INT            NULL,
    [percent_hard]                INT            NULL,
    [percent_empty]               INT            NULL,
    [percent_infested]            INT            NULL,
    [percent_dead]                INT            NULL,
    [percent_unknown]             INT            NULL,
    [vigor_rating_code]           NVARCHAR (20)  NULL,
    [total_tested_count]          INT            NULL,
    [replication_count]           INT            NULL,
    [note]                        NVARCHAR (MAX) NULL,
    [created_date]                DATETIME2 (7)  NOT NULL,
    [created_by]                  INT            NOT NULL,
    [modified_date]               DATETIME2 (7)  NULL,
    [modified_by]                 INT            NULL,
    [owned_date]                  DATETIME2 (7)  NOT NULL,
    [owned_by]                    INT            NOT NULL,
    CONSTRAINT [PK_inventory_viability] PRIMARY KEY CLUSTERED ([inventory_viability_id] ASC),
    CONSTRAINT [fk_iv_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_iv_i] FOREIGN KEY ([inventory_id]) REFERENCES [inventory] ([inventory_id]),
    CONSTRAINT [fk_iv_ivr] FOREIGN KEY ([inventory_viability_rule_id]) REFERENCES [inventory_viability_rule] ([inventory_viability_rule_id]),
    CONSTRAINT [fk_iv_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_iv_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_iv_created]
    ON [inventory_viability]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_iv_i]
    ON [inventory_viability]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_iv_ivr]
    ON [inventory_viability]([inventory_viability_rule_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_iv_modified]
    ON [inventory_viability]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_iv_owned]
    ON [inventory_viability]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_iv]
    ON [inventory_viability]([inventory_id] ASC, [inventory_viability_rule_id] ASC, [tested_date] ASC, [tested_date_code] ASC);


GO
GRANT DELETE
    ON OBJECT::[inventory_viability] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[inventory_viability] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[inventory_viability] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[inventory_viability] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[inventory_viability] TO [gg_search]
    AS [dbo];

