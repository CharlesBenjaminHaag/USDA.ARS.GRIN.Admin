CREATE TABLE [dbo].[accession_inv_attach] (
    [accession_inv_attach_id] INT            IDENTITY (1, 1) NOT NULL,
    [inventory_id]            INT            NOT NULL,
    [virtual_path]            NVARCHAR (255) NOT NULL,
    [thumbnail_virtual_path]  NVARCHAR (255) NULL,
    [sort_order]              INT            NULL,
    [title]                   NVARCHAR (500) NULL,
    [description]             NVARCHAR (500) NULL,
    [description_code]        NVARCHAR (20)  NULL,
    [content_type]            NVARCHAR (100) NULL,
    [category_code]           NVARCHAR (20)  CONSTRAINT [DF__accession__categ__060DEAE8] DEFAULT ('IMAGE') NOT NULL,
    [copyright_information]   NVARCHAR (100) NULL,
    [attach_cooperator_id]    INT            NULL,
    [is_web_visible]          NVARCHAR (1)   CONSTRAINT [DF__accession__is_we__07020F21] DEFAULT ('Y') NOT NULL,
    [attach_date]             DATETIME2 (7)  NULL,
    [attach_date_code]        NVARCHAR (20)  NULL,
    [note]                    NVARCHAR (MAX) NULL,
    [created_date]            DATETIME2 (7)  NOT NULL,
    [created_by]              INT            NOT NULL,
    [modified_date]           DATETIME2 (7)  NULL,
    [modified_by]             INT            NULL,
    [owned_date]              DATETIME2 (7)  NOT NULL,
    [owned_by]                INT            NOT NULL,
    CONSTRAINT [PK_accession_inv_attach] PRIMARY KEY CLUSTERED ([accession_inv_attach_id] ASC),
    CONSTRAINT [fk_aiat_c] FOREIGN KEY ([attach_cooperator_id]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aiat_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aiat_iid] FOREIGN KEY ([inventory_id]) REFERENCES [dbo].[inventory] ([inventory_id]),
    CONSTRAINT [fk_aiat_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_aiat_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aiat_c]
    ON [dbo].[accession_inv_attach]([attach_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aiat_created]
    ON [dbo].[accession_inv_attach]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aiat_iid]
    ON [dbo].[accession_inv_attach]([inventory_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aiat_modified]
    ON [dbo].[accession_inv_attach]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_aiat_owned]
    ON [dbo].[accession_inv_attach]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_aiat]
    ON [dbo].[accession_inv_attach]([inventory_id] ASC, [virtual_path] ASC);

