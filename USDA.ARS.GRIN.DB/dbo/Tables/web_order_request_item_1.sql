CREATE TABLE [web_order_request_item] (
    [web_order_request_item_id] INT            IDENTITY (1, 1) NOT NULL,
    [web_cooperator_id]         INT            NOT NULL,
    [web_order_request_id]      INT            NOT NULL,
    [sequence_number]           INT            NOT NULL,
    [accession_id]              INT            NOT NULL,
    [name]                      NVARCHAR (200) NULL,
    [quantity_shipped]          INT            NULL,
    [unit_of_shipped_code]      NVARCHAR (20)  NULL,
    [distribution_form_code]    NVARCHAR (20)  NULL,
    [status_code]               NVARCHAR (20)  NULL,
    [curator_note]              NVARCHAR (MAX) NULL,
    [user_note]                 NVARCHAR (MAX) NULL,
    [created_date]              DATETIME2 (7)  NOT NULL,
    [created_by]                INT            NOT NULL,
    [modified_date]             DATETIME2 (7)  NULL,
    [modified_by]               INT            NULL,
    [owned_date]                DATETIME2 (7)  NOT NULL,
    [owned_by]                  INT            NOT NULL,
    CONSTRAINT [PK_web_order_request_item] PRIMARY KEY CLUSTERED ([web_order_request_item_id] ASC),
    CONSTRAINT [fk_wori_a] FOREIGN KEY ([accession_id]) REFERENCES [accession] ([accession_id]),
    CONSTRAINT [fk_wori_created] FOREIGN KEY ([created_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_wori_modified] FOREIGN KEY ([modified_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_wori_owned] FOREIGN KEY ([owned_by]) REFERENCES [web_user] ([web_user_id]),
    CONSTRAINT [fk_wori_wc] FOREIGN KEY ([web_cooperator_id]) REFERENCES [web_cooperator] ([web_cooperator_id]),
    CONSTRAINT [fk_wori_wor] FOREIGN KEY ([web_order_request_id]) REFERENCES [web_order_request] ([web_order_request_id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_wori]
    ON [web_order_request_item]([web_order_request_id] ASC, [web_cooperator_id] ASC, [sequence_number] ASC);


GO


CREATE TRIGGER [tr_scan_web_order_items] ON [web_order_request_item]
AFTER INSERT
AS
 BEGIN
	DECLARE @debug_items NVARCHAR(50)
	DECLARE @debug_sites NVARCHAR(50)

	SET @debug_items = CONVERT(NVARCHAR(50),(SELECT COUNT(*) FROM web_order_request_item wori WHERE web_order_request_id IN 
	(SELECT web_order_request_id FROM inserted))) + ' ITEMS'

	-- STEP 1: HOW MANY SITES?
	SET @debug_sites = CONVERT(NVARCHAR(50),(SELECT COUNT(DISTINCT c.site_id)
	FROM 
		web_order_request_item wori
	JOIN
		accession a
	ON
		wori.accession_id = a.accession_id
	JOIN
		cooperator c
	ON 
		a.owned_by = c.cooperator_id
	WHERE web_order_request_id IN 
	(SELECT web_order_request_id FROM inserted))) + ' SITES'
	
	UPDATE 
		web_order_request 
	SET 
		note = @debug_items + ', ' + @debug_sites,
		status_code = 'REVIEW',
		modified_by = 48,
		modified_date = GETDATE()
	WHERE 
		web_order_request_id IN 
			(SELECT web_order_request_id FROM inserted)
 END

GO
GRANT DELETE
    ON OBJECT::[web_order_request_item] TO [gg_user]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[web_order_request_item] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_order_request_item] TO [gg_user]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[web_order_request_item] TO [gg_user]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[web_order_request_item] TO [gg_search]
    AS [dbo];

