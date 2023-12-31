$PBExportHeader$n_cst_membsrv_allrequest.sru
forward
global type n_cst_membsrv_allrequest from NonVisualObject
end type
end forward

global type n_cst_membsrv_allrequest from NonVisualObject
end type
global n_cst_membsrv_allrequest n_cst_membsrv_allrequest

type variables
transaction		itr_sqlca
Exception		ithw_exception

string		is_coopcontrol, is_coopid

constant int STATUS_NORMAL		= 1	// สถานะงด และใช้ตัวเลขต่อท้ายเอา
constant int STATUS_DROP			= -1	// สถานะงด และใช้ตัวเลขต่อท้ายเอา
constant int STATUS_NOT			= 0	// สถานะไม่
constant int STATUS_PENDING		= 8	// รออนุมัติ (สารพัด)
constant int STATUS_APPROVE		= 1	// อนุมัติ 

n_cst_dbconnectservice		inv_transection
n_cst_doccontrolservice		inv_docsrv
n_cst_datetimeservice		inv_datetimesrv
n_cst_dwxmlieservice			inv_dwxmliesrv
n_cst_loansrv_interest		inv_interest
n_cst_keeping_request_all	inv_kpreq
end variables

forward prototypes
public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception
private function integer of_setsrvdoccontrol (boolean ab_switch)
private function integer of_setsrvdatetime (boolean ab_switch)
public function integer of_setdsmodify (ref n_ds ads_requester, long al_row, boolean ab_keymodify)
private function integer of_setsrvdwxmlie (boolean ab_switch)
public function integer of_openreq_mbnew (ref str_mbreqnew astr_mbreqnew) throws Exception
public function integer of_openreq_mbresign (ref str_mbreqresign astr_mbreqresign) throws Exception
public function integer of_initreq_mbresign (ref str_mbreqresign astr_resigninfo) throws Exception
private function string of_chkoldreq_mbnew (string as_memno)
public function integer of_savereq_mbresign (str_mbreqresign astr_resigninfo) throws Exception
private function string of_chkoldreq_chgmthshr (string as_memno)
public function integer of_savereq_chgmthshr (string as_xmlreq, string as_entryid, datetime adtm_entrydate) throws Exception
private function integer of_chkbeforesave_chgmthshr (n_ds ads_req) throws Exception
private function integer of_chkbeforesave_chggrp (n_ds ads_req) throws Exception
public function integer of_chkbeforesave_mbnew (n_ds ads_mbdetail, n_ds ads_mbshare) throws Exception
private function integer of_chkbeforesave_mbresign (n_ds ads_req) throws Exception
public function datetime of_calretrydate (datetime adtm_birthdate) throws Exception
public function boolean of_isvalididcard (string as_idcard)
public function integer of_initstat_mbcompgrp (ref str_mbstatcompgrp lstr_statcomp) throws Exception
public function integer of_savestat_mbcompgrp (ref str_mbstatcompgrp lstr_statcomp) throws Exception
public function boolean of_isvalidmember (string as_coopid, string as_memno) throws Exception
private function integer of_postapv_mbnewexpense (string as_coopid, string as_memcoopid, string as_applno, string as_membno) throws Exception
public function integer of_openreq_chgmthshr (string as_coopid, string as_reqno, ref string as_xmlreq) throws Exception
public function integer of_getsharebase (string as_coopid, decimal adc_salaryamt, ref decimal adc_sharebase)
public function decimal of_getshareunit (string as_coopid)
public function integer of_setpausekeepup (string as_memcoopid, string as_memno, datetime adtm_opedate) throws Exception
private function string of_chkoldreq_chggrp (string as_memcoopid, string as_memno)
public function integer of_initreq_chgmthshr (string as_coopid, string as_memno, string as_memcoopid, datetime adtm_reqdate, ref string as_xmlreq) throws Exception
private function integer of_postapv_chgmthshr (string as_coopid, string as_reqno, string as_apvid, datetime adtm_apvdate) throws Exception
private function integer of_postapv_chgmembtype (string as_coopid, string as_reqno) throws Exception
private function integer of_setsrvkpreq (boolean ab_switch)
public function integer of_initreq_chggrp (ref str_mbreqchggrp astr_mbreqchggrp) throws Exception
public function integer of_savereq_chggrp (ref str_mbreqchggrp astr_mbreqchggrp) throws Exception
public function integer of_chk_reqtokpexp (string as_memcoop)
public function integer of_openreq_chggrp (ref str_mbreqchggrp astr_mbreqchggrp) throws Exception
public function integer of_savereq_chgmthpay (ref str_mbreqchgmthpay astr_chgmthpay) throws Exception
public function integer of_initreq_chgmthpay (string as_coopid, string as_membno, string as_memcoopid, datetime as_chgreqdate, ref string as_mbreqchgpay_xml, ref string as_reqchgshare_xml, ref string as_reqchgloan_xml) throws Exception
public function integer of_savereq_mbnew (ref str_mbreqnew astr_mbreqnew) throws Exception
public function boolean of_isvalidmbgroup (string as_grpcode) throws Exception
public function integer of_initlist_apvchggrp (ref str_mbreqchggrp astr_mbreqchggrp) throws Exception
private function string of_initreq_mbresignhead (n_ds ads_data, string as_memno, datetime adtm_reqdate) throws Exception
private function string of_initreq_mbresignshare (n_ds ads_data, string as_memno, ref n_ds ads_sum) throws Exception
private function string of_initreq_mbresignloan (n_ds ads_data, string as_memno, datetime adtm_reqdate, ref n_ds ads_sum) throws Exception
private function string of_initreq_mbresigngrt (n_ds ads_data, string as_memno, ref n_ds ads_sum) throws Exception
private function string of_initreq_mbresigndept (n_ds ads_data, string as_memno, ref n_ds ads_sum) throws Exception
private function integer of_postapv_mbresign (ref string as_reqno, string as_apvid, datetime adtm_apvdate) throws Exception
public function integer of_initlist_apvmbresign (ref str_mbreqresign astr_mbreqresign) throws Exception
public function integer of_saveapv_mbresign (ref str_mbreqresign astr_mbreqresign) throws Exception
private function integer of_postapv_mbnewmaster (string as_applno, string as_membno, datetime adtm_apvdate) throws Exception
private function integer of_postapv_mbnewshare (string as_applno, string as_membno) throws Exception
private function integer of_postapv_mbmoneytr (string as_applno, string as_membno) throws Exception
public function integer of_initlist_apvmbnew (ref str_mbreqnew astr_mbreqnew) throws Exception
public function integer of_saveapv_mbnew (ref str_mbreqnew astr_mbreqnew) throws Exception
private function string of_chkoldreq_mbresign (string as_memno)
private function integer of_postapv_chggrp (string as_coopid, string as_reqno, string as_expflg) throws Exception
public function integer of_saveccl_resign (str_mbreqresign astr_mbreqresign) throws Exception
public function integer of_initlist_apvchgmthshr (ref str_mbreqchgmthpay astr_mbreqchgmthpay) throws Exception
public function integer of_saveapv_chgmthshr (ref str_mbreqchgmthpay astr_mbreqchgmthpay) throws Exception
public function integer of_initccl_resign (ref str_mbreqresign astr_mbreqresign) throws Exception
public function integer of_initreq_trnmb (ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception
public function integer of_openreq_trnmb (ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception
public function integer of_saveapv_chggrp (ref str_mbreqchggrp astr_mbreqchggrp) throws Exception
public function integer of_saveapv_trnmb (ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception
public function integer of_savereq_trnmb (ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception
public function integer of_initlist_apvtrnmb (ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception
private function integer of_postapv_mbmembrecvgain (string as_applno, string as_membno) throws Exception
public function integer of_initreq_mbresign_pea (ref str_mbreqresign astr_resigninfo) throws Exception
private function string of_initreq_mbresignhead_pea (n_ds ads_data, string as_memno, datetime adtm_reqdate) throws Exception
public function integer of_savereq_mbresign_pea (str_mbreqresign astr_resigninfo) throws Exception
private function integer of_postapv_trnmb (string as_memold, string as_memnew, datetime adtm_apvdate) throws Exception
end prototypes

public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception;// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
end if

inv_transection	= anv_dbtrans
itr_sqlca 			= inv_transection.itr_dbconnection

is_coopid			= inv_transection.is_coopid
is_coopcontrol	= inv_transection.is_coopcontrol

return 1
end function

private function integer of_setsrvdoccontrol (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_docsrv ) or not isvalid( inv_docsrv ) then
		inv_docsrv	= create n_cst_doccontrolservice
		inv_docsrv.of_settrans( inv_transection )
		return 1
	end if
else
	if isvalid( inv_docsrv ) then
		destroy inv_docsrv
		return 1
	end if
end if

return 0
end function

private function integer of_setsrvdatetime (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_datetimesrv ) or not isvalid( inv_datetimesrv ) then
		inv_datetimesrv	= create n_cst_datetimeservice
		return 1
	end if
else
	if isvalid( inv_datetimesrv ) then
		destroy inv_datetimesrv
		return 1
	end if
end if

return 0
end function

public function integer of_setdsmodify (ref n_ds ads_requester, long al_row, boolean ab_keymodify);string		ls_iskey
long		ll_index, ll_count

ads_requester.setitemstatus( al_row, 0, primary!, datamodified! )

// ปรับ Attrib ทุก Column ให้เป็น Update ซะ
ll_count	= long( ads_requester.describe( "DataWindow.Column.Count" ) )
for ll_index = 1 to ll_count
	
	ls_iskey	= ads_requester.describe("#"+string( ll_index )+".Key")
	
	// ถ้าเป็น PK และเงื่อนไขคือไม่ปรับ Key ไม่ต้องปรับสถานะ
	if upper( ls_iskey ) = "YES" and not( ab_keymodify ) then
		continue
	end if
	
	ads_requester.setitemstatus( 1, ll_index, primary!, datamodified! )
next

return 1
end function

private function integer of_setsrvdwxmlie (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_dwxmliesrv ) or not isvalid( inv_dwxmliesrv ) then
		inv_dwxmliesrv	= create n_cst_dwxmlieservice
		return 1
	end if
else
	if isvalid( inv_dwxmliesrv ) then
		destroy inv_dwxmliesrv
		return 1
	end if
end if

return 0
end function

public function integer of_openreq_mbnew (ref str_mbreqnew astr_mbreqnew) throws Exception;string		ls_reqno
n_ds		lds_mbdetail, lds_gain, lds_moneytr

ls_reqno		= astr_mbreqnew.req_no

lds_mbdetail	= create n_ds
lds_mbdetail.dataobject	= "d_mbsrv_req_appl"
lds_mbdetail.settransobject( itr_sqlca )

lds_gain	= create n_ds
lds_gain.dataobject	= "d_mbsrv_req_applgain"
lds_gain.settransobject( itr_sqlca )

lds_moneytr	= create n_ds
lds_moneytr.dataobject	= "d_mbsrv_req_applmoneytr"
lds_moneytr.settransobject( itr_sqlca )

lds_mbdetail.retrieve( is_coopcontrol, ls_reqno )
lds_gain.retrieve( is_coopcontrol, ls_reqno )
lds_moneytr.retrieve( is_coopcontrol, ls_reqno )

astr_mbreqnew.xml_mbdetail		= inv_dwxmliesrv.of_xmlexport( lds_mbdetail )
astr_mbreqnew.xml_mbmoneytr	= inv_dwxmliesrv.of_xmlexport( lds_moneytr )
astr_mbreqnew.xml_mbgain		= inv_dwxmliesrv.of_xmlexport( lds_gain )

if isvalid(lds_mbdetail) then destroy lds_mbdetail
if isvalid(lds_moneytr) then destroy lds_moneytr
if isvalid(lds_gain) then destroy lds_gain

return 1
end function

public function integer of_openreq_mbresign (ref str_mbreqresign astr_mbreqresign) throws Exception;string		ls_reqno,ls_coopid
long		ll_count
integer	li_reqstatus
n_ds		lds_temp, lds_sum

this.of_setsrvdwxmlie( true )

ls_reqno		= trim( astr_mbreqresign.req_no )

if isnull( ls_reqno ) or ls_reqno = "" then
	ithw_exception.text	= "ไม่มีเลขที่ใบคำขอลาออกส่งเข้ามาที่ of_openreq_mbresign"
	throw ithw_exception
end if

select		resignreq_status
into		:li_reqstatus
from		mbreqresign
where	( resignreq_docno	= :ls_reqno  and coop_id =:is_coopcontrol)
using		itr_sqlca ;

lds_sum		= create n_ds
lds_sum.dataobject = "d_mbsrv_req_resignsum"
lds_sum.settransobject( itr_sqlca )
lds_sum.insertrow( 0 )

lds_temp		= create n_ds

// ส่วนใบคำขอลาออก
lds_temp.dataobject	= "d_mbsrv_req_resign"
lds_temp.settransobject( itr_sqlca )
lds_temp.retrieve( is_coopcontrol, ls_reqno )

astr_mbreqresign.xml_request	= inv_dwxmliesrv.of_xmlexport( lds_temp )

// ส่วนรายการหุ้น
lds_temp.dataobject	= "d_mbsrv_req_resignshare"
lds_temp.settransobject( itr_sqlca )
lds_temp.retrieve( is_coopcontrol,ls_reqno )

lds_sum.object.share[ 1 ]			= lds_temp.object.sharestk_value[ 1 ]
lds_sum.object.shrper_month[ 1 ]	= lds_temp.object.shrper_month[ 1 ]

astr_mbreqresign.xml_share	= inv_dwxmliesrv.of_xmlexport( lds_temp )

// ส่วนรายการหนี้
lds_temp.dataobject	= "d_mbsrv_req_resignloan"
lds_temp.settransobject( itr_sqlca )
ll_count		= lds_temp.retrieve( is_coopcontrol, ls_reqno )

if ll_count > 0 then
	lds_sum.object.loan[ 1 ]		= lds_temp.object.c_principal[ 1 ]
	lds_sum.setitem( 1, "loan_count", ll_count )
end if

astr_mbreqresign.xml_loan	= inv_dwxmliesrv.of_xmlexport( lds_temp )

// ส่วนรายการเงินฝาก
lds_temp.dataobject	= "d_mbsrv_req_resigndeposit"
lds_temp.settransobject( itr_sqlca )
ll_count		= lds_temp.retrieve( is_coopcontrol, ls_reqno )

if ll_count > 0 then
	lds_sum.object.deposit[ 1 ]		= lds_temp.object.c_dep_balance[ 1 ]
	lds_sum.setitem( 1, "dep_count", ll_count )
end if

astr_mbreqresign.xml_dept	= inv_dwxmliesrv.of_xmlexport( lds_temp )

// ส่วนรายการคนค้ำ
lds_temp.dataobject	= "d_mbsrv_req_resigngrt"
lds_temp.settransobject( itr_sqlca )
ll_count		= lds_temp.retrieve( is_coopcontrol, ls_reqno )

if ll_count > 0 then
	lds_sum.object.coll_amt[ 1 ]		= lds_temp.object.c_collamt[ 1 ]
	lds_sum.setitem( 1, "coll_count", ll_count )
end if

astr_mbreqresign.xml_grt	= inv_dwxmliesrv.of_xmlexport( lds_temp )

// ส่วนสรุปยอด
astr_mbreqresign.xml_sum	= inv_dwxmliesrv.of_xmlexport( lds_sum )

this.of_setsrvdwxmlie( false )
if isvalid(lds_temp) then destroy lds_temp
if isvalid(lds_sum) then destroy lds_sum

return 1
end function

public function integer of_initreq_mbresign (ref str_mbreqresign astr_resigninfo) throws Exception;/***********************************************************
<description>
	สร้างใบคำขอลาออก
</description>

<arguments>  
	as_memno			String			เลขสมาชิก
	ads_loan				n_ds			datastore ที่ต้องการบรรจุข้อมูลเกี่ยวกับหนี้
</arguments> 

<return> 
	Integer				1 = success, Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 12/10/2010 by MiT
</usage> 
***********************************************************/
integer	li_resignstatus
string		ls_memno, ls_reqno
n_ds		lds_sum , lds_data
boolean	lb_err = false
datetime	ldtm_reqdate,ldtm_workdate

this.of_setsrvdwxmlie( true )

ls_memno			= astr_resigninfo.member_no
ldtm_reqdate		= astr_resigninfo.req_date
ldtm_workdate		= astr_resigninfo.entry_date

// ตรวจสอบว่ามีและลาออกหรือยัง
select 	resign_status
into		:li_resignstatus
from		mbmembmaster
where 	( member_no = :ls_memno  and coop_id = :is_coopcontrol)
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text = "ไม่พบเลขสมาชิกที่ป้อน ("+ls_memno+") กรุณาตรวจสอบ"
	lb_err = true ; goto objdestroy
end if

if li_resignstatus = 1 then
	ithw_exception.text = "เลขสมาชิก ("+ls_memno+") มีสถานะเป็นลาออกแล้ว กรุณาตรวจสอบ"
	lb_err = true ; goto objdestroy
end if

// ตรวจว่ามีการป้อนใบคำขอเอาไว้หรือยัง
ls_reqno		= this.of_chkoldreq_mbresign( ls_memno )

if len( ls_reqno ) > 0 then
	astr_resigninfo.req_no	= ls_reqno
	try
		this.of_openreq_mbresign( astr_resigninfo )
	catch( Exception lthw_openerr )
		ithw_exception.text	= lthw_openerr.text
		lb_err = true
	end try
	if lb_err then goto objdestroy
end if

lds_sum = create n_ds
lds_sum.dataobject = "d_mbsrv_req_resignsum"
lds_sum.settransobject( itr_sqlca )
lds_sum.insertrow( 0 )

lds_data = create n_ds

// ส่งคืนค่ากลับ
astr_resigninfo.xml_request = this.of_initreq_mbresignhead( lds_data , ls_memno, ldtm_reqdate )
astr_resigninfo.xml_share	= this.of_initreq_mbresignshare( lds_data , ls_memno , lds_sum )
astr_resigninfo.xml_loan		= this.of_initreq_mbresignloan( lds_data , ls_memno,ldtm_workdate, lds_sum)
astr_resigninfo.xml_grt		= this.of_initreq_mbresigngrt( lds_data , ls_memno, lds_sum )
astr_resigninfo.xml_dept		= this.of_initreq_mbresigndept( lds_data , ls_memno, lds_sum )

astr_resigninfo.xml_sum		= inv_dwxmliesrv.of_xmlexport( lds_sum )

objdestroy:
if isvalid(lds_sum) then destroy lds_sum
if isvalid(lds_data) then destroy lds_data
this.of_setsrvdwxmlie( false )

if lb_err then
	ithw_exception.text = "n_cst_membsrv_allrequest.of_initreq_mbresign()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

private function string of_chkoldreq_mbnew (string as_memno);/***********************************************************
<description>
	ตรวจสอบว่ามีใบคำขอเก่าที่ยังไม่อนุมัติหรือไม่
</description>

<arguments>  
	as_memno		String	 	เลขสมาชิก
</arguments> 

<return> 
	String			เลขที่ใบคำขอล่าสุดที่ยังไม่อนุมัติ
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 13/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_docno
integer	li_status

li_status  = STATUS_PENDING

select	max( appl_docno )
into	:ls_docno
from 	mbreqappl
where ( member_no	=	:as_memno ) and 
		 ( appl_status = :li_status )
using itr_sqlca ;
 
if isnull( ls_docno ) then
	ls_docno =""
end if

return trim( ls_docno )
end function

public function integer of_savereq_mbresign (str_mbreqresign astr_resigninfo) throws Exception;
/***********************************************************
<description>
	บันทึกคำขอลาออก
</description>

</description>

<arguments>  
	as_xmlreq				String			ข้อมูลใบคำขอเปลี่ยนแปลงค่าหุ้น
	as_entryid				String			ผู้บันทึกใบคำขอ
	adtm_entrydate		Datetime		วันที่บันทึกใบคำขอ
</arguments> 

<return> 
	Integer				1 = success, Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 12/10/2010 by MiT
</usage> 
	
***********************************************************/
string		ls_entryid, ls_reqdocno,ls_coopid,ls_memcoopid
integer	li_apvimmediate
long		ll_count, ll_index, ll_rowcount
datetime	ldtm_apvdate
boolean	lb_err = false
n_ds		lds_req, lds_share, lds_loan, lds_grt, lds_dept

this.of_setsrvdwxmlie( true )
this.of_setsrvdoccontrol( true )

lds_req		= create n_ds
lds_req.dataobject		= "d_mbsrv_req_resign"
lds_req.settransobject( itr_sqlca )

lds_share		= create n_ds
lds_share.dataobject		= "d_mbsrv_req_resignshare"
lds_share.settransobject( itr_sqlca )

lds_loan		= create n_ds
lds_loan.dataobject		= "d_mbsrv_req_resignloan"
lds_loan.settransobject( itr_sqlca )

lds_grt		= create n_ds
lds_grt.dataobject		= "d_mbsrv_req_resigngrt"
lds_grt.settransobject( itr_sqlca )

lds_dept		= create n_ds
lds_dept.dataobject		= "d_mbsrv_req_resigndeposit"
lds_dept.settransobject( itr_sqlca )

ls_entryid		= astr_resigninfo.entry_id

// import ข้อมูลเข้า
ll_rowcount		= inv_dwxmliesrv.of_xmlimport( lds_req, astr_resigninfo.xml_request )
//ll_rowcount =     inv_dwxmliesrv.of_xmlimport(lds_req,astr_resigninfo.xml_request)
if ( ll_rowcount < 1 ) then
	ithw_exception.text = "ใบคำขอที่ส่งเข้ามาไม่มีข้อมูลสำหรับทำรายการได้ กรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

ldtm_apvdate	= lds_req.object.apv_date[1]

try
	// ตรวจสอบข้อมูลก่อนบันทึก
	this.of_chkbeforesave_mbresign( lds_req )
	inv_dwxmliesrv.of_xmlimport( lds_share, astr_resigninfo.xml_share )
	inv_dwxmliesrv.of_xmlimport( lds_loan, astr_resigninfo.xml_loan )
	inv_dwxmliesrv.of_xmlimport( lds_grt, astr_resigninfo.xml_grt )
	inv_dwxmliesrv.of_xmlimport( lds_dept, astr_resigninfo.xml_dept )
catch(Exception lthw_imperror)
	lb_err = true
end try
if lb_err then Goto objdestroy

// ใส่เลขที่เอกสาร
ls_reqdocno		= trim( lds_req.getitemstring( 1, "resignreq_docno" ) )

// ตรวจว่าเป็นคำขอใหม่หรือเก่า ถ้าเก่าต้องลบข้อมุลเก่าออกก่อนแล้วค่อยบันทึก
if ( lower( ls_reqdocno ) = "auto" ) or isnull( ls_reqdocno ) or ls_reqdocno = "" then
	ls_reqdocno = inv_docsrv.of_getnewdocno( is_coopcontrol,"MBRSGDOCNO" )	
else	
	delete from mbreqresignshare where resignreq_docno = :ls_reqdocno and coop_id = :is_coopcontrol using itr_sqlca ;
	delete from mbreqresignloan where resignreq_docno = :ls_reqdocno and coop_id = :is_coopcontrol using itr_sqlca ;
	delete from mbreqresigndept where resignreq_docno = :ls_reqdocno and coop_id = :is_coopcontrol using itr_sqlca ;
	delete from mbreqresigngrt where resignreq_docno = :ls_reqdocno and coop_id = :is_coopcontrol using itr_sqlca ;
	delete from mbreqresign where resignreq_docno = :ls_reqdocno and coop_id = :is_coopcontrol using itr_sqlca ;	
end if

lds_req.setitem( 1, "coop_id", is_coopcontrol )
lds_req.setitem( 1, "resignreq_docno", ls_reqdocno )
lds_req.setitem( 1, "entry_id", ls_entryid )
lds_req.setitem( 1, "entry_bycoopid", is_coopid )
lds_req.setitem( 1, "entry_date", datetime( today() , now() ) )	

lds_share.setitem( 1, "coop_id", is_coopcontrol )
lds_share.setitem( 1, "resignreq_docno", ls_reqdocno )
lds_share.setitem( 1, "seq_no", 1 )

for ll_index = 1 to lds_loan.rowcount()
	lds_loan.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_loan.setitem( ll_index, "resignreq_docno", ls_reqdocno )
	lds_loan.setitem( ll_index, "seq_no", ll_index )
next

for ll_index = 1 to lds_grt.rowcount()
	lds_grt.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_grt.setitem( ll_index, "resignreq_docno", ls_reqdocno )
	lds_grt.setitem( ll_index, "seq_no", ll_index )
next

for ll_index = 1 to lds_dept.rowcount()
	lds_dept.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_dept.setitem( ll_index, "resignreq_docno", ls_reqdocno )
	lds_dept.setitem( ll_index, "seq_no", ll_index )
next

// -----------------------
// เริ่มกระบวนการบันทึก
// -----------------------
// บันทึก Master
if lds_req.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบลาออกสมาชิกไม่ได้  "
	ithw_exception.text	+= ls_reqdocno +"~n~r"+ lds_req.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// บันทึก Share
if lds_share.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบลาออกสมาชิก  ส่วนหุ้นคงเหลือไม่ได้  "
	ithw_exception.text	+= ls_reqdocno +"~n~r"+ lds_share.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// บันทึก loan
if lds_loan.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบลาออกสมาชิก  ส่วนหนี้คงเหลือไม่ได้  "
	ithw_exception.text	+= ls_reqdocno +"~n~r"+ lds_loan.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// บันทึก คนค้ำ
if lds_grt.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบลาออกสมาชิก  ส่วนการติดค้ำประกันไม่ได้  "
	ithw_exception.text	+= ls_reqdocno +"~n~r"+ lds_grt.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// บันทึก เงินฝาก
if lds_dept.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบลาออกสมาชิก  ส่วนเงินฝากคงเหลือไม่ได้  "
	ithw_exception.text	+= ls_reqdocno +"~n~r"+ lds_dept.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// อนุมัติเลยหรือไม่
li_apvimmediate	= lds_req.getitemnumber( 1, "apvflag" )

if ( li_apvimmediate = 1 ) then
	try
		this.of_postapv_mbresign( ls_reqdocno, ls_entryid, ldtm_apvdate )
	catch( Exception lthw_postapverr )
		ithw_exception.text	= lthw_postapverr.text
		lb_err = true
	end try
	if lb_err then Goto objdestroy
	
	update	mbreqresign
	set			resignreq_status		= 1,
				apv_id					= :ls_entryid,
				apv_date					= :ldtm_apvdate
	where	( resignreq_docno		= :ls_reqdocno  
	and 		coop_id 					= :is_coopcontrol )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ไม่สามารถปรับปรุงสถานะใบคำขอลาออกให้เป็นอนุมัติได้ ~n" + itr_sqlca.sqlerrtext
		lb_err = true ; Goto objdestroy
	end if
end if

objdestroy:
if isvalid(lds_req) then destroy lds_req
if isvalid(lds_share) then destroy lds_share
if isvalid(lds_loan) then destroy lds_loan
if isvalid(lds_grt) then destroy lds_grt
if isvalid(lds_dept) then destroy lds_dept

this.of_setsrvdoccontrol( false )
this.of_setsrvdwxmlie( false )

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_membsrv_allrequest.of_savereq_mbresign()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

return 1
end function

private function string of_chkoldreq_chgmthshr (string as_memno);/***********************************************************
<description>
	ตรวจสอบว่ามีใบคำขอเก่าที่ยังไม่อนุมัติหรือไม่
</description>

<arguments>  
	as_memno		String	 	เลขสมาชิก
</arguments> 

<return> 
	String			เลขที่ใบคำขอล่าสุดที่ยังไม่อนุมัติ
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 13/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_docno
integer	li_status

li_status  = STATUS_PENDING

select	max( payadjust_docno )
into	:ls_docno
from	shpaymentadjust
where ( member_no = :as_memno ) and
		 ( shrpayadj_status = :li_status )
using itr_sqlca ;
 
if isnull( ls_docno ) then
	ls_docno =""
end if

return trim( ls_docno )
end function

public function integer of_savereq_chgmthshr (string as_xmlreq, string as_entryid, datetime adtm_entrydate) throws Exception;/***********************************************************
<description>
	บันทึกใบคำขอเปลี่ยนแปลงค่าหุ้น
</description>

<arguments>  
	as_xmlreq				String			ข้อมูลใบคำขอเปลี่ยนแปลงค่าหุ้น
	as_entryid				String			ผู้บันทึกใบคำขอ
	adtm_entrydate		Datetime		วันที่บันทึกใบคำขอ
</arguments> 

<return> 
	Integer				1 = success, Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 11/10/2010 by MiT
</usage> 
***********************************************************/
// บันทึกใบคำขอเปลี่ยนแปลงค่าหุ้น
string		ls_docno,ls_coopid,ls_memcoopid
integer	li_apvimmediate, li_ret, li_oldstatus, li_newstatus
long	 	ll_count
dec{2}	ldc_oldshrvalue, ldc_newshrvalue
boolean	lb_err
n_ds		lds_req

this.of_setsrvdoccontrol( true )
this.of_setsrvdwxmlie( true )

// Import ข้อมูลจากหน้าเวป
lds_req	= create n_ds
lds_req.dataobject = "d_mbsrv_req_chgmthshr"
lds_req.settransobject( itr_sqlca ) 

// Import ข้อมูลจากหน้าเวป
try
	ll_count	= inv_dwxmliesrv.of_xmlimport( lds_req, as_xmlreq )
catch( Exception lthw_imperr )
	ithw_exception.text	= lthw_imperr.text
	lb_err = true
end try
if lb_err then Goto objdestroy

if ( ll_count < 1 ) then
	ithw_exception.text	= "ไม่มีข้อมูลการเปลี่ยนแปลงค่าหุ้น สำหรับทำรายการบันทึก กรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

// ตรวจสอบข้อมูลก่อนบันทึก
//this.of_chkbeforesave_chgmthshr( lds_req )

ls_coopid	= lds_req.getitemstring( 1, "coop_id" )
ls_memcoopid =lds_req.getitemstring( 1, "memcoop_id" )
// ประเภทการเปลี่ยนแปลง
li_oldstatus			= lds_req.getitemnumber( 1, "old_paystatus" )
li_newstatus			= lds_req.getitemnumber( 1, "new_paystatus" )
ldc_oldshrvalue		= lds_req.getitemdecimal( 1, "old_periodvalue" )
ldc_newshrvalue	= lds_req.getitemdecimal( 1, "new_periodvalue" )

// กำหนดการเปลี่ยนแปลง
lds_req.setitem( 1, "chgstop_flag", 0 )
lds_req.setitem( 1, "chgcont_flag", 0 )
lds_req.setitem( 1, "chgadd_flag", 0 )
lds_req.setitem( 1, "chglow_flag", 0 )

if li_oldstatus = 1 and li_newstatus = -1 then
	lds_req.setitem( 1, "chgstop_flag", 1 )
elseif li_oldstatus = -1 and li_newstatus = 1 then
	lds_req.setitem( 1, "chgcont_flag", 1 )
elseif ldc_oldshrvalue > ldc_newshrvalue then
	lds_req.setitem( 1, "chglow_flag", 1 )
elseif ldc_oldshrvalue < ldc_newshrvalue then
	lds_req.setitem( 1, "chgadd_flag", 1 )
end if

// ตรวจสอบว่ามีเลขที่ใบคำขอหรือยัง
ls_docno		= trim( lds_req.getitemstring( 1, "payadjust_docno" ) )

if lower( ls_docno ) = "auto" or isnull( ls_docno ) or ls_docno = "" then
	ls_docno	= inv_docsrv.of_getnewdocno( ls_memcoopid,"MBCHGDOCNO" )
	
	lds_req.setitem( 1, "payadjust_docno", ls_docno )
	lds_req.setitem( 1, "entry_date", adtm_entrydate )	
else
	this.of_setdsmodify( lds_req, 1, false )
end if

// บันทึกใบคำขอ
if lds_req.update() <> 1 then
	ithw_exception.text = "ไม่สามารถบันทึกใบคำขอเปลี่ยนแปลงค่าหุ้นรายเดือนได้~n" + lds_req.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// อนุมัติเลยหรือไม่
li_apvimmediate = lds_req.object.apvimmediate_flag[ 1 ]
if ( li_apvimmediate = 1 ) then
	try
		this.of_postapv_chgmthshr( is_coopcontrol ,ls_docno, as_entryid, adtm_entrydate )
	catch( Exception lthw_posterr )
		ithw_exception.text	= lthw_posterr.text
		lb_err = true
	end try
	if lb_err then Goto objdestroy
	
	update	shpaymentadjust
	set			shrpayadj_status	= 1,
				approve_id			= :as_entryid,
				approve_date		= :adtm_entrydate
	where	( payadjust_docno	= :ls_docno and coop_id =:ls_coopid)
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ไม่สามารถปรับปรุงสถานะใบคำขอเปลี่ยนแปลงค่าหุ้นรายเดือนให้เป็นอนุมัติได้ ~n" + itr_sqlca.sqlerrtext
		lb_err = true ; Goto objdestroy
	end if
end if

objdestroy:
this.of_setsrvdwxmlie( false )
this.of_setsrvdoccontrol( false )

if isvalid(lds_req) then destroy lds_req

if lb_err then
	rollback using itr_sqlca;
	ithw_exception.text = "n_cst_membsrv_allrequest.of_savereq_chgmthshr()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

return 1
end function

private function integer of_chkbeforesave_chgmthshr (n_ds ads_req) throws Exception;string		ls_memno, ls_sharetype
integer	li_chgadd, li_chglow, li_chgstop, li_chgcont, li_chk
integer	li_chktype, li_chkmax, li_chkadd, li_chklow, li_chkstop, li_chkcont
integer	li_oldstatus, li_newstatus
dec{2}	ldc_oldshrvalue, ldc_newshrvalue

ls_sharetype		= "01"
ls_memno			= ads_req.getitemstring( 1, "member_no" )
li_oldstatus			= ads_req.object.old_paystatus[ 1 ]
li_newstatus			= ads_req.object.new_paystatus[ 1 ]
ldc_oldshrvalue		= ads_req.object.old_periodvalue[ 1 ]
ldc_newshrvalue	= ads_req.object.new_periodvalue[ 1 ]

if li_oldstatus = li_newstatus and ldc_oldshrvalue = ldc_newshrvalue then
	ithw_exception.text += "ข้อมูลการส่งหุ้นไม่มีการเปลี่ยนแปลง กรุณาตรวจสอบด้วย"
	throw ithw_exception
end if

if li_newstatus = STATUS_NORMAL and ldc_newshrvalue = 0 then
	ithw_exception.text += "กรุณาระบุจำนวนหุ้นที่จะส่งรายเดือนด้วย"
	throw ithw_exception
end if

// ดึงจำนวนครั้งที่เปลี่ยนแปลงมาแล้ว
select	chgpayadd_amt, chgpaylow_amt, chgpaystop_amt, chgpaycont_amt
into	:li_chgadd, :li_chglow, :li_chgstop, :li_chgcont
from	shsharemaster
where ( member_no	= :ls_memno ) and
		 ( sharetype_code	= :ls_sharetype ) using itr_sqlca;

if isnull( li_chgadd ) then li_chgadd = 0
if isnull( li_chglow ) then li_chglow = 0
if isnull( li_chgstop ) then li_chgstop = 0
if isnull( li_chgcont ) then li_chgcont = 0

// ดึง Config ข้อกำหนดการเปลี่ยนแปลง
select	chgcount_type, chgcountall_amt, chgcountadd_amt, chgcountlow_amt, chgcountstop_amt, chgcountcont_amt
into	:li_chktype, :li_chkmax, :li_chkadd, :li_chklow, :li_chkstop, :li_chkcont
from	shsharetype
where( sharetype_code = '01' )
using	itr_sqlca ;

//if ( li_chktype = 1 ) then
//	if ( li_chgadd + li_chglow + li_chgstop + li_chgcont ) >= li_chkmax then
//		ithw_exception.text = "จำนวนครั้งการเปลี่ยนแปลงการส่งหุ้นของปีนี้มากกว่าที่กำหนดไว้"
//		throw ithw_exception
//	end if
//end if	
//
//// เป็นการเปลี่ยนแปลงแบบไหน
//if li_oldstatus = 1 and li_newstatus = -1 then
//	if ( li_chgstop >= li_chkstop ) then
//		ithw_exception.text = "จำนวนครั้งการขอหยุดส่งหุ้นของปีนี้มากกว่าที่กำหนดไว้"
//		throw ithw_exception
//	end if
//elseif li_oldstatus = -1 and li_newstatus = 1 then
//	if ( li_chgcont >= li_chkcont ) then
//		ithw_exception.text = "จำนวนครั้งการขอส่งหุ้นต่อของปีนี้มากกว่าที่กำหนดไว้"
//		throw ithw_exception
//	end if
//elseif ldc_oldshrvalue > ldc_newshrvalue then
//	if ( li_chgadd >= li_chkadd ) then
//		ithw_exception.text = "จำนวนครั้งการขอเพิ่มการส่งหุ้นของปีนี้มากกว่าที่กำหนดไว้"
//		throw ithw_exception
//	end if
//elseif ldc_oldshrvalue < ldc_newshrvalue then
//	if ( li_chglow >= li_chklow ) then
//		ithw_exception.text = "จำนวนครั้งการขอลดการส่งหุ้นของปีนี้มากกว่าที่กำหนดไว้"
//		throw ithw_exception
//	end if
//end if

return 1
end function

private function integer of_chkbeforesave_chggrp (n_ds ads_req) throws Exception;string		ls_oldgroup, ls_newgroup 
string		ls_oldexp , ls_oldexpbank , ls_oldexpbranch , ls_oldexpaccid
string		ls_expense , ls_expbank , ls_expbranch , ls_expaccid
// ตรวจสอบข้อมูลก่อนบันทึก
ls_oldgroup				= ads_req.object.old_group[ 1 ]
ls_newgroup			= ads_req.object.new_group[ 1 ]

ls_oldexp					= ads_req.object.oldexp_code[ 1 ]
ls_oldexpbank			= ads_req.object.oldexp_bank[ 1 ]
ls_oldexpbranch		= ads_req.object.oldexp_branch[ 1 ]
ls_oldexpaccid			= ads_req.object.oldexp_accid[ 1 ]
ls_expense				= ads_req.object.expense_code[ 1 ]
ls_expbank				= ads_req.object.expense_bank[ 1 ]
ls_expbranch			= ads_req.object.expense_branch[ 1 ]
ls_expaccid				= ads_req.object.expense_accid[ 1 ]

if ( isnull( ls_newgroup ) or ( ls_newgroup = "" ) ) then
	ithw_exception.text = "สังกัดที่จะย้ายไปไม่มีค่า! กรุณาป้อนสังกัดที่จะย้ายด้วย"
	throw ithw_exception
end if

if not this.of_isvalidmbgroup( ls_newgroup ) then
	ithw_exception.text = "รหัสสังกัดที่จะย้ายไป ไม่มีข้อมูลอยู่ในระบบ กรุณาตรวจสอบด้วย"
	throw ithw_exception
end if

//if ( isnull( ls_expense ) ) or ( ls_expense = "" ) ) then
//	ithw_exception.text = "สังกัดที่จะย้ายไปไม่มีค่า! กรุณาป้อนสังกัดที่จะย้ายด้วย"
//	throw ithw_exception
//end if

return 1
end function

public function integer of_chkbeforesave_mbnew (n_ds ads_mbdetail, n_ds ads_mbshare) throws Exception;string		ls_memno, ls_mbname, ls_mbsurname, ls_mbgroup, ls_salaryid,ls_membertype
string		ls_notvalidtext
dec{2}	ldc_salaryamt, ldc_shrvalue
datetime	ldtm_birthdate
boolean	lb_notvalid

lb_notvalid			= false

ls_memno			= trim( ads_mbdetail.getitemstring( 1, "member_no" ) )
ls_mbname			= trim( ads_mbdetail.getitemstring( 1, "memb_name" ) )
ls_membertype			= trim( ads_mbdetail.getitemstring( 1, "member_type" ) )
ls_mbsurname		= trim( ads_mbdetail.getitemstring( 1, "memb_surname" ) )
ls_mbgroup			= trim( ads_mbdetail.getitemstring( 1, "membgroup_code" ) )
ls_salaryid			= trim( ads_mbdetail.getitemstring( 1, "salary_id" ) )
ldc_salaryamt		= ads_mbdetail.getitemdecimal( 1, "salary_amount" )
ldtm_birthdate		= ads_mbdetail.getitemdatetime( 1, "birth_date" )

ldc_shrvalue			= ads_mbshare.getitemdecimal( 1, "periodshare_value" )

if isnull( ls_memno ) or ls_memno = "" then
	ls_notvalidtext	+= ", เลขที่สมาชิก"
	lb_notvalid		= true
end if

if isnull( ls_mbname ) or ls_mbname = "" then
	ls_notvalidtext	+= ", ชื่อสมาชิก"
	lb_notvalid		= true
end if

if isnull( ls_mbsurname ) or ls_mbsurname = "" then
	ls_notvalidtext	+= ", นามสกุลสมาชิก"
	lb_notvalid		= true
end if

if isnull( ls_mbgroup ) or ls_mbgroup = "" then
	ls_notvalidtext	+= ", สังกัด"
	lb_notvalid		= true
end if

if isnull( ls_salaryid ) or ls_salaryid = "" then
	ls_notvalidtext	+= ", เลขพนักงาน"
	lb_notvalid		= true
end if

//if isnull( ldc_salaryamt ) or ldc_salaryamt = 0 then
//	ls_notvalidtext	+= ", เงินเดือน"
//	lb_notvalid		= true
//end if

if isnull( ldtm_birthdate ) or string( ldtm_birthdate, "yyyymmdd" ) = "19000101" then
	ls_notvalidtext	+= ", วันเกิด"
	lb_notvalid		= true
end if
if(ls_membertype<>'2') then         // Edit By BankCM เรื่อง สมาชิกสมทบไม่ต้อง ส่งหุ้นรายเดือน

	if isnull( ldc_shrvalue ) or ldc_shrvalue = 0 then
		ls_notvalidtext	+= ", การส่งหุ้น/เดือน"
		lb_notvalid		= true
	end if
	
end if
if lb_notvalid then
	ithw_exception.text	= "กรุณาระบุข้อมูลเหล่านี้ด้วย "+mid( ls_notvalidtext, 2 )
	throw ithw_exception
end if

return 1
end function

private function integer of_chkbeforesave_mbresign (n_ds ads_req) throws Exception;string		ls_resigncause

ls_resigncause		= trim( ads_req.getitemstring( 1, "member_no" ) )

if ls_resigncause = "" or isnull( ls_resigncause ) then
	ithw_exception.text += "กรุณาระบุเหตุผลการลาออกด้วย"
	throw ithw_exception
end if

return 1
end function

public function datetime of_calretrydate (datetime adtm_birthdate) throws Exception;integer	li_year, li_month, li_day, li_age, li_mthdue
date		ld_expire

select	retry_age, retry_month
into	:li_age, :li_mthdue
from	cmcoopconstant
using itr_sqlca ;

if isnull( li_age ) then li_age = 60
if isnull( li_mthdue ) then li_mthdue = 9

this.of_setsrvdatetime( true )
ld_expire	= inv_datetimesrv.of_relativeyear( date( adtm_birthdate ), li_age )

li_year	= year( ld_expire )
li_month	= month( ld_expire )
li_day		= day( ld_expire )

if li_month > li_mthdue then
	li_year ++
end if

ld_expire		= date( li_year, li_mthdue, 1 )
ld_expire		= inv_datetimesrv.of_lastdayofmonth( ld_expire )

this.of_setsrvdatetime( false )

return datetime( ld_expire )
end function

public function boolean of_isvalididcard (string as_idcard);long		ll_length, ll_count=0
long		ll_sumpos, ll_sumall, ll_modchk, ll_lastchk
char		lc_char, lc_lastdigit
integer	li_ascii

//Check parameters
if isnull( as_idcard ) then
	return false
end if

as_idcard	= trim( as_idcard )

//Get the length
ll_length		= len( as_idcard )

//Check for at least one character
if ll_length <> 13 then
	return false
end if

//Perform loop around all characters.
//Quit loop if Non numeric character is found.
do while ll_count < ll_length
	ll_count ++
	
	//เช็คเป็นตัวเลข
	if not isnumber( mid( as_idcard, ll_count, 1 ) ) then  
		return false
	end if	 
loop

// Calculate Chk Digit
for ll_count = 1 to 12
	ll_sumpos	= integer( mid( as_idcard, ll_count, 1 ) ) * ( ( 13 + 1 ) - ll_count )
	ll_sumall		= ll_sumall + ll_sumpos
next
	
ll_modchk	= mod( ll_sumall, 11 )
ll_lastchk		= 11 - ll_modchk

lc_lastdigit	= right( string( ll_lastchk ), 1 )

if lc_lastdigit <> mid( as_idcard, 13, 1 ) then
	return false
end if

return true
end function

public function integer of_initstat_mbcompgrp (ref str_mbstatcompgrp lstr_statcomp) throws Exception;string		ls_grpcomp
long		ll_row
integer	li_year, li_month, li_prioryear, li_priormth, li_recalflag
integer	li_compbal, li_compbf, li_compadd, li_compsub
datetime	ldtm_start, ldtm_end
n_ds		lds_statcompgrp, lds_grpadd, lds_grpsub

lds_statcompgrp	= create n_ds
lds_statcompgrp.dataobject	= "d_mbsrv_stat_compgrp"
lds_statcompgrp.settransobject( itr_sqlca )

lds_grpadd	= create n_ds
lds_grpadd.dataobject	= "d_mbsrv_stat_compgrpadd"
lds_grpadd.settransobject( itr_sqlca )

lds_grpsub	= create n_ds
lds_grpsub.dataobject	= "d_mbsrv_stat_compgrpsub"
lds_grpsub.settransobject( itr_sqlca )

ls_grpcomp	= "00112"
li_year		= lstr_statcomp.stat_year
li_month		= lstr_statcomp.stat_month
ldtm_start	= lstr_statcomp.stat_startdate
ldtm_end		= lstr_statcomp.stat_enddate
li_recalflag	= lstr_statcomp.recal_flag

if isnull( li_recalflag ) then li_recalflag = 0

lds_statcompgrp.retrieve( li_year, li_month )

ll_row	= lds_statcompgrp.rowcount()

if ll_row > 0 and li_recalflag = 0 then
	ldtm_start	= lds_statcompgrp.getitemdatetime( 1, "statstart_date" )
	ldtm_end		= lds_statcompgrp.getitemdatetime( 1, "statend_date" )
	
	lds_grpadd.retrieve( ldtm_start, ldtm_end, ls_grpcomp )
	lds_grpsub.retrieve( ldtm_start, ldtm_end, ls_grpcomp )
	
	lstr_statcomp.xml_statdetail		= inv_dwxmliesrv.of_xmlexport( lds_statcompgrp )
	lstr_statcomp.xml_compadd		= inv_dwxmliesrv.of_xmlexport( lds_grpadd )
	lstr_statcomp.xml_compsub		= inv_dwxmliesrv.of_xmlexport( lds_grpsub )
	
	return 1
end if

lds_grpadd.retrieve( ldtm_start, ldtm_end, ls_grpcomp )
lds_grpsub.retrieve( ldtm_start, ldtm_end, ls_grpcomp )

// ดึงข้อมูลคงเหลือของเดือนที่แล้วมาเป็นยอดยกมาเดือนนี้
if li_month = 1 then
	li_prioryear	= li_year - 1
	li_priormth	= 12
else
	li_prioryear	= li_year
	li_priormth	= li_month - 1
end if

select		compbal_amt
into		:li_compbf
from		mbstatcompgrp
where	( stat_year		= :li_prioryear ) and
			( stat_month	= :li_priormth ) and
			( membgroup_code	= :ls_grpcomp )
using		itr_sqlca ;

// หายอดคนขอผ่อนผัน
select		count( distinct member_no )
into		:li_compadd
from		mbreqchangegroup
where	( apv_date	between :ldtm_start and :ldtm_end ) and
			( new_group		= :ls_grpcomp ) and
			( request_status	= 1 )
using		itr_sqlca ;

// หายอดคนครบกำหนดผ่อนผัน
select		count( distinct member_no )
into		:li_compsub
from		mbreqchangegroup
where	( apv_date	between :ldtm_start and :ldtm_end ) and
			( old_group		= :ls_grpcomp ) and
			( request_status	= 1 )
using		itr_sqlca ;

if isnull( li_compbf ) then li_compbf = 0
if isnull( li_compadd ) then li_compadd = 0
if isnull( li_compsub ) then li_compsub = 0

li_compbal	= li_compbf + ( li_compadd - li_compsub )

lds_statcompgrp.reset()

ll_row	= lds_statcompgrp.insertrow( 0 )

lds_statcompgrp.setitem( ll_row, "stat_year", li_year )
lds_statcompgrp.setitem( ll_row, "stat_month", li_month )
lds_statcompgrp.setitem( ll_row, "membgroup_code", ls_grpcomp )
lds_statcompgrp.setitem( ll_row, "statstart_date", ldtm_start )
lds_statcompgrp.setitem( ll_row, "statend_date", ldtm_end )
lds_statcompgrp.setitem( ll_row, "compbegin_amt", li_compbf )
lds_statcompgrp.setitem( ll_row, "compadd_amt", li_compadd )
lds_statcompgrp.setitem( ll_row, "compsub_amt", li_compsub )
lds_statcompgrp.setitem( ll_row, "compbal_amt", li_compbal )

lstr_statcomp.xml_statdetail		= inv_dwxmliesrv.of_xmlexport( lds_statcompgrp )
lstr_statcomp.xml_compadd		= inv_dwxmliesrv.of_xmlexport( lds_grpadd )
lstr_statcomp.xml_compsub		= inv_dwxmliesrv.of_xmlexport( lds_grpsub )

return 1
end function

public function integer of_savestat_mbcompgrp (ref str_mbstatcompgrp lstr_statcomp) throws Exception;string		ls_grpcomp
long		ll_row
integer	li_year, li_month, li_prioryear, li_priormth
integer	li_compbal, li_compbf, li_compadd, li_compsub
datetime	ldtm_start, ldtm_end
n_ds		lds_statcompgrp, lds_grpadd, lds_grpsub

lds_statcompgrp	= create n_ds
lds_statcompgrp.dataobject	= "d_mbsrv_stat_compgrp"
lds_statcompgrp.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( lds_statcompgrp, lstr_statcomp.xml_statdetail )

ll_row	= lds_statcompgrp.rowcount()

if ll_row <= 0 then
	ithw_exception.text	= "ไม่มีข้อมูลส่งเข้ามาบันทึกรายการสถิติคนขอผ่อนผัน"
	throw ithw_exception
end if

ls_grpcomp	= trim( lds_statcompgrp.getitemstring( ll_row, "membgroup_code" ) )
li_year		= lds_statcompgrp.getitemnumber( ll_row, "stat_year" )
li_month		= lds_statcompgrp.getitemnumber( ll_row, "stat_month" )

delete from mbstatcompgrp
where	( stat_year		= :li_year ) and
			( stat_month	= :li_month ) and
			( membgroup_code	= :ls_grpcomp )
using		itr_sqlca ;

if lds_statcompgrp.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลสถิติการขอผ่อนผันของสมาชิกไม่ได้~n~r"+ lds_statcompgrp.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function boolean of_isvalidmember (string as_coopid, string as_memno) throws Exception;/***********************************************************
<description>
	ตรวจสอบรหัสสังกัดที่ป้อน
</description>

<arguments>  
	as_grpcode		String		รหัสสังกัด
</arguments> 

<return> 
	Boolean		True = เป็นสังกัดที่มีอยู่จริง, False = ไม่พบสังกัด
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 13/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_mbname

as_memno	=	trim( as_memno )

select	memb_surname
into	:ls_mbname
from	mbmembmaster
where( member_no = :as_memno ) and
		(coop_id = :as_coopid)
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	return false
end if

return true
end function

private function integer of_postapv_mbnewexpense (string as_coopid, string as_memcoopid, string as_applno, string as_membno) throws Exception;string		ls_sqltext

ls_sqltext	= "insert into mbmembexpense " + &
			   "  ( coop_id,member_no,memcoop_id,		expense_code,		expense_bank,	expense_branch,		expense_accid ) " + &
			   "select  '"+as_coopid+"','"+as_membno+"','"+as_memcoopid+"', expense_code,	expense_bank,	expense_branch,	expense_accid " + &
			   "from mbreqapplexpense " + &
			   "where ( appl_docno = '"+as_applno+"'  and coop_id ='"+as_coopid+"')"
				
execute immediate :ls_sqltext using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	rollback using itr_sqlca ;
	ithw_exception.text = "พบข้อผิดพลาด ในการบันทึก MembExpense ( of_postapv_mbnewexpense ) "+ itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

public function integer of_openreq_chgmthshr (string as_coopid, string as_reqno, ref string as_xmlreq) throws Exception;n_ds		lds_reqmast

lds_reqmast	= create n_ds
lds_reqmast.dataobject	= "d_mbsrv_req_chgmthshr"
lds_reqmast.settransobject( itr_sqlca )

lds_reqmast.retrieve( is_coopcontrol ,as_reqno )

as_xmlreq			= inv_dwxmliesrv.of_xmlexport( lds_reqmast )

if isvalid(lds_reqmast) then destroy lds_reqmast

return 1
end function

public function integer of_getsharebase (string as_coopid, decimal adc_salaryamt, ref decimal adc_sharebase);/***********************************************************
<description> 
	หาค่าหุ้นสะสมต่อเดือนตามเกณฑ์เงินเดือน
</description>

<arguments>  
	adc_salaryamt			decimal		เงินเดือน 
	adc_sharebase (ref)	decimal		ค่าหุ้นฐานต่ำสุด	
</arguments> 

<return>
	decimal		ค่าหุ้นสะสมต่อเดือนตามเกณฑ์เงินเดือน
</return>

<usage>  
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
select	shsharetypemthrate.sharemonth_amt * shsharetype.share_value
into	:adc_sharebase
from	shsharetypemthrate, shsharetype
where( shsharetypemthrate.sharetype_code = shsharetype.sharetype_code ) and
		( shsharetypemthrate.coop_id = shsharetype.coop_id ) and
		( :adc_salaryamt between shsharetypemthrate.start_salary and shsharetypemthrate.end_salary ) and
		( shsharetypemthrate.coop_id  =:as_coopid)
using itr_sqlca ;		

if ( itr_sqlca.sqlcode <> 0 ) then
	adc_sharebase  = 0
end if

return 1
end function

public function decimal of_getshareunit (string as_coopid);dec{2}	ldc_unitshare

select		nvl( unitshare_value , 0 )
into		:ldc_unitshare
from		shsharetype
where	( sharetype_code	= '01' and coop_id =:as_coopid )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ldc_unitshare	= 10
end if

if isnull( ldc_unitshare ) then
	ldc_unitshare	= 10
end if

return ldc_unitshare
end function

public function integer of_setpausekeepup (string as_memcoopid, string as_memno, datetime adtm_opedate) throws Exception;integer	li_payshrstatus, li_cntlon, li_cntlonpay, li_pausekeep

// สถานะการหยุดออกเก็บ
select		pausekeep_flag
into		:li_pausekeep
from		mbmembmaster
where	( member_no	= :as_memno  and coop_id =:as_memcoopid)
using		itr_sqlca ;

// สถานะการส่งหุ้น
select		payment_status
into		:li_payshrstatus
from		shsharemaster
where	( member_no	= :as_memno and coop_id =:as_memcoopid )
using	itr_sqlca ;

// สถานะการส่งหนี้
select		count( member_no ),
			sum( case when payment_status <> -1 then 1 else 0 end )
into		:li_cntlon, :li_cntlonpay
from		lncontmaster
where	( member_no	= :as_memno ) and
			( ( principal_balance > 0 ) or ( interest_arrear > 0 ) and memcoop_id =:as_memcoopid)
using	itr_sqlca ;

// ถ้าสถานะการหยุดออกเก็บ เป็นเก็บอยู่
if li_pausekeep = 0 then
	if li_payshrstatus = -1 and li_cntlonpay = 0 then
		update	mbmembmaster
		set			pausekeep_flag		= 1,
					pausekeep_date	= :adtm_opedate
		where	( member_no		= :as_memno and coop_id =:as_memcoopid )
		using		itr_sqlca ;
	end if
else
	if li_payshrstatus = 1 or li_cntlonpay > 0 or li_cntlon = 0 then
		update	mbmembmaster
		set			pausekeep_flag		= 0,
					pausekeep_date	= :adtm_opedate
		where	( member_no		= :as_memno and coop_id =:as_memcoopid )
		using		itr_sqlca ;
	end if
end if

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงสถานะการหยุดออกใบเสร็จได้ "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

private function string of_chkoldreq_chggrp (string as_memcoopid, string as_memno);/***********************************************************
<description>
	ตรวจสอบว่ามีใบคำขอเก่าที่ยังไม่อนุมัติหรือไม่
</description>

<arguments>  
	as_memno		String	 	เลขสมาชิก
</arguments> 

<return> 
	String			เลขที่ใบคำขอล่าสุดที่ยังไม่อนุมัติ
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 13/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_docno,ls_coopid
integer	li_status

li_status  = STATUS_PENDING

select	 chggroup_docno,coop_id
into	:ls_docno,:ls_coopid
from 	mbreqchangegroup
where ( member_no	=	:as_memno ) and 
		 ( request_status = :li_status ) and
		 ( memcoop_id	=	:as_memcoopid )and
		 (request_status = 8)
using itr_sqlca ;
 
if isnull( ls_docno ) then
	ls_docno =""
//else
//	ithw_exception.text = "มีใบคำ ("+ls_docno+") ขอรออนุมัติอยู่ที่สาขา( "+ls_coopid+" ) กรุณาตรวจสอบ"
//	throw ithw_exception
end if

return trim( ls_docno )
//return 1
end function

public function integer of_initreq_chgmthshr (string as_coopid, string as_memno, string as_memcoopid, datetime adtm_reqdate, ref string as_xmlreq) throws Exception;/***********************************************************
<description>
	ดึงข้อมูลเริ่มต้นสำหรับใบคำขอเปลี่ยนแปลงค่าหุ้นตามเลขสมาชิกที่ป้อน
</description>

<arguments>  
	as_memno		String			เลขสมาชิก
</arguments> 

<return> 
	String				Xml ใบคำขอที่มีข้อมูลแล้ว
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 11/10/2010 by MiT
</usage> 
***********************************************************/

// ใบคำขอเปลี่ยนแปลงค่าหุ้น
string		ls_xmlreq, ls_oldreqno,ls_sharetype,ls_reqcoopid,ls_docno
integer	li_rowcount
dec{3}	ldc_shrbeginamt, ldc_shrstkamt, ldc_periodbase, ldc_periodshr
dec{2}	ldc_unitshare
boolean	lb_err = false
n_ds		lds_req, lds_info

this.of_setsrvdwxmlie( true )

if not this.of_isvalidmember( as_memcoopid,as_memno ) then
	ithw_exception.text = "ไม่พบข้อมูลสมาชิกที่ท่านป้อน เลข( "+as_memno+") กรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

// ตรวจสอบว่ามีคำขอที่ยังรออนุมัติหรือไม่ ถ้ามีก็เปิดมันขึ้นมาซะ

select	payadjust_docno ,coop_id
into	:ls_docno,:ls_reqcoopid
from	shpaymentadjust
where ( member_no = :as_memno ) and
		 ( shrpayadj_status = 8 ) and
		 (memcoop_id =:is_coopcontrol)
using itr_sqlca ;
 
if isnull( ls_docno ) then
	ls_docno =""
end if

if len( ls_docno ) > 0 then
	ithw_exception.text = "มีใบคำขอ ("+ls_docno+") รออนุมัติอยู่ที่สาขา( "+ls_reqcoopid+" ) กรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

//ls_oldreqno	= this.of_chkoldreq_chgmthshr( as_memno )
//
//if len( ls_oldreqno ) > 0 then
//	this.of_openreq_chgmthshr( as_coopid,ls_oldreqno, as_xmlreq )
//	return 1
//end if

lds_req = create n_ds
lds_req.dataobject = "d_mbsrv_req_chgmthshr"
lds_req.settransobject( itr_sqlca )

// ดึงข้อมูลสำหรับ initial เป็นใบเปลี่ยนแปลงค่าหุ้น
lds_info = create n_ds
lds_info.dataobject = "d_mbsrv_info_memdet"
lds_info.settransobject( itr_sqlca )

li_rowcount = lds_info.retrieve( is_coopcontrol ,as_memno )

if ( li_rowcount < 1 ) then
	ithw_exception.text = "ไม่พบเลขสมาชิกที่ป้อน ("+as_memno+") กรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

ldc_unitshare		= lds_info.getitemdecimal( 1, "unitshare_value" )
ldc_shrbeginamt	= lds_info.getitemdecimal( 1, "sharebegin_amt" )
ldc_shrstkamt		= lds_info.getitemdecimal( 1, "sharestk_amt" )
ldc_periodbase		= lds_info.getitemdecimal( 1, "periodbase_amt" )
ldc_periodshr		= lds_info.getitemdecimal( 1, "periodshare_amt" )
ls_sharetype		= lds_info.getitemstring( 1, "sharetype_code" )

lds_req.insertrow( 0 )
lds_req.object.prename_desc[ 1 ]		= lds_info.object.prename_desc[ 1 ]
lds_req.object.memb_name[ 1 ]		= lds_info.object.memb_name[ 1 ]
lds_req.object.memb_surname[ 1 ]	= lds_info.object.memb_surname[ 1 ]
lds_req.object.membgroup_code[ 1 ]	= lds_info.object.membgroup_code[ 1 ]
lds_req.object.membgroup_desc[ 1 ]	= lds_info.object.membgroup_desc[ 1 ]
lds_req.object.salary_amount[ 1 ]		= lds_info.object.salary_amount[ 1 ]
lds_req.object.member_date[ 1 ]		= lds_info.object.member_date[ 1 ]
lds_req.object.old_paystatus[ 1 ]		= lds_info.object.payment_status[ 1 ]
lds_req.object.new_paystatus[ 1 ]		= lds_info.object.payment_status[ 1 ]
lds_req.object.shrlast_period[ 1 ]		= lds_info.object.last_period[ 1 ]
lds_req.object.member_status[ 1 ]	= lds_info.object.member_status[ 1 ]
lds_req.object.resign_status[ 1 ]		= lds_info.object.resign_status[ 1 ]

lds_req.setitem( 1, "coop_id", is_coopcontrol )
lds_req.setitem( 1, "member_no", as_memno )
lds_req.setitem( 1, "memcoop_id", as_memcoopid )
lds_req.setitem( 1, "sharebegin_value", ldc_shrbeginamt * ldc_unitshare )
lds_req.setitem( 1, "sharestk_value", ldc_shrstkamt * ldc_unitshare )
lds_req.setitem( 1, "periodbase_value", ldc_periodbase * ldc_unitshare )
lds_req.setitem( 1, "old_periodvalue", ldc_periodshr * ldc_unitshare )
lds_req.setitem( 1, "new_periodvalue", ldc_periodshr * ldc_unitshare )
lds_req.setitem( 1, "payadjust_date", adtm_reqdate )
//lds_req.setitem( 1, "sharetype",ls_sharetype )

as_xmlreq = inv_dwxmliesrv.of_xmlexport( lds_req )

objdestroy:
this.of_setsrvdwxmlie( false )

if isvalid(lds_req) then destroy lds_req
if isvalid(lds_info) then destroy lds_info

if lb_err then
	ithw_exception.text = "n_cst_membsrv_allrequest.of_initreq_chgmthshr()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

private function integer of_postapv_chgmthshr (string as_coopid, string as_reqno, string as_apvid, datetime adtm_apvdate) throws Exception;string			ls_memno, ls_reqno,ls_memcoopid
integer		li_paystatus, li_chgadd, li_chglow, li_chgstop, li_chgcont
integer		li_flagadd, li_flaglow, li_flagstop, li_flagcont
dec{3}		ldc_shrperiodamt
dec{2}		ldc_unitshare
datetime		ldtm_apvdate

select		member_no, chgadd_flag, chglow_flag, chgstop_flag, chgcont_flag, new_paystatus, new_periodvalue
into		:ls_memno, :li_flagadd, :li_flaglow, :li_flagstop, :li_flagcont, :li_paystatus, :ldc_shrperiodamt
from		shpaymentadjust
where	( payadjust_docno	= :as_reqno ) and
			(coop_id				=:as_coopid)
using		itr_sqlca ;

if ( li_flagstop <> 1 ) then
	setnull( adtm_apvdate )
end if

// hard by godji
ls_memcoopid	= as_coopid

// แปลงค่าให้เป็นจำนวนหุ้น
ldc_unitshare 		= this.of_getshareunit(ls_memcoopid)
ldc_shrperiodamt	= ldc_shrperiodamt / ldc_unitshare

// ดึงจำนวนครั้งการเปลี่ยนแปลง
select	chgpayadd_amt, chgpaylow_amt, 
		chgpaystop_amt, chgpaycont_amt
into	:li_chgadd, :li_chglow,
		:li_chgstop, :li_chgcont
from	shsharemaster
where( member_no		= :ls_memno ) and
		( sharetype_code	= '01'  and coop_id =:ls_memcoopid)
using itr_sqlca ;

if isnull( li_chgadd ) then li_chgadd = 0
if isnull( li_chglow ) then li_chglow = 0
if isnull( li_chgstop ) then li_chgstop = 0
if isnull( li_chgcont ) then li_chgcont = 0

li_chgadd	+= li_flagadd
li_chglow		+= li_flaglow
li_chgstop	+= li_flagstop
li_chgcont	+= li_flagcont

// ปรับปรุงสถานะลงใน master
update	shsharemaster
set			payment_status	= :li_paystatus,
			periodshare_amt	= :ldc_shrperiodamt,
			chgpayadd_amt	= :li_chgadd,
			chgpaylow_amt 	= :li_chglow,
			chgpaystop_amt	= :li_chgstop,
			chgpaycont_amt	= :li_chgcont,
			paymentstop_date	= :adtm_apvdate
where	( member_no		= :ls_memno ) and
			( sharetype_code	= '01'  and coop_id =:ls_memcoopid)
using		itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text = "ไม่สามารถปรับปรุงข้อมูลการส่งหุ้นรายเดือนได้ ~n"+ itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ปรับสถานะการหยุดออกเก็บ
this.of_setpausekeepup( ls_memcoopid,ls_memno, adtm_apvdate )

return 1
end function

private function integer of_postapv_chgmembtype (string as_coopid, string as_reqno) throws Exception;string ls_memno, ls_membflag , ls_newmembtype,ls_memcoopid

select	member_no, membtype_flag , new_membtype, memcoop_id
into	:ls_memno, :ls_membflag,:ls_newmembtype,:ls_memcoopid
from	mbreqchangegroup
where( chggroup_docno		= :as_reqno and coop_id =:as_coopid  ) 
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่พบข้อมูลใบคำขอย้ายประเภทสมาชิก เลขที่ใบคำร้อง "+as_reqno+" กรุณาตรวจสอบ"
	throw ithw_exception
end if

if ls_membflag = 'Y' then
	// ปรับปรุงสังกัดสมาชิก
	update	mbmembmaster
	set			membtype_code 	= :ls_newmembtype
	where	( member_no		= :ls_memno and coop_id =:ls_memcoopid) 
	using		itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text = "ไม่สามารถปรับปรุงการย้ายประเภทสมาชิกเลขสมาชิกได้"
		ithw_exception.text += "~r~nเลขสมาชิก : " + ls_memno
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
		ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

return 1
end function

private function integer of_setsrvkpreq (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_kpreq ) or not isvalid( inv_kpreq ) then
		inv_kpreq	= create n_cst_keeping_request_all
		inv_kpreq.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_kpreq ) then
		destroy inv_kpreq
		return 1
	end if
end if

return 0
end function

public function integer of_initreq_chggrp (ref str_mbreqchggrp astr_mbreqchggrp) throws Exception;string		ls_oldreqno, ls_memno
string		ls_prename,	 ls_name, ls_surname
string		ls_groupcode, ls_groupdesc
string		ls_expcode, ls_expbank, ls_expbranch, ls_expaccid
string		ls_xmlmain
integer	li_rowcount
boolean	lb_err = false
n_ds		lds_req, lds_history

ls_memno		= astr_mbreqchggrp.member_no

// ตรวจสอบว่ามีคำขอที่ยังรออนุมัติหรือไม่
select	 max( chggroup_docno )
into	:ls_oldreqno
from	mbreqchangegroup
where( coop_id	=	:is_coopcontrol )
and	( member_no	=	:ls_memno )
and	( request_status = 8 )
using itr_sqlca ;

// ถ้ามีใบคำขออยู่ ก็เปิดมันขึ้นมาซะ
if len( trim( ls_oldreqno ) ) > 0 and not isnull( ls_oldreqno ) then
	
	astr_mbreqchggrp.regchgdoc_no	= ls_oldreqno
	
	try
		this.of_openreq_chggrp( astr_mbreqchggrp )
	catch( Exception lthw_erropen )
		ithw_exception.text	= lthw_erropen.text
		lb_err						= true
	end try
	
	if not lb_err then
		astr_mbreqchggrp.message		= "สมาชิกเลขที่ "+ls_memno+" มีใบคำขอย้ายหน่วยอยู่แล้ว โปรแกรมได้ทำการเปิดใบคำขอเดิมขึ้นมาให้"
	end if
	
	goto objdestroy
end if

// ดึงข้อมูลประกอบใบคำขอ
select		ft_memname( :is_coopcontrol , a.member_no ) as memname ,
			a.membgroup_code , ft_memgrp( :is_coopcontrol , a.membgroup_code ) as memgrp ,
			a.expense_code,		a.expense_bank, 		a.expense_branch,		a.expense_accid
into		:ls_name,				
			:ls_groupcode,			:ls_groupdesc,
			:ls_expcode,			:ls_expbank,			:ls_expbranch,				:ls_expaccid
from		mbmembmaster a
where	( a.coop_id				= :is_coopcontrol )
and		( a.member_no			= :ls_memno )
using itr_sqlca;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลรายละเอียดสมาชิกได้ : "+ls_memno+ " กรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

// ข้อมูลประกอบใบคำขอ
lds_req		= create n_ds
lds_req.dataobject		= "d_mbsrv_req_chggrp"

// รายการประวัติการย้ายสังกัด
lds_history	= create n_ds
lds_history.dataobject	= "d_mbsrv_req_chggrphistory"
lds_history.settransobject( itr_sqlca )
lds_history.retrieve( is_coopcontrol, ls_memno )

// รายละเอียดคำขอ
lds_req.insertrow( 0 )
lds_req.setitem( 1, "memcoop_id", is_coopcontrol )
lds_req.setitem( 1, "member_no", ls_memno )
lds_req.setitem( 1, "memname", ls_name )
lds_req.setitem( 1, "old_group", ls_groupcode )
lds_req.setitem( 1, "oldgrp_desc", ls_groupdesc )
lds_req.setitem( 1, "oldexp_code", ls_expcode )
lds_req.setitem( 1, "oldexp_bank", ls_expbank )
lds_req.setitem( 1, "oldexp_branch", ls_expbranch )
lds_req.setitem( 1, "oldexp_accid", ls_expaccid )

this.of_setsrvdwxmlie( true )
astr_mbreqchggrp.xml_reqdetail	= inv_dwxmliesrv.of_xmlexport( lds_req )
astr_mbreqchggrp.xml_reqhistory	= inv_dwxmliesrv.of_xmlexport( lds_history )

objdestroy:
if isvalid(lds_req) then destroy lds_req
if isvalid(lds_history) then destroy lds_history
this.of_setsrvdwxmlie( false )

if lb_err then
	ithw_exception.text = "n_cst_membsrv_allrequest.of_initreq_chggrp()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

public function integer of_savereq_chggrp (ref str_mbreqchggrp astr_mbreqchggrp) throws Exception;string		ls_docno, ls_memno , ls_expflg
string		ls_entryid
integer	li_apvimmediate, li_ret
datetime	ldtm_entrydate
boolean	lb_err = false
n_ds		lds_req

ls_entryid		= astr_mbreqchggrp.entry_id

lds_req	= create n_ds
lds_req.dataobject = "d_mbsrv_req_chggrp"
lds_req.settransobject( itr_sqlca ) 

this.of_setsrvdoccontrol( true )
this.of_setsrvdwxmlie( true )

try
	inv_dwxmliesrv.of_xmlimport( lds_req, astr_mbreqchggrp.xml_reqdetail )
	// ตรวจสอบข้อมูลก่อนบันทึก
	this.of_chkbeforesave_chggrp( lds_req )
catch( Exception lthw_errimp )
	ithw_exception.text	= lthw_errimp.text
	lb_err						= true
end try

if lb_err then goto objdestroy

// ตรวจสอบว่ามีเลขที่ใบคำขอหรือยัง
ls_docno 			= lds_req.getitemstring( 1, "chggroup_docno" )
ls_expflg				= lds_req.object.expchg_flag[ 1 ]
li_apvimmediate 	= lds_req.getitemnumber( 1, "apvflag" )

if trim( ls_docno ) = "" or isnull( ls_docno ) then
	
	ls_docno	= inv_docsrv.of_getnewdocno( is_coopcontrol, "MBCHGGROUP" )
	
	lds_req.setitem( 1, "coop_id" , is_coopcontrol )
	lds_req.setitem( 1, "chggroup_docno", ls_docno )
	lds_req.setitem( 1, "entry_date", datetime( today(), now() ) )
	lds_req.setitem( 1, "entry_bycoopid", is_coopid )
else
	this.of_setdsmodify( lds_req, 1, false )
end if

// บันทึกใบคำขอ
if lds_req.update() <> 1 then
	ithw_exception.text = "ไม่สามารถบันทึกใบคำขอย้ายสังกัดได้~n" + lds_req.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// อนุมัติเลยหรือไม่
if ( li_apvimmediate = 1 ) then
	
	try
		this.of_postapv_chggrp( is_coopcontrol  ,ls_docno, ls_expflg )
	catch( Exception ithw_error )
		lb_err = true
	end try
	if lb_err then Goto objdestroy
	
	update	mbreqchangegroup
	set			request_status		= 1
	where	( chggroup_docno	= :ls_docno and coop_id =:is_coopcontrol )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ไม่สามารถปรับปรุงสถานะใบคำขอเปลี่ยนแปลงสังกัดให้เป็นอนุมัติได้ ~n" + itr_sqlca.sqlerrtext
		lb_err = true ; Goto objdestroy
	end if
end if

this.of_setsrvdwxmlie( true )

objdestroy:
if isvalid(lds_req) then destroy lds_req

this.of_setsrvdoccontrol( false )
this.of_setsrvkpreq(false)
this.of_setsrvdwxmlie( false )

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_membsrv_allrequest.of_savereq_chggrp()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

return 1
end function

public function integer of_chk_reqtokpexp (string as_memcoop);integer li_tokpexp

select kc.reqchggrp_tokpexpense_flag 
into :li_tokpexp
from cmcoopmaster cm , kpconstant kc
where cm.coop_control = kc.coop_id
and cm.coop_id = :as_memcoop
using itr_sqlca;
if isnull( li_tokpexp ) or li_tokpexp < 1 then li_tokpexp = 0

return li_tokpexp
end function

public function integer of_openreq_chggrp (ref str_mbreqchggrp astr_mbreqchggrp) throws Exception;string		ls_reqno , ls_memno
n_ds		lds_reqmast, lds_reqhistory

lds_reqmast	= create n_ds
lds_reqmast.dataobject	= "d_mbsrv_req_chggrp"
lds_reqmast.settransobject( itr_sqlca )

lds_reqhistory	= create n_ds
lds_reqhistory.dataobject	= "d_mbsrv_req_chggrphistory"
lds_reqhistory.settransobject( itr_sqlca )

ls_reqno		= astr_mbreqchggrp.regchgdoc_no
ls_memno	= astr_mbreqchggrp.member_no

lds_reqmast.retrieve( is_coopcontrol, ls_reqno )
lds_reqhistory.retrieve( is_coopcontrol, ls_memno )

this.of_setsrvdwxmlie( true )
astr_mbreqchggrp.xml_reqdetail	= inv_dwxmliesrv.of_xmlexport( lds_reqmast )
astr_mbreqchggrp.xml_reqhistory	= inv_dwxmliesrv.of_xmlexport( lds_reqhistory )
this.of_setsrvdwxmlie( false )

if isvalid(lds_reqmast) then destroy lds_reqmast
if isvalid(lds_reqhistory) then destroy lds_reqhistory

return 1
end function

public function integer of_savereq_chgmthpay (ref str_mbreqchgmthpay astr_chgmthpay) throws Exception;/***********************************************************
<description>
	บันทึกใบคำขอเปลี่ยนแปลงส่งชำระ หุ้น หนี้ รายเดือน
</description>

<arguments>  
	ls_xmlreq				String			ข้อมูลใบคำขอเปลี่ยนแปลงค่าหุ้น
	as_entryid				String			ผู้บันทึกใบคำขอ
	adtm_entrydate		Datetime		วันที่บันทึกใบคำขอ
</arguments> 

<return> 
	Integer				1 = success, Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 11/10/2010 by Runja
</usage> 
***********************************************************/
// บันทึกใบคำขอเปลี่ยนแปลงการส่งรายเดือน
string		ls_entryid , ls_coopid
string		ls_docno, ls_chgmthtype, ls_chgmthprior
integer	li_index, li_count, li_seqno , li_sharecount , li_loancount
datetime	ldtm_entrydate , ldtm_chgmthdate

n_ds		lds_mbreqchgpay, lds_reqchgshare , lds_reqchgloan

ls_coopid						= astr_chgmthpay.coop_id
ls_entryid					= astr_chgmthpay.entry_id
ldtm_entrydate				= datetime( today(), now() )
ldtm_chgmthdate			= ldtm_entrydate

// master
lds_mbreqchgpay		= create n_ds
lds_mbreqchgpay.dataobject = "d_sl_mthpay_change"
lds_mbreqchgpay.settransobject( itr_sqlca ) 

// share
lds_reqchgshare	= create n_ds
lds_reqchgshare.dataobject = "d_sl_mthpay_change_share"
lds_reqchgshare.settransobject( itr_sqlca ) 

// loan
lds_reqchgloan	= create n_ds
lds_reqchgloan.dataobject = "d_sl_mthpay_change_loan"
lds_reqchgloan.settransobject( itr_sqlca ) 

// Import ข้อมูล Header
li_count	= inv_dwxmliesrv.of_xmlimport( lds_mbreqchgpay , astr_chgmthpay.xml_master )
if ( li_count < 1 ) then
	destroy( lds_mbreqchgpay )
	ithw_exception.text	= "ไม่มีข้อมูลการเปลี่ยนแปลงสถานะการส่งชำระรายเดือน สำหรับทำรายการบันทึก กรุณาตรวจสอบ"
	throw ithw_exception
end if

// Import ข้อมูล Detail
inv_dwxmliesrv.of_xmlimport( lds_reqchgshare, astr_chgmthpay.xml_detailshr )
inv_dwxmliesrv.of_xmlimport( lds_reqchgloan, astr_chgmthpay.xml_detaillon )

li_sharecount	= lds_reqchgshare.rowcount()
if ( li_sharecount < 1 ) then
	destroy( lds_reqchgshare )
	ithw_exception.text	= "ไม่มีรายละเอียดการเปลี่ยนแปลงสถานะการส่งชำระรายเดือน  สำหรับทำรายการบันทึก กรุณาตรวจสอบ"
	throw ithw_exception
end if

li_loancount	= lds_reqchgloan.rowcount()
if ( li_loancount < 1 ) then
	destroy( lds_reqchgloan )
	ithw_exception.text	= "ไม่มีรายละเอียดการเปลี่ยนแปลงสถานะการส่งชำระรายเดือน  สำหรับทำรายการบันทึก กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ตรวจสอบข้อมูลก่อนบันทึก
//this.of_chkbeforesave_chgmthpay( lds_mbreqchgpay , lds_reqchgshare ,lds_reqchgloan )

// ขอเลขที่เอกสาร
this.of_setsrvdoccontrol( true )
ls_docno	= inv_docsrv.of_getnewdocno( ls_coopid,"MBCHGPAYDOCNO" )
this.of_setsrvdoccontrol( false )

lds_mbreqchgpay.setitem( 1, "monthchgreq_docno", ls_docno )
lds_mbreqchgpay.setitem( 1, "monthchgreq_date", ldtm_chgmthdate )

for li_index = 1 to li_sharecount
	ls_chgmthtype		= lds_reqchgshare.getitemstring( li_index, "chgmthpay_type" )	
	lds_reqchgshare.setitem( li_index, "monthchgreq_docno", ls_docno )
	lds_reqchgshare.setitem( li_index, "seq_no", li_seqno )
next

for li_index = 1 to li_loancount
	ls_chgmthtype		= lds_reqchgloan.getitemstring( li_index, "chgmthpay_type" )	
	lds_reqchgloan.setitem( li_index, "monthchgreq_docno", ls_docno )
	lds_reqchgloan.setitem( li_index, "seq_no", li_seqno )
next

// เริ่มบันทึกข้อมูลและผ่านรายการ
if lds_mbreqchgpay.update() <> 1 then
	destroy (lds_reqchgloan )
	ithw_exception.text = "ไม่สามารถบันทึกใบคำขอเปลี่ยนแปลง การส่ง  หุ้น รายเดือนได้~n" 
	rollback using itr_sqlca ;
	throw ithw_exception	
end if

if lds_reqchgshare.update() <> 1 then
	destroy (lds_reqchgshare )
	ithw_exception.text = "ไม่สามารถบันทึกใบคำขอเปลี่ยนแปลง การส่ง หนี้ รายเดือนได้~n" 
	rollback using itr_sqlca ;
	throw ithw_exception	
end if

if lds_reqchgloan.update() <> 1 then
	destroy (lds_reqchgloan )
	ithw_exception.text = "ไม่สามารถบันทึกใบคำขอเปลี่ยนแปลง การส่ง หนี้ รายเดือนได้~n" 
	rollback using itr_sqlca ;
	throw ithw_exception	
end if

// ผ่านรายการ
try
//	this.of_postreq_chgmthpay( lds_mbreqchgpay , lds_reqchgshare ,lds_reqchgloan )
catch( Exception lthw_error )
	rollback using itr_sqlca ;
	throw lthw_error
end try

commit using itr_sqlca ;

destroy lds_mbreqchgpay
destroy lds_reqchgshare
destroy lds_reqchgloan

return 1
end function

public function integer of_initreq_chgmthpay (string as_coopid, string as_membno, string as_memcoopid, datetime as_chgreqdate, ref string as_mbreqchgpay_xml, ref string as_reqchgshare_xml, ref string as_reqchgloan_xml) throws Exception;/***********************************************************
<description>
	ดึงข้อมูลเริ่มต้นสำหรับใบคำขอเปลี่ยนแปลง การส่งชำระ 
</description>
<arguments>  
	ls_coopid			string			รหัสสหกรณ์
	ls_memno		String			เลขสมาชิก
</arguments> 

<return> 
	String				Xml ใบคำขอที่มีข้อมูลแล้ว
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 11/10/2010 by  Runja
</usage> 
***********************************************************/

// ใบคำขอเปลี่ยนแปลงสถานะการส่งเงินรายเดือน
string		ls_coopid , ls_memno, ls_shrlontype, ls_contno, ls_desc , ls_memcoop
integer	li_rowcount, li_lastperiod, li_paystatus, li_mbpaystatus, li_pausekeep, li_allperiod ,li_paymenttype
long		ll_row
dec{2}	ldc_shrcontbal, ldc_periodpayment, ldc_sharebase, ldc_apvamt , lsc_salary , ldc_sharestk , ldc_unitsharevalue  , ldc_periodbase
string		ls_xmlmaster , ls_xmldetailshare , ls_xmldetailloan
datetime	ldtm_reqdate ,ldtm_membdate
string		ls_groupcode, ls_groupname, ls_membtypecode, ls_membtypedesc 
string		ls_prename , ls_memname , ls_memsurname

n_ds		lds_mbreqchgpay, lds_reqchgshare , lds_reqchgloan  , lds_membinfo

ls_coopid			= as_coopid
ls_memno		= as_membno
ls_memcoop		= as_memcoopid
ldtm_reqdate	= as_chgreqdate

// ดึงข้อมูลสำหรับ initial รายละเอียดสมาชิก
lds_membinfo = create n_ds
lds_membinfo.dataobject = "d_mbsrv_info_memdet"
lds_membinfo.settransobject( itr_sqlca )

li_rowcount = lds_membinfo.retrieve( ls_coopid ,  ls_memno )

if ( li_rowcount < 1 ) then
	destroy lds_membinfo 
	ithw_exception.text = "ไม่พบข้อมูลเลขสมาชิกที่ป้อน ("+ls_memno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

lds_mbreqchgpay		= create n_ds
lds_mbreqchgpay.dataobject = "d_sl_mthpay_change"
lds_mbreqchgpay.settransobject( itr_sqlca )

lds_reqchgshare	= create n_ds
lds_reqchgshare.dataobject = "d_sl_mthpay_change_share"
lds_reqchgshare.settransobject( itr_sqlca )

lds_reqchgloan	= create n_ds
lds_reqchgloan.dataobject = "d_sl_mthpay_change_loan"
lds_reqchgloan.settransobject( itr_sqlca )

li_pausekeep			= lds_membinfo.getitemnumber( 1, "pausekeep_flag" )
lsc_salary				= lds_membinfo.getitemdecimal( 1, "salary_amount" ) 
ls_prename				= lds_membinfo.getitemstring ( 1, "prename_desc" )
ls_memname			= lds_membinfo.getitemstring ( 1, "memb_name" )
ls_memsurname		= lds_membinfo.getitemstring ( 1, "memb_surname" )
ldc_sharestk			= lds_membinfo.getitemdecimal ( 1, "sharestk_amt" ) 
ldc_unitsharevalue	=  lds_membinfo.getitemdecimal ( 1, "unitshare_value" ) 
ls_groupcode			=  lds_membinfo.getitemstring ( 1, "membgroup_code" ) 
ls_groupname			=  lds_membinfo.getitemstring ( 1, "membgroup_desc" ) 

if li_pausekeep = 1 then 
	li_mbpaystatus		= -1
else
	li_mbpaystatus		= 1
end if

// ส่วน Header
lds_mbreqchgpay.insertrow( 0 )
lds_mbreqchgpay.setitem( 1, "coop_id", ls_coopid )
lds_mbreqchgpay.setitem( 1, "member_no", ls_memno )
lds_mbreqchgpay.setitem( 1, "monthchgreq_date", ldtm_reqdate )
lds_mbreqchgpay.setitem( 1, "salary_amt", lsc_salary )
lds_mbreqchgpay.setitem( 1, "mem_name", ls_memname )
lds_mbreqchgpay.setitem( 1, "membgroup_code", ls_groupcode )
lds_mbreqchgpay.setitem( 1, "membgroup_desc", ls_groupname )
lds_mbreqchgpay.setitem( 1, "salary_amt", ldc_sharestk )

// ส่วนของหุ้น
declare shr_cur cursor for
select	shsharetype.sharetype_code,
		shsharetype.sharetype_desc,
		shsharemaster.sharestk_amt * shsharetype.unitshare_value,
		shsharemaster.last_period,
		shsharemaster.periodshare_amt * shsharetype.unitshare_value,
		shsharemaster.payment_status ,
		shsharemaster.periodbase_amt * shsharetype.unitshare_value	
from	shsharemaster, shsharetype
where( shsharemaster.sharetype_code = shsharetype.sharetype_code ) and
		( shsharemaster.coop_id  		     = :ls_coopid )  and 
		( shsharemaster.member_no	     = :ls_memno )
using	itr_sqlca ;

open shr_cur ;
	fetch shr_cur into :ls_shrlontype, :ls_desc, :ldc_shrcontbal, :li_lastperiod, :ldc_periodpayment, :li_paystatus , :ldc_periodbase ;
	do while itr_sqlca.sqlcode = 0 		
		ll_row	= lds_reqchgshare.insertrow( 0 )		
		// ข้อมูลเก่า
		lds_reqchgshare.setitem( ll_row, "monthchg_type", "SHR" )
		lds_reqchgshare.setitem( ll_row, "shrlontype_code", ls_shrlontype )
		lds_reqchgshare.setitem( ll_row, "description", ls_desc )
		lds_reqchgshare.setitem( ll_row, "period", li_lastperiod )
		lds_reqchgshare.setitem( ll_row, "oldperiod_payment", ldc_periodpayment )
		lds_reqchgshare.setitem( ll_row, "money_balance", ldc_shrcontbal )
		lds_reqchgshare.setitem( ll_row, "old_status", li_paystatus )
		lds_reqchgshare.setitem( ll_row, "operate_type", '00' )
		lds_reqchgshare.setitem( ll_row, "afterdue_payamt", ldc_periodpayment )
		lds_reqchgshare.setitem( ll_row, "afterdue_paystatus", li_paystatus )
		lds_reqchgshare.setitem( ll_row, "sharebase_amt", ldc_periodbase ) 
		
		fetch shr_cur into :ls_shrlontype, :ls_desc, :ldc_shrcontbal, :li_lastperiod, :ldc_periodpayment, :li_paystatus  ;
	loop
close shr_cur ;

// ดึงข้อมูลหนี้สำหรับ initial
declare lon_cur cursor for
select	loancontract_no,
		loantype_code,
		principal_balance,
		last_periodpay,
		period_payment,
		payment_status ,
		loanpayment_type
from	lncontmaster
where( member_no = :ls_memno ) and
		( coop_id		=  :ls_coopid ) and
		( principal_balance > 0 ) and
		( contract_status	> 0 )
using	itr_sqlca ;

open lon_cur ;
	fetch lon_cur into :ls_contno, :ls_shrlontype, :ldc_shrcontbal, :li_lastperiod, :ldc_periodpayment, :li_paystatus , :li_paymenttype  ;
	do while itr_sqlca.sqlcode = 0		
		
		ll_row	= lds_reqchgloan.insertrow( 0 )		
		ls_contno		= trim( ls_contno )
		ls_shrlontype	= trim( ls_shrlontype )
		
		// ข้อมูลเก่า
		lds_reqchgloan.setitem( ll_row, "monthchg_type", "LON" )
		lds_reqchgloan.setitem( ll_row, "shrlontype_code", ls_shrlontype )
		lds_reqchgloan.setitem( ll_row, "description", ls_contno )
		lds_reqchgloan.setitem( ll_row, "period", li_lastperiod )
		lds_reqchgloan.setitem( ll_row, "oldperiod_payment",ldc_periodpayment )
		lds_reqchgloan.setitem( ll_row, "old_status",li_paystatus )
		lds_reqchgloan.setitem( ll_row, "money_balance", ldc_shrcontbal )
		lds_reqchgloan.setitem( ll_row, "oldpayment_type", ls_shrlontype )
		lds_reqchgloan.setitem( ll_row, "oldpayment_type", li_paymenttype ) 
		
		fetch lon_cur into :ls_contno, :ls_shrlontype, :ldc_shrcontbal, :li_lastperiod, :ldc_periodpayment, :li_paystatus ;
	loop
close lon_cur ;

//ls_xmlmaster				=  inv_dwxmliesrv.of_xmlexport( lds_mbreqchgpay )
//ls_xmldetailshare		=  inv_dwxmliesrv.of_xmlexport( lds_reqchgshare )
//ls_xmldetailloan			=  inv_dwxmliesrv.of_xmlexport( lds_reqchgloan )

as_mbreqchgpay_xml		= lds_mbreqchgpay.describe( "Datawindow.Data.XML" )
as_reqchgshare_xml		= lds_reqchgshare.describe( "Datawindow.Data.XML" )
as_reqchgloan_xml		= lds_reqchgloan.describe( "Datawindow.Data.XML" )

destroy lds_membinfo
destroy lds_reqchgshare
destroy lds_reqchgloan

return 1
end function

public function integer of_savereq_mbnew (ref str_mbreqnew astr_mbreqnew) throws Exception;string		ls_appldocno, ls_entryid
long		ll_count, ll_row
dec{3}	ldc_shrunit, ldc_shrbasevalue, ldc_shrperiodvalue
boolean	lb_error = false
datetime	ldtm_entrydate
n_ds		lds_mbdetail, lds_gain, lds_moneytr

ls_entryid		= astr_mbreqnew.entry_id

// สร้าง DS ไว้บันทึก
lds_mbdetail	= create n_ds
lds_mbdetail.dataobject	= "d_mbsrv_req_appl"
lds_mbdetail.settransobject( itr_sqlca )

lds_gain 	= create n_ds
lds_gain.dataobject	= "d_mbsrv_req_applgain"
lds_gain.settransobject( itr_sqlca )

lds_moneytr 	= create n_ds
lds_moneytr.dataobject	= "d_mbsrv_req_applmoneytr"
lds_moneytr.settransobject( itr_sqlca )

// นำเข้าข้อมูล
try
	this.of_setsrvdwxmlie( true )
	inv_dwxmliesrv.of_xmlimport( lds_mbdetail, astr_mbreqnew.xml_mbdetail, false, false )
	inv_dwxmliesrv.of_xmlimport( lds_moneytr, astr_mbreqnew.xml_mbmoneytr )
	inv_dwxmliesrv.of_xmlimport( lds_gain, astr_mbreqnew.xml_mbgain )
catch( Exception lthw_errimp )
	ithw_exception.text	= lthw_errimp.text
	lb_error					= true
end try

if lb_error then
	goto objdestroy
end if

// ตรวจสอบข้อมูลใบสมัครก่อนทำการบันทึก
//this.of_chkbeforesave_mbnew( lds_mbdetail, lds_mbshare )

// ตรวจสอบว่าเป็นการบันทึกใหม่หรือปรับปรุงข้อมูล
ls_appldocno	= trim( lds_mbdetail.getitemstring( 1, "appl_docno" ) )

if lower( ls_appldocno ) = "auto" or isnull( ls_appldocno ) or ls_appldocno = "" then
	// ขอเลขที่เอกสาร
	this.of_setsrvdoccontrol( true )
	ls_appldocno	= inv_docsrv.of_getnewdocno( is_coopcontrol, "MBAPPLDOCNO" )
	this.of_setsrvdoccontrol( false )
	
	// ให้ค่าเลขที่เอกสารส่วน Master
	lds_mbdetail.setitem( 1, "coop_id", is_coopcontrol )
	lds_mbdetail.setitem( 1, "appl_docno", ls_appldocno )
	lds_mbdetail.setitem( 1, "entry_id", ls_entryid )
	lds_mbdetail.setitem( 1, "entry_date", datetime( today() , now() ) )
	lds_mbdetail.setitem( 1, "entry_bycoopid", is_coopid )
	
	
else
	this.of_setdsmodify( lds_mbdetail, 1, false )
	delete from mbreqapplgain where coop_id = :is_coopcontrol and appl_docno = :ls_appldocno
	using itr_sqlca;
	delete from mbreqapplmoneytr where coop_id = :is_coopcontrol and appl_docno = :ls_appldocno
	using itr_sqlca;		
end if

// ส่วนของผู้รับโอนผลประโยชน์
	for ll_row = 1 to lds_gain.rowcount()
		lds_gain.setitem( ll_row, "coop_id", is_coopcontrol )
		lds_gain.setitem( ll_row, "appl_docno", ls_appldocno )
	next
	
	// ส่วนของการรับจ่าย
	for ll_row = 1 to lds_moneytr.rowcount()
		lds_moneytr.setitem( ll_row, "coop_id", is_coopcontrol )
		lds_moneytr.setitem( ll_row, "appl_docno", ls_appldocno )
	next
// -----------------------
// เริ่มกระบวนการบันทึก
// -----------------------
// บันทึก Master
if lds_mbdetail.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบสมัครสมาชิกไม่ได้  "
	ithw_exception.text	+= ls_appldocno +"~n~r"+ lds_mbdetail.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// บันทึกผู้รับโอนผลประโยชน์
if lds_gain.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบสมัครสมาชิกส่วนผู้รับผลประโยชน์ไม่ได้  "
	ithw_exception.text	+= ls_appldocno +"~n~r"+ lds_gain.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// บันทึก Moneytr
if lds_moneytr.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบสมัครสมาชิกส่วนการรับจ่ายเงินไม่ได้  "
	ithw_exception.text	+= ls_appldocno +"~n~r"+ lds_moneytr.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

objdestroy:
if isvalid(lds_mbdetail) then destroy lds_mbdetail
if isvalid(lds_gain) then destroy lds_gain
if isvalid(lds_moneytr) then destroy lds_moneytr

this.of_setsrvdwxmlie( false )

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
	return -1
else
	commit using itr_sqlca ;
end if

return 1
end function

public function boolean of_isvalidmbgroup (string as_grpcode) throws Exception;/***********************************************************
<description>
	ตรวจสอบรหัสสังกัดที่ป้อน
</description>

<arguments>  
	as_grpcode		String		รหัสสังกัด
</arguments> 

<return> 
	Boolean		True = เป็นสังกัดที่มีอยู่จริง, False = ไม่พบสังกัด
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 13/10/2010 by MiT
</usage> 
***********************************************************/
string	ls_grpdesc

as_grpcode	= trim( as_grpcode )

select		membgroup_desc
into		:ls_grpdesc
from		mbucfmembgroup
where	coop_id				= :is_coopcontrol
and		membgroup_code = :as_grpcode
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then 
	return false
end if

return true
end function

public function integer of_initlist_apvchggrp (ref str_mbreqchggrp astr_mbreqchggrp) throws Exception;/***********************************************************
<description>
	แสดงรายการใบคำขอย้ายสังกัดที่ยังไม่ได้ผ่านรายการ
</description>

<arguments>  

</arguments> 

<return> 
	String		Xml รายการใบคำขอย้ายสังกัดที่ยังไม่ได้ผ่านรายการ
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 13/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_xmlreqopt
string		ls_column , ls_tag , ls_columntyp , ls_value , ls_sqlext
string		ls_sql
integer	li_num_cols , li_index
datetime	ldtm_date
boolean 	lb_err = false
n_ds		lds_reqopt , lds_reqlist

lds_reqopt	= create n_ds
lds_reqopt.dataobject	= "d_mbsrv_list_apvchggrp_opt"
lds_reqopt.settransobject( itr_sqlca )

lds_reqlist	= create n_ds
lds_reqlist.dataobject	= "d_mbsrv_list_apvchggrp"
lds_reqlist.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( true )

ls_xmlreqopt		= astr_mbreqchggrp.xml_reqopt

inv_dwxmliesrv.of_xmlimport( lds_reqopt , ls_xmlreqopt )

li_num_cols 	= Integer (lds_reqopt.Describe ( "DataWindow.Column.Count" )) 

for li_index = 1 to li_num_cols
	ls_column 		= trim(lds_reqopt.Describe ( "#" + String(li_index) + ".Name" ))
	ls_tag				= trim(lds_reqopt.Describe ( "#" + String(li_index) + ".Tag" ))
	ls_columntyp	= lds_reqopt.Describe ( "#" + String(li_index) + ".ColType" )
	ls_columntyp	= upper( left( lds_reqopt.Describe ( "#" + String(li_index) + ".ColType" ) , 4 ) )
	choose case ls_columntyp
		case "CHAR"
			if lower( right( ls_column , 4 ) ) = "date" then continue ;// หมายเหตุ เป็นวันที่ให้ข้ามไป ให้ใช้จาก Type DateTime
			ls_value		= lds_reqopt.getitemstring( 1 , ls_column )
			if lower(right( ls_tag , 4 )) = "like" then ls_value = "%" + ls_value + "%"
			ls_value		= "'"+ ls_value + "'"
		case "DECI"
			ls_value		= string( lds_reqopt.getitemdecimal( 1 , ls_column ) )
			if lower(right( ls_tag , 4 )) = "like" then ls_value = "%" + ls_value + "%"
		case "DATE"
			ldtm_date	= lds_reqopt.getitemdatetime( 1 , ls_column )
			if isnull( ldtm_date ) then continue ;
			ls_value		= string( ldtm_date , "dd/mm/yyyy" )
			ls_value		= "to_date( '" + ls_value + "' , 'dd/mm/yyyy' ) "
	end choose
	
	if (not IsNull(ls_value)) and trim(ls_value) <> "" then ls_sqlext += " and " + ls_tag + " " + ls_value + " "
	
next

ls_sql		= lds_reqlist.getsqlselect()

ls_sql		+= ls_sqlext + " and mbreqchangegroup.coop_id = " + is_coopcontrol
ls_sql		+= ls_sqlext + " and mbreqchangegroup.request_status = 8 "

if lds_reqlist.setsqlselect( ls_sql ) <> 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการนำเข้าข้อมูล(0.2)"
	ithw_exception.text += "~r~nเงื่อนไขการดึงข้อมูลใบคำขอโอนย้ายสังกัดสมาชิก"
	ithw_exception.text += "~r~n" + lds_reqlist.of_geterrormessage()
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

if lds_reqlist.retrieve() < 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการดึงข้อมูล(0.5)"
	ithw_exception.text += "~r~nไม่พบข้อมูลใบคำขอโอนย้ายสังกัดสมาชิก"
	ithw_exception.text += "~r~n" + lds_reqlist.of_geterrormessage()
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

astr_mbreqchggrp.xml_reqlist = inv_dwxmliesrv.of_xmlexport( lds_reqlist )

objdestroy:
if isvalid(lds_reqopt) then destroy lds_reqopt
if isvalid(lds_reqlist) then destroy lds_reqlist

this.of_setsrvdwxmlie( false )

if lb_err then
	ithw_exception.text = "n_cst_divsrv_operate.of_initlist_apvchggrp()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

private function string of_initreq_mbresignhead (n_ds ads_data, string as_memno, datetime adtm_reqdate) throws Exception;string		ls_prename, ls_name, ls_surname, ls_grpcode, ls_grpdesc
string		ls_xmlhead
dec{2}	ldc_sharestkvalue
boolean	lb_err = false

ads_data.reset()
ads_data.dataobject	= "d_mbsrv_req_resign"
 
select	a.prename_desc,		b.memb_name,		b.memb_surname,
		b.membgroup_code,	c.membgroup_desc,	d.sharestk_amt * e.unitshare_value
into	:ls_prename,			:ls_name,				:ls_surname,
		:ls_grpcode,				:ls_grpdesc,				:ldc_sharestkvalue
from	mbucfprename a, mbmembmaster b, mbucfmembgroup c, 
		shsharemaster d, shsharetype e
where( a.prename_code = b.prename_code ) and
		( b.membgroup_code = c.membgroup_code ) and
		( b.coop_id = c.coop_id ) and
		( b.member_no = d.member_no ) and
		( b.coop_id = d.coop_id ) and
		( d.sharetype_code = e.sharetype_code ) and
		( d.coop_id = e.coop_id ) and
		( b.member_no = :as_memno ) and
		( b.coop_id = :is_coopcontrol )
using itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text = "ไม่พบเลขสมาชิกที่ป้อน "+as_memno+"  "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

ads_data.insertrow( 0 )
ads_data.setitem( 1, "coop_id", is_coopid )
ads_data.setitem( 1, "member_no", as_memno )
ads_data.setitem( 1, "prename_desc", ls_prename )
ads_data.setitem( 1, "memb_name", ls_name )
ads_data.setitem( 1, "memb_surname", ls_surname )
ads_data.setitem( 1, "membgroup_code", ls_grpcode )
ads_data.setitem( 1, "membgroup_desc", ls_grpdesc )
ads_data.setitem( 1, "sharestk_amount", ldc_sharestkvalue )
ads_data.setitem( 1, "resignreq_date", adtm_reqdate )

ls_xmlhead		= inv_dwxmliesrv.of_xmlexport( ads_data )

return ls_xmlhead
end function

private function string of_initreq_mbresignshare (n_ds ads_data, string as_memno, ref n_ds ads_sum) throws Exception;long 		ll_count, ll_newrow
string		ls_sharetype, ls_xmlshare
dec		ldc_sharestk, ldc_unitshare, ldc_shrmonth, ldc_rkeepshare
integer	li_shrstatus

select a.sharetype_code, a.sharestk_amt, b.unitshare_value,
		 a.sharemaster_status, a.periodshare_amt
into	:ls_sharetype, :ldc_sharestk, :ldc_unitshare, 
		:li_shrstatus, :ldc_shrmonth
from	 shsharemaster a , shsharetype b
where ( a.sharetype_code = b.sharetype_code ) and
		 ( a.coop_id = b.coop_id ) and
		 ( a.member_no = :as_memno and  a.coop_id = :is_coopcontrol) using itr_sqlca ;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text = "ไม่พบข้อมูลหุ้นเลขสมาชิก ("+as_memno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

ads_data.reset()
ads_data.dataobject = "d_mbsrv_req_resignshare"

ll_newrow = ads_data.insertrow( 0 )

ads_data.setitem( ll_newrow, "seq_no", 1 )
ads_data.object.coop_id[ ll_newrow ]				= is_coopcontrol
ads_data.object.sharetype_code[ ll_newrow ]		= ls_sharetype
ads_data.object.sharestk_amount[ ll_newrow ]	= ldc_sharestk
ads_data.object.sharestk_value[ ll_newrow ]		= ldc_sharestk * ldc_unitshare
ads_data.object.share_status[ ll_newrow ]			= li_shrstatus
ads_data.object.share_value[ ll_newrow ] 			= ldc_unitshare
ads_data.object.shrper_month[ ll_newrow ] 		= ldc_shrmonth * ldc_unitshare

ls_xmlshare	= inv_dwxmliesrv.of_xmlexport( ads_data )

// สรุป
ads_sum.setitem( 1, "shrper_month", ldc_shrmonth * ldc_unitshare ) 
ads_sum.setitem( 1, "share", ldc_sharestk * ldc_unitshare )

return ls_xmlshare
end function

private function string of_initreq_mbresignloan (n_ds ads_data, string as_memno, datetime adtm_reqdate, ref n_ds ads_sum) throws Exception;long 		ll_count, ll_row, ll_newrow
dec{2}	ldc_balance,ldc_intamt
string		ls_xmlloan,ls_contcoopid,ls_contno
datetime ldtm_bflastcalint,ldtm_calintto
n_ds		lds_loaninfo

lds_loaninfo = create n_ds
lds_loaninfo.dataobject = "d_mbsrv_info_memcont"
lds_loaninfo.settransobject( itr_sqlca )
ll_count = lds_loaninfo.retrieve( is_coopcontrol ,as_memno )

if ( ll_count < 1 ) then 
	if isvalid(lds_loaninfo) then destroy lds_loaninfo
	return ""
end if

ads_data.reset()
ads_data.dataobject = "d_mbsrv_req_resignloan"

for ll_row =  1 to ll_count
	ll_newrow = ads_data.insertrow( 0 )
	
	ads_data.setitem( ll_newrow, "seq_no", ll_row )
	ads_data.object.coop_id[ ll_newrow ]				= lds_loaninfo.object.coop_id[ ll_row ]
	ads_data.object.loancontract_no[ ll_newrow ]		= lds_loaninfo.object.loancontract_no[ ll_row ]
	ads_data.object.principal_balance[ ll_newrow ]	= lds_loaninfo.object.principal_balance[ ll_row ]
	ads_data.object.loantype_code[ ll_newrow ]		= lds_loaninfo.object.loantype_code[ ll_row ]	
	ads_data.object.interest_arrear[ ll_newrow ]		= lds_loaninfo.object.interest_arrear[ ll_row ]
	ads_data.object.calint_from[ ll_newrow ]			= lds_loaninfo.object.lastcalint_date[ ll_row ]	
	ads_data.object.calint_to[ ll_newrow ]				= lds_loaninfo.object.lastaccess_date[ ll_row ]		
	ads_data.object.loancont_status[ ll_newrow ]		= lds_loaninfo.object.contract_status[ ll_row ]	
	ads_data.object.return_interest[ ll_newrow ]		= lds_loaninfo.object.interest_return[ ll_row ]		
	ads_data.object.rkeep_interest[ ll_newrow ]		= lds_loaninfo.object.rkeep_interest[ ll_row ]			
	ads_data.object.rkeep_principal[ ll_newrow ]		= lds_loaninfo.object.rkeep_principal[ ll_row ]			
	ads_data.object.interest[ ll_newrow ]					= 0
	//aek
//	ls_contcoopid		= lds_loaninfo.object.coop_id[ ll_row ]
//	ls_contno			= lds_loaninfo.object.loancontract_no[ ll_row ]
//	ldc_balance			= lds_loaninfo.object.principal_balance[ ll_row ]
//	ldtm_bflastcalint	= lds_loaninfo.object.lastcalint_date[ ll_row ]
//	ldtm_calintto		= lds_loaninfo.object.lastaccess_date[ ll_row ]
//	ldc_intamt			= 0
	
//	inv_interest	= create n_cst_loansrv_interest
//	inv_interest.of_initservice( inv_transection )
		
//	ldc_intamt		= inv_interest.of_computeinterest( ls_contno, ldc_balance, ldtm_bflastcalint, adtm_reqdate )

next

ls_xmlloan = inv_dwxmliesrv.of_xmlexport( ads_data )

// สรุป
ldc_balance = ads_data.object.c_principal[ 1 ]
ads_sum.setitem( 1, "loan", ldc_balance )
ads_sum.setitem( 1, "loan_count", ll_count )

if isvalid(lds_loaninfo) then destroy lds_loaninfo

return ls_xmlloan
end function

private function string of_initreq_mbresigngrt (n_ds ads_data, string as_memno, ref n_ds ads_sum) throws Exception;string		ls_xmlgrt, ls_contno
long 		ll_count, ll_row, ll_newrow
dec{2}	ldc_collamt
n_ds 		lds_grtinfo

lds_grtinfo = create n_ds
lds_grtinfo.dataobject = "d_mbsrv_info_memgrt"
lds_grtinfo.settransobject( itr_sqlca )
ll_count = lds_grtinfo.retrieve( is_coopcontrol ,as_memno )

if ( ll_count < 1 ) then 
	if isvalid(lds_grtinfo) then destroy lds_grtinfo
	return ""
end if

ads_data.reset()
ads_data.dataobject = "d_mbsrv_req_resigngrt"

for ll_row =  1 to ll_count	
	ll_newrow	= ads_data.insertrow( 0 )
	
	ls_contno	= lds_grtinfo.object.loancontract_no[ ll_row ]
	
	ads_data.setitem( ll_newrow, "seq_no", ll_row )
	ads_data.object.coop_id[ ll_newrow ]				= is_coopcontrol
	ads_data.object.loancontract_no[ ll_newrow ]		= ls_contno
	ads_data.object.member_no[ ll_newrow ]			= lds_grtinfo.object.member_no[ ll_row ]
	ads_data.object.member_name [ ll_newrow ]		= lds_grtinfo.object.c_name[ ll_row ]	
	ads_data.object.withdrawable_amt[ ll_newrow ]	= lds_grtinfo.object.withdrawable_amt[ ll_row ]	
	ads_data.object.principal_balance[ ll_newrow ]	= lds_grtinfo.object.principal_balance[ ll_row ]		
	ads_data.object.coll_percent[ ll_newrow ]			= lds_grtinfo.object.coll_percent[ ll_row ]			
	ads_data.object.guarantee_amount[ ll_newrow ]	= lds_grtinfo.object.c_grtamt[ ll_row ]			
	ads_data.object.coll_status[ ll_newrow ]				= lds_grtinfo.object.coll_status[ ll_row ]	
next

ls_xmlgrt = inv_dwxmliesrv.of_xmlexport( ads_data )

// สรุป
ldc_collamt = ads_data.object.c_collamt[ 1 ]

ads_sum.setitem( 1, "coll_amt", ldc_collamt )
ads_sum.setitem( 1, "coll_count", ll_count )

if isvalid(lds_grtinfo) then destroy lds_grtinfo

return ls_xmlgrt
end function

private function string of_initreq_mbresigndept (n_ds ads_data, string as_memno, ref n_ds ads_sum) throws Exception;string		ls_xmldetp
long 		ll_count, ll_row, ll_newrow
dec{2}	ldc_balance
n_ds 		lds_deptinfo

lds_deptinfo = create n_ds
lds_deptinfo.dataobject = "d_mbsrv_info_memdept"
lds_deptinfo.settransobject( itr_sqlca )

ll_count = lds_deptinfo.retrieve( is_coopcontrol,as_memno )

if ( ll_count < 1 ) then return ""

ads_data.reset()
ads_data.dataobject = "d_mbsrv_req_resigndeposit"

for ll_row =  1 to ll_count
	ll_newrow = ads_data.insertrow( 0 )
	ads_data.setitem( ll_newrow, "seq_no", ll_row )
	ads_data.object.coop_id[ ll_newrow ]				= is_coopcontrol
	ads_data.object.deposit_no[ ll_newrow ]			= lds_deptinfo.object.deptaccount_no[ ll_row ]
	ads_data.object.deposit_name[ ll_newrow ]		= lds_deptinfo.object.deptaccount_name[ ll_row ]		
	ads_data.object.deposittype_code[ ll_newrow ]	= lds_deptinfo.object.depttype_code[ ll_row ]	
	ads_data.object.deposit_balance[ ll_newrow ]		= lds_deptinfo.object.prncbal[ ll_row ]
next

ls_xmldetp	= inv_dwxmliesrv.of_xmlexport( ads_data )

// สรุป
ldc_balance = ads_data.object.c_dep_balance[ 1 ]

ads_sum.setitem( 1, "deposit", ldc_balance )
ads_sum.setitem( 1, "dep_count", ll_count )

destroy( lds_deptinfo )

return ls_xmldetp
end function

private function integer of_postapv_mbresign (ref string as_reqno, string as_apvid, datetime adtm_apvdate) throws Exception;string		ls_memno, ls_resigncause,ls_check_coopid
integer	li_shrstatus, li_divflag, li_avgflag , li_resignfixflg
dec{3}	ldc_sharestk
datetime	ldtm_resigndtm
// ดึงข้อมูลสำหรับอนุมัติ
select 	ms.member_no, ms.resigncause_code, ms.dividend_flag, ms.average_flag , sm.sharestk_amt , 
			ms.resigndtfix_flag , ms.resigndtfix_date, ms.coop_id 
into		:ls_memno, :ls_resigncause, :li_divflag, :li_avgflag , :ldc_sharestk ,
			:li_resignfixflg , :ldtm_resigndtm, :ls_check_coopid
from		mbreqresign ms , shsharemaster sm
where	( ms.resignreq_docno		= :as_reqno 
and 		ms.coop_id 					= :is_coopcontrol )
and		ms.coop_id					= sm.coop_id
and 		ms.member_no			= sm.member_no
using	itr_sqlca ;

// ปรับปรุงทะเบียนหุ้น
if ( ldc_sharestk = 0 ) then
	li_shrstatus = -1	// ปิดทะเบียนหุ้น
else
	li_shrstatus = 8		// รอจัดสรร
end if

// นนท์แก้ วันอนุมัติลาออก pea

if ls_check_coopid <> '008001' then
	if li_resignfixflg = 1 then adtm_apvdate = ldtm_resigndtm
end if

update	shsharemaster
set			sharemaster_status = :li_shrstatus
where	( member_no = :ls_memno and coop_id =:is_coopcontrol )
using		itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	+= "ไม่สามารถเปลี่ยนสถานะทะเบียนหุ้น " + ls_memno +  " ได้ "+sqlca.sqlerrtext
	throw ithw_exception
end if

// ปรับปรุงข้อมูลทะเบียนสมาชิก
update	mbmembmaster
set			resign_status			= 1,
			resign_date 				= :adtm_apvdate , 
			resigncause_code 		= :ls_resigncause,
			droploanall_flag		= 1,
			dropgurantee_flag		= 1, 
			pausekeep_flag			= 1,
			pausekeep_date		= :adtm_apvdate,
			average_flag			= :li_avgflag, 
			dividend_flag			= :li_divflag
where	( member_no = :ls_memno  and coop_id =:is_coopcontrol)
using		itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0  ) then
	ithw_exception.text += "ไม่สามารถปรับปรุงข้อมูลทะเบียนสมาชิก " + ls_memno +  " ให้เป็นหุ้นค้างได้ "+sqlca.sqlerrtext
	throw ithw_exception
end if
	
return 1
end function

public function integer of_initlist_apvmbresign (ref str_mbreqresign astr_mbreqresign) throws Exception;string		ls_xmlreqopt
string		ls_column , ls_tag , ls_columntyp , ls_value , ls_sqlext
string		ls_sql
integer	li_num_cols , li_index
datetime	ldtm_date
boolean 	lb_err = false
n_ds		lds_reqopt, lds_reqlist

lds_reqopt	= create n_ds
lds_reqopt.dataobject	= "d_mbsrv_list_apvmbresign_opt"
lds_reqopt.settransobject( itr_sqlca )

lds_reqlist	= create n_ds
lds_reqlist.dataobject	= "d_mbsrv_list_apvmbresign"
lds_reqlist.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( true )

inv_dwxmliesrv.of_xmlimport( lds_reqopt , astr_mbreqresign.xml_reqopt )

li_num_cols 	= Integer (lds_reqopt.Describe ( "DataWindow.Column.Count" )) 

for li_index = 1 to li_num_cols
	ls_column 		= trim(lds_reqopt.Describe ( "#" + String(li_index) + ".Name" ))
	ls_tag				= trim(lds_reqopt.Describe ( "#" + String(li_index) + ".Tag" ))
	ls_columntyp	= lds_reqopt.Describe ( "#" + String(li_index) + ".ColType" )
	ls_columntyp	= upper( left( lds_reqopt.Describe ( "#" + String(li_index) + ".ColType" ) , 4 ) )
	choose case ls_columntyp
		case "CHAR"
			if lower( right( ls_column , 4 ) ) = "date" then continue ;// หมายเหตุ เป็นวันที่ให้ข้ามไป ให้ใช้จาก Type DateTime
			ls_value		= lds_reqopt.getitemstring( 1 , ls_column )
			if lower(right( ls_tag , 4 )) = "like" then ls_value = "%" + ls_value + "%"
			ls_value		= "'"+ ls_value + "'"
		case "DECI"
			ls_value		= string( lds_reqopt.getitemdecimal( 1 , ls_column ) )
			if lower(right( ls_tag , 4 )) = "like" then ls_value = "%" + ls_value + "%"
		case "DATE"
			ldtm_date	= lds_reqopt.getitemdatetime( 1 , ls_column )
			if isnull( ldtm_date ) then continue ;
			ls_value		= string( ldtm_date , "dd/mm/yyyy" )
			ls_value		= "to_date( '" + ls_value + "' , 'dd/mm/yyyy' ) "
	end choose
	
	if (not IsNull(ls_value)) and trim(ls_value) <> "" then ls_sqlext += " and " + ls_tag + " " + ls_value + " "
	
next

ls_sql		= lds_reqlist.getsqlselect()

ls_sql		+= ls_sqlext + " and mbreqresign.coop_id = " + is_coopcontrol
ls_sql		+= ls_sqlext + " and mbreqresign.resignreq_status = 8 "

if lds_reqlist.setsqlselect( ls_sql ) <> 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการนำเข้าข้อมูล(0.2)"
	ithw_exception.text += "~r~nเงื่อนไขการดึงข้อมูลใบคำขอลาออกสมาชิก"
	ithw_exception.text += "~r~n" + lds_reqlist.of_geterrormessage()
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

if lds_reqlist.retrieve() < 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการดึงข้อมูล(0.5)"
	ithw_exception.text += "~r~nไม่พบข้อมูลใบคำขอลาออกสมาชิก"
	ithw_exception.text += "~r~n" + lds_reqlist.of_geterrormessage()
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

astr_mbreqresign.xml_reqlist = inv_dwxmliesrv.of_xmlexport( lds_reqlist )

objdestroy:
if isvalid(lds_reqopt) then destroy lds_reqopt
if isvalid(lds_reqlist) then destroy lds_reqlist

this.of_setsrvdwxmlie( false )

if lb_err then
	ithw_exception.text = "n_cst_divsrv_operate.of_initlist_apvmbresign()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

public function integer of_saveapv_mbresign (ref str_mbreqresign astr_mbreqresign) throws Exception;/***********************************************************
<description>
	อนุมัติลาออก
</description>
</description>

<arguments>  
	as_xmlreqlist		String			รายการใบคำขอที่รอการอนุมัติ
	as_apvid				String			ผู้ทำรายการอนุมัติ
	adtm_apvdate		Datetime		วันที่อนุมัติ
</arguments> 

<return> 
	Integer				1 = success, Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 11/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_memno, ls_reqno, ls_resigncause, ls_apvid
integer	li_status, li_shrstatus, li_divflag, li_avgflag
long		ll_count, ll_find
dec{3}	ldc_sharestk
datetime	ldtm_apvdate
boolean	lb_err = false
n_ds		lds_apvlist

lds_apvlist	= create n_ds
lds_apvlist.dataobject	= "d_mbsrv_list_apvmbresign"
lds_apvlist.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( true )

// นำเข้าข้อมูล
ll_count		= inv_dwxmliesrv.of_xmlimport( lds_apvlist, astr_mbreqresign.xml_reqlist )
if ( ll_count < 1 ) then
	ithw_exception.text = "ไม่มีข้อมูลอนุมัติ สำหรับทำรายการได้"
	lb_err = true ; Goto objdestroy
end if

ll_find	 =  lds_apvlist.find( "resignreq_status <> 8", 1, ll_count )

do while ( ll_find > 0 )
	ls_memno		= lds_apvlist.getitemstring( ll_find, "member_no" )
	ls_reqno 			= lds_apvlist.getitemstring( ll_find, "resignreq_docno" )
	ls_resigncause	= lds_apvlist.getitemstring( ll_find, "resigncause_code" )
	ls_apvid			= lds_apvlist.object.apv_id[ ll_find ]
	li_status			= lds_apvlist.getitemnumber( ll_find, "resignreq_status" )
	li_divflag			= lds_apvlist.getitemnumber( ll_find, "dividend_flag" )
	li_avgflag		= lds_apvlist.getitemnumber( ll_find, "average_flag" )
	ldtm_apvdate	= lds_apvlist.getitemdatetime( ll_find, "apv_date" )
	
	// ถ้าอนุมัติ
	if ( li_status = 1 ) then
		try
			this.of_postapv_mbresign( ls_reqno, ls_apvid, ldtm_apvdate )
		catch(Exception lthw_error)
			ithw_exception.text += lthw_error.text
			lb_err = true
		end try
		if lb_err then Goto objdestroy
	end if
	
//	// ปรับปรุงสถานะใบคำขอ
//	// ไม่ว่าจะอนุมัติ หรือไม่อนุมัติ ก็ต้องจะยิงใส่  approve_id & approve_date
	update	mbreqresign
	set			resignreq_status	= :li_status, 
				apv_id				= :ls_apvid, 
				apv_date 			= :ldtm_apvdate,
				resigncause_code	= :ls_resigncause
	where	( resignreq_docno = :ls_reqno and coop_id = :is_coopcontrol)
	using		itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text	+= "ใบคำขอลาออกเลขที่ "+ls_reqno+" ไม่สามารถปรับปรุงสถานะได้ "+sqlca.sqlerrtext
		lb_err = true ; Goto objdestroy
	end if

	ll_find ++
	if ll_find > ll_count then
		exit
	end if
	ll_find	 =  lds_apvlist.find( "resignreq_status <> 8", ll_find, ll_count )
loop

objdestroy:
if isvalid(lds_apvlist) then destroy lds_apvlist

this.of_setsrvdwxmlie( false )

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_membsrv_allrequest.of_saveapv_chggrp()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

return 1
end function

private function integer of_postapv_mbnewmaster (string as_applno, string as_membno, datetime adtm_apvdate) throws Exception;string	ls_sqltext, ls_apvdtm
integer li_fixmbdate
datetime ldtm_fixmbdate

select membdatefix_flag, membdatefix_date
into :li_fixmbdate, :ldtm_fixmbdate
from mbreqappl
where coop_id = :is_coopcontrol
and appl_docno = :as_applno
using itr_sqlca ;

if li_fixmbdate = 1 and not isnull( ldtm_fixmbdate ) and string( ldtm_fixmbdate, "yyyymmdd") <> "19000101" then
	adtm_apvdate = ldtm_fixmbdate
end if

ls_apvdtm	= string( adtm_apvdate , 'dd/mm/yyyy' )

ls_sqltext	="insert into mbmembmaster  "+&
"( coop_id, member_no, prename_code,memb_name,memb_surname,membgroup_code, birth_date,member_date   "+&
",work_date,retry_date,sex,mariage_status,addr_no,addr_moo,addr_soi,addr_road,tambol_code,	amphur_code,province_code "+&
",addr_postcode,addr_phone,addr_mobilephone, curraddr_no,curraddr_moo,curraddr_soi,curraddr_village,curraddr_road,currtambol_code,curramphur_code,currprovince_code "+&
",curraddr_postcode,curraddr_phone ,addr_email,mem_telwork,mate_name,	card_person,position_code,	position_desc,level_code "+&
",department_code,salary_amount,salary_id,memref_flag,member_type,membtype_code,appl_docno,appltype_code "+&
",memb_ename,memb_esurname,member_ref,dropgurantee_flag,nationality, addr_village "+&
",member_status,resign_status,dead_status,firstfee_status,pausekeep_flag, father_name,mather_name  "+&
",mateaddr_phone,mateaddr_postcode,mateamphur_code,matetambol_code,mateaddr_no,mateaddr_moo,mateaddr_village,mateaddr_soi,mateaddr_road,expense_code , expense_bank , expense_branch , expense_accid, Incomeetc_amt, current_coopid, remark  )  "+&
"select coop_id,'"+as_membno+"',prename_code,memb_name,memb_surname,membgroup_code,  birth_date, to_date( '"+ls_apvdtm+"' , 'dd/mm/yyyy' ) "+&
",work_date,retry_date,sex,mariage, memb_addr,addr_group,soi, road, tambol_code, district_code, province_code "+&
",postcode,mem_tel, mem_telmobile, curraddr_no,curraddr_moo,curraddr_soi,curraddr_village,curraddr_road,currtambol_code,curramphur_code,currprovince_code "+&
",curraddr_postcode, curraddr_phone,email_address, mem_telwork,mate_name,  card_person,position_code, position_desc,level_code, "+&
"department_code,salary_amount,salary_id,memref_flag,member_type,membtype_code,appl_docno,appltype_code "+&
",memb_ename,memb_esurname,member_ref,0,nationality,mooban "+&
",1,0,0,0,0, father_name,mather_name  "+&
",mateaddr_phone,mateaddr_postcode,mateamphur_code,matetambol_code,mateaddr_no,mateaddr_moo,mateaddr_village,mateaddr_soi,mateaddr_road,expense_code , expense_bank , expense_branch , expense_accid, Incomeetc_amt, nvl( current_coopid, coop_id ), remark   "+&
" from	mbreqappl where (appl_docno = '"+as_applno+"' and coop_id ='"+is_coopcontrol+"' )"
	
execute immediate :ls_sqltext using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text = "พบข้อผิดพลาด ในการบันทึก MembMaster ( of_postapv_mbnewmaster ) "+ itr_sqlca.sqlerrtext +as_membno
	throw ithw_exception
end if

return 1
end function

private function integer of_postapv_mbnewshare (string as_applno, string as_membno) throws Exception;string		ls_sqltext
dec{2}		ldc_unitshare_value

//select unitshare_value
//into	:ldc_unitshare_value
//from shsharetype
//where sharetype_code = '01';

if is_coopcontrol = '027001' then //เพิ่มจำนวน
	ls_sqltext = "insert into shsharemaster " + &
	" ( coop_id, member_no, sharetype_code, sharestk_amt, last_period, " + &
	" periodshare_amt, periodbase_amt, sharemaster_status, payment_status ) " + & 				
	" select '"+is_coopcontrol+"','" + as_membno + "', '01', 0, rcv_period, " + &
	" periodshare_value / (select unitshare_value from shsharetype where sharetype_code = '01' ), periodbase_value / (select unitshare_value from shsharetype where sharetype_code = '01' ) , 1, 1" + &
	" from mbreqappl " + &
	" where ( appl_docno = '" + as_applno + "'  and coop_id = '"+is_coopcontrol+"')"
else
	ls_sqltext = "insert into shsharemaster " + &
	" ( coop_id, member_no, sharetype_code, sharestk_amt, last_period, " + &
	" periodshare_amt, periodbase_amt, sharemaster_status, payment_status ) " + & 				
	" select '"+is_coopcontrol+"','" + as_membno + "', '01', 0, 0, " + &
	" periodshare_value / (select unitshare_value from shsharetype where sharetype_code = '01' ), periodbase_value / (select unitshare_value from shsharetype where sharetype_code = '01' ) , 1, 1" + &
	" from mbreqappl " + &
	" where ( appl_docno = '" + as_applno + "'  and coop_id = '"+is_coopcontrol+"')"
end if

				
execute immediate :ls_sqltext using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text = "พบข้อผิดพลาด ในการบันทึก Shsharemaster ( of_postapv_mbnewshare ) "+ itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

private function integer of_postapv_mbmoneytr (string as_applno, string as_membno) throws Exception;string		ls_sqltext
integer	li_check 

select   count(appl_docno)   
into :li_check  
from mbreqapplmoneytr 
where coop_id = :is_coopcontrol
and appl_docno =  :as_applno using itr_sqlca;

if isnull(li_check) then li_check = 0 ;

if li_check > 0 then 
	ls_sqltext = "insert into mbmembmoneytr " + &
	" ( coop_id,	member_no,	trtype_code ,	moneytype_code,	bank_code, bank_branch,	bank_accid ) " + &
	" select coop_id, '" +as_membno + "'	, trtype_code ,	moneytype_code,	bank_code, bank_branch,	bank_accid  " + &
	" from mbreqapplmoneytr where appl_docno = '" +  as_applno + "'  and coop_id = '"  +  is_coopcontrol + "'" 
					
	execute immediate :ls_sqltext using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		rollback using itr_sqlca ;
		ithw_exception.text = "พบข้อผิดพลาด ในการบันทึก mbmembmoneytr ( of_postapv_mbmembmoneytr ) "+ as_membno 	+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if 

return 1
end function

public function integer of_initlist_apvmbnew (ref str_mbreqnew astr_mbreqnew) throws Exception;string		ls_xmlreqopt
string		ls_column , ls_tag , ls_columntyp , ls_value , ls_sqlext
string		ls_sql
integer	li_num_cols , li_index
datetime	ldtm_date
boolean 	lb_err = false
n_ds		lds_reqopt, lds_reqlist

lds_reqopt	= create n_ds
lds_reqopt.dataobject	= "d_mbsrv_list_apvmbnew_opt"
lds_reqopt.settransobject( itr_sqlca )

lds_reqlist	= create n_ds
lds_reqlist.dataobject	= "d_mbsrv_list_apvmbnew"
lds_reqlist.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( true )

inv_dwxmliesrv.of_xmlimport( lds_reqopt , astr_mbreqnew.xml_reqopt )

li_num_cols 	= Integer (lds_reqopt.Describe ( "DataWindow.Column.Count" )) 

for li_index = 1 to li_num_cols
	ls_column 		= trim(lds_reqopt.Describe ( "#" + String(li_index) + ".Name" ))
	ls_tag				= trim(lds_reqopt.Describe ( "#" + String(li_index) + ".Tag" ))
	ls_columntyp	= lds_reqopt.Describe ( "#" + String(li_index) + ".ColType" )
	ls_columntyp	= upper( left( lds_reqopt.Describe ( "#" + String(li_index) + ".ColType" ) , 4 ) )
	choose case ls_columntyp
		case "CHAR"
			if lower( right( ls_column , 4 ) ) = "date" then continue ;// หมายเหตุ เป็นวันที่ให้ข้ามไป ให้ใช้จาก Type DateTime
			ls_value		= lds_reqopt.getitemstring( 1 , ls_column )
			if lower(right( ls_tag , 4 )) = "like" then ls_value = "%" + ls_value + "%"
			ls_value		= "'"+ ls_value + "'"
		case "DECI"
			ls_value		= string( lds_reqopt.getitemdecimal( 1 , ls_column ) )
			if lower(right( ls_tag , 4 )) = "like" then ls_value = "%" + ls_value + "%"
		case "DATE"
			ldtm_date	= lds_reqopt.getitemdatetime( 1 , ls_column )
			if isnull( ldtm_date ) then continue ;
			ls_value		= string( ldtm_date , "dd/mm/yyyy" )
			ls_value		= "to_date( '" + ls_value + "' , 'dd/mm/yyyy' ) "
	end choose
	
	if (not IsNull(ls_value)) and trim(ls_value) <> "" then ls_sqlext += " and " + ls_tag + " " + ls_value + " "
	
next

ls_sql		= lds_reqlist.getsqlselect()

ls_sql		+= ls_sqlext + " and mbreqappl.coop_id = " + is_coopcontrol
ls_sql		+= ls_sqlext + " and mbreqappl.appl_status = 8 "

if lds_reqlist.setsqlselect( ls_sql ) <> 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการนำเข้าข้อมูล(0.2)"
	ithw_exception.text += "~r~nเงื่อนไขการดึงข้อมูลใบคำขอสมัครสมาชิก"
	ithw_exception.text += "~r~n" + lds_reqlist.of_geterrormessage()
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

if lds_reqlist.retrieve() < 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการดึงข้อมูล(0.5)"
	ithw_exception.text += "~r~nไม่พบข้อมูลใบคำขอสมัครสมาชิก"
	ithw_exception.text += "~r~n" + lds_reqlist.of_geterrormessage()
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

astr_mbreqnew.xml_reqlist = inv_dwxmliesrv.of_xmlexport( lds_reqlist )

objdestroy:
if isvalid(lds_reqopt) then destroy lds_reqopt
if isvalid(lds_reqlist) then destroy lds_reqlist

this.of_setsrvdwxmlie( false )

if lb_err then
	ithw_exception.text = "n_cst_divsrv_operate.of_initlist_apvmbnew()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

public function integer of_saveapv_mbnew (ref str_mbreqnew astr_mbreqnew) throws Exception;string ls_reqno, ls_memno, ls_apvid
integer li_status, li_ret
long ll_count, ll_find
dec{2}ldc_reqamt, ldc_apvamt
datetime ldtm_apvdate
boolean lb_err = false
n_ds lds_apvlist


if is_coopcontrol = "027001" then
	lds_apvlist = create n_ds
	lds_apvlist.dataobject = "d_mbsrv_list_apvmbnew_lap"
	lds_apvlist.settransobject(itr_sqlca)
else
	lds_apvlist = create n_ds
	lds_apvlist.dataobject = "d_mbsrv_list_apvmbnew"
	lds_apvlist.settransobject(itr_sqlca)
end if

this.of_setsrvdwxmlie( true )

try
	inv_dwxmliesrv.of_xmlimport(lds_apvlist, astr_mbreqnew.xml_reqlist)
catch (Exception lthw_impxmlerr)
	ithw_exception.Text = lthw_impxmlerr.Text
	lb_err = true
end try
if lb_err then goto objdestroy

ll_count = lds_apvlist.rowcount()
if ll_count <= 0 then
	ithw_exception.text = "ไม่มีรายการสำหรับทำการอนุมัติสมาชิกใหม่"
	lb_err = true ; goto objdestroy
end if


ll_find = lds_apvlist.find("appl_status <> 8", 1, ll_count)

do while (ll_find > 0)
	ls_reqno = lds_apvlist.getitemstring(ll_find, "appl_docno")
	ls_memno = lds_apvlist.getitemstring(ll_find, "member_no")
	ls_apvid = lds_apvlist.getitemstring(ll_find, "approve_id")
	li_status = lds_apvlist.getitemnumber(ll_find, "appl_status")
	ldtm_apvdate = lds_apvlist.getitemdatetime(ll_find, "approve_date")

	if (li_status = 1) then
		// ตรวจสอบว่ามีเลขสมาชิกหรือเปล่า
		if isnull(ls_memno) or trim(ls_memno) = "" then
			ithw_exception.text = "ใบสมัครเลขที่ " + ls_reqno + " มีสถานะอนุมัติแต่ไม่ได้มีการให้เลขสมาชิก กรุณาตรวจสอบ"
			lb_err = true ; goto objdestroy
		end if
		
		try
			// ผ่านรายการไปทะเบียนสมาชิก
			this.of_postapv_mbnewmaster(ls_reqno, ls_memno, ldtm_apvdate)
			
			// ผ่านรายการไปทะเบียนหุ้น
			this.of_postapv_mbnewshare(ls_reqno, ls_memno)
						
			this.of_postapv_mbmoneytr(ls_reqno, ls_memno)
			// ผ่านรายการไปผู้รับโอนประโยชน์
			this.of_postapv_mbmembrecvgain(ls_reqno, ls_memno)

		catch (Exception lthw_error)
			ithw_exception.Text = lthw_error.Text
			lb_err = true
		end try
		
		if lb_err then
			goto objdestroy
		end if
	end if
	
	// บันทึกสถานะการอนุมัติเสมอ
	update mbreqappl
	set appl_status = :li_status,
	approve_id = :ls_apvid,
	approve_date = :ldtm_apvdate,
	member_no = :ls_memno
	where(appl_docno = :ls_reqno and coop_id = :is_coopcontrol)
	using itr_sqlca;
	
	//ส่วนผ้รับผลประโยชน์ testdebug
	update mbreqapplgain
	set member_no = :ls_memno
	where(appl_docno = :ls_reqno and coop_id = :is_coopcontrol)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ใบสมัครเลขที่ " + ls_reqno + " ไม่สามารถปรับปรุงสถานะได้ " + itr_sqlca.sqlerrtext
		lb_err = true ; goto objdestroy
	end if
	
	ll_find++
	if ll_find > ll_count then
		exit
	end if
	ll_find = lds_apvlist.find("appl_status <> 8", ll_find, ll_count)
loop

objdestroy:
if isvalid(lds_apvlist) then destroy lds_apvlist

this.of_setsrvdwxmlie( false )

if lb_err then
	rollback using itr_sqlca;
	ithw_exception.text = "n_cst_membsrv_allrequest.of_saveapv_mbnew()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca;
end if
return 1
end function

private function string of_chkoldreq_mbresign (string as_memno);/***********************************************************
<description>
	ตรวจสอบว่ามีใบคำขอเก่าที่ยังไม่อนุมัติหรือไม่
</description>

<arguments>  
	as_memno		String	 	เลขสมาชิก
</arguments> 

<return> 
	String			เลขที่ใบคำขอล่าสุดที่ยังไม่อนุมัติ
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 13/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_docno
integer	li_status

li_status  = STATUS_PENDING

select	max( resignreq_docno )
into	:ls_docno
from 	mbreqresign
where ( member_no	=	:as_memno ) and 
		 ( resignreq_status = :li_status  ) and
		 ( coop_id = :is_coopcontrol)
using itr_sqlca ;
 
if isnull( ls_docno ) then
	ls_docno =""
end if

return trim( ls_docno )
end function

private function integer of_postapv_chggrp (string as_coopid, string as_reqno, string as_expflg) throws Exception;/***********************************************************
<description>
	ผ่านรายการย้ายสังกัด
</description>

<arguments>  
	ads_req				n_ds			datastore ใบคำขอ
	ai_row				integer		แถวที่ต้องการบันทึก	
	as_apvid				String			ผู้ทำรายการอนุมัติ
	adtm_apvdate		Datetime		วันที่อนุมัติ
</arguments> 

<return> 
	Integer				1 = success, Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 15/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_memno, ls_memcoopid , ls_newgrp
string		ls_oldgrp
string		ls_expcode , ls_expbank , ls_expbranch , ls_expaccid
string		ls_oldexp , ls_oldexpbank , ls_oldexpbranch , ls_oldexpaccid

if as_expflg = "Y" then
	if isnull( ls_expcode ) or trim( ls_expcode ) = "" then ls_expcode = ""
	if isnull( ls_expbank ) or trim( ls_expbank ) = "" then ls_expbank = ""
	if isnull( ls_expbranch ) or trim( ls_expbranch ) = "" then ls_expbranch = ""
	if isnull( ls_expaccid ) or trim( ls_expaccid ) = "" then ls_expaccid = ""

	update	mbmembmaster m
	set			( m.membgroup_code , m.expense_code , m.expense_bank , m.expense_branch , m.expense_accid ) = 
				( 	select nvl( mrq.new_group , '' ) , nvl( mrq.expense_code , '' ) , nvl( mrq.expense_bank , '' ) , nvl( mrq.expense_branch , '' ) , nvl( mrq.expense_accid , '' ) 
					from mbreqchangegroup mrq 
					where ( mrq.chggroup_docno = :as_reqno 
					and mrq.coop_id =:is_coopcontrol ) )
	where	( m.coop_id , m.member_no ) in ( 	select mg.memcoop_id , mg.member_no 
																from mbreqchangegroup mg 
																where ( mg.chggroup_docno = :as_reqno 
																and mg.coop_id =:is_coopcontrol ) )
	using itr_sqlca ;

	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text = "ไม่สามารถปรับปรุงวิธีจ่ายเงินสมาชิกได้  ~n" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

else

	update	mbmembmaster m
	set			( m.membgroup_code ) = ( select nvl( mrq.new_group , '' ) from mbreqchangegroup mrq where ( mrq.chggroup_docno = :as_reqno and mrq.coop_id =:is_coopcontrol ) )
	where	( m.coop_id , m.member_no ) in ( select mg.memcoop_id , mg.member_no from mbreqchangegroup mg where ( mg.chggroup_docno = :as_reqno and mg.coop_id =:is_coopcontrol ) )
	using itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text = "ไม่สามารถปรับปรุงการย้ายสังกัดที่สมาชิกได้  ~n" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

end if

return 1
end function

public function integer of_saveccl_resign (str_mbreqresign astr_mbreqresign) throws Exception;/***********************************************************
<description>
	ยกเลิกลาออก
</description>

<arguments>  
	as_xmlresign		String			ใบคำขอที่ต้องการยกเลิกลาออก
	as_cancelid			String			ผู้ทำรายการยกเลิก
	as_canceldate		datetime		วันที่ยกเลิก
</arguments> 

<return> 
	Integer				1 = success, Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 12/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_cancelid
string		ls_memno, ls_rsgdocno, ls_cancelcause,ls_coopid
long		ll_count
integer	li_sharestatus
dec{3}	ldc_shrstkrsg, ldc_shrstkamt, ldc_shrunit
datetime	ldtm_cancel
boolean	lb_err = false
n_ds		lds_resign

lds_resign	= create n_ds
lds_resign.dataobject	= "d_mbsrv_ccl_resign"
lds_resign.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( true )

try
	ll_count = inv_dwxmliesrv.of_xmlimport( lds_resign, astr_mbreqresign.xml_request )
catch( Exception lthw_imperr )
	ithw_exception.text	= lthw_imperr.text
	lb_err = true 
end try
if lb_err then Goto objdestroy

if ( ll_count < 1 ) then
	ithw_exception.text = "ไม่สามารถ import ใบคำขอเพื่อทำการยกเลิกได้"
	lb_err = true ; Goto objdestroy
end if

// ดึงข้อมูลมาตรวจสอบ
ls_memno 		= lds_resign.getitemstring( 1, "member_no" )
ls_rsgdocno		= lds_resign.getitemstring( 1, "resignreq_docno" )
ls_cancelcause = lds_resign.getitemstring( 1, "cancelresign_cause" )
ls_cancelid		= lds_resign.object.cancelresign_id[1]
ldc_shrstkrsg	= lds_resign.getitemdecimal( 1, "sharestk_amount" )
ldtm_cancel		= lds_resign.object.cancelresign_date[1]

// ตรวจดูทุนเรือนหุ้นพร่องไปหรือยัง
select		sm.sharestk_amt , nvl( st.unitshare_value , 0.001 )
into		:ldc_shrstkamt , :ldc_shrunit
from 		shsharemaster sm, shsharetype st
where	sm.coop_id				= st.coop_id
and		sm.sharetype_code	= st.sharetype_code
and		( sm.member_no 			= :ls_memno 
and 		sm.coop_id 					= :is_coopcontrol )
using	itr_sqlca ;

if ( ldc_shrstkamt  ) < (ldc_shrstkrsg/ ldc_shrunit) then
	ithw_exception.text = "ไม่สามารถยกเลิกลาออกได้ เนื่องจากมีการถอนหุ้นหรือโอนหุ้นชำระหนี้ไปแล้ว กรุณาไปยกเลิกการถอนหุ้นก่อน"
	lb_err = true ; Goto objdestroy
end if

// ทำการ Update สถานะหุ้นใน Sharemaster
update	shsharemaster
set			sharemaster_status = 1
where	( member_no = :ls_memno and coop_id =:is_coopcontrol )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text = "ไม่สามารถปรับปรุงสถานะหุ้นให้เป็นปกติได้ "+itr_sqlca.sqlerrtext
	lb_err = true ; Goto objdestroy
end if

//ทำการ update สถานะลาออกสมาชิก
update	mbmembmaster
set			member_status	= 1,
			resign_status	= 0,
			resign_date = null,
			resigncause_code = ''
where	( member_no	= :ls_memno and coop_id =:is_coopcontrol)
using		itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text = "ไม่สามารถปรับปรุงสถานะสมาชิกให้เป็นปกติได้~n" + string( itr_sqlca.sqlcode ) + "  "  + string( itr_sqlca.sqlerrtext )
	lb_err = true ; Goto objdestroy
end if

// ปรับปรุงสถานะในใบคำขอลาออก
update mbreqresign
set		resignreq_status	= -9,
		cancelresign_id 	= :ls_cancelid,
		cancelresign_date	= :ldtm_cancel,
		cancelresign_cause = :ls_cancelcause,		
		cancelresign_status = 1
where( resignreq_docno	= :ls_rsgdocno and coop_id =:is_coopcontrol)
using	itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text = "ไม่สามารถปรับปรุงสถานะใบรายการยกเลิกได้~n" + string( itr_sqlca.sqlcode ) + "  "  + string( itr_sqlca.sqlerrtext )
	lb_err = true
end if

objdestroy:
if isvalid(lds_resign) then destroy lds_resign

this.of_setsrvdwxmlie( false )

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_membsrv_allrequest.of_saveccl_resign()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

return 1
end function

public function integer of_initlist_apvchgmthshr (ref str_mbreqchgmthpay astr_mbreqchgmthpay) throws Exception;/***********************************************************
<description>
	แสดงรายการใบคำขอย้ายสังกัดที่ยังไม่ได้ผ่านรายการ
</description>

<arguments>  

</arguments> 

<return> 
	String		Xml รายการใบคำขอย้ายสังกัดที่ยังไม่ได้ผ่านรายการ
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 13/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_xmlreqlist
string		ls_column , ls_tag , ls_columntyp , ls_value , ls_sqlext
string		ls_sql
integer	li_num_cols , li_index
datetime	ldtm_date
boolean 	lb_err = false
n_ds		lds_reqopt , lds_reqlist

lds_reqopt	= create n_ds
lds_reqopt.dataobject	= "d_mbsrv_list_apvchgmthshr_opt"
lds_reqopt.settransobject( itr_sqlca )

lds_reqlist	= create n_ds
lds_reqlist.dataobject	= "d_mbsrv_list_apvchgmthshr"
lds_reqlist.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( true )

inv_dwxmliesrv.of_xmlimport( lds_reqopt , astr_mbreqchgmthpay.xml_reqopt )

li_num_cols 	= Integer (lds_reqopt.Describe ( "DataWindow.Column.Count" )) 

for li_index = 1 to li_num_cols
	ls_column 		= trim(lds_reqopt.Describe ( "#" + String(li_index) + ".Name" ))
	ls_tag				= trim(lds_reqopt.Describe ( "#" + String(li_index) + ".Tag" ))
	ls_columntyp	= lds_reqopt.Describe ( "#" + String(li_index) + ".ColType" )
	ls_columntyp	= upper( left( lds_reqopt.Describe ( "#" + String(li_index) + ".ColType" ) , 4 ) )
	choose case ls_columntyp
		case "CHAR"
			if lower( right( ls_column , 4 ) ) = "date" then continue ;// หมายเหตุ เป็นวันที่ให้ข้ามไป ให้ใช้จาก Type DateTime
			ls_value		= lds_reqopt.getitemstring( 1 , ls_column )
			if lower(right( ls_tag , 4 )) = "like" then ls_value = "%" + ls_value + "%"
			ls_value		= "'"+ ls_value + "'"
		case "DECI"
			ls_value		= string( lds_reqopt.getitemdecimal( 1 , ls_column ) )
			if lower(right( ls_tag , 4 )) = "like" then ls_value = "%" + ls_value + "%"
		case "DATE"
			ldtm_date	= lds_reqopt.getitemdatetime( 1 , ls_column )
			if isnull( ldtm_date ) then continue ;
			ls_value		= string( ldtm_date , "dd/mm/yyyy" )
			ls_value		= "to_date( '" + ls_value + "' , 'dd/mm/yyyy' ) "
	end choose
	
	if (not IsNull(ls_value)) and trim(ls_value) <> "" then ls_sqlext += " and " + ls_tag + " " + ls_value + " "
	
next

ls_sql		= lds_reqlist.getsqlselect()

ls_sql		+= ls_sqlext + " and shpaymentadjust.coop_id = " + is_coopcontrol
ls_sql		+= ls_sqlext + " and shpaymentadjust.shrpayadj_status = 8 "

if lds_reqlist.setsqlselect( ls_sql ) <> 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการนำเข้าข้อมูล(0.2)"
	ithw_exception.text += "~r~nเงื่อนไขการดึงข้อมูลใบคำขอเปลี่ยนแปลงหุ้นส่งรายเดือนสมาชิก"
	ithw_exception.text += "~r~n" + lds_reqlist.of_geterrormessage()
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

if lds_reqlist.retrieve() < 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการดึงข้อมูล(0.5)"
	ithw_exception.text += "~r~nไม่พบข้อมูลใบคำขอเปลี่ยนแปลงหุ้นส่งรายเดือนสมาชิก"
	ithw_exception.text += "~r~n" + lds_reqlist.of_geterrormessage()
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

astr_mbreqchgmthpay.xml_reqlist = inv_dwxmliesrv.of_xmlexport( lds_reqlist )

objdestroy:
if isvalid(lds_reqopt) then destroy lds_reqopt
if isvalid(lds_reqlist) then destroy lds_reqlist

this.of_setsrvdwxmlie( false )

if lb_err then
	ithw_exception.text = "n_cst_divsrv_operate.of_initlist_apvchgmthshr()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

public function integer of_saveapv_chgmthshr (ref str_mbreqchgmthpay astr_mbreqchgmthpay) throws Exception;/***********************************************************
<description>
	อนุมัติย้ายสังกัด
</description>

<arguments>  
	as_xmlreqlist		String			รายการใบคำขอที่รอการอนุมัติ
	as_apvid				String			ผู้ทำรายการอนุมัติ
	adtm_apvdate		Datetime		วันที่อนุมัติ
</arguments> 

<return> 
	Integer				1 = success, Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 15/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_reqno, ls_memno , ls_apvid
integer	li_status
long		ll_count, ll_find
datetime	ldtm_apv
boolean	lb_err = false
n_ds		lds_reqlist

this.of_setsrvdwxmlie( true )

lds_reqlist = create n_ds
lds_reqlist.dataobject = "d_mbsrv_list_apvchgmthshr"
lds_reqlist.settransobject( itr_sqlca )

// Import ข้อมูล
try
	inv_dwxmliesrv.of_xmlimport( lds_reqlist, astr_mbreqchgmthpay.xml_reqlist )
catch( Exception lthw_impxmlerr )
	lb_err = true
end try
if lb_err then Goto objdestroy

ll_count	= lds_reqlist.rowcount()
if ( ll_count < 1 ) then
	destroy( lds_reqlist )
	ithw_exception.text += "ไม่มีข้อมูลการเปลี่ยนแปลงหุ้นรายเดือน ที่จะทำการอนุมัติได้ กรุณาตรวจสอบ"
	throw ithw_exception
end if

ll_find	 = lds_reqlist.find( "shrpayadj_status <> 8", 1, ll_count )
do while ( ll_find > 0 )
	
	ls_memno		= lds_reqlist.object.member_no[ ll_find ]
	ls_reqno			= lds_reqlist.object.payadjust_docno[ ll_find ]
	ls_apvid			= lds_reqlist.object.approve_id[ ll_find ]
	li_status			= lds_reqlist.object.shrpayadj_status[ ll_find ]
	ldtm_apv			= lds_reqlist.object.approve_date[ ll_find ]

	// ผ่านรายการอนุมัติ
	if ( li_status = 1 ) then
		try
			this.of_postapv_chgmthshr( is_coopcontrol ,ls_reqno, ls_apvid, ldtm_apv )
		catch(Exception lthw_error)
			ithw_exception.text += lthw_error.text
			lb_err = true
		end try
		if lb_err then Goto objdestroy
	end if
		
	// ปรับปรุงสถานะใบคำขอ
	// ไม่ว่าจะอนุมัติ หรือไม่อนุมัติ ก็ต้องจะยิงใส่  approve_id & approve_date
	update	shpaymentadjust
	set			shrpayadj_status	= :li_status,
				approve_id			= :ls_apvid,
				approve_date		= :ldtm_apv
	where	( payadjust_docno = :ls_reqno and coop_id =:is_coopcontrol)
	using		itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text += "ใบเปลี่ยนแปลงค่าหุ้นรายเดือนเลขที่/เลขสมาชิก : "+ls_reqno+"/"+ls_memno+" ไม่สามารถปรับปรุงสถานะได้ "+sqlca.sqlerrtext
		lb_err = true ; Goto objdestroy
	end if

	ll_find ++
	if ( ll_find > ll_count ) then
		exit
	end if

	ll_find	 = lds_reqlist.find( "shrpayadj_status <> 8", ll_find, ll_count )
loop

objdestroy:
if isvalid(lds_reqlist) then destroy lds_reqlist

this.of_setsrvdwxmlie( false )

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_membsrv_allrequest.of_saveapv_chgmthshr()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

return 1
end function

public function integer of_initccl_resign (ref str_mbreqresign astr_mbreqresign) throws Exception;/***********************************************************
<description>
	ดึงข้อมูลใบคำขอลาออกเพื่อทำการยกเลิกลาออก
</description>

<arguments>  
	as_memno			String			เลขสมาชิก
</arguments> 

<return> 
	String			xml 	คำขอลาออกที่ต้องการยกเลิก
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 12/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_xmlresign
string		ls_rsgdocno , ls_memno
boolean	lb_err = false

n_ds	lds_resign

ls_memno		= astr_mbreqresign.member_no

// ดึงรายละเอียดใบลาออกล่าสุด
select max( resignreq_docno ) 
into	:ls_rsgdocno
from 	mbreqresign
where ( member_no = :ls_memno ) and 
		( coop_id = :is_coopcontrol ) and 
		 ( resignreq_status = 1 )
using itr_sqlca;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text = "ไม่พบข้อมูลการลาออก ของสมาชิกทะเบียน ("+ls_memno+") ~n"+ itr_sqlca.sqlerrtext
	lb_err = true ; Goto objdestroy
end if

this.of_setsrvdwxmlie( true )

lds_resign = create n_ds
lds_resign.dataobject = "d_mbsrv_ccl_resign"
lds_resign.settransobject( itr_sqlca )
lds_resign.retrieve( is_coopcontrol,ls_rsgdocno )

astr_mbreqresign.xml_request = inv_dwxmliesrv.of_xmlexport( lds_resign )

objdestroy:
if isvalid(lds_resign) then destroy lds_resign

this.of_setsrvdwxmlie( false )

if lb_err then
	ithw_exception.text = "n_cst_membsrv_allrequest.of_initccl_resign()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

public function integer of_initreq_trnmb (ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception;string		ls_oldreqno, ls_memno
string		ls_prename,	 ls_name, ls_surname
string		ls_groupcode, ls_groupdesc
string		ls_expcode, ls_expbank, ls_expbranch, ls_expaccid
string		ls_xmlmain
integer	li_rowcount
boolean	lb_err = false
n_ds		lds_req, lds_history

ls_memno		= astr_mbreqtrnmb.member_no

// ตรวจสอบว่ามีคำขอที่ยังรออนุมัติหรือไม่
select	 max( trnmbreq_docno )
into	:ls_oldreqno
from	mbreqtranmb
where( coop_id	=	:is_coopcontrol )
and	( memold_no	=	:ls_memno )
and	( trnmbreq_status = 8 )
using itr_sqlca ;

// ถ้ามีใบคำขออยู่ ก็เปิดมันขึ้นมาซะ
if len( trim( ls_oldreqno ) ) > 0 and not isnull( ls_oldreqno ) then
	
	astr_mbreqtrnmb.reqdoc_no	= ls_oldreqno
	
	try
		this.of_openreq_trnmb( astr_mbreqtrnmb )
	catch( Exception lthw_erropen )
		ithw_exception.text	= lthw_erropen.text
		lb_err						= true
	end try
	
	if not lb_err then
		astr_mbreqtrnmb.message		= "สมาชิกเลขที่ "+ls_memno+" มีใบคำขอโอนย้ายเลขสมาชิกอยู่แล้ว โปรแกรมได้ทำการเปิดใบคำขอเดิมขึ้นมาให้"
	end if
	
	goto objdestroy
end if

// ดึงข้อมูลประกอบใบคำขอ
select		ft_memname( :is_coopcontrol , a.member_no ) as memname
into		:ls_name
from		mbmembmaster a
where	( a.coop_id				= :is_coopcontrol )
and		( a.member_no			= :ls_memno )
using itr_sqlca;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลรายละเอียดสมาชิกได้ : "+ls_memno+ " กรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

// ข้อมูลประกอบใบคำขอ
lds_req		= create n_ds
lds_req.dataobject		= "d_mbsrv_req_trnmb"

// รายละเอียดคำขอ
lds_req.insertrow( 0 )
lds_req.setitem( 1, "coop_id", is_coopcontrol )
lds_req.setitem( 1, "memnameold", ls_name )
lds_req.setitem( 1, "memold_no", ls_memno )

this.of_setsrvdwxmlie( true )
astr_mbreqtrnmb.xml_request		= inv_dwxmliesrv.of_xmlexport( lds_req )

objdestroy:
if isvalid(lds_req) then destroy lds_req
this.of_setsrvdwxmlie( false )

if lb_err then
	ithw_exception.text = "n_cst_membsrv_allrequest.of_initreq_trnmb()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

public function integer of_openreq_trnmb (ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception;string		ls_reqno , ls_memno
n_ds		lds_reqmast

lds_reqmast	= create n_ds
lds_reqmast.dataobject	= "d_mbsrv_req_trnmb"
lds_reqmast.settransobject( itr_sqlca )

ls_reqno		= astr_mbreqtrnmb.reqdoc_no
ls_memno	= astr_mbreqtrnmb.member_no

lds_reqmast.retrieve( is_coopcontrol, ls_reqno )

this.of_setsrvdwxmlie( true )
astr_mbreqtrnmb.xml_request		= inv_dwxmliesrv.of_xmlexport( lds_reqmast )
this.of_setsrvdwxmlie( false )

if isvalid(lds_reqmast) then destroy lds_reqmast

return 1
end function

public function integer of_saveapv_chggrp (ref str_mbreqchggrp astr_mbreqchggrp) throws Exception;/***********************************************************
<description>
	อนุมัติย้ายสังกัด
</description>

<arguments>  
	as_xmlreqlist		String			รายการใบคำขอที่รอการอนุมัติ
	as_apvid				String			ผู้ทำรายการอนุมัติ
	adtm_apvdate		Datetime		วันที่อนุมัติ
</arguments> 

<return> 
	Integer				1 = success, Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 15/10/2010 by MiT
</usage> 
***********************************************************/
integer	li_status , li_tokpexp
long		ll_count, ll_find
string		ls_reqno,ls_apvid , ls_expflg
datetime	ldtm_apvdate
boolean	lb_err = false
n_ds		lds_mbchglist

this.of_setsrvdwxmlie( true )

lds_mbchglist = create n_ds
lds_mbchglist.dataobject = "d_mbsrv_list_apvchggrp"
lds_mbchglist.settransobject( itr_sqlca )

// Import ข้อมูล
try
	inv_dwxmliesrv.of_xmlimport( lds_mbchglist, astr_mbreqchggrp.xml_reqlist )
catch( Exception lthw_impxmlerr )
	ithw_exception.Text = lthw_impxmlerr.Text
	lb_err = true
end try
if lb_err then Goto objdestroy

ll_count	= lds_mbchglist.rowcount()
if ( ll_count < 1 ) then
	ithw_exception.text += "ไม่มีข้อมูลการย้ายสังกัด ที่จะทำการอนุมัติได้ กรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

ll_find	 = lds_mbchglist.find( "request_status <> 8", 1, ll_count )
do while ( ll_find > 0 )
	
	ls_reqno			= lds_mbchglist.object.chggroup_docno[ ll_find ]
	ls_apvid			= lds_mbchglist.object.apv_id[ ll_find ]
	ls_expflg			= lds_mbchglist.object.expchg_flag[ ll_find ]
	li_status			= lds_mbchglist.object.request_status[ ll_find ]
	ldtm_apvdate	= lds_mbchglist.getitemdatetime( ll_find, "apv_date" )

	// ผ่านรายการอนุมัติ
	if ( li_status = 1 ) then
		try
			this.of_postapv_chggrp(is_coopcontrol ,ls_reqno , ls_expflg )
		catch(Exception lthw_error)
			ithw_exception.text += lthw_error.text
			lb_err = true
		end try
		if lb_err then Goto objdestroy
	end if

	// ปรับปรุงสถานะใบคำขอ
	// ไม่ว่าจะอนุมัติ หรือไม่อนุมัติ ก็ต้องจะยิงใส่  approve_id & approve_date
	update	mbreqchangegroup
	set			request_status	= :li_status,
				apv_id			= :ls_apvid,
				apv_date 		= :ldtm_apvdate
	where	( chggroup_docno = :ls_reqno and coop_id = :is_coopcontrol)
	using		itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text += "ใบย้ายสังกัดเลขที่ "+ls_reqno+" ไม่สามารถปรับปรุงสถานะได้ "+sqlca.sqlerrtext
		lb_err = true ; Goto objdestroy
	end if

	ll_find ++
	if ( ll_find > ll_count ) then
		exit
	end if

	ll_find	 = lds_mbchglist.find( "request_status <> 8", ll_find, ll_count )
loop

objdestroy:
if isvalid(lds_mbchglist) then destroy lds_mbchglist

this.of_setsrvdwxmlie( false )

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_membsrv_allrequest.of_saveapv_chggrp()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

return 1
end function

public function integer of_saveapv_trnmb (ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception;integer	li_status , li_tokpexp
long		ll_count, ll_find
string		ls_reqno,ls_apvid , ls_memold , ls_memnew
datetime	ldtm_apvdate
boolean	lb_err = false
n_ds		lds_trnmblist

this.of_setsrvdwxmlie( true )

lds_trnmblist = create n_ds
lds_trnmblist.dataobject = "d_mbsrv_list_apvtrnmb"
lds_trnmblist.settransobject( itr_sqlca )

// Import ข้อมูล
try
	inv_dwxmliesrv.of_xmlimport( lds_trnmblist, astr_mbreqtrnmb.xml_reqlist )
catch( Exception lthw_impxmlerr )
	lb_err = true
end try
if lb_err then Goto objdestroy

ll_count	= lds_trnmblist.rowcount()
if ( ll_count < 1 ) then
	ithw_exception.text += "ไม่มีข้อมูลการย้ายสังกัด ที่จะทำการอนุมัติได้ กรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

ll_find	 = lds_trnmblist.find( "trnmbreq_status <> 8", 1, ll_count )
do while ( ll_find > 0 )
	
	ls_reqno			= lds_trnmblist.object.trnmbreq_docno[ ll_find ]
	ls_memold		= lds_trnmblist.object.memold_no[ ll_find ]
	ls_memnew		= lds_trnmblist.object.memnew_no[ ll_find ]
	ls_apvid			= lds_trnmblist.object.apv_id[ ll_find ]
	li_status			= lds_trnmblist.object.trnmbreq_status[ ll_find ]
	ldtm_apvdate	= lds_trnmblist.getitemdatetime( ll_find, "apv_date" )

	// ผ่านรายการอนุมัติ
	if ( li_status = 1 ) then
		try
			this.of_postapv_trnmb( ls_memold , ls_memnew, ldtm_apvdate )
		catch(Exception lthw_error)
			ithw_exception.text += lthw_error.text
			lb_err = true
		end try
		if lb_err then Goto objdestroy
	end if

	// ปรับปรุงสถานะใบคำขอ
	// ไม่ว่าจะอนุมัติ หรือไม่อนุมัติ ก็ต้องจะยิงใส่  approve_id & approve_date
	update	mbreqtranmb
	set			trnmbreq_status	= :li_status,
				apv_id				= :ls_apvid,
				apv_date 			= :ldtm_apvdate
	where	( trnmbreq_docno = :ls_reqno and coop_id = :is_coopcontrol)
	using		itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text += "ใบย้ายสังกัดเลขที่ "+ls_reqno+" ไม่สามารถปรับปรุงสถานะได้ "+sqlca.sqlerrtext
		lb_err = true ; Goto objdestroy
	end if

	ll_find ++
	if ( ll_find > ll_count ) then
		exit
	end if

	ll_find	 = lds_trnmblist.find( "trnmbreq_status <> 8", ll_find, ll_count )
loop

objdestroy:
if isvalid(lds_trnmblist) then destroy lds_trnmblist

this.of_setsrvdwxmlie( false )

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_membsrv_allrequest.of_saveapv_trnmb()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

return 1
end function

public function integer of_savereq_trnmb (ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception;string		ls_docno, ls_memnew , ls_memold , ls_expflg
string		ls_entryid
integer	li_apvimmediate, li_ret
datetime	ldtm_entrydate, ldtm_reqdate
boolean	lb_err = false
n_ds		lds_req

lds_req	= create n_ds
lds_req.dataobject = "d_mbsrv_req_trnmb"
lds_req.settransobject( itr_sqlca ) 

this.of_setsrvdoccontrol( true )
this.of_setsrvdwxmlie( true )

try
	inv_dwxmliesrv.of_xmlimport( lds_req, astr_mbreqtrnmb.xml_request )
	// ตรวจสอบข้อมูลก่อนบันทึก
//	this.of_chkbeforesave_chggrp( lds_req )
catch( Exception lthw_errimp )
	ithw_exception.text	= lthw_errimp.text
	lb_err						= true
end try

if lb_err then goto objdestroy

// ตรวจสอบว่ามีเลขที่ใบคำขอหรือยัง
ls_memold			= lds_req.object.memold_no[1]
ls_memnew			= lds_req.object.memnew_no[1]
ls_docno 			= lds_req.getitemstring( 1, "trnmbreq_docno" )
ls_entryid			= lds_req.object.entry_id[1]
li_apvimmediate 	= lds_req.getitemnumber( 1, "apvflag" )

if trim( ls_docno ) = "" or isnull( ls_docno ) then
	
	ls_docno	= inv_docsrv.of_getnewdocno( is_coopcontrol, "MBTRANMB" )
	
	lds_req.setitem( 1, "coop_id" , is_coopcontrol )
	lds_req.setitem( 1, "trnmbreq_docno", ls_docno )
	lds_req.setitem( 1, "entry_date", datetime( today(), now() ) )
	lds_req.setitem( 1, "entry_bycoopid", is_coopid )
else
	this.of_setdsmodify( lds_req, 1, false )
end if

// บันทึกใบคำขอ
if lds_req.update() <> 1 then
	ithw_exception.text = "ไม่สามารถบันทึกใบคำขอโอนย้ายสมาชิกได้~n" + lds_req.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// อนุมัติเลยหรือไม่
if ( li_apvimmediate = 1 ) then
	ldtm_reqdate	= lds_req.getitemdatetime( 1, "trnmbreq_date" )
	try
		this.of_postapv_trnmb( ls_memold , ls_memnew, ldtm_reqdate )
	catch( Exception ithw_error )
		lb_err = true
	end try
	if lb_err then Goto objdestroy
	
	update	mbreqtranmb
	set			trnmbreq_status		= 1
	where	( trnmbreq_docno		= :ls_docno and coop_id =:is_coopcontrol )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ไม่สามารถปรับปรุงสถานะใบคำขอโอนย้ายสมาชิกให้เป็นอนุมัติได้ ~n" + itr_sqlca.sqlerrtext
		lb_err = true ; Goto objdestroy
	end if
end if

this.of_setsrvdwxmlie( true )

objdestroy:
if isvalid(lds_req) then destroy lds_req

this.of_setsrvdoccontrol( false )
this.of_setsrvkpreq(false)
this.of_setsrvdwxmlie( false )

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_membsrv_allrequest.of_savereq_trnmb()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

return 1
end function

public function integer of_initlist_apvtrnmb (ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception;string		ls_xmlreqopt
string		ls_column , ls_tag , ls_columntyp , ls_value , ls_sqlext
string		ls_sql
integer	li_num_cols , li_index
datetime	ldtm_date
boolean 	lb_err = false
n_ds		lds_reqopt, lds_reqlist

lds_reqopt	= create n_ds
lds_reqopt.dataobject	= "d_mbsrv_list_apvtrnmb_opt"
lds_reqopt.settransobject( itr_sqlca )

lds_reqlist	= create n_ds
lds_reqlist.dataobject	= "d_mbsrv_list_apvtrnmb"
lds_reqlist.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( true )

inv_dwxmliesrv.of_xmlimport( lds_reqopt , astr_mbreqtrnmb.xml_reqopt )

li_num_cols 	= Integer (lds_reqopt.Describe ( "DataWindow.Column.Count" )) 

for li_index = 1 to li_num_cols
	ls_column 		= trim(lds_reqopt.Describe ( "#" + String(li_index) + ".Name" ))
	ls_tag				= trim(lds_reqopt.Describe ( "#" + String(li_index) + ".Tag" ))
	ls_columntyp	= lds_reqopt.Describe ( "#" + String(li_index) + ".ColType" )
	ls_columntyp	= upper( left( lds_reqopt.Describe ( "#" + String(li_index) + ".ColType" ) , 4 ) )
	choose case ls_columntyp
		case "CHAR"
			if lower( right( ls_column , 4 ) ) = "date" then continue ;// หมายเหตุ เป็นวันที่ให้ข้ามไป ให้ใช้จาก Type DateTime
			ls_value		= lds_reqopt.getitemstring( 1 , ls_column )
			if lower(right( ls_tag , 4 )) = "like" then ls_value = "%" + ls_value + "%"
			ls_value		= "'"+ ls_value + "'"
		case "DECI"
			ls_value		= string( lds_reqopt.getitemdecimal( 1 , ls_column ) )
			if lower(right( ls_tag , 4 )) = "like" then ls_value = "%" + ls_value + "%"
		case "DATE"
			ldtm_date	= lds_reqopt.getitemdatetime( 1 , ls_column )
			if isnull( ldtm_date ) then continue ;
			ls_value		= string( ldtm_date , "dd/mm/yyyy" )
			ls_value		= "to_date( '" + ls_value + "' , 'dd/mm/yyyy' ) "
	end choose
	
	if (not IsNull(ls_value)) and trim(ls_value) <> "" then ls_sqlext += " and " + ls_tag + " " + ls_value + " "
	
next

ls_sql		= lds_reqlist.getsqlselect()

ls_sql		+= ls_sqlext + " and mbreqtranmb.coop_id = " + is_coopcontrol
ls_sql		+= ls_sqlext + " and mbreqtranmb.trnmbreq_status = 8 "

if lds_reqlist.setsqlselect( ls_sql ) <> 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการนำเข้าข้อมูล(0.2)"
	ithw_exception.text += "~r~nเงื่อนไขการดึงข้อมูลใบคำขอโอนย้ายสมาชิก"
	ithw_exception.text += "~r~n" + lds_reqlist.of_geterrormessage()
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

if lds_reqlist.retrieve() < 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาด ในการดึงข้อมูล(0.5)"
	ithw_exception.text += "~r~nไม่พบข้อมูลใบคำขอโอนย้ายสมาชิก"
	ithw_exception.text += "~r~n" + lds_reqlist.of_geterrormessage()
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

astr_mbreqtrnmb.xml_reqlist = inv_dwxmliesrv.of_xmlexport( lds_reqlist )

objdestroy:
if isvalid(lds_reqopt) then destroy lds_reqopt
if isvalid(lds_reqlist) then destroy lds_reqlist

this.of_setsrvdwxmlie( false )

if lb_err then
	ithw_exception.text = "n_cst_membsrv_allrequest.of_initlist_apvtrnmb()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

private function integer of_postapv_mbmembrecvgain (string as_applno, string as_membno) throws Exception;string	ls_sqltext
integer	li_check 

				ls_sqltext	 = "insert into mbgainmaster " + &
			 				    "  (coop_id , member_no,		seq_no,		gain_name,gain_surname,	gain_addr,	gain_relation,remark,write_date,write_at, age, prename_code) " + &
			 				    "select  coop_id,'"+as_membno+"', seq_no,	gain_name,gain_surname,	gain_addr,		gain_relation,remark,write_date,write_at, age, prename_code " + &
							    "from mbreqapplgain " + &
			  				    "where ( appl_docno = '"+as_applno+"' )"
				
				execute immediate :ls_sqltext using itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text = "พบข้อผิดพลาด ในการบันทึก Memb gain receive master ( บันทึกการรับจ่าย of_posttomembgain )~n" + &
											string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext + "~n" + ithw_exception.text
				throw ithw_exception
	  end if
	  
return 1
end function

public function integer of_initreq_mbresign_pea (ref str_mbreqresign astr_resigninfo) throws Exception;/***********************************************************
<description>
	สร้างใบคำขอลาออก
</description>

<arguments>  
	as_memno			String			เลขสมาชิก
	ads_loan				n_ds			datastore ที่ต้องการบรรจุข้อมูลเกี่ยวกับหนี้
</arguments> 

<return> 
	Integer				1 = success, Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 12/10/2010 by MiT
</usage> 
***********************************************************/
integer	li_resignstatus
string		ls_memno, ls_reqno
n_ds		lds_sum , lds_data
boolean	lb_err = false
datetime	ldtm_reqdate,ldtm_workdate

this.of_setsrvdwxmlie( true )

ls_memno			= astr_resigninfo.member_no
ldtm_reqdate		= astr_resigninfo.req_date
ldtm_workdate		= astr_resigninfo.entry_date

// ตรวจสอบว่ามีและลาออกหรือยัง
select 	resign_status
into		:li_resignstatus
from		mbmembmaster
where 	( member_no = :ls_memno  and coop_id = :is_coopcontrol)
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text = "ไม่พบเลขสมาชิกที่ป้อน ("+ls_memno+") กรุณาตรวจสอบ"
	lb_err = true ; goto objdestroy
end if

if li_resignstatus = 1 then
	ithw_exception.text = "เลขสมาชิก ("+ls_memno+") มีสถานะเป็นลาออกแล้ว กรุณาตรวจสอบ"
	lb_err = true ; goto objdestroy
end if

// ตรวจว่ามีการป้อนใบคำขอเอาไว้หรือยัง
ls_reqno		= this.of_chkoldreq_mbresign( ls_memno )

if len( ls_reqno ) > 0 then
	astr_resigninfo.req_no	= ls_reqno
	try
		this.of_openreq_mbresign( astr_resigninfo )
	catch( Exception lthw_openerr )
		ithw_exception.text	= lthw_openerr.text
		lb_err = true
	end try
	if lb_err then goto objdestroy
end if

lds_sum = create n_ds
lds_sum.dataobject = "d_mbsrv_req_resignsum"
lds_sum.settransobject( itr_sqlca )
lds_sum.insertrow( 0 )

lds_data = create n_ds

// ส่งคืนค่ากลับ
astr_resigninfo.xml_request = this.of_initreq_mbresignhead_pea( lds_data , ls_memno, ldtm_reqdate )
astr_resigninfo.xml_share	= this.of_initreq_mbresignshare( lds_data , ls_memno , lds_sum )
astr_resigninfo.xml_loan		= this.of_initreq_mbresignloan( lds_data , ls_memno,ldtm_workdate, lds_sum)
astr_resigninfo.xml_grt		= this.of_initreq_mbresigngrt( lds_data , ls_memno, lds_sum )
astr_resigninfo.xml_dept		= this.of_initreq_mbresigndept( lds_data , ls_memno, lds_sum )

astr_resigninfo.xml_sum		= inv_dwxmliesrv.of_xmlexport( lds_sum )

objdestroy:
if isvalid(lds_sum) then destroy lds_sum
if isvalid(lds_data) then destroy lds_data
this.of_setsrvdwxmlie( false )

if lb_err then
	ithw_exception.text = "n_cst_membsrv_allrequest.of_initreq_mbresign_pea()" + ithw_exception.text
	throw ithw_exception
end if

return 1
end function

private function string of_initreq_mbresignhead_pea (n_ds ads_data, string as_memno, datetime adtm_reqdate) throws Exception;string		ls_prename, ls_name, ls_surname, ls_grpcode, ls_grpdesc
string		ls_xmlhead
dec{2}	ldc_sharestkvalue
boolean	lb_err = false

ads_data.reset()
ads_data.dataobject	= "d_mbsrv_req_resign_pea"
 
select	a.prename_desc,		b.memb_name,		b.memb_surname,
		b.membgroup_code,	c.membgroup_desc,	d.sharestk_amt * e.unitshare_value
into	:ls_prename,			:ls_name,				:ls_surname,
		:ls_grpcode,				:ls_grpdesc,				:ldc_sharestkvalue
from	mbucfprename a, mbmembmaster b, mbucfmembgroup c, 
		shsharemaster d, shsharetype e
where( a.prename_code = b.prename_code ) and
		( b.membgroup_code = c.membgroup_code ) and
		( b.coop_id = c.coop_id ) and
		( b.member_no = d.member_no ) and
		( b.coop_id = d.coop_id ) and
		( d.sharetype_code = e.sharetype_code ) and
		( d.coop_id = e.coop_id ) and
		( b.member_no = :as_memno ) and
		( b.coop_id = :is_coopcontrol )
using itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text = "ไม่พบเลขสมาชิกที่ป้อน "+as_memno+"  "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

ads_data.insertrow( 0 )
ads_data.setitem( 1, "coop_id", is_coopid )
ads_data.setitem( 1, "member_no", as_memno )
ads_data.setitem( 1, "prename_desc", ls_prename )
ads_data.setitem( 1, "memb_name", ls_name )
ads_data.setitem( 1, "memb_surname", ls_surname )
ads_data.setitem( 1, "membgroup_code", ls_grpcode )
ads_data.setitem( 1, "membgroup_desc", ls_grpdesc )
ads_data.setitem( 1, "sharestk_amount", ldc_sharestkvalue )
ads_data.setitem( 1, "resignreq_date", adtm_reqdate )

ls_xmlhead		= inv_dwxmliesrv.of_xmlexport( ads_data )

return ls_xmlhead
end function

public function integer of_savereq_mbresign_pea (str_mbreqresign astr_resigninfo) throws Exception;
/***********************************************************
<description>
	บันทึกคำขอลาออก
</description>

</description>

<arguments>  
	as_xmlreq				String			ข้อมูลใบคำขอเปลี่ยนแปลงค่าหุ้น
	as_entryid				String			ผู้บันทึกใบคำขอ
	adtm_entrydate		Datetime		วันที่บันทึกใบคำขอ
</arguments> 

<return> 
	Integer				1 = success, Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 12/10/2010 by MiT
</usage> 
	
***********************************************************/
string		ls_entryid, ls_reqdocno,ls_coopid,ls_memcoopid
integer	li_apvimmediate
long		ll_count, ll_index, ll_rowcount
datetime	ldtm_apvdate
boolean	lb_err = false
n_ds		lds_req, lds_share, lds_loan, lds_grt, lds_dept

this.of_setsrvdwxmlie( true )
this.of_setsrvdoccontrol( true )

lds_req		= create n_ds
lds_req.dataobject		= "d_mbsrv_req_resign_pea"
lds_req.settransobject( itr_sqlca )

lds_share		= create n_ds
lds_share.dataobject		= "d_mbsrv_req_resignshare"
lds_share.settransobject( itr_sqlca )

lds_loan		= create n_ds
lds_loan.dataobject		= "d_mbsrv_req_resignloan"
lds_loan.settransobject( itr_sqlca )

lds_grt		= create n_ds
lds_grt.dataobject		= "d_mbsrv_req_resigngrt"
lds_grt.settransobject( itr_sqlca )

lds_dept		= create n_ds
lds_dept.dataobject		= "d_mbsrv_req_resigndeposit"
lds_dept.settransobject( itr_sqlca )

ls_entryid		= astr_resigninfo.entry_id

// import ข้อมูลเข้า
ll_rowcount		= inv_dwxmliesrv.of_xmlimport( lds_req, astr_resigninfo.xml_request )
if ( ll_rowcount < 1 ) then
	ithw_exception.text = "ใบคำขอที่ส่งเข้ามาไม่มีข้อมูลสำหรับทำรายการได้ กรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

ldtm_apvdate	= lds_req.object.apv_date[1]

try
	// ตรวจสอบข้อมูลก่อนบันทึก
	this.of_chkbeforesave_mbresign( lds_req )
	inv_dwxmliesrv.of_xmlimport( lds_share, astr_resigninfo.xml_share )
	inv_dwxmliesrv.of_xmlimport( lds_loan, astr_resigninfo.xml_loan )
	inv_dwxmliesrv.of_xmlimport( lds_grt, astr_resigninfo.xml_grt )
	inv_dwxmliesrv.of_xmlimport( lds_dept, astr_resigninfo.xml_dept )
catch(Exception lthw_imperror)
	lb_err = true
end try
if lb_err then Goto objdestroy

// ใส่เลขที่เอกสาร
ls_reqdocno		= trim( lds_req.getitemstring( 1, "resignreq_docno" ) )

// ตรวจว่าเป็นคำขอใหม่หรือเก่า ถ้าเก่าต้องลบข้อมุลเก่าออกก่อนแล้วค่อยบันทึก
if ( lower( ls_reqdocno ) = "auto" ) or isnull( ls_reqdocno ) or ls_reqdocno = "" then
	ls_reqdocno = inv_docsrv.of_getnewdocno( is_coopcontrol,"MBRSGDOCNO" )	
else	
	delete from mbreqresignshare where resignreq_docno = :ls_reqdocno and coop_id = :is_coopcontrol using itr_sqlca ;
	delete from mbreqresignloan where resignreq_docno = :ls_reqdocno and coop_id = :is_coopcontrol using itr_sqlca ;
	delete from mbreqresigndept where resignreq_docno = :ls_reqdocno and coop_id = :is_coopcontrol using itr_sqlca ;
	delete from mbreqresigngrt where resignreq_docno = :ls_reqdocno and coop_id = :is_coopcontrol using itr_sqlca ;
	delete from mbreqresign where resignreq_docno = :ls_reqdocno and coop_id = :is_coopcontrol using itr_sqlca ;	
end if

lds_req.setitem( 1, "coop_id", is_coopcontrol )
lds_req.setitem( 1, "resignreq_docno", ls_reqdocno )
lds_req.setitem( 1, "entry_id", ls_entryid )
lds_req.setitem( 1, "entry_bycoopid", is_coopid )
lds_req.setitem( 1, "entry_date", datetime( today() , now() ) )	

lds_share.setitem( 1, "coop_id", is_coopcontrol )
lds_share.setitem( 1, "resignreq_docno", ls_reqdocno )
lds_share.setitem( 1, "seq_no", 1 )

for ll_index = 1 to lds_loan.rowcount()
	lds_loan.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_loan.setitem( ll_index, "resignreq_docno", ls_reqdocno )
	lds_loan.setitem( ll_index, "seq_no", ll_index )
next

for ll_index = 1 to lds_grt.rowcount()
	lds_grt.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_grt.setitem( ll_index, "resignreq_docno", ls_reqdocno )
	lds_grt.setitem( ll_index, "seq_no", ll_index )
next

for ll_index = 1 to lds_dept.rowcount()
	lds_dept.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_dept.setitem( ll_index, "resignreq_docno", ls_reqdocno )
	lds_dept.setitem( ll_index, "seq_no", ll_index )
next

// -----------------------
// เริ่มกระบวนการบันทึก
// -----------------------
// บันทึก Master
if lds_req.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบลาออกสมาชิกไม่ได้  "
	ithw_exception.text	+= ls_reqdocno +"~n~r"+ lds_req.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// บันทึก Share
if lds_share.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบลาออกสมาชิก  ส่วนหุ้นคงเหลือไม่ได้  "
	ithw_exception.text	+= ls_reqdocno +"~n~r"+ lds_share.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// บันทึก loan
if lds_loan.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบลาออกสมาชิก  ส่วนหนี้คงเหลือไม่ได้  "
	ithw_exception.text	+= ls_reqdocno +"~n~r"+ lds_loan.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// บันทึก คนค้ำ
if lds_grt.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบลาออกสมาชิก  ส่วนการติดค้ำประกันไม่ได้  "
	ithw_exception.text	+= ls_reqdocno +"~n~r"+ lds_grt.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// บันทึก เงินฝาก
if lds_dept.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบลาออกสมาชิก  ส่วนเงินฝากคงเหลือไม่ได้  "
	ithw_exception.text	+= ls_reqdocno +"~n~r"+ lds_dept.of_geterrormessage()
	lb_err = true ; Goto objdestroy
end if

// อนุมัติเลยหรือไม่
li_apvimmediate	= lds_req.getitemnumber( 1, "apvflag" )

if ( li_apvimmediate = 1 ) then
	try
		this.of_postapv_mbresign( ls_reqdocno, ls_entryid, ldtm_apvdate )
	catch( Exception lthw_postapverr )
		ithw_exception.text	= lthw_postapverr.text
		lb_err = true
	end try
	if lb_err then Goto objdestroy
	
	update	mbreqresign
	set			resignreq_status		= 1,
				apv_id					= :ls_entryid,
				apv_date					= :ldtm_apvdate
	where	( resignreq_docno		= :ls_reqdocno  
	and 		coop_id 					= :is_coopcontrol )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ไม่สามารถปรับปรุงสถานะใบคำขอลาออกให้เป็นอนุมัติได้ ~n" + itr_sqlca.sqlerrtext
		lb_err = true ; Goto objdestroy
	end if
end if

objdestroy:
if isvalid(lds_req) then destroy lds_req
if isvalid(lds_share) then destroy lds_share
if isvalid(lds_loan) then destroy lds_loan
if isvalid(lds_grt) then destroy lds_grt
if isvalid(lds_dept) then destroy lds_dept

this.of_setsrvdoccontrol( false )
this.of_setsrvdwxmlie( false )

if lb_err then
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_membsrv_allrequest.of_savereq_mbresign_pea()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

return 1
end function

private function integer of_postapv_trnmb (string as_memold, string as_memnew, datetime adtm_apvdate) throws Exception;string		ls_memnew, ls_memold
string		ls_tbname , ls_ins01 , ls_ins02 , ls_ins , ls_update , ls_del
string		ls_column , ls_coopcontrol
integer 	li_index

ls_memold		= "'" + as_memold + "'"
ls_memnew		= "'" + as_memnew + "'"
ls_coopcontrol	= "'" + is_coopcontrol + "'"

for li_index = 1 to 2
	
	ls_tbname	= ""
	ls_column	= ""
	ls_ins01 		= ""
	ls_ins02 		= ""
	ls_ins 		= ""
	ls_update 	= ""
	ls_del			= ""
	
	if li_index = 1 then ls_column = "MEMBER_NO"
	if li_index = 2 then ls_column = "REF_COLLNO"
	
	// หา table ที่เป็น primary key ให้นำเข้าไปอีกคน
	declare data_inspk cursor for
	select utc.table_name , 'insert into ' || utc.table_name || ' ( ' || wm_concat( utc.column_name ) || ' )' as ins01clm ,
	' select ' || replace( wm_concat( utc.column_name ) , :ls_column , :ls_memnew ) || ' from ' || utc.table_name || ' where coop_id = ' || :ls_coopcontrol || ' and ' || :ls_column || ' = ' || :ls_memold  as ins02clm
	from user_tab_columns utc
	where exists( 
						select ucc.table_name
						from user_cons_columns ucc
						where ucc.constraint_name in ( select constraint_name from user_constraints ucs where constraint_type = 'P' )
						and upper( ucc.column_name ) = :ls_column
						and ucc.table_name = utc.table_name
					)
	and exists( 
						select ucc.table_name
						from user_cons_columns ucc
						where ucc.constraint_name in ( select constraint_name from user_constraints ucs where constraint_type = 'P' )
						and upper( ucc.column_name ) = ( 'COOP_ID' )
						and ucc.table_name = utc.table_name
					)
	group by utc.table_name
	order by utc.table_name
	using itr_sqlca ;
	open data_inspk ;
		fetch data_inspk into :ls_tbname , :ls_ins01 , :ls_ins02 ;
		do while itr_sqlca.sqlcode = 0
			
			ls_ins		= ls_ins01 + ls_ins02
			
			execute immediate :ls_ins using itr_sqlca;
			if itr_sqlca.sqlcode = -1 then 
				ithw_exception.text = "ไม่สามารถปรับปรุงการโอนย้ายสมาชิกได้ 70.1 ~n" + itr_sqlca.sqlerrtext
				throw ithw_exception
			end if
			fetch data_inspk into :ls_tbname , :ls_ins01 , :ls_ins02 ;
		loop
	close data_inspk ;
	
	// หา table ที่ไม่ใช่ primary key ให้อัพเดทค่าไปเลย
	declare data_update cursor for
	select utc.table_name , 
	'update ' || utc.table_name || ' set ' || :ls_column || ' = ' || :ls_memnew || ' where coop_id = ' || :ls_coopcontrol || ' and ' || :ls_column || ' = ' || :ls_memold as clmname 
	from user_tab_columns utc
	where exists( 
							select tbname
							from (
								select ucc.table_name as tbname
								from user_tab_columns ucc , user_tables ut
								where ucc.table_name = ut.table_name
								and upper( ucc.column_name ) = :ls_column
								and ut.tablespace_name = 'USERS'
								minus
								select ucc.table_name as tbname
								from user_cons_columns ucc , user_tables ut
								where ucc.table_name = ut.table_name
								and ut.tablespace_name = 'USERS'
								and ucc.constraint_name in ( select constraint_name from user_constraints ucs where constraint_type = 'P' )
								and upper( ucc.column_name ) = :ls_column
							) tb
							where tb.tbname = utc.table_name
					)
	and exists( 
						select ucc.table_name
						from user_cons_columns ucc
						where ucc.constraint_name in ( select constraint_name from user_constraints ucs where constraint_type = 'P' )
						and upper( ucc.column_name ) = ( 'COOP_ID' )
						and ucc.table_name = utc.table_name
				)
	group by utc.table_name
	order by utc.table_name 
	using itr_sqlca ;
	open data_update ;
		fetch data_update into :ls_tbname , :ls_update ;
		do while itr_sqlca.sqlcode = 0
			
			execute immediate :ls_update using itr_sqlca;
			if itr_sqlca.sqlcode = -1 then 
				ithw_exception.text = "ไม่สามารถปรับปรุงการโอนย้ายสมาชิกได้ 70.2 ~n" + itr_sqlca.sqlerrtext
				throw ithw_exception
			end if
			fetch data_update into :ls_tbname , :ls_update ;
		loop
	close data_update ;
	
	// ลบข้อมูลที่มี pk แต่ไม่ใช่ ทะเบียนสมาชิกหลัก
	declare data_del cursor for
	select utc.table_name , 'delete from ' || utc.table_name || ' where coop_id = ' || :ls_coopcontrol || ' and ' || :ls_column || ' = ' || :ls_memold as delclm
	from user_tab_columns utc
	where exists( 
						select ucc.table_name
						from user_cons_columns ucc
						where ucc.constraint_name in ( select constraint_name from user_constraints ucs where constraint_type = 'P' )
						and upper( ucc.column_name ) = :ls_column
						and ucc.table_name = utc.table_name
					)
	and exists( 
						select ucc.table_name
						from user_cons_columns ucc
						where ucc.constraint_name in ( select constraint_name from user_constraints ucs where constraint_type = 'P' )
						and upper( ucc.column_name ) = ( 'COOP_ID' )
						and ucc.table_name = utc.table_name
					)
	and upper( utc.table_name ) <> 'MBMEMBMASTER'
	group by utc.table_name
	order by utc.table_name 
	using itr_sqlca ;
	open data_del ;
		fetch data_del into :ls_tbname , :ls_del ;
		do while itr_sqlca.sqlcode = 0
			
			execute immediate :ls_del using itr_sqlca;
			if itr_sqlca.sqlcode = -1 then 
				ithw_exception.text = "ไม่สามารถปรับปรุงการโอนย้ายสมาชิกได้ 70.3 ~n" + itr_sqlca.sqlerrtext
				throw ithw_exception
			end if
			fetch data_del into :ls_tbname , :ls_del ;
		loop
	close data_del ;
next

// update ให้สมาชิกอันเดิมปิดบัญชีไป
update mbmembmaster
set resign_status = 2 ,
	resign_date = :adtm_apvdate,
member_status = -1
where coop_id = :is_coopcontrol
and member_no = :as_memold
using itr_sqlca ;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text = "ไม่สามารถปรับปรุงการโอนย้ายสมาชิกได้ 70.4 ~n" + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// update สถานะให้เป็นปกติ
update mbmembmaster
set member_type = 1,
	membtrans_date = :adtm_apvdate,
	membtrans_status = 1
where coop_id = :is_coopcontrol
and member_no = :as_memnew
and member_type = 2
using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text = "ไม่สามารถปรับปรุงการโอนย้ายสมาชิกได้ 70.5 ~n" + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

on n_cst_membsrv_allrequest.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_membsrv_allrequest.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;this.of_setsrvdwxmlie( false )
end event

event constructor;/***************************************************************
<object>
เป็น Object ที่รวบรวมฟังก์ชั่นสำหรับการทำงานที่เกี่ยวข้องกับการทำรายการเงินกู้ต่างๆ
เช่นการจ่ายเงินกู้ การชำระ การโอนหนี้ การยกเลิก การปรับปรุง ฯลฯ
เมื่อมีการประกาศ Object นี้เสร็จแล้วจำเป็นที่จะต้องเรียกใช้ฟังก์ชั่น
of_initservice( transection ) เพื่อกำหนดตัวแปรหรือค่าคงที่ต่างๆที่จำเป็นสำหรับ
การทำงานของ Object 
</object>
	  
<author>
	Initial Version by Oh ho
</author>
 
<usage>  
  	ตัวอย่างการเรียกใช้งาน
	n_cst_loansrv_lnoperate		lnv_lnoperate 
	lnv_lnoperate	= create n_cst_loansrv_lnoperate
	lnv_lnoperate.initservice( transection ) 
</usage> 
****************************************************************/ 

// ประกาศ Throw สำหรับ Err
ithw_exception	= create Exception
end event
