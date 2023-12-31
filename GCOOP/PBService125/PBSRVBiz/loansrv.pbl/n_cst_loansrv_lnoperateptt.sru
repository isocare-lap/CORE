$PBExportHeader$n_cst_loansrv_lnoperateptt.sru
forward
global type n_cst_loansrv_lnoperateptt from NonVisualObject
end type
end forward

global type n_cst_loansrv_lnoperateptt from NonVisualObject
end type
global n_cst_loansrv_lnoperateptt n_cst_loansrv_lnoperateptt

type variables
n_ds		ids_infomemdet, ids_infomemcont, ids_infocont, ids_inforeqloan, ids_infosliptype

transaction		itr_sqlca
Exception		ithw_exception

n_cst_dbconnectservice		inv_transection
n_cst_loansrv_interest		inv_intsrv
n_cst_doccontrolservice		inv_docsrv
n_cst_calendarservice		inv_calendarsrv
n_cst_datetimeservice		inv_datetimesrv
n_cst_dwxmlieservice			inv_dwxmliesrv
n_cst_loansrv_lnfinance		inv_lnfin
n_cst_finance_service			inv_finsrv
n_cst_deposit_service			inv_deptsrv
n_cst_loansrv_lnoperate		inv_lnopecore
 
string		is_coopcontrol, is_coopid
String is_appv_contno 
datetime	idtm_canceldate , idtm_operdate

constant int STATUS_SHARE_ARREAR		= 5 	// สถานะหุ้นค้าง
constant int STATUS_PENDING = 8
constant int STATUS_CLOSE	= -1
constant int STATUS_NORMAL	= 1

constant string	DWO_PAYOUTSLIP	= "d_loansrv_lnpayout_slip"
constant string	DWO_PAYINSLIP 		= "d_loansrv_lnpayin_slip"
constant string	DWO_PAYINSLIPDET	= "d_loansrv_lnpayin_slipdet"
end variables

forward prototypes
public function integer of_initslippayin (ref str_slippayin astr_initpayin) throws Exception
public function integer of_saveslip_payin (ref str_slippayin astr_lnslip) throws Exception
public function integer of_initlnrcv (ref str_slippayout astr_initpayout) throws Exception
private function integer of_poststm_contract (str_poststmloan astr_lnstatement) throws Exception
public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception
public function integer of_saveslip_lnrcv (ref str_slippayout astr_lnslip) throws Exception
public function integer of_saveccl_payin (str_slipcancel lstr_slipcancel) throws Exception
public function integer of_initlnrcv_recalint (ref str_slippayout astr_slip) throws Exception
public function integer of_initslippayin_calint (ref string as_xmlloan, string as_sliptype, datetime adtm_opedate) throws Exception
private function integer of_setsrvdoccontrol (boolean ab_switch)
private function integer of_setsrvdatetime (boolean ab_switch)
private function integer of_setsrvlninterest (boolean ab_switch)
private function any of_getattribsliptype (string as_sliptype, string as_attrib)
public function integer of_saveccl_lnrcv (str_slipcancel astr_slipcancel) throws Exception
private function integer of_setsrvcalendar (boolean ab_switch)
public function integer of_setdsmodify (ref n_ds ads_requester, long al_row, boolean ab_keymodify)
private function integer of_setsrvdwxmlie (boolean ab_switch)
private function integer of_poststm_share (str_poststmshare astr_infoshrstm) throws Exception
private function integer of_postccl_payinloan (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function integer of_postccl_payinshare (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
public function integer of_initshrwtd (ref str_slippayout atr_payoutslip) throws Exception
private function integer of_postslip_sharewtd (ref n_ds ads_slippayout) throws Exception
public function integer of_saveccl_shrwtd (str_slipcancel astr_cancelslip) throws Exception
public function integer of_saveslip_shrwtd (ref str_slippayout astr_shrpayout) throws Exception
private function integer of_postccl_shrwtd (ref n_ds ads_payoutslip) throws Exception
private function integer of_postccl_lnrcv (n_ds ads_payoutslip) throws Exception
private function integer of_postslip_lnmoneyret (n_ds ads_payoutslip, n_ds ads_payoutslipdet) throws Exception
private function integer of_postslip_payinintfuture (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function integer of_postslip_payinloan (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function integer of_postslip_payinshare (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function integer of_initlnrcv_headcalint (ref n_ds ads_payoutslip) throws Exception
private function integer of_transpayin (ref str_slippayout astr_slip) throws Exception
public function integer of_setintreturn (ref string as_xmlloan, datetime adtm_opedate) throws Exception
public function integer of_initshrwtd_recalint (ref str_slippayout astr_slip) throws Exception
public function integer of_initslippayin_initclear (ref string as_xmlloan, ref string as_xmletc, decimal adc_allpayamt) throws Exception
private function integer of_setabsmoneyretdet (ref n_ds ads_payoutslipdet)
public function integer of_initshrwtd_initclear (ref string as_xmlloan, ref string as_xmletc, ref decimal adc_shrstkvalue) throws Exception
private function integer of_setabspayindet (ref n_ds ads_payinslipdet) throws Exception
public function string of_gennewcontractno (string as_coopid, string as_loantype) throws Exception
private function string of_initslippayin_loan (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception
private function string of_initslippayin_head (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_slipdate, datetime adtm_opedate) throws Exception
private function string of_initslippayin_share (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception
public function integer of_postupd_memintaccum (string as_coopid, string as_memno, datetime adtm_intdate, decimal adc_intaccum) throws Exception
private function string of_initslippayin_etc (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception
private function integer of_setintspceffectdate (string as_coopid, string as_contno, datetime adtm_rcvdate) throws Exception
public function datetime of_getmaxcalintdatecontract (n_ds ads_contdata)
private function string of_initlnrcv_seqfirstperiod (ref n_ds ads_payoutslip) throws Exception
private function integer of_postslip_payinseqfirstperiod (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
public function datetime of_getmaxcalintdatepayin (n_ds ads_payinslipdet, long al_chkrow, datetime adtm_opedate)
public function integer of_posttrn_depttran (str_posttrans astr_postdptrn) throws Exception
public function integer of_posttrn_trnpayin (str_posttrans astr_posttrans) throws Exception
private function integer of_postslip_lnrcv (n_ds ads_payoutslip, string as_concoopid) throws Exception
public function integer of_saveapv_lnreq (ref string as_xmlreqlist, string as_apvid, string as_concoopid, datetime adtm_apvdate) throws Exception
public function integer of_setsrvfin (boolean ab_switch) throws Exception
public function integer of_setsrvfiniance (boolean ab_switch) throws Exception
private function string of_initlnrcv_clrloan (string as_memcoopid, string as_memno, string as_contno, string as_reqno, string as_sliptype, datetime adtm_opedate, string as_lnrcvloantype) throws Exception
private function string of_initlnrcv_clrother (string as_memcoopid, string as_memno, string as_reqno, string as_sliptype, datetime adtm_opedate) throws Exception
private function integer of_initlnrcv_headcontno (string as_contno, datetime adtm_slipdate, datetime adtm_rcvdate, ref n_ds ads_payoutslip) throws Exception
private function integer of_initlnrcv_headreqno (string as_reqno, datetime adtm_slipdate, datetime adtm_opedate, ref n_ds ads_payoutslip) throws Exception
public function integer of_buildcontno_reqloan (string as_reqloan, ref string as_contno) throws Exception
public function integer of_postslip_returnetc (n_ds ads_payoutslip) throws Exception
public function integer of_postslip_payinreturnetc (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function integer of_postslip_payinetc (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
public function integer of_saveset_intarrear (string as_xmlsetint, string as_entryid) throws Exception
public function decimal of_calinterest (string as_ccoopid, string as_contno, decimal adc_prncalint, datetime adtm_calintfrom, datetime adtm_calintto) throws Exception
public function integer of_initslippayout (ref str_slippayout astr_initpayout) throws Exception
private function integer of_postslip_payoutmav (n_ds ads_payoutslip, n_ds ads_payoutslipdet) throws Exception
protected function integer of_initslippayout_mav (ref str_slippayout astr_initpayout) throws Exception
public function integer of_initslipmoneyret (ref str_slippayout astr_initpayout) throws Exception
private function integer of_postccl_payinetc (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function string of_getcalintcontintspc (string as_contno, datetime adtm_rcvdate, datetime adtm_procdate) throws Exception
private function string of_getcalintreqintspc (string as_reqno, datetime adtm_rcvdate) throws Exception
private function string of_getcalintreqloan (string as_reqno) throws Exception
private function string of_initlnrcv_futureint (ref n_ds ads_payoutslip) throws Exception
protected function integer of_setsrvdeposit (boolean ab_switch) throws Exception
public function integer of_deptsequest (string as_contno, datetime adtm_seqdate) throws Exception
public function integer of_deptdesequest (string as_contno, datetime adtm_seqdate) throws Exception
private function integer of_initslippayin_calint (ref n_ds ads_payinslipdet, string as_sliptype, datetime adtm_opedate) throws Exception
private function integer of_initshrwtd_initclear (ref n_ds ads_payinslipdet, ref decimal adc_shrstkvalue) throws Exception
private function integer of_postseq_lnrcv (string as_contno, n_ds ads_payindet, datetime adtm_lnrcv) throws Exception
private function integer of_postseq_lnrcvccl (n_ds ads_payoutslip) throws Exception
private function integer of_setmoneyreturn (n_ds ads_payinslip, ref n_ds ads_payinslipdet) throws Exception
public function integer of_postslip_payintodept (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
public function integer of_setsrvlnoperatecore (boolean ab_switch) throws Exception
private function integer of_setintreturn (ref n_ds ads_payinslipdet, datetime adtm_opedate) throws Exception
private function integer of_initslippayin_calfine (n_ds ads_slipdetloan, ref n_ds ads_slipdetetc, string as_sliptype, datetime adtm_opedate) throws Exception
public function integer of_initslippayin_calfine (string as_xmlloan, ref string as_xmletc, string as_sliptype, datetime adtm_operate) throws Exception
end prototypes

public function integer of_initslippayin (ref str_slippayin astr_initpayin) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายการหุ้นและรายการเงินกู้ที่มีอยู่ของสมาชิกเพื่อเตรียมไว้สำหรับการชำระเงิน
</description>

<arguments>  
	str_slippayin		Structure รายการ Slip รับชำระ
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String			ทะเบียนสมาชิก
		- sliptype_code			String			ประเภทการชำระ(PX,PMP, etc.)
		- slip_date				datetime		วันที่ Slip
		- operate_date			datetime		วันที่รับชำระ
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะ Generate XML สัญญาเงินกู้ที่จะจ่าย
	XML สัญญาเงินกู้ที่จะหักกลบ, XML รายการหักอื่นๆ ให้
	
	str_slippayin		lstr_slippayin
	
	lstr_slippayin.member_no		= dw_main.getitemstring( ll_row, "member_no" )
	lstr_slippayin.sliptype_code		= dw_main.getitemstring( ll_row, "sliptype_code" )
	lstr_slippayin.slip_date			= system_date
	lstr_slippayin.operate_date		= system_date
	
	lnv_lnoperate.of_initslippayin( lstr_slippayin )
	
	dw_main.reset()
	dw_main.importstring( XML!, lstr_slippayin.xml_sliphead )
	
	dw_share.reset()
	dw_share.importstring( XML!, lstr_slippayin.xml_slipshr )
	
	dw_loan.reset()
	dw_loan.importstring( XML!, lstr_slippayin.xml_sliplon )
	
	dw_etc.reset()
	dw_etc.importstring( XML!, lstr_slippayin.xml_slipetc )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_memcoopid, ls_contno, ls_sliptype, ls_itemcode, ls_desc, ls_dataxml
long		ll_count, ll_index, ll_row, ll_cont
integer	li_memstatus
dec{2}	ldc_prinbalance
datetime	ldtm_opedate, ldtm_slipdate

// ข้อมูลการ init ค่า
ls_memno		= trim( astr_initpayin.member_no )
ls_memcoopid	= trim( astr_initpayin.memcoop_id )
ls_sliptype		= trim( astr_initpayin.sliptype_code )
ldtm_slipdate	= astr_initpayin.slip_date
ldtm_opedate	= astr_initpayin.operate_date

select	member_status
into :li_memstatus
from mbmembmaster
where coop_id = :ls_memcoopid
and member_no = :ls_memno
using itr_sqlca ;

if li_memstatus = -1 then
	ithw_exception.Text = "สมาชิกคนนี้ได้ปิดบัญชีสมาชิกไปแล้ว ไม่สามารถทำรายการได้อีก"
	throw ithw_exception
end if

// init head
astr_initpayin.xml_sliphead	= this.of_initslippayin_head( ls_memcoopid, ls_memno, ls_sliptype, ldtm_slipdate, ldtm_opedate )

// init share
astr_initpayin.xml_slipshr	= this.of_initslippayin_share( ls_memcoopid, ls_memno, ls_sliptype, ldtm_opedate )

// init slip loan
astr_initpayin.xml_sliplon		= this.of_initslippayin_loan( ls_memcoopid, ls_memno, ls_sliptype, ldtm_opedate )

// init slip etc
astr_initpayin.xml_slipetc		= this.of_initslippayin_etc( ls_memcoopid, ls_memno, ls_sliptype, ldtm_opedate )

return 1
end function

public function integer of_saveslip_payin (ref str_slippayin astr_lnslip) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกรายการรับชำระเงินต่างๆ เช่นรายการรับชำระหุ้น รับชำระหนี้ etc.
</description>

<arguments>  
	str_slippayin		Structure รายการ Slip รับชำระ
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_sliphead		String			XML รายละเอียดใบรับชำระ
		- xml_slipshr		String			XML รายการซื้อหุ้น
		- xml_sliplon		String			XML รายการชำระหนี้
		- xml_slipetc		String			XML รายการชำระอื่นๆ
		- entry_id			string			ผู้ทำรายการ
		- coop_id			String			สาขาที่ทำรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะทำการบันทึกใบรับชำระ
	และปรับปรุงยอดคงเหลือต่างๆในสัญญา
	
	str_slippayin		lstr_slippayin
	
	lstr_slippayin.xml_sliphead	= dw_head.describe( "Datawindow.Data.XML" )
	lstr_slippayin.xml_slipshr		= dw_share.describe( "Datawindow.Data.XML" )
	lstr_slippayin.xml_sliplon		= dw_loan.describe( "Datawindow.Data.XML" )
	lstr_slippayin.xml_slipetc		= dw_other.describe( "Datawindow.Data.XML" )
	lstr_slippayin.entry_id			= entry_id
	lstr_slippayin.coop_id		= coop_id
	
	lnv_lnoperate.of_saveslip_payin( lstr_slippayin )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_payinslipno, ls_slipitemtype, ls_slipitemprior, ls_moneytype, ls_memno,ls_memcoopid
string		ls_entryid, ls_coopid, ls_receiptno, ls_sliptype, ls_refaccno, ls_refslipno,ls_cancelslip
long		ll_index, ll_count, ll_seqno, ll_find
dec{2}	ldc_sumpayamt, ldc_shrstksum
datetime	ldtm_entrydate, ldtm_opedate
boolean	lb_printreceipt
n_ds		lds_payinslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslip	= create n_ds
lds_payinslip.dataobject	= DWO_PAYINSLIP
lds_payinslip.settransobject( itr_sqlca )

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

ls_entryid		= astr_lnslip.entry_id
ls_coopid			= astr_lnslip.coop_id
ls_memcoopid	= astr_lnslip.memcoop_id
ldtm_entrydate	= datetime( today(), now() )

// Import หัว slip
inv_dwxmliesrv.of_xmlimport( lds_payinslip, astr_lnslip.xml_sliphead )

ls_memno		= lds_payinslip.getitemstring( 1, "member_no" )
ls_sliptype		= lds_payinslip.getitemstring( 1, "sliptype_code" )
ls_moneytype	= lds_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_opedate	= lds_payinslip.getitemdatetime( 1, "operate_date" )

// Import รายละเอียดการชำระ
lds_payinslipdet.reset()
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, astr_lnslip.xml_slipshr )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, astr_lnslip.xml_sliplon )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, astr_lnslip.xml_slipetc )

// ตรวจเช็คจำนวนแถว
ll_count		= lds_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

// กรองให้เหลือแต่พวกที่ทำรายการเท่านั้น
lds_payinslipdet.setfilter( "operate_flag > 0 and item_payamt > 0" )
lds_payinslipdet.filter()
	
// ลบพวกไม่ทำรายการทิ้งไป
lds_payinslipdet.rowsdiscard( 1, lds_payinslipdet.filteredcount(), filter! )

// ตรวจเช็คจำนวนแถวอีกที
ll_count		= lds_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

// ใส่ข้อมูลการชำระให้ครบถ้วน
this.of_setabspayindet( lds_payinslipdet )

// ใส่ข้อมูลส่วนการคืนดอกเบี้ย
//this.of_setmoneyreturn( lds_payinslip, lds_payinslipdet )

// ยอดชำระทั้งหมด
ldc_sumpayamt		= dec( lds_payinslipdet.describe( "evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', "+string( ll_count )+" )" ) )

// ตรวจสอบว่ามีการทำรายการหุ้นมั้ย
ll_find		= lds_payinslipdet.find( "slipitemtype_code = 'SHR'", 1, lds_payinslipdet.rowcount() )
if ll_find > 0 then
	ldc_shrstksum		= lds_payinslipdet.getitemdecimal( ll_find, "item_balance" )
	
	lds_payinslip.setitem( 1, "sharestk_value", ldc_shrstksum )
end if

// เรียงตามประเภทรายการ
lds_payinslipdet.setsort( "slipitemtype_code asc" )
lds_payinslipdet.sort()

lb_printreceipt		= true

// ขอเลขที่ Slip, เลขที่ใบเสร็จ
this.of_setsrvdoccontrol( true )
ls_payinslipno	= inv_docsrv.of_getnewdocno( is_coopcontrol, "SLSLIPPAYIN" )

if lb_printreceipt then
	ls_receiptno		= inv_docsrv.of_getnewdocno( is_coopcontrol, "SLRECEIPTNO" )
else
	ls_receiptno		= ""
end if

this.of_setsrvdoccontrol( false )

// ใส่เลขที่ Slip ใน Header
lds_payinslip.setitem( 1, "coop_id", is_coopcontrol )
lds_payinslip.setitem( 1, "memcoop_id", is_coopcontrol )
lds_payinslip.setitem( 1, "payinslip_no", ls_payinslipno )
lds_payinslip.setitem( 1, "document_no", ls_receiptno )
lds_payinslip.setitem( 1, "slip_amt", ldc_sumpayamt )
lds_payinslip.setitem( 1, "entry_id", ls_entryid )
lds_payinslip.setitem( 1, "entry_date", ldtm_entrydate )
lds_payinslip.setitem(1, "entry_bycoopid", is_coopid)
lds_payinslip.setitem(1, "slip_status", 1)

// ใส่เลขที่ Slip และลำดับที่ใน detail
for ll_index = 1 to ll_count
	ls_slipitemtype		= lds_payinslipdet.getitemstring( ll_index, "slipitemtype_code" )
	
	if ls_slipitemtype <> ls_slipitemprior then
		ll_seqno			= 0
		ls_slipitemprior	= ls_slipitemtype
	end if
	
	ll_seqno ++
	
	lds_payinslipdet.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_payinslipdet.setitem( ll_index, "payinslip_no", ls_payinslipno )
	lds_payinslipdet.setitem( ll_index, "seq_no", ll_seqno )
next

// ------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// ต้องบันทึกก่อนแล้วค่อยผ่านรายการ
// เพราะ กระบวนการผ่านรายการมีการ Reset DS payinslipdet ระวังด้วย
// ------------------------------------------

// บันทึก Slip
if lds_payinslip.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip ไม่ได้"
	ithw_exception.text	+= lds_payinslip.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Slip Detail
if lds_payinslipdet.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล SlipDet ไม่ได้"
	ithw_exception.text	+= lds_payinslipdet.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ผ่านรายการหุ้นหนี้และอื่นๆ
try
	// ผ่านรายการหุ้น
	this.of_postslip_payinshare( lds_payinslip, lds_payinslipdet )
	
	// ผ่านรายการหนี้
	this.of_postslip_payinloan( lds_payinslip, lds_payinslipdet )
	
	// ผ่านรายการอื่นๆ
	this.of_postslip_payinetc(  lds_payinslip, lds_payinslipdet )
	
	//ผ่านรายการกองทุนกสส. ของ PEA by num
	this.of_postslip_payinreturnetc( lds_payinslip, lds_payinslipdet )
catch ( Exception lthw_posterr )
	rollback using itr_sqlca ;
	throw lthw_posterr
end try
	
commit using itr_sqlca ;

// มีการปรับปรุงข้อมูลเลยต้อง export เป็น xml อีกทีเพื่อส่งกลับ
astr_lnslip.xml_sliphead	= string( lds_payinslip.describe( "Datawindow.data.XML" ) )
astr_lnslip.xml_slipshr	= ""
astr_lnslip.xml_sliplon		= ""
astr_lnslip.xml_slipetc		= ""

// รายการหุ้น
ll_find		= lds_payinslipdet.find( "slipitemtype_code = 'SHR'", 1, lds_payinslipdet.rowcount() )
if ll_find > 0 then
	lds_payinslipdet.setfilter( "slipitemtype_code = 'SHR'" )
	lds_payinslipdet.filter()
	astr_lnslip.xml_slipshr	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )
end if

// รายการหนี้
ll_find		= lds_payinslipdet.find( "slipitemtype_code = 'LON'", 1, lds_payinslipdet.rowcount() )
if ll_find > 0 then
	lds_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
	lds_payinslipdet.filter()
	astr_lnslip.xml_sliplon	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )
end if

// รายการอื่นๆ
ll_find		= lds_payinslipdet.find( "slipitemtype_code not in ( 'LON', 'SHR' )", 1, lds_payinslipdet.rowcount() )
if ll_find > 0 then
	lds_payinslipdet.setfilter( "slipitemtype_code not in ( 'LON', 'SHR' )" )
	lds_payinslipdet.filter()
	
	astr_lnslip.xml_slipetc	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )
end if

if lb_printreceipt then
	astr_lnslip.payinslip_no		= ls_payinslipno
else
	astr_lnslip.payinslip_no		= ""
end if

return 1
end function

public function integer of_initlnrcv (ref str_slippayout astr_initpayout) throws Exception;string ls_initfrom, ls_xmlcutloan, ls_xmlcutother, ls_xmlfutureint
string ls_memno, ls_contreqno, ls_reqno, ls_contno, ls_loantype
string ls_memcoopid, ls_objcode
integer li_rcvperiod, li_intfutureflag, li_clcfirstonly, li_clccclworksht_flag
dec{2}ldc_lnrcvamt, ldc_lnrcvclr, ldc_lnrcvnet, ldc_receiveatm, ldc_payamtatm, ldc_lnapproveamt, ldc_maxrec
dec{4}ldc_recpercent, ldc_sumintret
boolean lb_error = false
datetime ldtm_slipdate, ldtm_rcvdate
n_ds lds_payoutslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip = create n_ds
lds_payoutslip.dataobject = DWO_PAYOUTSLIP
lds_payoutslip.settransobject(itr_sqlca)

lds_payinslipdet = create n_ds
lds_payinslipdet.dataobject = DWO_PAYINSLIPDET
lds_payinslipdet.settransobject(itr_sqlca)

// รับค่า
ls_initfrom = astr_initpayout.initfrom_type
ls_contreqno = astr_initpayout.loancontract_no
ldtm_slipdate = astr_initpayout.slip_date
ldtm_rcvdate = astr_initpayout.operate_date

astr_initpayout.xml_sliphead = ""
astr_initpayout.xml_slipcutlon = ""
astr_initpayout.xml_slipcutetc = ""

ls_reqno = ""
ls_contno = ""

choose case ls_initfrom
	case "REQ"
		ls_reqno = ls_contreqno
		this.of_initlnrcv_headreqno(ls_reqno, ldtm_slipdate, ldtm_rcvdate, lds_payoutslip)
	case "CON"
		ls_contno = ls_contreqno
		this.of_initlnrcv_headcontno(ls_contno, ldtm_slipdate, ldtm_rcvdate, lds_payoutslip)
end choose

if ls_initfrom = "CON" then
	ls_reqno = lds_payoutslip.getitemstring(1, "loanrequest_docno")
end if

ls_memno = lds_payoutslip.getitemstring(1, "member_no")
ls_memcoopid = lds_payoutslip.getitemstring(1, "memcoop_id")
ls_loantype = lds_payoutslip.getitemstring(1, "shrlontype_code")
li_rcvperiod = lds_payoutslip.getitemnumber(1, "rcv_period")
ldc_lnrcvamt = lds_payoutslip.getitemdecimal(1, "payout_amt")
ldtm_slipdate = lds_payoutslip.getitemdatetime(1, "slip_date")
ldtm_rcvdate = lds_payoutslip.getitemdatetime(1, "operate_date")
ldc_lnapproveamt = lds_payoutslip.getitemdecimal(1, "bfloanapprove_amt")
ls_objcode = trim(lds_payoutslip.object.cancel_bycoopid[1])

// ตรวจสอบเงื่อนไขจาก config
select lnrcvclrfuture_type, clcfstrcvonly_flag
into :li_intfutureflag, :li_clcfirstonly
from lnloantype
where(loantype_code = :ls_loantype) and
(coop_id = :is_coopcontrol)
using itr_sqlca;

// ถ้ามีการคิด ด/บ ล่วงหน้า
if li_intfutureflag = 2 or (li_intfutureflag = 1 and li_rcvperiod = 1) then
	ls_xmlfutureint = this.of_initlnrcv_futureint(lds_payoutslip)
end if

// ถ้าการรับเงินงวดไม่ใช่ครั้งแรกและเงื่อนไขหักกลบให้หักเฉพาะงวดแรกเท่านั้น
// ให้คืน XML แต่รายการจ่ายเพราะไม่มีหักกลบและจบการทำงานเลย
if li_rcvperiod > 1 and li_clcfirstonly = 1 then
	astr_initpayout.xml_sliphead = inv_dwxmliesrv.of_xmlexport(lds_payoutslip)
	
	goto ExpData
end if

// รายการหักหนี้
ls_xmlcutloan = this.of_initlnrcv_clrloan(ls_memcoopid, ls_memno, ls_contno, ls_reqno, "CLC", ldtm_slipdate, ls_loantype)

// PTT ทำดอกเบี้ยคืนไว้ก่อน
try
	this.of_setintreturn(ls_xmlcutloan, ldtm_rcvdate)
catch (Exception lex_errret)
	ithw_exception.Text = lex_errret.Text
	lb_error = true
end try

if lb_error then
	goto objdestroy
end if

// รายการหักอื่นๆ จะมีเฉพาะงวดแรกเท่านั้น
if li_rcvperiod = 1 or li_clcfirstonly = 0 then
	ls_xmlcutother = this.of_initlnrcv_clrother(ls_memcoopid, ls_memno, ls_reqno, "CLC", ldtm_slipdate)
end if

ExpData:
// ใส่ค่าลง DS เพื่อหายอดหักกลบ
lds_payinslipdet.reset()
lds_payinslipdet.importstring(XML!, ls_xmlcutloan)
lds_payinslipdet.importstring(XML!, ls_xmlcutother)
lds_payinslipdet.importstring(XML!, ls_xmlfutureint)

if lds_payinslipdet.rowcount() > 0 then
	ldc_lnrcvclr = dec(lds_payinslipdet. describe ("evaluate('sum( if( operate_flag = 1, item_payamt, 0 ) for all )', 1 )"))
	ldc_sumintret = dec(lds_payinslipdet. describe ("evaluate('sum( if( operate_flag = 1, interest_return, 0 ) for all )', 1 )"))
else
	ldc_lnrcvclr = 0
	ldc_sumintret = 0
end if

ldc_lnrcvnet = (ldc_lnrcvamt + ldc_sumintret)-ldc_lnrcvclr

lds_payoutslip.setitem(1, "returnetc_amt", ldc_sumintret)
lds_payoutslip.setitem(1, "payoutclr_amt", ldc_lnrcvclr)
lds_payoutslip.setitem(1, "payoutnet_amt", ldc_lnrcvnet)

// Export ข้อมูลอีกครั้งเพื่อให้ได้ค่าสุดท้าย
astr_initpayout.xml_slipcutlon = ""
astr_initpayout.xml_slipcutetc = ""

// หัว Slip
astr_initpayout.xml_sliphead = inv_dwxmliesrv.of_xmlexport(lds_payoutslip)

// รายการหักกลบหนี้
lds_payinslipdet.setfilter("slipitemtype_code = 'LON'")
lds_payinslipdet.filter()
if lds_payinslipdet.rowcount() > 0 then
	astr_initpayout.xml_slipcutlon = inv_dwxmliesrv.of_xmlexport(lds_payinslipdet)
end if

// รายการหักอื่นๆ
lds_payinslipdet.setfilter("slipitemtype_code <> 'LON'")
lds_payinslipdet.filter()
if lds_payinslipdet.rowcount() > 0 then
	astr_initpayout.xml_slipcutetc = inv_dwxmliesrv.of_xmlexport(lds_payinslipdet)
end if

objdestroy:
destroy lds_payoutslip
destroy lds_payinslipdet

if lb_error then
	throw ithw_exception
end if

return 1
end function

private function integer of_poststm_contract (str_poststmloan astr_lnstatement) throws Exception;string		ls_contno, ls_contcoopid, ls_itemcode, ls_refdocno, ls_refslipno, ls_statusdesc
string		ls_moneytype, ls_entryid, ls_entrycoopid, ls_remark
integer	li_seqno, li_period, li_itemstatus, li_lastseqno
dec{2}	ldc_prnpay, ldc_intpay, ldc_prnbal, ldc_prncalint, ldc_intperiod
dec{2}	ldc_bfintarr, ldc_bfintret, ldc_intarrbal, ldc_intretbal
datetime	ldtm_slipdate, ldtm_opedate, ldtm_accdate, ldtm_intaccdate, ldtm_entrydate
datetime	ldtm_calintfrom, ldtm_calintto

ls_contno		= astr_lnstatement.loancontract_no
ls_contcoopid	= astr_lnstatement.contcoop_id
ldtm_slipdate	= astr_lnstatement.slip_date
ldtm_opedate	= astr_lnstatement.operate_date
ldtm_accdate	= astr_lnstatement.account_date
ldtm_intaccdate= astr_lnstatement.intaccum_date
ls_refslipno		= astr_lnstatement.ref_slipno
ls_refdocno		= astr_lnstatement.ref_docno
ls_itemcode		= astr_lnstatement.loanitemtype_code
li_period			= astr_lnstatement.period
ldc_prnpay		= astr_lnstatement.principal_payment
ldc_intpay		= astr_lnstatement.interest_payment
ldc_prnbal		= astr_lnstatement.principal_balance
ldc_prncalint	= astr_lnstatement.prncalint_amt
ldtm_calintfrom	= astr_lnstatement.calint_from
ldtm_calintto	= astr_lnstatement.calint_to
ldc_bfintarr		= astr_lnstatement.bfinterest_arrear
ldc_bfintret		= astr_lnstatement.bfinterest_return
ldc_intperiod	= astr_lnstatement.interest_period
ldc_intarrbal		= astr_lnstatement.interest_arrear
ldc_intretbal		= astr_lnstatement.interest_return
ls_moneytype	= astr_lnstatement.moneytype_code
li_itemstatus	= astr_lnstatement.item_status
ls_entryid		= astr_lnstatement.entry_id
ls_entrycoopid	= astr_lnstatement.entry_bycoopid
ls_remark		= astr_lnstatement.remark

ldtm_entrydate	= datetime( today(), now() )

select		last_stm_no, status_desc
into		:li_lastseqno, :ls_statusdesc
from		lncontmaster
where	( loancontract_no	= :ls_contno ) and
			( coop_id				= :ls_contcoopid ) // by Phai Edit use coopcontrol
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "of_poststm_contract ไม่พบเลขที่สัญญาที่ระบุ "+ls_contno+" กรุณาตรวจสอบ ~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

if isnull( li_lastseqno ) then li_lastseqno = 0

li_lastseqno ++

// เพิ่มรายการเคลื่อนไหวการชำระหนี้
insert into lncontstatement
			( loancontract_no,		coop_id,					seq_no,					slip_date,				operate_date,			account_date,			intaccum_date,
			  ref_slipno,				ref_docno,				loanitemtype_code,	
			  period,		 			principal_payment,	interest_payment,		principal_balance,		
			  prncalint_amt,		calint_from,				calint_to,					bfintarrear_amt,		bfintreturn_amt,		interest_period,
			  interest_arrear,		interest_return,			moneytype_code,		item_status,				entry_id,					entry_date,				entry_bycoopid,
			  remark,					bfcontstatus_desc )
values	( :ls_contno,			:ls_contcoopid,			:li_lastseqno,			:ldtm_slipdate,			:ldtm_opedate,			:ldtm_accdate,			:ldtm_intaccdate,
			  :ls_refslipno,			:ls_refdocno,			:ls_itemcode,			
			  :li_period,				:ldc_prnpay,				:ldc_intpay,				:ldc_prnbal,
			  :ldc_prncalint,			:ldtm_calintfrom,		:ldtm_calintto,			:ldc_bfintarr,			:ldc_bfintret,			:ldc_intperiod,
			  :ldc_intarrbal,			:ldc_intretbal,			:ls_moneytype,			:li_itemstatus,			:ls_entryid,				:ldtm_entrydate,		:ls_entrycoopid,
			  :ls_remark,			:ls_statusdesc )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "of_poststm_contract  ไม่สามารถเพิ่มรายการ Statement หนี้ "+ls_contno+" ได้ กรุณาตรวจสอบ ~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

update	lncontmaster
set			last_stm_no		= :li_lastseqno
where	( loancontract_no	= :ls_contno )
and		( coop_id 			= :ls_contcoopid ) // by Phai Edit use coopcontrol
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "of_poststm_contract  ไม่สามารถปรับปรุงลำดับที่ล่าสุดได้ เลขที่สัญญา "+ls_contno+" กรุณาตรวจสอบ ~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ตรวจสอบว่าถ้าเป็นรายการยกเลิกให้ไปปรับรายการคู่กันให้ยกเลิกด้วย
if li_itemstatus <> 1 then
	update	lncontstatement
	set			item_status	= :li_itemstatus
	where	( loancontract_no	= :ls_contno ) and
				( ref_slipno	= :ls_refslipno )		and
				(coop_id		= :ls_contcoopid ) // by Phai Edit use coopcontrol
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "of_poststm_contract  ไม่สามารถปรับปรุงสถานะ Statement รายการคู่กันได้ เลขที่สัญญา "+ls_contno+" เลขที่ Slip "+ls_refslipno+" กรุณาตรวจสอบ ~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

return 1
end function

public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception;// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
end if

inv_transection	= anv_dbtrans
itr_sqlca 			= inv_transection.itr_dbconnection
is_coopcontrol	= anv_dbtrans.is_coopcontrol
is_coopid			= anv_dbtrans.is_coopid

// รายละเอียดรายการ Slip
ids_infosliptype	= create n_ds
ids_infosliptype.dataobject	= "d_loansrv_attrib_ucfsliptype"
ids_infosliptype.settransobject( itr_sqlca )
ids_infosliptype.retrieve()

// initial info memcont
ids_infomemcont = create n_ds
ids_infomemcont.dataobject = "d_loansrv_info_memcont"
ids_infomemcont.settransobject( itr_sqlca )

// initial info contno
ids_infocont = create n_ds
ids_infocont.dataobject = "d_loansrv_info_contract"
ids_infocont.settransobject( itr_sqlca )

// initial info reqloan
ids_inforeqloan = create n_ds
ids_inforeqloan.dataobject = "d_loansrv_info_reqloan"
ids_inforeqloan.settransobject( itr_sqlca )

// initial info memdetail
ids_infomemdet = create n_ds
ids_infomemdet.dataobject = "d_loansrv_info_memdetail"
ids_infomemdet.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( true )

return 1
end function

public function integer of_saveslip_lnrcv (ref str_slippayout astr_lnslip) throws Exception;string ls_reqno, ls_contno, ls_slipclrno, ls_rcvfromreqcont
string ls_xmlhead, ls_xmletc, ls_xmlloan
string ls_payoutslipno, ls_loantype, ls_lnprefix, ls_doccode
string ls_entryid
long ll_count, ll_find
integer li_rcvperiod, li_chk
dec{2}ldc_clramt, ldc_netamt, ldc_returnetc_amt, ldc_payoutamt, ldc_payoutnetamt, ldc_returnetcamt
datetime ldtm_entrydate, ldtm_slipdate
boolean	lb_error = false
boolean lb_expetc = false
n_ds lds_payoutslip
n_ds lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet = create n_ds
lds_payinslipdet.dataobject = DWO_PAYINSLIPDET
lds_payinslipdet.settransobject(itr_sqlca)

lds_payoutslip = create n_ds
lds_payoutslip.dataobject = DWO_PAYOUTSLIP
lds_payoutslip.settransobject(itr_sqlca)

ls_contno = ""
ls_xmlhead = astr_lnslip.xml_sliphead
ls_xmlloan = astr_lnslip.xml_slipcutlon
ls_xmletc = astr_lnslip.xml_slipcutetc
ls_entryid = astr_lnslip.entry_id
ldtm_entrydate = datetime(today(), now())

// Import หัว slip
lds_payoutslip.reset()
ll_count = inv_dwxmliesrv.of_xmlimport(lds_payoutslip, ls_xmlhead)

if ll_count <= 0 then
	ithw_exception.text = "ไม่มีข้อมูลการจ่ายเงินกู้ที่จะทำรายการ"
	throw ithw_exception
end if

ls_rcvfromreqcont = lds_payoutslip.getitemstring(1, "rcvfromreqcont_code")
ls_contno = lds_payoutslip.getitemstring(1, "loancontract_no")
ls_reqno = lds_payoutslip.getitemstring(1, "loanrequest_docno")
ls_loantype = lds_payoutslip.getitemstring(1, "shrlontype_code")
li_rcvperiod = lds_payoutslip.GetItemNumber(1,"rcv_period")
ldc_payoutamt = lds_payoutslip.getitemdecimal(1, "payout_amt")
ldc_payoutnetamt = lds_payoutslip.getitemdecimal(1, "payoutnet_amt")
ldtm_slipdate = lds_payoutslip.GetItemDateTime(1, "slip_date")

is_appv_contno = ls_contno //nungs

// ถ้าเป็นการจ่ายเงินกู้จากใบคำขอกู้เงิน
if ls_rcvfromreqcont = "REQ" then
	// ต้องส่งไปสร้างสัญญาก่อน
	try
		this.of_buildcontno_reqloan(ls_reqno, ls_contno)
	catch (Exception lthw_buildcontno)
		ithw_exception.Text = lthw_buildcontno.Text
		lb_error = true
	end try
	
	if lb_error then goto objdestroy
	
	// บันทึกเลขที่สัญญาที่ได้มาไปที่ Slip
	lds_payoutslip.setitem(1, "concoop_id", is_coopcontrol)
	lds_payoutslip.setitem(1, "loancontract_no", ls_contno)

end if
	
// Import รับชำระ
lds_payinslipdet.reset()
inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, ls_xmlloan)
inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, ls_xmletc)

// ใส่เลขสัญญาในดอกเบี้ยรับล่วงหน้า
ll_find = lds_payinslipdet.find("slipitemtype_code = 'INF'", 1, ll_count)
if ll_find > 0 then
	lds_payinslipdet.setitem(ll_find, "loancontract_no", ls_contno)
	lb_expetc = true
end if
	
if lb_expetc then
	lds_payinslipdet.SetFilter("slipitemtype_code <> 'LON'")
	lds_payinslipdet.Filter()
	astr_lnslip.xml_slipcutetc = string(lds_payinslipdet. describe ("Datawindow.data.XML"))
end if

// ขอเลขที่ Slip Pay Out
try
	this.of_setsrvdoccontrol( true )
	ls_payoutslipno = inv_docsrv.of_getnewdocno(is_coopcontrol, "SLSLIPPAYOUT")
	this.of_setsrvdoccontrol( false )
catch (Exception lthw_getdocno)
	ithw_exception.Text = lthw_getdocno.Text
	lb_error = true
end try

if lb_error then goto objdestroy

// ใส่เลขที่ Slip ใน Header
lds_payoutslip.setitem(1, "coop_id", is_coopcontrol)
lds_payoutslip.setitem(1, "payoutslip_no", ls_payoutslipno)
lds_payoutslip.setitem(1, "entry_id", ls_entryid)
lds_payoutslip.setitem(1, "entry_date", ldtm_entrydate)
lds_payoutslip.setitem(1, "entry_bycoopid", is_coopid)
// --------------------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// 1. ต้องบันทึกรายการจ่ายเงินกู้ก่อน
// 2. ผ่านรายการจ่ายเงินกู้
// 3. เรียกใช้ Function transpayin เพื่อสร้างหัว Slip pay in, บันทึก Slip payin, ผ่านรายการชำระ
// 4. ปรับปรุงรายละเอียดการหักชำระที่ตัว Slip Pay Out การจ่ายเงินกู้อีกที
// --------------------------------------------------------

// บันทึก Slip Pay Out
if lds_payoutslip. update () <> 1 then
	ithw_exception.text = "บันทึกข้อมูล Slip Pay Out ไม่ได้"
	ithw_exception.text += lds_payoutslip.of_geterrormessage()
	lb_error = true
	goto objdestroy
end if

//////////////////////////////////////////////////////////////////////////////////

// Export ข้อมูลที่ปรับปรุงแล้วอีกครั้งเพื่อส่งไปทำรายการ
astr_lnslip.xml_sliphead = string(lds_payoutslip. describe ("Datawindow.data.XML"))
astr_lnslip.payoutslip_no = ls_payoutslipno

// ผ่านรายการ
try
	// ผ่านรายการ จ่ายเงินกู้
	this.of_postslip_lnrcv(lds_payoutslip, is_coopcontrol)// by Phai
	
	// ถ้ามีการเอาเงินฝากมาค้ำประกันต้องส่งไปอายัด
	if li_rcvperiod = 1 then
		this.of_postseq_lnrcv(ls_contno, lds_payinslipdet, ldtm_slipdate)
	end if
	
	astr_lnslip.receiptno_flag = true
	
	// ผ่านรายการ หักชำระ
	li_chk = this.of_transpayin(astr_lnslip)
catch (Exception lthw_postlnrcv)
	ithw_exception.Text	= lthw_postlnrcv.Text
	lb_error = true
end try

if lb_error then goto objdestroy

// ถ้ามีการทำรายการหัก ต้องมีการ Set ค่าการหักชำระเพื่อทำการบันทึกไปที่ Slip Pay Out อีกที
if li_chk = 1 then
	// Import หัว slipอีกที
	lds_payoutslip.reset()
	lds_payoutslip.importstring(XML!, astr_lnslip.xml_sliphead)
	
	// ดึงค่าที่เกี่ยวข้องกับการหักชำระเพื่อทำการบันทึกไปที่ Slip Pay Out อีกที
	ls_slipclrno = lds_payoutslip.getitemstring(1, "slipclear_no")
	ldc_clramt = lds_payoutslip.getitemdecimal(1, "payoutclr_amt")
	ldc_netamt = lds_payoutslip.getitemdecimal(1, "payoutnet_amt")
	ldc_returnetcamt = lds_payoutslip.getitemdecimal(1, "returnetc_amt")
	
	ldc_netamt = ldc_netamt + ldc_returnetcamt
	
	update slslippayout
	set slipclear_no = :ls_slipclrno,
	payoutclr_amt = :ldc_clramt,
	payoutnet_amt = :ldc_netamt
	where(payoutslip_no = :ls_payoutslipno)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ไม่สามารถปรับปรุงรายการหักชำระ ในใบจ่ายเงินกู้ได้ เลขที่ใบจ่าย (" + ls_payoutslipno + ")~n" + itr_sqlca.sqlerrtext
		lb_error = true
		goto objdestroy
	end if
end if

// ถ้าเป็นรับเงินกู้จากใบคำขอ
if ls_rcvfromreqcont = "REQ" then
	update lnreqloan
	set loanrequest_status = 1
	where(loanrequest_docno = :ls_reqno)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ไม่สามารถปรับปรุงสถานะใบคำขอกู้เงินได้ เลขที่ใบคำขอกู้เงิน (" + ls_reqno + ")~n" + itr_sqlca.sqlerrtext
		lb_error = true
		goto objdestroy
	end if
end if

objdestroy:
if isvalid( lds_payinslipdet ) then destroy lds_payinslipdet
if isvalid( lds_payoutslip ) then destroy lds_payoutslip

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca;

return 1
end function

public function integer of_saveccl_payin (str_slipcancel lstr_slipcancel) throws Exception;
string		ls_slipno, ls_cancelid
string		ls_xmlsliphead, ls_xmlslipdetail
long		ll_count
integer	li_slipstatus
datetime	ldtm_canceldate, ldtm_slipdate
n_ds		lds_payinslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslip	= create n_ds
lds_payinslip.dataobject	= DWO_PAYINSLIP
lds_payinslip.settransobject( itr_sqlca )

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

ls_slipno		= lstr_slipcancel.slip_no
ls_cancelid		= lstr_slipcancel.cancel_id
ldtm_canceldate	= lstr_slipcancel.cancel_date

ll_count	= lds_payinslip.retrieve( is_coopcontrol, ls_slipno )
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูล Slip การรับชำระที่ระบุมา เลขที่ Slip no ("+ls_slipno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

ll_count	= lds_payinslipdet.retrieve( is_coopcontrol, ls_slipno )
if ll_count <= 0 then
	ithw_exception.text	= "เลขที่ Slip no ("+ls_slipno+") ไม่มีรายการรับชำระ กรุณาตรวจสอบ"
	throw ithw_exception
end if

ldtm_slipdate		= lds_payinslip.getitemdatetime( 1, "slip_date" )

if ldtm_canceldate <= ldtm_slipdate then
	li_slipstatus			= -9
	ldtm_canceldate	= ldtm_slipdate
else
	li_slipstatus		= -99
end if

// ใส่ข้อมูลการยกเลิกไปที่ Slip
lds_payinslip.setitem( 1, "slip_status", li_slipstatus )
lds_payinslip.setitem( 1, "cancel_id", ls_cancelid )
lds_payinslip.setitem( 1, "cancel_date", ldtm_canceldate )

// --------------------------------------------------------
// เริ่มกระบวนการบันทึก Slip และไปยกเลิกรายการต่างๆ
// --------------------------------------------------------
// บันทึก Slip
if lds_payinslip.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip ไม่ได้"
	ithw_exception.text	+= lds_payinslip.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// Export ข้อมูลอีกทีเพราะมีการใส่ข้อมูลการยกเลิกเพิ่มเติม
ls_xmlsliphead		= string( lds_payinslip.describe( "Datawindow.data.XML" ) )

try
	// ยกเลิกทีละประเภทการทำรายการ
	// ยกเลิกรายการหุ้น
	this.of_postccl_payinshare( lds_payinslip, lds_payinslipdet )
	
	// คืนรายการหนี้
	this.of_postccl_payinloan( lds_payinslip, lds_payinslipdet )
	
	// ยกเลิกรายการอื่นๆ
	this.of_postccl_payinetc( lds_payinslip, lds_payinslipdet )
	
catch( Exception lthw_cclpayin )
	rollback using itr_sqlca ;
	throw lthw_cclpayin
end try

commit using itr_sqlca ;

return 1
end function

public function integer of_initlnrcv_recalint (ref str_slippayout astr_slip) throws Exception;/***********************************************************
<description>
	เมื่อมีการเปลี่ยนวันที่ที่ทำรายการจ่ายเงินกู้ จะต้องมีการ
	คำนวณ ด/บ ในส่วนที่เกี่ยวข้องใหม่ทั้งหมดอีกครั้ง
</description>

<arguments>
	str_slippayout		Structure รายการ Slip จ่าย
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_sliphead			String		XML ส่วนรายละเอียดสัญญาเงินกู้ที่จะจ่าย
		- xml_slipcutlon			String		XML ส่วนของการหักชำระหนี้เก่า
		- xml_slipcutetc			String		XML ส่วนของการหักชำระอื่นๆ(หุ้น,ด/บ รับล่วงหน้า)
</arguments>

<return>
	1		Integer	ถ้าไม่มีข้อผิดพลาด
</return>

<usage>
	เรียกใช้โดยส่ง XML ของ รายการสัญญาที่จ่าย, รายการหักกลบสัญญาเก่า, รายการหักอื่นๆ
	ผ่าน Structure str_slippayout เข้ามา ฟังก์ชั่นจะคำนวณ ด/บค้าง ด/บหักกลบ ด/บ รับล่วงหน้าให้ใหม่อีกครั้ง
	แล้วส่งกลับไป
	
	str_slippayout		lstr_slippayout
	
	// รายการจ่ายเงินกู้
	lstr_slippayout.xml_sliphead			= string( dw_lnrcv.describe( "Datawindow.data.XML" ) )
	
	// รายการหักกลบหนี้เก่า
	if dw_clrloan.rowcount() > 0 then
		lstr_slippayout.xml_slipcutlon	= string( dw_clrloan.describe( "Datawindow.data.XML" ) )
	else
		lstr_slippayout.xml_slipcutlon	= ""
	end if
	
	// รายการหักชำระอื่นๆ
	if dw_clrother.rowcount() > 0 then
		lstr_slippayout.xml_slipcutetc	= string( dw_clrother.describe( "Datawindow.data.XML" ) )
	else
		lstr_slippayout.xml_slipcutetc	= ""
	end if
	
	// Call function
	lnv_lnoperate.of_initlnrcv_recalint( lstr_slippayout )

	// นำตัวแปรที่ได้กลับมามา Import ทับของเดิม
	dw_lnrcv.reset()
	dw_lnrcv.importstring( XML!, lstr_slippayout.xml_sliphead )
	
	dw_clrloan.reset()
	dw_clrloan.importstring( XML!, lstr_slippayout.xml_slipcutlon )
	
	dw_clrother.reset()
	dw_clrother.importstring( XML!, lstr_slippayout.xml_slipcutetc )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage>
***********************************************************/
string ls_xmlhead, ls_xmlloan, ls_xmlother, ls_xmlinf
string ls_rcvfromreqcont, ls_loantype
long ll_count
integer li_rcvperiod, li_find, li_intfutureflag
dec{2}ldc_payoutamt, ldc_payoutclr, ldc_payoutnet, ldc_sumintret
datetime ldtm_rcvdate
boolean lb_error = false
n_ds lds_payoutslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip = create n_ds
lds_payoutslip.dataobject = DWO_PAYOUTSLIP

lds_payinslipdet = create n_ds
lds_payinslipdet.dataobject = DWO_PAYINSLIPDET

ls_xmlhead = astr_slip.xml_sliphead
ls_xmlloan = astr_slip.xml_slipcutlon
ls_xmlother = astr_slip.xml_slipcutetc

inv_dwxmliesrv.of_xmlimport(lds_payoutslip, ls_xmlhead)

li_rcvperiod = lds_payoutslip.getitemnumber(1, "rcv_period")
ls_loantype = lds_payoutslip.getitemstring(1, "shrlontype_code")
ldtm_rcvdate = lds_payoutslip.getitemdatetime(1, "slip_date")

// ถ้ารับเงินไม่ใช่งวดแรกต้องคิด ด/บ ค้าง
if li_rcvperiod > 1 then
	this.of_initlnrcv_headcalint(lds_payoutslip)
end if

// ตรวจสอบเงื่อนไขจาก config
select lnrcvclrfuture_type
into :li_intfutureflag
from lnloantype
where(loantype_code = :ls_loantype) and
(coop_id = :is_coopcontrol)
using itr_sqlca;

// ถ้ามีการคิด ด/บ ล่วงหน้า
if li_intfutureflag = 2 or (li_intfutureflag = 1 and li_rcvperiod = 1) then
	ls_xmlinf = this.of_initlnrcv_futureint(lds_payoutslip)
end if

// Import รายการหักชำระ
inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, ls_xmlloan)
inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, ls_xmlother)

// การหักชำระหนี้เงินกู้เก่า ส่งไปคำนวณใหม่
this.of_initslippayin_calint(lds_payinslipdet, "CLC", ldtm_rcvdate)

// PTT ทำดอกเบี้ยคืน
try
	this.of_setintreturn(lds_payinslipdet, ldtm_rcvdate)
catch (Exception lex_errret)
	ithw_exception.Text = lex_errret.Text
	lb_error = true
end try

if lb_error then
	goto objdestroy
end if

ll_count = lds_payinslipdet.rowcount()

// ตรวจว่ามีรายการ ด/บ รับล่วงหน้าของเก่ามั้ย
if ll_count > 0 then
	li_find = lds_payinslipdet.find("slipitemtype_code = 'INF'", 1, ll_count)
	
	// ลบรายการ ด/บ รับล่วงหน้าของเก่าทิ้งไป
	if li_find > 0 then
		lds_payinslipdet.rowsdiscard(li_find, li_find, primary!)
	end if
end if

// ถ้ามี ด/บ รับล่วงหน้าที่คำนวณได้ใหม่ เพิ่มเข้าไปในรายการชำระ
if ls_xmlinf <> "" then
	inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, ls_xmlinf)
end if

// คำนวณยอดหักชำระใหม่
ll_count = lds_payinslipdet.rowcount()
if ll_count > 0 then
	ldc_payoutclr = dec(lds_payinslipdet. describe ("evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', " + string(ll_count)+" )"))
	ldc_sumintret = dec(lds_payinslipdet. describe ("evaluate('sum( if( operate_flag = 1, interest_return, 0 ) for all )', 1 )"))
else
	ldc_payoutclr = 0
	ldc_sumintret = 0
end if

ldc_payoutamt = lds_payoutslip.getitemdecimal(1, "payout_amt")

ldc_payoutnet = (ldc_payoutamt + ldc_sumintret)-ldc_payoutclr

lds_payoutslip.setitem(1, "returnetc_amt", ldc_sumintret)
lds_payoutslip.setitem(1, "payoutclr_amt", ldc_payoutclr)
lds_payoutslip.setitem(1, "payoutnet_amt", ldc_payoutnet)

// Export ข้อมูลอีกครั้งเพื่อให้ได้ค่าสุดท้าย
astr_slip.xml_slipcutlon = ""
astr_slip.xml_slipcutetc = ""

// หัว Slip
astr_slip.xml_sliphead = inv_dwxmliesrv.of_xmlexport(lds_payoutslip)

// รายการหักกลบหนี้
lds_payinslipdet.setfilter("slipitemtype_code = 'LON'")
lds_payinslipdet.filter()
if lds_payinslipdet.rowcount() > 0 then
	astr_slip.xml_slipcutlon = inv_dwxmliesrv.of_xmlexport(lds_payinslipdet)
end if

// รายการหักอื่นๆ
lds_payinslipdet.setfilter("slipitemtype_code <> 'LON'")
lds_payinslipdet.filter()
if lds_payinslipdet.rowcount() > 0 then
	astr_slip.xml_slipcutetc = inv_dwxmliesrv.of_xmlexport(lds_payinslipdet)
end if

objdestroy:
if IsValid(lds_payoutslip) then destroy lds_payoutslip
if IsValid(lds_payinslipdet) then destroy lds_payinslipdet

if lb_error then
	throw ithw_exception
end if

return 1
end function

public function integer of_initslippayin_calint (ref string as_xmlloan, string as_sliptype, datetime adtm_opedate) throws Exception;/***********************************************************
<description>
	เมื่อมีการปรับเปลี่ยนวันที่ทำรายการรับชำระ ต้องมีการคำนวณ ด/บ รับชำระใหม่
</description>

<arguments>  
	- as_xmlloan{ref}		String			XML รายการรับชำระหนี้
	- as_sliptype			String			ประเภทการชำระ(PX, CLC, etc.)
	- adtm_opedate		datetime		วันที่รับชำระ
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	ส่ง XML สัญญาเงินกู้ที่จะชำระ, ประเภทการชำระ, วันที่ชำระเข้ามา
	ฟังก์ชั่นจะคำนวณ ด/บ ให้พร้อมทั้งปรับยอดรวมชำระแต่ละสัญญาให้เลย
	แล้วคืนค่า XML กลับไป
	
	string		ls_xmlloan, ls_sliptype
	datetime	ldtm_operate
	
	ls_sliptype		= dw_main.getitemstring( 1, "sliptype_code" )
	ldtm_operate	= dw_main.getitemdatetime( 1, "operate_date" )
	
	ls_xmlloan		= dw_loan.describe( "Datawindow.Data.XML" )
	
	lnv_lnoperate.of_initslippayin_calint( ls_xmlloan, ls_sliptype, ldtm_operate )
	
	dw_loan.reset()
	dw_loan.importstring( XML!, ls_xmlloan )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
n_ds		lds_payinslipdet

if trim( as_xmlloan ) = "" then
	return 0
end if

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET

// ใส่ค่าลง DS
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, as_xmlloan )

// เรียกใช้ฟังก์ชั่นคำนวณดอกเบี้ย
this.of_initslippayin_calint( lds_payinslipdet, as_sliptype, adtm_opedate )

as_xmlloan	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )

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

private function integer of_setsrvlninterest (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_intsrv ) or not isvalid( inv_intsrv ) then
		inv_intsrv	= create n_cst_loansrv_interest
		inv_intsrv.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_intsrv ) then
		destroy inv_intsrv
		return 1
	end if
end if

return 0
end function

private function any of_getattribsliptype (string as_sliptype, string as_attrib);integer	li_row
any		la_attrib

// validate parameter
li_row	= ids_infosliptype.find( "sliptype_code = '" + as_sliptype+"'", 0, ids_infosliptype.rowcount())

if li_row > 0 then
	choose case lower ( Left ( ids_infosliptype.describe ( as_attrib + ".ColType" ) , 5 ) )
		case "char(", "char"
			la_attrib	= ids_infosliptype.getitemstring( li_row, as_attrib ) 
			
		case "date"
			la_attrib	= ids_infosliptype.getitemdate( li_row, as_attrib ) 
			
		case "datet"
			la_attrib	= ids_infosliptype.getitemdatetime( li_row, as_attrib ) 
			
		case "decim"
			la_attrib	= ids_infosliptype.getitemdecimal( li_row, as_attrib ) 
			
		case "numbe", "long", "ulong", "real", "int"
			la_attrib	= ids_infosliptype.getitemnumber( li_row, as_attrib ) 
			
		case "time", "times"
			la_attrib	= ids_infosliptype.getitemtime( li_row, as_attrib ) 
			
		case else
			setnull( la_attrib )
	end choose
	
end if

return la_attrib
end function

public function integer of_saveccl_lnrcv (str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับยกเลิกรายการ Slip การจ่ายเงินกู้
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก Slip
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- slip_no				String			เลขที่ Slip รายการจ่ายเงินกู้ที่ต้องการยกเลิก
		- cancel_id			String			ผู้ยกเลิกรายการ
		- cancel_date		datetime		วันที่ยกเลิกรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	ส่งเลขที่ Slip รายการจ่ายเงินกู้ที่ต้องการยกเลิกผ่าน Structure เข้ามา
	ระบบจะนำข้อมูลไปยกเลิกและปรับปรุงยอดคงเหลือต่างๆ
	
	str_slipcancel	lstr_slipcancel
	
	lstr_slipcancel.slip_no			= dw_sliphead.getitemstring( 1, "payoutslip_no" )
	lstr_slipcancel.cancel_id		= entry_id
	lstr_slipcancel.cancel_date	= system_date
	
	lnv_lnoperate.of_saveccl_lnrcv( lstr_slipcancel )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO
</usage> 
***********************************************************/
string		ls_slipcoopid, ls_slipno, ls_slipclrno, ls_cancelid , ls_moneytype_code
string		ls_xmlsliphead, ls_xmlslipdetail, ls_contno
long		ll_count
integer	li_slipstatus, li_rcvperiod
datetime	ldtm_slipdate, ldtm_ccldate
n_ds		lds_payoutslip

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP
lds_payoutslip.settransobject( itr_sqlca )

ls_slipcoopid		= astr_slipcancel.slipcoop_id
ls_slipno				= astr_slipcancel.slip_no
ls_cancelid			= astr_slipcancel.cancel_id
idtm_operdate		= astr_slipcancel.operateccl_date
idtm_canceldate	= astr_slipcancel.cancel_date

ll_count			= lds_payoutslip.retrieve( is_coopcontrol, ls_slipno )
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลใบจ่ายเงินกู้ที่ระบุมา เลขที่ใบจ่าย ("+ls_slipno+")"
	throw ithw_exception
end if

ls_slipclrno		= trim( lds_payoutslip.getitemstring( 1, "slipclear_no" ) )
ldtm_slipdate	= lds_payoutslip.getitemdatetime( 1, "slip_date" )

ls_contno = lds_payoutslip.GetItemString(1,"loancontract_no")
li_rcvperiod = lds_payoutslip.GetItemNumber(1,"rcv_period")

if idtm_canceldate <= ldtm_slipdate then
	ldtm_ccldate	= ldtm_slipdate
	li_slipstatus		= -9
else
	ldtm_ccldate	= idtm_canceldate
	li_slipstatus		= -99
end if

// ใส่ข้อมูลการยกเลิกไปที่ Slip
lds_payoutslip.setitem( 1, "slip_status", li_slipstatus )
lds_payoutslip.setitem( 1, "cancel_id", ls_cancelid )
lds_payoutslip.setitem( 1, "cancel_date", ldtm_ccldate )
//lds_payoutslip.setitem( 1, "post_tofin", 1 )


// --------------------------------------------------------
// เริ่มกระบวนการบันทึก Slip และไปยกเลิกรายการต่างๆ
// - บันทีก Slip ก่อน
// - Export รายการจ่ายเก็บไว้
// - ไปยกเลิกรายการหักกลบก่อนรายการจ่ายเสมอ
//    เพราะเวลาจ่ายทำการจ่ายก่อนแล้วค่อยหักกลบ
//    เวลายกเลิกก็ต้องกลับกระบวนการ Statement จะได้เรียงได้ถูกต้อง
// --------------------------------------------------------
// บันทึก Slip
if lds_payoutslip.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip ไม่ได้"
	ithw_exception.text	+= lds_payoutslip.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// Export ข้อมูลอีกทีเพราะมีการใส่ข้อมูลการยกเลิกเพิ่มเติม
ls_xmlsliphead		= string( lds_payoutslip.describe( "Datawindow.data.XML" ) )

try
	// ถ้ามีการหักกลบส่งไปยกเลิกการหักกลบก่อน
	if ls_slipclrno <> "" and not isnull( ls_slipclrno ) then
		str_slipcancel	lstr_cclpayin
		
		lstr_cclpayin.slipcoop_id		= is_coopcontrol
		lstr_cclpayin.slip_no			= ls_slipclrno
		lstr_cclpayin.cancel_id		= astr_slipcancel.cancel_id
		lstr_cclpayin.cancel_date	= astr_slipcancel.cancel_date
		
		this.of_saveccl_payin( lstr_cclpayin )
	end if
	
	// ผ่านรายการยกเลิกการจ่ายเงินกู้
	this.of_postccl_lnrcv( lds_payoutslip )
	
	if li_rcvperiod = 1 then
		this.of_postseq_lnrcvccl(lds_payoutslip)
	end if
	
catch( Exception lthw_cclpayin )
	rollback using itr_sqlca ;
	throw lthw_cclpayin
end try

commit using itr_sqlca ;

return 1
end function

private function integer of_setsrvcalendar (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_calendarsrv ) or not isvalid( inv_calendarsrv ) then
		inv_calendarsrv	= create n_cst_calendarservice
		inv_calendarsrv.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_calendarsrv ) then
		destroy inv_calendarsrv
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

private function integer of_poststm_share (str_poststmshare astr_infoshrstm) throws Exception;/***********************************************************
<description>
	ผ่านรายการ statement หุ้น
</description>

<arguments>  
	astr_infoshrstm		str_postshrstm		โครงสร้าง structure statement หุ้น
</arguments> 

<return> 
	ลำดับที่			Integer	ลำดับที่ล่าสุดของ statement หุ้น
</return> 

<usage>

	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
integer	li_stmno, li_period, li_itemstatus
string		ls_memno, ls_memcoopid, ls_xmlshare, ls_entryid, ls_entrycoopid
string		ls_docno, ls_sharetype, ls_itemtype, ls_moneytype, ls_refslipno
datetime	ldtm_opedate, ldtm_slipdate, ldtm_entrydate, ldtm_accdate, ldtm_shrtime
decimal	ldc_shrpayamt, ldc_shrstkamt, ldc_bfshrarramt, ldc_shrarramt

ldtm_entrydate		= datetime( today(), now() )

ls_memno 			= astr_infoshrstm.member_no
ls_memcoopid		= astr_infoshrstm.memcoop_id
ls_sharetype		= astr_infoshrstm.sharetype_code
ldtm_slipdate		= astr_infoshrstm.slip_date
ldtm_opedate		= astr_infoshrstm.operate_date
ldtm_accdate		= astr_infoshrstm.account_date
ldtm_shrtime		= astr_infoshrstm.sharetime_date
ls_docno				= astr_infoshrstm.document_no
ls_itemtype			= astr_infoshrstm.stmitem_code
li_period				= astr_infoshrstm.period
ldc_shrpayamt		= astr_infoshrstm.sharepay_amt
ldc_shrstkamt		= astr_infoshrstm.sharebal_amt
ls_entryid			= astr_infoshrstm.entry_id
ls_entrycoopid		= astr_infoshrstm.entry_bycoopid
ls_moneytype		= astr_infoshrstm.moneytype
ldc_bfshrarramt	= astr_infoshrstm.bfsharearr_amt
ldc_shrarramt		= astr_infoshrstm.sharearr_amt
li_itemstatus		= astr_infoshrstm.item_status
ls_refslipno			= astr_infoshrstm.ref_slipno

select	max( seq_no )
into	:li_stmno
from	shsharestatement
where( member_no		= :ls_memno ) and
		( coop_id				= :ls_memcoopid ) and
		( sharetype_code	= :ls_sharetype )
using	itr_sqlca ;

if isnull( li_stmno ) then li_stmno = 0

li_stmno	++
	
// บันทึกรายการเคลื่อนไหว
insert into shsharestatement
		( member_no,			coop_id,					sharetype_code,		seq_no,					ref_slipno,			ref_docno,
		  slip_date,				operate_date,			account_date,			share_date,
		  shritemtype_code,	period,					share_amount,			sharestk_amt,
		  moneytype_code,	shrarrearbf_amt,		shrarrear_amt,			item_status,
		  entry_id,				entry_date,				entry_bycoopid )
		  
values( :ls_memno,			:ls_memcoopid,		:ls_sharetype,			:li_stmno,				:ls_refslipno,		:ls_docno,
		  :ldtm_slipdate,		:ldtm_opedate,			:ldtm_accdate,			:ldtm_shrtime,
		  :ls_itemtype,			:li_period,				:ldc_shrpayamt,		:ldc_shrstkamt,
		  :ls_moneytype,		:ldc_bfshrarramt,		:ldc_shrarramt,		  	:li_itemstatus,
		  :ls_entryid,			:ldtm_entrydate,		:ls_entrycoopid )
using itr_sqlca;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text += "~nไม่สามารถเพิ่ม statement หุ้นได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ;
	return -1
end if

update	shsharemaster
set			last_stm_no = :li_stmno
where ( member_no = :ls_memno ) and 	
		 ( sharetype_code = :ls_sharetype )and
		 (coop_id 			=:ls_memcoopid)
using	itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text += "~nไม่สามารถปรับปรุงลำดับที่ล่าสุดหุ้นได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext 	
	rollback using itr_sqlca;
	return -1
end if

// ตรวจสอบว่าเป็นรายการยกเลิกให้ไปปรับรายการคู่กันให้ยกเลิกด้วย
if ( li_itemstatus <> 1 ) then
	update	shsharestatement
	set			item_status = :li_itemstatus
	where ( member_no = :ls_memno ) and 	
			 ( sharetype_code = :ls_sharetype ) and
			 ( ref_slipno = :ls_refslipno )and
		 (coop_id 			=:ls_memcoopid)
	using	itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text += "~nไม่สามารถปรับปรุงสถานะ Statement หุ้นได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ;		
		return -1
	end if	
end if

return li_stmno
end function

private function integer of_postccl_payinloan (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string ls_contno, ls_slipno, ls_sliptype, ls_itemtype, ls_itemcode, ls_memno, ls_cclpayslipno, ls_refslipno
string ls_cclloncode, ls_cclinfcode, ls_refdocno, ls_moneytype, ls_lnreqno, ls_loantype
long ll_index, ll_count, ll_chk
integer li_periodpay, li_contstatus, li_payspecmethod, li_odflag, li_stmstatus, li_cclsetint
integer li_trnstatus, li_reqstatus, li_cclpayflag, li_periodcount_flag
dec{2}ldc_prnpay, ldc_intpay, ldc_intarrpay, ldc_contprnbal, ldc_contintarr, ldc_contintret, ldc_contintacc, ldc_contprnret
dec{2}ldc_prnbal, ldc_intarrbal, ldc_intarrextend, ldc_intarrperiod, ldc_slipintperiod, ldc_slipintarrset
dec{2}ldc_slintret, ldc_slprnret, ldc_wtdbal, ldc_bfintarramt, ldc_bfprnbalamt, ldc_bfintsetarr, ldc_intarrsetbal, ldc_bfintretamt
datetime ldtm_slipdate, ldtm_opedate, ldtm_contlastcalint, ldtm_contlastpay
datetime ldtm_cccalint, ldtm_paychkdate, ldtm_calintto, ldtm_bflastcalint, ldtm_bflastpay
str_poststmloan lstr_lnstm

string ls_cancelid
datetime ldtm_canceldate

// ทำแต่รายการที่เป็นการชำระหนี้
ads_payinslipdet.SetFilter("slipitemtype_code in ('LON','INF')")
ads_payinslipdet.Filter()

ll_count = ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_slipno = ads_payinslip.getitemstring(1, "payinslip_no")
ls_memno = ads_payinslip.getitemstring(1, "member_no")
ls_sliptype = ads_payinslip.getitemstring(1, "sliptype_code")
ls_refdocno = ads_payinslip.getitemstring(1, "document_no")
ls_moneytype = ads_payinslip.getitemstring(1, "moneytype_code")
ls_refslipno = ads_payinslip.GetItemString(1,"ref_slipno")
ldtm_slipdate = ads_payinslip.getitemdatetime(1, "slip_date")
ldtm_opedate = ads_payinslip.getitemdatetime(1, "operate_date")

ls_cancelid = ads_payinslip.getitemstring(1, "cancel_id")
ldtm_canceldate = ads_payinslip.getitemdatetime(1, "cancel_date")

ls_cclloncode = string(this.of_getattribsliptype(ls_sliptype, "clnstm_itemtype"))
ls_cclinfcode = "RIF"

this.of_setsrvlninterest( true )

for ll_index = 1 to ll_count
	ls_contno = ads_payinslipdet.getitemstring(ll_index, "loancontract_no")
	ls_itemtype = ads_payinslipdet.getitemstring(ll_index, "slipitemtype_code")
	li_periodpay = ads_payinslipdet.getitemnumber(ll_index, "period")
	li_periodcount_flag = ads_payinslipdet.getitemnumber(ll_index, "periodcount_flag")
	
	ldc_prnpay = ads_payinslipdet.getitemdecimal(ll_index, "principal_payamt")
	ldc_intpay = ads_payinslipdet.getitemdecimal(ll_index, "interest_payamt")
	ldc_intarrpay = ads_payinslipdet.getitemdecimal(ll_index, "intarrear_payamt")
	ldc_slprnret = ads_payinslipdet.getitemdecimal(ll_index, "prnc_return")
	ldc_slintret = ads_payinslipdet.getitemdecimal(ll_index, "interest_return")
	ldc_slipintperiod = ads_payinslipdet.getitemdecimal(ll_index, "interest_period")
	ldc_bfintarramt = ads_payinslipdet.getitemdecimal(ll_index, "bfintarr_amt")
	ldc_bfprnbalamt = ads_payinslipdet.getitemdecimal(ll_index, "bfshrcont_balamt")
	ldtm_bflastcalint = ads_payinslipdet.getitemdatetime(ll_index, "bflastcalint_date")
	ldtm_bflastpay = ads_payinslipdet.getitemdatetime(ll_index, "bflastpay_date")
	ldtm_calintto = ads_payinslipdet.getitemdatetime(ll_index, "calint_to")
	
	if isnull(ldc_prnpay) then ldc_prnpay = 0
	if isnull(ldc_intpay) then ldc_intpay = 0
	if isnull(ldc_intarrpay) then ldc_intarrpay = 0
	if isnull(ldc_slintret) then ldc_slintret = 0
	
	ll_chk = ids_infocont.retrieve(is_coopcontrol, ls_contno)
	if ll_chk <= 0 then
		this.of_setsrvlninterest( false )
		destroy ads_payinslipdet
		return 0
	end if
	
	li_odflag = ids_infocont.getitemnumber(1, "od_flag")
	ldc_wtdbal = ids_infocont.getitemdecimal(1, "withdrawable_amt")
	ldc_contprnbal = ids_infocont.getitemdecimal(1, "principal_balance")
	ldc_contintarr = ids_infocont.getitemdecimal(1, "interest_arrear")
	ldc_contintret = ids_infocont.getitemdecimal(1, "interest_return")
	ldc_contintacc = ids_infocont.getitemdecimal(1, "interest_accum")
	ldc_contprnret = ids_infocont.getitemdecimal(1, "principal_return")
	ldc_bfintsetarr = ids_infocont.getitemdecimal(1, "intset_arrear")
	ldtm_contlastcalint = ids_infocont.getitemdatetime(1, "lastcalint_date")
	ldtm_contlastpay = ids_infocont.getitemdatetime(1, "lastpayment_date")
	
	// รหัสการย้อนรายการ
	if ls_itemtype = "LON" then
		ls_itemcode = ls_cclloncode
	else
		ls_itemcode = ls_cclinfcode
	end if
	
	// ดอกเบี้ยตั้งค้าง ตรวจสอบว่าคิด ด/บ จากยอดอะไร
	li_payspecmethod = ads_payinslipdet.getitemnumber(ll_index, "bfpayspec_method")
	ldc_slipintarrset = (ldc_bfintarramt + ldc_slipintperiod)-ldc_intpay
	
	if ldc_slipintarrset < 0 then ldc_slipintarrset = 0
	
	ldc_intarrbal = ldc_bfintarramt
	ldc_intarrsetbal = ldc_bfintsetarr + ldc_intarrpay
	ldtm_contlastcalint = ldtm_bflastcalint
	ldtm_contlastpay = ldtm_bflastpay
	
	ldc_prnbal = ldc_contprnbal + ldc_prnpay
	ldc_contintacc = ldc_contintacc - ldc_intpay
	
	// ถ้ามี ด/บ คืนต้องลบออก
	if ldc_slintret > 0 then
		ldc_contintret = ldc_contintret - ldc_slintret
	end if
	
	if ldc_slprnret > 0 then
		ldc_contprnret = ldc_contprnret - ldc_slprnret
	end if
		
	if ldc_contintret < 0 then ldc_contintret = 0
	if ldc_contprnret < 0 then ldc_contprnret = 0
	
	//ถอยงวด ถ้ามีการเช็คงวดเข้า
	if li_periodcount_flag = 1 then
		li_periodpay = li_periodpay - 1
	end if
	
	// ตรวจว่าเป็นสัญญา OD หรือเปล่า
	if li_odflag = 1 then
		ldc_wtdbal = ldc_wtdbal - ldc_prnpay
	end if
	
	// สถานะสัญญาต้องเป็นปกติเสมอเพราะเป็นการยกเลิกการชำระ
	li_contstatus = 1
	
	// เอายอดยกเลิกไปเพิ่มใส่ Master
	update lncontmaster
	set withdrawable_amt = :ldc_wtdbal,
	principal_balance = :ldc_prnbal,
	interest_arrear = :ldc_intarrbal,
	principal_return = :ldc_contprnret,
	interest_return = :ldc_contintret,
	interest_accum = :ldc_contintacc,
	intset_arrear = :ldc_intarrsetbal,
	lastcalint_date = :ldtm_contlastcalint,
	lastpayment_date = :ldtm_contlastpay,
	last_periodpay = :li_periodpay,
	intpayment_amt = intpayment_amt - :ldc_intpay,
	contract_status = :li_contstatus
	where(loancontract_no = :ls_contno) and
	(coop_id = :is_coopcontrol)
	using itr_sqlca;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ไม่สามารถปรับปรุงสัญญาส่วนของการยกเลิกการชำระได้~r~n" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	if ldtm_slipdate = ldtm_canceldate then
		li_stmstatus = -9
	else
		li_stmstatus = -99
	end if
	
	// บันทึกลง Statement
	lstr_lnstm.loancontract_no = ls_contno
	lstr_lnstm.contcoop_id = is_coopcontrol
	lstr_lnstm.slip_date = ldtm_slipdate
	lstr_lnstm.operate_date = ldtm_canceldate
	lstr_lnstm.account_date = ldtm_canceldate
	lstr_lnstm.intaccum_date = ldtm_opedate
	lstr_lnstm.ref_slipno = ls_slipno
	lstr_lnstm.ref_docno = ls_refdocno
	lstr_lnstm.loanitemtype_code = ls_itemcode
	lstr_lnstm.period = li_periodpay
	lstr_lnstm.principal_payment = ldc_prnpay
	lstr_lnstm.interest_payment = ldc_intpay
	lstr_lnstm.principal_balance = ldc_prnbal
	lstr_lnstm.prncalint_amt = ldc_prnpay
	lstr_lnstm.calint_from = ldtm_opedate
	lstr_lnstm.calint_to = ldtm_cccalint
	lstr_lnstm.bfinterest_arrear = ldc_contintarr
	lstr_lnstm.bfinterest_return = ldc_contintarr
	lstr_lnstm.interest_period = ldc_intarrextend
	lstr_lnstm.interest_arrear = ldc_intarrbal
	lstr_lnstm.interest_return = ldc_contintret
	lstr_lnstm.moneytype_code = ls_moneytype
	lstr_lnstm.item_status = li_stmstatus
	lstr_lnstm.entry_id = ls_cancelid
	lstr_lnstm.entry_bycoopid = is_coopid

	this.of_poststm_contract(lstr_lnstm)
	
	// บันทึก ดบสะสมสมาชิก
	this.of_postupd_memintaccum(is_coopcontrol, ls_memno, ldtm_opedate, ldc_intpay * -1)

	// ถ้าเป็น pmx ต้องไปเพิ่มยอดออก adjust ใน kpmastreceive
	if ls_sliptype = "PMX" then
		update kpmastreceivedet kp
		set adjust_prnamt = nvl(adjust_prnamt, 0)-:ldc_prnpay,
		adjust_intamt = nvl(adjust_intamt, 0)-:ldc_intpay,
		adjust_itemamt = nvl(adjust_itemamt, 0)-(:ldc_prnpay + :ldc_intpay)
		where coop_id = :is_coopcontrol
		and kpslip_no = :ls_refslipno
		and loancontract_no = :ls_contno
		and keepitemtype_code in('L01', 'L02', 'L03')
		using itr_sqlca;
	end if

next

return 1
end function

private function integer of_postccl_payinshare (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string		ls_slipno, ls_memno, ls_sharetype
string		ls_docno, ls_moneytype, ls_itemcode, ls_sliptype, ls_refslipno
string		ls_cancelid
datetime ldtm_canceldate, ldtm_slipdate, ldtm_shrtime
decimal	ldc_sharestk, ldc_unitshare, ldc_shareamt, ldc_bfshrarramt, ldc_shrarramt
integer	li_count, li_index, li_signflag, li_stmstatus, li_periodcount, li_period, li_lastperiod, li_chk
str_poststmshare		lstr_poststm

// ดึงรายการหุ้นที่ทำรายการออกมา
ads_payinslipdet.setfilter( "slipitemtype_code = 'SHR'" )
ads_payinslipdet.filter()

li_count = ads_payinslipdet.rowcount()
if ( li_count < 1  ) then
	return 0
end if

// รับรายการที่ต้องการยกเลิก
ls_slipno		= ads_payinslip.getitemstring( 1, "payinslip_no" )
ls_memno	 	= ads_payinslip.getitemstring( 1, "member_no" )
ls_sliptype		= ads_payinslip.getitemstring( 1, "sliptype_code" )
ls_docno		= ads_payinslip.getitemstring( 1, "document_no" )
ls_refslipno = ads_payinslip.GetItemString(1,"ref_slipno")
ls_moneytype 	= ads_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_slipdate	= ads_payinslip.getitemdatetime( 1, "slip_date" )
ldtm_shrtime	= ads_payinslip.getitemdatetime( 1, "operate_date" )

ls_cancelid		= ads_payinslip.getitemstring( 1, "cancel_id" )
ldtm_canceldate	= ads_payinslip.getitemdatetime( 1, "cancel_date" )

ls_itemcode	= string( this.of_getattribsliptype( ls_sliptype, "cshstm_itemtype" ) )

li_stmstatus		= -9
li_signflag 		= -1	// ต้องลดลง

for li_index = 1 to li_count

	ls_sharetype	= trim( ads_payinslipdet.getitemstring( li_index, "shrlontype_code" ) )
	li_periodcount	= ads_payinslipdet.getitemnumber( li_index, "periodcount_flag" )
	li_period			= ads_payinslipdet.getitemnumber( li_index, "period" )
	ldc_shareamt	= ads_payinslipdet.getitemdecimal( li_index, "item_payamt" )	
	
	// ทุนเรือนหุ้น และงวดล่าสุด
	select shsharemaster.sharestk_amt, shsharemaster.last_period, shsharetype.unitshare_value
	into	:ldc_sharestk, :li_lastperiod, :ldc_unitshare
	from	shsharemaster, shsharetype
	where( shsharemaster.sharetype_code	= shsharetype.sharetype_code ) and
			( shsharemaster.coop_id				= shsharetype.coop_id ) and
			( shsharemaster.member_no 		= :ls_memno ) and
			( shsharemaster.coop_id				= :is_coopcontrol )
	using itr_sqlca ;
	
	if isnull( li_lastperiod ) then li_lastperiod = 0	
	if isnull( ldc_sharestk ) then ldc_sharestk = 0
	if isnull( ldc_unitshare ) then ldc_unitshare = 10
		
	// ปรับยอดหุ้นทำรายการจากมูลค่าเป็นจำนวน
	ldc_sharestk		= ldc_sharestk + ( ( ldc_shareamt / ldc_unitshare ) * li_signflag )
		
	lstr_poststm.member_no			= ls_memno
	lstr_poststm.memcoop_id			= is_coopcontrol
	lstr_poststm.sharetype_code		= ls_sharetype
	lstr_poststm.slip_date			= ldtm_slipdate
	lstr_poststm.operate_date		= ldtm_canceldate
	lstr_poststm.account_date		= ldtm_canceldate
	lstr_poststm.sharetime_date		= ldtm_shrtime
	lstr_poststm.ref_slipno			= ls_slipno
	lstr_poststm.document_no 		= ls_docno	
	lstr_poststm.stmitem_code		= ls_itemcode
	lstr_poststm.period				= li_period	
	lstr_poststm.sharepay_amt		= ldc_shareamt / ldc_unitshare
	lstr_poststm.sharebal_amt 		= ldc_sharestk 
	lstr_poststm.moneytype			= ls_moneytype		
	lstr_poststm.bfsharearr_amt		= 0
	lstr_poststm.sharearr_amt		= 0
	lstr_poststm.item_status		= li_stmstatus
	lstr_poststm.entry_id			= ls_cancelid
	lstr_poststm.entry_bycoopid		= is_coopid
	
	// ผ่านรายการไปที่ statement หุ้น
	if this.of_poststm_share( lstr_poststm ) < 1 then		
		ithw_exception.text = "ไม่สามารถเพิ่มรายการ Statement หุ้นได้~n" + ithw_exception.text
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
	// บวกงวดขึ้น 1 หรือ ลง 1 ไม่มีการเอา bfperiod มาทับ
	if li_periodcount = 1 then
		li_lastperiod		= li_lastperiod - 1
	end if
	
	update 	shsharemaster
	set 		sharestk_amt = :ldc_sharestk,
				last_period = :li_lastperiod
	where 	( member_no	= :ls_memno ) and 
				( coop_id			= :is_coopcontrol ) and
				( sharetype_code = :ls_sharetype  )
	using itr_sqlca ;

	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text	+= "ไม่สามารถปรับปรุงทะเบียนหุ้นได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ; 		
		throw ithw_exception
	end if	
	
	// ถ้าเป็น pmx ต้องไปเพิ่มยอด adjust ใน kpmastreceive
	if ls_sliptype = "PMX" then
		update kpmastreceivedet kp
		set adjust_itemamt = nvl(adjust_itemamt, 0)-:ldc_shareamt
		where coop_id = :is_coopcontrol and kpslip_no = :ls_refslipno and keepitemtype_code = 'S01'
		using itr_sqlca;
	end if

next

return 1
end function

public function integer of_initshrwtd (ref str_slippayout atr_payoutslip) throws Exception;/***********************************************************
<description>
	สร้างใบจ่ายเงินค่าหุ้น
</description>

<arguments>  
	atr_payoutslip (ref)		str_slippayout		โครงสร้าง structure การจ่ายเงินค่าหุ้น
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage>

	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

string		ls_memno, ls_entryid
string		ls_shrwtdtype
long		ll_row
integer	li_lastwtdperiod, li_cfshrwtdtype
datetime	ldtm_slipdate, ldtm_entrydate
dec{2}	ldc_shrstkvalue, ldc_shrbfvalue, ldc_payoutclr, ldc_payoutnet, ldc_cfshrwtdmaxamt, ldc_shrwtdpending
dec{4}	ldc_shratretry, ldc_shrwtdvalue, ldc_cfshrwtdpercent
n_ds		lds_infoshare
n_ds		lds_payoutslip

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP

// ประเภทการถอนหุ้น SWD = โอนหุ้นชำระหนี้ + ถอนหุ้น, SWP = ถอนหุ้นบางส่วน + โอนชำระหนี้

ls_shrwtdtype	= atr_payoutslip.initfrom_type		
ls_memno		= atr_payoutslip.member_no
ldtm_slipdate	= atr_payoutslip.slip_date

ls_entryid		= atr_payoutslip.entry_id
ldtm_entrydate	=  datetime( today(), now() )

// ตรวจสอบซักหน่อยถ้าเป็นการถอนหุ้นบางส่วนว่ามีข้อกำหนดหรือยัง
if ls_shrwtdtype = "SWP" then
	select		shrwtdpartial_type, shrwtdpartial_percent, shrwtdpartial_maxamt
	into		:li_cfshrwtdtype, :ldc_cfshrwtdpercent, :ldc_cfshrwtdmaxamt
	from		shsharetype
	where	( shsharetype.sharetype_code	= '01' ) and
				( shsharetype.coop_id			= :is_coopcontrol )
	using		itr_sqlca ;
	
	if li_cfshrwtdtype = 0 or isnull( li_cfshrwtdtype ) then
		ithw_exception.text = "ระบบไม่อนุญาติให้ถอนหุ้นบางส่วนได้ ถ้าจะถอนหุ้นบางส่วนต้องไปกำหนดในข้อกำหนดประเภทหุ้นก่อน กรุณาตรวจสอบ"
		throw ithw_exception
	end if
end if

// ข้อมูลสมาชิก
ll_row		= ids_infomemdet.retrieve( is_coopcontrol, ls_memno )
if ( ll_row < 1 ) then
	ithw_exception.text = "ไม่พบข้อมูลของสมาชิกเลขที่ " + ls_memno +" กรุณาตรวจสอบ"
	throw ithw_exception
end if

// Clear ค่าเบื้องต้นก่อน
atr_payoutslip.xml_sliphead		= ""
atr_payoutslip.xml_slipcutlon	= ""
atr_payoutslip.xml_slipcutetc	= ""

// ข้อมูลหุ้นที่จะรับเงิน
lds_infoshare	= create n_ds
lds_infoshare.dataobject	= "d_loansrv_info_memshare"
lds_infoshare.settransobject( itr_sqlca )

ll_row = lds_infoshare.retrieve( is_coopcontrol,ls_memno )

ldc_shrstkvalue		= lds_infoshare.object.sharestk_value[ 1 ]
ldc_shrbfvalue		= lds_infoshare.object.sharebegin_value[ 1 ]
ldc_shrwtdvalue	= lds_infoshare.object.sharewtd_value[ 1 ]

li_lastwtdperiod	= lds_infoshare.object.lastshrwtd_period[ 1 ]

if isnull( li_lastwtdperiod ) then li_lastwtdperiod = 0
if isnull( ldc_shratretry ) then ldc_shratretry = 0

// ถ้าไม่มีหุ้นให้ถอน
if ldc_shrstkvalue <= 0 then
	ithw_exception.text	= "ไม่มีทุนเรือนหุ้นคงเหลือให้ถอน กรุณาตรวจสอบ"
	throw ithw_exception
end if

li_lastwtdperiod ++

// ถ้าถอนหุ้นครั้งแรก
if li_lastwtdperiod = 1 then
	ldc_shratretry		= ldc_shrstkvalue
	ldc_shrwtdvalue	= 0
end if

lds_payoutslip.reset()
lds_payoutslip.insertrow( 0 )

lds_payoutslip.object.prename_desc[ 1 ]		= ids_infomemdet.object.prename_desc[ 1 ]
lds_payoutslip.object.memb_name[ 1 ]		= ids_infomemdet.object.memb_name[ 1 ]
lds_payoutslip.object.memb_surname[ 1 ]	= ids_infomemdet.object.memb_surname[ 1 ]
lds_payoutslip.object.membgroup_code[ 1 ]	= ids_infomemdet.object.membgroup_code[ 1 ]
lds_payoutslip.object.membgroup_desc[ 1 ]	= ids_infomemdet.object.membgroup_desc[ 1 ]

lds_payoutslip.object.shrlontype_code[ 1 ]	= lds_infoshare.object.sharetype_code[ 1 ]
lds_payoutslip.object.bfperiod[ 1 ]				= lds_infoshare.object.last_period[ 1 ]
lds_payoutslip.object.bfshare_status[ 1 ]		= lds_infoshare.object.sharemaster_status[ 1 ]
lds_payoutslip.object.share_status[ 1 ]		= lds_infoshare.object.sharemaster_status[ 1 ]

lds_payoutslip.setitem( 1, "member_no", ls_memno )
lds_payoutslip.setitem( 1, "memcoop_id", is_coopcontrol )
lds_payoutslip.setitem( 1, "document_no", "AUTO" )
lds_payoutslip.setitem( 1, "sliptype_code", ls_shrwtdtype )
lds_payoutslip.setitem( 1, "slip_date", ldtm_slipdate )
lds_payoutslip.setitem( 1, "operate_date", ldtm_slipdate )
lds_payoutslip.setitem( 1, "moneytype_code", "CSH" )
lds_payoutslip.setitem( 1, "expense_bank", "" )
lds_payoutslip.setitem( 1, "expense_branch", "" )
lds_payoutslip.setitem( 1, "expense_accid", "" )
lds_payoutslip.setitem( 1, "entry_id", ls_entryid )
lds_payoutslip.setitem( 1, "entry_date", ldtm_entrydate )
lds_payoutslip.setitem( 1, "setshrarr_flag", 0 )

lds_payoutslip.setitem( 1, "bfshrcont_balamt", ldc_shrstkvalue )
lds_payoutslip.setitem( 1, "bfsharebegin_amt", ldc_shrbfvalue )
lds_payoutslip.setitem( 1, "bfwithdraw_amt", ldc_shrwtdvalue )

// เรียก service สำหรับการเคลียร์หนี้ อื่นๆ (ไม่ว่าจะถอนบางส่วนหรือถอนหมด ก็ Init ไว้ให้สำหรับ Clear
atr_payoutslip.xml_slipcutlon	= this.of_initslippayin_loan( is_coopcontrol, ls_memno, "TSL", ldtm_slipdate )
//atr_payoutslip.xml_slipcutetc	= this.of_initslippayin_etc( ls_memno, "TSL", ldtm_operate )

choose case upper( ls_shrwtdtype )
	case "SWD"  // ถอนหุ้นปิดบัญชี
		ldc_payoutnet	= ldc_shrstkvalue
		
		// init ค่าการชำระเบื้องต้น
		this.of_initshrwtd_initclear( atr_payoutslip.xml_slipcutlon, atr_payoutslip.xml_slipcutetc, ldc_payoutnet )
	
		ldc_payoutclr	= ldc_shrstkvalue - ldc_payoutnet
		
		lds_payoutslip.setitem( 1, "share_status", -1 )
		lds_payoutslip.setitem( 1, "rcv_period", li_lastwtdperiod )
		lds_payoutslip.setitem( 1, "payout_amt", ldc_shrstkvalue )
		lds_payoutslip.setitem( 1, "payoutclr_amt", ldc_payoutclr )
		lds_payoutslip.setitem( 1, "payoutnet_amt", ldc_payoutnet )
		lds_payoutslip.setitem( 1, "shrwtdpending_amt", ldc_shrstkvalue )
		
	case "SWP"	 // ถอนหุ้นบางส่วน
		ldc_shrwtdpending		= 0
		
		// ตรวจสอบเงื่อนไขการถอนหุ้นบางส่วน
		choose case li_cfshrwtdtype
			case 1	// ตาม % ที่กำหนด
				ldc_shrwtdpending		= ldc_shratretry * ldc_cfshrwtdpercent
				if ldc_shrwtdpending > ldc_cfshrwtdmaxamt then
					ldc_shrwtdpending		= ldc_cfshrwtdmaxamt
				end if
				
				ldc_shrwtdpending		= ldc_shrwtdpending - ldc_shrwtdvalue
		end choose
		
		lds_payoutslip.setitem( 1, "rcvperiod_flag", 1 )
		lds_payoutslip.setitem( 1, "rcv_period", li_lastwtdperiod )
		lds_payoutslip.setitem( 1, "payout_amt", 0  )
		lds_payoutslip.setitem( 1, "payoutclr_amt", 0 )
		lds_payoutslip.setitem( 1, "payoutnet_amt", 0 )
		lds_payoutslip.setitem( 1, "shrwtdpending_amt", ldc_shrwtdpending )
end choose

// ส่งกลับใบถอนหุ้น
atr_payoutslip.xml_sliphead	= inv_dwxmliesrv.of_xmlexport( lds_payoutslip )

destroy lds_payoutslip

return 1
end function

private function integer of_postslip_sharewtd (ref n_ds ads_slippayout) throws Exception;string		ls_memno, ls_memcoopid, ls_sharetype, ls_payoutslipno, ls_docrcvno, ls_sliptype, ls_itemtype, ls_moneytype
dec		ldc_bfshrstk, ldc_sharestk, ldc_bfshrarr, ldc_shrarr, ldc_unitshare, ldc_shrarramt, ldc_sharewtd
dec		ldc_bfshrwtd, ldc_bfshratretry, ldc_shrwtdbal
integer	li_bfshrstatus, li_shrstatus, li_wtdperiod, li_shrarrflag
datetime	ldtm_opedate, ldtm_slipdate
string		ls_entryid
datetime	ldtm_entrydate
str_poststmshare	lstr_poststm

ls_sliptype			= ads_slippayout.getitemstring( 1, "sliptype_code" )
ls_memcoopid		= ads_slippayout.getitemstring( 1, "memcoop_id" )
ls_memno			= ads_slippayout.getitemstring( 1, "member_no" )
ls_sharetype		= ads_slippayout.getitemstring( 1, "shrlontype_code" )
ls_payoutslipno		= ads_slippayout.getitemstring( 1, "payoutslip_no" )
ls_docrcvno			= ads_slippayout.getitemstring( 1, "document_no" )
ls_moneytype		= ads_slippayout.getitemstring( 1, "moneytype_code" )
li_wtdperiod			= ads_slippayout.getitemnumber( 1, "rcv_period" )
li_bfshrstatus		= ads_slippayout.getitemnumber( 1, "bfshare_status" )
ldc_bfshrwtd		= ads_slippayout.getitemdecimal( 1, "bfwithdraw_amt" )
ldc_bfshrstk			= ads_slippayout.getitemdecimal( 1, "bfshrcont_balamt" )
ldc_sharewtd		= ads_slippayout.getitemdecimal( 1, "payout_amt" )
ldc_shrarramt		= ads_slippayout.getitemdecimal( 1, "payoutnet_amt" )
ldtm_slipdate		= ads_slippayout.getitemdatetime( 1, "slip_date" )
ldtm_opedate		= ads_slippayout.getitemdatetime( 1, "operate_date" )

ls_entryid			= ads_slippayout.getitemstring( 1, "entry_id" )
ldtm_entrydate		= datetime( today(), now() )

// กำหนดค่าเริ่มต้น
li_shrstatus			= li_bfshrstatus

select	unitshare_value
into	:ldc_unitshare
from	shsharetype
where( sharetype_code	= :ls_sharetype ) and
		( coop_id				= :ls_memcoopid )
using	itr_sqlca ;

if isnull( ldc_unitshare ) then ldc_unitshare = 10

// ถ้าประเภทเงินเป็นโอนตั้งหุ้นค้าง
if ls_moneytype = "TSA" then
	ldc_sharewtd	= ads_slippayout.getitemdecimal( 1, "payoutclr_amt" )
	ldc_sharestk		= ldc_shrarramt
	ldc_shrwtdbal	= ldc_shrarramt
	li_shrstatus		= STATUS_SHARE_ARREAR
else
	ldc_sharestk		= 0
	ldc_shrwtdbal	= 0
	li_shrstatus		= STATUS_CLOSE
end if

ldc_sharestk		= ldc_sharestk / ldc_unitshare
ldc_shrwtdbal	= ldc_shrwtdbal / ldc_unitshare

// ปรับปรุงทะเบียนหุ้น
update	shsharemaster
set			sharestk_amt			= :ldc_sharestk, 
			lastshrwtd_date 		= :ldtm_opedate,
			lastshrwtd_period		= :li_wtdperiod,
			sharemaster_status	= :li_shrstatus,
			sharewithdraw_amt	= :ldc_shrwtdbal
where  ( member_no			= :ls_memno ) and
		  ( coop_id				= :ls_memcoopid ) and
		  ( sharetype_code		= :ls_sharetype )
using itr_sqlca;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text += "~nไม่สามารถปรับปรุงยอดที่ทะเบียนหุ้นได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext 
	rollback using itr_sqlca;
	throw ithw_exception
end if

// ถ้าเป็นการถอนหุ้นงวดแรก เก็บค่าหุ้นตอนก่อนถอนไว้ด้วย
if li_wtdperiod = 1 then
	ldc_bfshrstk		= ldc_bfshrstk / ldc_unitshare
	
	update	shsharemaster
	set			shareatretry_amt	= :ldc_bfshrstk
	where  ( member_no			= :ls_memno ) and
			  ( coop_id				= :ls_memcoopid ) and
			  ( sharetype_code		= :ls_sharetype )
	using	itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text += "~nไม่สามารถปรับปรุงยอดหุ้นที่มี ณ ตอนถอนได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext 
		rollback using itr_sqlca;
		throw ithw_exception
	end if
end if

//-------------------------------------
//ผ่านรายการไปที่ statement หุ้น
//-------------------------------------
// ตรวจสถานะหุ้นตอนก่อนถอนก่อนจะได้ใส่ Statement ได้ถูกช่อง
if li_bfshrstatus = STATUS_SHARE_ARREAR then
	ldc_bfshrarr		= ldc_bfshrstk / ldc_unitshare
else
	ldc_bfshrarr		= 0
end if

// ตรวจสถานะหุ้นหลังถอนจะได้ใส่ Statement ได้ถูกช่อง
if li_shrstatus = STATUS_SHARE_ARREAR then
	ldc_shrarr		= ldc_sharestk
end if

ldc_sharewtd		= ldc_sharewtd / ldc_unitshare
ls_itemtype			= string( this.of_getattribsliptype( ls_sliptype, "shstm_itemtype" ) )

lstr_poststm.member_no 		= ls_memno
lstr_poststm.memcoop_id 		= ls_memcoopid
lstr_poststm.sharetype_code 	= ls_sharetype
lstr_poststm.slip_date				= ldtm_slipdate
lstr_poststm.operate_date 		= ldtm_opedate
lstr_poststm.account_date		= ldtm_slipdate
lstr_poststm.sharetime_date	= ldtm_opedate
lstr_poststm.entry_id				= ls_entryid
lstr_poststm.entry_bycoopid		= is_coopid
lstr_poststm.item_status			= 1
lstr_poststm.ref_slipno			= ls_payoutslipno
lstr_poststm.document_no		= ls_docrcvno
lstr_poststm.moneytype			= ls_moneytype
lstr_poststm.period				= li_wtdperiod
lstr_poststm.stmitem_code		= ls_itemtype
lstr_poststm.sharepay_amt		= ldc_sharewtd
lstr_poststm.sharebal_amt		= ldc_sharestk
lstr_poststm.bfsharearr_amt	= ldc_bfshrarr
lstr_poststm.sharearr_amt		= ldc_shrarr

if this.of_poststm_share( lstr_poststm ) < 1 then
	ithw_exception.text = "Post share SWD Statement~n" + ithw_exception.text
	rollback using itr_sqlca;
	throw ithw_exception
end if

return 1
end function

public function integer of_saveccl_shrwtd (str_slipcancel astr_cancelslip) throws Exception;/***********************************************************
<description>
	สำหรับยกเลิกรายการ Slip การถอนหุ้น
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก Slip
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- slip_no				String			เลขที่ Slip รายการถอนหุ้นที่ต้องการยกเลิก
		- cancel_id			String			ผู้ยกเลิกรายการ
		- cancel_date		datetime		วันที่ยกเลิกรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	ส่งเลขที่ Slip รายการจ่ายเงินกู้ที่ต้องการยกเลิกผ่าน Structure เข้ามา
	ระบบจะนำข้อมูลไปยกเลิกและปรับปรุงยอดคงเหลือต่างๆ
	
	str_slipcancel	lstr_slipcancel
	
	lstr_slipcancel.slip_no			= dw_sliphead.getitemstring( 1, "payoutslip_no" )
	lstr_slipcancel.cancel_id		= entry_id
	lstr_slipcancel.cancel_date	= system_date
	
	lnv_lnoperate.of_saveccl_lnrcv( lstr_slipcancel )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by MITJa
	Version 2.0 Modified Date 30/05/2011 by OhhO
</usage> 
***********************************************************/

string		ls_cancelid, ls_slipno, ls_itemcode, ls_sliptype, ls_memno, ls_sharetype
string		ls_docno, ls_moneytype, ls_slipclrno, ls_xmlslipdetail, ls_xmlsliphead, ls_cancellnno
datetime ldtm_canceldate, ldtm_slipdate
decimal	ldc_sharestk, ldc_unitshare, ldc_shareamt, ldc_bfshrarramt, ldc_shrarramt
integer	li_count, li_index, li_signflag, li_slipstatus, li_periodcount, li_period, li_lastperiod
integer	li_ret
integer	li_row, li_rowcount
string 	ls_slipcoopid
str_poststmshare		lstr_poststm
n_ds		lds_payoutslip

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP
lds_payoutslip.settransobject( itr_sqlca )

ls_slipcoopid		= astr_cancelslip.slipcoop_id
ls_slipno				= astr_cancelslip.slip_no
ls_cancelid			= astr_cancelslip.cancel_id
ldtm_canceldate	= astr_cancelslip.cancel_date

li_rowcount = lds_payoutslip.retrieve( is_coopcontrol, ls_slipno )

if ( li_rowcount < 1 ) then
	ithw_exception.text = "ไม่พบข้อมูลรายการถอนหุ้นที่ต้องการยกเลิก เลขที่ใบถอน "+ls_slipno
	throw ithw_exception
end if

ls_sliptype		= trim( lds_payoutslip.getitemstring( 1, "sliptype_code" ) )
ls_slipclrno		= trim( lds_payoutslip.getitemstring( 1, "slipclear_no" ) )
ldtm_slipdate	= lds_payoutslip.getitemdatetime( 1, "slip_date" )

if ldtm_canceldate <= ldtm_slipdate then
	li_slipstatus		= -9
	ldtm_canceldate	= ldtm_slipdate
else
	li_slipstatus		= -99
end if

// ใส่ข้อมูลการยกเลิกไปที่ Slip
lds_payoutslip.setitem( 1, "slip_status", li_slipstatus )
lds_payoutslip.setitem( 1, "cancel_id", ls_cancelid )
lds_payoutslip.setitem( 1, "cancel_date", ldtm_canceldate )

// --------------------------------------------------------
// เริ่มกระบวนการบันทึก Slip และไปยกเลิกรายการต่างๆ
// - บันทีก Slip ก่อน
// - Export รายการถอนหุ้นเก็บไว้
// - ไปยกเลิกรายการโอนชำระหนี้ก่อนรายการถอนหุ้นเสมอ
//    เพราะเวลาถอนหุ้นจะทำการถอนก่อนแล้วค่อยโอนชำระหนี้
//    เวลายกเลิกก็ต้องกลับกระบวนการ Statement จะได้เรียงได้ถูกต้อง
// --------------------------------------------------------

// บันทึก Slip
if lds_payoutslip.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip ไม่ได้"
	ithw_exception.text	+= lds_payoutslip.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// Export ข้อมูลอีกทีเพราะมีการใส่ข้อมูลการยกเลิกเพิ่มเติม
ls_xmlsliphead		= string( lds_payoutslip.describe( "Datawindow.data.XML" ) )

try
	// ถ้ามีการหักกลบส่งไปยกเลิกการโอนชำระหนี้ก่อน
	if ls_slipclrno <> "" and not isnull( ls_slipclrno ) then
		str_slipcancel	lstr_cclpayin
		
		lstr_cclpayin.slipcoop_id		= ls_slipcoopid
		lstr_cclpayin.slip_no			= ls_slipclrno
		lstr_cclpayin.cancel_id		= astr_cancelslip.cancel_id
		lstr_cclpayin.cancel_date		= astr_cancelslip.cancel_date
		
		this.of_saveccl_payin( lstr_cclpayin )
	end if
	
	// ผ่านรายการยกเลิกการถอนหุ้น
	this.of_postccl_shrwtd( lds_payoutslip )
	
catch( Exception lthw_cclpayin )
	rollback using itr_sqlca ;
	throw lthw_cclpayin
end try

commit using itr_sqlca ;

return 1
end function

public function integer of_saveslip_shrwtd (ref str_slippayout astr_shrpayout) throws Exception;string ls_payoutslipno, ls_slipclrno, ls_sliptype
string ls_xmlhead, ls_xmlloan, ls_xmletc, ls_entryid
dec ldc_shrwtdnet, ldc_clearamt
long ll_find, ll_count
integer li_chk
dec{2}ldc_payout
datetime ldtm_entrydate
n_ds lds_payoutslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip = create n_ds
lds_payoutslip.dataobject = DWO_PAYOUTSLIP
lds_payoutslip.settransobject(itr_sqlca)

lds_payinslipdet = create n_ds
lds_payinslipdet.dataobject = DWO_PAYINSLIPDET
lds_payinslipdet.settransobject(itr_sqlca)

// ข้อมูลการถอนหุ้น
ls_xmlhead = astr_shrpayout.xml_sliphead
ls_xmlloan = astr_shrpayout.xml_slipcutlon
ls_xmletc = astr_shrpayout.xml_slipcutetc

ls_entryid = astr_shrpayout.entry_id
ldtm_entrydate = datetime(today(), now())

li_chk = inv_dwxmliesrv.of_xmlimport(lds_payoutslip, ls_xmlhead)
if (li_chk < 1) then
	ithw_exception.text = "ไม่สามารถ import ข้อมูลเพื่อทำรายการถอนหุ้นได้"
	throw ithw_exception
end if

ls_sliptype = lds_payoutslip.getitemstring(1, "sliptype_code")
ldc_payout = lds_payoutslip.getitemdecimal(1, "payout_amt")

// ถอนหุ้นบางส่วนไม่เต็มจำนวน(10บาท) ต้องไม่ให้ทำต่อ
if ls_sliptype = "SWP" and mod(ldc_payout, 10) > 0 then
	ithw_exception.text = "ยอดถอนหุ้นไม่เต็มหุ้น (มูลค่าหุ้นละ 10 บาท) กรุณาตรวจสอบ"
	throw ithw_exception
end if

// นำเข้าข้อมูลส่วนการหักชำระ
inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, ls_xmlloan)
inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, ls_xmletc)

// ตรวจสอบว่ามีรายการหักชำระหรือไม่
ll_count = lds_payinslipdet.rowcount()
if ll_count > 0 then
	// ปรับค่าในรายการหักชำระให้สมบูรณ์
	this.of_setabspayindet(lds_payinslipdet)
	
	ldc_clearamt = dec(lds_payinslipdet. describe ("evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', " + string(ll_count)+" )"))
else
	ldc_clearamt = 0
end if

// ถ้ายอดหักชำระมีมากกว่ายอดถอนต้องไม่ให้ทำต่อ
if ldc_clearamt > ldc_payout then
	ithw_exception.text = "ยอดหักชำระมีมากกว่ายอดถอนหุ้น กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ขอเลขที่ Slip จ่าย
this.of_setsrvdoccontrol( true )
ls_payoutslipno = inv_docsrv.of_getnewdocno(is_coopcontrol, "SLSLIPPAYOUT")
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ Slip ใน Header
lds_payoutslip.setitem(1, "coop_id", is_coopcontrol)
lds_payoutslip.setitem(1, "payoutslip_no", ls_payoutslipno)
lds_payoutslip.setitem(1, "entry_id", ls_entryid)
lds_payoutslip.setitem(1, "entry_date", ldtm_entrydate)
lds_payoutslip.setitem(1, "entry_bycoopid", is_coopid)

// Clear ข้อมูลการหักชำระไว้ก่อน
//lds_payoutslip.setitem( 1, "payoutclr_amt", 0 )
//lds_payoutslip.setitem( 1, "payoutnet_amt", ldc_payout )
if ls_sliptype <> "TSA" then
astr_shrpayout.payoutslip_no = ls_payoutslipno
end if
// --------------------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// 1. ต้องบันทึกรายการจ่ายเงินถอนหุ้นก่อน
// 2. ผ่านรายการถอนหุ้น
// 3. เรียกใช้ Function transpayin เพื่อสร้างหัว Slip pay in, บันทึก Slip payin, ผ่านรายการชำระ
// 4. ปรับปรุงรายละเอียดการหักชำระที่ตัว Slip Pay Out การจ่ายเงินถอนหุ้นอีกที
// --------------------------------------------------------

// บันทึก Slip Pay Out
li_chk = lds_payoutslip. update ()
if (li_chk <> 1) then
	ithw_exception.text += "~nไม่สามารถบันทึกใบจ่ายเงินค่าหุ้นได้ ~n" + lds_payoutslip.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
end if

try
	// ผ่านรายการถอนหุ้น
	this.of_postslip_sharewtd(lds_payoutslip)
	
	// ถ้ามีรายการหักชำระ
	if ldc_clearamt > 0 then
		astr_shrpayout.receiptno_flag = true
		
		this.of_transpayin(astr_shrpayout)

		// ต้องมีการ Set ค่าการหักชำระเพื่อทำการบันทึกไปที่ Slip Pay Out อีกที
		// Import หัว slipอีกที
		lds_payoutslip.reset()
		lds_payoutslip.importstring(XML!, astr_shrpayout.xml_sliphead)
		
		// ดึงค่าที่เกี่ยวข้องกับการหักชำระเพื่อทำการบันทึกไปที่ Slip Pay Out อีกที
		ls_slipclrno = lds_payoutslip.getitemstring(1, "slipclear_no")
		ldc_clearamt = lds_payoutslip.getitemdecimal(1, "payoutclr_amt")
		ldc_shrwtdnet = lds_payoutslip.getitemdecimal(1, "payoutnet_amt")
		
		update slslippayout
		set slipclear_no = :ls_slipclrno,
		payoutclr_amt = :ldc_clearamt,
		payoutnet_amt = :ldc_shrwtdnet
		where(payoutslip_no = :ls_payoutslipno) and
		(coop_id = :is_coopcontrol)
		using itr_sqlca;
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text = "ไม่สามารถปรับปรุงรายการหักชำระ ในใบถอนหุ้นได้ เลขที่ใบจ่าย (" + ls_payoutslipno + ")~n" + itr_sqlca.sqlerrtext
			rollback using itr_sqlca;
			throw ithw_exception
		end if
	end if
	
catch (Exception lthw_error)
	rollback using itr_sqlca;
	throw lthw_error
end try

commit using itr_sqlca;

destroy lds_payoutslip

return 1
end function

private function integer of_postccl_shrwtd (ref n_ds ads_payoutslip) throws Exception;string		ls_coopid, ls_cclid, ls_slipno, ls_itemcode, ls_sliptype, ls_memno, ls_sharetype
string		ls_docno, ls_moneytype,ls_memcoopid
integer	li_signflag, li_slipstatus, li_periodcount, li_period, li_lastperiod
integer	li_shrstatus, li_bfshrstatus
decimal	ldc_sharestk, ldc_unitshare, ldc_shareamt, ldc_bfsharestk
datetime ldtm_canceldate, ldtm_slipdate, ldtm_shrtime
str_poststmshare		lstr_poststm

ls_slipno				= trim( ads_payoutslip.getitemstring( 1, "payoutslip_no" ) )
ls_memno	 		= trim( ads_payoutslip.getitemstring( 1, "member_no" ) )
ls_sliptype			= trim( ads_payoutslip.getitemstring( 1, "sliptype_code" ) )
ls_sharetype		= trim( ads_payoutslip.getitemstring( 1, "shrlontype_code" ) )
ls_docno				= trim( ads_payoutslip.getitemstring( 1, "document_no" ) )
ls_moneytype		= trim( ads_payoutslip.getitemstring( 1, "moneytype_code" ) )
li_periodcount		= ads_payoutslip.getitemnumber( 1, "rcvperiod_flag" )
li_period				= ads_payoutslip.getitemnumber( 1, "rcv_period" )
li_bfshrstatus		= ads_payoutslip.getitemnumber( 1, "bfshare_status" )
ldc_bfsharestk		= ads_payoutslip.getitemdecimal( 1, "bfshrcontbal_amt" )
ldc_shareamt		= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldtm_slipdate		= ads_payoutslip.getitemdatetime( 1, "slip_date" )
ldtm_shrtime		= ads_payoutslip.getitemdatetime( 1, "operate_date" )
ls_memcoopid		= ads_payoutslip.getitemstring( 1, "memcoop_id" )

ls_cclid				= ads_payoutslip.getitemstring( 1, "cancel_id" )
ls_coopid			= ads_payoutslip.getitemstring( 1, "coop_id" )
ldtm_canceldate	= ads_payoutslip.getitemdatetime( 1, "cancel_date" )

// ค้นหารหัสทำรายการ เพื่อนำไปยิงใน statement
ls_itemcode		= string( this.of_getattribsliptype( ls_sliptype, "cshstm_itemtype" ) )
li_slipstatus		= -9	// ยกเลิก
li_signflag		= 1	// ต้องบวกเพิ่ม

// ตรวจว่ามีการตั้งหุ้นค้างหรือไม่ ถ้าตั้งหุ้นค้างยอดถอนหุ้นต้องเป็นยอดหักชำระ
if ls_moneytype = "TSA" then
	ldc_shareamt		= ads_payoutslip.getitemdecimal( 1, "payoutclr_amt" )
end if

// ดึงยอดทุนเรือนหุ้นสำหรับทำการยกเลิก
select	shsharemaster.sharestk_amt, shsharemaster.lastwithdraw_period, shsharetype.unitshare_value
into	:ldc_sharestk, :li_lastperiod, :ldc_unitshare
from	shsharemaster, shsharetype
where ( shsharemaster.sharetype_code	= shsharetype.sharetype_code ) and
		 ( shsharemaster.member_no 		= :ls_memno )and
		 (shsharemaster.coop_id				=:ls_memcoopid)
using itr_sqlca ;

if isnull( li_lastperiod ) then li_lastperiod = 0
if isnull( ldc_sharestk ) then ldc_sharestk = 0

// หุ้นทำรายการยกเลิก
ldc_shareamt		= ldc_shareamt / ldc_unitshare
ldc_bfsharestk		= ldc_bfsharestk / ldc_unitshare

// ยอดทุนเรือนหุ้นปรับเพิ่ม
ldc_sharestk		= ldc_sharestk + ( li_signflag * ldc_shareamt )

// ตรวจดูว่าเป็นการยกเลิกการถอนหุ้นประเภทไหน
if ls_sliptype = "SWD" then
	li_shrstatus		= li_bfshrstatus
else
	li_shrstatus		= STATUS_NORMAL
	
end if

// ถอยงวดการรับเงินหุ้น
if li_lastperiod > 0 then
	li_lastperiod --
end if

// ปรับปรุงทะเบียนหุ้น
update 	shsharemaster
set 		sharestk_amt			= :ldc_sharestk,
			lastwithdraw_period	= :li_lastperiod,
			sharemaster_status	= :li_shrstatus
where 	( member_no = :ls_memno ) and 
			( sharetype_code = :ls_sharetype )and
			(coop_id 				=:ls_memcoopid)
using itr_sqlca ;
if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	+= "ไม่สามารถปรับปรุงทะเบียนหุ้นได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

lstr_poststm.memcoop_id		=ls_memcoopid
lstr_poststm.member_no			= ls_memno
lstr_poststm.sharetype_code	= ls_sharetype
lstr_poststm.slip_date				= ldtm_slipdate
lstr_poststm.operate_date		= ldtm_canceldate
lstr_poststm.account_date		= ldtm_canceldate
lstr_poststm.sharetime_date	= ldtm_shrtime
lstr_poststm.ref_slipno			= ls_slipno
lstr_poststm.document_no 		= ls_docno	
lstr_poststm.stmitem_code		= ls_itemcode
lstr_poststm.period				= li_period	
lstr_poststm.sharepay_amt		= ldc_shareamt
lstr_poststm.sharebal_amt 		= ldc_sharestk 
lstr_poststm.moneytype			= ls_moneytype		
lstr_poststm.bfsharearr_amt	= 0
lstr_poststm.sharearr_amt		= 0
lstr_poststm.item_status			= li_slipstatus
lstr_poststm.entry_id				= ls_cclid
lstr_poststm.entry_bycoopid			= ls_coopid

// ผ่านรายการไปที่ statement หุ้น
if this.of_poststm_share( lstr_poststm ) < 1 then
	ithw_exception.text = "ไม่สามารถเพิ่มรายการ Statement หุ้นได้~n" + ithw_exception.text
	rollback using itr_sqlca ;
	throw ithw_exception
end if

return 1
end function

private function integer of_postccl_lnrcv (n_ds ads_payoutslip) throws Exception;string			ls_contno, ls_contcoopid, ls_slipno, ls_sliptype, ls_itemtype, ls_itemcode, ls_moneytype
string			ls_entryid, ls_refdocno
long			ll_count, ll_chk
integer		li_periodrcv
dec{2}		ldc_prnrcv, ldc_contprnbal, ldc_contintarr, ldc_contprnret, ldc_contintret, ldc_intretperiod
dec{2}		ldc_prnbal, ldc_intretbal, ldc_bfprnbal, ldc_contwtdbal, ldc_bfintarrear
datetime		ldtm_slipdate, ldtm_opedate, ldtm_ccldate
datetime		ldtm_contlastcalint, ldtm_contlastproc, ldtm_cccalint, ldtm_startcont
datetime		ldtm_bflastcalint, ldtm_rcvlastproc, ldtm_rcvchkdate
str_poststmloan	lstr_lnstm

ls_slipno				= ads_payoutslip.getitemstring( 1, "payoutslip_no" )
ls_sliptype			= ads_payoutslip.getitemstring( 1, "sliptype_code" )
ls_refdocno			= ads_payoutslip.getitemstring( 1, "document_no" )
ls_contno			= ads_payoutslip.getitemstring( 1, "loancontract_no" )
ls_contcoopid		= ads_payoutslip.getitemstring( 1, "concoop_id" )
ls_moneytype		= ads_payoutslip.getitemstring( 1, "moneytype_code" )
ls_entryid			= ads_payoutslip.getitemstring( 1, "cancel_id" )
li_periodrcv			= ads_payoutslip.getitemnumber( 1, "rcv_period" )
ldc_prnrcv			= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldc_bfprnbal			= ads_payoutslip.getitemdecimal( 1, "bfshrcont_balamt" )
ldc_bfintarrear		= ads_payoutslip.getitemdecimal( 1, "bfinterest_arrear" )
ldtm_slipdate		= ads_payoutslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate		= ads_payoutslip.getitemdatetime( 1, "operate_date" )
ldtm_ccldate		= ads_payoutslip.getitemdatetime( 1, "cancel_date" )
ldtm_bflastcalint	= ads_payoutslip.getitemdatetime( 1, "bflastcalint_date" )
ldtm_rcvlastproc	= ads_payoutslip.getitemdatetime( 1, "bflastproc_date" )

ls_itemcode			= string( this.of_getattribsliptype( ls_sliptype, "clnstm_itemtype" ) )

this.of_setsrvlninterest( true )

ll_chk		= ids_infocont.retrieve( is_coopcontrol, ls_contno )
if ll_chk <= 0 then
	return 0
end if

ldc_contprnbal			= ids_infocont.getitemdecimal( 1, "principal_balance" )
ldc_contwtdbal			= ids_infocont.getitemdecimal( 1, "withdrawable_amt" )
ldc_contintarr			= ids_infocont.getitemdecimal( 1, "interest_arrear" )
ldc_contprnret			= ids_infocont.getitemdecimal( 1, "principal_return" )
ldc_contintret			= ids_infocont.getitemdecimal( 1, "interest_return" )
ldtm_contlastcalint		= ids_infocont.getitemdatetime( 1, "lastcalint_date" )
ldtm_contlastproc		= ids_infocont.getitemdatetime( 1, "lastprocess_date" )
ldtm_startcont			= ids_infocont.getitemdatetime( 1, "startcont_date" )

ldc_intretperiod		= 0

ldc_prnbal			= ldc_contprnbal - ldc_prnrcv
ldc_contwtdbal		= ldc_contwtdbal + ldc_prnrcv
ldc_intretbal			= ldc_contintret + ldc_intretperiod
li_periodrcv			= li_periodrcv - 1

if ldc_prnbal = 0 then
	setnull( ldtm_startcont )
end if

// เอายอดยกเลิกไปลดใน Master
update	lncontmaster
set			principal_balance	= :ldc_prnbal,
			withdrawable_amt	= :ldc_contwtdbal,
			interest_arrear		= :ldc_bfintarrear,
			lastcalint_date		= :ldtm_bflastcalint,
			last_periodrcv		= :li_periodrcv,
			startcont_date		= :ldtm_startcont
where	( coop_id				= :ls_contcoopid ) and
			( loancontract_no	= :ls_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงสัญญาส่วนของการยกเลิกการจ่ายเงินกู้ได้~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// บันทึกลง Statement
lstr_lnstm.loancontract_no			= ls_contno
lstr_lnstm.contcoop_id				= ls_contcoopid
lstr_lnstm.slip_date					= ldtm_slipdate
lstr_lnstm.operate_date				= idtm_operdate
lstr_lnstm.account_date				= ldtm_ccldate
lstr_lnstm.intaccum_date				= ldtm_opedate
lstr_lnstm.ref_slipno					= ls_slipno
lstr_lnstm.ref_docno					= ls_refdocno
lstr_lnstm.loanitemtype_code		= ls_itemcode
lstr_lnstm.period						= li_periodrcv
lstr_lnstm.principal_payment		= ldc_prnrcv
lstr_lnstm.interest_payment			= 0
lstr_lnstm.principal_balance			= ldc_prnbal
lstr_lnstm.prncalint_amt				= ldc_prnrcv
lstr_lnstm.calint_from					= ldtm_slipdate
lstr_lnstm.calint_to					= ldtm_cccalint
lstr_lnstm.bfinterest_arrear			= ldc_contintarr
lstr_lnstm.bfinterest_return			= ldc_contintret
lstr_lnstm.interest_period			= ldc_intretperiod
lstr_lnstm.interest_arrear			= ldc_contintarr
lstr_lnstm.interest_return			= ldc_intretbal
lstr_lnstm.moneytype_code			= ls_moneytype
lstr_lnstm.item_status				= -9
lstr_lnstm.entry_id						= ls_entryid
lstr_lnstm.entry_bycoopid			= ls_contcoopid

this.of_poststm_contract( lstr_lnstm )

return 1
end function

private function integer of_postslip_lnmoneyret (n_ds ads_payoutslip, n_ds ads_payoutslipdet) throws Exception;string ls_memno, ls_memcoopid, ls_slipno, ls_docrcvno, ls_contno, ls_contcoopid, ls_moneytype, ls_lwditemtype
string ls_entryid, ls_coopid
long ll_row, ll_index, ll_count
dec{2}ldc_prnretamt, ldc_intretamt, ldc_intretbal, ldc_prnbal
dec{2}ldc_bfintretbal, ldc_bfprnbal, ldc_bfintarrear
datetime ldtm_entrydate
datetime ldtm_slipdate, ldtm_opedate, ldtm_null
str_poststmloan lstr_lnstm

setnull(ldtm_null)

ls_memno = trim(ads_payoutslip.getitemstring(1, "member_no"))
ls_memcoopid = trim(ads_payoutslip.getitemstring(1, "memcoop_id"))
ls_slipno = trim(ads_payoutslip.getitemstring(1, "payoutslip_no"))
ls_docrcvno = trim(ads_payoutslip.getitemstring(1, "document_no"))
ls_moneytype = trim(ads_payoutslip.getitemstring(1, "moneytype_code"))
ldtm_slipdate = ads_payoutslip.getitemdatetime(1, "slip_date")
ldtm_opedate = ads_payoutslip.getitemdatetime(1, "operate_date")

ls_entryid = ads_payoutslip.getitemstring(1, "entry_id")
ls_coopid = ads_payoutslip.getitemstring(1, "coop_id")
ldtm_entrydate = datetime(today(), now())

ads_payoutslipdet.setfilter("slipitemtype_code = 'LON' and operate_flag = 1")
ads_payoutslipdet.filter()

ll_count = ads_payoutslipdet.rowcount()

if ll_count <= 0 then
	return 0
end if

for ll_index = 1 to ll_count
	ls_contno = trim(ads_payoutslipdet.getitemstring(ll_index, "loancontract_no"))
	ls_contcoopid = trim(ads_payoutslipdet.getitemstring(ll_index, "concoop_id"))
	ldc_prnretamt = ads_payoutslipdet.getitemdecimal(ll_index, "principal_payamt")
	ldc_intretamt = ads_payoutslipdet.getitemdecimal(ll_index, "interest_payamt")
	
	if isnull(ldc_prnretamt) then ldc_prnretamt = 0
	if isnull(ldc_intretamt) then ldc_intretamt = 0
	
	// ดึงข้อมูลสัญญาเงินกู้
	ll_row = ids_infocont.retrieve(ls_contno)
	if ll_row <= 0 then
		ithw_exception.text += "ไม่พบข้อมูล เลขสัญญา #" + ls_contno
		throw ithw_exception
	end if
	
	ldc_bfprnbal = ids_infocont.getitemdecimal(1, "principal_balance")
	ldc_bfintarrear = ids_infocont.getitemdecimal(1, "interest_arrear")
	ldc_bfintretbal = ids_infocont.getitemdecimal(1, "interest_return")
	
	// กำหนดค่าต่าง ๆ
	ls_lwditemtype = string(this.of_getattribsliptype("LRT", "lnstm_itemtype"))
	ldc_prnbal = ldc_bfprnbal + ldc_prnretamt
	ldc_intretbal = ldc_bfintretbal - ldc_intretamt
	
	// ปรับปรุงยอด ด/บ หรือ ต้นคืน
	update lncontmaster
	set principal_balance = :ldc_prnbal,
	interest_return = :ldc_intretbal,
	interest_accum = interest_accum - :ldc_intretamt
	where(loancontract_no = :ls_contno) and
	(coop_id = :ls_contcoopid)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ไม่สามารถปรับปรุงยอดเงินคืนได้ เลขสัญญา #" + ls_contno + "~r~n" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

	// ปรับยอด ด/บ สะสม สมาชิกด้วย
	this.of_postupd_memintaccum(ls_memcoopid, ls_memno, ldtm_opedate, ldc_intretamt * -1)
	
	// บันทึกลง Statement
	lstr_lnstm.loancontract_no = ls_contno
	lstr_lnstm.contcoop_id = ls_contcoopid
	lstr_lnstm.slip_date = ldtm_slipdate
	lstr_lnstm.operate_date = ldtm_opedate
	lstr_lnstm.account_date = ldtm_slipdate
	lstr_lnstm.intaccum_date = ldtm_opedate
	lstr_lnstm.ref_slipno = ls_slipno
	lstr_lnstm.ref_docno = ls_docrcvno
	lstr_lnstm.loanitemtype_code = ls_lwditemtype
	lstr_lnstm.period = 0
	lstr_lnstm.principal_payment = ldc_prnretamt
	lstr_lnstm.interest_payment = ldc_intretamt
	lstr_lnstm.principal_balance = ldc_prnbal
	lstr_lnstm.prncalint_amt = 0
	lstr_lnstm.calint_from = ldtm_null
	lstr_lnstm.calint_to = ldtm_null
	lstr_lnstm.bfinterest_arrear = ldc_bfintarrear
	lstr_lnstm.interest_period = 0
	lstr_lnstm.interest_arrear = ldc_bfintarrear
	lstr_lnstm.moneytype_code = ls_moneytype
	lstr_lnstm.item_status = 1
	lstr_lnstm.entry_id = ls_entryid
	lstr_lnstm.entry_bycoopid = ls_coopid
	
	try
		this.of_poststm_contract(lstr_lnstm)
	catch (Exception lthw_stm)
		throw lthw_stm
	end try
next
	
return 1
end function

private function integer of_postslip_payinintfuture (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string		ls_memno, ls_contno, ls_itemcode, ls_slipno, ls_receiptno, ls_moneytype
integer	li_lawstatus, li_contstatus, li_opeflag, li_lastperiodpay
long		ll_count, ll_index
dec{2}	ldc_prnpay, ldc_intpay, ldc_intperiod, ldc_prncalint
dec{2}	ldc_bfprnbal, ldc_bfintarr, ldc_bfintpayment
dec{2}	ldc_prnbal, ldc_intarrbal, ldc_intpayment
datetime	ldtm_bflastpayment, ldtm_bflastcalint
datetime	ldtm_slipdate, ldtm_opedate, ldtm_calintfrom, ldtm_calintto
datetime	ldtm_lastpayment, ldtm_lastcalint

string		ls_entryid
datetime	ldtm_entrydate
str_poststmloan	lstr_lnstm

ls_slipno				= ads_payinslip.getitemstring( 1, "payinslip_no" )

ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code = 'INF'" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_memno			= ads_payinslip.getitemstring( 1, "member_no" )
ls_receiptno			= ads_payinslip.getitemstring( 1, "document_no" )
ls_moneytype		= ads_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_slipdate		= ads_payinslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate		= ads_payinslip.getitemdatetime( 1, "operate_date" )

ls_entryid			= ads_payinslip.getitemstring( 1, "entry_id" )
ldtm_entrydate		= datetime( today(), now() )

for ll_index = 1 to ll_count
	
	ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
	ls_itemcode			= ads_payinslipdet.getitemstring( ll_index, "stm_itemtype" )
	ldc_intpay			= ads_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
	ldtm_calintfrom		= ads_payinslipdet.getitemdatetime( ll_index, "calint_from" )
	ldtm_calintto		= ads_payinslipdet.getitemdatetime( ll_index, "calint_to" )
	ldc_prncalint		= ads_payinslipdet.getitemdecimal( ll_index, "prncalint_amt" )
	ldc_intperiod		= ads_payinslipdet.getitemdecimal( ll_index, "interest_period" )
	ldc_prnpay			= 0

	// ตรวจสอบ ค่า Null
	if isnull( ldc_intpay ) then ldc_intpay = 0
	
	// ดึงข้อมูลของสัญญา
	select	lncontmaster.principal_balance,
			lncontmaster.lastpayment_date,
			lncontmaster.lastcalint_date,
			lncontmaster.interest_arrear,
			lncontmaster.intpayment_amt,
			lncontmaster.contlaw_status,
			lncontmaster.contract_status
	into	:ldc_bfprnbal,
			:ldtm_bflastpayment, :ldtm_bflastcalint,
			:ldc_bfintarr, :ldc_bfintpayment,
			:li_lawstatus, :li_contstatus
	from	lncontmaster
	where	( lncontmaster.loancontract_no = :ls_contno ) and
				( lncontmaster.coop_id	= :is_coopcontrol)
	using	itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "การชำระดอกเบี้ยรับล่วงหน้า( Contract pay ) ไม่พบเลขที่สัญญาที่ระบุ "+ls_contno+" กรุณาตรวจสอบ"
		throw ithw_exception
	end if
	
	// ให้ค่าเริ่มต้น
	ldc_prnbal			= ldc_bfprnbal
	ldc_intarrbal		= ldc_bfintarr
	ldc_intpayment		= ldc_bfintpayment
	ldtm_lastpayment	= ldtm_bflastpayment
	ldtm_lastcalint		= ldtm_bflastcalint
	
	// -------------- เริ่มกระบวนการ ตรวจเช็ค ตัดยอด ------------------------------
	// ดอกเบี้ยคงเหลือ ลดลง
	ldc_intarrbal	= ldc_bfintarr + ( ldc_intperiod - ldc_intpay )
	
	// ถ้าดอกเบี้ยที่ตั้งค้างติดลบ
	if ldc_intarrbal < 0 then ldc_intarrbal = 0
	
	// วันที่คิดดอกเบี้ยล่าสุด
	if ldtm_bflastcalint < ldtm_calintto then
		ldtm_lastcalint	= ldtm_calintto
	end if
	
	// บันทึกลง Statement
	lstr_lnstm.contcoop_id				= is_coopcontrol
	lstr_lnstm.loancontract_no			= ls_contno
	lstr_lnstm.slip_date				= ldtm_slipdate
	lstr_lnstm.operate_date				= ldtm_opedate
	lstr_lnstm.account_date				= ldtm_slipdate
	lstr_lnstm.intaccum_date			= ldtm_opedate
	lstr_lnstm.ref_slipno				= ls_slipno
	lstr_lnstm.ref_docno				= ls_receiptno
	lstr_lnstm.loanitemtype_code		= ls_itemcode
	lstr_lnstm.period					= li_lastperiodpay
	lstr_lnstm.principal_payment		= ldc_prnpay
	lstr_lnstm.interest_payment			= ldc_intpay
	lstr_lnstm.principal_balance		= ldc_prnbal
	lstr_lnstm.prncalint_amt			= ldc_prncalint
	lstr_lnstm.calint_from				= ldtm_calintfrom
	lstr_lnstm.calint_to				= ldtm_calintto
	lstr_lnstm.bfinterest_arrear		= ldc_bfintarr
	lstr_lnstm.interest_period			= ldc_intperiod
	lstr_lnstm.interest_arrear			= ldc_intarrbal
	lstr_lnstm.moneytype_code			= ls_moneytype
	lstr_lnstm.item_status				= 1
	lstr_lnstm.entry_id					= ls_entryid
	lstr_lnstm.entry_bycoopid			= is_coopid

	try
		this.of_poststm_contract( lstr_lnstm )
	catch ( Exception lthw_stm )
		throw lthw_stm
	end try
	
	// Update ลงสัญญา
	update	lncontmaster
	set			lastpayment_date	= :ldtm_lastpayment,
				intpayment_amt		= intpayment_amt + :ldc_intpay,
				lastcalint_date		= :ldtm_lastcalint,
				interest_arrear		= :ldc_intarrbal,
				interest_accum		= interest_accum + :ldc_intpay,
				contract_status		= :li_contstatus
	where	( loancontract_no	= :ls_contno )and
				(coop_id		= :is_coopcontrol)
	using	itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุงสัญญาสำหรับการชำระดอกเบี้ยรับล่วงหน้าได้ เลขสัญญา #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	// ปรับยอด ด/บ สะสม สมาชิกด้วย
//	this.of_postupd_memintaccum( ls_memno, ldtm_opedate, ldc_intpay )
	
next

return 1
end function

private function integer of_postslip_payinloan (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string ls_contno, ls_loantype, ls_itemcode, ls_slipno, ls_moneytype, ls_trnfromcontno, ls_refdocno, ls_memno
string ls_sliptype, ls_refslipno
integer li_installment, li_bflastperiodpay, li_bfpaymethod
integer li_odflag, li_lawstatus, li_contstatus, li_trnstatus, li_pxaftermthkeep
integer li_lastperiodpay
long ll_count, ll_index
dec{2}ldc_prnpay, ldc_intpay, ldc_intperiod, ldc_prncalint, ldc_intreturn, ldc_prntrnbal, ldc_inttrnbal, ldc_prnreturn
dec{2}ldc_bfprnbal, ldc_lnapvamt, ldc_bfintarr, ldc_bfintarrset, ldc_bfintpayment, ldc_bfintreturn, ldc_bfprnreturn
dec{2}ldc_trnfromprnbal, ldc_trnfromintbal, ldc_intarrpay, ldc_rkeepprn, ldc_rkeepint
dec{2}ldc_wtdbal, ldc_prnbal, ldc_intarrbal, ldc_intarrsetbal, ldc_intpayment
datetime ldtm_bflastpayment, ldtm_bflastcalint
datetime ldtm_slipdate, ldtm_opedate, ldtm_calintfrom, ldtm_calintto
datetime ldtm_lastpayment, ldtm_lastcalint, ldtm_lastaccess, ldtm_refdate, ldtm_opestm, ldtm_null
string ls_entryid
datetime ldtm_entrydate
str_poststmloan lstr_lnstm

setnull(ldtm_null)

ls_slipno = ads_payinslip.getitemstring(1, "payinslip_no")
ls_sliptype = ads_payinslip.GetItemString(1, "sliptype_code")
ls_refslipno = ads_payinslip.GetItemString(1, "ref_slipno")

// กรองแต่รายการหนี้
ads_payinslipdet.setfilter("payinslip_no = '" + ls_slipno + "' and slipitemtype_code in ('LON','INF') and operate_flag = 1")
ads_payinslipdet.filter()

ll_count = ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_memno = ads_payinslip.getitemstring(1, "member_no")
ls_refdocno = ads_payinslip.getitemstring(1, "document_no")
ls_moneytype = ads_payinslip.getitemstring(1, "moneytype_code")
ldtm_slipdate = ads_payinslip.getitemdatetime(1, "slip_date")
ldtm_opedate = ads_payinslip.getitemdatetime(1, "operate_date")
ldtm_refdate = ads_payinslip.getitemdatetime(1, "ref_slipdate")

ls_entryid = ads_payinslip.getitemstring(1, "entry_id")
ldtm_entrydate = datetime(today(), now())

// ถ้าเป็นชำระบางส่วนต้องย้อนวันที่กลับไปเป็นวันที่ใบเสร็จค้างของงวดนั้นๆ
ldtm_opestm = ldtm_opedate

for ll_index = 1 to ll_count
	
	ls_contno = ads_payinslipdet.getitemstring(ll_index, "loancontract_no")
	ls_loantype = ads_payinslipdet.getitemstring(ll_index, "shrlontype_code")
	ls_itemcode = ads_payinslipdet.getitemstring(ll_index, "stm_itemtype")
	li_installment = ads_payinslipdet.getitemnumber(ll_index, "period")
	ldc_prnpay = ads_payinslipdet.getitemdecimal(ll_index, "principal_payamt")
	ldc_intpay = ads_payinslipdet.getitemdecimal(ll_index, "interest_payamt")
	ldtm_calintfrom = ads_payinslipdet.getitemdatetime(ll_index, "calint_from")
	ldtm_calintto = ads_payinslipdet.getitemdatetime(ll_index, "calint_to")
	ldc_intreturn = ads_payinslipdet.getitemdecimal(ll_index, "interest_return")
	ldc_prncalint = ads_payinslipdet.getitemdecimal(ll_index, "prncalint_amt")
	ldc_intperiod = ads_payinslipdet.getitemdecimal(ll_index, "interest_period")
	ldc_bfintarrset = ads_payinslipdet.getitemdecimal(ll_index, "bfintarrset_amt")
	li_bfpaymethod = ads_payinslipdet.getitemnumber(ll_index, "bfpayspec_method")
	li_pxaftermthkeep = ads_payinslipdet.getitemnumber(ll_index, "bfpxaftermthkeep_type")
	
	// ตรวจสอบ ค่า Null
	if isnull(ldc_prnpay) then ldc_prnpay = 0
	if isnull(ldc_intpay) then ldc_intpay = 0
	
	// ดึงข้อมูลของสัญญา
	select principal_balance, loanapprove_amt, withdrawable_amt,
	last_periodpay, lastpayment_date,
	lastcalint_date, lastaccess_date, interest_arrear,
	principal_return, interest_return,
	intpayment_amt, od_flag,
	contlaw_status, contract_status,
	transfer_status, trnfrom_contno,
	trnfrom_prnbal, trnfrom_intbal
	into :ldc_bfprnbal, :ldc_lnapvamt, :ldc_wtdbal,
	:li_bflastperiodpay, :ldtm_bflastpayment,
	:ldtm_bflastcalint, :ldtm_lastaccess, :ldc_bfintarr,
	:ldc_bfprnreturn, :ldc_bfintreturn,
	:ldc_bfintpayment, :li_odflag,
	:li_lawstatus, :li_contstatus,
	:li_trnstatus, :ls_trnfromcontno, :ldc_trnfromprnbal, :ldc_trnfromintbal
	from lncontmaster
	where(lncontmaster.loancontract_no = :ls_contno) and
	(lncontmaster.coop_id = :is_coopcontrol)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "การชำระ( Contract pay ) ไม่พบเลขที่สัญญาที่ระบุ " + ls_contno + " กรุณาตรวจสอบ"
		throw ithw_exception
	end if

	if isnull(ldc_bfprnbal) then ldc_bfprnbal = 0
	if isnull(ldc_lnapvamt) then ldc_lnapvamt = 0
	if isnull(ldc_wtdbal) then ldc_wtdbal = 0
	if isnull(ldc_bfintarr) then ldc_bfintarr = 0
	if isnull(ldc_bfintarrset) then ldc_bfintarrset = 0
	if isnull(ldc_bfprnreturn) then ldc_bfprnreturn = 0
	if isnull(ldc_bfintreturn) then ldc_bfintreturn = 0
	if isnull(ldc_bfintpayment) then ldc_bfintpayment = 0
	if isnull(ldc_trnfromprnbal) then ldc_trnfromprnbal = 0
	if isnull(ldc_trnfromintbal) then ldc_trnfromintbal = 0
	if isnull(ls_trnfromcontno) then ls_trnfromcontno = ""
	
	// ให้ค่าเริ่มต้น
	li_lastperiodpay = li_bflastperiodpay
	ldc_intarrsetbal = ldc_bfintarrset
	ldtm_lastpayment = ldtm_bflastpayment
	ldtm_lastcalint = ldtm_bflastcalint
	
	// -------------- เริ่มกระบวนการ ตรวจเช็ค ตัดยอด ------------------------------
	// ถ้าเป็นสัญญา OD ต้องเพิ่มยอดรอเบิก
	if li_odflag = 1 then
		ldc_wtdbal = ldc_wtdbal + ldc_prnpay
	end if
	
	// พวกที่ตัดยอดหรือเพิ่มยอดได้เลย
	ldc_prnbal = ldc_bfprnbal - ldc_prnpay
	ldc_intarrbal = ldc_bfintarr + (ldc_intperiod - ldc_intpay)
	ldc_intpayment = ldc_bfintpayment + ldc_intpay
	
	// ถ้าดอกเบี้ยที่ตั้งค้างติดลบ
	if ldc_intarrbal < 0 then ldc_intarrbal = 0
	
	// ถ้ามีการขยับงวดชำระ
	if li_installment > li_bflastperiodpay then
		li_lastperiodpay = li_installment
	end if
	
	// ถ้าหมดและไม่มียอดรอเบิกไม่มี ด/บ ค้าง ปิดสัญญาได้เลย
	if ldc_prnbal <= 0 and ldc_wtdbal = 0 and ldc_intarrbal = 0 and li_odflag <> 1 then
		li_contstatus = -1
	end if
	
	// ถ้ามีการตั้งด/บ ค้างเอาไว้( ค้างตอนสิ้นปี/ตั้งค้างตอนดำเนินคดี)
	if ldc_bfintarrset > 0 then
		if ldc_intpay > ldc_bfintarrset then
			ldc_intarrsetbal = 0
		else
			ldc_intarrsetbal = ldc_bfintarrset - ldc_intpay
		end if
	end if
	
	// วันที่คิดดอกเบี้ยล่าสุด
	if ldtm_bflastcalint < ldtm_calintto and li_bfpaymethod = 1 then
		ldtm_lastcalint = ldtm_calintto
	end if
	
	// วันที่ชำระล่าสุด
	if ldtm_opedate > ldtm_lastpayment or isnull(ldtm_lastpayment) or string(ldtm_lastpayment, "yyyymmdd") = "19000101" then
		ldtm_lastpayment = ldtm_opedate
	end if
	
	// วันที่ปรับปรุงล่าสุด
	if ldtm_lastpayment > ldtm_lastaccess then
		ldtm_lastaccess = ldtm_lastpayment
	end if
	
	// บันทึกรายการชำระลง Statement
	lstr_lnstm.loancontract_no = ls_contno
	lstr_lnstm.contcoop_id = is_coopcontrol
	lstr_lnstm.slip_date = ldtm_slipdate
	lstr_lnstm.operate_date = ldtm_opestm
	lstr_lnstm.account_date = ldtm_slipdate
	lstr_lnstm.intaccum_date = ldtm_opedate
	lstr_lnstm.ref_slipno = ls_slipno
	lstr_lnstm.ref_docno = ls_refdocno
	lstr_lnstm.loanitemtype_code = ls_itemcode
	lstr_lnstm.period = li_installment
	lstr_lnstm.principal_payment = ldc_prnpay
	lstr_lnstm.interest_payment = ldc_intpay
	lstr_lnstm.principal_balance = ldc_prnbal
	lstr_lnstm.prncalint_amt = ldc_prncalint
	lstr_lnstm.calint_from = ldtm_calintfrom
	lstr_lnstm.calint_to = ldtm_calintto
	lstr_lnstm.bfinterest_arrear = ldc_bfintarr
	lstr_lnstm.bfinterest_return = ldc_bfintreturn
	lstr_lnstm.interest_period = ldc_intperiod
	lstr_lnstm.interest_arrear = ldc_intarrbal
	lstr_lnstm.interest_return = ldc_intreturn
	lstr_lnstm.moneytype_code = ls_moneytype
	lstr_lnstm.item_status = 1
	lstr_lnstm.entry_id = ls_entryid
	lstr_lnstm.entry_bycoopid = is_coopid

	try
		this.of_poststm_contract(lstr_lnstm)
	catch (Exception lthw_stm)
		throw lthw_stm
	end try
	
	// บันทึกรายการ ด/บ คืนลง Statement
	if ldc_intreturn > 0 then
		lstr_lnstm.loancontract_no = ls_contno
		lstr_lnstm.contcoop_id = is_coopcontrol
		lstr_lnstm.slip_date = ldtm_slipdate
		lstr_lnstm.operate_date = ldtm_opedate
		lstr_lnstm.account_date = ldtm_slipdate
		lstr_lnstm.intaccum_date = ldtm_opedate
		lstr_lnstm.ref_slipno = ls_slipno
		lstr_lnstm.ref_docno = ls_refdocno
		lstr_lnstm.loanitemtype_code = "LRT"
		lstr_lnstm.period = 0
		lstr_lnstm.principal_payment = 0
		lstr_lnstm.interest_payment = ldc_intreturn
		lstr_lnstm.principal_balance = ldc_prnbal
		lstr_lnstm.prncalint_amt = 0
		lstr_lnstm.calint_from = ldtm_null
		lstr_lnstm.calint_to = ldtm_null
		lstr_lnstm.bfinterest_arrear = ldc_intarrbal
		lstr_lnstm.interest_period = 0
		lstr_lnstm.interest_arrear = 0
		lstr_lnstm.moneytype_code = ls_moneytype
		lstr_lnstm.item_status = 1
		lstr_lnstm.entry_id = ls_entryid
		lstr_lnstm.entry_bycoopid = is_coopid
		
		try
			this.of_poststm_contract(lstr_lnstm)
		catch (Exception lex_errret)
			throw lthw_stm
		end try
	end if
	
	// Update ลงสัญญา
	update lncontmaster
	set withdrawable_amt = :ldc_wtdbal,
	principal_balance = :ldc_prnbal,
	last_periodpay = :li_lastperiodpay,
	lastpayment_date = :ldtm_lastpayment,
	lastaccess_date = :ldtm_lastaccess,
	prnpayment_amt = prnpayment_amt + :ldc_prnpay,
	intpayment_amt = :ldc_intpayment,
	lastcalint_date = :ldtm_lastcalint,
	interest_arrear = :ldc_intarrbal,
	intset_arrear = :ldc_intarrsetbal,
	interest_accum = interest_accum + ( :ldc_intpay - :ldc_intreturn) ,
	contract_status = :li_contstatus
	where(loancontract_no = :ls_contno)
	and (coop_id = :is_coopcontrol)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ไม่สามารถปรับปรุงสัญญาสำหรับการชำระได้ เลขสัญญา #" + ls_contno + "~r~n" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	// ปรับยอด ด/บ สะสม สมาชิกด้วย
	update mbmembmaster
	set accum_interest = accum_interest + ( :ldc_intpay - :ldc_intreturn )
	where(member_no = :ls_memno) and
	(coop_id = :is_coopcontrol)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ไม่สามารถปรับปรุง ด/บ สะสมของสมาชิกได้ #" + ls_memno + "~r~n" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
next

return 1
end function

private function integer of_postslip_payinshare (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string ls_itemcode, ls_slipno, ls_docno, ls_moneytype, ls_sharetype, ls_memno, ls_memcoopid, ls_sliptype
string ls_xmlhead, ls_xmlshare, ls_entryid, ls_coopid, ls_refslipno
integer li_period, li_lastperiod
long ll_count, ll_index
dec{2}ldc_sharestk, ldc_shrstkvalue, ldc_shrbuyamt, ldc_bfbalance, ldc_unitshare, ldc_itemamt
datetime ldtm_slipdate, ldtm_opedate, ldtm_entrydate, ldtm_refdate, ldtm_opestm
str_poststmshare lstr_poststm

ls_slipno = ads_payinslip.getitemstring(1, "payinslip_no")
ls_sliptype = ads_payinslip.GetItemString(1, "sliptype_code")

// กรองแต่รายการหุ้น
ads_payinslipdet.setfilter("payinslip_no = '" + ls_slipno + "' and slipitemtype_code = 'SHR' and operate_flag = 1")
ads_payinslipdet.filter()

ll_count = ads_payinslipdet.rowcount()
if (ll_count < 1) then
	return 0
end if

ls_memno = ads_payinslip.getitemstring(1, "member_no")
ls_memcoopid = ads_payinslip.getitemstring(1, "memcoop_id")
ls_sliptype = ads_payinslip.getitemstring(1, "sliptype_code")
ls_docno = ads_payinslip.getitemstring(1, "document_no")
ldtm_slipdate = ads_payinslip.getitemdatetime(1, "slip_date")
ldtm_opedate = ads_payinslip.getitemdatetime(1, "operate_date")
ldtm_refdate = ads_payinslip.getitemdatetime(1, "ref_slipdate")
ls_moneytype = ads_payinslip.getitemstring(1, "moneytype_code")

ls_entryid = ads_payinslip.getitemstring(1, "entry_id")
ls_coopid = ads_payinslip.getitemstring(1, "coop_id")
ls_refslipno = ads_payinslip.GetItemString(1, "ref_slipno")
ldtm_entrydate = datetime(today(), now())

if (isnull(ls_memcoopid)) then
	ithw_exception.text = "ls_memcoopid  เป็นค่าว่าง"
	throw ithw_exception
end if

// ถ้าเป็นชำระบางส่วนต้องย้อนวันที่กลับไปเป็นวันที่ใบเสร็จค้างของงวดนั้นๆ
if ls_sliptype = "PMX" then
	ldtm_opestm = ldtm_refdate
else
	ldtm_opestm = ldtm_opedate
end if

for ll_index = 1 to ll_count
	
	ls_sharetype = ads_payinslipdet.getitemstring(ll_index, "shrlontype_code")
	ls_itemcode = ads_payinslipdet.getitemstring(ll_index, "stm_itemtype")
	li_period = ads_payinslipdet.getitemnumber(ll_index, "period")
	ldc_itemamt = ads_payinslipdet.getitemdecimal(ll_index, "item_payamt")
	ldc_bfbalance = ads_payinslipdet.getitemdecimal(ll_index, "bfshrcont_balamt")

	ldc_shrbuyamt = ldc_itemamt
	if ls_itemcode = "" or isnull(ls_itemcode) then
		ls_itemcode = "SPX"
	end if
	
	if ls_sharetype = "" or isnull(ls_sharetype) then
		ls_sharetype = "01"
	end if
	
	select shsharemaster.sharestk_amt, shsharetype.unitshare_value, shsharemaster.last_period
	into :ldc_sharestk, :ldc_unitshare, :li_lastperiod
	from shsharemaster, shsharetype
	where(shsharemaster.sharetype_code = shsharetype.sharetype_code) and
	(shsharemaster.coop_id = shsharetype.coop_id) and
	(shsharemaster.member_no = :ls_memno) and
	(shsharemaster.coop_id = :ls_memcoopid)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "sql error"
		throw ithw_exception
	end if
	
	if (ldc_unitshare = 0) then
		ithw_exception.text = "สมาชิก #" + ls_memno + " memcoopid" + ls_memcoopid
		throw ithw_exception
	end if
	
	ldc_shrstkvalue = ldc_sharestk * ldc_unitshare
	
	//	if ( ldc_bfbalance <> ldc_shrstkvalue ) then
	//		ithw_exception.text	+= "สมาชิก #" + ls_memno + " มีการเปลี่ยนแปลงข้อมูลระหว่างทำรายการ กรุณาทำรายการซื้อหุ้นใหม่"+ String(ldc_bfbalance) +"----"+String(ldc_shrstkvalue)
	//		throw ithw_exception
	//	end if
	
	// งวดหุ้นถ้าไม่มากกว่า หรือ ไม่ได้ใส่มา ก็ให้เท่ากับงวดปัจจุบัน
	if li_period > li_lastperiod then
		li_lastperiod = li_period
	end if
	
	// ทำให้เป็นจำนวนหุ้น
	ldc_shrbuyamt = ldc_shrbuyamt / ldc_unitshare
	ldc_sharestk = ldc_sharestk + ldc_shrbuyamt
		
	lstr_poststm.member_no = ls_memno
	lstr_poststm.memcoop_id = ls_memcoopid
	lstr_poststm.sharetype_code = ls_sharetype
	lstr_poststm.slip_date = ldtm_slipdate
	lstr_poststm.operate_date = ldtm_opestm
	lstr_poststm.account_date = ldtm_slipdate
	lstr_poststm.sharetime_date = ldtm_opedate
	lstr_poststm.document_no = ls_docno
	lstr_poststm.entry_id = ls_entryid
	lstr_poststm.entry_bycoopid = ls_coopid
	lstr_poststm.moneytype = ls_moneytype
	lstr_poststm.period = li_period
	lstr_poststm.stmitem_code = ls_itemcode
	lstr_poststm.sharepay_amt = ldc_shrbuyamt
	lstr_poststm.sharebal_amt = ldc_sharestk
	lstr_poststm.item_status = 1
	lstr_poststm.ref_slipno = ls_slipno
	
	// ผ่านรายการไปที่ statement หุ้น
	if this.of_poststm_share(lstr_poststm) < 1 then
		ithw_exception.text = "Post share SPX Statement~n" + ithw_exception.text
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
	// Update ทะเบียนหุ้น
	update shsharemaster
	set sharestk_amt = :ldc_sharestk,
		last_period = :li_lastperiod
	where(member_no = :ls_memno)
	and (coop_id = :ls_memcoopid)
	and (sharetype_code = :ls_sharetype)
	using itr_sqlca;
	
	if (itr_sqlca.sqlcode <> 0) then
		ithw_exception.text += "ไม่สามารถปรับปรุงทะเบียนหุ้นได้ ~n" + string(itr_sqlca.sqlcode)+"  " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
	// ถ้าเป็น pmx ต้องไปตัดยอดออกจาก adjust ใน kpmastreceive
	if ls_sliptype = "PMX" then
		update kpmastreceivedet kp
		set adjust_itemamt = nvl(adjust_itemamt, 0)-:ldc_itemamt
		where coop_id = :is_coopcontrol and kpslip_no = :ls_refslipno and keepitemtype_code = 'S01'
		using itr_sqlca;
	end if

next

return 1
end function

private function integer of_initlnrcv_headcalint (ref n_ds ads_payoutslip) throws Exception;string		ls_xmlhead
string		ls_contno, ls_contcoopid, ls_rcvfromreqcont
integer	li_rcvperiod
dec{2}	ldc_prnbalance, ldc_loanrcvamt, ldc_prncalint, ldc_intperiod
datetime	ldtm_lastproc, ldtm_lastcalint, ldtm_calintfrom, ldtm_calintto
datetime	ldtm_rcvdate

// ตรวจสอบว่าต้องคำนวณ ด/บ ค้างหรือไม่
ls_rcvfromreqcont	= ads_payoutslip.getitemstring( 1, "rcvfromreqcont_code" )
li_rcvperiod			= ads_payoutslip.getitemnumber( 1, "rcv_period" )
ldtm_rcvdate		= ads_payoutslip.getitemdatetime( 1, "slip_date" )

// ถ้ารับจากคำขอที่ได้รับอนุมัติหรืองวดที่รับเป็นงวดแรกไม่ต้องคิด ด/บ ค้าง
if ls_rcvfromreqcont = "REQ" or li_rcvperiod <= 1 then
	return 0
end if

// ประกาศ Service Interest
this.of_setsrvlninterest( true )

ls_contno			= ads_payoutslip.getitemstring( 1, "loancontract_no" )
ls_contcoopid		= ads_payoutslip.getitemstring( 1, "coop_id" )
ldc_prnbalance		= ads_payoutslip.getitemdecimal( 1, "bfshrcont_balamt" )
ldc_loanrcvamt		= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldtm_lastproc		= ads_payoutslip.getitemdatetime( 1, "bflastproc_date" )
ldtm_lastcalint		= ads_payoutslip.getitemdatetime( 1, "bflastcalint_date" )

// เบิกเงินกู้ก่อนประมวลผล
if ldtm_rcvdate > ldtm_lastproc then
	ldc_prncalint		= ldc_prnbalance
	ldtm_calintfrom		= ldtm_lastcalint
	ldtm_calintto		= ldtm_rcvdate
elseif ldtm_rcvdate < ldtm_lastproc then
	ldc_prncalint		= ldc_loanrcvamt
	ldtm_calintfrom		= ldtm_rcvdate
	ldtm_calintto		= ldtm_lastproc
end if

ldc_intperiod	= inv_intsrv.of_computeinterest( ls_contno, ls_contcoopid, ldc_prncalint, ldtm_calintfrom, ldtm_calintto )	

if ldc_intperiod <= 0 then
	ldc_intperiod = 0
end if

ads_payoutslip.setitem( 1, "interest_period", ldc_intperiod )
ads_payoutslip.setitem( 1, "prncalint_amt", ldc_prncalint )
ads_payoutslip.setitem( 1, "calint_from", ldtm_calintfrom )
ads_payoutslip.setitem( 1, "calint_to", ldtm_calintto )

return 1
end function

private function integer of_transpayin (ref str_slippayout astr_slip) throws Exception;/***********************************************************
<description>
	สำหรับนำรายการหักชำระเวลามีการจ่ายเงินให้สมาชิกไปสร้างเป็น Slip และผ่านรายการรับชำระเงิน
</description>

<arguments>  
	str_slippayout		Structure รายการ Slip จ่ายเงินกู้
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_sliphead		String			XML รายละเอียดใบจ่ายเงินกู้
		- xml_slipcutlon		String			XML รายการหักชำระหนี้
		- xml_slipcutetc		String			XML รายการหักชำระอื่นๆ
		- entry_id			string			ผู้ทำรายการ
		- coop_id			String			สาขาที่ทำรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะทำการสร้างและบันทึกใบรับชำระ
	และปรับปรุงยอดคงเหลือต่างๆในสัญญา
	
	str_slippayout	lstr_slippayout
	
	try
		// ผ่านรายการ จ่ายเงินกู้
		this.of_postslip_lnrcv( lstr_slippayout.xml_sliphead )
		
		// ทำรายการหักชำระ
		li_chk		= this.of_transpayin( lstr_slippayout )
	catch (Exception lthw_postlnrcv )
		rollback using itr_sqlca ;
		throw lthw_postlnrcv
	end try
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_xmlpayinhead,ls_coopid , ls_tofromaccid , ls_loantype, ls_entryid
string		ls_memno, ls_memcoopid, ls_sliptype, ls_slipcuttype, ls_slipclrno, ls_payoutmoney, ls_moneycode
string		ls_grpcode
integer	li_chk, li_moneystatus
dec{2}	ldc_payoutamt, ldc_clramt, ldc_netamt, ldc_balamt
datetime	ldtm_slipdate, ldtm_opedate, ldtm_entrydate
str_slippayin		lstr_slippayin
n_ds		lds_payoutslip, lds_payinslip

ldtm_entrydate		= datetime( today(), Now() )

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP

lds_payinslip	= create n_ds
lds_payinslip.dataobject	= DWO_PAYINSLIP

// Import หัว slip
lds_payoutslip.reset()
lds_payoutslip.importstring( XML!, astr_slip.xml_sliphead )

ls_coopid			= lds_payoutslip.getitemstring( 1, "coop_id" )
ls_memno			= lds_payoutslip.getitemstring( 1, "member_no" )
ls_memcoopid		= lds_payoutslip.getitemstring( 1, "memcoop_id" )
ls_loantype			= lds_payoutslip.getitemstring( 1, "shrlontype_code" )
ls_sliptype			= lds_payoutslip.getitemstring( 1, "sliptype_code"  )
ls_payoutmoney		= lds_payoutslip.getitemstring( 1, "moneytype_code"  )
ls_tofromaccid		= lds_payoutslip.getitemstring( 1, "tofrom_accid"  )
ls_grpcode			= lds_payoutslip.GetItemString( 1, "membgroup_code" )

ls_entryid			= lds_payoutslip.GetItemString( 1, "entry_id" )
ldc_payoutamt		= lds_payoutslip.getitemdecimal( 1, "payout_amt"  )
ldc_clramt			= lds_payoutslip.getitemdecimal( 1, "payoutclr_amt"  )
ldc_balamt			= lds_payoutslip.getitemdecimal( 1, "bfshrcont_balamt" )
ldtm_slipdate		= lds_payoutslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate		= lds_payoutslip.getitemdatetime( 1, "operate_date" )

choose case ls_sliptype
	case "LWD"
		ls_slipcuttype	= "CLC"
		
	case "SWD", "SWP"
		ls_slipcuttype	= "TSL"
		
end choose

// ใส่รายละเอียด Slip ใน Header PayIn
long	ll_row
ll_row		= lds_payinslip.insertrow( 0 )
lds_payinslip.setitem( ll_row, "coop_id", is_coopcontrol )
lds_payinslip.setitem( ll_row, "memcoop_id", is_coopcontrol )
lds_payinslip.setitem( ll_row, "member_no", ls_memno )
lds_payinslip.setitem( ll_row, "membgroup_code", ls_grpcode )
lds_payinslip.setitem( ll_row, "sliptype_code", ls_slipcuttype )
lds_payinslip.setitem( ll_row, "slip_date", ldtm_slipdate )
lds_payinslip.setitem( ll_row, "operate_date", ldtm_slipdate )
lds_payinslip.setitem( ll_row, "slip_status", 1 )
lds_payinslip.setitem( ll_row, "entry_id", ls_entryid )
lds_payinslip.setitem( ll_row, "entry_bycoopid", is_coopid )
lds_payinslip.setitem( ll_row, "entry_date", ldtm_entrydate )

dec	ldc_shrstkvalue, ldc_shrbgvalue, ldc_intaccum

// ใส่รายละเอียดพวกทุนเรือนหุ้น
select	sh.sharestk_amt * st.unitshare_value, sh.sharebegin_amt * st.unitshare_value, mb.accum_interest
into	:ldc_shrstkvalue, :ldc_shrbgvalue, :ldc_intaccum
from	mbmembmaster mb 
		join shsharemaster sh on mb.coop_id = sh.coop_id and mb.member_no = sh.member_no
		join shsharetype st on sh.coop_id = st.coop_id and sh.sharetype_code = st.sharetype_code
where 	( mb.coop_id		= :is_coopcontrol )
and		( mb.member_no	= :ls_memno )
using itr_sqlca ;

lds_payinslip.setitem( ll_row, "sharestkbf_value", ldc_shrbgvalue )
lds_payinslip.setitem( ll_row, "sharestk_value", ldc_shrstkvalue )
lds_payinslip.setitem( ll_row, "intaccum_amt", ldc_intaccum )

// PEA ขอมาว่าถ้าฝั่งจ่ายเป็นประเภทเงินอะไรก็ให้ฝั่งหักกลบเป็นประเภทเงินนั้นๆ
ls_moneycode	= ls_payoutmoney

if ls_payoutmoney <> "CSH" then
	ls_tofromaccid	= ""
end if

lds_payinslip.setitem( 1, "moneytype_code", ls_moneycode )
lds_payinslip.setitem( 1, "tofrom_accid", ls_tofromaccid )

ls_xmlpayinhead	= inv_dwxmliesrv.of_xmlexport( lds_payinslip )

lstr_slippayin.xml_sliphead		= ls_xmlpayinhead
lstr_slippayin.xml_sliplon		= astr_slip.xml_slipcutlon
lstr_slippayin.xml_slipetc		= astr_slip.xml_slipcutetc
lstr_slippayin.entry_id			= astr_slip.entry_id
lstr_slippayin.coop_id			= astr_slip.coop_id
lstr_slippayin.memcoop_id		= astr_slip.memcoop_id
lstr_slippayin.receiptno_flag	= astr_slip.receiptno_flag

li_chk		= this.of_saveslip_payin( lstr_slippayin )

if li_chk = 0 then
	return 0
end if

// Import Slip Pay In สำหรับ Set ค่าที่เกี่ยวข้องกับการหักชำระกลับไปที่ตัวจ่าย
lds_payinslip.reset()
lds_payinslip.importstring( XML!, lstr_slippayin.xml_sliphead )

// ดึงข้อมูลเกี่ยวกับการหักชำระ
ls_slipclrno	= lds_payinslip.getitemstring( 1, "payinslip_no" )
ldc_clramt		= lds_payinslip.getitemdecimal( 1, "slip_amt" )
ldc_netamt		= ldc_payoutamt - ldc_clramt

// Set ค่าที่เกี่ยวข้องกับการหักชำระกลับไปที่ตัวจ่าย
lds_payoutslip.setitem( 1, "slipclear_no", ls_slipclrno )
lds_payoutslip.setitem( 1, "payoutclr_amt", ldc_clramt )
lds_payoutslip.setitem( 1, "payoutnet_amt", ldc_netamt )

// ปรับปรุงข้อมูลการจ่ายกลับไป
astr_slip.xml_sliphead		= string( lds_payoutslip.describe( "Datawindow.data.XML" ) )
astr_slip.payinslip_no			= ls_slipclrno

return 1
end function

public function integer of_setintreturn (ref string as_xmlloan, datetime adtm_opedate) throws Exception;boolean lb_error = false
n_ds lds_payinslipdet

lds_payinslipdet = create n_ds
lds_payinslipdet.dataobject = DWO_PAYINSLIPDET

inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, as_xmlloan)

try
	this.of_setintreturn( lds_payinslipdet, adtm_opedate )
catch( Exception lex_errret )
	ithw_exception.Text = lex_errret.Text
	lb_error = true
end try

if lb_error then
	goto objdestroy
end if

as_xmlloan = inv_dwxmliesrv.of_xmlexport(lds_payinslipdet)

objdestroy:
destroy lds_payinslipdet

if lb_error then
	throw ithw_exception
end if

return 1
end function

public function integer of_initshrwtd_recalint (ref str_slippayout astr_slip) throws Exception;/***********************************************************
<description>
	เมื่อมีการเปลี่ยนวันที่ที่ทำรายการจ่ายเงินกู้ จะต้องมีการ
	คำนวณ ด/บ ในส่วนที่เกี่ยวข้องใหม่ทั้งหมดอีกครั้ง
</description>

<arguments>  
	str_slippayout		Structure รายการ Slip จ่าย
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_sliphead			String		XML ส่วนรายละเอียดสัญญาเงินกู้ที่จะจ่าย
		- xml_slipcutlon			String		XML ส่วนของการหักชำระหนี้เก่า
		- xml_slipcutetc			String		XML ส่วนของการหักชำระอื่นๆ(หุ้น,ด/บ รับล่วงหน้า)
</arguments> 

<return> 
	1		Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่ง XML ของ รายการสัญญาที่จ่าย, รายการหักกลบสัญญาเก่า, รายการหักอื่นๆ
	ผ่าน Structure str_slippayout เข้ามา ฟังก์ชั่นจะคำนวณ ด/บค้าง ด/บหักกลบ ด/บ รับล่วงหน้าให้ใหม่อีกครั้ง
	แล้วส่งกลับไป
	
	str_slippayout		lstr_slippayout
	
	// รายการจ่ายเงินกู้
	lstr_slippayout.xml_sliphead			= string( dw_lnrcv.describe( "Datawindow.data.XML" ) )
	
	// รายการหักกลบหนี้เก่า
	if dw_clrloan.rowcount() > 0 then
		lstr_slippayout.xml_slipcutlon	= string( dw_clrloan.describe( "Datawindow.data.XML" ) )
	else
		lstr_slippayout.xml_slipcutlon	= ""
	end if
	
	// รายการหักชำระอื่นๆ
	if dw_clrother.rowcount() > 0 then
		lstr_slippayout.xml_slipcutetc	= string( dw_clrother.describe( "Datawindow.data.XML" ) )
	else
		lstr_slippayout.xml_slipcutetc	= ""
	end if
	
	// Call function
	lnv_lnoperate.of_initlnrcv_recalint( lstr_slippayout )

	// นำตัวแปรที่ได้กลับมามา Import ทับของเดิม
	dw_lnrcv.reset()
	dw_lnrcv.importstring( XML!, lstr_slippayout.xml_sliphead )
	
	dw_clrloan.reset()
	dw_clrloan.importstring( XML!, lstr_slippayout.xml_slipcutlon )
	
	dw_clrother.reset()
	dw_clrother.importstring( XML!, lstr_slippayout.xml_slipcutetc )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_xmlhead, ls_xmlloan, ls_xmlother
long		ll_count
dec{2}	ldc_payoutamt, ldc_payoutclr, ldc_payoutnet
datetime	ldtm_rcvdate
n_ds		lds_payoutslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET

ls_xmlhead		= astr_slip.xml_sliphead
ls_xmlloan		= astr_slip.xml_slipcutlon
ls_xmlother		= astr_slip.xml_slipcutetc

// นำเข้า Slip ถอนหุ้น
lds_payoutslip.reset()
inv_dwxmliesrv.of_xmlimport( lds_payoutslip, ls_xmlhead )

ldc_payoutamt	= lds_payoutslip.getitemdecimal( 1, "payout_amt" )
ldtm_rcvdate	= lds_payoutslip.getitemdatetime( 1, "operate_date" )

// Import รายการหักชำระ
lds_payinslipdet.reset()
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, ls_xmlloan )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, ls_xmlother )

// ถ้ามีการหักชำระหนี้เงินกู้เก่า ส่งไปคำนวณใหม่
this.of_initslippayin_calint( lds_payinslipdet, "TSL", ldtm_rcvdate )

// ส่งไป init รายการใหม่
this.of_initshrwtd_initclear( lds_payinslipdet, ldc_payoutamt )

// คำนวณยอดหักชำระใหม่
ll_count	= lds_payinslipdet.rowcount()
if ll_count > 0 then
	ldc_payoutclr	= dec( lds_payinslipdet.describe( "evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', "+string( ll_count )+" )" ) )
else
	ldc_payoutclr	= 0
end if

ldc_payoutnet	= ldc_payoutamt - ldc_payoutclr

lds_payoutslip.setitem( 1, "payoutclr_amt", ldc_payoutclr )
lds_payoutslip.setitem( 1, "payoutnet_amt", ldc_payoutnet )

// Export ข้อมูลอีกครั้งเพื่อให้ได้ค่าสุดท้าย
astr_slip.xml_slipcutlon	= ""
astr_slip.xml_slipcutetc	= ""

// หัว Slip
astr_slip.xml_sliphead	= inv_dwxmliesrv.of_xmlexport( lds_payoutslip )

// รายการหักกลบหนี้
lds_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
lds_payinslipdet.filter()
if lds_payinslipdet.rowcount() > 0 then
	astr_slip.xml_slipcutlon	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )
end if

// รายการหักอื่นๆ
lds_payinslipdet.setfilter( "slipitemtype_code <> 'LON'" )
lds_payinslipdet.filter()
if lds_payinslipdet.rowcount() > 0 then
	astr_slip.xml_slipcutetc	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )
end if

return 1
end function

public function integer of_initslippayin_initclear (ref string as_xmlloan, ref string as_xmletc, decimal adc_allpayamt) throws Exception;string		ls_loantype
long		ll_count, ll_index, ll_find
integer	li_clrseqno
dec{2}	ldc_intperiod, ldc_intarrear, ldc_intarrset, ldc_prnbal
dec{2}	ldc_rkeepprn, ldc_rkeepint, ldc_prnpay, ldc_intpay
n_ds		lds_payinslipdet

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

// นำเข้าข้อมูล
lds_payinslipdet.reset()
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, as_xmletc )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, as_xmlloan )

// คัดแต่พวกทำรายการ
lds_payinslipdet.setfilter( "operate_flag = 1" )
lds_payinslipdet.filter()

ll_count	= lds_payinslipdet.rowcount()
if ll_count = 0 then
	ithw_exception.text	= "กรุณาเลือกรายการที่ต้องการชำระด้วย"
	throw ithw_exception
end if

// ตรวจว่ามีการคิด ด/บ ที่คิดจากยอดชำระหรือเปล่า
ll_find	= lds_payinslipdet.find( "bfpayspec_method = 2", 1, ll_count )
if ll_find > 0 then
	ithw_exception.text	= "มีรายการหนี้ที่คิด ด/บ จากยอดชำระ โปรแกรมไม่สามารถกระจายยอดเงินเพื่อตัดชำระได้"
	throw ithw_exception
end if

// ล้างข้อมูลชำระทั้งหมดและให้ลำดับที่การตัดยอด ฝากลำดับไว้ที่ operate_flag
for ll_index = 1 to ll_count
	ls_loantype		= lds_payinslipdet.getitemstring( ll_index, "shrlontype_code" )
	ldc_prnbal		= lds_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	
	select		pxclear_seqno
	into		:li_clrseqno
	from		lnloantype
	where	( loantype_code = :ls_loantype )
	using		itr_sqlca ;
	
	li_clrseqno	= li_clrseqno + 100
	
	lds_payinslipdet.setitem( ll_index, "operate_flag", li_clrseqno )
	lds_payinslipdet.setitem( ll_index, "principal_payamt", 0 )
	lds_payinslipdet.setitem( ll_index, "interest_payamt", 0 )
	lds_payinslipdet.setitem( ll_index, "item_payamt", 0 )
	lds_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal )
next

// Clear รายการอื่นๆก่อน
lds_payinslipdet.setfilter( "slipitemtype_code <> 'LON' and operate_flag > 0 and bfshrcont_balamt > 0" )
lds_payinslipdet.filter()

ll_count	= lds_payinslipdet.rowcount()
for ll_index = 1 to ll_count
	if adc_allpayamt = 0 then
		exit
	end if
	
	ldc_prnbal		= lds_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	
	if isnull( ldc_prnbal ) then ldc_prnbal = 0
	
	if ldc_prnbal > adc_allpayamt then
		ldc_prnpay	= adc_allpayamt
	else
		ldc_prnpay	= ldc_prnbal
	end if
	
	adc_allpayamt	= adc_allpayamt - ldc_prnpay
	
	lds_payinslipdet.setitem( ll_index, "item_payamt", ldc_prnpay )
	lds_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal - ldc_prnpay )
next

// Clear รายการหนี้
lds_payinslipdet.setfilter( "slipitemtype_code = 'LON' and operate_flag > 0" )
lds_payinslipdet.filter()

lds_payinslipdet.setsort( "operate_flag ase" )
lds_payinslipdet.sort()

ll_count	= lds_payinslipdet.rowcount()

// ด/บ ก่อนเลย
for ll_index = 1 to ll_count
	if adc_allpayamt = 0 then
		exit
	end if
	
	ldc_prnbal		= lds_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	ldc_intperiod	= lds_payinslipdet.getitemdecimal( ll_index, "interest_period" )
	ldc_intarrear	= lds_payinslipdet.getitemdecimal( ll_index, "bfintarr_amt" )
	
	if isnull( ldc_intperiod ) then ldc_intperiod = 0
	if isnull( ldc_intarrear ) then ldc_intarrear = 0
	
	ldc_intpay	= ldc_intperiod + ldc_intarrear
	
	// ถ้ายอด ด/บ ไม่มีข้ามไปทำสัญญาถัดไป
	if ldc_intpay = 0 then
		continue
	end if
	
	if ldc_intpay > adc_allpayamt then
		ldc_intpay	= adc_allpayamt
	end if
	
	adc_allpayamt	= adc_allpayamt - ldc_intpay
	
	lds_payinslipdet.setitem( ll_index, "interest_payamt", ldc_intpay )
	lds_payinslipdet.setitem( ll_index, "item_payamt", ldc_intpay )
	lds_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal )
next

// ต้นเงิน ตามมา
for ll_index = 1 to ll_count
	if adc_allpayamt = 0 then
		exit
	end if
	
	ldc_prnbal		= lds_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	ldc_intpay		= lds_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
	
	if isnull( ldc_prnbal ) then ldc_prnbal = 0
	
	if ldc_prnbal > adc_allpayamt then
		ldc_prnpay	= adc_allpayamt
	else
		ldc_prnpay	= ldc_prnbal
	end if
	
	adc_allpayamt	= adc_allpayamt - ldc_prnpay
	
	lds_payinslipdet.setitem( ll_index, "principal_payamt", ldc_prnpay )
	lds_payinslipdet.setitem( ll_index, "item_payamt", ldc_prnpay+ldc_intpay )
	lds_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal - ldc_prnpay )
next

// ถ้ายอดเงินที่รับมายังเหลือ
if adc_allpayamt > 0 then
	ll_find		= lds_payinslipdet.find( "slipitemtype_code = 'MOV'", 1, lds_payinslipdet.rowcount() )
	
	if ll_find > 0 then
		lds_payinslipdet.setitem( ll_find, "operate_flag", 1 )
		lds_payinslipdet.setitem( ll_find, "item_payamt", adc_allpayamt )
	else
		ll_find		= lds_payinslipdet.insertrow( 0 )
		
		lds_payinslipdet.setitem( ll_find, "operate_flag", 1 )
		lds_payinslipdet.setitem( ll_find, "seq_no", ll_find )
		lds_payinslipdet.setitem( ll_find, "slipitemtype_code", "MOV" )
		lds_payinslipdet.setitem( ll_find, "slipitem_desc", "เงินรับชำระเกิน" )
		lds_payinslipdet.setitem( ll_find, "item_payamt", adc_allpayamt )
	end if
end if

// คืนค่า operate_flag ที่หยิบมาใช้ชั่วคราวกลับไป
lds_payinslipdet.setfilter( "operate_flag > 0" )
lds_payinslipdet.filter()

ll_count		= lds_payinslipdet.rowcount()
for ll_index = 1 to ll_count
	lds_payinslipdet.setitem( ll_index, "operate_flag", 1 )
next

// Export รายการหนี้กลับไป
lds_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
lds_payinslipdet.filter()
lds_payinslipdet.setsort( "seq_no asc" );lds_payinslipdet.sort()

as_xmlloan	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

// Export รายการอื่นๆกลับไป
lds_payinslipdet.setfilter( "slipitemtype_code <> 'LON'" )
lds_payinslipdet.filter()
lds_payinslipdet.setsort( "seq_no asc" );lds_payinslipdet.sort()

as_xmletc	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )


return 1
end function

private function integer of_setabsmoneyretdet (ref n_ds ads_payoutslipdet);string		ls_slipitemcode
long		ll_index, ll_count
dec{2}	ldc_bfshrcontbal, ldc_prnpay, ldc_intpay

ll_count		= ads_payoutslipdet.rowcount()

// ใส่ข้อมูลการชำระให้ครบถ้วน
for ll_index = 1 to ll_count
	ls_slipitemcode		= ads_payoutslipdet.getitemstring( ll_index, "slipitemtype_code" )
	
	choose case ls_slipitemcode
		case "LON"
			ldc_prnpay	= ads_payoutslipdet.getitemdecimal( ll_index, "principal_payamt" )
			ldc_intpay	= ads_payoutslipdet.getitemdecimal( ll_index, "interest_payamt" )
			
			if isnull( ldc_prnpay ) then ldc_prnpay	 = 0
			if isnull( ldc_intpay ) then ldc_intpay = 0
			
			ads_payoutslipdet.setitem( ll_index, "item_payamt", ldc_prnpay + ldc_intpay )
	end choose
next

return 1
end function

public function integer of_initshrwtd_initclear (ref string as_xmlloan, ref string as_xmletc, ref decimal adc_shrstkvalue) throws Exception;n_ds		lds_payinslipdet

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET

// นำเข้าข้อมูล
lds_payinslipdet.reset()
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, as_xmletc )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, as_xmlloan )

this.of_initshrwtd_initclear( lds_payinslipdet, adc_shrstkvalue )

// Clear รายการหนี้
lds_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
lds_payinslipdet.filter()

lds_payinslipdet.setsort( "seq_no a" )
lds_payinslipdet.sort()

as_xmlloan	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

// Clear รายการอื่นๆก่อน
lds_payinslipdet.setfilter( "slipitemtype_code <> 'LON'" )
lds_payinslipdet.filter()

as_xmletc	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

destroy lds_payinslipdet

return 1
end function

private function integer of_setabspayindet (ref n_ds ads_payinslipdet) throws Exception;string		ls_slipitemcode
long		ll_index, ll_count
dec{2}	ldc_bfshrcontbal, ldc_prnpay, ldc_intpay, ldc_intarrpay, ldc_bfintsetarr

ll_count		= ads_payinslipdet.rowcount()

// ใส่ข้อมูลการชำระให้ครบถ้วน
for ll_index = 1 to ll_count
	ls_slipitemcode		= ads_payinslipdet.getitemstring( ll_index, "slipitemtype_code" )
	ldc_bfshrcontbal	= ads_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	
	if isnull( ldc_bfshrcontbal ) then ldc_bfshrcontbal = 0
	
	choose case ls_slipitemcode
		case "LON", "INF"
			ldc_prnpay		= ads_payinslipdet.getitemdecimal( ll_index, "principal_payamt" )
			ldc_intpay		= ads_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
			ldc_bfintsetarr	= ads_payinslipdet.getitemdecimal( ll_index, "bfintarrset_amt" )
			
			if isnull( ldc_prnpay ) then ldc_prnpay	 = 0
			if isnull( ldc_intpay ) then ldc_intpay = 0
			if isnull( ldc_bfintsetarr ) then ldc_bfintsetarr = 0
			
			if ldc_prnpay > ldc_bfshrcontbal then
				ithw_exception.text	= "ไม่อนุญาติให้ยอดชำระเงินต้นมากกว่ายอดเงินคงเหลือ กรุณาตรวจสอบ"
				throw ithw_exception
			end if
			
			if ldc_bfintsetarr > 0 then
				if ldc_intpay >= ldc_bfintsetarr then
					ldc_intarrpay	= ldc_bfintsetarr
				else
					ldc_intarrpay	= ldc_intpay
				end if
			else
				ldc_intarrpay	= 0
			end if
			
			ads_payinslipdet.setitem( ll_index, "intarrear_payamt", ldc_intarrpay )
			ads_payinslipdet.setitem( ll_index, "item_payamt", ldc_prnpay + ldc_intpay )
			ads_payinslipdet.setitem( ll_index, "item_balance", ldc_bfshrcontbal - ldc_prnpay )
		case "MAV"
			ldc_prnpay	= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
			
			ads_payinslipdet.setitem( ll_index, "item_balance", ldc_bfshrcontbal + ldc_prnpay )
		case "IAR"
			ldc_intpay	= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
			
			ads_payinslipdet.setitem( ll_index, "interest_payamt", ldc_intpay )
			ads_payinslipdet.setitem( ll_index, "item_balance", ldc_bfshrcontbal + ldc_prnpay )
		case "SHR"
			ldc_prnpay	= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
			
			if isnull( ldc_prnpay ) then ldc_prnpay	 = 0
			
			if mod( ldc_prnpay, 10 ) > 0 then
				ithw_exception.text	= "หุ้นที่ซื้อเพิ่ม ซื้อไม่เต็มจำนวนหุ้น(มีเศษ) กรุณาตรวจสอบ"
				throw ithw_exception
			end if
			
			ads_payinslipdet.setitem( ll_index, "item_balance", ldc_bfshrcontbal + ldc_prnpay )
	end choose
next

return 1
end function

public function string of_gennewcontractno (string as_coopid, string as_loantype) throws Exception;/***********************************************************
<description>
	สำหรับขอเลขที่สัญญาใหม่ของเงินกู้แต่ละประเภทที่ส่งเข้ามา
</description>

<arguments>  
	as_loantype		String		ประเภทเงินกู้ที่ขอเลขที่สัญญาใหม่
</arguments> 

<return> 
	String			เลขที่สัญญาใหม่ที่ระบบสร้างให้
	Exception	ถ้ามีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งประเภทเงินกู้ที่จะออกเลขสัญญาใหม่เข้ามา
	ระบบจะทำการสร้างเลขสัญญาให้แล้ว Return ค่ากลับไป
	
	string		ls_loantype, ls_newcontno
	
	ls_loantype		= dw_example.getitemstring( 1, "loantype_code" )
	
	ls_newcontno	= lnv_lnoperate.of_gennewcontractno( ls_loantype )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_contno, ls_prefix, ls_doccode

// ดึงค่าเลขเอกสารจาก config
select		prefix, document_code
into		:ls_prefix, :ls_doccode
from		lnloantype
where	( loantype_code	= :as_loantype ) and
			( coop_id				= :is_coopcontrol )
using		itr_sqlca ;

if ls_doccode = "" or isnull( ls_doccode ) then
	ithw_exception.text	= "เงินกู้ประเภทนี้ไม่มีเลขที่เอกสารสำหรับออกเลขสัญญา กรุณาไปกำหนดด้วย"
	throw ithw_exception
end if

this.of_setsrvdoccontrol( true )

ls_contno	= inv_docsrv.of_getnewdocno( as_coopid, ls_doccode, ls_prefix )

this.of_setsrvdoccontrol( false )

return ls_contno
end function

private function string of_initslippayin_loan (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายละเอียดสัญญาเงินกู้ที่มีอยู่เพื่อเตรียมสำหรับการรับชำระ
</description>

<arguments>  
	- as_memno			String			ทะเบียนสมาชิก
	- as_sliptype			String			ประเภทการชำระ(PX, CLC, etc.)
	- adtm_opedate		datetime		วันที่รับชำระ
</arguments> 

<return> 
	string
	- XML รายการหนี้ที่มีอยู่พร้อมทั้งคิด ด/บ ไว้ให้แล้ว
</return> 

<usage> 
	ฟังก์ชั่นจะ Generate รายการเงินกู้ที่มีอยู่ให้ตาม Argument ที่ส่งมา
	
	string		ls_memno, ls_sliptype, ls_xmlloan
	datetime	ldtm_operate
	
	ls_memno		= dw_main.getitemstring( 1, "member_no" )
	ls_sliptype		= dw_main.getitemstring( 1, "sliptype_code" )
	ldtm_operate	= dw_main.getitemdatetime( 1, "operate_date" )
	
	ls_xmlloan		= lnv_lnoperate.of_initslippayin_loan( ls_memno, ls_sliptype, ldtm_operate )
	
	dw_loan.reset()
	dw_loan.importstring( XML!, ls_xmlloan )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_contno, ls_itemcode, ls_desc, ls_xmlloan
long		ll_count, ll_index, ll_row, ll_cont
integer	li_payspecmethod, li_paystatus, li_year, li_month, li_intreturnflag
dec{2}	ldc_prnbal, ldc_intarrear, ldc_receiveatm = 0, ldc_payamtatm = 0 ,ldc_intreturn = 0
datetime	ldtm_process, ldtm_lastcalint
n_ds		lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

// init slip loan
ids_infomemcont.retrieve( is_coopcontrol, as_memno )

lds_payinslipdet.reset()

// กำหนดค่าต่าง ๆ
ls_itemcode	= string( this.of_getattribsliptype( as_sliptype, "lnstm_itemtype" ) )
ls_desc		= string( this.of_getattribsliptype( as_sliptype, "lnpay_desc" ) )

ll_count	= ids_infomemcont.rowcount()

if ll_count = 0 then
	return ""
end if

// เรียงสัญญา
if as_sliptype = "TSL" then
	ids_infomemcont.setsort( "tslclear_seqno a, loantype_code a, loancontract_no a" )
else
	ids_infomemcont.setsort( "loantype_code a, loancontract_no a" )
end if

ids_infomemcont.sort()

this.of_setsrvcalendar( false )

for ll_index = 1 to ll_count
	ls_contno		= ids_infomemcont.object.loancontract_no[ ll_index ]
	
	// รายละเอียดสัญญาเงินกู้
	ll_cont				= ids_infocont.retrieve( is_coopcontrol, ls_contno )
	
	li_paystatus			= ids_infocont.getitemnumber( ll_cont, "payment_status" )
	li_payspecmethod	= ids_infocont.getitemnumber( ll_cont, "payspec_method" )
	li_intreturnflag		= ids_infocont.getitemnumber( ll_cont, "intreturn_flag" )
	ldc_prnbal			= ids_infocont.getitemdecimal( ll_cont, "principal_balance" )
	ldc_intarrear		= ids_infocont.getitemdecimal( ll_cont, "interest_arrear" )
	ldtm_lastcalint		= ids_infocont.getitemdatetime( ll_cont, "lastcalint_date" )
	ldtm_process		= ids_infocont.getitemdatetime( ll_cont, "lastprocess_date" )
	ldc_intreturn    	 = ids_infocont.getitemdecimal( ll_cont, "interest_return" ) //nungs เพิ่มการ init ดอกเบี้ยคืนให้หน้าจอ
    if isnull(ldc_intreturn) or    ldc_intreturn < 0 then ldc_intreturn = 0
	 
	// ถ้าเป็นพวกสัญญารอเบิกให้ข้ามไป
	if ldc_prnbal <= 0 and ldc_intarrear <= 0 then continue
	
	//wa กด atm
	
	try
		select receive_amt, pay_amt
		into :ldc_receiveatm, :ldc_payamtatm
		from atmloan
		where loancontract_no = :ls_contno   and  coop_id = :is_coopcontrol ;
	catch(  Exception lthw_err )
		ldc_receiveatm = 0
	end try
	if isnull( ldc_receiveatm ) then ldc_receiveatm = 0
	if isnull( ldc_payamtatm ) then ldc_payamtatm = 0
	ldc_prnbal = ldc_prnbal + ldc_receiveatm - ldc_payamtatm
	
	// ถ้าไม่ใช่การรับชำระพิเศษประเภทการคิด ด/บ จะต้องเป็นจากยอดคงเหลือเสมอ
	if as_sliptype <> "PX" or li_paystatus  <  0  then
		li_payspecmethod	= 1
	end if

	ll_row	= lds_payinslipdet.insertrow( 0 )
	
	lds_payinslipdet.object.shrlontype_code[ ll_row ]			= ids_infocont.object.loantype_code[ ll_cont ]

	lds_payinslipdet.object.rkeep_principal[ ll_row ]			= ids_infocont.object.rkeep_principal[ ll_cont ]
	lds_payinslipdet.object.rkeep_interest[ ll_row ]				= ids_infocont.object.rkeep_interest[ ll_cont ]
	lds_payinslipdet.object.nkeep_interest[ ll_row ]			= ids_infocont.object.nkeep_interest[ ll_cont ]
	
	lds_payinslipdet.object.period[ ll_row ]						= ids_infocont.object.last_periodpay[ ll_cont ]
	lds_payinslipdet.object.calint_from[ ll_row ]					= ids_infocont.object.lastcalint_date[ ll_cont ]
	lds_payinslipdet.object.bfperiod[ ll_row ]						= ids_infocont.object.last_periodpay[ ll_cont ]
	lds_payinslipdet.object.bfintarr_amt[ ll_row ]				= ids_infocont.object.interest_arrear[ ll_cont ]
	lds_payinslipdet.object.bfintarrset_amt[ ll_row ]			= ids_infocont.object.intset_arrear[ ll_cont ]
	
	lds_payinslipdet.object.bfwithdraw_amt[ ll_row ]			= ids_infocont.object.withdrawable_amt[ ll_cont ]

	lds_payinslipdet.object.bfperiod_payment[ ll_row ]		= ids_infocont.object.period_payment[ ll_cont ]
	lds_payinslipdet.object.bfshrcont_status[ ll_row ]			= ids_infocont.object.contract_status[ ll_cont ]
	lds_payinslipdet.object.bfcontlaw_status[ ll_row ]			= ids_infocont.object.contlaw_status[ ll_cont ]
	lds_payinslipdet.object.bflastcalint_date[ ll_row ]			= ids_infocont.object.lastcalint_date[ ll_cont ]
	lds_payinslipdet.object.bflastproc_date[ ll_row ]			= ids_infocont.object.lastprocess_date[ ll_cont ]
	lds_payinslipdet.object.bfcountpay_flag[ ll_row ]			= ids_infocont.object.countpay_flag[ ll_cont ]
	lds_payinslipdet.object.bfpxaftermthkeep_type[ ll_row ]	= ids_infocont.object.pxaftermthkeep_type[ ll_cont ]
	
	lds_payinslipdet.setitem( ll_row, "operate_flag", 0 )
	lds_payinslipdet.setitem( ll_row, "seq_no", ll_row )
	lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "LON" )
	lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_desc )
	lds_payinslipdet.setitem( ll_row, "loancontract_no", ls_contno )
	lds_payinslipdet.setitem( ll_row, "concoop_id", is_coopcontrol )
	
	lds_payinslipdet.setitem( ll_row, "principal_payamt", 0 )
	lds_payinslipdet.setitem( ll_row, "interest_payamt", 0 )
	lds_payinslipdet.setitem( ll_row, "item_payamt", 0 )
	lds_payinslipdet.setitem( ll_row, "item_balance", ldc_prnbal )
	
	lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_prnbal )
	lds_payinslipdet.setitem( ll_row, "stm_itemtype", ls_itemcode )

	lds_payinslipdet.setitem( ll_row, "bfpayspec_method", li_payspecmethod )
	lds_payinslipdet.setitem( ll_row, "bfintreturn_flag", li_intreturnflag )
    lds_payinslipdet.setitem( ll_row, "bfintreturn_amt", ldc_intreturn ) //nungs เพิ่มการ init 
	// ของครูสุรินทร์ เอา field ที่คิดว่าไม่ได้ใช้ มาเก็บการเพิ่มลดวันในการคำนวณดอกเบี้่ยรายเดือน ซึ่งก็คือ field bfwithdraw_amt
	// ต้อง reset ให้เป็น 0 เสมอ
	lds_payinslipdet.setitem( ll_row, "bfwithdraw_amt", 0 )

next

// ถ้าไม่ใช่การหักกลบคิดดอกเบี้ยได้เลย แต่ถ้าหักกลบจะไปเรียกการคิดดอกเบี้ยจาก of_initlnrcv_clrloan อีกที -- Oh --
if as_sliptype <> "CLC" then
	this.of_initslippayin_calint( lds_payinslipdet, as_sliptype, adtm_operate )
end if

ls_xmlloan	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )

return ls_xmlloan
end function

private function string of_initslippayin_head (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_slipdate, datetime adtm_opedate) throws Exception;/***********************************************************
<description>
	สร้างหัวใบเสร็จชำระพิเศษ
</description>

<arguments>  
	as_memno			String		รหัสประเภทสลิป
	as_sliptype			String		ชื่อฟิลด์ที่ต้องการค่า
	adtm_slipdate		Datetime		วันที่ใบเสร็จ
	adtm_opedate		Datetime		วันที่รับเงิน / วันที่ทำการ
</arguments> 

<return> 
	string			หากสำเร็จจะส่งค่ากลับเป็น 	xml หัวใบเสร็จ, 
					กรณีอื่น ๆ จะส่งค่ากลับเป็น ""
</return> 

<usage> 
	ถูกเรียกใช้ผ่าน n_cst_loansrv_lnoperate ไม่สามารถเรียกใช้โดยตรง

	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

string		ls_xmlsliphead
long		ll_row
n_ds		lds_payinslip

// สร้าง DataStore สำหรับใช้งาน
lds_payinslip	= create n_ds
lds_payinslip.dataobject	= DWO_PAYINSLIP
lds_payinslip.settransobject( itr_sqlca )

// init slip head
ll_row = ids_infomemdet.retrieve( is_coopcontrol, as_memno )

if ( ll_row < 1 ) then
	ithw_exception.text	= "ไม่พบข้อมูลของเลขสมาชิกที่ระบุมา ("+as_memno+")"
	destroy lds_payinslip
	throw ithw_exception
end if

lds_payinslip.reset()
lds_payinslip.insertrow( 0 )

lds_payinslip.setitem( 1, "member_no", as_memno )
lds_payinslip.setitem( 1, "memcoop_id", as_memcoopid )

lds_payinslip.setitem( 1, "sliptype_code", as_sliptype )
lds_payinslip.setitem( 1, "slip_date", adtm_slipdate )
lds_payinslip.setitem( 1, "operate_date", adtm_opedate )

lds_payinslip.object.sharestkbf_value[ 1 ]	= ids_infomemdet.object.sharebegin_value[ ll_row ]
lds_payinslip.object.sharestk_value[ 1 ]		= ids_infomemdet.object.sharestk_value[ ll_row ]
lds_payinslip.object.intaccum_amt[ 1 ]		= ids_infomemdet.object.accum_interest[ ll_row ]
lds_payinslip.object.prename_desc[ 1 ]		= ids_infomemdet.object.prename_desc[ ll_row ]
lds_payinslip.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ ll_row ]
lds_payinslip.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ ll_row ]
lds_payinslip.object.membgroup_code[ 1 ]	= ids_infomemdet.object.membgroup_code[ ll_row ]
lds_payinslip.object.membgroup_desc[ 1 ]	= ids_infomemdet.object.membgroup_desc[ ll_row ]

ls_xmlsliphead		= inv_dwxmliesrv.of_xmlexport( lds_payinslip )

destroy lds_payinslip

return ls_xmlsliphead
end function

private function string of_initslippayin_share (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception;string		ls_xmlshare
string		ls_itemcode, ls_desc, ls_shrtype
integer	li_lastperiod, li_shrstatus, li_rsgsts
long		ll_count, ll_index
dec{2}	ldc_shrstkamt, ldc_shrstkvalue, ldc_shrperiod, ldc_shrpay
n_ds		lds_payinslipdet

select resign_status
into :li_rsgsts
from mbmembmaster
where coop_id = :as_memcoopid
and member_no = :as_memno
using itr_sqlca ;

if li_rsgsts = 1 then
	return ""
end if

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

// กำหนดค่าต่าง ๆ
ls_itemcode	= string( this.of_getattribsliptype( as_sliptype, "shstm_itemtype" ) )
ls_desc		= string( this.of_getattribsliptype( as_sliptype, "shpay_desc" ) )

lds_payinslipdet.reset()

select		sm.sharetype_code, sm.sharestk_amt * st.unitshare_value, sm.last_period,
			sm.periodshare_amt * st.unitshare_value, sm.sharemaster_status
into		:ls_shrtype, :ldc_shrstkvalue, :li_lastperiod, :ldc_shrperiod, :li_shrstatus
from		shsharemaster sm, shsharetype st
where	( sm.coop_id = st.coop_id )
and		( sm.sharetype_code = st.sharetype_code )
and		( sm.coop_id			= :as_memcoopid )
and		( sm.member_no	= :as_memno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text = "ไม่พบข้อมูลหุ้นของสมาชิกเลขที่ "+as_memno
	
	destroy lds_payinslipdet
	throw ithw_exception
end if

lds_payinslipdet.insertrow( 0 )

lds_payinslipdet.setitem( 1, "operate_flag", 0 )
lds_payinslipdet.setitem( 1, "slipitemtype_code", "SHR" )
lds_payinslipdet.setitem( 1, "slipitem_desc", ls_desc )
lds_payinslipdet.setitem( 1, "periodcount_flag", 0 )
lds_payinslipdet.setitem( 1, "period", 0 )
lds_payinslipdet.setitem( 1, "principal_payamt", 0 )
lds_payinslipdet.setitem( 1, "interest_payamt", 0 )
lds_payinslipdet.setitem( 1, "item_payamt", 0 )
lds_payinslipdet.setitem( 1, "item_balance", ldc_shrstkvalue )
lds_payinslipdet.setitem( 1, "bfshrcont_balamt", ldc_shrstkvalue )
lds_payinslipdet.setitem( 1, "stm_itemtype", ls_itemcode )
lds_payinslipdet.setitem( 1, "shrlontype_code", ls_shrtype )
lds_payinslipdet.setitem( 1, "bfperiod", li_lastperiod )
lds_payinslipdet.setitem( 1, "bfshrcont_status", li_shrstatus )
lds_payinslipdet.setitem( 1, "bfperiod_payment", ldc_shrperiod )

ls_xmlshare		= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

destroy lds_payinslipdet

return ls_xmlshare
end function

public function integer of_postupd_memintaccum (string as_coopid, string as_memno, datetime adtm_intdate, decimal adc_intaccum) throws Exception;string		ls_tdate
integer	li_year

// Validate ยอดที่จะสะสม
if adc_intaccum = 0 or isnull( adc_intaccum ) then
	return 1
end if

// Validate วันที่ ด/บ
//if isnull( adtm_intdate ) or string( adtm_intdate, "yyyymmdd" ) = "19000101" then
//	ithw_exception.text	= "(ปรับปรุง ด/บ สะสม) ไม่ได้ระบุวันที่ของ ด/บ สะสมมา ไม่สามารถปรับปรุง ด/บ สะสมประจำปีได้ กรุณาตรวจสอบ"
//	throw ithw_exception
//end if

as_memno		= trim( as_memno )

// Validate เลขสมาชิก
if isnull( as_memno ) or as_memno = "" then
	ithw_exception.text	= "(ปรับปรุง ด/บ สะสม) ไม่ได้ระบุเลขสมาชิกที่จะปรับปรุง ด/บสะสมมา กรุณาตรวจสอบ"
	throw ithw_exception
end if

//// ตรวจดูวันเป็น ด/บ ของปีไหน
//select		account_year
//into		:li_year
//from		cmaccountyear
//where	( coop_id				= :as_coopid ) and
//			( :adtm_intdate		between accstart_date and accend_date )
//using		itr_sqlca ;
//
//if itr_sqlca.sqlcode <> 0 then
//	ls_tdate					= string( adtm_intdate, "dd/mm/" )+string( year( date( adtm_intdate ) )+543 )
//	ithw_exception.text	= "(ปรับปรุง ด/บ สะสม) ไม่สามารถหาปีบัญชีของวันที่ ด/บ ที่ส่งเข้ามาได้ ("+ls_tdate+") กรุณาตรวจสอบการกำหนดรอบวันของปีบัญชีด้วย"
//	throw ithw_exception
//end if

//// ปรับปรุง ด/บ สะสมประจำปี
//update	mbyeardetail
//set			interest_accum		= nvl( interest_accum, 0 ) + :adc_intaccum
//where	( member_no		= :as_memno ) and
//			( coop_id				= :as_coopid ) and
//			( acc_year			= :li_year )
//using		itr_sqlca ;
//
//if itr_sqlca.sqlcode <> 0 then
//	ithw_exception.text	= "(ปรับปรุง ด/บ สะสม) ไม่สามารถปรับปรุง ด/บ สะสมของสมาชิกเลขที่ "+as_memno+" ประจำปี "+string( li_year )+" ได้ "+itr_sqlca.sqlerrtext
//	throw ithw_exception
//end if

update	mbmembmaster
set			accum_interest	= nvl( accum_interest, 0 ) + :adc_intaccum
where	( member_no	= :as_memno ) and
			( coop_id			= :as_coopid )
using		itr_sqlca ;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "(ปรับปรุง ด/บ สะสม) ไม่สามารถปรับปรุง ด/บ สะสมของสมาชิกเลขที่ "+as_memno+" ประจำปี "+string( li_year )+" ได้ "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

private function string of_initslippayin_etc (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception;string		ls_xmletc
string		ls_itemdesc, ls_ccoopid, ls_contno, ls_loantype, ls_sueno, ls_mavtype, ls_mavdesc
integer	li_contlaw, li_nplflseq, li_feests
long		ll_count, ll_index, ll_row
dec{2}	ldc_mavamt, ldc_intarrcomp, ldc_feeamt
n_ds		lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

// ค่าธรรมเนียมแรกเข้า
select		firstfee_status, first_fee
into		:li_feests, :ldc_feeamt
from		mbmembmaster a, mbucfappltype b
where	( a.appltype_code	= b.appltype_code )
and		( a.coop_id			= :as_memcoopid )
and		( a.member_no	= :as_memno )
using		itr_sqlca ;

if li_feests = 0 then
	ll_row		= lds_payinslipdet.insertrow( 0 )
	
	lds_payinslipdet.setitem( ll_row, "operate_flag", 0 )
	lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "FEE" )
	lds_payinslipdet.setitem( ll_row, "slipitem_desc", "ค่าธรรมเนียมแรกเข้า " )
	lds_payinslipdet.setitem( ll_row, "bfcontlaw_status", 1 )
	lds_payinslipdet.setitem( ll_row, "shrlontype_code", "00" )
	lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_feeamt )
	lds_payinslipdet.setitem( ll_row, "stm_itemtype", 'FFE' )
	
end if

string ls_keepitemtype,ls_othitemtype,ls_keeptype,ls_desc
dec ldc_itempay
//รายการเรียกเก็บอื่นที่ยังไม่ชำระ
declare intdataoth_cur cursor for
select keepitemtype_code,keepothitemtype_code,keepother_type,description,item_payment
from kprcvkeepother
where  coop_id = :as_memcoopid  and member_no = :as_memno  and item_payment > 0  
using		itr_sqlca ;

select		slipitemtype_desc
into		:ls_itemdesc
from		slucfslipitemtype
where	( slipitemtype_code		= 'SHP' )
using		itr_sqlca ;

open intdataoth_cur ;
fetch intdataoth_cur into :ls_keepitemtype, :ls_othitemtype, :ls_keeptype, :ls_desc, :ldc_itempay ;

do while itr_sqlca.sqlcode = 0
	ll_row			= lds_payinslipdet.insertrow( 0 )
	
	lds_payinslipdet.setitem( ll_row, "operate_flag", 0 )
	lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_itempay )
	lds_payinslipdet.setitem( ll_row, "bfcontlaw_status", 1 )
	lds_payinslipdet.setitem( ll_row, "slipitemtype_code", ls_keepitemtype )
	lds_payinslipdet.setitem( ll_row, "concoop_id", as_memcoopid )
	lds_payinslipdet.setitem( ll_row, "loancontract_no", "" )
	lds_payinslipdet.setitem( ll_row, "shrlontype_code", ls_othitemtype )
	lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_desc )

	lds_payinslipdet.setitem( ll_row, "item_payamt", 0 )
	lds_payinslipdet.setitem( ll_row, "item_balance", ldc_itempay )

	fetch intdataoth_cur into :ls_keepitemtype, :ls_othitemtype, :ls_keeptype, :ls_desc, :ldc_itempay ;
loop
close intdataoth_cur ;

ls_xmletc		= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

destroy lds_payinslipdet


return ls_xmletc
end function

private function integer of_setintspceffectdate (string as_coopid, string as_contno, datetime adtm_rcvdate) throws Exception;integer	li_timetype, li_timeamt, li_seqno, li_cntrcvinc
datetime	ldtm_effdate

declare	data_cur cursor for
select		seq_no, int_timetype, int_timeamt
from		lncontintspc
where	( loancontract_no	= :as_contno ) and
			( coop_id				= :as_coopid )
order by seq_no asc
using		itr_sqlca ;

ldtm_effdate		= adtm_rcvdate

open data_cur ;
	fetch data_cur into :li_seqno, :li_timetype, :li_timeamt ;
	do while itr_sqlca.sqlcode = 0
		
		update	lncontintspc
		set			effective_date	= :ldtm_effdate
		where	( loancontract_no	= :as_contno ) and
					( seq_no			= :li_seqno )
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "(อัตราดอกเบี้ยเป็นช่วง ) ไม่สามารถปรับปรุงวันที่ของช่วงอัตราดอกเบี้ยได้ "+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
		
		// ประเภทการนับวัน 1=ชนวัน 2=ชนเดือน
		if li_timetype = 2 then
			ldtm_effdate	= datetime( inv_datetimesrv.of_lastdayofmonth( date( ldtm_effdate ) ) )
		end if
		
		ldtm_effdate	= datetime( inv_datetimesrv.of_relativemonth( date( ldtm_effdate ), li_timeamt ) )
		
		fetch data_cur into :li_seqno, :li_timetype, :li_timeamt ;
	loop
close data_cur ;

return 1
end function

public function datetime of_getmaxcalintdatecontract (n_ds ads_contdata);datetime		ldtm_contlastcalint, ldtm_contlastproc, ldtm_cccalint

// ข้อมูลจากสัญญาล่าสุด
ldtm_contlastcalint		= ads_contdata.getitemdatetime( 1, "lastcalint_date" )
ldtm_contlastproc		= ads_contdata.getitemdatetime( 1, "lastprocess_date" )

// หาวันที่มากสุดของสัญญา (วันที่ประมวลผล&วันที่ด/บล่าสุด)
if ldtm_contlastcalint > ldtm_contlastproc or isnull( ldtm_contlastproc ) or string( ldtm_contlastproc, "yyyymmdd" ) = "19000101" then
	ldtm_cccalint	= ldtm_contlastcalint
else
	ldtm_cccalint	= ldtm_contlastproc
end if

return ldtm_cccalint
end function

private function string of_initlnrcv_seqfirstperiod (ref n_ds ads_payoutslip) throws Exception;string			ls_xmlfirstperiod, ls_rcvfromreqcont, ls_xmlcontint, ls_xmlintspc
string			ls_contno, ls_reqno, ls_loantype, ls_coopid
long			ll_row
integer		li_rcvperiod, li_continttype, li_paytype
dec{2}		ldc_rcvamt, ldc_prnperiod, ldc_intperiod, ldc_periodpayment
datetime		ldtm_operate, ldtm_process, ldtm_posting, ldtm_calintto
n_ds			lds_contint, lds_conintspc
n_ds			lds_payinslipdet

li_rcvperiod			= ads_payoutslip.getitemnumber( 1, "rcv_period" )
li_continttype		= ads_payoutslip.getitemnumber( 1, "bfcontint_type" )
ldc_rcvamt			= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldtm_operate		= ads_payoutslip.getitemdatetime( 1, "operate_date" )

// ถ้าการจ่ายเงินกู้ไม่ใช่งวดแรกไม่ต้องหักเงินชำระงวดแรกไว้
if li_rcvperiod > 1 then
	return ""
end if

// ตรวจสอบปฎิทินการทำงานหาวันที่ประมวลผลและวันที่ตัดยอดประจำเดือน
this.of_setsrvcalendar( true )
ldtm_process	= inv_calendarsrv.of_getprocessdate( ldtm_operate )
ldtm_posting	= inv_calendarsrv.of_getpostingdate( ldtm_operate )
this.of_setsrvcalendar( false )

// ถ้าเป็นช่วงว่างยังไม่ประมวลผล
if ldtm_operate < ldtm_process then
	return ""
end if

// ดึงค่าข้อมูลสำหรับคำนวณดอกเบี้ย
ls_rcvfromreqcont	= ads_payoutslip.getitemstring( 1, "rcvfromreqcont_code" )
ls_coopid				= ads_payoutslip.getitemstring( 1, "coop_id" )
ls_contno			= ads_payoutslip.getitemstring( 1, "loancontract_no" )
ls_reqno				= ads_payoutslip.getitemstring( 1, "loanrequest_docno" )
ls_loantype			= ads_payoutslip.getitemstring( 1, "shrlontype_code" )

this.of_setsrvlninterest( true )

// ตรวจว่าเป็นการจ่ายเงินกู้จากอะไร สัญญา/ใบคำขอกู้
if ls_rcvfromreqcont = "CON" then
	ll_row		= ids_infocont.retrieve( ls_coopid, ls_contno )
	if ll_row <= 0 then
		return ""
	end if
	
	ls_xmlcontint	= string( ids_infocont.describe( "Datawindow.data.XML" ) )
	
	// ถ้าอัตราดอกเบี้ยเป็นช่วงต้องดึงตารางช่วงด้วย
	if li_continttype = 3 then
		ls_xmlintspc	= this.of_getcalintcontintspc( ls_contno, ldtm_operate, ldtm_posting )
	end if
	
	li_paytype				= ids_infocont.getitemnumber( ll_row, "loanpayment_type" )
	ldc_periodpayment	= ids_infocont.getitemdecimal( ll_row, "period_payment" )
else
	ls_xmlcontint	= this.of_getcalintreqloan( ls_reqno )
	
	// ถ้าอัตราดอกเบี้ยเป็นช่วงต้องดึงตารางช่วงด้วย
	if li_continttype = 3 then
		ls_xmlintspc	= this.of_getcalintreqintspc( ls_reqno, ldtm_operate )
	end if
	
	// มีการดึงข้อมูลคำขอกู้จาก function of_getcalintreqloan อยู่แล้ว เพราะฉะนั้นดึงค่าต่อได้เลย
	li_paytype				= ids_inforeqloan.getitemnumber( 1, "loanpayment_type" )
	ldc_periodpayment	= ids_inforeqloan.getitemdecimal( 1, "period_payment" )
end if

ldtm_calintto	= ldtm_posting
ldc_intperiod	= inv_intsrv.of_computeinterestx( ls_xmlcontint, ls_xmlintspc, ldc_rcvamt, ldtm_operate, ldtm_calintto )

this.of_setsrvlninterest( false )

// ต้นงวดแรก
if li_paytype = 1 then
	ldc_prnperiod	= ldc_periodpayment
else
	ldc_prnperiod	= ldc_periodpayment - ldc_intperiod
end if

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

lds_payinslipdet.reset()

// ใส่ข้อมูลยอดชำระงวดแรก
ll_row		= lds_payinslipdet.insertrow( 0 )

lds_payinslipdet.object.shrlontype_code[ ll_row ]		= ads_payoutslip.object.shrlontype_code[ 1 ]
lds_payinslipdet.object.bflastcalint_date[ ll_row ]		= ads_payoutslip.object.bflastcalint_date[ 1 ]

lds_payinslipdet.setitem( ll_row, "operate_flag", 1 )
lds_payinslipdet.setitem( ll_row, "concoop_id", ls_coopid )
lds_payinslipdet.setitem( ll_row, "loancontract_no", ls_contno )
lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "SFP" )
lds_payinslipdet.setitem( ll_row, "slipitem_desc", "หักฝากชำระงวดแรก" )

lds_payinslipdet.setitem( ll_row, "prncalint_amt", ldc_rcvamt )
lds_payinslipdet.setitem( ll_row, "interest_period", ldc_intperiod )
lds_payinslipdet.setitem( ll_row, "calint_from", ldtm_operate )
lds_payinslipdet.setitem( ll_row, "calint_to", ldtm_calintto )

lds_payinslipdet.setitem( ll_row, "principal_payamt", ldc_prnperiod )
lds_payinslipdet.setitem( ll_row, "interest_payamt", ldc_intperiod )
lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_prnperiod + ldc_intperiod )
lds_payinslipdet.setitem( ll_row, "stm_itemtype", "" )

ls_xmlfirstperiod	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )

destroy	lds_contint
destroy	lds_conintspc
destroy	lds_payinslipdet

return ls_xmlfirstperiod
end function

private function integer of_postslip_payinseqfirstperiod (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string		ls_memcoopid, ls_coopid, ls_memno, ls_contno
string		ls_expcode, ls_deptaccno, ls_slipitemtype, ls_slipno
integer	li_year
long		ll_count, ll_index
dec{2}	ldc_itempay, ldc_prnpay, ldc_intpay
datetime	ldtm_trndate, ldtm_cutdate
str_posttrans	lstr_posttrans

ls_slipno		= ads_payinslip.getitemstring( 1, "payinslip_no" )

ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code in ('DEP','SFP')" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_memcoopid		= ads_payinslip.getitemstring( 1, "memcoop_id" )
ls_memno			= ads_payinslip.getitemstring( 1, "member_no" )
ls_coopid				= ads_payinslip.getitemstring( 1, "coop_id" )
ldtm_trndate		= ads_payinslip.getitemdatetime( 1, "slip_date" )
 

//// ดึงข้อมูลบัญชีหลักสมาชิกใน Expense
//select		expense_code, expense_accid
//into		:ls_expcode, :ls_deptaccno
//from		mbmembexpense
//where	( member_no		= :ls_memno ) and
//			( coop_id				= :ls_memcoopid )
//using		itr_sqlca ;
//
//if itr_sqlca.sqlcode <> 0 then
//	ithw_exception.text	+= "ฝากเงินหักชำระงวดแรก ไม่พบเลขที่บัญชีเงินฝากสมาชิก "+ls_memno+ " กรุณาตรวจสอบ"
//	throw ithw_exception
//end if
//
//if ls_expcode <> "TRN" then
//	ithw_exception.text	+= "บัญชีหลักของสมาชิก ไม่ใช่บัญชีเงินฝากของสหกรณ์ "+ls_memno+ " กรุณาตรวจสอบ"
//	throw ithw_exception
//end if
//
for ll_index = 1 to ll_count
	
	ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
	ldc_itempay			= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
	ldc_prnpay			= ads_payinslipdet.getitemdecimal( ll_index, "principal_payamt" )
	ldc_intpay			= ads_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
	ldtm_cutdate		= ads_payinslipdet.getitemdatetime( ll_index, "calint_to" )
	ls_slipitemtype =    ads_payinslipdet.getitemstring(ll_index, "slipitemtype_code" )
	if ls_slipitemtype = 'DEP' then
		ls_deptaccno = trim(ads_payinslipdet.getitemstring( ll_index, "clrother_desc" ) )
		if isnull( ls_deptaccno ) or len( ls_deptaccno ) < 5 then
			select deptaccount_no
			into :ls_deptaccno
			from mbmembmaster 
			where	( member_no		= :ls_memno ) and
					( coop_id				= :ls_memcoopid )
			using		itr_sqlca ;
			
		end if
	end if
	if   ls_slipitemtype = 'DFP'   then
		
		// ดึงข้อมูลบัญชีหลักสมาชิกใน Expense
		select		expense_code, expense_accid
		into		:ls_expcode, :ls_deptaccno
		from		mbmembexpense
		where	( member_no		= :ls_memno ) and
					( coop_id				= :ls_memcoopid )
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ฝากเงินหักชำระงวดแรก ไม่พบเลขที่บัญชีเงินฝากสมาชิก "+ls_memno+ " กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		if ls_expcode <> "TRN" then
			ithw_exception.text	+= "บัญชีหลักของสมาชิก ไม่ใช่บัญชีเงินฝากของสหกรณ์ "+ls_memno+ " กรุณาตรวจสอบ"
			throw ithw_exception
		end if

	end if

	lstr_posttrans.coop_id				= ls_coopid
	
	lstr_posttrans.source_code			= "DFP"
	lstr_posttrans.source_coopid		= ls_coopid
	lstr_posttrans.source_accno			= ls_deptaccno
	lstr_posttrans.memcoop_id			= ls_memcoopid
	lstr_posttrans.member_no			= ls_memno
	lstr_posttrans.concoop_id			= ls_coopid
	lstr_posttrans.loancontract_no		= ls_contno
	lstr_posttrans.sliptype_code			= "PMP"
	lstr_posttrans.moneytype_code		= "TRN"
	
	lstr_posttrans.trnpay_type			= 2
	lstr_posttrans.trans_amt				= ldc_itempay
	lstr_posttrans.prn_trnamt			= ldc_prnpay
	lstr_posttrans.int_trnamt				= ldc_intpay
	
	// ผ่านรายการเงินงวดไปวางไว้ที่ depttran
	lstr_posttrans.trans_date				= ldtm_trndate
	lstr_posttrans.system_code			= "DFP"
	
	this.of_posttrn_depttran( lstr_posttrans )
	
	// ผ่านรายการไป transpayin ไว้รอตัดตอนสิ้นเดือน
	lstr_posttrans.trans_date				= ldtm_cutdate
	lstr_posttrans.system_code			= "LON"
	this.of_posttrn_trnpayin( lstr_posttrans )
	
	
next

return 1
end function

public function datetime of_getmaxcalintdatepayin (n_ds ads_payinslipdet, long al_chkrow, datetime adtm_opedate);integer		li_payspecmethod
datetime		ldtm_paylastcalint, ldtm_paylastproc, ldtm_paychkdate

// ข้อมูลตอนชำระ
li_payspecmethod		= ads_payinslipdet.getitemnumber( al_chkrow, "bfpayspec_method" )
ldtm_paylastcalint		= ads_payinslipdet.getitemdatetime( al_chkrow, "bflastcalint_date" )
ldtm_paylastproc		= ads_payinslipdet.getitemdatetime( al_chkrow, "bflastproc_date" )

// หาวันที่มากสุดของรายการชำระ (วันที่ประมวลผล&วันที่ด/บล่าสุด ต้องดูว่าคิด ด/บ จากยอดไหนด้วย)
if li_payspecmethod = 1 then
	if adtm_opedate > ldtm_paylastproc or isnull( ldtm_paylastproc ) or string( ldtm_paylastproc, "yyyymmdd" ) = "19000101" then
		ldtm_paychkdate	= adtm_opedate
	else
		ldtm_paychkdate	= ldtm_paylastproc
	end if
else
	if ldtm_paylastcalint > ldtm_paylastproc or isnull( ldtm_paylastproc ) or string( ldtm_paylastproc, "yyyymmdd" ) = "19000101" then
		ldtm_paychkdate	= ldtm_paylastcalint
	else
		ldtm_paychkdate	= ldtm_paylastproc
	end if
end if

return ldtm_paychkdate
end function

public function integer of_posttrn_depttran (str_posttrans astr_postdptrn) throws Exception;string		ls_contno, ls_coopid, ls_deptaccno, ls_memcoopid, ls_memno, ls_systemcode
integer	li_year, li_index, li_sequest_status
dec{2}	ldc_itempay, ldc_sequest_amt
datetime	ldtm_trndate

ls_coopid				= astr_postdptrn.source_coopid
ls_deptaccno		= astr_postdptrn.source_accno
ls_memcoopid		= astr_postdptrn.memcoop_id
ls_memno			= astr_postdptrn.member_no
ls_contno			= astr_postdptrn.loancontract_no
ldc_itempay			= astr_postdptrn.trans_amt
ldtm_trndate		= astr_postdptrn.trans_date

ls_systemcode		= astr_postdptrn.system_code

li_year				= year( date( ldtm_trndate ) ) + 543

//mong 
if isnull( ls_deptaccno ) then ls_deptaccno = ls_memno 

select		max( seq_no )
into		:li_index
from		dpdepttran
where	( coop_id				= :ls_coopid ) and
			( deptaccount_no	= :ls_deptaccno ) and
			( tran_date			= :ldtm_trndate )
using		itr_sqlca ;

if isnull( li_index ) then li_index = 0
li_index	= li_index + 1
if( ls_systemcode = 'LON' ) then 
	li_sequest_status = 0 
	ldc_sequest_amt = 0.00
else
	li_sequest_status = 1
	ldc_sequest_amt = ldc_itempay
end if 
	
// บันทึกใส่รายการของเงินฝาก
insert into dpdepttran
		( coop_id, deptaccount_no, memcoop_id, member_no, system_code, tran_year, tran_date, seq_no, old_balanc, old_accuint,
		  lastcalint_date, newcalint_date, deptitem_amt, int_amt, new_accuint, new_balanc, tran_status, dividen_amt, average_amt, lncont_no, branch_operate,sequest_status,sequest_amt)
		  
values( :ls_coopid, :ls_deptaccno, :ls_memcoopid, :ls_memno, :ls_systemcode, :li_year, :ldtm_trndate, :li_index, 0, 0,
		  null, null, :ldc_itempay, 0, 0, 0, 0, 0, 0, :ls_contno, '001' , :li_sequest_status, :ldc_sequest_amt)
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถผ่านรายการไปเงินฝากได้  เลขสมาชิก "+ls_memno+" "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

public function integer of_posttrn_trnpayin (str_posttrans astr_posttrans) throws Exception;string		ls_contno, ls_coopid, ls_memcoopid, ls_memno, ls_trnitemcode
string		ls_contcoopid, ls_moneytype, ls_sliptype, ls_shrtype, ls_srccode, ls_srcaccno, ls_tofromaccid
integer	li_index, li_trnpaytype, li_poststatus
dec{2}	ldc_itempay, ldc_prnpay, ldc_intpay
datetime	ldtm_postdate, ldtm_trndate, ldtm_today

ls_coopid				= astr_posttrans.coop_id
ls_memcoopid		= astr_posttrans.memcoop_id
ls_memno			= astr_posttrans.member_no
ls_contcoopid		= astr_posttrans.concoop_id
ls_contno			= astr_posttrans.loancontract_no
ls_shrtype			= astr_posttrans.sharetype_code
ls_srccode			= astr_posttrans.source_code
ls_srcaccno			= astr_posttrans.source_accno
ldc_itempay			= astr_posttrans.trans_amt
ldtm_trndate		= astr_posttrans.trans_date
li_trnpaytype		= astr_posttrans.trnpay_type
ldc_prnpay			= astr_posttrans.prn_trnamt
ldc_intpay			= astr_posttrans.int_trnamt
ls_moneytype		= astr_posttrans.moneytype_code
ls_tofromaccid		= astr_posttrans.tofrom_accid
ls_sliptype			= astr_posttrans.sliptype_code

li_poststatus			= astr_posttrans.post_status
ldtm_postdate		= astr_posttrans.post_date

if isnull( li_poststatus ) then li_poststatus = 0

ls_trnitemcode		= astr_posttrans.system_code

select		max( seq_no )
into		:li_index
from		sltranspayin
where	( coop_id				= :ls_coopid ) and
			( memcoop_id		= :ls_memcoopid ) and
			( member_no		= :ls_memno ) 
			//and ( trans_date			= :ldtm_trndate )
using		itr_sqlca ;

if isnull( li_index ) then li_index = 0
li_index	= li_index + 1

// บันทึกใส่รายการของเงินฝาก
insert into sltranspayin
		( coop_id, memcoop_id, member_no, trans_date, seq_no, transitem_code, realpay_date, shrtype_code, concoop_id, loancontract_no, 
		  transpay_type, trans_amt, principal_trnamt, interest_trnamt, sliptype_code, trnsource_code, trnsource_accno, trnsource_status, trnsource_refslipno, 
		  moneytype_code, tofrom_accid, post_status, post_date )
values( :ls_coopid, :ls_memcoopid, :ls_memno, :ldtm_trndate, :li_index, :ls_trnitemcode, :ldtm_trndate, :ls_shrtype, :ls_contcoopid, :ls_contno,
		  :li_trnpaytype, :ldc_itempay, :ldc_prnpay, :ldc_intpay, :ls_sliptype, :ls_srccode, :ls_srcaccno, 8, null, :ls_moneytype, :ls_tofromaccid, :li_poststatus, :ldtm_postdate )
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถผ่านรายการไปเงินฝากได้  เลขสมาชิก "+ls_memno+" "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

private function integer of_postslip_lnrcv (n_ds ads_payoutslip, string as_concoopid) throws Exception;string		ls_slipno, ls_docrcvno, ls_contno, ls_contcoopid, ls_memcoopid, ls_memno, ls_moneytype, ls_lwditemtype
string		ls_loantype, ls_entryid, ls_coopid, ls_keepperiod
string		ls_bankcode, ls_bankbranch, ls_bankaccid , ls_loantypecode
integer	li_periodrcv, li_continttype, li_year, li_month, li_paystatus,li_periodpayall,li_paymentype,li_atmflag,li_regenperiodpay,li_roundpay
long		ll_row , ll_odflag
dec{2}	ldc_prinbalance, ldc_withdrawamt, ldc_lnrcvamt, ldc_lnrcvnet,ldc_periodpayment
dec{2}	ldc_bfintarrear, ldc_intperiod, ldc_intarrbal, ldc_prncalint, ldc_bfprinalance
datetime	ldtm_entrydate, ldtm_procdate, ldtm_lastaccess
datetime	ldtm_slipdate, ldtm_opedate, ldtm_calintfrom, ldtm_calintto, ldtm_startkeep,ldtm_bflastcalint
str_poststmloan	lstr_lnstm
str_posttrans		lstr_postdptrn

ls_contcoopid		=  as_concoopid  // by Phai Edit use coopcontrol

// ดึงข้อมูลสำหรับผ่านรายการจ่ายเงินกู้
ls_slipno				= trim( ads_payoutslip.getitemstring( 1, "payoutslip_no" ) )
ls_docrcvno			= trim( ads_payoutslip.getitemstring( 1, "document_no" ) )
ls_contno			= trim( ads_payoutslip.getitemstring( 1, "loancontract_no" ) )
//ls_contcoopid		= trim( ads_payoutslip.getitemstring( 1, "coop_id" ) )
ls_memcoopid		= trim( ads_payoutslip.getitemstring( 1, "memcoop_id" ) )
ls_memno			= trim( ads_payoutslip.getitemstring( 1, "member_no" ) )
ls_loantype			= trim( ads_payoutslip.getitemstring( 1, "shrlontype_code" ) )
ls_moneytype		= trim( ads_payoutslip.getitemstring( 1, "moneytype_code" ) )
ls_bankcode			= trim( ads_payoutslip.getitemstring( 1, "expense_bank" ) )
ls_bankbranch		= trim( ads_payoutslip.getitemstring( 1, "expense_branch" ) )
ls_bankaccid		= trim( ads_payoutslip.getitemstring( 1, "expense_accid" ) )
li_periodrcv			= ads_payoutslip.getitemnumber( 1, "rcv_period" )
li_paystatus			= ads_payoutslip.getitemnumber( 1, "lnpayment_status" )
ldc_lnrcvamt		= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldc_lnrcvnet			= ads_payoutslip.getitemdecimal( 1, "payoutnet_amt" )
ldc_prncalint		= ads_payoutslip.getitemdecimal( 1, "prncalint_amt" )
ldc_intperiod		= ads_payoutslip.getitemdecimal( 1, "interest_period" )
ldtm_slipdate		= ads_payoutslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate		= ads_payoutslip.getitemdatetime( 1, "operate_date" )
ldtm_calintfrom		= ads_payoutslip.getitemdatetime( 1, "calint_from" )
ldtm_calintto		= ads_payoutslip.getitemdatetime( 1, "calint_to" )

ls_entryid			= ads_payoutslip.getitemstring( 1, "entry_id" )
ls_coopid				= ads_payoutslip.getitemstring( 1, "coop_id" )
ldtm_entrydate		= datetime( today(), now() )

// ดึงข้อมูลสัญญาเงินกู้
//ll_row		= ids_infocont.retrieve( ls_contcoopid, ls_contno )

if isnull( ls_contno) then ls_contno=""
if ls_contno <> "" then
		select		principal_balance,withdrawable_amt,interest_arrear,period_payamt, loanpayment_type, loantype_code, period_payment,lastcalint_date, lastaccess_date
		into		:ldc_prinbalance,:ldc_withdrawamt,:ldc_bfintarrear,:li_periodpayall, :li_paymentype,:ls_loantypecode, :ldc_periodpayment,:ldtm_bflastcalint, :ldtm_lastaccess
		from		lncontmaster
		where	( coop_id				= :ls_contcoopid) and
					( loancontract_no		= :ls_contno ) 
		using		itr_sqlca ;
else
       ithw_exception.text	+= "ไม่พบข้อมูล เลขสัญญา #"+ls_contno+"  "+ls_contcoopid	
	throw ithw_exception
end if

//wa เพิ่ม กรณี MHS รับเงินกู้ ต้องคำนวณ ยอดชำระ/งวด ใหม่ทุกครั้ง
try	
	select atm_flag, atmregenperiodpay_flag, payround_factor
	into :li_atmflag, :li_regenperiodpay, :li_roundpay
	from lnloantype 
	where loantype_code = :ls_loantypecode using itr_sqlca;
	if isnull( li_atmflag ) then li_atmflag = 0
	if isnull( li_regenperiodpay ) then li_regenperiodpay = 0
catch(Exception e)
	li_atmflag = 0
	li_regenperiodpay = 0
end try

// กำหนดค่าต่าง ๆ
ls_lwditemtype		= string( this.of_getattribsliptype( "LWD", "lnstm_itemtype" ) )
ldc_bfprinalance  = ldc_prinbalance
ldc_prinbalance		= ldc_prinbalance + ldc_lnrcvamt
ldc_withdrawamt	= ldc_withdrawamt - ldc_lnrcvamt
ldc_intarrbal			= ldc_bfintarrear + ldc_intperiod

// วันที่ปรับปรุงล่าสุด
if ldtm_slipdate > ldtm_lastaccess or isnull( ldtm_lastaccess ) then
	ldtm_lastaccess = ldtm_slipdate
end if

// บันทึกข้อมูลโดยดูจากงวดที่รับเงิน
if li_periodrcv = 1 then
	
	// ถ้าสัญญานั้นอัตราดอกเบี้ยเป็นช่วงต้อง set ค่าวันที่ลงไป
	if li_continttype = 3 then
		try
			this.of_setintspceffectdate( ls_contcoopid, ls_contno, ldtm_opedate )
		catch ( Exception lthw_intspc )
			throw lthw_intspc
		end try
	end if
	
	// วันที่เริ่มเก็บ
	this.of_setsrvcalendar( true )
	ldtm_procdate		= inv_calendarsrv.of_getnextprocessdate( ldtm_opedate )
	ldtm_startkeep		= inv_calendarsrv.of_getpostingdate( ldtm_procdate )
	this.of_setsrvcalendar( false )
	
	ls_keepperiod		= string( year( date( ldtm_procdate ) ) + 543 )+string( month( date( ldtm_procdate ) ), "00" )
	ldc_intarrbal		= ads_payoutslip.getitemdecimal( 1, "bfinterest_arrear" ) //nungs get ค่าเผือ่กรณีที่มีการคำนวน ดอกเบี้ย ณ วันจ่าย

	update	lncontmaster
	set			principal_balance	= :ldc_prinbalance,
				withdrawable_amt	= :ldc_withdrawamt,
				interest_arrear		= :ldc_intarrbal, //เดิมเป็น 0 nungs
				last_periodrcv		= :li_periodrcv,
				startcont_date		= :ldtm_slipdate,
				startkeep_date		= :ldtm_startkeep,
				startkeep_period	= :ls_keepperiod,
				lastreceive_date	= :ldtm_slipdate,
				lastcalint_date		= :ldtm_slipdate,
				lastaccess_date	= :ldtm_slipdate,
				expense_code		= :ls_moneytype,
				expense_bank		= :ls_bankcode,
				expense_branch	= :ls_bankbranch,
				expense_accid		= :ls_bankaccid,
				payment_status	= :li_paystatus
	where	( trim(loancontract_no)	= :ls_contno ) and
				( coop_id				= :ls_contcoopid )
	using		itr_sqlca ;
else
	
	//wa เพิ่มคำนวณ ดบ.ค้าง
	
	//กรณีรับเงินงวดสองขึ้นไป
	integer li_countkp
	decimal ldc_intamtarr
	// ประกาศ Service interest
	this.of_setsrvlninterest( true )

	//mong เพิ่ม คำนวณ ดบ. ค้างตั้งไว้
	li_countkp = 0
	select count(*)
	into :li_countkp
	from kptempreceive a, kptempreceivedet b 
	where a.recv_period = b.recv_period and a.member_no = b.member_no and b.posting_status = 0 and b.loancontract_no = :ls_contno 
				and a.member_no = :ls_memno		and a.receipt_date >= :ldtm_opedate using itr_sqlca ;
	
	//mong แก้ไข สุรินทร์ให้เปลียนเป็นไม่ตั้งค้าง ไม่ขยับวันที่ หักกลบจะคิด ดบ.ผิด 57-07-25
	if li_countkp > 0 then
		//แสดงว่าหลังเรียกเก็บ
		// คำนวณดอกเบี้ย
		ldc_prncalint = ldc_lnrcvamt
		ldtm_calintfrom = ldtm_opedate
		ldc_intamtarr		=   inv_intsrv.of_computeinterest(ls_contcoopid, ls_contno, ldc_lnrcvamt, ldtm_calintfrom, ldtm_calintto )
		ldc_intperiod = ldc_intamtarr
		//ldtm_opedate =  ldtm_calintto
	else
		//แสดงว่าก่อนเรียกเก็บ
		// คำนวณดอกเบี้ย
		ldc_prncalint = ldc_bfprinalance
		ldtm_calintfrom = ldtm_bflastcalint
		ldtm_calintto =   ldtm_opedate
		ldc_intamtarr		=     inv_intsrv.of_computeinterest(ls_contcoopid, ls_contno, ldc_bfprinalance, ldtm_calintfrom, ldtm_opedate )
		ldc_intperiod = ldc_intamtarr
	end if
	ldc_intarrbal = ldc_intarrbal + ldc_intamtarr
	
	
	update	lncontmaster
	set			principal_balance	= :ldc_prinbalance,
				withdrawable_amt	= :ldc_withdrawamt,
				interest_arrear		= :ldc_intarrbal,
				last_periodrcv		= :li_periodrcv,
				lastreceive_date	= :ldtm_slipdate,
				lastcalint_date		= :ldtm_slipdate,
				lastaccess_date		= :ldtm_lastaccess,
				payment_status	= :li_paystatus
	where	( trim( loancontract_no)	= :ls_contno ) and
				( coop_id				= :ls_contcoopid )
	using	itr_sqlca ;
end if

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "ไม่สามารถปรับปรุงยอดเบิกเงินกู้ได้ เลขสัญญา #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// บันทึกลง Statement
lstr_lnstm.loancontract_no			= ls_contno
lstr_lnstm.contcoop_id				= ls_contcoopid
lstr_lnstm.slip_date					= ldtm_slipdate
lstr_lnstm.operate_date				= ldtm_opedate
lstr_lnstm.account_date				= ldtm_slipdate
lstr_lnstm.intaccum_date				= ldtm_slipdate
lstr_lnstm.ref_slipno					= ls_slipno
lstr_lnstm.ref_docno					= ls_docrcvno
lstr_lnstm.loanitemtype_code		= ls_lwditemtype
lstr_lnstm.period						= li_periodrcv
lstr_lnstm.principal_payment		= ldc_lnrcvamt
lstr_lnstm.interest_payment			= 0
lstr_lnstm.principal_balance			= ldc_prinbalance
lstr_lnstm.prncalint_amt				= ldc_prncalint
lstr_lnstm.calint_from					= ldtm_calintfrom
lstr_lnstm.calint_to					= ldtm_calintto
lstr_lnstm.bfinterest_arrear			= ldc_bfintarrear
lstr_lnstm.interest_period			= ldc_intperiod
lstr_lnstm.interest_arrear			= ldc_intarrbal
lstr_lnstm.moneytype_code			= ls_moneytype
lstr_lnstm.item_status				= 1
lstr_lnstm.entry_id						= ls_entryid
lstr_lnstm.entry_bycoopid			= ls_coopid

// ผ่านรายการ Statement
this.of_poststm_contract( lstr_lnstm )

// ถ้าเป็นการโอนเงินเข้าเงินฝาก
if ls_moneytype = "TRN" then
	// ถ้าเป็นประเภทการโอนไปเงินฝากแต่ไม่ป้อนเลขที่บัญชีมาให้ไปเอาจาก membexpense
	if trim( ls_bankaccid ) = "" or isnull( ls_bankaccid ) then
		select		expense_accid
		into		:ls_bankaccid
		from		mbmembmaster
		where	( coop_id				= :ls_memcoopid ) and
					( member_no		= :ls_memno ) and
					( expense_code	= 'TRN' )
		using		itr_sqlca ;
		
		if trim( ls_bankaccid ) = "" and isnull( ls_bankaccid ) then
			ithw_exception.text	= "ไม่พบข้อมูลเลขที่บัญชีเงินฝากที่จะทำการโอนเงินกู้เข้า ของสมาชิกเลขที่ "+ls_memno+" กรุณาตรวจสอบ"
			throw ithw_exception
		end if
	end if
	
	lstr_postdptrn.source_coopid		= as_concoopid // by Phai Edit use coopcontrol
	lstr_postdptrn.source_accno			= ls_bankaccid
	lstr_postdptrn.memcoop_id			= ls_memcoopid
	lstr_postdptrn.member_no			= ls_memno
	lstr_postdptrn.loancontract_no		= ls_contno
	lstr_postdptrn.trans_amt				= ldc_lnrcvnet
	lstr_postdptrn.trans_date			= ldtm_opedate
		
	lstr_postdptrn.system_code			= "LON"
	
	this.of_posttrn_depttran( lstr_postdptrn )
end if

return 1
end function

public function integer of_saveapv_lnreq (ref string as_xmlreqlist, string as_apvid, string as_concoopid, datetime adtm_apvdate) throws Exception;
string			ls_xmlreqloan, ls_reqno, ls_coopid, ls_contno, ls_loantype, ls_registno
integer		li_status
long			ll_count, ll_find
dec{2}		ldc_reqamt, ldc_apvamt
n_ds	lds_apvlist

lds_apvlist		= create n_ds
lds_apvlist.dataobject		= "d_loansrv_list_rqlonapv"
lds_apvlist.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( lds_apvlist, as_xmlreqlist )

ll_count		= lds_apvlist.rowcount()

if ll_count <= 0 then
	destroy( lds_apvlist )
	return 0
end if

// เรียงลำดับจากสัญญาที่สร้างแล้วตามด้วยใบคำขอ
lds_apvlist.setsort( "loancontract_no asc, loanrequest_docno asc" )
lds_apvlist.sort()

this.of_setsrvdeposit( true )

ll_find			= lds_apvlist.find( "loanrequest_status <> 8", 1, ll_count )
do while ll_find > 0
	ls_coopid		= trim( lds_apvlist.getitemstring( ll_find, "coop_id" ) )
	ls_reqno		= trim( lds_apvlist.getitemstring( ll_find, "loanrequest_docno" ) )
	ls_contno	= trim( lds_apvlist.getitemstring( ll_find, "loancontract_no" ) )
	ls_loantype	= trim( lds_apvlist.getitemstring( ll_find, "loantype_code" ) )
	ls_registno	= trim( lds_apvlist.getitemstring( ll_find, "ref_registerno" ) ) 
	ldc_reqamt	= lds_apvlist.getitemdecimal( ll_find, "loanrequest_amt" )
	li_status		= lds_apvlist.getitemnumber( ll_find, "loanrequest_status" )
	choose case li_status
		case 0	// ไม่อนุมัติ
			ls_contno	= ""
			ldc_apvamt	= 0
		case 1	// อนุมัติออกเลขสัญญา
			ldc_apvamt	= ldc_reqamt
			
			// ถ้าไม่มีเลขสัญญาต้องสร้างให้
			if ls_contno = "" or isnull( ls_contno ) then
				ls_contno	= this.of_gennewcontractno(is_coopid, ls_loantype )
			end if
		case 11	// อนุมัติไว้เฉยๆ
			ldc_apvamt	= ldc_reqamt
	end choose

	// บันทึกกลับไปที่ใบคำขอกู้ก่อน เพราะเวลาสร้างสัญญาจะต้องไปดึงข้อมูลจากใบคำขอมาสร้าง
	update	lnreqloan
	set			loanrequest_status	= :li_status,
				loanapprove_amt		= :ldc_apvamt,
				loancontract_no		= :ls_contno,
				approve_id				= :as_apvid,
				approve_date            =:adtm_apvdate
	where	( loanrequest_docno	= :ls_reqno ) and
				( coop_id					= :is_coopcontrol )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ใบคำขอกู้เงิน เลขที่ "+ls_reqno+" ไม่สามารถปรับปรุงสถานะได้ "+itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		destroy( lds_apvlist )
		throw ithw_exception
	end if

	update lnreqloanregister
	set 	reqregister_status = 1,
			lnapprove_date = :adtm_apvdate,
			loanapprove_amt = :ldc_apvamt
	where  reqregister_docno = :ls_registno  and  coop_id = :is_coopid   
	using itr_sqlca;
	
	// ถ้าไม่ใช่การอนุมัติสร้างเลขสัญญาทำอันถัดไปเลย
	if li_status <> 1 then
		goto nextitem
	end if
	
	// สร้างเลขสัญญา
	try
		this.of_buildcontno_reqloan( ls_reqno, ls_contno )
	catch ( Exception lthw_buildcontno )
		rollback using itr_sqlca ;
		destroy( lds_apvlist )
		throw lthw_buildcontno
	end try

	nextitem:
	ll_find ++
	if ll_find > ll_count then
		exit
	end if
	ll_find			= lds_apvlist.find( "loanrequest_status <> 8", ll_find, ll_count )
loop

destroy( lds_apvlist )

commit using itr_sqlca ;

//as_xmlreqlist		= this.of_initlist_lnreqapv()

return 1
end function

public function integer of_setsrvfin (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return -1
end if


if ab_switch then
	if isnull( inv_lnfin ) or not isvalid( inv_lnfin ) then
		inv_lnfin	= create n_cst_loansrv_lnfinance
		inv_lnfin.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_lnfin ) then
		destroy inv_lnfin
		return 1
	end if
end if

return 0
end function

public function integer of_setsrvfiniance (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return -1
end if


if ab_switch then
	if isnull( inv_finsrv ) or not isvalid( inv_finsrv ) then
		inv_finsrv	= create n_cst_finance_service
		inv_finsrv.of_settrans( inv_transection )
		inv_finsrv.of_init()
		return 1
	end if
else
	if isvalid( inv_lnfin ) then
		destroy inv_lnfin
		return 1
	end if
end if

return 0
end function

private function string of_initlnrcv_clrloan (string as_memcoopid, string as_memno, string as_contno, string as_reqno, string as_sliptype, datetime adtm_opedate, string as_lnrcvloantype) throws Exception;string ls_xmlclrlon, ls_contclr, ls_concoopid, ls_loantypeclr
long ll_count, ll_find, li_row
integer li_calintflag, li_clccclworksht_flag, li_pxafmthkp
dec{2}ldc_intperiod, ldc_intarrear, ldc_intarrset, ldc_prnbal
dec{2}ldc_rkeepprn, ldc_rkeepint, ldc_prnpay, ldc_intpay
n_ds lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet = create n_ds
lds_payinslipdet.dataobject = DWO_PAYINSLIPDET
lds_payinslipdet.settransobject(itr_sqlca)

ls_xmlclrlon = this.of_initslippayin_loan(as_memcoopid, as_memno, as_sliptype, adtm_opedate)

as_contno = trim(as_contno)
as_reqno = trim(as_reqno)

lds_payinslipdet.reset()
lds_payinslipdet.importstring(XML!, ls_xmlclrlon)

ll_count = lds_payinslipdet.rowcount()

if ll_count <= 0 then
	destroy lds_payinslipdet
	return ""
end if

// ถ้ามีสัญญาต้นทางส่งเข้ามาต้องตัดออกจากรายการนะ
if as_contno <> "" then
	ll_find = lds_payinslipdet.find("loancontract_no = '" + as_contno + "' and concoop_id = '" + as_memcoopid + "'", 1, ll_count)
	
	// ตัดออกจากรายการ
	lds_payinslipdet.rowsdiscard(ll_find, ll_find, primary!)
end if

// ส่งไปคำนวณดอกเบี้ย
this.of_initslippayin_calint(lds_payinslipdet, as_sliptype, adtm_opedate)

// ถ้าไม่มีใบคำขอส่งเข้ามาคืนค่าไปเลย
if as_reqno = "" then
	// ถอดเป็น XML เพื่อส่งไปคิดดอกเบี้ย
	ls_xmlclrlon = string(lds_payinslipdet. describe ("Datawindow.data.XML"))

	destroy lds_payinslipdet
	return ls_xmlclrlon
end if

// เอาใบคำขอไปดึงข้อมูลว่าตอนขอกู้เลือกหักชำระสัญญาไหนบ้าง
declare data_cur cursor for
select loancontract_no, concoop_id
from lnreqloanclr
where(loanrequest_docno = :as_reqno) and
(coop_id = :is_coopcontrol) and
(clear_status = 1)
using itr_sqlca;

open data_cur;
fetch data_cur into :ls_contclr, :ls_concoopid;
do while itr_sqlca.sqlcode = 0
		
	ll_find = lds_payinslipdet.find("loancontract_no = '" + ls_contclr + "' and concoop_id = '" + ls_concoopid + "'", 1, ll_count)
		
	if ll_find > 0 then
		ls_loantypeclr = lds_payinslipdet.getitemstring(ll_find, "shrlontype_code")
		ldc_prnbal = lds_payinslipdet.getitemdecimal(ll_find, "bfshrcont_balamt")
		ldc_intperiod = lds_payinslipdet.getitemdecimal(ll_find, "interest_period")
		ldc_intarrear = lds_payinslipdet.getitemdecimal(ll_find, "bfintarr_amt")
		ldc_intarrset = lds_payinslipdet.getitemdecimal(ll_find, "bfintarrset_amt")
			
		ldc_rkeepprn = lds_payinslipdet.getitemdecimal(ll_find, "rkeep_principal")
		ldc_rkeepint = lds_payinslipdet.getitemdecimal(ll_find, "rkeep_interest")
			
		li_pxafmthkp = lds_payinslipdet.GetItemNumber(ll_find, "bfpxaftermthkeep_type")
			
		if isnull(ldc_prnbal) then ldc_prnbal = 0
		if isnull(ldc_intperiod) then ldc_intperiod = 0
		if isnull(ldc_intarrear) then ldc_intarrear = 0
		if isnull(ldc_intarrset) then ldc_intarrset = 0
		if isnull(ldc_rkeepprn) then ldc_rkeepprn = 0
		if isnull(ldc_rkeepint) then ldc_rkeepint = 0


		////nungs ตรวจสอบการ init ยอดหักกลบ แบบกันยอด ตรวจสอบจากค่าคงที่
		//select clccclworksht_flag
		//into :li_clccclworksht_flag
		//from lnloantype
		//where loantype_code = :ls_loantypeclr
		//using itr_sqlca;
			
		//ถ้ามีการเรียกเก็บ : ยอดเงินต้นเรียกเก็บ > 0
		if ldc_rkeepprn > 0 and li_pxafmthkp = 1 then
			//ลบยอดเรียกเก็บออกจากยอดหนี้คงเหลือ
			ldc_prnpay = ldc_prnbal - ldc_rkeepprn
		else
			//ถ้าไม่มีการเรียกเก็บให้ยอดที่หักกลบสัญญานี้ เป็นยอดคงเหลือทั้งหมด
			ldc_prnpay = ldc_prnbal
		end if
							
		if ldc_rkeepint > 0 and li_pxafmthkp = 1 then //ถ้ามียอดเรียกเก็บดอกเบี้ย
			ldc_intpay = 0 //ไม่ต้องคิดดอกบี้ยตอนหักกลบ
		else
			//ถ้าไม่มีดบเรียกเก็บ ต้องเคลียร์ดอกเบี้ยรวมในบอดหักกลบ
			ldc_intpay = ldc_intperiod + ldc_intarrear
		end if
			
		lds_payinslipdet.setitem(ll_find, "operate_flag", 1)
		lds_payinslipdet.setitem(ll_find, "principal_payamt", ldc_prnpay)
		lds_payinslipdet.setitem(ll_find, "interest_payamt", ldc_intpay)
		lds_payinslipdet.setitem(ll_find, "item_payamt", ldc_prnpay + ldc_intpay)
		lds_payinslipdet.setitem(ll_find, "item_balance", ldc_prnbal - ldc_prnpay)
			
	end if
		
	fetch data_cur into :ls_contclr, :ls_concoopid;
loop
close data_cur;

ls_xmlclrlon = string(lds_payinslipdet. describe ("Datawindow.data.XML"))

destroy lds_payinslipdet

return ls_xmlclrlon
end function

private function string of_initlnrcv_clrother (string as_memcoopid, string as_memno, string as_reqno, string as_sliptype, datetime adtm_opedate) throws Exception;string		ls_xmlclrother, ls_xmlclrshr, ls_xmlintfuture, ls_clrtype, ls_clrdesc, ls_vccode, ls_loantype, ls_itemdesc, ls_ccoopid, ls_contno
long		ll_count, ll_row
integer	li_buyshrflag, li_intfutureflag, li_nplflseq, li_contlaw
dec{2}	ldc_buyshramt, ldc_clramt, ldc_intarrcomp, ldc_mavamt,ldc_loanappamt
n_ds		lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

as_reqno		= trim( as_reqno )

// ถ้าไม่มีใบคำขอส่งเข้ามา
if as_reqno = "" or as_reqno = "CNV" or isnull( as_reqno ) then
	return ""
end if

// ดึงข้อมูลรายละเอียดคำขอกู้
select		loantype_code,loancontract_no,loanapprove_amt
into		:ls_loantype,:ls_contno, :ldc_loanappamt
from		lnreqloan
where	( loanrequest_docno	= :as_reqno ) and
			( coop_id					= :is_coopcontrol )
using		itr_sqlca ;
if itr_sqlca.sqlcode <> 0 then
	return ""
end if

lds_payinslipdet.reset()

// ถ้ามีการซื้อหุ้น
select		clrother_amt, clrother_desc
into		:ldc_buyshramt, :ls_clrdesc
from		lnreqloanclrother
where	( clrothertype_code 	= 'SHR' ) and
			( loanrequest_docno	= :as_reqno ) and
			( coop_id					= :is_coopcontrol ) and
			( clear_status			= 1 )
using		itr_sqlca ;

if ldc_buyshramt > 0 then

	ls_xmlclrshr	= this.of_initslippayin_share( as_memcoopid, as_memno, as_sliptype, adtm_opedate )

	ll_row		= lds_payinslipdet.importstring( XML!, ls_xmlclrshr )
	
	if ll_row > 0 then
		lds_payinslipdet.setitem( ll_row, "operate_flag", 1 )
//		lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_clrdesc )
		lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_buyshramt )
	end if
end if

// เอาใบคำขอไปดึงข้อมูลว่าตอนขอกู้จะหักอะไรเพิ่มเติมบ้าง
declare 	data_cur cursor for
select		lnreqloanclrother.clrothertype_code, lnreqloanclrother.clrother_desc,
			lnreqloanclrother.clrother_amt, slucfslipitemtype.slipitemtype_vcgrp
from		lnreqloanclrother, slucfslipitemtype
where	( lnreqloanclrother.clrothertype_code 	= slucfslipitemtype.slipitemtype_code ) and
			( lnreqloanclrother.loanrequest_docno	= :as_reqno ) and
			( lnreqloanclrother.coop_id					= :is_coopcontrol ) and
			( lnreqloanclrother.clrothertype_code 	<> 'SHR' ) and
			( lnreqloanclrother.clear_status				= 1 )
using		itr_sqlca ;

open data_cur ;
	fetch data_cur into :ls_clrtype, :ls_clrdesc, :ldc_clramt, :ls_vccode ;
	do while itr_sqlca.sqlcode = 0
		
		ll_row		= lds_payinslipdet.insertrow( 0 )
		
		lds_payinslipdet.setitem( ll_row, "operate_flag", 1 )
		lds_payinslipdet.setitem( ll_row, "slipitemtype_code", ls_clrtype )
		lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_clrdesc )
		lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_clramt )
		//wa pbn 59-10-15
		if ls_clrtype = "INT" then
			lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "LON" )
			lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_clrdesc )
			lds_payinslipdet.setitem( ll_row, "loancontract_no", ls_contno )
			lds_payinslipdet.setitem( ll_row, "concoop_id", is_coopcontrol )
			lds_payinslipdet.setitem( ll_row, "principal_payamt", 0 )
			lds_payinslipdet.setitem( ll_row, "interest_payamt", ldc_clramt )
			lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_clramt )
			lds_payinslipdet.setitem( ll_row, "item_balance", ldc_loanappamt )
			lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_loanappamt )
			lds_payinslipdet.setitem( ll_row, "stm_itemtype", 'LPX' )
			
		end if
		fetch data_cur into :ls_clrtype, :ls_clrdesc, :ldc_clramt, :ls_vccode ;
	loop
close data_cur ;

// เงินยืมทดรอง
declare adv_cur cursor for
select		follow_seq, description, mavset_bal, contlaw_status
from		lnnplfollowmaster
where	( coop_id				= :as_memcoopid )
and		( member_no		= :as_memno )
and		( mavset_bal		> 0 )
using		itr_sqlca ;

open adv_cur ;
fetch adv_cur into :li_nplflseq, :ls_itemdesc, :ldc_mavamt, :li_contlaw ;
do while itr_sqlca.sqlcode = 0
	ll_row		= lds_payinslipdet.insertrow( 0 )
	
	lds_payinslipdet.setitem( ll_row, "operate_flag", 1 )
	lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "MAV" )
	lds_payinslipdet.setitem( ll_row, "slipitem_desc", "เงินยืมทดรองคดี ( "+ls_itemdesc+" )" )
	lds_payinslipdet.setitem( ll_row, "bfcontlaw_status", li_contlaw )
	lds_payinslipdet.setitem( ll_row, "shrlontype_code", "00" )
	lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_mavamt )
	lds_payinslipdet.setitem( ll_row, "ref_docno", string( li_nplflseq ) )
	lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_mavamt )
	
	fetch adv_cur into :li_nplflseq, :ls_itemdesc, :ldc_mavamt, :li_contlaw ;
loop
close adv_cur ;

// ด/บ แขวน
declare intdata_cur cursor for
select		coop_id, loancontract_no, loantype_code, intcompound_arrear, contlaw_status
from		lncontmaster
where	( memcoop_id		= :as_memcoopid )
and		( member_no		= :as_memno )
and		( contract_status	> 0 )
and		( intcompound_arrear > 0 )
using		itr_sqlca ;

select		slipitemtype_desc
into		:ls_itemdesc
from		slucfslipitemtype
where	( slipitemtype_code		= 'IAR' )
using		itr_sqlca ;

open intdata_cur ;
fetch intdata_cur into :ls_ccoopid, :ls_contno, :ls_loantype, :ldc_intarrcomp, :li_contlaw ;

do while itr_sqlca.sqlcode = 0
	ll_row			= lds_payinslipdet.insertrow( 0 )
	
	lds_payinslipdet.setitem( ll_row, "operate_flag", 1 )
	lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_intarrcomp )
	lds_payinslipdet.setitem( ll_row, "bfcontlaw_status", li_contlaw )
	lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "IAR" )
	lds_payinslipdet.setitem( ll_row, "concoop_id", ls_ccoopid )
	lds_payinslipdet.setitem( ll_row, "loancontract_no", ls_contno )
	lds_payinslipdet.setitem( ll_row, "shrlontype_code", ls_loantype )
	lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_itemdesc )

	lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_intarrcomp )
	lds_payinslipdet.setitem( ll_row, "item_balance", 0 )

	fetch intdata_cur into :ls_ccoopid, :ls_contno, :ls_loantype, :ldc_intarrcomp, :li_contlaw ;
loop
close intdata_cur ;

ls_xmlclrother	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

return ls_xmlclrother
end function

private function integer of_initlnrcv_headcontno (string as_contno, datetime adtm_slipdate, datetime adtm_rcvdate, ref n_ds ads_payoutslip) throws Exception;string		ls_memno, ls_memcoopid, ls_reqdocno,ls_loantype
integer	li_lastperiodrcv, li_recvperiodflag, li_lnrcvfixflag,li_rcvperiod
long		ll_rowcont, ll_rowmem
dec{4}  ldc_recpercent
dec{2} ldc_maxrec,ldc_lnapproveamt,ldc_lnrcvamt
datetime	ldtm_lnrcvfixdate

// ดึงข้อมูลเงินกู้ที่จะรับเงิน
ll_rowcont	= ids_infocont.retrieve(is_coopcontrol ,as_contno)
if ll_rowcont <= 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลเลขที่สัญญาที่จะรับเงินกู้ได้ เลขที่สัญญา ("+as_contno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

ls_memno			= ids_infocont.getitemstring( ll_rowcont, "member_no" )
ls_memcoopid		= ids_infocont.getitemstring( ll_rowcont, "memcoop_id" )
li_lastperiodrcv		= ids_infocont.getitemnumber( ll_rowcont, "last_periodrcv" )
ldc_lnapproveamt  =  ids_infocont.object.loanapprove_amt[ 1 ]
ls_loantype =  ids_infocont.object.loantype_code[ 1 ]

if isnull( li_lastperiodrcv ) then li_lastperiodrcv = 0
li_rcvperiod = li_lastperiodrcv + 1
li_lastperiodrcv ++

if li_lastperiodrcv = 1 then
	ls_reqdocno		= ids_infocont.getitemstring( ll_rowcont, "loanrequest_docno" )
	
	if trim( ls_reqdocno ) <> "" and not( isnull( ls_reqdocno ) ) then
		select		loanrcvfix_flag, loanrcvfix_date
		into		:li_lnrcvfixflag, :ldtm_lnrcvfixdate
		from		lnreqloan
		where	( loanrequest_docno	= :ls_reqdocno ) and
					( memcoop_id					= :is_coopcontrol )//a edit coop_id =memcoop_id
		using		itr_sqlca  ;
		
		if isnull( li_lnrcvfixflag ) then li_lnrcvfixflag = 0
		
		if li_lnrcvfixflag = 1 and ldtm_lnrcvfixdate > adtm_slipdate then
			adtm_slipdate	= ldtm_lnrcvfixdate
			adtm_rcvdate	= ldtm_lnrcvfixdate
		end if
	end if	
end if

// ดึงข้อมูลรายละเอียดสมาชิก
ll_rowmem	= ids_infomemdet.retrieve( ls_memcoopid , ls_memno )
if ll_rowmem <= 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลสมาชิกที่ระบุในเลขที่สัญญาเงินกู้ได้ ("+ls_memno+") เลขที่สัญญา ("+as_contno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ใส่รายละเอียดข้อมูล
ads_payoutslip.reset()
ads_payoutslip.insertrow( 0 )

ads_payoutslip.setitem( 1, "coop_id", is_coopcontrol )
ads_payoutslip.setitem( 1, "member_no", ls_memno )
ads_payoutslip.setitem( 1, "memcoop_id", ls_memcoopid )
ads_payoutslip.setitem( 1, "sliptype_code", "LWD" )
ads_payoutslip.setitem( 1, "concoop_id", is_coopcontrol )
ads_payoutslip.setitem( 1, "loancontract_no", as_contno )
ads_payoutslip.setitem( 1, "rcv_period", li_lastperiodrcv )
ads_payoutslip.setitem( 1, "rcvperiod_flag", 0 )
ads_payoutslip.setitem( 1, "rcvfromreqcont_code", "CON" )

ads_payoutslip.setitem( 1, "slip_date", adtm_slipdate )
ads_payoutslip.setitem( 1, "operate_date", adtm_rcvdate )

// Clr ค่าตั้งต้น ด/บ ก่อนเสมอ
ads_payoutslip.setitem( 1, "prncalint_amt", 0 )
ads_payoutslip.setitem( 1, "interest_period", 0 )
//ads_payoutslip.setitem( 1, "calint_from", adtm_rcvdate )
ads_payoutslip.setitem( 1, "calint_from", adtm_slipdate )
ads_payoutslip.setitem( 1, "calint_to", adtm_slipdate )

ads_payoutslip.setitem( 1, "lnpayment_status", 1 )

ads_payoutslip.object.prename_desc[ 1 ]		= ids_infomemdet.object.prename_desc[ 1 ]
ads_payoutslip.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ 1 ]
ads_payoutslip.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ 1 ]
ads_payoutslip.object.membgroup_code[ 1 ]	= ids_infomemdet.object.membgroup_code[ 1 ]
ads_payoutslip.object.membgroup_desc[ 1 ]	= ids_infomemdet.object.membgroup_desc[ 1 ]
ads_payoutslip.object.member_type[ 1 ]			= ids_infomemdet.object.member_type[ 1 ]
ads_payoutslip.object.shrlontype_code[ 1 ]		= ids_infocont.object.loantype_code[ 1 ]
ads_payoutslip.object.loanrequest_docno[ 1 ]	= ids_infocont.object.loanrequest_docno[ 1 ]

ads_payoutslip.object.bfcontint_type[ 1 ]			= ids_infocont.object.int_continttype[ 1 ]
ads_payoutslip.object.bfperiod[ 1 ]				= ids_infocont.object.last_periodrcv[ 1 ]
ads_payoutslip.object.bfloanapprove_amt[ 1 ]	= ids_infocont.object.loanapprove_amt[ 1 ]
ads_payoutslip.object.bfshrcont_balamt[ 1 ]		= ids_infocont.object.principal_balance[ 1 ]
ads_payoutslip.object.bfwithdraw_amt[ 1 ]		= ids_infocont.object.withdrawable_amt[ 1 ]
ads_payoutslip.object.bfpayment_status[ 1 ]	= ids_infocont.object.payment_status[ 1 ]
ads_payoutslip.object.bflastcalint_date[ 1 ]		= ids_infocont.object.lastcalint_date[ 1 ]
ads_payoutslip.object.bflastreceive_date[ 1 ]	= ids_infocont.object.lastreceive_date[ 1 ]
ads_payoutslip.object.bflastproc_date[ 1 ]		= ids_infocont.object.lastprocess_date[ 1 ]
ads_payoutslip.object.bfinterest_arrear[ 1 ]		= ids_infocont.object.interest_arrear[ 1 ]
ads_payoutslip.object.bfcontlaw_status[ 1 ]		= ids_infocont.object.contlaw_status[ 1 ]

ads_payoutslip.object.period_payamt[ 1 ]		= ids_infocont.object.period_payamt[ 1 ]
ads_payoutslip.object.period_payment[ 1 ]		= ids_infocont.object.period_payment[ 1 ]

ads_payoutslip.object.payout_amt[ 1 ]			= ids_infocont.object.withdrawable_amt[ 1 ]

ads_payoutslip.object.moneytype_code[ 1 ]		= ids_infocont.object.expense_code[ 1 ]
ads_payoutslip.object.expense_bank[ 1 ]			= ids_infocont.object.expense_bank[ 1 ]
ads_payoutslip.object.expense_branch[ 1 ]		= ids_infocont.object.expense_branch[ 1 ]
ads_payoutslip.object.expense_accid[ 1 ]		= ids_infocont.object.expense_accid[ 1 ]

ads_payoutslip.object.cancel_bycoopid[ 1 ]		= ids_infocont.object.loanobjective_code[ 1 ] // ยืมมาใช้เก็บค่าวัตถุประสงค์




// ถ้าไม่ใช่งวดแรกส่งไปตั้ง ด/บ ค้าง
if li_lastperiodrcv > 1 then
	this.of_initlnrcv_headcalint( ads_payoutslip )
end if

return 1
end function

private function integer of_initlnrcv_headreqno (string as_reqno, datetime adtm_slipdate, datetime adtm_opedate, ref n_ds ads_payoutslip) throws Exception;string		ls_memno, ls_memcoopid, ls_loantype, ls_xmlhead, ls_expcode, ls_rcvdate, ls_fixdate
long		ll_rowreq, ll_rowmem
integer	li_lastperiodrcv, li_postfeeacc, li_fixrcvflag
dec{2}	ldc_apvamt, ldc_postagefee, ldc_postagesrv, ldc_emsfee, ldc_onlinefee, ldc_vatfee
datetime	ldtm_nulldate, ldtm_fixrcvdate

// Check argument
as_reqno		= trim( as_reqno )

if as_reqno = "" or as_reqno = "CNV" then
	ithw_exception.text	= "เลขที่ใบคำขอกู้ที่ส่งเข้ามาเป็นค่าว่าง (Null) กรุณาตรวจสอบ"
	throw ithw_exception
end if

setnull( ldtm_nulldate )

// ดึงข้อมูลเงินกู้ที่จะรับเงิน
ll_rowreq		= ids_inforeqloan.retrieve( is_coopcontrol, as_reqno )
if ll_rowreq <= 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลใบคำขอกู้ที่ระบุได้ เลขที่ใบคำขอกู้ ("+as_reqno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

ls_memno		= ids_inforeqloan.getitemstring( ll_rowreq, "member_no" )
ls_memcoopid	= ids_inforeqloan.getitemstring( ll_rowreq, "memcoop_id" )
ls_loantype		= ids_inforeqloan.getitemstring( ll_rowreq, "loantype_code" )
ls_expcode		= ids_inforeqloan.getitemstring( ll_rowreq, "expense_code" )
ldc_apvamt		= ids_inforeqloan.getitemdecimal( ll_rowreq, "loanapprove_amt" )
li_fixrcvflag		= ids_inforeqloan.getitemnumber( ll_rowreq, "loanrcvfix_flag" )
ldtm_fixrcvdate	= ids_inforeqloan.getitemdatetime( ll_rowreq, "loanrcvfix_date" )
li_lastperiodrcv	= 1

// ดึงข้อมูลรายละเอียดสมาชิก
ll_rowmem	= ids_infomemdet.retrieve( ls_memcoopid, ls_memno )

if ll_rowmem <= 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลสมาชิกที่ระบุในใบคำขอกู้ได้ ("+ls_memno+") เลขที่ใบคำขอกู้ ("+as_reqno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ถ้าระบุวันจ่ายถ้ามากกว่าวันทำการปรับวันที่ใบทำรายการให้เป็นไปตามคำขอ
if li_fixrcvflag = 1 and date( ldtm_fixrcvdate ) > date( adtm_slipdate ) then
	adtm_slipdate		= ldtm_fixrcvdate
	adtm_opedate		= ldtm_fixrcvdate
end if

// ใส่รายละเอียดข้อมูล
ads_payoutslip.reset()
ads_payoutslip.insertrow( 0 )

ads_payoutslip.setitem( 1, "coop_id", is_coopcontrol )
ads_payoutslip.setitem( 1, "member_no", ls_memno )
ads_payoutslip.setitem( 1, "memcoop_id", ls_memcoopid )
ads_payoutslip.setitem( 1, "sliptype_code", "LWD" )
ads_payoutslip.setitem( 1, "rcvfromreqcont_code", "REQ" )
ads_payoutslip.setitem( 1, "loanrequest_docno", as_reqno )
ads_payoutslip.setitem( 1, "rcvperiod_flag", 0 )
ads_payoutslip.setitem( 1, "rcv_period", li_lastperiodrcv )

ads_payoutslip.setitem( 1, "slip_date", adtm_slipdate )
ads_payoutslip.setitem( 1, "operate_date", adtm_opedate )

ads_payoutslip.object.prename_desc[ 1 ]		= ids_infomemdet.object.prename_desc[ 1 ]
ads_payoutslip.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ 1 ]
ads_payoutslip.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ 1 ]
ads_payoutslip.object.membgroup_code[ 1 ]	= ids_infomemdet.object.membgroup_code[ 1 ]
ads_payoutslip.object.membgroup_desc[ 1 ]	= ids_infomemdet.object.membgroup_desc[ 1 ]
ads_payoutslip.object.shrlontype_code[ 1 ]		= ids_inforeqloan.object.loantype_code[ 1 ]
ads_payoutslip.object.bfcontint_type[ 1 ]			= ids_inforeqloan.object.int_continttype[ 1 ]

ads_payoutslip.object.member_type[ 1 ]			= ids_infomemdet.object.member_type[ 1 ]

ads_payoutslip.object.moneytype_code[ 1 ]		= ids_inforeqloan.object.expense_code[ 1 ]
ads_payoutslip.object.expense_bank[ 1 ]			= ids_inforeqloan.object.expense_bank[ 1 ]
ads_payoutslip.object.expense_branch[ 1 ]		= ids_inforeqloan.object.expense_branch[ 1 ]
ads_payoutslip.object.expense_accid[ 1 ]		= ids_inforeqloan.object.expense_accid[ 1 ]

ads_payoutslip.object.bfperiod[ 1 ]				= 0
ads_payoutslip.object.bfshrcont_balamt[ 1 ]		= 0
ads_payoutslip.object.bfloanapprove_amt[ 1 ]	= ldc_apvamt
ads_payoutslip.object.bfwithdraw_amt[ 1 ]		= ldc_apvamt
ads_payoutslip.object.bfpayment_status[ 1 ]	= 1
ads_payoutslip.object.bflastcalint_date[ 1 ]		= ldtm_nulldate
ads_payoutslip.object.bflastreceive_date[ 1 ]	= ldtm_nulldate
ads_payoutslip.object.bflastproc_date[ 1 ]		= ldtm_nulldate
ads_payoutslip.object.bfinterest_arrear[ 1 ]		= 0
ads_payoutslip.object.bfcontlaw_status[ 1 ]		= 1
ads_payoutslip.object.period_payamt[ 1 ]		= ids_inforeqloan.object.period_payamt[ 1 ]
ads_payoutslip.object.period_payment[ 1 ]		= ids_inforeqloan.object.period_payment[ 1 ]

//by num เพื่ม เรื่องจ่ายคืนอื่น PEA จ่ายคืนกองทุน ถ้าที่อื่นก็ บวกเพิ่ม  
ads_payoutslip.object.returnetc_amt[ 1 ]			= ids_inforeqloan.object.wrtundret_amt[ 1 ]

// งวดแรกไม่มี ด/บ ค้าง
ads_payoutslip.setitem( 1, "prncalint_amt", 0 )
ads_payoutslip.setitem( 1, "interest_period", 0 )
//ads_payoutslip.setitem( 1, "calint_from", adtm_opedate )
ads_payoutslip.setitem( 1, "calint_from", adtm_slipdate )

// Set ยอดรับเงินไปก่อน
ads_payoutslip.setitem( 1, "payout_amt", ldc_apvamt )
ads_payoutslip.setitem( 1, "payoutclr_amt", 0 )
ads_payoutslip.setitem( 1, "payoutnet_amt", ldc_apvamt )

// ถ้าไม่มีการผ่านค่าธรรมเนียมไปบัญชีให้แสดงค่าธรรมเนียม
choose case ls_expcode
	case "CBT"
		ads_payoutslip.object.bankfee_amt[ 1 ]	= ids_inforeqloan.object.bankfee_amt[ 1 ]
		ads_payoutslip.object.banksrv_amt[ 1 ]	= ids_inforeqloan.object.banksrv_amt[ 1 ]
	case "MON", "MOO", "MOS"
		ldc_postagefee	= ids_inforeqloan.object.postagefee_amt[ 1 ]
		ldc_emsfee		= ids_inforeqloan.object.emsfee_amt[ 1 ]
		ldc_onlinefee	= ids_inforeqloan.object.onlinefee_amt[ 1 ]
		ldc_postagesrv	= ids_inforeqloan.object.postagesrv_amt[ 1 ]
		ldc_vatfee		= ids_inforeqloan.object.tax_amt[ 1 ]
		
		if isnull( ldc_postagefee ) then ldc_postagefee = 0
		if isnull( ldc_emsfee ) then ldc_emsfee = 0
		if isnull( ldc_onlinefee ) then ldc_onlinefee = 0
		if isnull( ldc_postagesrv ) then ldc_postagesrv = 0
		if isnull( ldc_vatfee ) then ldc_vatfee = 0
		
		ads_payoutslip.object.bankfee_amt[ 1 ]	= ldc_postagefee + ldc_emsfee + ldc_onlinefee + ldc_postagesrv
		ads_payoutslip.object.banksrv_amt[ 1 ]	= ldc_vatfee
end choose

return 1
end function

public function integer of_buildcontno_reqloan (string as_reqloan, ref string as_contno) throws Exception;/***********************************************************
<description>
	สำหรับสร้างสัญญาเงินกู้ที่มีที่มาจากคำขอกู้
</description>

<arguments>  
	as_reqloan			String		เลขที่ใบคำขอกู้เงิน
	as_contno{ref}		String		เลขที่สัญญาเงินกู้ที่ระบุมา
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งคำขอเข้ามา ถ้ามีเลขสัญญาที่กำหนดโดยผู้ใช้แล้วให้ส่งมาด้วย
	แต่ถ้าไม่มีเลขสัญญาส่งเข้ามา ระบบจะทำการสร้างเลขสัญญาให้อัตโนมัติ
	
	string		ls_reqloan, ls_contno
	
	ls_reqloan		= dw_example.getitemstring( 1, "loanrequest_docno" )
	ls_contno		= dw_example.getitemstring( 1, "loancontract_no" )
	
	lnv_lnoperate.of_buildcontno_reqloan( ls_reqloan, ls_contno )	
	หรือ	
	lnv_lnoperate.of_buildcontno_reqloan( ls_reqloan, "" )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_loantype, ls_statusdesc, ls_ecoopid
integer	li_continttype, li_inscollflag,li_intcertificate
dec{2}	ldc_lnreqamt

// argument check
if isnull( as_reqloan ) then as_reqloan = ""
if isnull( as_contno ) then as_contno = ""

as_reqloan		= trim( as_reqloan )
as_contno		= trim( as_contno )

// ตรวจสอบใบคำขอ
if as_reqloan = "" or as_reqloan = "CNV" then
	ithw_exception.text	= "เลขที่ใบคำขอไม่มีส่งมา หรือ เลขที่ส่งมาไม่ถูกต้อง "+as_reqloan
	return -1
end if

// รายละเอียดใบขอกู้
//by num แก้ entrybycoop_id เป็น coop_id
select		loantype_code, int_continttype, loanrequest_amt, coop_id
into		:ls_loantype, :li_continttype, :ldc_lnreqamt, :ls_ecoopid
from		lnreqloan
where	( coop_id					= :is_coopcontrol )
and		( loanrequest_docno	= :as_reqloan )
using		itr_sqlca ;

// ถ้าไม่มีเลขที่สัญญาส่งมาสร้างเอาใหม่
if trim( as_contno ) = "" then
	as_contno	= this.of_gennewcontractno( ls_ecoopid, ls_loantype )

	// ใส่ค่าเลขที่สัญญากลับไปที่ใบคำขอ
	update	lnreqloan
	set			loancontract_no	= :as_contno,
				loanrequest_amt	= :ldc_lnreqamt
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :as_reqloan )
	using		itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถใส่เลขที่สัญญาลงไปทีใบคำขอได้ "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

// สถานะสัญญาทำประกันหรือเปล่า
select		clearinsure_flag
into		:li_inscollflag
from		lnloantype
where	( loantype_code	= :ls_loantype ) and
			( coop_id				= :is_coopcontrol )
using		itr_sqlca ;

if li_inscollflag = 1 then
	ls_statusdesc	= "I"
end if

insert into lncontmaster
		( loancontract_no,			coop_id,				member_no,			memcoop_id,					loantype_code,				loanobjective_code,
		  loanrequest_docno,		loanrequest_amt,
		  loanapprove_date,		loanapprove_amt,	withdrawable_amt,	principal_balance,				loanpayment_type,
		  period_payamt,			period_payment,	period_lastpayment,	payment_status,
		  od_flag,					contlaw_status,		contract_status,		approve_id,						insurecoll_flag,
		  int_continttype,			int_contintrate,		int_continttabcode,	int_contintincrease,			int_intsteptype,
		  expense_code,			expense_bank,		expense_branch,		expense_accid,
		  loanpay_code,			loanpay_bank,		loanpay_branch,		loanpay_accid,
		  reqcoop_id,intcertificate_status,current_coopid )
		//by a coop_id=as_concoppid  
select	  :as_contno,				:is_coopcontrol,				lr.member_no,			lr.memcoop_id,					lr.loantype_code,				lr.loanobjective_code,
		  lr.loanrequest_docno,		lr.loanrequest_amt,
		  lr.approve_date,			lr.loanapprove_amt,	lr.loanapprove_amt,		0,									lr.loanpayment_type,
		  lr.period_payamt,			lr.period_payment,	lr.period_lastpayment,	1,
		  lr.od_flag,					1,						1,							lr.approve_id,						:li_inscollflag,
		  lr.int_continttype,			lr.int_contintrate,		lr.int_continttabcode,	lr.int_contintincrease,			lr.int_intsteptype,
		  lr.expense_code,			lr.expense_bank,		lr.expense_branch,		lr.expense_accid,
		  lr.loanpay_code,			lr.loanpay_bank,		lr.loanpay_branch,		lr.loanpay_accid,
		  lr.coop_id,lr.intcertificate_status,mb.current_coopid
from		lnreqloan lr join mbmembmaster mb on lr.member_no = mb.member_no 
where	( lr.loanrequest_docno	= :as_reqloan ) and
			( lr.coop_id								= :is_coopcontrol )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถผ่านรายการใบคำขอไปสร้างเป็นสัญญาได้ "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ถ้าเป็นสัญญาที่คิดดอกเบี้ยเป็นช่วง
if li_continttype = 3 then
	insert into lncontintspc
				( loancontract_no, 		coop_id,		seq_no, 		int_continttype, 		int_contintrate, 		int_continttabcode,		 int_contintincrease	, int_timetype,		 int_timeamt )
	select		:as_contno, 					:is_coopcontrol,		seq_no, 		int_continttype, 		int_contintrate, 		int_continttabcode, 		 int_contintincrease	, int_timetype,		 int_timeamt
	from		lnreqloanintspc
	where	( lnreqloanintspc.loanrequest_docno	= :as_reqloan )and
			( coop_id								= :is_coopcontrol )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถผ่านรายการใบคำขอไปสร้างเป็นสัญญาได้ (ส่วนของอัตราดอกเบี้ยพิเศษเป็นช่วง) "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

end if

// รายการค้ำประกัน
insert into lncontcoll
		( loancontract_no,		coop_id,				seq_no,			loancolltype_code,		refcoop_id,			ref_collno,		description,
		  collbase_amt,			collbase_percent,	collused_amt,	collbalance_amt,		collmax_amt,
		  collactive_amt,		collactive_percent,	coll_status )
select   :as_contno,			:is_coopcontrol,	seq_no,			loancolltype_code,		:is_coopcontrol,	ref_collno,		description,
		  collbase_amt,			collbase_percent,	collused_amt,	collbalance_amt,		collmax_amt,
		  collactive_amt,		collactive_percent,	1
from		lnreqloancoll
where	( loanrequest_docno	= :as_reqloan ) and
			( coop_id					= :is_coopcontrol )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถผ่านรายการหลักประกันในใบคำขอไปสร้างเป็นหลักประกันของสัญญาได้ "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

public function integer of_postslip_returnetc (n_ds ads_payoutslip) throws Exception;/*
of_postslip_returnetc

ads_payoutslip n_ds type datawindows 
*/
string		ls_member_no, ls_loan_no, ls_moneytype, ls_entryid, ls_doc_no
datetime	ldtm_operate, ldtm_entry
dec{2}	ldc_returnetc_amt, ldc_wrtdund_bal
long		ll_seq_no


ls_member_no 		= trim( ads_payoutslip.getitemstring( 1, "member_no" ) )
ls_loan_no			= trim( ads_payoutslip.getitemstring( 1, "loancontract_no" ) )
ldtm_operate		= ads_payoutslip.getitemdatetime( 1, "operate_date" )
ldc_returnetc_amt = ads_payoutslip.getitemdecimal( 1, "returnetc_amt" )
ls_moneytype		= trim( ads_payoutslip.getitemstring( 1, "moneytype_code" ) )
ls_entryid			= trim( ads_payoutslip.getitemstring( 1, "entry_id" ) )
ldtm_entry			= datetime( today(), now() )
ls_doc_no			= trim( ads_payoutslip.getitemstring( 1, "document_no" ) )

select 	wrtfund_balance
into		:ldc_wrtdund_bal
from 		mbmembmaster
where	member_no = :ls_member_no
and		coop_id		= :is_coopcontrol
using		itr_sqlca ;

select 	max( seq_no )
into		:ll_seq_no
from 		wrtfundstatement
where 	member_no = :ls_member_no
and		coop_id		= :is_coopcontrol
using		itr_sqlca ;


if isnull( ll_seq_no ) then ll_seq_no = 0
ll_seq_no++

if isnull( ldc_wrtdund_bal ) then ldc_wrtdund_bal = 0.00 

ldc_wrtdund_bal = ldc_wrtdund_bal - ldc_returnetc_amt

 
  INSERT INTO WRTFUNDSTATEMENT  
         (	COOP_ID,   				MEMBER_NO,   				SEQ_NO,   			OPERATE_DATE,   		WRTITEMTYPE_CODE,   
           	WRTFUND_AMT,   	WRTFUND_BALANCE,   	REF_CONTNO,   	MONEYTYPE_CODE,   		ITEM_STATUS,   
           	ENTRY_ID,   			ENTRY_DATE,   			REF_DOCNO )  
  VALUES 
  		( 	:is_coopcontrol,		:ls_member_no,			:ll_seq_no,			:ldtm_operate,				'RWT',
		  	:ldc_returnetc_amt,	:ldc_wrtdund_bal,			:ls_loan_no,		:ls_moneytype,			1,
			:ls_entryid,				:ldtm_entry,					:ls_doc_no	 )
	using		itr_sqlca ;
	
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "slippayout ไม่สามารถ เพิ่ม ข้อมูล ลง ตาราง กองทุนได้ # "+ls_loan_no+"~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

update mbmembmaster
set wrtfund_balance = :ldc_wrtdund_bal
where	member_no = :ls_member_no
and		coop_id		= :is_coopcontrol
using		itr_sqlca ;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "slippayout ไม่สามารถแก้ไขกองทุนของ mbmembmaster ได้# "+ls_member_no+"~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

public function integer of_postslip_payinreturnetc (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;/*
of_postslip_payinreturnetc

ads_payinslip		n_ds type 	datawindows slip
ads_payinslipdet 	n_ds type	datawindows slip det
*/
string		ls_memcoopid, ls_memno, ls_coopid, ls_contno, ls_slipitemtype, ls_moneytype, ls_entryid
string		ls_doc_no, ls_slipno
datetime	ldtm_operatedate, ldtm_entry
long		ll_count, ll_row, ll_seq_no
dec{2}	ldc_wrtfund_balabce, ldc_itempay
ldtm_entry			= datetime( today(), now() )
str_posttrans	lstr_posttrans

ls_slipno		= ads_payinslip.getitemstring( 1, "payinslip_no" )

ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code in ('MUT','ETC')" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_memno			= ads_payinslip.getitemstring( 1, "member_no" )
ls_coopid				= ads_payinslip.getitemstring( 1, "coop_id" )
ldtm_operatedate	= ads_payinslip.getitemdatetime( 1, "operate_date" )
ls_moneytype		= trim( ads_payinslip.getitemstring( 1, "moneytype_code" ) )
ls_entryid			= trim( ads_payinslip.getitemstring( 1, "entry_id" ) )
ls_doc_no			= trim( ads_payinslip.getitemstring( 1, "document_no" ) )

for ll_row = 1 to ll_count
	
	ls_contno			= ads_payinslipdet.getitemstring( ll_row, "loancontract_no" )
	ldc_itempay			= ads_payinslipdet.getitemdecimal( ll_row, "item_payamt" )
	ls_slipitemtype 		= trim( ads_payinslipdet.getitemstring( ll_row, "slipitemtype_code" ) )
	
	choose case ls_slipitemtype
		case 'MUT' //กองทุนกสสของ PEA
			select 	max( seq_no )
			into		:ll_seq_no
			from 		wrtfundstatement
			where 	member_no = :ls_memno
			and		coop_id		= :is_coopcontrol
			using		itr_sqlca ;
			
			if isnull( ll_seq_no ) then ll_seq_no = 0
			ll_seq_no++

			select 	wrtfund_balance
			into		:ldc_wrtfund_balabce
			from 		mbmembmaster
			where	member_no 	= :ls_memno
			and		coop_id			= :is_coopcontrol
			using		itr_sqlca ;
			
			if isnull( ldc_wrtfund_balabce ) then ldc_wrtfund_balabce = 0.00
			
			ldc_wrtfund_balabce = ldc_wrtfund_balabce + ldc_itempay
			
			INSERT INTO WRTFUNDSTATEMENT  
         	(	COOP_ID,   				MEMBER_NO,   				SEQ_NO,   			OPERATE_DATE,   		WRTITEMTYPE_CODE,   
           		WRTFUND_AMT,   	WRTFUND_BALANCE,   	REF_CONTNO,   	MONEYTYPE_CODE,   		ITEM_STATUS,   
           		ENTRY_ID,   			ENTRY_DATE,   			REF_DOCNO )  
		  	VALUES 
  			( 	:is_coopcontrol,		:ls_memno,					:ll_seq_no,				:ldtm_operatedate,	'PWT',
		  		:ldc_itempay,			:ldc_wrtfund_balabce,	:ls_contno,				:ls_moneytype,			1,
				:ls_entryid,				:ldtm_entry,					:ls_doc_no	 )
			using		itr_sqlca ;
				
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "slippayin ไม่สามารถ เพิ่ม ข้อมูล ลง ตาราง กองทุนได้ # "+ ls_contno +"~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if


	update mbmembmaster
	set wrtfund_balance = :ldc_wrtfund_balabce
	where 	member_no = :ls_memno
	and		coop_id		= :is_coopcontrol
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "slippayout ไม่สามารถแก้ไขกองทุนของ mbmembmaster ได้# "+ls_memno+"~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
			
	end choose
	
next

return 1
end function

private function integer of_postslip_payinetc (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string		ls_contno, ls_slipno, ls_moneytype, ls_refdocno, ls_memno, ls_docno
string		ls_mavtype, ls_sueno
long		ll_count, ll_index
dec{2}	ldc_mavpay
dec{2}	ldc_prnbal, ldc_itempayamt
dec		ldc_intarr, ldc_bfintcomparr, ldc_intcomparr
datetime	ldtm_slipdate, ldtm_opedate, ldtm_null
string		ls_entryid, ls_itemtype
str_poststmloan	lstr_lnstm
datetime ldtm_calintto,ldtm_entrydate
int			li_lastperiod
long		ll_laststm
	 
setnull( ldtm_null )

ls_slipno			= ads_payinslip.getitemstring( 1, "payinslip_no" )
ls_memno		= ads_payinslip.getitemstring( 1, "member_no" )
ls_docno			= ads_payinslip.getitemstring( 1, "document_no" )
ls_moneytype 	= ads_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_slipdate	= ads_payinslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate	= ads_payinslip.getitemdatetime( 1, "operate_date" )

// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code = 'FEE' and operate_flag = 1" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count > 0 then
	
	update	mbmembmaster
	set			firstfee_status = 1
	where	( coop_id			= :is_coopcontrol )
	and		( member_no	= :ls_memno )
	using		itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุงสถานะค่าธรรมเนียมแรกเข้าได้ "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code = 'MAV' and operate_flag = 1" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count > 0 then
	ls_memno			= ads_payinslip.getitemstring( 1, "member_no" )
	ls_slipno				= ads_payinslip.getitemstring( 1, "payinslip_no" )
	ls_refdocno			= ads_payinslip.getitemstring( 1, "document_no" )
	ls_moneytype		= ads_payinslip.getitemstring( 1, "moneytype_code" )
	ldtm_slipdate		= ads_payinslip.getitemdatetime( 1, "slip_date" )
	ldtm_opedate		= ads_payinslip.getitemdatetime( 1, "operate_date" )
	
	ls_entryid			= ads_payinslip.getitemstring( 1, "entry_id" )
	
	for ll_index = 1 to ll_count
		ls_mavtype		= ads_payinslipdet.getitemstring( ll_index, "stm_itemtype" )
		ls_sueno			= ads_payinslipdet.getitemstring( ll_index, "ref_docno" )
		ldc_mavpay		= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
	
		if ls_mavtype = "TRN" then
			update	lnnplsuemavcoll
			set			mavbal_amt = nvl( mavbal_amt, 0 ) - :ldc_mavpay
			where	( coop_id = :is_coopcontrol )
			and		( sue_no = :ls_sueno )
			and		( member_no = :ls_memno )
			using		itr_sqlca ;
		end if
		
		update	lnnplsue
		set			mavreal_bal		= nvl( mavreal_bal, 0 ) - :ldc_mavpay
		where	( coop_id = :is_coopcontrol )
		and		( sue_no = :ls_sueno )
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ไม่สามารถปรับปรุงเงินยืมทดลองได้ "+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
	next
end if

// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter( "slipitemtype_code = 'IAR' and operate_flag = 1" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count > 0 then
	for ll_index = 1 to ll_count
		ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
		ldc_itempayamt	= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
	
		select		principal_balance, interest_arrear, nvl( intcompound_arrear, 0 )
		into		:ldc_prnbal, :ldc_intarr, :ldc_bfintcomparr
		from		lncontmaster
		where	( coop_id				= :is_coopcontrol )
		and		( loancontract_no	= :ls_contno )
		using		itr_sqlca ;
		
		ldc_intcomparr		= ldc_bfintcomparr - ldc_itempayamt
		
		update	lncontmaster
		set			intcompound_arrear	= :ldc_intcomparr
		where	( coop_id				= :is_coopcontrol )
		and		( loancontract_no	= :ls_contno )
		using		itr_sqlca ;
	
		// บันทึกลง Statement
		lstr_lnstm.loancontract_no			= ls_contno
		lstr_lnstm.contcoop_id				= is_coopcontrol
		lstr_lnstm.slip_date					= ldtm_slipdate
		lstr_lnstm.operate_date				= ldtm_opedate
		lstr_lnstm.account_date				= ldtm_slipdate
		lstr_lnstm.intaccum_date				= ldtm_opedate
		lstr_lnstm.ref_slipno					= ls_slipno
		lstr_lnstm.ref_docno					= ls_docno
		lstr_lnstm.loanitemtype_code		= "LPI"
		lstr_lnstm.period						= 0
		lstr_lnstm.principal_payment		= 0
		lstr_lnstm.interest_payment			= ldc_itempayamt
		lstr_lnstm.principal_balance			= ldc_prnbal
		lstr_lnstm.prncalint_amt				= 0
		lstr_lnstm.calint_from					= ldtm_null
		lstr_lnstm.calint_to					= ldtm_null
		lstr_lnstm.bfinterest_arrear			= ldc_intarr
		lstr_lnstm.bfinterest_return			= 0
		lstr_lnstm.interest_period			= 0
		lstr_lnstm.interest_arrear			= ldc_intarr
		lstr_lnstm.interest_return			= 0
		lstr_lnstm.moneytype_code			= ls_moneytype
		lstr_lnstm.item_status				= 1
		lstr_lnstm.entry_id						= ls_entryid
		lstr_lnstm.entry_bycoopid			= is_coopid
	
		this.of_poststm_contract( lstr_lnstm )
	next
end if

// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter( "slipitemtype_code = 'SHP' and operate_flag = 1" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count > 0 then
	for ll_index = 1 to ll_count
		ls_itemtype			= ads_payinslipdet.getitemstring( ll_index, "shrlontype_code" )
		ldc_itempayamt	= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
		
		update  kprcvkeepother
		set item_payment = 0
		where member_no = :ls_memno and coop_id = :is_coopid using itr_sqlca;
		
	
	next
end if

//nungs เพิ่มการจัดการดอกเเบี้ยล่วงหน้าา
string ls_calint_date , ls_year , ls_month
ads_payinslipdet.setfilter( "" )//clear filter
ads_payinslipdet.filter()
ll_count = ads_payinslipdet.find("slipitemtype_code = 'LIF' and operate_flag = 1" ,1,ads_payinslipdet.rowcount());
if ll_count > 0 then
    ls_contno   		 = ads_payinslipdet.getitemstring( ll_count, "loancontract_no" )
    if isnull(ls_contno) or trim(ls_contno)='' then ls_contno   		 = is_appv_contno ;//nungs
    ldtm_opedate   	 = ads_payinslip.getitemdatetime( 1, "operate_date" )
    ldtm_slipdate   	 = ads_payinslip.getitemdatetime( 1, "slip_date" )
    ls_slipno   			 = ads_payinslip.getitemstring( 1, "payinslip_no" )
    ls_refdocno   		 = ads_payinslip.getitemstring( 1, "document_no" )
    ls_moneytype   	 = ads_payinslip.getitemstring( 1, "moneytype_code" )    
    ls_entryid   		 = ads_payinslip.getitemstring( 1, "entry_id" )
    ldtm_entrydate   	 = datetime( today(), now() )

    //if isnull(ls_contno) or trim(ls_contno)='' then continue;
    ldc_itempayamt    = ads_payinslipdet.getitemdecimal( ll_count, "item_payamt" )
    
    select   	 last_periodpay, principal_balance, interest_arrear, nvl( intcompound_arrear, 0 ), last_stm_no
    into   	 :li_lastperiod, :ldc_prnbal, :ldc_intarr, :ldc_bfintcomparr, :ll_laststm
    from   	 lncontmaster
    where    ( coop_id   			 = :is_coopcontrol )
    and   	 ( loancontract_no    = :ls_contno )
    using   	 itr_sqlca ;
    
    ll_laststm   		 = ll_laststm + 1
    ls_year = String(year(date(ldtm_opedate)))
    ls_month = String(month(date(ldtm_opedate)))
    
    select lastworkdate
   	 into :ls_calint_date
   	 from amworkcalendar
    where year =:ls_year and    month = :ls_month
    using   	 itr_sqlca ;   	 
    
    ldtm_calintto = datetime(date(ls_calint_date+"/"+ls_month+"/"+ls_year))
    update    lncontmaster
    set   		 last_stm_no   			 = :ll_laststm   	 ,   		 
   			 lastcalint_date    		 =:ldtm_calintto
    where    ( coop_id   			 = :is_coopcontrol )
    and   	 ( loancontract_no    = :ls_contno )
    using   	 itr_sqlca ;
    
    // เพิ่มรายการเคลื่อนไหว
    insert into lncontstatement
   		 ( coop_id,   			 loancontract_no,   	 seq_no,   		 slip_date,   			 operate_date,   	 ref_docno,
   		   loanitemtype_code,    period,   	      principal_payment,    interest_payment,    principal_balance,
   		   calint_from,   		 calint_to,   		 bfintarrear_amt,   	 interest_period,    interest_arrear,   	 intcomparr_bal,
   		   interest_return,   	 entry_id,   		 entry_date,    ref_slipno ,
   		   moneytype_code,    item_status,   	 prncalint_amt )
    values ( :is_coopcontrol,   	 :ls_contno,   		 :ll_laststm,   	 :ldtm_slipdate,   		 :ldtm_opedate,   	 :ls_refdocno,
   		   'LIF',   					 :li_lastperiod,    0,   						 :ldc_itempayamt,    :ldc_prnbal,
   		   :ldtm_opedate,   	 :ldtm_calintto,    0,   			 0,   					 0,   			 0,
   		   0,   					 :ls_entryid,   	 :ldtm_entrydate, :ls_slipno,
   		   :ls_moneytype,   	 1,   				 0 )
    using   	 itr_sqlca ;
    if itr_sqlca.sqlcode <> 0 then
   	 ithw_exception.text    += "ไม่สามารถเพิ่มรายการเคลื่อนไหวให้สัญญาเงินกู้-รายการดอกเบี้ยล่วงหน้า "+itr_sqlca.sqlerrtext
   	 throw ithw_exception
    end if
end if

// ตรวจสอบว่ามีการชำระเบี้ยปรับมั้ย
ll_index	= ads_payinslipdet.Find("slipitemtype_code = 'INM' and operate_flag = 1",1,ads_payinslipdet.RowCount() )
if ll_index > 0 then
	ls_refdocno	= ads_payinslip.GetItemString(1,"ref_slipno")
	
	update kpmastreceive
	set lastfine_date = :ldtm_opedate
	where coop_id = :is_coopcontrol
	and kpslip_no = :ls_refdocno
	using itr_sqlca ;
end if

return 1
end function

public function integer of_saveset_intarrear (string as_xmlsetint, string as_entryid) throws Exception;string		ls_ccoopid, ls_contno, ls_setintdocno
long		ll_count, ll_index
dec{2}	ldc_intarrset
boolean	lb_error = false
datetime	ldtm_bfcalint, ldtm_calintto, ldtm_entrydate
n_ds		lds_main

ldtm_entrydate		= datetime( today(), now() )

// ส่วน Header
lds_main		= create n_ds
lds_main.dataobject	= "d_loansrv_set_intarrear"
lds_main.settransobject( itr_sqlca )

// Import ข้อมูล
try
	this.of_setsrvdwxmlie( true )
	inv_dwxmliesrv.of_xmlimport( lds_main, as_xmlsetint )

catch( Exception lthw_errimp )
	ithw_exception.text	= lthw_errimp.text
	lb_error					= true
end try

if lb_error then goto objdestroy

ll_count	= lds_main.rowcount()
if ll_count <= 0 then
	ithw_exception.text	= "ไม่มีข้อมูลที่จะทำการตั้งดอกเบี้ยค้าง กรุณาตรวจสอบ"
	lb_error					= true
	goto objdestroy
end if

ls_ccoopid			= trim( lds_main.getitemstring( 1, "concoop_id" ) )
ls_contno			= trim( lds_main.getitemstring( 1, "loancontract_no" ) )
ldtm_bfcalint		= lds_main.getitemdatetime( 1, "bflastcalint_date" )
ldtm_calintto		= lds_main.getitemdatetime( 1, "intarrset_caldate" )

ldc_intarrset			= lds_main.getitemdecimal( 1, "intarrset_amt" )

// Validate ข้อมูล
if ls_contno = "" or isnull( ls_contno ) then
	ithw_exception.text	= "ไม่มีข้อมูลสัญญาที่ี่จะทำการตั้งดอกเบี้ยค้าง กรุณาตรวจสอบ"
	lb_error					= true
	goto objdestroy
end if

// ตรวจสอบสถานะว่ามีการเปลี่ยนหรือเปล่า
if ldtm_calintto <= ldtm_bfcalint then
	ithw_exception.text	= "ไม่มีการตั้งดอกเบี้ยค้าง ( วันที่ต้องการตั้งมีค่าไม่มากกว่าวันที่คิดดอกเบี้ยล่าสุด ) กรุณาตรวจสอบ"
	lb_error					= true
	goto objdestroy
end if

// ขอเลขที่เอกสาร
this.of_setsrvdoccontrol( true )

try
	ls_setintdocno		= inv_docsrv.of_getnewdocno( is_coopcontrol, "LNSETINTARREAR" )
catch( Exception lthw_errdoc )
	ithw_exception.text	= lthw_errdoc.text
	lb_error					= true
end try

if lb_error then goto objdestroy

// ให้ค่าเลขที่เอกสาร
lds_main.setitem( 1, "coop_id", is_coopcontrol )
lds_main.setitem( 1, "intarrset_docno", ls_setintdocno )
lds_main.setitem( 1, "entry_id", as_entryid )
lds_main.setitem( 1, "entry_bycoopid", is_coopid )
lds_main.setitem( 1, "entry_date", ldtm_entrydate )

// -----------------------
// เริ่มกระบวนการบันทึก
// -----------------------
// บันทึก Master
if lds_main.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลการขอตั้งดอกเบี้ยค้าง ( IntArrearSet Master) ไม่ได้  "
	ithw_exception.text	+= ls_setintdocno +"  "+ lds_main.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// เริ่มทำการปรับปรุงสัญญา
update	lncontmaster
set			interest_arrear	= nvl( interest_arrear, 0 ) + :ldc_intarrset,
			lastcalint_date	= :ldtm_calintto
where	( coop_id			= :ls_ccoopid ) and
			( loancontract_no	= :ls_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ปรับปรุงข้อมูลการตั้งดอกเบี้ยค้างชำระไม่ได้ เลขสัญญา "+ls_contno +" ("+ls_ccoopid+")"
	ithw_exception.text	+= itr_sqlca.sqlerrtext
	lb_error					= true
	goto objdestroy
end if

objdestroy:
this.of_setsrvdwxmlie( false )
destroy lds_main

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function decimal of_calinterest (string as_ccoopid, string as_contno, decimal adc_prncalint, datetime adtm_calintfrom, datetime adtm_calintto) throws Exception;dec		ldc_intamt
boolean	lb_error = false

try
	this.of_setsrvlninterest( true )
	ldc_intamt		= inv_intsrv.of_computeinterest( as_ccoopid, as_contno, adc_prncalint, adtm_calintfrom, adtm_calintto )
catch( Exception lthw_error )
	ithw_exception.text	= lthw_error.text
	lb_error					= false
end try

this.of_setsrvlninterest( false )

if lb_error then
	throw ithw_exception
end if

return ldc_intamt
end function

public function integer of_initslippayout (ref str_slippayout astr_initpayout) throws Exception;string		ls_sliptype

ls_sliptype		= astr_initpayout.sliptype_code

choose case ls_sliptype
	case "LRT"
	case "MAV"
		this.of_initslippayout_mav( astr_initpayout )
end choose

return 1
end function

private function integer of_postslip_payoutmav (n_ds ads_payoutslip, n_ds ads_payoutslipdet) throws Exception;string		ls_mcoopid, ls_memno, ls_slipno
string		ls_entryid
long		ll_row, ll_index, ll_count
integer	li_nplflseqno
dec{2}	ldc_mavpay
datetime	ldtm_entrydate

// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payoutslipdet.setfilter( "slipitemtype_code = 'MAV' and operate_flag = 1" )
ads_payoutslipdet.filter()

ls_slipno			= trim( ads_payoutslip.getitemstring( 1, "payoutslip_no" ) )
ls_mcoopid		= trim( ads_payoutslip.getitemstring( 1, "memcoop_id" ) )
ls_memno		= trim( ads_payoutslip.getitemstring( 1, "member_no" ) )

ls_entryid		= ads_payoutslip.getitemstring( 1, "entry_id" )
ldtm_entrydate	= datetime( today(), now() )

ll_count		= ads_payoutslipdet.rowcount()

if ll_count <= 0 then
	return 0
end if

for ll_index = 1 to ll_count
	li_nplflseqno			= integer( ads_payoutslipdet.getitemstring( ll_index, "ref_docno" ) )
	ldc_mavpay			= ads_payoutslipdet.getitemdecimal( ll_index, "item_payamt" )
	
	update	lnnplfollowmaster
	set			mavset_bal		= nvl( mavset_bal, 0 ) + :ldc_mavpay
	where	( coop_id			= :ls_mcoopid )
	and		( member_no	= :ls_memno )
	and		( follow_seq		= :li_nplflseqno )
	using		itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุงเงินยืมทดลองได้ "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
next
	
return 1
end function

protected function integer of_initslippayout_mav (ref str_slippayout astr_initpayout) throws Exception;string		ls_memno, ls_itemdesc, ls_prename, ls_memname, ls_memsurn, ls_mbgrpcode, ls_mbgrpdesc
integer	li_nplflseq, li_contlaw
long		ll_rowcont, ll_rowmem, ll_index, ll_rowadd
dec{2}	ldc_mavamt
datetime	ldtm_slipdate, ldtm_rcvdate
n_ds		lds_payoutslip, lds_payoutslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= "d_loansrv_lnpayout_moneyret"
lds_payoutslip.settransobject( itr_sqlca )

lds_payoutslipdet	= create n_ds
lds_payoutslipdet.dataobject	= "d_loansrv_lnpayout_slipdet"
lds_payoutslipdet.settransobject( itr_sqlca )

ls_memno		= astr_initpayout.member_no
ldtm_slipdate	= astr_initpayout.slip_date
ldtm_rcvdate	= astr_initpayout.operate_date

astr_initpayout.xml_sliphead	= ""
astr_initpayout.xml_slipdet		= ""

declare data_cur cursor for
select		follow_seq, description, mavset_bal, contlaw_status
from		lnnplfollowmaster
where	( coop_id				= :is_coopcontrol )
and		( member_no		= :ls_memno )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :li_nplflseq, :ls_itemdesc, :ldc_mavamt, :li_contlaw ;
do while itr_sqlca.sqlcode = 0
	ll_rowadd	= lds_payoutslipdet.insertrow( 0 )
	
	lds_payoutslipdet.setitem( ll_rowadd, "operate_flag", 0 )
	lds_payoutslipdet.setitem( ll_rowadd, "slipitemtype_code", "MAV" )
	lds_payoutslipdet.setitem( ll_rowadd, "seq_no", ll_index )
	lds_payoutslipdet.setitem( ll_rowadd, "slipitem_desc", "เงินยืมทดรองคดี ( "+ls_itemdesc+" )" )
	lds_payoutslipdet.setitem( ll_rowadd, "bfcontlaw_status", li_contlaw )
	lds_payoutslipdet.setitem( ll_rowadd, "shrlontype_code", "00" )
	lds_payoutslipdet.setitem( ll_rowadd, "bfshrcont_balamt", ldc_mavamt )
	lds_payoutslipdet.setitem( ll_rowadd, "ref_docno", string( li_nplflseq ) )

	fetch data_cur into :li_nplflseq, :ls_itemdesc, :ldc_mavamt, :li_contlaw ;
loop

// ดึงข้อมูลเงินกู้ที่มียอดเงินคืน
ll_rowcont	= lds_payoutslipdet.rowcount()
if ll_rowcont <= 0 then
	ithw_exception.text	= "สมาชิกคนนี้ไม่มีรายการติดตามหนี้ กรุณาตรวจสอบ"
	
	destroy lds_payoutslip
	destroy lds_payoutslipdet
	
	throw ithw_exception
end if

// ดึงข้อมูลรายละเอียดสมาชิก
select		mpre.prename_desc, mb.memb_name, mb.memb_surname,
			mb.membgroup_code, mgrp.membgroup_desc
into		:ls_prename, :ls_memname, :ls_memsurn, :ls_mbgrpcode, :ls_mbgrpdesc
from		mbmembmaster mb, mbucfprename mpre, mbucfmembgroup mgrp
where	( mb.prename_code		= mpre.prename_code )
and		( mb.coop_id				= mgrp.coop_id )
and		( mb.membgroup_code	= mgrp.membgroup_code )
and		( mb.coop_id				= :is_coopcontrol )
and		( mb.member_no			= :ls_memno )
using		itr_sqlca ;

ll_rowmem	= ids_infomemdet.retrieve( ls_memno )

// ใส่ข้อมูลเงินคืน
lds_payoutslip.insertrow( 0 )

lds_payoutslip.setitem( 1, "memcoop_id", is_coopcontrol )
lds_payoutslip.setitem( 1, "member_no", ls_memno )
lds_payoutslip.setitem( 1, "sliptype_code", "MAV" )
lds_payoutslip.setitem( 1, "rcv_period", 0 )
lds_payoutslip.setitem( 1, "rcvperiod_flag", 0 )

lds_payoutslip.setitem( 1, "slip_date", ldtm_slipdate )
lds_payoutslip.setitem( 1, "operate_date", ldtm_rcvdate )

lds_payoutslip.setitem( 1, "prename_desc", ls_prename )
lds_payoutslip.setitem( 1, "memb_name", ls_memname )
lds_payoutslip.setitem( 1, "memb_surname", ls_memsurn )
lds_payoutslip.setitem( 1, "membgroup_code", ls_mbgrpcode )
lds_payoutslip.setitem( 1, "membgroup_desc", ls_mbgrpdesc )

lds_payoutslip.setitem( 1, "payout_amt", 0 )
lds_payoutslip.setitem( 1, "payoutclr_amt", 0 )
lds_payoutslip.setitem( 1, "payoutnet_amt", 0 )

// Export ข้อมูลเพื่อให้ได้ค่าสุดท้าย
astr_initpayout.xml_sliphead	= string( lds_payoutslip.describe( "Datawindow.data.XML" ) )
astr_initpayout.xml_slipdet		= string( lds_payoutslipdet.describe( "Datawindow.data.XML" ) )

destroy lds_payoutslip
destroy lds_payoutslipdet

return 1
end function

public function integer of_initslipmoneyret (ref str_slippayout astr_initpayout) throws Exception;/***********************************************************
<description>
	สำหรับ Init ค่าเงินต้นหรือดอกเบี้ยที่รับชำระเกิน เพื่อคืนเงินให้สมาชิก
</description>

<arguments> 
	str_slippayout		Structure รายการ Slip จ่าย
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String			ทะเบียนสมาชิก
		- slip_date				datetime		วันที่ Slip
		- operate_date			String			วันที่จ่ายเงินกู้
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะ Generate XML Slip เงินที่ต้องจ่ายคืนให้สมาชิก
	XML รายละเอียดของสัญญาไหนที่คืนบ้าง
	
	str_slippayout		lstr_slippayout
	
	lstr_slippayout.member_no		= dw_main.getitemstring( ll_row, "member_no" )
	lstr_slippayout.slip_date			= system_date
	lstr_slippayout.operate_date	= system_date
	
	lnv_lnoperate.of_initslipmoneyret( lstr_slippayout )
	
	dw_slippayout.reset()
	dw_slippayout.importstring( XML!, lstr_slippayout.xml_sliphead )
	
	dw_slippaydet.reset()
	dw_slippaydet.importstring( XML!, lstr_slippayout.xml_slipdet )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno
long		ll_rowcont, ll_rowmem, ll_index, ll_rowadd
dec{2}	ldc_lnrcvamt, ldc_lnrcvclr, ldc_lnrcvnet
dec{2}	ldc_prnret, ldc_intret, ldc_prnbal
datetime	ldtm_slipdate, ldtm_rcvdate
n_ds		lds_inforet
n_ds		lds_payoutslip, lds_payoutslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP
lds_payoutslip.settransobject( itr_sqlca )

lds_payoutslipdet	= create n_ds
lds_payoutslipdet.dataobject	= "d_loansrv_lnpayout_slipdet"
lds_payoutslipdet.settransobject( itr_sqlca )

ls_memno		= astr_initpayout.member_no
ldtm_slipdate	= astr_initpayout.slip_date
ldtm_rcvdate	= astr_initpayout.operate_date

astr_initpayout.xml_sliphead	= ""
astr_initpayout.xml_slipdet		= ""
astr_initpayout.xml_slipcutlon	= ""
astr_initpayout.xml_slipcutetc	= ""

lds_inforet	= create n_ds
lds_inforet.dataobject		= "d_loansrv_info_contmoneyreturn"
lds_inforet.settransobject( itr_sqlca )

// ดึงข้อมูลเงินกู้ที่มียอดเงินคืน
ll_rowcont	= lds_inforet.retrieve( ls_memno )
if ll_rowcont <= 0 then
	ithw_exception.text	= "สมาชิกคนนี้ไม่มีรายการเงินทีจะทำการคืน กรุณาตรวจสอบ"
	throw ithw_exception
end if

for ll_index = 1 to ll_rowcont
	ldc_prnbal	= lds_inforet.getitemdecimal( ll_index, "principal_balance" )
	ldc_intret		= lds_inforet.getitemdecimal( ll_index, "interest_return" )
	
	if isnull( ldc_intret ) then ldc_intret = 0
	
	if ldc_prnbal < 0 then
		ldc_prnret	= abs( ldc_prnbal )
	end if
	
	ll_rowadd	= lds_payoutslipdet.insertrow( 0 )
	
	lds_payoutslipdet.setitem( ll_rowadd, "operate_flag", 1 )
	lds_payoutslipdet.setitem( ll_rowadd, "slipitemtype_code", "LON" )
	lds_payoutslipdet.setitem( ll_rowadd, "seq_no", ll_index )
	lds_payoutslipdet.setitem( ll_rowadd, "slipitem_desc", "จ่ายคืนด/บ เก็บเกิน" )
	lds_payoutslipdet.setitem( ll_rowadd, "principal_payamt", ldc_prnret )
	lds_payoutslipdet.setitem( ll_rowadd, "interest_payamt", ldc_intret )
	lds_payoutslipdet.setitem( ll_rowadd, "item_payamt", ldc_prnret + ldc_intret )
	
	lds_payoutslipdet.setitem( ll_rowadd, "bfprnret_amt", ldc_prnret )
	lds_payoutslipdet.setitem( ll_rowadd, "bfintret_amt", ldc_intret )
	
	lds_payoutslipdet.object.loancontract_no[ ll_rowadd ]	= lds_inforet.object.loancontract_no[ ll_index ]
	lds_payoutslipdet.object.shrlontype_code[ ll_rowadd ]	= lds_inforet.object.loantype_code[ ll_index ]
next

// ดึงข้อมูลรายละเอียดสมาชิก
ll_rowmem	= ids_infomemdet.retrieve( ls_memno )

// ใส่ข้อมูลเงินคืน
lds_payoutslip.insertrow( 0 )

lds_payoutslip.setitem( 1, "member_no", ls_memno )
lds_payoutslip.setitem( 1, "sliptype_code", "LRT" )
lds_payoutslip.setitem( 1, "rcv_period", 0 )
lds_payoutslip.setitem( 1, "rcvperiod_flag", 0 )

lds_payoutslip.setitem( 1, "slip_date", ldtm_slipdate )
lds_payoutslip.setitem( 1, "operate_date", ldtm_rcvdate )

lds_payoutslip.object.prename_desc[ 1 ]			= ids_infomemdet.object.prename_desc[ 1 ]
lds_payoutslip.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ 1 ]
lds_payoutslip.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ 1 ]
lds_payoutslip.object.membgroup_code[ 1 ]		= ids_infomemdet.object.membgroup_code[ 1 ]
lds_payoutslip.object.membgroup_desc[ 1 ]		= ids_infomemdet.object.membgroup_desc[ 1 ]

ldc_lnrcvamt	= dec( lds_payoutslipdet.describe( "evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', 1 )" ) )
ldc_lnrcvclr		= 0
ldc_lnrcvnet		= ldc_lnrcvamt - ldc_lnrcvclr

lds_payoutslip.setitem( 1, "payout_amt", ldc_lnrcvamt )
lds_payoutslip.setitem( 1, "payoutclr_amt", ldc_lnrcvclr )
lds_payoutslip.setitem( 1, "payoutnet_amt", ldc_lnrcvnet )

// Export ข้อมูลเพื่อให้ได้ค่าสุดท้าย
astr_initpayout.xml_sliphead	= string( lds_payoutslip.describe( "Datawindow.data.XML" ) )
astr_initpayout.xml_slipdet		= string( lds_payoutslipdet.describe( "Datawindow.data.XML" ) )

return 1
end function

private function integer of_postccl_payinetc (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string		ls_slipno, ls_memno
string		ls_docno, ls_moneytype, ls_sliptype
string		ls_contno
string		ls_cancelid
datetime ldtm_canceldate, ldtm_slipdate, ldtm_opedate
dec		ldc_itempay, ldc_prnbal, ldc_intarr
integer	li_count, li_index
datetime	ldtm_null
str_poststmloan	lstr_lnstm

setnull( ldtm_null )

// รับรายการที่ต้องการยกเลิก
ls_slipno			= ads_payinslip.getitemstring( 1, "payinslip_no" )
ls_memno	 	= ads_payinslip.getitemstring( 1, "member_no" )
ls_sliptype		= ads_payinslip.getitemstring( 1, "sliptype_code" )
ls_docno			= ads_payinslip.getitemstring( 1, "document_no" )
ls_moneytype 	= ads_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_slipdate	= ads_payinslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate	= ads_payinslip.getitemdatetime( 1, "operate_date" )

ls_cancelid			= ads_payinslip.getitemstring( 1, "cancel_id" )
ldtm_canceldate	= ads_payinslip.getitemdatetime( 1, "cancel_date" )

// ยกเลิกรายการค่าธรรมเนียมก่อน
ads_payinslipdet.setfilter( "slipitemtype_code = 'FEE'" )
ads_payinslipdet.filter()

li_count		= ads_payinslipdet.rowcount()

if li_count > 0 then
	// บันทึกสถานะการจ่ายใน member
	update	mbmembmaster
	set			firstfee_status	= 0
	where	( coop_id		= :is_coopcontrol )
	and		( member_no	= :ls_memno )
	using		itr_sqlca ;
end if

// ยกเลิกรายการเงินยืมทดรอง
ads_payinslipdet.setfilter( "slipitemtype_code = 'MAV'" )
ads_payinslipdet.filter()

li_count		= ads_payinslipdet.rowcount()

if li_count > 0 then
	
end if

// ยกเลิกรายการดอกเบี้ยแขวน
ads_payinslipdet.setfilter( "slipitemtype_code = 'IAR'" )
ads_payinslipdet.filter()

li_count		= ads_payinslipdet.rowcount()

for li_index = 1 to li_count
	ls_contno	= ads_payinslipdet.getitemstring( li_index, "loancontract_no" )
	ldc_itempay	= ads_payinslipdet.getitemdecimal( li_index, "item_payamt" )
	
	select		principal_balance, interest_arrear
	into		:ldc_prnbal, :ldc_intarr
	from		lncontmaster
	where	( coop_id		= :is_coopcontrol )
	and		( loancontract_no	= :ls_contno )
	using		itr_sqlca ;
	
	update	lncontmaster
	set			intcompound_arrear	= nvl( intcompound_arrear, 0 )+:ldc_itempay
	where	( coop_id		= :is_coopcontrol )
	and		( loancontract_no	= :ls_contno )
	using		itr_sqlca ;

	// บันทึกลง Statement
	lstr_lnstm.loancontract_no			= ls_contno
	lstr_lnstm.contcoop_id				= is_coopcontrol
	lstr_lnstm.slip_date					= ldtm_slipdate
	lstr_lnstm.operate_date				= ldtm_canceldate
	lstr_lnstm.account_date				= ldtm_canceldate
	lstr_lnstm.intaccum_date				= ldtm_opedate
	lstr_lnstm.ref_slipno					= ls_slipno
	lstr_lnstm.ref_docno					= ls_docno
	lstr_lnstm.loanitemtype_code		= "RPI"
	lstr_lnstm.period						= 0
	lstr_lnstm.principal_payment		= 0
	lstr_lnstm.interest_payment			= ldc_itempay
	lstr_lnstm.principal_balance			= ldc_prnbal
	lstr_lnstm.prncalint_amt				= 0
	lstr_lnstm.calint_from					= ldtm_null
	lstr_lnstm.calint_to					= ldtm_null
	lstr_lnstm.bfinterest_arrear			= ldc_intarr
	lstr_lnstm.bfinterest_return			= 0
	lstr_lnstm.interest_period			= 0
	lstr_lnstm.interest_arrear			= ldc_intarr
	lstr_lnstm.interest_return			= 0
	lstr_lnstm.moneytype_code			= ls_moneytype
	lstr_lnstm.item_status				= -9
	lstr_lnstm.entry_id						= ls_cancelid
	lstr_lnstm.entry_bycoopid			= is_coopid

	this.of_poststm_contract( lstr_lnstm )

next

return 1
end function

private function string of_getcalintcontintspc (string as_contno, datetime adtm_rcvdate, datetime adtm_procdate) throws Exception;string			ls_xmlintspc
long			ll_row, ll_index, ll_count
integer		li_continttype, li_timetype, li_timeamt
datetime		ldtm_effdate
n_ds	lds_contintspc

ls_xmlintspc	= ""

lds_contintspc	= create n_ds
lds_contintspc.dataobject	= "d_loansrv_info_contintspc"
lds_contintspc.settransobject( itr_sqlca )

ll_count	= lds_contintspc.retrieve( is_coopcontrol, as_contno, adtm_procdate )

if ll_count <= 0 then
	destroy( lds_contintspc )
	return ls_xmlintspc
end if

ldtm_effdate	= adtm_rcvdate

this.of_setsrvdatetime( true )
	
for ll_index = 1 to ll_count
	ll_row		= lds_contintspc.insertrow( 0 )
	
	lds_contintspc.setitem( ll_row, "effective_date", ldtm_effdate )
	
	li_timetype		= lds_contintspc.getitemnumber( ll_index, "int_timetype" )
	li_timeamt		= lds_contintspc.getitemnumber( ll_index, "int_timeamt" )
	
	// ทำของอันถัดไป
	// ประเภทการนับวัน 1=ชนวัน 2=ชนเดือน
	if li_timetype = 2 then
		ldtm_effdate	= datetime( inv_datetimesrv.of_lastdayofmonth( date( ldtm_effdate ) ) )
	end if
	
	ldtm_effdate	= datetime( inv_datetimesrv.of_relativemonth( date( ldtm_effdate ), li_timeamt ) )
next

if lds_contintspc.rowcount() > 0 then
	ls_xmlintspc		= string( lds_contintspc.describe( "Datawindow.data.XML" ) )
end if

destroy( lds_contintspc )

this.of_setsrvdatetime( false )

return ls_xmlintspc
end function

private function string of_getcalintreqintspc (string as_reqno, datetime adtm_rcvdate) throws Exception;string			ls_xmlintspc
long			ll_row, ll_index, ll_count
integer		li_continttype, li_timetype, li_timeamt
datetime		ldtm_effdate
n_ds	lds_contintspc, lds_reqintspc

ls_xmlintspc	= ""

lds_reqintspc	= create n_ds
lds_reqintspc.dataobject	= "d_loansrv_info_reqloanintspc"
lds_reqintspc.settransobject( itr_sqlca )

ll_count	= lds_reqintspc.retrieve( is_coopcontrol, as_reqno )

if ll_count = 0  then
	destroy( lds_reqintspc )
	return ls_xmlintspc
end if

lds_contintspc	= create n_ds
lds_contintspc.dataobject	= "d_loansrv_info_contintspc"
lds_contintspc.settransobject( itr_sqlca )

ldtm_effdate	= adtm_rcvdate

this.of_setsrvdatetime( true )

for ll_index = 1 to ll_count
	ll_row		= lds_contintspc.insertrow( 0 )
	
	lds_contintspc.setitem( ll_row, "effective_date", ldtm_effdate )
	
	lds_contintspc.object.coop_id[ ll_row ]					= lds_reqintspc.object.coop_id[ ll_index ]
	lds_contintspc.object.int_continttype[ ll_row ]			= lds_reqintspc.object.int_continttype[ ll_index ]
	lds_contintspc.object.int_contintrate[ ll_row ]			= lds_reqintspc.object.int_contintrate[ ll_index ]
	lds_contintspc.object.int_continttabcode[ ll_row ]		= lds_reqintspc.object.int_continttabcode[ ll_index ]
	lds_contintspc.object.int_contintincrease[ ll_row ]		= lds_reqintspc.object.int_contintincrease[ ll_index ]
	
	li_timetype		= lds_reqintspc.getitemnumber( ll_index, "int_timetype" )
	li_timeamt		= lds_reqintspc.getitemnumber( ll_index, "int_timeamt" )
	
	// ทำของอันถัดไป
	// ประเภทการนับวัน 1=ชนวัน 2=ชนเดือน
	if li_timetype = 2 then
		ldtm_effdate	= datetime( inv_datetimesrv.of_lastdayofmonth( date( ldtm_effdate ) ) )
	end if
	
	ldtm_effdate	= datetime( inv_datetimesrv.of_relativemonth( date( ldtm_effdate ), li_timeamt ) )
next

ls_xmlintspc	= string( lds_contintspc.describe( "Datawindow.data.XML" ) )

destroy( lds_reqintspc )
destroy( lds_contintspc )

this.of_setsrvdatetime( false )

return ls_xmlintspc
end function

private function string of_getcalintreqloan (string as_reqno) throws Exception;string		ls_xmlintmast
long		ll_row

ls_xmlintmast	= ""

ll_row		= ids_inforeqloan.retrieve( is_coopcontrol, as_reqno )

if ll_row <= 0 then
	return ls_xmlintmast
end if

ids_infocont.reset()
ids_infocont.insertrow( 0 )

ids_infocont.object.coop_id[ 1 ]				= ids_inforeqloan.object.coop_id	[ 1 ]
ids_infocont.object.int_continttype[ 1 ]		= ids_inforeqloan.object.int_continttype[ 1 ]
ids_infocont.object.int_contintrate[ 1 ]		= ids_inforeqloan.object.int_contintrate[ 1 ]
ids_infocont.object.int_continttabcode[ 1 ]	= ids_inforeqloan.object.int_continttabcode[ 1 ]
ids_infocont.object.int_contintincrease[ 1 ]	= ids_inforeqloan.object.int_contintincrease[ 1 ]
ids_infocont.object.int_intsteptype[ 1 ]		= ids_inforeqloan.object.int_intsteptype[ 1 ]
ids_infocont.object.loanapprove_amt[ 1 ]	= ids_inforeqloan.object.loanapprove_amt[ 1 ]

ls_xmlintmast	= string( ids_infocont.describe( "Datawindow.data.XML" ) )

return ls_xmlintmast
end function

private function string of_initlnrcv_futureint (ref n_ds ads_payoutslip) throws Exception;string			ls_xmlfutureint, ls_rcvfromreqcont, ls_contno, ls_reqno, ls_xmlcontint, ls_xmlintspc, ls_loantype, ls_memno
long			ll_row
integer		li_rcvperiod, li_continttype, li_chk, li_intpaydayflag,li_calintfutureflag
dec{2}		ldc_rcvamt, ldc_intperiod, ldc_bfapvamt
datetime		ldtm_operate, ldtm_lastkeep, ldtm_calintto
n_ds			lds_contint, lds_conintspc
n_ds			lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

ls_memno			= ads_payoutslip.getitemstring( 1, "member_no" )
li_rcvperiod			= ads_payoutslip.getitemnumber( 1, "rcv_period" )
li_continttype		= ads_payoutslip.getitemnumber( 1, "bfcontint_type" )
ldc_bfapvamt		= ads_payoutslip.getitemdecimal( 1, "bfloanapprove_amt" )
ldc_rcvamt			= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldtm_operate		= ads_payoutslip.getitemdatetime( 1, "operate_date" )

// ถ้าประเภทการคิดดอกเบี้ยเป็นไม่คิดดอกเบี้ย
if li_continttype = 0 then
	return ""
end if

// ตรวจสอบว่าสมาชิกคนนี้เรียกเก็บไปหรือยัง
select		lastkeep_date
into		:ldtm_lastkeep
from		mbmembmaster
where	( coop_id			= :is_coopcontrol )
and		( member_no	= :ls_memno )
using		itr_sqlca ;

// ถ้าวันที่จ่ายมากกว่าวันที่เรียกเก็บล่าสุดแสดงว่าไม่มี ด/บ ล่วงหน้า
if ldtm_operate >= ldtm_lastkeep then
	return ""
end if

// ดึงค่าข้อมูลกรณีต้องคิดดอกเบี้ยล่วงหน้า
ls_rcvfromreqcont	= ads_payoutslip.getitemstring( 1, "rcvfromreqcont_code" )
ls_contno			= ads_payoutslip.getitemstring( 1, "loancontract_no" )
ls_reqno				= ads_payoutslip.getitemstring( 1, "loanrequest_docno" )
ls_loantype			= ads_payoutslip.getitemstring( 1, "shrlontype_code" )

this.of_setsrvlninterest( true )

// ตรวจว่าเป็นการจ่ายเงินกู้จากอะไร สัญญา/ใบคำขอกู้
if ls_rcvfromreqcont = "CON" then
	ll_row		= ids_infocont.retrieve( is_coopcontrol, ls_contno )
	if ll_row <= 0 then
		return ""
	end if
	
	ls_xmlcontint	= string( ids_infocont.describe( "Datawindow.data.XML" ) )
	
	// ถ้าอัตราดอกเบี้ยเป็นช่วงต้องดึงตารางช่วงด้วย
	if li_continttype = 3 then
		ls_xmlintspc	= this.of_getcalintcontintspc( ls_contno, ldtm_operate, ldtm_lastkeep )
	end if
else
	ls_xmlcontint	= this.of_getcalintreqloan( ls_reqno )
	
	// ถ้าอัตราดอกเบี้ยเป็นช่วงต้องดึงตารางช่วงด้วย
	if li_continttype = 3 then
		ls_xmlintspc	= this.of_getcalintreqintspc( ls_reqno, ldtm_operate )
	end if
end if

ldtm_calintto	= ldtm_lastkeep

// ดึงค่า config จาก loantype มาตรวจสอบว่างวดแรกมีการคิด ด/บ วันชำระด้วยหรือไม่
select	nvl( firstpaycntdaypay_flag, 0 )
into	:li_intpaydayflag
from	lnloantype
where( loantype_code	= :ls_loantype )
using	itr_sqlca ;

if isnull( li_intpaydayflag ) then li_intpaydayflag = 0

if li_intpaydayflag = 1 then
	ldtm_calintto	= datetime( relativedate( date( ldtm_calintto ), 1 ) )
end if

ldc_intperiod	= inv_intsrv.of_computeinterestx( ls_xmlcontint, ls_xmlintspc, ldc_rcvamt, ldtm_operate, ldtm_calintto )

lds_payinslipdet.reset()

// ใส่ข้อมูลดอกเบี้ยรับล่วงหน้า
ll_row		= lds_payinslipdet.insertrow( 0 )

lds_payinslipdet.object.shrlontype_code[ ll_row ]		= ads_payoutslip.object.shrlontype_code[ 1 ]
lds_payinslipdet.object.bflastcalint_date[ ll_row ]		= ads_payoutslip.object.bflastcalint_date[ 1 ]

lds_payinslipdet.setitem( ll_row, "operate_flag", 1 )
lds_payinslipdet.setitem( ll_row, "loancontract_no", ls_contno )
lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "INF" )
lds_payinslipdet.setitem( ll_row, "slipitem_desc", "ดอกเบี้ยรับล่วงหน้า" )

lds_payinslipdet.setitem( ll_row, "prncalint_amt", ldc_rcvamt )
lds_payinslipdet.setitem( ll_row, "interest_period", ldc_intperiod )
lds_payinslipdet.setitem( ll_row, "calint_from", ldtm_operate )
lds_payinslipdet.setitem( ll_row, "calint_to", ldtm_calintto )

lds_payinslipdet.setitem( ll_row, "principal_payamt", 0 )
lds_payinslipdet.setitem( ll_row, "interest_payamt", ldc_intperiod )
lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_intperiod )
lds_payinslipdet.setitem( ll_row, "stm_itemtype", "LIF" )
lds_payinslipdet.SetItem( ll_row, "bfcontlaw_status", 1 )
lds_payinslipdet.SetItem( ll_row, "bfpayspec_method", 1 )

ls_xmlfutureint	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )

return ls_xmlfutureint
end function

protected function integer of_setsrvdeposit (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_deptsrv ) or not isvalid( inv_deptsrv ) then
		inv_deptsrv	= create n_cst_deposit_service
		inv_deptsrv.of_settrans( inv_transection )
		inv_deptsrv.of_init()
		return 1
	end if
else
	if isvalid( inv_deptsrv ) then
		destroy inv_deptsrv
		return 1
	end if
end if

return 0
end function

public function integer of_deptsequest (string as_contno, datetime adtm_seqdate) throws Exception;string		ls_refdeptno
integer	li_cntcoll
dec		ldc_baseperc, ldc_activeamt, ldc_seqamt
boolean	lb_error = false

select		count( ref_collno )
into		:li_cntcoll
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
and		( loancolltype_code = '03' )
using		itr_sqlca ;

if li_cntcoll <= 0 then
	return 0
end if

this.of_setsrvdeposit( true )

// ตรวจสอบกรณีใช้เงินฝากค้ำประกันต้องนำไปอายัด
declare data_cur cursor for
select		ref_collno, collbase_percent, collactive_amt
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
and		( loancolltype_code = '03' )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
do while itr_sqlca.sqlcode = 0
	if isnull( ldc_baseperc ) or ldc_baseperc = 0 then ldc_baseperc = 100
	
	try
		ldc_seqamt		= ldc_activeamt / ( ldc_baseperc / 100 )
		
		inv_deptsrv.of_autosequest_loan( ls_refdeptno, is_coopcontrol, ldc_seqamt, adtm_seqdate, "", as_contno, "LON" )
	catch( Exception lthw_errseq )
		ithw_exception.text	= "Auto Dept Sequest : " + ls_refdeptno + " ยอดเงิน : " + string( ldc_activeamt , "#,##0.00" ) + " " + lthw_errseq.text
		lb_error					= true
	end try
	
	if lb_error then
		close data_cur ;
		goto objdestroy
	end if
	
	fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
loop
close data_cur ;

objdestroy:
this.of_setsrvdeposit( false )

if lb_error then
	throw ithw_exception
end if

return 1
end function

public function integer of_deptdesequest (string as_contno, datetime adtm_seqdate) throws Exception;string		ls_refdeptno
integer	li_cntcoll
dec		ldc_baseperc, ldc_activeamt, ldc_seqamt
boolean	lb_error = false

select		count( ref_collno )
into		:li_cntcoll
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
and		( loancolltype_code = '03' )
using		itr_sqlca ;

if li_cntcoll <= 0 then
	return 0
end if

this.of_setsrvdeposit( true )

// ตรวจสอบกรณีใช้เงินฝากค้ำประกันต้องนำไปถอนอายัด
declare data_cur cursor for
select		ref_collno, collbase_percent, collactive_amt
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
and		( loancolltype_code = '03' )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
do while itr_sqlca.sqlcode = 0
	if isnull( ldc_baseperc ) or ldc_baseperc = 0 then ldc_baseperc = 100
	
	try
		ldc_seqamt		= ldc_activeamt / ( ldc_baseperc / 100 )
		
		inv_deptsrv.of_autodesequest_loan( ls_refdeptno, is_coopcontrol, ldc_seqamt, adtm_seqdate, "", as_contno, "LON" )
	catch( Exception lthw_errseq )
		ithw_exception.text	= "Auto Dept Desequest : " + ls_refdeptno + " ยอดเงิน : " + string( ldc_activeamt , "#,##0.00" ) + " " + lthw_errseq.text
		lb_error					= true
	end try
	
	if lb_error then
		close data_cur ;
		goto objdestroy
	end if
	
	fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
loop
close data_cur ;

objdestroy:
this.of_setsrvdeposit( false )

if lb_error then
	throw ithw_exception
end if

return 1
end function

private function integer of_initslippayin_calint (ref n_ds ads_payinslipdet, string as_sliptype, datetime adtm_opedate) throws Exception;string		ls_contno
long		ll_count, ll_index
integer	li_calintmethod, li_operate, li_pxafterkeep
dec{2}	ldc_prnbal, ldc_prnpay, ldc_intamt, ldc_bfintarr, ldc_intpay
dec{2}	ldc_rkeepprn, ldc_rkeepint
datetime	ldtm_bflastcalint, ldtm_bflastproc, ldtm_calintto

// กรองเฉพาะหนี้
ads_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
ads_payinslipdet.filter()

// ประกาศ Service interest
this.of_setsrvlninterest( true )

ll_count	= ads_payinslipdet.rowcount()

for ll_index = 1 to ll_count
	// ดึงข้อมูลสำหรับคำนวณ
	li_operate			= ads_payinslipdet.getitemnumber( ll_index, "operate_flag" )
	
	ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
	ldc_prnpay			= ads_payinslipdet.getitemdecimal( ll_index, "principal_payamt" )
	ldc_prnbal			= ads_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	ldc_bfintarr		= ads_payinslipdet.getitemdecimal( ll_index, "bfintarr_amt" )
	ldc_rkeepprn		= ads_payinslipdet.getitemdecimal( ll_index, "rkeep_principal" )
	ldc_rkeepint		= ads_payinslipdet.getitemdecimal( ll_index, "rkeep_interest" )
	li_pxafterkeep		= ads_payinslipdet.getitemnumber( ll_index, "bfpxaftermthkeep_type" )
	ldtm_bflastcalint	= ads_payinslipdet.getitemdatetime( ll_index, "bflastcalint_date" )
	ldtm_bflastproc		= ads_payinslipdet.getitemdatetime( ll_index, "bflastproc_date" )
	
	// Clear ข้อมูลดอกเบี้ยก่อนเสมอ
	ads_payinslipdet.setitem( ll_index, "prncalint_amt", 0 )
	ads_payinslipdet.setitem( ll_index, "interest_period", 0 )
	ads_payinslipdet.setitem( ll_index, "interest_return", 0 )
	ads_payinslipdet.setitem( ll_index, "calint_to", ldtm_bflastcalint )
	
	// มีการเรียกเก็บไปแล้วและกำหนดว่าไม่เก็บ ด/บ ซ้ำก็ข้ามไปทำอันถัดไป
	if ldtm_bflastproc >= adtm_opedate and li_pxafterkeep = 1 then
		ads_payinslipdet.setitem( ll_index, "prncalint_amt", 0 )
		ads_payinslipdet.setitem( ll_index, "calint_from", ldtm_bflastcalint )
		ads_payinslipdet.setitem( ll_index, "calint_to", ldtm_bflastcalint )
		ads_payinslipdet.setitem( ll_index, "interest_period", 0 )
		continue
	end if
	
	// ตรวจสอบว่าคิด ด/บ จากยอดอะไร
	li_calintmethod		= ads_payinslipdet.getitemnumber( ll_index, "bfpayspec_method" )

	// ถ้าคิด ด/บ จากยอดชำระ เงินต้นที่คิด ด/บ ต้องเป็นยอดชำระ
	if li_calintmethod = 2 then
		if li_operate = 1 then
			ldc_prnbal	= ldc_prnpay
		else
			continue
		end if
	end if
	
	ldtm_calintto		= adtm_opedate
	
	// คำนวณดอกเบี้ย
	ldc_intamt		= inv_intsrv.of_computeinterest( is_coopcontrol, ls_contno, ldc_prnbal, ldtm_bflastcalint, ldtm_calintto )
	
	// ใส่ข้อมูล ด/บ
	ads_payinslipdet.setitem( ll_index, "prncalint_amt", ldc_prnbal )
	ads_payinslipdet.setitem( ll_index, "calint_from", ldtm_bflastcalint )
	ads_payinslipdet.setitem( ll_index, "calint_to", ldtm_calintto )
	ads_payinslipdet.setitem( ll_index, "interest_period", ldc_intamt )
	
	// ถ้ามีการ Check ว่าชำระ
	if li_operate = 1 then
		ldc_intpay		= ldc_bfintarr + ldc_intamt
		
		ads_payinslipdet.setitem( ll_index, "interest_payamt", ldc_intpay )
		ads_payinslipdet.setitem( ll_index, "item_payamt", ldc_prnpay + ldc_intpay )
	end if
	
next

// เอากรองออก
ads_payinslipdet.setfilter( "" )
ads_payinslipdet.filter()

return 1
end function

private function integer of_initshrwtd_initclear (ref n_ds ads_payinslipdet, ref decimal adc_shrstkvalue) throws Exception;long		ll_count, ll_index
dec{2}	ldc_intperiod, ldc_intarrear, ldc_intarrset, ldc_prnbal
dec{2}	ldc_rkeepprn, ldc_rkeepint, ldc_prnpay, ldc_intpay

ll_count	= ads_payinslipdet.rowcount()

// ล้างข้อมูลชำระทั้งหมดก่อน
for ll_index = 1 to ll_count
	ldc_prnbal		= ads_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	
	ads_payinslipdet.setitem( ll_index, "operate_flag", 0 )
	ads_payinslipdet.setitem( ll_index, "principal_payamt", 0 )
	ads_payinslipdet.setitem( ll_index, "interest_payamt", 0 )
	ads_payinslipdet.setitem( ll_index, "item_payamt", 0 )
	ads_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal )
next

// Clear รายการอื่นๆก่อน
ads_payinslipdet.setfilter( "slipitemtype_code <> 'LON'" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
for ll_index = 1 to ll_count
	if adc_shrstkvalue = 0 then
		exit
	end if
	
	ldc_prnbal		= ads_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	
	if isnull( ldc_prnbal ) then ldc_prnbal = 0
	
	if ldc_prnbal > adc_shrstkvalue then
		ldc_prnpay	= adc_shrstkvalue
	else
		ldc_prnpay	= ldc_prnbal
	end if
	
	adc_shrstkvalue	= adc_shrstkvalue - ldc_prnpay
	
	ads_payinslipdet.setitem( ll_index, "operate_flag", 1 )
	ads_payinslipdet.setitem( ll_index, "item_payamt", ldc_prnpay )
	ads_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal - ldc_prnpay )
next

// Clear รายการหนี้
ads_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
ads_payinslipdet.filter()

ads_payinslipdet.setsort( "seq_no a" )
ads_payinslipdet.sort()

ll_count	= ads_payinslipdet.rowcount()

// ด/บ ค้างก่อนเลย
for ll_index = 1 to ll_count
	if adc_shrstkvalue = 0 then
		exit
	end if
	
	ldc_intarrear	= ads_payinslipdet.getitemdecimal( ll_index, "bfintarr_amt" )
	
	if isnull( ldc_intarrear ) then ldc_intarrear = 0
	
	// ถ้ายอด ด/บ ไม่มีข้ามไปทำสัญญาถัดไป
	if ldc_intarrear = 0 then
		continue
	end if
	
	if ldc_intarrear > adc_shrstkvalue then
		ldc_intarrear	= adc_shrstkvalue
	end if
	
	adc_shrstkvalue	= adc_shrstkvalue - ldc_intarrear
	
	ads_payinslipdet.setitem( ll_index, "operate_flag", 1 )
	ads_payinslipdet.setitem( ll_index, "interest_payamt", ldc_intarrear )
	ads_payinslipdet.setitem( ll_index, "item_payamt", ldc_intarrear )
next

// ด/บ งวดลำดับถัดไป
for ll_index = 1 to ll_count
	if adc_shrstkvalue = 0 then
		exit
	end if
	
	ldc_intperiod	= ads_payinslipdet.getitemdecimal( ll_index, "interest_period" )
	ldc_intpay		= ads_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
	
	if isnull( ldc_intperiod ) then ldc_intperiod = 0
	if isnull( ldc_intpay ) then ldc_intpay = 0
	
	// ถ้ายอด ด/บ ไม่มีข้ามไปทำสัญญาถัดไป
	if ldc_intperiod = 0 then
		continue
	end if
	
	if ldc_intperiod > adc_shrstkvalue then
		ldc_intperiod	= adc_shrstkvalue
	end if
	
	adc_shrstkvalue	= adc_shrstkvalue - ldc_intperiod
	ldc_intpay			= ldc_intpay + ldc_intperiod
	
	ads_payinslipdet.setitem( ll_index, "operate_flag", 1 )
	ads_payinslipdet.setitem( ll_index, "interest_payamt", ldc_intpay )
	ads_payinslipdet.setitem( ll_index, "item_payamt", ldc_intpay )
next

// ต้นเงิน ตามมา
for ll_index = 1 to ll_count
	if adc_shrstkvalue = 0 then
		exit
	end if
	
	ldc_prnbal		= ads_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	ldc_intpay		= ads_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
	
	if isnull( ldc_prnbal ) then ldc_prnbal = 0
	
	if ldc_prnbal > adc_shrstkvalue then
		ldc_prnpay	= adc_shrstkvalue
	else
		ldc_prnpay	= ldc_prnbal
	end if
	
	adc_shrstkvalue	= adc_shrstkvalue - ldc_prnpay
	
	ads_payinslipdet.setitem( ll_index, "operate_flag", 1 )
	ads_payinslipdet.setitem( ll_index, "principal_payamt", ldc_prnpay )
	ads_payinslipdet.setitem( ll_index, "item_payamt", ldc_prnpay+ldc_intpay )
	ads_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal - ldc_prnpay )
next

return 1
end function

private function integer of_postseq_lnrcv (string as_contno, n_ds ads_payindet, datetime adtm_lnrcv) throws Exception;string		ls_colltype, ls_refdeptno, ls_contclr
integer	li_chk
long		ll_index, ll_count
dec		ldc_activeamt, ldc_baseperc, ldc_seqamt, ldc_clractiveamt, ldc_clrbaseperc

ads_payindet.setfilter( "slipitemtype_code = 'LON' and operate_flag = 1" )
ads_payindet.filter()

ll_count		= ads_payindet.rowcount()

// ตรวจสอบก่อนว่ามีเงินฝากค้ำมั้ย
select		count( 1 )
into		:li_chk
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
and		( loancolltype_code	= '03' )
using		itr_sqlca ;

// ถ้าไม่มีไม่ต้องทำ
if li_chk <= 0 then
	return 1
end if

this.of_setsrvdeposit( true )

declare data_cur cursor for
select		ref_collno, collbase_percent, collactive_amt
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
and		( loancolltype_code	= '03' )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
do while itr_sqlca.sqlcode = 0
	
	// เอาค่าบัญชีเงินฝากที่ได้ไปหาว่ามีในสัญญาที่หักกลบมั้ยถ้ามีต้องถอนอายัดก่อน
	for ll_index = 1 to ll_count
		
		ls_contclr	= ads_payindet.getitemstring( ll_index, "loancontract_no" )
		
		select	collactive_amt, collbase_percent
		into	:ldc_clractiveamt, :ldc_clrbaseperc
		from	lncontmaster ln join lncontcoll lc on ln.coop_id = lc.coop_id and ln.loancontract_no = lc.loancontract_no
		where	( ln.coop_id = :is_coopcontrol )
		and		( ln.loancontract_no = :ls_contclr )
		and		( lc.loancolltype_code = '03' )
		and		( lc.ref_collno = :ls_refdeptno )
		using itr_sqlca ;
		
		// ถ้าใช้เงินฝากบัญชีเดียวกันต้องถอนอายัดก่อน
		if itr_sqlca.sqlcode = 0 then
			try
				ldc_seqamt		= round( ldc_clractiveamt / ( ldc_clrbaseperc / 100 ), 2 )
				inv_deptsrv.of_autodesequest_loan( ls_refdeptno, is_coopcontrol, ldc_seqamt, adtm_lnrcv, "", ls_contclr, "LON" )
			catch( exception lex_errdeseq )
				ithw_exception.text	= "Auto Dept DeSequest : " + ls_refdeptno + " ยอดเงิน : " + string( ldc_seqamt , "#,##0.00" ) + " " + lex_errdeseq.text
				close data_cur ;
				this.of_setsrvdeposit( false )
				throw ithw_exception
			end try
		end if
	next
	
	if isnull( ldc_baseperc ) or ldc_baseperc = 0 then ldc_baseperc = 100

	// เริ่มทำการอายัดบัญชีใหม่
	try
		ldc_seqamt		= round( ldc_activeamt / ( ldc_baseperc / 100 ), 2 )
		inv_deptsrv.of_autosequest_loan( ls_refdeptno, is_coopcontrol, ldc_seqamt, adtm_lnrcv, "", as_contno, "LON" )
	catch( exception lthw_errseq )
		ithw_exception.text	= "Auto Dept Sequest : " + ls_refdeptno + " ยอดเงิน : " + string( ldc_seqamt , "#,##0.00" ) + " " + lthw_errseq.text
		close data_cur ;
		this.of_setsrvdeposit( false )
		throw ithw_exception
	end try
	
	fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
loop

close data_cur ;

this.of_setsrvdeposit( false )

return 1
end function

private function integer of_postseq_lnrcvccl (n_ds ads_payoutslip) throws Exception;string		ls_colltype, ls_refdeptno, ls_slipclrno, ls_contno, ls_contclr
integer	li_chk
long		ll_index, ll_count
dec		ldc_activeamt, ldc_baseperc, ldc_seqamt, ldc_clractiveamt, ldc_clrbaseperc
datetime	ldtm_ccldate

ls_contno		= ads_payoutslip.getitemstring( 1, "loancontract_no" )
ls_slipclrno		= ads_payoutslip.getitemstring( 1, "slipclear_no" )
ldtm_ccldate	= ads_payoutslip.getitemdatetime( 1, "cancel_date" )

// ตรวจสอบก่อนว่ามีเงินฝากค้ำมั้ย
select		count( 1 )
into		:li_chk
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :ls_contno )
and		( loancolltype_code	= '03' )
using		itr_sqlca ;

// ถ้าไม่มีไม่ต้องทำ
if li_chk <= 0 then
	return 1
end if

this.of_setsrvdeposit( true )

declare data_cur cursor for
select		ref_collno, collbase_percent, collactive_amt
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :ls_contno )
and		( loancolltype_code	= '03' )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
do while itr_sqlca.sqlcode = 0
	
	// เริ่มทำการถอนอายัดบัญชีใหม่
	try
		if isnull( ldc_baseperc ) or ldc_baseperc = 0 then ldc_baseperc = 100
		
		ldc_seqamt		= round( ldc_activeamt / ( ldc_baseperc / 100 ), 2 )
		inv_deptsrv.of_autodesequest_loan( ls_refdeptno, is_coopcontrol, ldc_seqamt, ldtm_ccldate, "", ls_contno, "LON" )
	catch( exception lthw_errseq )
		ithw_exception.text	= "Auto Dept DeSequest : " + ls_refdeptno + " ยอดเงิน : " + string( ldc_activeamt , "#,##0.00" ) + " " + lthw_errseq.text
		close data_cur ;
		this.of_setsrvdeposit( false )
		throw ithw_exception
	end try
	
	if ls_slipclrno = "" or isnull( ls_slipclrno ) then
		goto nextfetch
	end if
	
	// เอาค่าบัญชีเงินฝากที่มีในสัญญาที่หักกลบกลับไปอายัด
	declare clr_cur cursor for
	select		loancontract_no
	from		slslippayin sl join slslippayindet sld on sl.coop_id = sld.coop_id and sl.payinslip_no = sld.payinslip_no
	where	( sl.coop_id = :is_coopcontrol )
	and		( sl.payinslip_no = :ls_slipclrno )
	and		( sld.slipitemtype_code = 'LON' )
	using itr_sqlca ;
	
	open clr_cur ;
	fetch clr_cur into :ls_contclr ;
	do while itr_sqlca.sqlcode = 0
		
		select		collactive_amt, collbase_percent
		into		:ldc_clractiveamt, :ldc_clrbaseperc
		from		lncontmaster ln join lncontcoll lc on ln.coop_id = lc.coop_id and ln.loancontract_no = lc.loancontract_no
		where	( ln.coop_id = :is_coopcontrol )
		and		( ln.loancontract_no = :ls_contclr )
		and		( lc.loancolltype_code = '03' )
		and		( lc.ref_collno = :ls_refdeptno )
		using itr_sqlca ;
		
		// ถ้าใช้เงินฝากบัญชีเดียวกันต้องถอนอายัดก่อน
		if itr_sqlca.sqlcode = 0 then
			try
				ldc_seqamt		= round( ldc_clractiveamt / ( ldc_clrbaseperc / 100 ), 2 )
				inv_deptsrv.of_autosequest_loan( ls_refdeptno, is_coopcontrol, ldc_seqamt, ldtm_ccldate, "", ls_contclr, "LON" )
			catch( exception lex_errdeseq )
				ithw_exception.text	= "Auto DeptSequest : " + ls_refdeptno + " ยอดเงิน : " + string( ldc_seqamt , "#,##0.00" ) + " " + lex_errdeseq.text
				close clr_cur ;
				close data_cur ;
				this.of_setsrvdeposit( false )
				throw ithw_exception
			end try
		end if
		
		fetch clr_cur into :ls_contclr ;
	loop
	close clr_cur ;
	
	nextfetch:
	fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
loop

close data_cur ;

this.of_setsrvdeposit( false )

return 1
end function

private function integer of_setmoneyreturn (n_ds ads_payinslip, ref n_ds ads_payinslipdet) throws Exception;string ls_memno, ls_contno, ls_loantype, ls_slipitemtype, ls_sliptype
long ll_count, ll_index, ll_row
integer li_intreturnflag, li_pxaftermthkeep, li_opeflag
dec{2}ldc_prnpay, ldc_prnbal, ldc_intpay, ldc_intret, ldc_prnret, ldc_intmth, ldc_rkeepint, ldc_rkeepprn
datetime ldtm_lastcalint, ldtm_lastprocdate, ldtm_opedate

ls_sliptype		= ads_payinslip.GetItemString( 1, "sliptype_code" )
ldtm_opedate	= ads_payinslip.GetItemDateTime(1,"operate_date")

// ถ้าเป็น pmx ชำระรายเดือน
if ls_sliptype = "PMX" then
	return 1
end if

// ประกาศ Service interest
this.of_setsrvlninterest( true )

ll_count = ads_payinslipdet.RowCount()

for ll_index = 1 to ll_count
	ls_slipitemtype = ads_payinslipdet.GetItemString(ll_index, "slipitemtype_code")
	li_opeflag = ads_payinslipdet.GetItemNumber(ll_index, "operate_flag")
	
	// ถ้าไม่ใช่เงินกู้ที่ทำรายการให้ข้ามไป
	if not( ls_slipitemtype = "LON" and li_opeflag = 1 ) then
		continue
	end if
	
	// ดูว่ามีการให้ ด/บ คืนหรือเปล่า
	li_intreturnflag = ads_payinslipdet.getitemnumber(ll_index, "bfintreturn_flag")

	if li_intreturnflag = 0 then
		continue
	end if
	
	// ดึงข้อมูลสำหรับคำนวณ
	ls_contno = ads_payinslipdet.getitemstring(ll_index, "loancontract_no")
	ls_loantype = ads_payinslipdet.getitemstring(ll_index, "shrlontype_code")
	ldc_prnpay = ads_payinslipdet.getitemdecimal(ll_index, "principal_payamt")
	ldc_intpay = ads_payinslipdet.getitemdecimal(ll_index, "interest_payamt")
	ldc_prnbal = ads_payinslipdet.getitemdecimal(ll_index, "bfshrcont_balamt")
	ldc_rkeepprn = ads_payinslipdet.GetItemDecimal(ll_index,"rkeep_principal")
	ldc_rkeepint = ads_payinslipdet.getitemdecimal(ll_index, "rkeep_interest")
	ldtm_lastprocdate = ads_payinslipdet.getitemdatetime(ll_index, "bflastproc_date")
	ldtm_lastcalint = ads_payinslipdet.getitemdatetime(ll_index, "bflastcalint_date")
	
	li_pxaftermthkeep = ads_payinslipdet.getitemnumber(ll_index, "bfpxaftermthkeep_type")
	
	// ถ้าไม่มีวันที่ประมวลผลเข้ามาข้าม
	if isnull(ldtm_lastprocdate) or string(ldtm_lastprocdate, "yyyymmdd") = "19000101" then
		continue
	end if
	
	// ถ้าวันที่ประมวลผลมีค่าน้อยกว่าวันที่ชำระ ข้าม ไม่มี ด/บ คืน
	if ldtm_lastprocdate <= ldtm_opedate then
		continue
	end if
	
	// set ค่าตั้งต้นพวกเงินคืน
	ldc_prnret = 0
	ldc_intret = 0
	
	// คืนเงินโดยดูจาก config การชำระหลังเรียกเก็บ
	choose case li_pxaftermthkeep
		case 1 // ไม่คิด ด/บ หักยอดรอเรียกเก็บไว้
			ldc_intret = inv_intsrv.of_computeinterest(is_coopcontrol, ls_contno, ldc_prnpay, ldtm_opedate, ldtm_lastprocdate)
			
			ads_payinslipdet.setitem(ll_index, "prncalint_amt", ldc_prnpay)
			ads_payinslipdet.setitem(ll_index, "calint_from", ldtm_opedate)
			ads_payinslipdet.setitem(ll_index, "calint_to", ldtm_lastprocdate)
			
		case 2 // เก็บดอกเบี้ยปกติ ไม่หักยอดรอเรียกเก็บ
			ldc_intret = inv_intsrv.of_computeinterest(is_coopcontrol, ls_contno, ldc_prnpay, ldtm_opedate, ldtm_lastprocdate)
			
			// เคสนี้ ยอดด/บคืนต้องรวมด/บรับชำระไปด้วย
			ldc_intret = ldc_intret + ldc_intpay
			
			// ต้นคืน 
			ldc_prnbal = ldc_prnbal - ldc_prnpay
			if ldc_prnbal < ldc_rkeepprn then
				ldc_prnret = ldc_rkeepprn - ldc_prnbal
			end if
			
		case 3 // ไม่หักยอดเรียกเก็บ ชำระได้เต็ม คิดด/บปกติ ยกเลิกกระดาษทำการ auto จนท.เอายอดยกเลิกกระดาษไปชำระพิเศษเอา(ทำมือ)
			
			ldc_prnret = ldc_rkeepprn
			ldc_intret = ldc_rkeepint
			
		case 4 // ไม่หักยอดเรียกเก็บ ชำระได้เต็ม คิดด/บปกติ คืนด/บเฉพาะการชำระหมดเท่านั้น ถ้าไม่หมดสิ้นเดือนเกลี่ยยอดใหม่(ทำมือ)
			ldc_prnbal = ldc_prnbal - ldc_prnpay
			
			if ldc_prnbal <= 0 then
				ldc_intret = ldc_rkeepint
			end if
	end choose

	// ใส่ข้อมูลการคืน
	ads_payinslipdet.setitem(ll_index, "prnc_return", ldc_prnret)
	ads_payinslipdet.setitem(ll_index, "interest_return", ldc_intret)
next

// Destroy Service interest
this.of_setsrvlninterest( false )

return 1
end function

public function integer of_postslip_payintodept (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;//สำหรับนำเข้าข้อมูลลง Dpdepttran
string		ls_memcoopid, ls_coopid, ls_memno, ls_contno
string		ls_expcode, ls_deptaccno, ls_slipitemtype, ls_slipno
integer		li_year
long		ll_count, ll_index
dec{2}		ldc_itempay
datetime	ldtm_trndate
str_posttrans	lstr_posttrans

ls_slipno		= ads_payinslip.getitemstring( 1, "payinslip_no" )

ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code in ('INS')" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_memcoopid		= ads_payinslip.getitemstring( 1, "memcoop_id" )
ls_memno			= ads_payinslip.getitemstring( 1, "member_no" )
ls_coopid			= ads_payinslip.getitemstring( 1, "coop_id" )
ldtm_trndate		= ads_payinslip.getitemdatetime( 1, "slip_date" )
ls_deptaccno		= '0000000000'

for ll_index = 1 to ll_count
	
	ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
	ldc_itempay			= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
	ls_slipitemtype		= ads_payinslipdet.getitemstring(ll_index, "slipitemtype_code" )
	
	lstr_posttrans.ref_slipno			= ls_slipno
	lstr_posttrans.coop_id				= ls_coopid
	lstr_posttrans.source_code			= "INS"
	lstr_posttrans.source_coopid		= ls_coopid
	lstr_posttrans.source_accno			= ls_deptaccno
	lstr_posttrans.memcoop_id			= ls_memcoopid
	lstr_posttrans.member_no			= ls_memno
	lstr_posttrans.concoop_id			= ls_coopid
	lstr_posttrans.loancontract_no		= ls_contno
	lstr_posttrans.sliptype_code		= "PX"
	lstr_posttrans.moneytype_code		= "TRN"	
	lstr_posttrans.trnpay_type			= 2
	lstr_posttrans.trans_amt			= ldc_itempay
	lstr_posttrans.trans_date			= ldtm_trndate
	lstr_posttrans.system_code			= "INS"  
	
	
	this.of_posttrn_depttran( lstr_posttrans )	
	
next

return 1
end function

public function integer of_setsrvlnoperatecore (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_lnopecore ) or not isvalid( inv_lnopecore ) then
		inv_lnopecore	= create n_cst_loansrv_lnoperate
		inv_lnopecore.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_lnopecore ) then
		destroy inv_lnopecore
		return 1
	end if
end if

return 0
end function

private function integer of_setintreturn (ref n_ds ads_payinslipdet, datetime adtm_opedate) throws Exception;string ls_memno, ls_contno, ls_contcoopid, ls_loantype
long ll_count, ll_index, ll_row
integer li_calintmethod, li_operate, li_intreturnflag, li_pxaftermthkeep, li_intpaydayflag
dec{2}ldc_prnpay, ldc_intpay, ldc_intamt, ldc_intmth, ldc_nkeepint, ldc_prnbal
dec{4}ldc_contintrate
datetime ldtm_lastcalint, ldtm_lastprocdate, ldtm_chkdate

// กรองทำเฉพาะพวกรายการเงินกู้
ads_payinslipdet.SetFilter("slipitemtype_code = 'LON'")
ads_payinslipdet.Filter()

ll_count = ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

// ประกาศ Service interest
this.of_setsrvlninterest( true )

for ll_index = 1 to ll_count
	// ดูว่ามีการให้ ด/บ คืนหรือเปล่า
	li_intreturnflag = ads_payinslipdet.getitemnumber(ll_index, "bfintreturn_flag")

	if li_intreturnflag = 0 then
		continue
	end if
	
	// ดึงข้อมูลสำหรับคำนวณ
	ls_contno = ads_payinslipdet.getitemstring(ll_index, "loancontract_no")
	ls_contcoopid = ads_payinslipdet.getitemstring(ll_index, "concoop_id")
	ls_loantype = ads_payinslipdet.getitemstring(ll_index, "shrlontype_code")
	ldc_prnpay = ads_payinslipdet.getitemdecimal(ll_index, "principal_payamt")
	ldc_intpay = ads_payinslipdet.getitemdecimal(ll_index, "interest_payamt")
	ldc_prnbal = ads_payinslipdet.getitemdecimal(ll_index, "bfshrcont_balamt")
	ldc_nkeepint = ads_payinslipdet.getitemdecimal(ll_index, "nkeep_interest")
	ldtm_lastprocdate = ads_payinslipdet.getitemdatetime(ll_index, "bflastproc_date")
	ldtm_lastcalint = ads_payinslipdet.getitemdatetime(ll_index, "bflastcalint_date")
	li_pxaftermthkeep = ads_payinslipdet.getitemnumber(ll_index, "bfpxaftermthkeep_type")
	
	// ถ้าไม่มีวันที่ประมวลผลเข้ามาข้าม
	if isnull(ldtm_lastprocdate) or string(ldtm_lastprocdate, "yyyymmdd") = "19000101" then
		continue
	end if
	
	// ดึงค่า config จาก loantype มาตรวจสอบว่างวดแรกมีการคิด ด/บ วันชำระด้วยหรือไม่
	select nvl(firstpaycntdaypay_flag, 0)
	into :li_intpaydayflag
	from lnloantype
	where(coop_id = :is_coopcontrol)
	and (loantype_code = :ls_loantype)
	using itr_sqlca;
	
	// ถ้ามีการคิดดอกเบี้ยวันชำระต้องปรับวันที่ประมวลไป 1 วัน
	if li_intpaydayflag = 1 then
		ldtm_lastprocdate = datetime(RelativeDate(date(ldtm_lastprocdate), 1))
	end if
	
	// ถ้าวันที่ประมวลผลมีค่าน้อยกว่าวันที่ชำระ ข้าม ไม่มี ด/บ คืน
	if ldtm_lastprocdate <= adtm_opedate then
		continue
	end if
	
	// set ค่าตั้งต้น ด/บ คืน
	ldc_intamt = 0
	
	// คืนดอกเบี้ยโดยดูจาก config การชำระหลังเรียกเก็บ
	choose case li_pxaftermthkeep
		case 1 // 1 ไม่คิดด/บ ชำระ ต้องคืนด/บ
			ldc_intamt = inv_intsrv.of_computeinterest(ls_contcoopid, ls_contno, ldc_prnpay, adtm_opedate, ldtm_lastprocdate)
			
			ads_payinslipdet.setitem(ll_index, "prncalint_amt", ldc_prnpay)
			ads_payinslipdet.setitem(ll_index, "calint_from", adtm_opedate)
			ads_payinslipdet.setitem(ll_index, "calint_to", ldtm_lastprocdate)
		case 2 // ไม่หักยอดเรียกเก็บ ชำระได้เต็ม คิดด/บปกติ คืนด/บโดยคำนวณใหม่แล้วลบจากยอดสิ้นเดือน
			ldc_prnbal = ldc_prnbal - ldc_prnpay
			ldc_intmth = inv_intsrv.of_computeinterest(ls_contcoopid, ls_contno, ldc_prnbal, adtm_opedate, ldtm_lastprocdate)
			ldc_intamt = ldc_nkeepint - ldc_intmth
			
		case 3 // ไม่หักยอดเรียกเก็บ ชำระได้เต็ม คิดด/บปกติ ยกเลิกกระดาษทำการ auto จนท.เอายอดยกเลิกกระดาษไปชำระพิเศษเอา(ทำมือ)
			
			continue
		case 4 // ไม่หักยอดเรียกเก็บ ชำระได้เต็ม คิดด/บปกติ คืนด/บเฉพาะการชำระหมดเท่านั้น ถ้าไม่หมดสิ้นเดือนเกลี่ยยอดใหม่(ทำมือ)
			ldc_prnbal = ldc_prnbal - ldc_prnpay
			
			if ldc_prnbal <= 0 then
				ldc_intamt = ldc_nkeepint
			else
				continue
			end if
	end choose

	// ใส่ข้อมูล ด/บ
	ads_payinslipdet.setitem(ll_index, "interest_return", ldc_intamt)
next

// Destroy Service interest
this.of_setsrvlninterest( false )

ads_payinslipdet.SetFilter("")
ads_payinslipdet.Filter()

return 1
end function

private function integer of_initslippayin_calfine (n_ds ads_slipdetloan, ref n_ds ads_slipdetetc, string as_sliptype, datetime adtm_opedate) throws Exception;string ls_contno, ls_loantype
long ll_count, ll_index, ll_row
integer li_operate, li_fineflag
dec ldc_prnpay, ldc_fineperc, ldc_fineamt
datetime ldtm_finedue

// ลบค่าปรับของเก่าก่อน
ads_slipdetetc.SetFilter("slipitemtype_code = 'FBD'")
ads_slipdetetc.Filter()

if ads_slipdetetc.RowCount() > 0 then
	ads_slipdetetc.RowsDiscard(1, ads_slipdetetc.RowCount(), primary!)
end if

ads_slipdetetc.SetFilter("")
ads_slipdetetc.Filter()

ll_count = ads_slipdetloan.rowcount()

for ll_index = 1 to ll_count
	// ดึงข้อมูลสำหรับคำนวณ
	li_operate = ads_slipdetloan.getitemnumber(ll_index, "operate_flag")
	
	if li_operate <> 1 then
		continue
	end if
	
	ls_contno = ads_slipdetloan.getitemstring(ll_index, "loancontract_no")
	ls_loantype = ads_slipdetloan.getitemstring(ll_index, "shrlontype_code")
	ldc_prnpay = ads_slipdetloan.getitemdecimal(ll_index, "principal_payamt")
	
	select ln.finepx_flag, ln.finepx_bfdate, lt.finepx_percent
	into :li_fineflag, :ldtm_finedue, :ldc_fineperc
	from lncontmaster ln
	join lnloantype lt on ln.coop_id = lt.coop_id and ln.loantype_code = lt.loantype_code
	where(ln.coop_id = :is_coopcontrol)
	and (ln.loancontract_no = :ls_contno)
	using itr_sqlca;
	
	// ถ้าสัญญานี้ไม่ติดเงื่อนไขปรับก็ข้าม
	if li_fineflag <> 1 then
		continue
	end if
	
	// ถ้าวันที่ชำระมันมากกว่าวันที่ครบกำหนดก็ข้าม
	if adtm_opedate > ldtm_finedue then
		continue
	end if
	
	// เอายอด % ที่จะปรับมาคูณกับยอดชำระ
	ldc_fineamt = ldc_prnpay * (ldc_fineperc / 100.00)
	
	ll_row = ads_slipdetetc.InsertRow(0)
	
	ads_slipdetetc.SetItem(ll_row, "operate_flag", 1)
	ads_slipdetetc.SetItem(ll_row, "slipitemtype_code", "FBD")
	ads_slipdetetc.SetItem(ll_row, "concoop_id", is_coopcontrol)
	ads_slipdetetc.SetItem(ll_row, "loancontract_no", ls_contno)
	ads_slipdetetc.SetItem(ll_row, "shrlontype_code", ls_loantype)
	ads_slipdetetc.SetItem(ll_row, "slipitem_desc", "ค่าธรรมเนียมชำระหนี้ก่อนกำหนด")
	ads_slipdetetc.SetItem(ll_row, "item_payamt", ldc_fineamt)
	ads_slipdetetc.SetItem(ll_row, "bfshrcont_balamt", ldc_fineamt)

next
	
return 1
end function

public function integer of_initslippayin_calfine (string as_xmlloan, ref string as_xmletc, string as_sliptype, datetime adtm_operate) throws Exception;boolean lb_error = false
n_ds lds_slipdetloan, lds_slipdetetc

lds_slipdetloan = create n_ds
lds_slipdetloan.DataObject = DWO_PAYINSLIPDET

lds_slipdetetc = create n_ds
lds_slipdetetc.DataObject = DWO_PAYINSLIPDET

try
	this.of_setsrvdwxmlie( true )
	inv_dwxmliesrv.of_xmlimport(lds_slipdetloan, as_xmlloan)
	inv_dwxmliesrv.of_xmlimport(lds_slipdetetc, as_xmletc)
catch (Exception lex_err)
	lb_error = true
	ithw_exception.Text = lex_err.Text
end try

if lb_error then
	goto objdestroy
end if

try
	this.of_initslippayin_calfine(lds_slipdetloan, lds_slipdetetc, as_sliptype, adtm_operate)
catch(Exception lex_calfine)
	lb_error = true
	ithw_exception.Text = lex_calfine.Text
end try

if lb_error then
	goto objdestroy
end if

as_xmletc = inv_dwxmliesrv.of_xmlexport( lds_slipdetetc)

objdestroy:
if IsValid(lds_slipdetloan) then destroy lds_slipdetloan
if IsValid(lds_slipdetetc) then destroy lds_slipdetetc

if lb_error then
	throw ithw_exception
end if

return 1
end function

on n_cst_loansrv_lnoperateptt.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_loansrv_lnoperateptt.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;destroy ids_infomemcont
destroy ids_infocont
destroy ids_infosliptype

this.of_setsrvdwxmlie( false )
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
