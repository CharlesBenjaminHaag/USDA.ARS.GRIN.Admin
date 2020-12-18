CREATE TABLE [inventory_viability_rule_map] (
    [inventory_viability_rule_map_id] INT            IDENTITY (1, 1) NOT NULL,
    [inventory_viability_rule_id]     INT            NOT NULL,
    [taxonomy_species_id]             INT            NOT NULL,
    [note]                            NVARCHAR (MAX) NULL,
    [created_date]                    DATETIME2 (7)  NOT NULL,
    [created_by]                      INT            NOT NULL,
    [modified_date]                   DATETIME2 (7)  NULL,
    [modified_by]                     INT            NULL,
    [owned_date]                      DATETIME2 (7)  NOT NULL,
    [owned_by]                        INT            NOT NULL,
    CONSTRAINT [PK_inventory_viability_rule_map] PRIMARY KEY CLUSTERED ([inventory_viability_rule_map_id] ASC),
    CONSTRAINT [fk_ivrm_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ivrm_ivr] FOREIGN KEY ([inventory_viability_rule_id]) REFERENCES [inventory_viability_rule] ([inventory_viability_rule_id]),
    CONSTRAINT [fk_ivrm_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ivrm_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ivrm_ts] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivrm_created]
    ON [inventory_viability_rule_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivrm_ivr]
    ON [inventory_viability_rule_map]([inventory_viability_rule_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivrm_modified]
    ON [inventory_viability_rule_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivrm_owned]
    ON [inventory_viability_rule_map]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivrm_ts]
    ON [inventory_viability_rule_map]([taxonomy_species_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ivrm]
    ON [inventory_viability_rule_map]([taxonomy_species_id] ASC, [inventory_viability_rule_id] ASC);


GO
GRANT DELETE
    ON OBJECT::[inventory_viability_rule_map] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[inventory_viability_rule_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[inventory_viability_rule_map] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[inventory_viability_rule_map] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[inventory_viability_rule_map] TO [gg_search]
    AS [dbo];

