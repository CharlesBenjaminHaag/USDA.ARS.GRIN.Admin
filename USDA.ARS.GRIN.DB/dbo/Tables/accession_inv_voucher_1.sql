CREATE TABLE [accession_inv_voucher] (
    [accession_inv_voucher_id] INT            IDENTITY (1, 1) NOT NULL,
    [inventory_id]             INT            NOT NULL,
    [collector_cooperator_id]  INT            NULL,
    [collector_voucher_number] NVARCHAR (40)  NULL,
    [voucher_location]         NVARCHAR (255) NOT NULL,
    [vouchered_date]           DATETIME2 (7)  NULL,
    [vouchered_date_code]      NVARCHAR (20)  NULL,
    [note]                     NVARCHAR (MAX) NULL,
    [created_date]             DATETIME2 (7)  NOT NULL,
    [created_by]               INT            NOT NULL,
    [modified_date]            DATETIME2 (7)  NULL,
    [modified_by]              INT            NULL,
    [owned_date]               DATETIME2 (7)  NOT NULL,
    [owned_by]                 INT            NOT NULL,
    [herbarium_barcode]        NVARCHAR (20)  NULL,
    CONSTRAINT [PK_accession_inv_voucher] PRIMARY KEY CLUSTERED ([accession_inv_voucher_id] ASC),
    CONSTRAINT [fk_aiv_c] FOREIGN KEY ([collector_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aiv_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aiv_i] FOREIGN KEY ([inventory_id]) REFERENCES [inventory] ([inventory_id]),
    CONSTRAINT [fk_aiv_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aiv_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aiv_c]
    ON [accession_inv_voucher]([collector_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aiv_created]
    ON [accession_inv_voucher]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aiv_i]
    ON [accession_inv_voucher]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aiv_modified]
    ON [accession_inv_voucher]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aiv_owned]
    ON [accession_inv_voucher]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_aiv]
    ON [accession_inv_voucher]([inventory_id] ASC, [voucher_location] ASC, [vouchered_date] ASC, [collector_voucher_number] ASC);


GO
GRANT DELETE
    ON OBJECT::[accession_inv_voucher] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[accession_inv_voucher] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_inv_voucher] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[accession_inv_voucher] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[accession_inv_voucher] TO [gg_search]
    AS [dbo];

