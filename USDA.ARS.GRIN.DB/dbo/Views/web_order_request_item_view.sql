
CREATE view [dbo].[web_order_request_item_view] as
	select
	web_order_request_item_id,
wor.web_cooperator_id,
wor.web_order_request_id,
wori.status_code,
cast (wor.ordered_date as datetime2) as ordered_date,
a.accession_id,
	accession_prefix as prefix,
	accession_number as number,
	accession_suffix as suffix,
	site_short_name as site,

wori.name,
a.name as taxon,
quantity_shipped,
sequence_number,
unit_of_shipped_code,
distribution_form_code,
curator_note,
user_note,
wori.created_date,
wori.created_by,
wori.modified_date,
wori.modified_by,
wori.owned_date,
wori.owned_by
	from web_order_request_item wori
	join accession_view a on a.accession_id=wori.accession_id
	join web_order_request wor on wor.web_order_request_id=wori.web_order_request_id


