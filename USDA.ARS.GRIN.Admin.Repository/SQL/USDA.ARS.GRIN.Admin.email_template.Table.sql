USE [training]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[email_template]') AND type in (N'U'))
ALTER TABLE [dbo].[email_template] DROP CONSTRAINT IF EXISTS [fk_et_owned]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[email_template]') AND type in (N'U'))
ALTER TABLE [dbo].[email_template] DROP CONSTRAINT IF EXISTS [fk_et_modified]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[email_template]') AND type in (N'U'))
ALTER TABLE [dbo].[email_template] DROP CONSTRAINT IF EXISTS [fk_et_created]
GO
/****** Object:  Table [dbo].[email_template]    Script Date: 8/6/2021 7:11:10 PM ******/
DROP TABLE IF EXISTS [dbo].[email_template]
GO
/****** Object:  Table [dbo].[email_template]    Script Date: 8/6/2021 7:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email_template](
	[email_template_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](120) NULL,
	[category_code] [nvarchar](3) NULL,
	[email_from] [nvarchar](200) NULL,
	[email_to] [nvarchar](1000) NULL,
	[email_cc] [nvarchar](1000) NULL,
	[email_bcc] [nvarchar](1000) NULL,
	[email_reply_to] [nvarchar](200) NULL,
	[subject] [nvarchar](500) NULL,
	[body] [nvarchar](max) NULL,
	[is_html] [nvarchar](1) NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
 CONSTRAINT [PK_email_template] PRIMARY KEY CLUSTERED 
(
	[email_template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[email_template] ON 

INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (3, N'Requestor Rejection Letter', N'RRJ', N'gringlobal.orders@usda.gov', NULL, NULL, NULL, NULL, N'Regarding Your Germplasm Request (Order #[ID_HERE])', N'<p>Germplasm Requestor:</p>

<p>The U.S. National Plant Germplasm System (NPGS) provides plant material in small quantities to research and educational entities for projects where genetic diversity is required. Accessions maintained by the NPGS are not intended or available for home, personal, or community gardening.</p>

<p>Your request does not meet the criteria to receive germplasm from the NPGS and has been cancelled.</p>

<p>For more information about the NPGS, please view a 6-minute video that describes our mission and purpose at <a href="https://www.youtube.com/watch?v=uHOclGNELuw">https://www.youtube.com/watch?v=uHOclGNELuw</a>.</p>

<p>If you believe this decision is an error, please provide additional relevant information about your project to justify the need for specific NPGS germplasm, instead of using commercially available plant material. Send your email to <strong>gringlobal.orders@usda.gov</strong>, and include the web order number<strong> [ID_HERE]</strong>.</p>

<p>Thank you.<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
', N'0', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, CAST(N'2021-08-06T12:29:25.5833333' AS DateTime2), 48, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (4, N'Curator Approval Notification', N'CAP', N'gringlobal.orders@usda.gov', NULL, NULL, NULL, NULL, N'NRR Review Notification: Order [ID_HERE] Approved', N'<p>Web Order Request [ID_HERE] has been reviewed and <strong>approved</strong> by the NRR Review Committee.</p>

<p>It is now visible in the Order Wizard as a Submitted&nbsp;web order request, and may be viewed in the OW and in the Curator Tool as well.</p>
', N'0', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, CAST(N'2021-08-02T16:46:51.6633333' AS DateTime2), 48, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (5, N'Curator Cancellation Notiification', N'CCL', N'gringlobal.orders@usda.gov', NULL, NULL, NULL, NULL, N'NRR Review Notification: Order [ID_HERE] Cancelled', N'<p>&nbsp;Web Order Request [ID_HERE] has been reviewed and <strong>cancelled</strong> by the NRR Review Committee.</p>

<p>&nbsp;The requestor has been notified via email. &nbsp;</p>

<p>&nbsp;No further action is needed from your site (or any sites included by the request). &nbsp;If you would like to review the WOR, for future reference, it is now visible in the Order Wizard as a Cancelled web order request and may be viewed in the OW and in the Curator Tool as well.</p>
', N'0', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, CAST(N'2021-08-02T16:47:04.7500000' AS DateTime2), 48, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (6, N'Request For Information', N'RQI', N'gringlobal.orders@usda.gov', NULL, NULL, NULL, NULL, N'Request For Additional Information: Order [ID_HERE]', N'<p>Dear Germplasm&nbsp;Requestor:</p>

<p>The U.S.National Plant Germplasm System(NPGS) provides plant material in small quantities to research and educational entities&nbsp;for&nbsp;projects where genetic diversity is required. Accessions maintained by the NPGS are not intended or available&nbsp;for&nbsp;home, personal, or community gardening.</p>

<p>Please provide additional relevant information about your project to justify the need&nbsp;for&nbsp;specific NPGS germplasm, instead of using commercially available plant material.</p>

<p>Send your email to <a href="mailto:gringlobal.orders@usda.gov">gringlobal.orders@usda.gov</a>, and include the web order number <strong> [ID_HERE]</strong>.</p>

<p>For&nbsp;more information about the NPGS, please view a 6 - minute video that describes our mission and purpose at&nbsp;<a href="https://gcc02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DuHOclGNELuw&amp;data=04%7C01%7C%7Ce9adf597c0134eb8debe08d952b88539%7Ced5b36e701ee4ebc867ee03cfa0d4697%7C0%7C0%7C637631774727050819%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=2Y5FCXfBkmrBHxn7Yt3palxIGl7%2BhCpLLxURHNUvygg%3D&amp;reserved=0" target="_blank">https://www.youtube.com/watch?v=uHOclGNELuw</a><br />
<br />
Thank you.</p>
', N'0', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, CAST(N'2021-08-06T16:42:44.6866667' AS DateTime2), 48, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (8, N'NRR Flag Notification', N'NRR', N'gringlobal.orders@usda.gov', NULL, NULL, NULL, NULL, N'NRR (Potential) -- GRIN-Global Web Order #[ID_HERE]', N'<p>Please Note:</p>

<p>Web Order <strong>[ID_HERE]</strong> has been flagged for review because it meets one or more Non-Research Request (NRR) criteria. &nbsp;This email is simply for your information. You should not proceed to address the request at this time.</p>

<p>The request has been forwarded to, and will be reviewed by, the NRR Review Committee. <strong>Please note that this web order will not appear in the Order Wizard until their review is completed.</strong></p>

<p>Eventually you will receive one more notification, indicating the committee&rsquo;s decision. If the committee&hellip;</p>

<ul>
	<li>denies the request, then no further action is required by you. The web order status will be &ldquo;CANCELLED.&rdquo;</li>
	<li>approves the request, then proceed as usual to process your site&rsquo;s portion of the request. (e.g., use the Order Wizard) &nbsp;</li>
</ul>

<p>In some cases (such as when the request was not an obvious NRR), the committee has requested more details from the requestor.&nbsp; The request will remain &ldquo;NRR_FLAGGED.&rdquo;&nbsp; Any delay in the committee&rsquo;s final &ldquo;accepted&rdquo; or &ldquo;denied&rdquo; designation is dependent on the requestor&rsquo;s responsiveness.</p>

<p>If you have questions, or can provide information regarding this web order, please contact the NRR Review Committee:</p>

<ul>
	<li><a href="mailto:@gary.kinard@usda.gov">Gary Kinard</a></li>
	<li><a href="mailto:@harold.bockleman@usda.gov">Harold Bockleman</a></li>
	<li><a href="mailto:@marty.reisinger@usda.gov">Martin Reisinger</a></li>
</ul>
', N'0', CAST(N'2021-08-01T18:03:49.2333333' AS DateTime2), 48, CAST(N'2021-08-02T17:33:58.3966667' AS DateTime2), 48, CAST(N'2021-08-01T18:03:49.2333333' AS DateTime2), 48)
SET IDENTITY_INSERT [dbo].[email_template] OFF
ALTER TABLE [dbo].[email_template]  WITH CHECK ADD  CONSTRAINT [fk_et_created] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
ALTER TABLE [dbo].[email_template] CHECK CONSTRAINT [fk_et_created]
GO
ALTER TABLE [dbo].[email_template]  WITH CHECK ADD  CONSTRAINT [fk_et_modified] FOREIGN KEY([modified_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
ALTER TABLE [dbo].[email_template] CHECK CONSTRAINT [fk_et_modified]
GO
ALTER TABLE [dbo].[email_template]  WITH CHECK ADD  CONSTRAINT [fk_et_owned] FOREIGN KEY([owned_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
ALTER TABLE [dbo].[email_template] CHECK CONSTRAINT [fk_et_owned]
GO
