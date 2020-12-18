CREATE TABLE [inventory_viability_rule] (
    [inventory_viability_rule_id] INT            IDENTITY (1, 1) NOT NULL,
    [name]                        NVARCHAR (100) NOT NULL,
    [substrata]                   NVARCHAR (100) NULL,
    [seeds_per_replicate]         INT            NULL,
    [number_of_replicates]        INT            NULL,
    [requirements]                NVARCHAR (MAX) NULL,
    [category_code]               NVARCHAR (20)  NULL,
    [temperature_range]           NVARCHAR (100) NULL,
    [count_regime_days]           NVARCHAR (100) NULL,
    [moisture]                    NVARCHAR (100) NULL,
    [prechill]                    NVARCHAR (100) NULL,
    [lighting]                    NVARCHAR (100) NULL,
    [note]                        NVARCHAR (MAX) NULL,
    [created_date]                DATETIME2 (7)  NOT NULL,
    [created_by]                  INT            NOT NULL,
    [modified_date]               DATETIME2 (7)  NULL,
    [modified_by]                 INT            NULL,
    [owned_date]                  DATETIME2 (7)  NOT NULL,
    [owned_by]                    INT            NOT NULL,
    CONSTRAINT [PK_inventory_viability_rule] PRIMARY KEY CLUSTERED ([inventory_viability_rule_id] ASC),
    CONSTRAINT [fk_ivr_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ivr_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ivr_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivr_created]
    ON [inventory_viability_rule]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivr_modified]
    ON [inventory_viability_rule]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivr_owned]
    ON [inventory_viability_rule]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ivr]
    ON [inventory_viability_rule]([name] ASC);


GO
GRANT DELETE
    ON OBJECT::[inventory_viability_rule] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[inventory_viability_rule] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[inventory_viability_rule] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[inventory_viability_rule] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[inventory_viability_rule] TO [gg_search]
    AS [dbo];

