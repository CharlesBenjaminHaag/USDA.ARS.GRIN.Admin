﻿CREATE TABLE [crop_trait_observation_data] (
    [crop_trait_observation_data_id] INT             IDENTITY (1, 1) NOT NULL,
    [crop_trait_observation_id]      INT             NULL,
    [inventory_id]                   INT             NOT NULL,
    [individual]                     INT             NOT NULL,
    [crop_trait_id]                  INT             NULL,
    [crop_trait_code_id]             INT             NULL,
    [numeric_value]                  DECIMAL (18, 5) NULL,
    [string_value]                   NVARCHAR (255)  NULL,
    [method_id]                      INT             NOT NULL,
    [note]                           NVARCHAR (MAX)  NULL,
    [created_date]                   DATETIME2 (7)   NOT NULL,
    [created_by]                     INT             NOT NULL,
    [modified_date]                  DATETIME2 (7)   NULL,
    [modified_by]                    INT             NULL,
    [owned_date]                     DATETIME2 (7)   NOT NULL,
    [owned_by]                       INT             NOT NULL,
    CONSTRAINT [PK_crop_trait_observation_data] PRIMARY KEY CLUSTERED ([crop_trait_observation_data_id] ASC),
    CONSTRAINT [fk_ctod_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ctod_ct] FOREIGN KEY ([crop_trait_id]) REFERENCES [crop_trait] ([crop_trait_id]),
    CONSTRAINT [fk_ctod_ctc] FOREIGN KEY ([crop_trait_code_id]) REFERENCES [crop_trait_code] ([crop_trait_code_id]),
    CONSTRAINT [fk_ctod_cto] FOREIGN KEY ([crop_trait_observation_id]) REFERENCES [crop_trait_observation] ([crop_trait_observation_id]),
    CONSTRAINT [fk_ctod_i] FOREIGN KEY ([inventory_id]) REFERENCES [inventory] ([inventory_id]),
    CONSTRAINT [fk_ctod_m] FOREIGN KEY ([method_id]) REFERENCES [method] ([method_id]),
    CONSTRAINT [fk_ctod_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_ctod_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctod_created]
    ON [crop_trait_observation_data]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctod_ct]
    ON [crop_trait_observation_data]([crop_trait_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctod_ctc]
    ON [crop_trait_observation_data]([crop_trait_code_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctod_cto]
    ON [crop_trait_observation_data]([crop_trait_observation_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctod_i]
    ON [crop_trait_observation_data]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctod_m]
    ON [crop_trait_observation_data]([method_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctod_modified]
    ON [crop_trait_observation_data]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_ctod_owned]
    ON [crop_trait_observation_data]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ctod]
    ON [crop_trait_observation_data]([crop_trait_observation_id] ASC, [inventory_id] ASC, [crop_trait_id] ASC, [crop_trait_code_id] ASC, [numeric_value] ASC, [string_value] ASC, [method_id] ASC, [individual] ASC);


GO
GRANT DELETE
    ON OBJECT::[crop_trait_observation_data] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[crop_trait_observation_data] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[crop_trait_observation_data] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[crop_trait_observation_data] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[crop_trait_observation_data] TO [gg_search]
    AS [dbo];
