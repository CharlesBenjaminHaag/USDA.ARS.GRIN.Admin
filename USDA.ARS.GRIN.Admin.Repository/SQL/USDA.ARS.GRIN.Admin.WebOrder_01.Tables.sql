USE training

ALTER TABLE web_cooperator
ADD [status_code] [nvarchar](20) NULL

ALTER TABLE web_order_request
ADD [is_locked] [bit] NULL

ALTER TABLE web_order_request
ADD [email_sent] [bit] NULL
