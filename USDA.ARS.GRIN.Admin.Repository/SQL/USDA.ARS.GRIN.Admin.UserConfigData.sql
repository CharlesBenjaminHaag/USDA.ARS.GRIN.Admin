/****** Script for SelectTopNRows command from SSMS  ******/
SELECT * FROM sys_group
WHERE group_tag LIKE 'GGTOOLS%'


SELECT TOP (1000) [sys_group_user_map_id]
      ,[sys_group_id]
      ,[sys_user_id]
      ,[created_date]
      ,[created_by]
      ,[modified_date]
      ,[modified_by]
      ,[owned_date]
      ,[owned_by]
  FROM [gringlobal].[dbo].[sys_group_user_map]

  INSERT INTO sys_group_user_map (sys_group_id,sys_user_id,created_by,created_date,owned_by,owned_date)
  VALUES
 ( (SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_TAXONOMY'), 488, 48, GETDATE(),48, GETDATE())

 INSERT INTO sys_group_user_map (sys_group_id,sys_user_id,created_by,created_date,owned_by,owned_date)
  VALUES
 ( (SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_ACCOUNTS'), 488, 48, GETDATE(),48, GETDATE())

 INSERT INTO sys_group_user_map (sys_group_id,sys_user_id,created_by,created_date,owned_by,owned_date)
  VALUES
 ( (SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_ORDERS'), 488, 48, GETDATE(),48, GETDATE())