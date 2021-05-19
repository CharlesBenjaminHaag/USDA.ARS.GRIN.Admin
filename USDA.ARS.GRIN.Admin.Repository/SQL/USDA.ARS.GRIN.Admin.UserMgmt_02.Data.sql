USE training

UPDATE 
	sys_application 
SET 
	sys_group_id = 
	(SELECT 
		sys_group_id 
	FROM 
		sys_group 
	WHERE 
		group_tag = sys_application.code)

-- VERIFY
SELECT * 
FROM 
	sys_group
WHERE 
	group_tag LIKE 'GGTOOLS%'

SELECT *
FROM
	sys_group_user_map
WHERE
	sys_group_id IN
	(SELECT sys_group_id 
	 FROM 
		sys_group
	 WHERE 
		group_tag 
	 LIKE 'GGTOOLS%')

SELECT *
FROM
	sys_application
WHERE
	code LIKE 'GGTOOLS%'



-- ===================================================================================================================
-- SET DEFAULT ROLES
-- ===================================================================================================================
DELETE FROM 
	sys_group_user_map
WHERE
	sys_group_id IN
	(SELECT sys_group_id FROM sys_group
	 WHERE group_tag LIKE 'GGTOOLS%')

INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_ACCOUNTS'),
	488,
	GETDATE(),
	48,
	GETDATE(),
	48
)

INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_TAXONOMY'),
	488,
	GETDATE(),
	48,
	GETDATE(),
	48
)






INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_SITE'),
	488,
	GETDATE(),
	48,
	GETDATE(),
	48
)

INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_GRINGLOBAL'),
	488,
	GETDATE(),
	48,
	GETDATE(),
	48
)

INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_ORDERS'),
	488,
	GETDATE(),
	48,
	GETDATE(),
	48
)

INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_ORDERS'),
	204,
	GETDATE(),
	48,
	GETDATE(),
	48
)

INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_ORDERS'),
	44,
	GETDATE(),
	48,
	GETDATE(),
	48
)

