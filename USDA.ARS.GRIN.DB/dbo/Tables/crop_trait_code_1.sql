﻿CREATE TABLE [crop_trait_code] (
    [crop_trait_code_id] INT           IDENTITY (1, 1) NOT NULL,
    [crop_trait_id]      INT           NOT NULL,
    [code]               NVARCHAR (30) NOT NULL,
    [created_date]       DATETIME2 (7) NOT NULL,
    [created_by]         INT           NOT NULL,
    [modified_date]      DATETIME2 (7) NULL,
    [modified_by]        INT           NULL,
    [owned_date]         DATETIME2 (7) NOT NULL,
    [owned_by]           INT           NOT NULL,
    CONSTRAINT [PK_crop_trait_code] PRIMARY KEY CLUSTERED ([crop_trait_code_id] ASC),
    CONSTRAINT [fk_tct_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tct_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tct_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_tct_tr] FOREIGN KEY ([crop_trait_id]) REFERENCES [crop_trait] ([crop_trait_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tct_created]
    ON [crop_trait_code]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tct_modified]
    ON [crop_trait_code]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tct_owned]
    ON [crop_trait_code]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_tct_tr]
    ON [crop_trait_code]([crop_trait_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_ctc]
    ON [crop_trait_code]([crop_trait_id] ASC, [code] ASC);


GO
GRANT DELETE
    ON OBJECT::[crop_trait_code] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[crop_trait_code] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[crop_trait_code] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[crop_trait_code] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[crop_trait_code] TO [gg_search]
    AS [dbo];
