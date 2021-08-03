USE [training]
GO
DELETE FROM [dbo].[email_template]
GO
SET IDENTITY_INSERT [dbo].[email_template] ON 
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (3, N'Requestor Rejection Letter', N'RRJ', N'gringlobal-.orders@usda.gov', NULL, NULL, NULL, NULL, N'Regarding Your Germplasm Request (Order #[ID_HERE])', N'<p>Germplasm Requestor:</p>

<p>The U.S. National Plant Germplasm System (NPGS) provides plant material in small quantities to research and educational entities for projects where genetic diversity is required. Accessions maintained by the NPGS are not intended or available for home, personal, or community gardening.</p>

<p>Your request does not meet the criteria to receive germplasm from the NPGS and has been cancelled.</p>

<p>For more information about the NPGS, please view a 6-minute video that describes our mission and purpose at <a href="https://www.youtube.com/watch?v=uHOclGNELuw">https://www.youtube.com/watch?v=uHOclGNELuw</a>.</p>

<p>If you believe this decision is an error, please provide additional relevant information about your project to justify the need for specific NPGS germplasm, instead of using commercially available plant material. Send your email to <strong>gringlobal.orders@usda.gov</strong>, and include the web order number [ID_HERE].</p>

<p>Thank you.<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
', N'0', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, CAST(N'2021-07-29T12:11:46.9533333' AS DateTime2), 48, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (4, N'Curator Approval Notification', N'CAP', N'gringlobal-.orders@usda.gov', NULL, NULL, NULL, NULL, N'NRR Review Notification: Order [ID_HERE] Approved', N'<p>Order [ID_HERE]&nbsp;has been approved. You may now process it normally via the Order Wizard.</p>
', N'0', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, CAST(N'2021-07-29T08:54:48.4733333' AS DateTime2), 48, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (5, N'Curator Cancellation Notiification', N'CCL', N'gringlobal-.orders@usda.gov', NULL, NULL, NULL, NULL, N'NRR Review Notification: Order [ID_HERE] Cancelled', N'<p>Order [ID_HERE] has been determined to be a Non-Research Request (NRR), and has been cancelled. You may reference this order within the Order Wizard.</p>
', N'0', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, CAST(N'2021-07-29T08:55:32.6366667' AS DateTime2), 48, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (6, N'Request For Information', N'RQI', N'gringlobal-.orders@usda.gov', NULL, NULL, NULL, NULL, N'Request For Additional Information: Order [ID_HERE]', N'<p>Germplasm Requestor:</p>

<p>The U.S. National Plant Germplasm System (NPGS) provides plant material in small quantities to research and educational entities for projects where genetic diversity is required. Accessions maintained by the NPGS are not intended or available for home, personal, or community gardening.</p>

<p>Your request does not meet the criteria to receive germplasm from the NPGS and has been cancelled.</p>

<p>For more information about the NPGS, please view a 6-minute video that describes our mission and purpose at https://www.youtube.com/watch?v=uHOclGNELuw.</p>

<p>If you believe this decision is an error, please provide additional relevant information about your project to justify the need for specific NPGS germplasm, instead of using commercially available plant material. Send your email to gringlobal.feedback@usda.gov, and include the web order number.</p>

<p>Thank you.<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
', N'0', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, CAST(N'2021-07-29T09:52:40.7100000' AS DateTime2), 48, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (8, N'NRR Flag Notification', N'NRR', N'gringlobal.orders@usda.gov', NULL, NULL, NULL, NULL, N'NRR (Potential) -- GRIN-Global Web Order #[ID_HERE]', N'Please Note:<p>Web Order <strong>[ID_HERE]</strong> has been flagged for review because it meets one or more Non-Research Request (NRR) criteria. It has been forwarded to the NRR Committee for review.</p><p><strong>Please note that this web order will not appear in the Order Wizard until it has been reviewed.</strong></p><p>The attached web order was flagged by the NRR trigger process as a potential Non Research Request (NRR). This email is simply a preliminary email for your information only. You should not proceed to address this request at this time.  The request will soon be reviewed by the current NRR Review Committee and will be evaluated appropriately, according to the NPGS guidelines.</p><p>You will be receiving a second notification shortly, indicating their decision.  If they cancel the request, then no further action is required by you.  If they approve the request, then you should process your site’s portion of the request, as usual. Note that in cases where the committee has requested more details from the requestor when the request is not an obvious NRR, the delay is dependent on the responsiveness of the requestor.</p><p>If you have questions, or can provide information regarding this web order, please contact the NRR Committee:</p><ul><li><a   href="mailto:@gary.kinard@usda.gov">Gary Kinard</a></li><li><a href="mailto:@harold.bockleman@usda.gov">Harold Bockleman</a></li><li><a href="mailto:@marty.reisinger@usda.gov">Martin Reisinger</a></li></ul>', N'1', CAST(N'2021-08-01T18:03:49.2333333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-08-01T18:03:49.2333333' AS DateTime2), 48)
GO
SET IDENTITY_INSERT [dbo].[email_template] OFF
GO
