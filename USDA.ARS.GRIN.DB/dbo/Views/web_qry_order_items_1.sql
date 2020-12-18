-- current good one

create view [web_qry_order_items] as 

select site,isnull(UARS,0) as UARS, isnull(UFED,0) as UFED, isnull(STA,0) as STA, isnull(UCOM,0) as UCOM, isnull(UPRU,0) as UPRU , 
isnull(UIND,0) as UIND, isnull(UAID,0) as UAID, isnull(INT,0)as INT, isnull(FGEN,0) as FGEN,
 isnull(FCOM,0) as FCOM, isnull(FPRU,0) as FPRU, isnull(FIND,0) as FIND,
 isnull(UARS,0)+isnull(UFED,0)+isnull(STA,0)+isnull(UCOM,0)+isnull(UPRU,0)+isnull(UIND,0)+isnull(UAID,0)
+isnull(INT,0)+isnull(FGEN,0)+isnull(FCOM,0)+isnull(FPRU,0)+isnull(FIND,0) AS '{TOTAL}',received,ortype from

(
   select ' ' + ord.site as site,cat,ISNULL(COUNT(*),0) XCOUNT,cast(oi.acted as datetime2) as received,ord.ortype
  from ord,oi,coop where ord.orno=oi.orno and ord.final=coop.cno -- and ord.ortype in ('DI','RP') 
  and oi.status in ('INSPECT','PSHIP','SHIPPED') -- and year(oi.acted) = 2017 
	  group by ' ' + ord.site,cat,cast(oi.acted as datetime2),ord.ortype
) src
pivot
(
 sum(xcount)
  for cat in ([UARS], [UFED], [STA], [UCOM], [UPRU] , [UIND], [UAID], [INT], [FGEN], [FCOM], [FPRU], [FIND])
  
) piv

