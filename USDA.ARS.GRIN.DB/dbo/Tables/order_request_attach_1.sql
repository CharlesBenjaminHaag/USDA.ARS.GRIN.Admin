CREATE TABLE [order_request_attach] (
    [order_request_attach_id] INT            IDENTITY (1, 1) NOT NULL,
    [order_request_id]        INT            NOT NULL,
    [virtual_path]            NVARCHAR (255) NOT NULL,
    [thumbnail_virtual_path]  NVARCHAR (255) NULL,
    [sort_order]              INT            NULL,
    [title]                   NVARCHAR (500) NULL,
    [description]             NVARCHAR (500) NULL,
    [content_type]            NVARCHAR (100) NULL,
    [category_code]           NVARCHAR (20)  NULL,
    [is_web_visible]          NVARCHAR (1)   DEFAULT ('Y') NOT NULL,
    [copyright_information]   NVARCHAR (100) NULL,
    [attach_cooperator_id]    INT            NULL,
    [attach_date]             DATETIME2 (7)  NULL,
    [attach_date_code]        NVARCHAR (20)  NULL,
    [note]                    NVARCHAR (MAX) NULL,
    [created_date]            DATETIME2 (7)  NOT NULL,
    [created_by]              INT            NOT NULL,
    [modified_date]           DATETIME2 (7)  NULL,
    [modified_by]             INT            NULL,
    [owned_date]              DATETIME2 (7)  NOT NULL,
    [owned_by]                INT            NOT NULL,
    CONSTRAINT [PK_order_request_attach] PRIMARY KEY CLUSTERED ([order_request_attach_id] ASC),
    CONSTRAINT [fk_orat_c] FOREIGN KEY ([attach_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_orat_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_orat_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_orat_or] FOREIGN KEY ([order_request_id]) REFERENCES [order_request] ([order_request_id]),
    CONSTRAINT [fk_orat_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_oat_or]
    ON [order_request_attach]([order_request_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_orat_c]
    ON [order_request_attach]([attach_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_orat_created]
    ON [order_request_attach]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_orat_modified]
    ON [order_request_attach]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_orat_owned]
    ON [order_request_attach]([owned_by] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_orat]
    ON [order_request_attach]([order_request_id] ASC, [virtual_path] ASC);


GO
GRANT DELETE
    ON OBJECT::[order_request_attach] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[order_request_attach] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[order_request_attach] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[order_request_attach] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[order_request_attach] TO [gg_search]
    AS [dbo];

