USE [training]
GO
/****** Object:  View [dbo].[vw_AcctMgmtSysTableFields]    Script Date: 8/6/2021 7:18:00 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_AcctMgmtSysTableFields]
GO
/****** Object:  View [dbo].[vw_AcctMgmtSysTableFields]    Script Date: 8/6/2021 7:18:00 PM ******/
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
