USE [training]
GO
/****** Object:  View [dbo].[vw_AcctMgmtSysApplication]    Script Date: 8/6/2021 7:18:00 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_AcctMgmtSysApplication]
GO
/****** Object:  View [dbo].[vw_AcctMgmtSysApplication]    Script Date: 8/6/2021 7:18:00 PM ******/
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
