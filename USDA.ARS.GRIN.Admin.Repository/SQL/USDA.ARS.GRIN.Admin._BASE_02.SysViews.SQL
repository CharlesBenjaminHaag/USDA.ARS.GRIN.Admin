USE [gringlobal]
GO
/****** Object:  View [dbo].[vw_AcctMgmtSysTableFields]    Script Date: 6/14/2021 12:28:46 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_AcctMgmtSysTableFields]
GO
/****** Object:  View [dbo].[vw_AcctMgmtSysApplication]    Script Date: 6/14/2021 12:28:46 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_AcctMgmtSysApplication]
GO
/****** Object:  View [dbo].[vw_AcctMgmtSysApplication]    Script Date: 6/14/2021 12:28:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_AcctMgmtSysApplication]
AS
SELECT
		sys_application_id,
		sg.sys_group_id,
		sg.group_tag,
		code,
		title,
		description,
		url,
		color_code,
		image_file_name
	FROM
		sys_application sa
	JOIN
		sys_group sg
	ON
		sa.sys_group_id = sg.sys_group_id
	
GO
/****** Object:  View [dbo].[vw_AcctMgmtSysTableFields]    Script Date: 6/14/2021 12:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_AcctMgmtSysTableFields]
AS
SELECT table_name, field_name, field_type, field_purpose FROM sys_table st
JOIN
sys_table_field stf
ON
st.sys_table_id = stf.sys_table_id
WHERE table_name LIKE 'taxonomy%'

GO
