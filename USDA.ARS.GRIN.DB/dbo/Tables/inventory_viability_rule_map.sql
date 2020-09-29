CREATE TABLE [dbo].[inventory_viability_rule_map] (
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
    CONSTRAINT [fk_ivrm_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ivrm_ivr] FOREIGN KEY ([inventory_viability_rule_id]) REFERENCES [dbo].[inventory_viability_rule] ([inventory_viability_rule_id]),
    CONSTRAINT [fk_ivrm_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ivrm_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ivrm_ts] FOREIGN KEY ([taxonomy_species_id]) REFERENCES [dbo].[taxonomy_species] ([taxonomy_species_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivrm_created]
    ON [dbo].[inventory_viability_rule_map]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivrm_ivr]
    ON [dbo].[inventory_viability_rule_map]([inventory_viability_rule_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivrm_modified]
    ON [dbo].[inventory_viability_rule_map]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivrm_owned]
    ON [dbo].[inventory_viability_rule_map]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ivrm_ts]
    ON [dbo].[inventory_viability_rule_map]([taxonomy_species_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ivrm]
    ON [dbo].[inventory_viability_rule_map]([taxonomy_species_id] ASC, [inventory_viability_rule_id] ASC);

