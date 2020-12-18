CREATE TABLE [order_request] (
    [order_request_id]              INT            IDENTITY (1, 1) NOT NULL,
    [original_order_request_id]     INT            NULL,
    [web_order_request_id]          INT            NULL,
    [local_number]                  NVARCHAR (50)  NULL,
    [order_type_code]               NVARCHAR (20)  NULL,
    [ordered_date]                  DATETIME2 (7)  NULL,
    [intended_use_code]             NVARCHAR (20)  NULL,
    [intended_use_note]             NVARCHAR (MAX) NULL,
    [completed_date]                DATETIME2 (7)  NULL,
    [requestor_cooperator_id]       INT            NULL,
    [ship_to_cooperator_id]         INT            NULL,
    [final_recipient_cooperator_id] INT            NOT NULL,
    [order_obtained_via]            NVARCHAR (20)  NULL,
    [feedback_id]                   INT            NULL,
    [special_instruction]           NVARCHAR (MAX) NULL,
    [note]                          NVARCHAR (MAX) NULL,
    [created_date]                  DATETIME2 (7)  NOT NULL,
    [created_by]                    INT            NOT NULL,
    [modified_date]                 DATETIME2 (7)  NULL,
    [modified_by]                   INT            NULL,
    [owned_date]                    DATETIME2 (7)  NOT NULL,
    [owned_by]                      INT            NOT NULL,
    CONSTRAINT [PK_order_request] PRIMARY KEY CLUSTERED ([order_request_id] ASC),
    CONSTRAINT [fk_or_created] FOREIGN KEY ([created_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_or_final_c] FOREIGN KEY ([final_recipient_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_or_modified] FOREIGN KEY ([modified_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_or_original_or] FOREIGN KEY ([original_order_request_id]) REFERENCES [order_request] ([order_request_id]),
    CONSTRAINT [fk_or_owned] FOREIGN KEY ([owned_by]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_or_requestor_c] FOREIGN KEY ([requestor_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_or_ship_to_c] FOREIGN KEY ([ship_to_cooperator_id]) REFERENCES [cooperator] ([cooperator_id]),
    CONSTRAINT [fk_or_wor] FOREIGN KEY ([web_order_request_id]) REFERENCES [web_order_request] ([web_order_request_id]),
    CONSTRAINT [fk_oreq_f] FOREIGN KEY ([feedback_id]) REFERENCES [feedback] ([feedback_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_or_created]
    ON [order_request]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_or_final_c]
    ON [order_request]([final_recipient_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_or_modified]
    ON [order_request]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_or_original_or]
    ON [order_request]([original_order_request_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_or_owned]
    ON [order_request]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_or_requestor_c]
    ON [order_request]([requestor_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_or_ship_to_c]
    ON [order_request]([ship_to_cooperator_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_oreq_f]
    ON [order_request]([feedback_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_or_obtained]
    ON [order_request]([order_obtained_via] ASC);


GO
GRANT DELETE
    ON OBJECT::[order_request] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[order_request] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[order_request] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[order_request] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[order_request] TO [gg_search]
    AS [dbo];

