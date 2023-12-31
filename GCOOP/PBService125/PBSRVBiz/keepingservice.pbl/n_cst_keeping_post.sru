$PBExportHeader$n_cst_keeping_post.sru
forward
global type n_cst_keeping_post from NonVisualObject
end type
end forward

global type n_cst_keeping_post from NonVisualObject
end type
global n_cst_keeping_post n_cst_keeping_post

type variables
n_ds	ids_loandata, ids_contintspc, ids_inttable

string		is_recvperiod, is_arg[], is_userid, is_branchid
string		is_coopcontrol , is_coopid
integer	ii_proctype , ii_chkbaldept , ii_mnenoughflg
datetime	idtm_operate

n_cst_progresscontrol		inv_progress
n_cst_stringservice			inv_stringsrv
n_cst_loansrv_interest		inv_intsrv
n_cst_dbconnectservice		inv_transection
n_cst_keeping_service		inv_kpsrv
n_cst_datawindowsservice	inv_dwsrv

transaction	itr_sqlca
Exception	ithw_exception

constant integer	STATUS_CLOSE = -1
end variables

forward prototypes
public function integer of_setprogress (ref n_cst_progresscontrol anv_progress) throws Exception
public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans) throws Exception
public function integer of_del_mast () throws Exception
public function integer of_rcvprocess_post (str_keep_proc astr_keep_proc) throws Exception
public function integer of_post_todetpmthcut () throws Exception
public function integer of_init_rcv_post (ref str_keep_proc astr_keep_proc) throws Exception
protected function integer of_post_todisplay () throws Exception
protected function integer of_post_toffee () throws Exception
protected function integer of_post_toloan () throws Exception
protected function integer of_post_toloanintarr () throws Exception
protected function integer of_post_tomast () throws Exception
protected function integer of_post_tomastdet (string as_kpslipno, integer ai_seqno, datetime adtm_postdate) throws Exception
protected function integer of_post_tomastdet_lon (string as_kpslipno, integer ai_seqno, datetime adtm_postdate) throws Exception
protected function integer of_post_tomastdet_shr (string as_kpslipno, integer ai_seqno, datetime adtm_postdate) throws Exception
protected function integer of_post_toother () throws Exception
protected function integer of_post_toshare () throws Exception
protected function integer of_postdisplay () throws Exception
protected function integer of_postffee () throws Exception
protected function integer of_postfire () throws Exception
protected function integer of_postloan () throws Exception
protected function integer of_postloanemertrn () throws Exception
protected function integer of_postloanemertrn_bck () throws Exception
protected function integer of_postloanintarr () throws Exception
protected function integer of_postmoneyreturn () throws Exception
protected function integer of_postother () throws Exception
protected function integer of_postshare () throws Exception
protected function integer of_posttodetpmthcut () throws Exception
protected function integer of_posttomast (string as_memno, string as_recvperiod, string as_refmemno) throws Exception
protected function integer of_posttomastdet (string as_memno, string as_recvperiod, string as_refmemno, integer ai_seqno, datetime adtm_postdate) throws Exception
protected function integer of_set_sql_chkdpbal (ref n_ds ads_info, string as_tablename) throws Exception
protected function integer of_setsqlselect (ref n_ds ads_info) throws Exception
protected function integer of_setsrvdw (boolean ab_switch)
protected function integer of_setsrvlninterest (boolean ab_switch)
protected function integer of_update_expense () throws Exception
end prototypes

public function integer of_setprogress (ref n_cst_progresscontrol anv_progress) throws Exception;/***********************************************************
<description>
	กำหนด progress bar ที่ใช้แสดงผล
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
anv_progress = inv_progress

return 1
end function

public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans) throws Exception;/***********************************************************
<description>
	ใช้สำหรับ Intial service
</description>

<arguments>  
	atr_dbtrans			n_cst_dbconnectservice	รายละเอียดการเชื่อมต่อฐานข้อมูล
</arguments> 

<return> 
	Integer				1 = success
</return> 

<usage> 
	เรียกใช้ครั้งเดียว และต้องเรียกใช้เป็นฟังก์ชั่นแรกหลังจาก create instance
	ก่อนที่จะเรียกใช้ฟังก์ชั่นอื่น ๆ
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

itr_sqlca = atr_dbtrans.itr_dbconnection
is_coopcontrol	= atr_dbtrans.is_coopcontrol
is_coopid = atr_dbtrans.is_coopid

// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
	inv_transection	= atr_dbtrans
end if

itr_sqlca 		= inv_transection.itr_dbconnection

// Service สำหรับสร้าง Sql Extend
inv_stringsrv	= create n_cst_stringservice

// สร้าง Progress สำหรับแสดงสถานะการประมวลผล
inv_progress	= create n_cst_progresscontrol

// Service สำหรับการประมวลผล
inv_kpsrv			= create n_cst_keeping_service
inv_kpsrv.of_initservice( atr_dbtrans )


return 1
end function

public function integer of_del_mast () throws Exception;/***********************************************************
<description>
	ลบข้อมูล kpmastreceive ที่ยังไม่มีการทำรายการ
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/05/2012 by Godji
</usage> 
***********************************************************/
delete from kpmastreceive
where not exists 
	(	select 	1 
		from 		kpmastreceivedet 
		where	kpmastreceive.kpslip_no = kpmastreceivedet.kpslip_no 
		and		kpmastreceive.coop_id = kpmastreceivedet.coop_id )
and	kpmastreceive.coop_id = :is_coopid
and	kpmastreceive.recv_period = :is_recvperiod
using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "~r~nลบข้อมูลใบเสร็จเรียกเก็บประจำเดือน(Kpmastreceive) พบข้อผิดพลาด"
	ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"
	ithw_exception.text	+= "~r~n" + string( itr_sqlca.sqlcode )
	ithw_exception.text	+= "~r~n"+itr_sqlca.sqlerrtext
	return -1
end if

return 1
end function

public function integer of_rcvprocess_post (str_keep_proc astr_keep_proc) throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการเรียกเก็บ
</description>

<arguments>  
	astr_keep.xml_option			String			dw เงื่อนไขการประมวผล
</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
	Version 1.1 (Initial version) Modified Date 9/5/2012 by Godji
</usage> 
***********************************************************/
string		ls_group, ls_memno , ls_memtyp , ls_xmloption
integer	li_rowcount
integer	li_maxproc, li_count
integer	li_year, li_month, li_sharestatus, li_loanstatus, li_ffeestatus, li_emertrnstatus
integer	li_chkbaldept , li_moneyretstatus, li_otherstatus, li_insfirestatus

n_ds		lds_procdata
n_cst_dwxmlieservice		lnv_dwxmliesrv

this.of_setsrvdw(true)
lnv_dwxmliesrv		= create n_cst_dwxmlieservice

lds_procdata = create n_ds
lds_procdata.dataobject = "d_kp_option_post"
lds_procdata.settransobject( itr_sqlca )

ls_xmloption		= astr_keep_proc.xml_option

// นำเข้า XML
if lnv_dwxmliesrv.of_xmlimport( lds_procdata, ls_xmloption ) < 1 then
	ithw_exception.text += "~r~nพบขอผิดพลาดในการนำเข้าเงื่อนไขการประมวลผลตัดยอดเรียกเก็บ"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

li_year					= lds_procdata.getitemnumber( 1, "receive_year" )
li_month					= lds_procdata.getitemnumber( 1, "receive_month" )
li_sharestatus			= lds_procdata.getitemnumber( 1, "share_status" )
li_loanstatus				= lds_procdata.getitemnumber( 1, "loan_status" )
li_emertrnstatus		= lds_procdata.getitemnumber( 1, "emertrn_status" )
li_ffeestatus				= lds_procdata.getitemnumber( 1, "ffee_status" )
li_otherstatus			= lds_procdata.getitemnumber( 1, "other_status" )
li_insfirestatus			= lds_procdata.getitemnumber( 1, "insurefire_status" )
li_moneyretstatus		= lds_procdata.getitemnumber( 1, "moneyret_status" )
ls_group					= lds_procdata.getitemstring( 1, "group_text" )
ls_memno				= lds_procdata.getitemstring( 1, "mem_text" )
ls_memtyp				= lds_procdata.getitemstring( 1, "memb_text" )

ii_mnenoughflg			= lds_procdata.getitemnumber( 1, "moneyenough_flag" )
ii_chkbaldept			= lds_procdata.getitemnumber( 1, "chk_baldp_flag" )

// กำหนดค่าให้ instance เพื่อใช้ในฟังก์ชันอื่น ๆ
is_userid				= lds_procdata.getitemstring( 1, "entry_id" )
//is_branchid			= lds_procdata.getitemstring( 1, "branch_id" )
ii_proctype			= lds_procdata.getitemnumber( 1, "proc_type" )
is_recvperiod		= string( li_year ) + string( li_month, "00" )

//// รูปแบบการประมวลผล
//choose case ii_proctype
//	case 2	// ตามกลุ่ม
//		inv_stringsrv.of_analyzestring( ls_group, is_arg[] )
//	case 3 // ตามทะเบียน
//		inv_stringsrv.of_analyzestring( ls_memno, is_arg[] )
//end choose

inv_kpsrv.of_setproctype( ii_proctype )
inv_kpsrv.of_set_recvperiod( is_recvperiod )
inv_kpsrv.of_set_txtmemno( ls_memno )
inv_kpsrv.of_set_txtmemgrp( ls_group )
inv_kpsrv.of_set_txtmemtyp( ls_memtyp )
inv_kpsrv.of_setanalyze()

li_maxproc   = li_sharestatus + li_loanstatus + li_ffeestatus + li_emertrnstatus + li_otherstatus + li_insfirestatus + li_moneyretstatus + 3

inv_progress.istr_progress.progress_max = li_maxproc

// สร้างใบเสร็จสมาชิกที่ประมวลผลตัดยอด
li_count ++
inv_progress.istr_progress.progress_index = li_count
if this.of_post_tomast() <> 1 then
	if isvalid( lds_procdata ) then destroy lds_procdata ;
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ค่าธรรมเนียมแรกเข้า
if ( li_ffeestatus = 1 ) then
	li_count ++
	inv_progress.istr_progress.progress_index = li_count	
	if this.of_post_toffee( ) <> 1 then
		if isvalid( lds_procdata ) then destroy lds_procdata ;
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

// หุ้นรายเดือน
if li_sharestatus = 1 then
	li_count ++
	inv_progress.istr_progress.progress_index = li_count	
	if this.of_post_toshare(  ) <> 1 then
		if isvalid( lds_procdata ) then destroy lds_procdata ;
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

// หนี้เงินกู้
if li_loanstatus = 1 then
	li_count ++
	inv_progress.istr_progress.progress_index = li_count	
	
	if this.of_post_toloanintarr(  ) <> 1 then
		if isvalid( lds_procdata ) then destroy lds_procdata ;
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	if this.of_post_toloan(  ) <> 1 then
		if isvalid( lds_procdata ) then destroy lds_procdata ;
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

//// ฉุกเฉินหักโอน
//if li_emertrnstatus = 1 then
//	li_count ++
//	inv_progress.istr_progress.progress_index = li_count	
//	if this.of_postloanemertrn(  ) <> 1 then
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//end if
//
//// คืนเงินส่วนที่เก็บเงินเกิน
//if li_moneyretstatus = 1 then
//	li_count ++
//	inv_progress.istr_progress.progress_index = li_count	
//	
//	if this.of_postmoneyreturn(  ) <> 1 then
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//end if
//
//// เบี้ยประกันอัคคีภัย
//if li_insfirestatus = 1 then
//	li_count ++
//	inv_progress.istr_progress.progress_index = li_count	
//	if this.of_postfire( ) <> 1 then
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//end if
//
// ชำระอื่น ๆ
if li_otherstatus = 1 then
	li_count ++
	inv_progress.istr_progress.progress_index = li_count	
	if this.of_post_toother(  ) <> 1 then
		if isvalid( lds_procdata ) then destroy lds_procdata ;
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

// รายการหยุดเก็บที่แสดงผลเฉยๆ
li_count ++
inv_progress.istr_progress.progress_index = li_count	
if this.of_post_todisplay() <> 1 then
	if isvalid( lds_procdata ) then destroy lds_procdata ;
	rollback using itr_sqlca ;
	throw ithw_exception
end if

//// ส่งยอดเรียกเก็บไปให้ระบบเงินฝากไว้สำหรับหัก
//if li_chkbaldept = 1 then
//	li_count ++
//	inv_progress.istr_progress.progress_index = li_count	
//	if this.of_post_todetpmthcut(  ) <> 1 then
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//end if

// อัพเดทสถานะการหักเงิน
li_count ++
inv_progress.istr_progress.progress_index = li_count
if this.of_update_expense() <> 1 then
	if isvalid( lds_procdata ) then destroy lds_procdata ;
	rollback using itr_sqlca ;
	throw ithw_exception
end if

li_count ++
inv_progress.istr_progress.progress_index = li_count	
// ลบข้อมูลที่ยังไม่ได้มีการผ่านรายการออก
if this.of_del_mast() <> 1 then
	if isvalid( lds_procdata ) then destroy lds_procdata ;
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

inv_progress.istr_progress.progress_max = li_maxproc
inv_progress.istr_progress.status = 1

if isvalid( lds_procdata ) then destroy lds_procdata ;
this.of_setsrvdw(false)

return 1
end function

public function integer of_post_todetpmthcut () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการหักเงินฝากชำระรายเดือน
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by P'Oh
	Version 2.0 (Initial version) Modified Date 24/05/2012 by Godji
</usage> 
***********************************************************/
string		ls_kpslipno , ls_memcoopid , ls_bizzcoopid
string		ls_memno, ls_recvperiod
string		ls_membgrp, ls_mbbranchid, ls_deptaccno, ls_dpbranchid
integer	li_poststatus, li_ret , li_deptcls
long		ll_index, ll_count
dec{2}	ldc_keepamt
datetime	ldtm_deptcls
n_ds		lds_mthcut

inv_progress.istr_progress.progress_text		= "ส่งรายการเรียกเก็บไปหักจากระบบเงินฝาก"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_mthcut	= create n_ds
lds_mthcut.dataobject	= "d_kp_rcvpost_trntodeptmthcut"
lds_mthcut.settransobject(itr_sqlca)

inv_kpsrv.of_setsqlselect( "kptempreceive" )
if inv_kpsrv.of_setsqldw( lds_mthcut ) <> 1 then
	destroy lds_mthcut
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL of_post_toshare(1)"
	return -1
end if

if inv_kpsrv.of_setsqldw_coop_recvperiod( lds_mthcut , "kptempreceive" ) <> 1 then
	destroy lds_mthcut
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL of_post_toshare(2)"
	return -1
end if

ll_count = lds_mthcut.retrieve()

inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index
	
	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_mthcut
		return 0
	end if
	
	ls_kpslipno		= lds_mthcut.object.kpslip_no[ll_index]
	ls_memcoopid	= lds_mthcut.object.memcoop_id[ll_index]
	ls_bizzcoopid	= lds_mthcut.object.bizzcoop_id[ll_index]
	ls_memno		= trim( lds_mthcut.getitemstring( ll_index, "member_no" ) )
	ls_membgrp		= trim( lds_mthcut.getitemstring( ll_index, "membgroup_code" ) )
	ls_mbbranchid	= trim( lds_mthcut.getitemstring( ll_index, "mb_branch_id" ) )
	ls_deptaccno	= trim( lds_mthcut.getitemstring( ll_index, "expense_accid" ) )
	li_deptcls			= lds_mthcut.object.deptclose_status[ll_index]
	li_poststatus		= lds_mthcut.object.post_status[ll_index]
	ldc_keepamt	= lds_mthcut.getitemdecimal( ll_index, "sum_cut" )
	ldtm_deptcls	= lds_mthcut.object.deptclose_date[ll_index]
	
	if isnull( li_deptcls ) then li_deptcls = 99 // ไม่พบบัญชี
	if isnull( li_poststatus ) then li_poststatus = 0
	
	// ตรวจสอบบัญชีปลายทาง
	if li_deptcls = 99 then
		ithw_exception.text   = "เลขที่บัญชี : "+ls_deptaccno 
		ithw_exception.text += "~r~nเลขที่บัญชีเงินฝากไม่พบเลขที่บัญชีเงินฝาก"
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~nกรุณาตรวจสอบ"
		return -1
	end if
	
	// ตรวจว่าปิดบัญชีไปหรือยัง
	if li_deptcls = 1 then
		ithw_exception.text   = "เลขที่บัญชี : "+ls_deptaccno 
		ithw_exception.text += "~r~nเลขที่บัญชีเงินฝากที่ระบุได้ทำการปิดบัญชีไปแล้ว "
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~nกรุณาตรวจสอบ"
		return -1
	end if
	
	if li_poststatus = 1 then
		ithw_exception.text   = "เลขที่บัญชี : "+ls_deptaccno 
		ithw_exception.text += "~r~nยอดหักบัญชีเงินฝากนี้ ได้มีการนำไปทำรายการแล้วไม่สามารถส่งไปหักชำระซ้ำได้อีก"
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~nกรุณาตรวจสอบ"		
		return -1
	else
		delete from dpdeptmonthlycut
		where	coop_id				= :ls_bizzcoopid
		and		( deptaccount_no	= :ls_deptaccno )
		and		( yearmonth			= :is_recvperiod )
		and		( system_code		= 'KEP' )
		using	itr_sqlca ;
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text   = "เลขที่บัญชี : "+ls_deptaccno 
			ithw_exception.text += "~r~nไม่สามารถลบข้อมูลส่งหักเดิมที่มีอยู่ก่อนแล้วได้"
			ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
			ithw_exception.text += "~r~n" + string( sqlca.sqlcode )
			ithw_exception.text += "~r~n" + sqlca.sqlerrtext
			ithw_exception.text += "~r~nกรุณาตรวจสอบ"		
			return -1
		end if
	end if
	
	inv_progress.istr_progress.subprogress_text	= string( ll_index , "#,##0" ) + "/" + string( ll_count , "#,##0" ) +". ทะเบียน "+ls_memno+" > ยอดเรียกเก็บ "+string( ldc_keepamt, "#,##0.00" )

	insert into dpdeptmonthlycut
		(	coop_id , 		yearmonth , 			deptaccount_no , 			seq_no , 			memcoop_id , 
			member_no , 	amount_amt , 			item_status , 				post_status , 	post_id , 
			post_branch , 	post_date , 				member_groupcode , 	system_code 	
		)
	values
		(	:ls_bizzcoopid ,	:is_recvperiod ,			:ls_deptaccno ,				1 ,					:ls_memcoopid ,
			:ls_memno ,	:ldc_keepamt ,			1 ,								0 ,					'' ,
			'' ,					null ,						:ls_membgrp ,				'KEP'
		)
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text   = "พบข้อผิดพลาดในการผ่านรายการไปตัดยอดเรียกเก็บ จากระบบเงินฝาก ~r~n"+sqlca.sqlerrtext
		ithw_exception.text += "~r~n" + string( sqlca.sqlcode )
		ithw_exception.text += "~r~n" + sqlca.sqlerrtext
		ithw_exception.text += "~r~nกรุณาตรวจสอบ"		
		return -1
	end if
next

destroy lds_mthcut

return 1
end function

public function integer of_init_rcv_post (ref str_keep_proc astr_keep_proc) throws Exception;string ls_group, ls_memno, ls_memtyp, ls_xmloption, ls_recvnum
string ls_sql, ls_sqlselect
integer li_rowcount
integer li_maxproc, li_count
integer li_year, li_month, li_sharestatus, li_loanstatus, li_ffeestatus, li_emertrnstatus
integer li_chkbaldept, li_moneyretstatus, li_otherstatus, li_insfirestatus
boolean lb_chkfst = false

n_ds lds_procdata
n_cst_dwxmlieservice lnv_dwxmliesrv

this.of_setsrvdw( true )
lnv_dwxmliesrv = create n_cst_dwxmlieservice

lds_procdata = create n_ds
lds_procdata.dataobject = "d_kp_option_post"
lds_procdata.settransobject(itr_sqlca)

ls_xmloption = astr_keep_proc.xml_option

// นำเข้า XML
if lnv_dwxmliesrv.of_xmlimport(lds_procdata, ls_xmloption) < 1 then
	ithw_exception.text += "~r~nพบขอผิดพลาดในการนำเข้าเงื่อนไขการดึงข้อมูลรายงานประมวลผลตัดยอดเรียกเก็บ"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

li_year = lds_procdata.getitemnumber(1, "receive_year")
li_month = lds_procdata.getitemnumber(1, "receive_month")
ls_recvnum = lds_procdata.GetItemString(1,"receive_number")
li_sharestatus = lds_procdata.getitemnumber(1, "share_status")
li_loanstatus = lds_procdata.getitemnumber(1, "loan_status")
li_emertrnstatus = lds_procdata.getitemnumber(1, "emertrn_status")
li_ffeestatus = lds_procdata.getitemnumber(1, "ffee_status")
li_otherstatus = lds_procdata.getitemnumber(1, "other_status")
li_insfirestatus = lds_procdata.getitemnumber(1, "insurefire_status")
li_moneyretstatus = lds_procdata.getitemnumber(1, "moneyret_status")
ls_group = lds_procdata.getitemstring(1, "group_text")
ls_memno = lds_procdata.getitemstring(1, "mem_text")
ls_memtyp = lds_procdata.getitemstring(1, "memb_text")

// กำหนดค่าให้ instance เพื่อใช้ในฟังก์ชันอื่น ๆ
is_userid = lds_procdata.getitemstring(1, "entry_id")
ii_proctype = lds_procdata.getitemnumber(1, "proc_type")

ls_recvnum	= right( "00"+ls_recvnum, 2 )

if ls_recvnum = "00" or IsNull(ls_recvnum) then
	ls_recvnum = ""
end if

is_recvperiod		= string( li_year ) + string( li_month, "00" ) + ls_recvnum

inv_kpsrv.of_setproctype(ii_proctype)
inv_kpsrv.of_set_recvperiod(is_recvperiod)
inv_kpsrv.of_set_txtmemno(ls_memno)
inv_kpsrv.of_set_txtmemgrp(ls_group)
inv_kpsrv.of_set_txtmemtyp(ls_memtyp)
inv_kpsrv.of_setanalyze()

inv_kpsrv.of_setsqlselect("kptempreceive")
inv_kpsrv.of_getsqlselect(ls_sqlselect)

li_maxproc = li_sharestatus + li_loanstatus + li_ffeestatus + li_emertrnstatus + li_otherstatus + li_insfirestatus + li_moneyretstatus

inv_progress.istr_progress.progress_max = li_maxproc

ls_sql = ""

if li_ffeestatus = 1 then
	if lb_chkfst then ls_sql += " union "
	
	ls_sql += " select kptempreceive.receipt_date as receipt_date , '01' as seq , to_char( kui.sort_in_receive ) as subseq , ktd.keepitemtype_code as keeptyp , '' as shrlontyp , kui.keepitemtype_desc as lontyp , 0 as prinpay , 0 as intpay , sum( ktd.item_payment ) as itempay "
	ls_sql += " from	kptempreceivedet ktd , kptempreceive , kpucfkeepitemtype kui "
	ls_sql += " where	( kptempreceive.coop_id = '" + is_coopcontrol + "' ) "
	ls_sql += " and		( kptempreceive.recv_period like '" + is_recvperiod + "' ) "
	ls_sql += " and		( ktd.coop_id	= kptempreceive.coop_id ) "
	ls_sql += " and		( ktd.kpslip_no = kptempreceive.kpslip_no ) "
	ls_sql += " and		( ktd.keepitemtype_code = kui.keepitemtype_code ) "
	ls_sql += " and		( kui.keepitemtype_grp = 'FFE' ) "
	ls_sql += " and		( ktd.keepitem_status > 0 ) "
	ls_sql += " and		( ktd.posting_status = 0 ) "
	ls_sql += ls_sqlselect
	ls_sql += " group by kptempreceive.receipt_date , to_char( kui.sort_in_receive ) , ktd.keepitemtype_code, kui.keepitemtype_desc "
	
	lb_chkfst = true
end if

if li_sharestatus = 1 then
	if lb_chkfst then ls_sql += " union "
	
	ls_sql += " select kptempreceive.receipt_date as receipt_date , '01' as seq , to_char( kui.sort_in_receive ) as subseq , ktd.keepitemtype_code as keeptyp , '' as shrlontyp , kui.keepitemtype_desc as lontyp , 0 as prinpay , 0 as intpay , sum( ktd.item_payment ) as itempay "
	ls_sql += " from	kptempreceivedet ktd , kptempreceive , kpucfkeepitemtype kui "
	ls_sql += " where	( kptempreceive.coop_id = '" + is_coopcontrol + "' ) "
	ls_sql += " and		( kptempreceive.recv_period like '" + is_recvperiod + "' ) "
	ls_sql += " and		( ktd.coop_id	= kptempreceive.coop_id ) "
	ls_sql += " and		( ktd.kpslip_no = kptempreceive.kpslip_no ) "
	ls_sql += " and		( ktd.keepitemtype_code = kui.keepitemtype_code ) "
	ls_sql += " and		( kui.keepitemtype_grp = 'SHR' ) "
	ls_sql += " and		( ktd.keepitem_status > 0 ) "
	ls_sql += " and		( ktd.posting_status = 0 ) "
	ls_sql += ls_sqlselect
	ls_sql += " group by kptempreceive.receipt_date , to_char( kui.sort_in_receive ) , ktd.keepitemtype_code, kui.keepitemtype_desc "
	
	lb_chkfst = true
end if

if li_loanstatus = 1 then
	if lb_chkfst then ls_sql += " union "

	ls_sql += " select kptempreceive.receipt_date as receipt_date , '00' as seq , '00' as subseq ,'LON' as keeptyp , ktd.shrlontype_code as shrlontyp, lt.loantype_desc as lontyp , "
	ls_sql += " sum( ktd.principal_payment ) as prinpay , sum( ktd.interest_payment ) as intpay , sum( ktd.item_payment ) as itempay "
	ls_sql += " from	kptempreceivedet ktd, kptempreceive , lnloantype lt , kpucfkeepitemtype kui "
	ls_sql += " where	( kptempreceive.coop_id = '" + is_coopcontrol + "' ) "
	ls_sql += " and		( kptempreceive.recv_period like '" + is_recvperiod + "' ) "
	ls_sql += " and		( ktd.coop_id = kptempreceive.coop_id ) "
	ls_sql += " and		( ktd.kpslip_no = kptempreceive.kpslip_no ) "
	ls_sql += " and		( ktd.bizzcoop_id = lt.coop_id ) "
	ls_sql += " and		( ktd.shrlontype_code = lt.loantype_code ) "
	ls_sql += " and		( ktd.coop_id = kui.coop_id ) "
	ls_sql += " and		( ktd.keepitemtype_code = kui.keepitemtype_code ) "
	ls_sql += " and		( kui.keepitemtype_grp = 'LON' ) "
	ls_sql += " and		( ktd.keepitem_status > 0 ) "
	ls_sql += " and		( ktd.posting_status = 0 ) "
	ls_sql += ls_sqlselect
	ls_sql += " group by kptempreceive.receipt_date , ktd.shrlontype_code, lt.loantype_desc "
	
	ls_sql += " union "
	
	ls_sql += " select kptempreceive.receipt_date as receipt_date , '01' as seq , to_char( kui.sort_in_receive ) as subseq , ktd.keepitemtype_code as keeptyp , '' as shrlontyp , kui.keepitemtype_desc as lontyp , 0 as prinpay , sum( ktd.interest_payment ) as intpay , sum( ktd.item_payment ) as itempay "
	ls_sql += " from	kptempreceivedet ktd , kptempreceive , kpucfkeepitemtype kui "
	ls_sql += " where	( kptempreceive.coop_id = '" + is_coopcontrol + "' ) "
	ls_sql += " and		( kptempreceive.recv_period like '" + is_recvperiod + "' ) "
	ls_sql += " and		( ktd.coop_id	= kptempreceive.coop_id ) "
	ls_sql += " and		( ktd.kpslip_no = kptempreceive.kpslip_no ) "
	ls_sql += " and		( ktd.keepitemtype_code = kui.keepitemtype_code ) "
	ls_sql += " and		( kui.keepitemtype_grp = 'IAR' ) "
	ls_sql += " and		( ktd.keepitem_status > 0 ) "
	ls_sql += " and		( ktd.posting_status = 0 ) "
	ls_sql += ls_sqlselect
	ls_sql += " group by kptempreceive.receipt_date , to_char( kui.sort_in_receive ) , ktd.keepitemtype_code, kui.keepitemtype_desc "
	
	lb_chkfst = true
end if

if li_otherstatus = 1 then
	if lb_chkfst then ls_sql += " union "
	
	ls_sql += " select kptempreceive.receipt_date as receipt_date , '01' as seq , to_char( kui.sort_in_receive ) as subseq , ktd.keepitemtype_code as keeptyp , '' as shrlontyp , kui.keepitemtype_desc as lontyp , 0 as prinpay , 0 as intpay , sum( ktd.item_payment ) as itempay "
	ls_sql += " from	kptempreceivedet ktd , kptempreceive , kpucfkeepitemtype kui "
	ls_sql += " where	( kptempreceive.coop_id = '" + is_coopcontrol + "' ) "
	ls_sql += " and		( kptempreceive.recv_period like '" + is_recvperiod + "' ) "
	ls_sql += " and		( ktd.coop_id	= kptempreceive.coop_id ) "
	ls_sql += " and		( ktd.kpslip_no = kptempreceive.kpslip_no ) "
	ls_sql += " and		( ktd.keepitemtype_code = kui.keepitemtype_code ) "
	ls_sql += " and		( kui.keepitemtype_grp not in ( 'SHR' , 'IAR' , 'LON' , 'FFE' ) ) "
	ls_sql += " and		( ktd.keepitem_status > 0 ) "
	ls_sql += " and		( ktd.posting_status = 0 ) "
	ls_sql += ls_sqlselect
	ls_sql += " group by kptempreceive.receipt_date , to_char( kui.sort_in_receive ) , ktd.keepitemtype_code, kui.keepitemtype_desc "
	
	lb_chkfst = true
end if

if (li_ffeestatus + li_sharestatus + li_loanstatus + li_otherstatus) > 0 then
	
	ls_sql = " select receipt_date , seq , subseq , keeptyp , shrlontyp , lontyp , prinpay , intpay , itempay frim , '" + is_recvperiod + "' as as_recv from ( " + ls_sql
	ls_sql = ls_sql + " ) where itempay > 0 "
	
end if

astr_keep_proc.sqlrpt_desc = ls_sql

inv_progress.istr_progress.progress_max = li_maxproc
inv_progress.istr_progress.status = 1

if isvalid(lds_procdata) then destroy lds_procdata;
this.of_setsrvdw( false )

return 1
end function

protected function integer of_post_todisplay () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการจัดเก็บอื่นๆ
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
	Version 2.0 (Initial version) Modified Date 24/05/2012 by Godji
</usage> 
***********************************************************/
string		ls_kpslipno , ls_memcoopid
string		ls_memno, ls_refmemno, ls_memprior, ls_refprior
integer	li_rcvseqno, li_ret
long		ll_index, ll_count
n_ds		lds_display

datetime	ldtm_entrydate

ldtm_entrydate = datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "ผ่ายรายการแสดงผลพวกหยุดเก็บ"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_display	= create n_ds
lds_display.dataobject	= "d_kp_rcvpost_display"
lds_display.settransobject( itr_sqlca )

inv_kpsrv.of_setsqlselect( "kptempreceive" )
if inv_kpsrv.of_setsqldw( lds_display ) <> 1 then
	destroy lds_display
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL of_post_todisplay(1)"
	return -1
end if

if inv_kpsrv.of_setsqldw_coop_recvperiod( lds_display , "kptempreceive" ) <> 1 then
	destroy lds_display
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL of_post_todisplay(2)"
	return -1
end if

if ii_chkbaldept = 1 then 
	if this.of_set_sql_chkdpbal( lds_display , "kptempreceive" ) <> 1 then
		destroy lds_display
		ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL ตรวจสอบเงินฝากคงเหลือ"
		return -1
	end if
end if

ll_count	= lds_display.retrieve()
inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index
	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_display
		return 0
	end if
	
	ls_kpslipno		= lds_display.object.kpslip_no[ ll_index ]
	ls_memcoopid	= lds_display.object.memcoop_id[ ll_index ]
	ls_memno		= trim( lds_display.getitemstring( ll_index, "member_no" ) )
	ls_refmemno	= trim( lds_display.getitemstring( ll_index, "ref_membno" ) )
	li_rcvseqno		= lds_display.getitemnumber( ll_index, "seq_no" )

	// ผ่านรายการไป master det
	li_ret = this.of_post_tomastdet( ls_kpslipno , li_rcvseqno, ldtm_entrydate )
	if ( li_ret <> 1 ) then
		destroy lds_display
		return -1
	end if
	
	inv_progress.istr_progress.subprogress_text	= string( ll_index , "#,##0" ) + "/" + string( ll_count , "#,##0" ) +". ทะเบียน "+ls_memno+" > รายการหยุดเก็บ "
	
next	

destroy lds_display

return 1
end function

protected function integer of_post_toffee () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการค่าธรรมเนียมแรกเข้า
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
string			ls_memcoopid
string			ls_kpslipno , ls_memno
integer		li_rcvseqno, li_chk, li_keepstatus, li_ret
long			ll_index, ll_count
dec{2}		ldc_feeamt
n_ds	lds_ffee
datetime		ldtm_entrydate

ldtm_entrydate	= datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "ค่าธรรมเนียมแรกเข้า"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_ffee	= create n_ds
lds_ffee.dataobject	= "d_kp_rcvpost_ffee"
lds_ffee.settransobject( itr_sqlca )

inv_kpsrv.of_setsqlselect( "kptempreceive" )
if inv_kpsrv.of_setsqldw( lds_ffee ) <> 1 then
	destroy lds_ffee
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL กรองข้อมูลสมาชิก(1)"
	return -1
end if

if inv_kpsrv.of_setsqldw_coop_recvperiod( lds_ffee , "kptempreceive" ) <> 1 then
	destroy lds_ffee
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL กรองข้อมูลสหกรณ์(2)"
	return -1
end if

if ii_chkbaldept = 1 then 
	if this.of_set_sql_chkdpbal( lds_ffee , "kptempreceive" ) <> 1 then
		destroy lds_ffee
		ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL ตรวจสอบเงินฝากคงเหลือ"
		return -1
	end if
end if

lds_ffee.retrieve()
ll_count = lds_ffee.rowcount()
inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index
	
	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_ffee
		return 0
	end if
	
	ls_memcoopid	= trim( lds_ffee.object.memcoop_id[ ll_index ] )
	ls_kpslipno		= trim( lds_ffee.getitemstring( ll_index, "kpslip_no" ) )
	ls_memno		= trim( lds_ffee.getitemstring( ll_index, "member_no" ) )
	ldc_feeamt		= lds_ffee.getitemdecimal( ll_index, "item_payment" )
	li_rcvseqno		= lds_ffee.getitemnumber( ll_index, "seq_no" )
	li_keepstatus	= lds_ffee.getitemnumber( ll_index, "keepitem_status" )
	
	// ผ่านรายการไป master det
	li_ret = this.of_post_tomastdet( ls_kpslipno , li_rcvseqno, ldtm_entrydate )
	if ( li_ret <> 1 ) then	
		destroy lds_ffee
		return -1
	end if
	
	// ถ้าเป็นรายการยกเลิกข้ามทำอันต่อไป
	if ( li_keepstatus <> 1 ) then
		continue
	end if
	
	inv_progress.istr_progress.subprogress_text	=string( ll_index , "#,##0" ) + "/" + string( ll_count , "#,##0" )  +". ทะเบียน " + ls_memno + " > ค่าธรรมเนียมแรกเข้า " + string( ldc_feeamt, "#,##0.00" )
	
	// บันทึกสถานะการเก็บค่าธรรมเนียม
	update	mbmembmaster
	set			firstfee_status	= 1
	where	coop_id			= :ls_memcoopid
	and		( member_no	= :ls_memno ) 
	using itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_ffee
		ithw_exception.text += "~r~nพบข้อผิดพลาดในการปรับปรุงสถานะการรับค่าธรรมเนียมแรกเข้า"
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
		ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
		return -1
	end if
next	

destroy lds_ffee

return 1
end function

protected function integer of_post_toloan () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการสัญญาเงินกู้
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
	Version 2.0 (Initial version) Modified Date 24/05/2012 by Godji
</usage> 
***********************************************************/
string		ls_bizzcoopid , ls_kpslipno
string		ls_memno, ls_refmemno, ls_contno, ls_contprior, ls_receiptno, ls_loanitem, ls_loantype, ls_keeptype, ls_trnfromcontno
string		ls_memprior, ls_refprior, ls_cancelid
integer	li_period, li_bfperiod, li_lastperiod, li_seqno, li_laststmno, li_stepvalue, li_ret, li_trnstatus, li_stmseqno
integer	li_chk, li_odflag, li_bfcontstatus, li_contstatus, li_bfcontlaw, li_conttype, li_keepstatus, li_genvcflag
long		ll_index, ll_count
dec{2}	ldc_prnpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_itembal, ldc_nkeepint, ldc_nkeepprin
dec{2}	ldc_apvamt, ldc_bfprnbal, ldc_bfwtdamt, ldc_bfprnarr, ldc_bfintarr, ldc_bfintarrmth, ldc_bfintarrset, ldc_bfintreturn, ldc_bfintaccum
dec{2}	ldc_prnbal, ldc_wtdamtbal, ldc_prnarrbal, ldc_intarrbal, ldc_intarrsetbal
dec{2}	ldc_bfintpayall, ldc_bfprnpayall, ldc_contintacm
dec{2}	ldc_fwintarrear, ldc_fwintreturn , ldc_fwintperiod , ldc_intperiodpay , ldc_intreturnpay  //tuk01 ประกาศตัวแปรเพิ่ม
dec{4}	ldc_contintrate
datetime	ldtm_receiptdate, ldtm_calintfrom, ldtm_calintto, ldtm_bflastpay, ldtm_bflastcalint, ldtm_bflastkeep
datetime	ldtm_entrydate, ldtm_lastpaydate, ldtm_lastkeepdate, ldtm_lastcaldate, ldtm_canceldate
n_ds		lds_loan

ldtm_entrydate	= datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "หนี้เงินกู้"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_loan	= create n_ds
lds_loan.dataobject	= "d_kp_rcvpost_loan"
lds_loan.settransobject( itr_sqlca )

inv_kpsrv.of_setsqlselect( "kptempreceive" )
if inv_kpsrv.of_setsqldw( lds_loan ) <> 1 then
	destroy lds_loan
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL สร้างรายงานงบหน้าประจำเดือน(1)"
	return -1
end if

if inv_kpsrv.of_setsqldw_coop_recvperiod( lds_loan , "kptempreceive" ) <> 1 then
	destroy lds_loan
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL สร้างรายงานงบหน้าประจำเดือน(2)"
	return -1
end if

if ii_chkbaldept = 1 then 
	if this.of_set_sql_chkdpbal( lds_loan , "kptempreceive" ) <> 1 then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL ตรวจสอบเงินฝากคงเหลือ"
		return -1
	end if
end if

ll_count	= lds_loan.retrieve()

inv_progress.istr_progress.subprogress_max		= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index

	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_loan
		return 0
	end if
	
	ls_bizzcoopid		= lds_loan.object.bizzcoop_id[ ll_index]
	ls_kpslipno			= lds_loan.object.kpslip_no[ ll_index]
	ls_memno			= trim( lds_loan.getitemstring( ll_index, "member_no" ) )
	ls_refmemno		= trim( lds_loan.getitemstring( ll_index, "ref_membno" ) )
	ls_contno			= trim( lds_loan.getitemstring( ll_index, "loancontract_no" ) )
	ls_receiptno			= trim( lds_loan.getitemstring( ll_index, "receipt_no" ) )
	ls_loantype			= trim( lds_loan.getitemstring( ll_index, "shrlontype_code" ) )
	ls_keeptype			= lds_loan.getitemstring( ll_index, "keepitemtype_code" )
	ls_cancelid			= lds_loan.getitemstring( ll_index, "cancel_id" )
	li_seqno				= lds_loan.getitemnumber( ll_index, "seq_no" )
	li_laststmno			= lds_loan.getitemnumber( ll_index, "last_stm_no" )
	li_period				= lds_loan.getitemnumber( ll_index, "period" )
	li_bfperiod			= lds_loan.getitemnumber( ll_index, "last_periodpay" )
	li_odflag				= lds_loan.getitemnumber( ll_index, "od_flag" )
	li_bfcontstatus		= lds_loan.getitemnumber( ll_index, "contract_status" )
	li_bfcontlaw			= lds_loan.getitemnumber( ll_index, "contlaw_status" )
	li_keepstatus		= lds_loan.getitemnumber( ll_index, "keepitem_status" )
//	li_genvcflag			= lds_loan.getitemnumber( ll_index, "posttovc_flag" )
	ldc_prnpay			= lds_loan.getitemdecimal( ll_index, "principal_payment" )
	ldc_intpay			= lds_loan.getitemdecimal( ll_index, "interest_payment" )
	ldc_intarrpay		= lds_loan.getitemdecimal( ll_index, "intarrear_payment" )
	ldc_intperiodpay	= lds_loan.getitemdecimal( ll_index, "intperiod_payment" ) //tuk02
	ldc_intreturnpay	= lds_loan.getitemdecimal( ll_index, "intreturn_payment" ) //tuk03
	ldc_itempay			= lds_loan.getitemdecimal( ll_index, "item_payment" )
	ldc_itembal			= lds_loan.getitemdecimal( ll_index, "item_balance" )
	ldc_apvamt			= lds_loan.getitemdecimal( ll_index, "loanapprove_amt" )
	ldc_bfprnbal			= lds_loan.getitemdecimal( ll_index, "principal_balance" )
	ldc_bfwtdamt		= lds_loan.getitemdecimal( ll_index, "withdrawable_amt" )
	ldc_bfprnarr			= lds_loan.getitemdecimal( ll_index, "principal_arrear" )
	ldc_bfintaccum		= lds_loan.getitemdecimal( ll_index, "interest_accum" )
	ldc_bfintarr			= lds_loan.getitemdecimal( ll_index, "interest_arrear" ) //tuk ldc_fwintarrear
	ldc_bfintarrmth		= lds_loan.getitemdecimal( ll_index, "intmonth_arrear" )
	ldc_bfintarrset		= lds_loan.getitemdecimal( ll_index, "intset_arrear" )
	ldc_bfintreturn		= lds_loan.getitemdecimal( ll_index, "interest_return" ) //tuk ldc_fwintreturn
	ldc_nkeepint			= lds_loan.getitemdecimal( ll_index, "interest_period" )
	ldc_nkeepprin		= lds_loan.getitemdecimal( ll_index, "principal_period" )
	ldc_bfprnpayall		= lds_loan.getitemdecimal( ll_index, "prnpayment_amt" )
	ldc_bfintpayall		= lds_loan.getitemdecimal( ll_index, "intpayment_amt" )
	ldtm_receiptdate	= lds_loan.getitemdatetime( ll_index, "receipt_date" )
	ldtm_calintfrom		= lds_loan.getitemdatetime( ll_index, "calintfrom_date" )
	ldtm_calintto		= lds_loan.getitemdatetime( ll_index, "calintto_date" )
	ldtm_bflastpay		= lds_loan.getitemdatetime( ll_index, "lastpayment_date" )
	ldtm_bflastcalint	= lds_loan.getitemdatetime( ll_index, "lastcalint_date" )
	ldtm_bflastkeep	= lds_loan.getitemdatetime( ll_index, "lastkeeping_date" )
	ldtm_canceldate	= lds_loan.getitemdatetime( ll_index, "cancel_date" )

	li_trnstatus			= lds_loan.getitemnumber( ll_index, "transfer_status" )
	ls_trnfromcontno	= lds_loan.getitemstring( ll_index, "trnfrom_contno" )
	
	//select fwinterest_arrear , fwinterest_return , fwinerest_period //tuk04<<
	//select a.interest_arrear , a.interest_return
	//into :ldc_fwintarrear , :ldc_fwintreturn
	//from lncontmaster a
     //where a.LOANCONTRACT_NO = :ls_contno using itr_sqlca ;
	  ldc_fwintarrear =   ldc_bfintarr
	  ldc_fwintreturn = ldc_bfintreturn
     //tuk04>>

	if isnull( li_laststmno ) then li_laststmno = 0
	if isnull( li_bfperiod ) then li_bfperiod = 0
	if isnull( li_odflag ) then li_odflag = 0
	if isnull( ldc_prnpay ) then ldc_prnpay = 0
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_bfprnbal ) then ldc_bfprnbal = 0
	if isnull( ldc_bfwtdamt ) then ldc_bfwtdamt = 0
	if isnull( ldc_bfprnarr ) then ldc_bfprnarr = 0
	if isnull( ldc_bfintaccum ) then ldc_bfintaccum = 0
	if isnull( ldc_bfintarr ) then ldc_bfintarr = 0
	if isnull( ldc_bfintarrmth ) then ldc_bfintarrmth = 0
	if isnull( ldc_bfintarrset ) then ldc_bfintarrset = 0
	if isnull( ldc_nkeepint ) then ldc_nkeepint = 0
	if isnull( ldc_nkeepprin ) then ldc_nkeepprin = 0
	if isnull( ldc_bfintpayall ) then ldc_bfintpayall = 0
	if isnull( ldc_bfprnpayall ) then ldc_bfprnpayall = 0
	
	if isnull( ldc_fwintarrear ) then ldc_fwintarrear = 0 //tuk05
	if isnull( ldc_fwintreturn ) then ldc_fwintreturn = 0 //tuk06
	if isnull( ldc_intperiodpay ) then ldc_intperiodpay = 0 //tuk07
	if isnull( ldc_intreturnpay ) then ldc_intreturnpay = 0 //tuk08

	// กำหนดค่าต่าง ๆ
	ls_loanitem		= "LPM"
	
	// -------------- เริ่มกระบวนการ ตรวจเช็ค ตัดยอด ------------------------------
	// พวกที่ตัดยอดหรือเพิ่มยอดได้เลย
	ldc_prnbal		= ldc_bfprnbal - ldc_prnpay
	ldc_prnarrbal	= ldc_bfprnarr - ( ldc_prnpay - ldc_nkeepprin )
	//ldc_intarrbal		= ldc_bfintarr - ( ldc_intpay - ldc_nkeepint ) //tuk09 เอาอันเก่าออก
	
	ldc_fwintarrear = ldc_fwintarrear - ldc_intarrpay //tuk10
	ldc_fwintreturn = ldc_fwintreturn - ldc_intreturnpay //tuk11
	ldc_fwintperiod = ldc_nkeepint - ldc_intperiodpay //tuk12
	ldc_fwintarrear = ldc_fwintarrear + ldc_fwintperiod //tuk13
	
	ldc_intarrbal = ldc_fwintarrear //tuk14
	
	ldc_wtdamtbal	= ldc_bfwtdamt
	
	// ถ้าดอกเบี้ยที่ตั้งค้างติดลบ
	if ldc_intarrbal < 0 then ldc_intarrbal = 0

	// พวก ต้นเงิน,ด/บ ชำระสะสม
	ldc_bfintaccum		= ldc_bfintaccum + ldc_intpay
	ldc_bfintpayall		= ldc_bfintpayall + ldc_intpay
	ldc_bfprnpayall		= ldc_bfprnpayall + ldc_prnpay
	
	li_laststmno ++

	// ถ้าเป็นสัญญา OD ต้องเพิ่มยอดรอเบิก
	if li_odflag = 1 then
		ldc_wtdamtbal	= ldc_apvamt - ldc_prnbal
	end if

	// งวดชำระเงิน
	if li_period > li_bfperiod then
		/*กรณีงวดเรียกเก็บมากกว่างวดปัจจุบัน*/
		li_lastperiod = li_period
	else
		/*กรณีงวดเรียกเก็บเท่ากับงวดปัจจุบันให้เพิ่มอีกงวด*/
		li_lastperiod = li_bfperiod + 1
	end if
	
	// วันที่คิด ด/บ ล่าสุด
	if ldtm_calintto > ldtm_bflastcalint then
		ldtm_lastcaldate = ldtm_calintto
	end if
	
	// วันที่ชำระล่าสุด
	if ldtm_receiptdate > ldtm_bflastpay or isnull( ldtm_bflastpay ) then
		ldtm_lastpaydate = ldtm_receiptdate
	end if
	
	// เรียกเก็บล่าสุด
	if ldtm_receiptdate > ldtm_bflastkeep or isnull( ldtm_bflastkeep ) then
		ldtm_lastkeepdate = ldtm_receiptdate
	end if

	// ถ้าหมดและไม่เป็นบัญชี OD ปิดสัญญา
	if ldc_prnbal = 0 and ldc_wtdamtbal = 0 and ldc_intarrbal = 0 and li_odflag = 0 then
		li_contstatus	= STATUS_CLOSE
	else
		li_contstatus	= li_bfcontstatus
	end if
	
	// ส่วนของการ Set ยอด ด/บ ค้างตัดจ่าย
	// init ค่ายอดค้างรับไว้ก่อน
	ldc_intarrsetbal	= ldc_bfintarrset
	
	// ถ้าไม่ Gen voucher ไว้ก็เปลี่ยนไปตามยอดค้างคงเหลือ ณวันที่ตัดยอด
	// แต่ถ้า Gen ไปแล้วห้ามเปลี่ยนค่า เพราะจะทำให้ยอด ด/บ ค้างตัดจ่ายไม่ตรงกับบัญชีได้
	if ( ldc_intarrpay > 0 or ldc_bfintarrset > 0 ) and li_genvcflag = 0 then
		if li_keepstatus = -99 then
			ldc_intarrpay	= 0
		else
			if ldc_bfintarrset > ldc_intpay then
				ldc_intarrpay	= ldc_intpay
			else
				ldc_intarrpay	= ldc_bfintarrset
			end if
		end if
		
		ldc_intarrsetbal		= ldc_intarrsetbal - ldc_intarrpay
	end if
	
	// ผ่านรายการไป master det
	li_ret = this.of_post_tomastdet_lon( ls_kpslipno, li_seqno, ldtm_entrydate ) 
	if ( li_ret <> 1 ) then
		destroy lds_loan
		return -1
	end if

	// ถ้าเป็นสัญญายกเลิกกระดาษทำการ Update วันที่อย่างเดียวแล้วข้ามทำอันต่อไป
	if li_keepstatus <> 1 then
		update	lncontmaster
		set			lastkeeping_date	= :ldtm_lastkeepdate,
					lastprocess_date	= :ldtm_lastkeepdate
		where	coop_id				= :ls_bizzcoopid
		and		( loancontract_no	= :ls_contno ) 
		using itr_sqlca;
		
		if ( itr_sqlca.sqlcode <> 0 ) then
			destroy lds_loan
			ithw_exception.text +="~nพบข้อผิดพลาดในการปรับปรุงสัญญา : "+ls_contno
			ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
			ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
			ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
			return -1
		end if
		
		continue
	end if

	inv_progress.istr_progress.subprogress_text	= string( ll_index , "#,##0" ) + "/" + string( ll_count , "#,##0" ) + ". ทะเบียน "+ls_memno+" เงินต้น "+string(ldc_prnpay,"#,##0.00")+" ด/บ "+string(ldc_intpay, "#,##0.00")

	update	lncontmaster
	set		principal_balance	= :ldc_prnbal,
			withdrawable_amt	= :ldc_wtdamtbal,
			last_periodpay		= :li_lastperiod,
			lastpayment_date	= :ldtm_lastpaydate,
			lastcalint_date		= :ldtm_lastcaldate,
			lastkeeping_date	= :ldtm_lastkeepdate,
			last_stm_no			= :li_laststmno,
			principal_arrear	= :ldc_prnarrbal,
			interest_arrear		= :ldc_intarrbal,
			interest_return		= :ldc_fwintreturn, //tuk15
			intmonth_arrear	= 0,
			intset_arrear		= :ldc_intarrsetbal,
			interest_accum		= :ldc_bfintaccum,
			intpayment_amt	= :ldc_bfintpayall,
			prnpayment_amt	= :ldc_bfprnpayall,
			nkeep_principal		= 0,
		 	nkeep_interest		= 0,
			rkeep_principal		= 0,
			rkeep_interest		= 0,
			contract_status		= :li_contstatus,
			countpay_flag		= 1
	where coop_id				= :ls_bizzcoopid
	and 	( loancontract_no	= :ls_contno ) 
	using itr_sqlca;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุงสัญญา : "+ls_contno
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
		ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// บันทึกดอกเบี้ยสะสมให้สมาชิก
	update	mbmembmaster
	set			accum_interest		= accum_interest + :ldc_intpay
	where	coop_id				= :is_coopid
	and		( member_no 		= :ls_memno )
	using		itr_sqlca;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุง ด/บ สะสมของสมาชิก "
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
		ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
		return -1
	end if

	// บันทึกลง Statement
	insert into lncontstatement
			( coop_id,				loancontract_no,		seq_no,					slip_date,				operate_date,			account_date,			intaccum_date,
			  ref_slipno,				ref_docno,				loanitemtype_code,	
			  period,		 			principal_payment,	interest_payment,		principal_balance,		
			  prncalint_amt,		calint_from,				calint_to,					bfintarrear_amt,		bfintreturn_amt,		interest_period,
			  interest_arrear,		interest_return,			moneytype_code,		item_status,				entry_id,					entry_date ,
			  entry_bycoopid )
	values ( :ls_bizzcoopid,		:ls_contno,				:li_laststmno,			:ldtm_receiptdate,		:ldtm_receiptdate,		:ldtm_receiptdate,		:ldtm_receiptdate,
			   :ls_kpslipno,			:ls_receiptno,			:ls_loanitem,
			   :li_lastperiod,		:ldc_prnpay,				:ldc_intpay,				:ldc_prnbal,
			   :ldc_bfprnbal,		:ldtm_calintfrom,		:ldtm_calintto,			:ldc_bfintarr,			:ldc_bfintreturn,		:ldc_nkeepint,
			   :ldc_intarrbal,		:ldc_bfintreturn,		'TRN',						1,							:is_userid,				:ldtm_entrydate ,
			   :is_coopid)
	using itr_sqlca ;

	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการบันทึก Statement สัญญา : "+ls_contno
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
		ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
		return -1
	end if

next	

destroy lds_loan

return 1
end function

protected function integer of_post_toloanintarr () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการค้างสัญญาเงินกู้
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
	Version 2.0 (Initial version) Modified Date 23/05/2012 by Godji
</usage> 
***********************************************************/
string		ls_kpslipno , ls_memcoopid
string		ls_memno, ls_refmemno, ls_contno, ls_receiptno, ls_loanitem, ls_loantype, ls_keeptype, ls_trnfromcontno
string		ls_memprior, ls_refprior, ls_cancelid
integer	li_period, li_bfperiod, li_lastperiod, li_seqno, li_laststmno, li_ret, li_trnstatus
integer	li_odflag, li_bfcontstatus, li_contstatus, li_bfcontlaw, li_keepstatus
long		ll_index, ll_count
dec{2}	ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_itembal
dec{2}	ldc_bfprnbal, ldc_bfwtdbal, ldc_bfintarr, ldc_bfintarrmth, ldc_bfintarrset, ldc_bfintaccont, ldc_bfintreturn
dec{2}	ldc_intarrbal
dec{2}	ldc_bfintpayall
datetime	ldtm_receiptdate, ldtm_calintfrom, ldtm_calintto, ldtm_bflastpay, ldtm_bflastcalint, ldtm_bflastkeep
datetime	ldtm_entrydate, ldtm_lastpaydate, ldtm_lastkeepdate, ldtm_canceldate
n_ds		lds_loan

ldtm_entrydate	= datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "ดอกเบี้ยค้างชำระ"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_loan	= create n_ds
lds_loan.dataobject	= "d_kp_rcvpost_loanintarr"
lds_loan.settransobject( itr_sqlca )

inv_kpsrv.of_setsqlselect( "kptempreceive" )
if inv_kpsrv.of_setsqldw( lds_loan ) <> 1 then
	destroy lds_loan
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL สร้างรายงานงบหน้าประจำเดือน(1)"
	return -1
end if

if inv_kpsrv.of_setsqldw_coop_recvperiod( lds_loan , "kptempreceive" ) <> 1 then
	destroy lds_loan
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL สร้างรายงานงบหน้าประจำเดือน(2)"
	return -1
end if

if ii_chkbaldept = 1 then 
	if this.of_set_sql_chkdpbal( lds_loan , "kptempreceive" ) <> 1 then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL ตรวจสอบเงินฝากคงเหลือ"
		return -1
	end if
end if

ll_count	= lds_loan.retrieve()

inv_progress.istr_progress.subprogress_max		= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index

	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_loan
		return 0
	end if
	
	ls_kpslipno			= trim( lds_loan.object.kpslip_no[ll_index] )
	ls_memcoopid		= trim( lds_loan.object.memcoop_id[ll_index] )
	ls_memno			= trim( lds_loan.getitemstring( ll_index, "member_no" ) )
	ls_refmemno		= trim( lds_loan.getitemstring( ll_index, "ref_membno" ) )
	ls_contno			= trim( lds_loan.getitemstring( ll_index, "loancontract_no" ) )
	ls_receiptno			= trim( lds_loan.getitemstring( ll_index, "receipt_no" ) )
	ls_loantype			= trim( lds_loan.getitemstring( ll_index, "shrlontype_code" ) )
	ls_keeptype			= lds_loan.getitemstring( ll_index, "keepitemtype_code" )
	ls_cancelid			= lds_loan.getitemstring( ll_index, "cancel_id" )
	li_seqno				= lds_loan.getitemnumber( ll_index, "seq_no" )
	li_period				= lds_loan.getitemnumber( ll_index, "period" )
	li_bfperiod			= lds_loan.getitemnumber( ll_index, "last_periodpay" )
	li_odflag				= lds_loan.getitemnumber( ll_index, "od_flag" )
	li_bfcontstatus		= lds_loan.getitemnumber( ll_index, "contract_status" )
	li_bfcontlaw			= lds_loan.getitemnumber( ll_index, "contlaw_status" )
	li_keepstatus		= lds_loan.getitemnumber( ll_index, "keepitem_status" )
	li_laststmno			= lds_loan.getitemnumber( ll_index, "last_stm_no" )
	ldc_intpay			= lds_loan.getitemdecimal( ll_index, "interest_payment" )
	ldc_intarrpay		= lds_loan.getitemdecimal( ll_index, "intarrear_payment" )
	ldc_itempay			= lds_loan.getitemdecimal( ll_index, "item_payment" )
	ldc_itembal			= lds_loan.getitemdecimal( ll_index, "item_balance" )
	ldc_bfprnbal			= lds_loan.getitemdecimal( ll_index, "principal_balance" )
	ldc_bfwtdbal		= lds_loan.getitemdecimal( ll_index, "withdrawable_amt" )
	ldc_bfintarr			= lds_loan.getitemdecimal( ll_index, "interest_arrear" )
	ldc_bfintarrmth		= lds_loan.getitemdecimal( ll_index, "intmonth_arrear" )
	ldc_bfintarrset		= lds_loan.getitemdecimal( ll_index, "intset_arrear" )
	ldc_bfintreturn		= lds_loan.getitemdecimal( ll_index, "interest_return" )
	ldc_bfintpayall		= lds_loan.getitemdecimal( ll_index, "intpayment_amt" )
	ldtm_receiptdate	= lds_loan.getitemdatetime( ll_index, "receipt_date" )
	ldtm_calintfrom		= lds_loan.getitemdatetime( ll_index, "calintfrom_date" )
	ldtm_calintto		= lds_loan.getitemdatetime( ll_index, "calintto_date" )
	ldtm_bflastpay		= lds_loan.getitemdatetime( ll_index, "lastpayment_date" )
	ldtm_bflastkeep	= lds_loan.getitemdatetime( ll_index, "lastkeeping_date" )
	ldtm_canceldate	= lds_loan.getitemdatetime( ll_index, "cancel_date" )

	li_trnstatus			= lds_loan.getitemnumber( ll_index, "transfer_status" )
	ls_trnfromcontno	= lds_loan.getitemstring( ll_index, "trnfrom_contno" )

	if isnull( li_laststmno ) then li_laststmno = 0
	if isnull( li_bfperiod ) then li_bfperiod = 0
	if isnull( li_odflag ) then li_odflag = 0
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_bfprnbal ) then ldc_bfprnbal = 0
	if isnull( ldc_bfwtdbal ) then ldc_bfwtdbal = 0
	if isnull( ldc_bfintarr ) then ldc_bfintarr = 0
	if isnull( ldc_bfintarrmth ) then ldc_bfintarrmth = 0
	if isnull( ldc_bfintarrset ) then ldc_bfintarrset = 0
	if isnull( ldc_bfintaccont ) then ldc_bfintaccont = 0
	if isnull( ldc_bfintpayall ) then ldc_bfintpayall = 0

	// กำหนดค่าต่าง ๆ
	ls_loanitem		= "LPM"
	
	// -------------- เริ่มกระบวนการ ตรวจเช็ค ตัดยอด ------------------------------
	// พวกที่ตัดยอดหรือเพิ่มยอดได้เลย
	ldc_intarrbal		= ldc_bfintarr - ldc_intpay
	
	// ถ้าดอกเบี้ยที่ตั้งค้างติดลบ
	if ldc_intarrbal < 0 then ldc_intarrbal = 0

	// พวก ต้นเงิน,ด/บ ชำระสะสม
	ldc_bfintaccont		= ldc_bfintaccont + ldc_intpay
	ldc_bfintpayall		= ldc_bfintpayall + ldc_intpay
	
	li_laststmno ++

	// วันที่ชำระล่าสุด
	if ldtm_receiptdate > ldtm_bflastpay or isnull( ldtm_bflastpay ) then
		ldtm_lastpaydate = ldtm_receiptdate
	end if
	
	// เรียกเก็บล่าสุด
	if ldtm_receiptdate > ldtm_bflastkeep or isnull( ldtm_bflastkeep ) then
		ldtm_lastkeepdate = ldtm_receiptdate
	end if

	// ถ้าหมดและไม่เป็นบัญชี OD ปิดสัญญา
	if ldc_bfprnbal = 0 and ldc_bfwtdbal = 0 and ldc_intarrbal = 0 and li_odflag = 0 then
		li_contstatus	= STATUS_CLOSE
	else
		li_contstatus	= li_bfcontstatus
	end if
	
	// ผ่านรายการไป master det
	li_ret = this.of_post_tomastdet( ls_kpslipno, li_seqno, ldtm_entrydate ) 
	if ( li_ret <> 1 ) then
		destroy lds_loan
		return -1
	end if

	// ถ้าเป็นสัญญายกเลิกกระดาษทำการ Update วันที่อย่างเดียวแล้วข้ามทำอันต่อไป
	if li_keepstatus <> 1 then
		update	lncontmaster
		set			lastkeeping_date	= :ldtm_lastkeepdate,
					lastprocess_date	= :ldtm_lastkeepdate
		where	coop_id				= :is_coopid
		and		( loancontract_no	= :ls_contno ) 
		using itr_sqlca;
		
		if ( itr_sqlca.sqlcode <> 0 ) then
			destroy lds_loan
			ithw_exception.text +="~nพบข้อผิดพลาดในการปรับปรุงสัญญา : "+ls_contno
			ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
			ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
			ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
			return -1
		end if
		
		continue
	end if

	inv_progress.istr_progress.subprogress_text	= string( ll_index , "#,##0" ) + "/" + string( ll_count , "#,##0" )  +". ทะเบียน "+ls_memno+" ด/บ "+string(ldc_intpay, "#,##0.00")

	update	lncontmaster
	set			lastpayment_date	= :ldtm_lastpaydate,
				lastkeeping_date	= :ldtm_lastkeepdate,
				last_stm_no			= :li_laststmno,
				interest_arrear		= :ldc_intarrbal,
				intmonth_arrear	= 0,
				interest_accum		= :ldc_bfintaccont,
				intpayment_amt	= :ldc_bfintpayall,
				contract_status		= :li_contstatus,
				countpay_flag		= 1
	where 	coop_id				= :is_coopid
	and		( loancontract_no	= :ls_contno ) 
	using itr_sqlca;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุงสัญญา : "+ls_contno
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
		ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// บันทึกดอกเบี้ยสะสมให้สมาชิก
	update	mbmembmaster
	set			accum_interest	= accum_interest + :ldc_intpay
	where	coop_id			= :is_coopid
	and		( member_no 	= :ls_memno )
	using		itr_sqlca;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุง ด/บ สะสมของสมาชิก "
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
		ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// บันทึกลง Statement
	insert into lncontstatement
			( coop_id,				loancontract_no,		seq_no,					slip_date,				operate_date,			account_date,
			  ref_slipno,				ref_docno,				loanitemtype_code,	
			  period,		 			principal_payment,	interest_payment,		principal_balance,		
			  prncalint_amt,		calint_from,				calint_to,					bfintarrear_amt,		bfintreturn_amt,		interest_period,
			  interest_arrear,		interest_return,			moneytype_code,		item_status,				entry_id,					entry_date )
	values ( :is_coopid	,			:ls_contno,			:li_laststmno,			:ldtm_receiptdate,		:ldtm_receiptdate,		:ldtm_receiptdate,
			   :ls_receiptno,		:ls_receiptno,			:ls_loanitem,
			   :li_lastperiod,		0,							:ldc_intpay,				:ldc_bfprnbal,
			   0,						:ldtm_calintfrom,		:ldtm_calintto,			:ldc_bfintarr,			:ldc_bfintreturn,		0,
			   :ldc_intarrbal,		:ldc_bfintreturn,		'TRN',						1,							:is_userid,				:ldtm_entrydate )
	using itr_sqlca ;

	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการบันทึก Statement สัญญา : "+ls_contno
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
		ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
		return -1
	end if
	
next	

destroy lds_loan

return 1
end function

protected function integer of_post_tomast () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการหัวใบเสร็จไปที่ kpmastreceive เฉพาะพวกที่ทำรายการ
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/05/2012 by Godji
</usage> 
***********************************************************/
string ls_sql , ls_sqlext 

inv_progress.istr_progress.progress_text		= "สร้างใบเสร็จรับเงิน"
inv_progress.istr_progress.subprogress_text	= "กำลังทำรายการ"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 1

inv_kpsrv.of_getsqlselect(ls_sqlext)

ls_sql		= "insert into kpmastreceive"
ls_sql		+= " ( 	coop_id , 			kpslip_no , 				memcoop_id , 			member_no , 			recv_period , 		refmemcoop_id , 		ref_membno , "
ls_sql		+= " 		membtype_code , department_code , 	membsection_code , 	membgroup_code , 	process_date , " 
ls_sql		+= " 		receipt_no , 		receipt_date , 			operate_date , 			sharestkbf_value , 	sharestk_value , 	interest_accum , "
ls_sql		+= " 		keeping_status , 	receive_amt , 			money_text , 			grt_list , 					misspay_status , 	savedisk_type ) "
ls_sql		+= " select "
ls_sql		+= " 		coop_id , 			kpslip_no , 				memcoop_id , 			member_no , 			recv_period , 		refmemcoop_id , 		ref_membno , "
ls_sql		+= " 		membtype_code , 	department_code , 	membsection_code ,	membgroup_code , 	process_date , 	"
ls_sql		+= " 		receipt_no , 		receipt_date , 			operate_date , 			sharestkbf_value , 	sharestk_value , 	interest_accum , "
ls_sql		+= " 		keeping_status ,	receive_amt , 			money_text , 			grt_list , 					misspay_status , 	savedisk_type "
ls_sql		+= " from kptempreceive , (	select 	coop_id as tp_coop, kpslip_no as tp_kpslip "
ls_sql		+= " 								from 		kptempreceive "
ls_sql		+= " 								where 	coop_id = '" + is_coopid + "'"
ls_sql		+= " 								and 		recv_period = '" + is_recvperiod + "'"
ls_sql		+= " 								minus "
ls_sql		+= " 								select 	coop_id as tp_coop, kpslip_no as tp_kpslip "
ls_sql		+= " 								from 		kpmastreceive "
ls_sql		+= " 								where 	coop_id = '" + is_coopid + "'"
ls_sql		+= " 								and 		recv_period = '" + is_recvperiod + "'"
ls_sql		+= " 								) tp "
ls_sql		+= " where coop_id = '" + is_coopid + "'"
ls_sql		+= " and recv_period = '" + is_recvperiod + "'"
ls_sql		+= " and coop_id = tp_coop "
ls_sql		+= " and kpslip_no = tp_kpslip "
ls_sql		+= ls_sqlext

execute immediate :ls_sql using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "~r~nสร้างใบเสร็จเรียกเก็บประจำเดือน(Kpmastreceive) พบข้อผิดพลาด"
	ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"
	ithw_exception.text	+= "~r~n" + string( itr_sqlca.sqlcode )
	ithw_exception.text	+= "~r~n"+itr_sqlca.sqlerrtext
	return -1
end if

inv_progress.istr_progress.subprogress_text	= "ทำรายการเสร็จเรียบร้อย..."
inv_progress.istr_progress.subprogress_index	= 1

return 1
end function

protected function integer of_post_tomastdet (string as_kpslipno, integer ai_seqno, datetime adtm_postdate) throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการหัวใบเสร็จไปที่ kpmastreceivedet
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
// บันทึกการผ่านรายการ
update	kptempreceivedet
set			posting_status	= 1,
			posting_date	= :adtm_postdate
where( kptempreceivedet.coop_id			= :is_coopid ) and
		( kptempreceivedet.kpslip_no	= :as_kpslipno ) and
		( kptempreceivedet.seq_no		= :ai_seqno )
using itr_sqlca;
		
if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	+= "~r~nอัพเดทการผ่านรายการใบเสร็จ พบข้อผิดพลาด"
	ithw_exception.text	+= "~r~nเลขที่ใบเสร็จ : " + as_kpslipno
	ithw_exception.text	+= "~r~nลำดับรายการ : " + string ( ai_seqno , "#,##0" )	
	ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"
	ithw_exception.text	+= "~r~n" + string( itr_sqlca.sqlcode )
	ithw_exception.text	+= "~r~n" + itr_sqlca.sqlerrtext
	return -1
end if

insert into kpmastreceivedet
(			coop_id , 				kpslip_no , 			seq_no , 					memcoop_id , 			member_no , 
			recv_period , 			refmemcoop_id , 	keepitemtype_code , 	shrlontype_code , 		bizzcoop_id , 
			item_seqno ,			loancontract_no , 	description , period , 	principal_payment , 	interest_payment , 
			intarrear_payment , 	item_payment , 	item_balance , 			calintfrom_date , 		calintto_date , 
			principal_period , 		interest_period , 	bfprinbalance_amt , 	bfperiod , 				bflastcalint_date , 
			bflastpay_date , 		bfinterest_arrear , bfintmonth_arrear ,	bfintyear_arrear , 		bfprincipal_arrear , 
			bfcontract_status , 	bfcontract_type , 	keepitem_status , 		posting_date ,			bfcontlaw_status ,
			cancel_id ,				cancel_date )

select 	coop_id , 				kpslip_no , 			seq_no , 					memcoop_id , 			member_no , 
			recv_period , 			refmemcoop_id , 	keepitemtype_code , 	shrlontype_code , 		bizzcoop_id , 
			item_seqno ,			loancontract_no , 	description , period , 	principal_payment , 	interest_payment , 
			intarrear_payment , 	item_payment , 	item_balance , 			calintfrom_date , 		calintto_date , 
			principal_period , 		interest_period , 	bfprinbalance_amt , 	bfperiod , 				bflastcalint_date , 
			bflastpay_date , 		bfinterest_arrear , bfintmonth_arrear ,	bfintyear_arrear , 		bfprincipal_arrear , 
			bfcontract_status , 	bfcontract_type , 	keepitem_status , 		:adtm_postdate ,		bfcontlaw_status ,
			cancel_id ,				cancel_date 
from 		kptempreceivedet
where	coop_id		= :is_coopid
and		kpslip_no		= :as_kpslipno
and		seq_no		= :ai_seqno
using itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	+= "~r~nรายการใบเสร็จ พบข้อผิดพลาด"
	ithw_exception.text	+= "~r~nเลขที่ใบเสร็จ : " + as_kpslipno
	ithw_exception.text	+= "~r~nลำดับรายการ : " + string ( ai_seqno , "#,##0" )
	ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"
	ithw_exception.text	+= "~r~n" + string( itr_sqlca.sqlcode )
	ithw_exception.text	+= "~r~n" + itr_sqlca.sqlerrtext
	return -1
end if

return 1
end function

protected function integer of_post_tomastdet_lon (string as_kpslipno, integer ai_seqno, datetime adtm_postdate) throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการหัวใบเสร็จไปที่ kpmastreceivedet
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
// บันทึกการผ่านรายการ
update	kptempreceivedet
set			posting_status	= 1,
			posting_date	= :adtm_postdate
where( kptempreceivedet.coop_id			= :is_coopid ) and
		( kptempreceivedet.kpslip_no	= :as_kpslipno ) and
		( kptempreceivedet.seq_no		= :ai_seqno )
using itr_sqlca;
		
if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	+= "~r~nอัพเดทการผ่านรายการใบเสร็จ พบข้อผิดพลาด"
	ithw_exception.text	+= "~r~nเลขที่ใบเสร็จ : " + as_kpslipno
	ithw_exception.text	+= "~r~nลำดับรายการ : " + string ( ai_seqno , "#,##0" )	
	ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"
	ithw_exception.text	+= "~r~n" + string( itr_sqlca.sqlcode )
	ithw_exception.text	+= "~r~n" + itr_sqlca.sqlerrtext
	return -1
end if

insert into kpmastreceivedet
(			coop_id , 					kpslip_no , 				seq_no , 						memcoop_id , 				member_no , 
			recv_period , 				refmemcoop_id , 		keepitemtype_code , 		shrlontype_code , 			bizzcoop_id , 
			item_seqno ,				loancontract_no , 		description , period , 		principal_payment , 		interest_payment , 
			intarrear_payment , 		item_payment , 		item_balance , 				calintfrom_date , 			calintto_date , 
			principal_period , 			interest_period , 		bfprinbalance_amt , 		bfperiod , 					bflastcalint_date , 
			bflastpay_date , 			bfinterest_arrear , 	bfintmonth_arrear ,		bfintyear_arrear , 			bfprincipal_arrear , 
			bfcontract_status , 		bfcontract_type , 		keepitem_status , 			posting_date ,				bfcontlaw_status ,
			cancel_id ,					cancel_date )

select 	kd.coop_id , 				kd.kpslip_no , 			kd.seq_no , 					kd.memcoop_id , 			kd.member_no , 
			kd.recv_period , 			kd.refmemcoop_id , 	kd.keepitemtype_code , 	kd.shrlontype_code , 		kd.bizzcoop_id , 
			kd.item_seqno ,			kd.loancontract_no , 	kd.description , period , 	kd.principal_payment , 	kd.interest_payment , 
			kd.intarrear_payment , 	kd.item_payment , 	kd.item_balance , 			kd.calintfrom_date , 		kd.calintto_date , 
			kd.principal_period , 		kd.interest_period , 	lm.principal_balance , 	lm.last_periodpay , 		lm.lastcalint_date , 
			lm.lastpayment_date ,	lm.interest_arrear , 	lm.intmonth_arrear ,		lm.intset_arrear , 			lm.principal_arrear , 
			lm.contract_status , 		lm.contract_type , 		kd.keepitem_status , 		:adtm_postdate ,			lm.contlaw_status ,
			kd.cancel_id ,				kd.cancel_date
from 		kptempreceivedet kd , lncontmaster lm
where	kd.bizzcoop_id			= lm.coop_id
and		kd.loancontract_no	= lm.loancontract_no
and 		kd.coop_id				= :is_coopid
and		kd.kpslip_no				= :as_kpslipno
and		kd.seq_no				= :ai_seqno
using itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	+= "~r~nรายการใบเสร็จ พบข้อผิดพลาด"
	ithw_exception.text	+= "~r~nเลขที่ใบเสร็จ : " + as_kpslipno
	ithw_exception.text	+= "~r~nลำดับรายการ : " + string ( ai_seqno , "#,##0" )
	ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"
	ithw_exception.text	+= "~r~n" + string( itr_sqlca.sqlcode )
	ithw_exception.text	+= "~r~n" + itr_sqlca.sqlerrtext
	return -1
end if

return 1
end function

protected function integer of_post_tomastdet_shr (string as_kpslipno, integer ai_seqno, datetime adtm_postdate) throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการหัวใบเสร็จไปที่ kpmastreceivedet
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
// บันทึกการผ่านรายการ
update	kptempreceivedet
set			posting_status	= 1,
			posting_date	= :adtm_postdate
where( kptempreceivedet.coop_id			= :is_coopid ) and
		( kptempreceivedet.kpslip_no	= :as_kpslipno ) and
		( kptempreceivedet.seq_no		= :ai_seqno )
using itr_sqlca;
		
if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	+= "~r~nอัพเดทการผ่านรายการใบเสร็จ พบข้อผิดพลาด"
	ithw_exception.text	+= "~r~nเลขที่ใบเสร็จ : " + as_kpslipno
	ithw_exception.text	+= "~r~nลำดับรายการ : " + string ( ai_seqno , "#,##0" )	
	ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"
	ithw_exception.text	+= "~r~n" + string( itr_sqlca.sqlcode )
	ithw_exception.text	+= "~r~n" + itr_sqlca.sqlerrtext
	return -1
end if

insert into kpmastreceivedet
(			coop_id , 						kpslip_no , 					seq_no , 							memcoop_id ,				member_no , 
			recv_period , 					refmemcoop_id , 			keepitemtype_code , 			shrlontype_code , 			bizzcoop_id , 
			item_seqno ,					loancontract_no , 			description , period , 			principal_payment , 		interest_payment , 
			intarrear_payment , 			item_payment , 			item_balance , 					calintfrom_date , 			calintto_date , 
			principal_period , 				interest_period , 			bfprinbalance_amt , 			bfperiod , 					bflastcalint_date , 
			bflastpay_date , 				bfinterest_arrear , 		bfintmonth_arrear ,			bfintyear_arrear , 			bfprincipal_arrear , 
			bfcontract_status , 			bfcontract_type , 			keepitem_status , 				posting_date ,				bfcontlaw_status ,
			cancel_id ,						cancel_date )

select 	kd.coop_id , 					kd.kpslip_no , 				kd.seq_no , 						kd.memcoop_id , 			kd.member_no , 
			kd.recv_period , 				kd.refmemcoop_id , 		kd.keepitemtype_code , 		kd.shrlontype_code , 		kd.bizzcoop_id , 
			kd.item_seqno ,				kd.loancontract_no , 		kd.description , period , 		kd.principal_payment , 	kd.interest_payment , 
			kd.intarrear_payment , 		kd.item_payment , 		kd.item_balance , 				kd.calintfrom_date , 		kd.calintto_date , 
			kd.principal_period , 			kd.interest_period , 		kd.bfprinbalance_amt , 		sm.last_period , 			kd.bflastcalint_date , 
			kd.bflastpay_date , 			kd.bfinterest_arrear , 	kd.bfintmonth_arrear ,		kd.bfintyear_arrear , 		kd.bfprincipal_arrear , 
			sm.sharemaster_status , 	kd.bfcontract_type , 		kd.keepitem_status , 			:adtm_postdate ,			kd.bfcontlaw_status ,
			kd.cancel_id ,					kd.cancel_date 
from 		kptempreceivedet kd , shsharemaster sm
where	kd.memcoop_id		= sm.coop_id
and		kd.member_no			= sm.member_no
and		kd.coop_id				= :is_coopid
and		kd.kpslip_no				= :as_kpslipno
and		kd.seq_no				= :ai_seqno
using itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	+= "~r~nรายการใบเสร็จ พบข้อผิดพลาด"
	ithw_exception.text	+= "~r~nเลขที่ใบเสร็จ : " + as_kpslipno
	ithw_exception.text	+= "~r~nลำดับรายการ : " + string ( ai_seqno , "#,##0" )
	ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"
	ithw_exception.text	+= "~r~n" + string( itr_sqlca.sqlcode )
	ithw_exception.text	+= "~r~n" + itr_sqlca.sqlerrtext
	return -1
end if

return 1
end function

protected function integer of_post_toother () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการเรียกเก็บอื่น ๆ
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
	Version 2.0 (Initial version) Modified Date 24/05/2012 by Godji
</usage> 
***********************************************************/
string		ls_kpslipno , ls_memcoopid
string		ls_memno, ls_refmemno, ls_memprior, ls_refprior, ls_sqlext, ls_temp, ls_sqlexttemp
string		ls_kpitemtype , ls_shrlontype
string		ls_errtxt
integer	li_rcvseqno, li_stepvalue, li_chk, li_keepstatus, li_ret
long		ll_index, ll_count
dec{2}	ldc_otheramt
datetime	ldtm_entrydate , ldtm_receiptdate
n_ds		lds_other

ldtm_entrydate	= datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "เรียกเก็บอื่น ๆ"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_other	= create n_ds
lds_other.dataobject	= "d_kp_rcvpost_other"
lds_other.settransobject( itr_sqlca )

inv_kpsrv.of_setsqlselect( "kptempreceive" )
if inv_kpsrv.of_setsqldw( lds_other ) <> 1 then
	destroy lds_other
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL สร้างรายงานงบหน้าประจำเดือน(1)"
	return -1
end if

if inv_kpsrv.of_setsqldw_coop_recvperiod( lds_other , "kptempreceive" ) <> 1 then
	destroy lds_other
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL สร้างรายงานงบหน้าประจำเดือน(2)"
	return -1
end if

if ii_chkbaldept = 1 then 
	if this.of_set_sql_chkdpbal( lds_other , "kptempreceive" ) <> 1 then
		destroy lds_other
		ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL ตรวจสอบเงินฝากคงเหลือ"
		return -1
	end if
end if

ll_count = lds_other.retrieve()
inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index

	yield()
	if inv_progress.of_is_stop() then
		destroy lds_other
		return 0
	end if
	
	ls_kpslipno			= lds_other.object.kpslip_no[ll_index]
	ls_memcoopid		= lds_other.object.memcoop_id[ll_index]
	ls_memno			= trim( lds_other.getitemstring( ll_index, "member_no" ) )
	ls_refmemno		= trim( lds_other.getitemstring( ll_index, "ref_membno" ) )
	ls_kpitemtype		= trim( lds_other.getitemstring( ll_index, "keepitemtype_code" ) )
	ls_shrlontype		= trim( lds_other.getitemstring( ll_index, "shrlontype_code" ) )
	ldc_otheramt		= lds_other.getitemdecimal( ll_index, "item_payment" )
	li_rcvseqno			= lds_other.getitemnumber( ll_index, "seq_no" )
	li_keepstatus		= lds_other.getitemnumber( ll_index, "keepitem_status" )
	ldtm_receiptdate	= lds_other.getitemdatetime( ll_index, "receipt_date" )
	
	// ผ่านรายการไป master det
	li_ret = this.of_post_tomastdet( ls_kpslipno, li_rcvseqno, ldtm_entrydate ) 
	if ( li_ret <> 1 ) then
		return -1
	end if
	
	// ถ้าเป็นรายการยกเลิกข้ามทำอันต่อไป
	if li_keepstatus <> 1 then
		continue
	end if

	inv_progress.istr_progress.subprogress_text	= string( ll_index , "#,##0" ) + "/" + string( ll_count , "#,##0" ) +". ทะเบียน "+ls_memno+" > รายการเรียกเก็บอื่น ๆ "+string(ldc_otheramt, "#,##0.00" )
	
	// บันทีกในส่วน ด/บ สะสมของสมาชิก
	choose case ls_kpitemtype
		case "UIA"
			update	mbmembmaster
			set			accum_interest	= accum_interest + :ldc_otheramt
			where	coop_id	= :ls_memcoopid
			and		( member_no	= :ls_memno )
			using		itr_sqlca ;
		case "UIR"
			update	mbmembmaster
			set			accum_interest	= accum_interest - :ldc_otheramt
			where	coop_id	= :ls_memcoopid
			and		( member_no	= :ls_memno )
			using		itr_sqlca ;
		case "OTH"
//			choose case ls_shrlontype
//				case "WF"
//					update	wcrecievemonth
//					set			carcassrecieve_amt 	= :ldc_otheramt, 
//								carcass_date 			= :ldtm_receiptdate, 
//								status_post				= 1
//					where	'00' || branch_id		= :ls_memcoopid
//					and		recv_period				= :is_recvperiod
//					and		member_no				= :ls_memno
//					and		expense_code 			= 'TKP' 
//					and		status_post 				= 8
//					using		itr_sqlca ;
//				case else
//					// ถ้าเป็นรายการเรียกเก็บอื่นๆ ที่ไม่มีผลต่อด/บสะสมข้ามไปทำอันต่อไปเลย
//					continue ;
//			end choose
	end choose
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		if ls_kpitemtype = "UIA" or ls_kpitemtype = "UIR" then ls_errtxt = "ดอกเบี้ยสะสม"
		if ls_kpitemtype = "OTH" then ls_errtxt = "อื่นๆ"
//		if ls_kpitemtype = "OTH" and ls_shrlontype = "WF" then ls_errtxt = "ฌาปนกิจสงเคราะห์"
		destroy lds_other
		ithw_exception.text ="~nพบข้อผิดพลาดในการปรับปรุงยอดของสมาชิก"
		ithw_exception.text += "~r~nเรื่อง " + ls_errtxt
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~nยอดเงิน : " + string( ldc_otheramt , "#,##0.00" ) + " บาท"
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
		ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
		return -1
	end if
next	

destroy lds_other

return 1
end function

protected function integer of_post_toshare () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการหุ้น
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
	Version 2.0 (Initial version) Modified Date 24/05/2012 by Godji
</usage> 
***********************************************************/
string			ls_kpslipno , ls_memcoopid
string			ls_memno, ls_refmemno, ls_memprior, ls_refprior, ls_receiptno, ls_primemno
string			ls_shritem, ls_sharetype, ls_sqlext, ls_temp, ls_sqlexttemp
integer		li_period, li_lastperiod, li_laststmno, li_seqno, li_stepvalue, li_chk, li_keepstatus, li_ret
long			ll_index, ll_count
dec{2}		ldc_shrperiodamt, ldc_shrperiodvalue, ldc_shrvalue, ldc_shrstkamt
datetime		ldtm_receiptdate
n_ds			lds_share

datetime	ldtm_entrydate

ldtm_entrydate	= datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "ค่าหุ้นรายเดือน"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_share	= create n_ds
lds_share.dataobject	= "d_kp_rcvpost_share"
lds_share.settransobject(itr_sqlca)

inv_kpsrv.of_setsqlselect( "kptempreceive" )
if inv_kpsrv.of_setsqldw( lds_share ) <> 1 then
	destroy lds_share
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL of_post_toshare(1)"
	return -1
end if

if inv_kpsrv.of_setsqldw_coop_recvperiod( lds_share , "kptempreceive" ) <> 1 then
	destroy lds_share
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL of_post_toshare(2)"
	return -1
end if

if ii_chkbaldept = 1 then
	if this.of_set_sql_chkdpbal( lds_share , "kptempreceive" ) <> 1 then
		destroy lds_share
		ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL ตรวจสอบเงินฝากคงเหลือ of_post_toshare(3)"
		return -1
	end if
end if

lds_share.retrieve()

ll_count = lds_share.rowcount()
inv_progress.istr_progress.subprogress_max	= ll_count
ls_primemno = "00000"
for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index
	
	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_share
		return 0
	end if
	
	ls_kpslipno				= trim( lds_share.object.kpslip_no[ll_index] )
	ls_memcoopid			= trim( lds_share.object.memcoop_id[ll_index] )
	ls_memno				= trim( lds_share.getitemstring( ll_index, "member_no" ) )
	ls_refmemno			= trim( lds_share.getitemstring( ll_index, "ref_membno" ) )
	ls_receiptno				= trim( lds_share.getitemstring( ll_index, "receipt_no" ) )
	ls_sharetype			= trim( lds_share.getitemstring( ll_index, "shrlontype_code" ) )
	
	li_seqno					= lds_share.getitemnumber( ll_index, "seq_no" )
	li_period					= lds_share.getitemnumber( ll_index, "period" )
	li_lastperiod				= lds_share.getitemnumber( ll_index, "last_period" )
	li_keepstatus			= lds_share.getitemnumber( ll_index, "keepitem_status" )
	
	ldc_shrperiodvalue		= lds_share.getitemdecimal( ll_index, "item_payment" )
	ldc_shrvalue				= lds_share.getitemdecimal( ll_index, "unitshare_value" )
	ldtm_receiptdate		= lds_share.getitemdatetime( ll_index, "receipt_date" )
	
	//wa กรณี HND มีเรียกเก็บหุ้นเพิ่มจากเงินกู้ ทำให้มีรายการหุ้น 2 บันทัด
	if ls_memno <>  ls_primemno then
		ldc_shrstkamt			= lds_share.getitemdecimal( ll_index, "sharestk_amt" )
		li_laststmno				= lds_share.getitemnumber( ll_index, "last_stm_no" )
	end if
	if isnull( ldc_shrstkamt ) then ldc_shrstkamt = 0
	if isnull( li_lastperiod ) then li_lastperiod = 0
	if isnull( li_laststmno ) then li_laststmno = 0

	// กำหนดค่าต่าง ๆ
	ls_shritem			= "SPM"
	ldc_shrperiodamt	= ldc_shrperiodvalue / ldc_shrvalue
	ldc_shrstkamt		+= ldc_shrperiodamt
	li_laststmno ++
	if li_period > li_lastperiod then li_lastperiod = li_period

	// ผ่านรายการไป master det
	li_ret = this.of_post_tomastdet_shr( ls_kpslipno, li_seqno, ldtm_entrydate ) 
	if ( li_ret <> 1 ) then
		destroy lds_share
		return -1
	end if
	
	// ถ้าเป็นรายการยกเลิกข้ามทำอันต่อไป
	if li_keepstatus <> 1 then
		continue
	end if
	
	inv_progress.istr_progress.subprogress_text	= string( ll_index , "#,##0" ) + "/" + string( ll_count , "#,##0" )  +". ทะเบียน "+ls_memno+" > หุ้นรายเดือน "+string(ldc_shrperiodamt,"#,##0.00")+" > ทุนเรือนหุ้น "+string(ldc_shrstkamt,"#,##0.00")
	
	// บันทึกทุนเรือนหุ้น
	update	shsharemaster
	set			last_period			= :li_lastperiod,	
				sharestk_amt		= :ldc_shrstkamt,
				last_stm_no			= :li_laststmno,
				rkeep_sharevalue	= 0,
				lastkeeping_date	= :ldtm_receiptdate
	where	coop_id				= :ls_memcoopid
	and		( member_no		= :ls_memno ) 
	and		( sharetype_code	= :ls_sharetype ) 
	using itr_sqlca ;
			
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_share
		ithw_exception.text += "~r~nพบข้อผิดพลาดในการปรับปรุงทุนเรือนหุ้นสมาชิก"
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
		ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// บันทึกลง Statement
	insert into shsharestatement
			( 	coop_id , 			member_no, 		sharetype_code, 		seq_no, 			operate_date, 			share_date , 			account_date ,
				slip_date, 			ref_docno, 			shritemtype_code, 	period,			share_amount, 
				sharestk_amt, 		entry_id, 			entry_date, 				moneytype_code ,
				ref_slipno)
	values	
			( 	:ls_memcoopid , 	:ls_memno, 		:ls_sharetype, 			:li_laststmno, 	:ldtm_receiptdate, 	:ldtm_receiptdate, 	:ldtm_receiptdate, 
				:ldtm_receiptdate,	:ls_receiptno, 		:ls_shritem, 			:li_period,		:ldc_shrperiodamt, 
				:ldc_shrstkamt, 	:is_userid, 			:ldtm_entrydate, 		'TMT' ,
				:ls_kpslipno) 
	using itr_sqlca ;
			  
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_share
		ithw_exception.text += "~r~nพบข้อผิดพลาดในการบันทึก Statement หุ้น #"
		ithw_exception.text += "~r~nทะเบียนสมาชิก : " + ls_memno
		ithw_exception.text += "~r~n" + string( itr_sqlca.sqlcode )
		ithw_exception.text += "~r~n" + itr_sqlca.sqlerrtext
		return -1
	end if
	ls_primemno = ls_memno
next	

destroy lds_share

return 1
end function

protected function integer of_postdisplay () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการเบี้ยประกันอัคคีภัย
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

string		ls_memno, ls_refmemno, ls_memprior, ls_refprior
integer	li_rcvseqno, li_ret
long		ll_index, ll_count
n_ds		lds_display

datetime	ldtm_entrydate

ldtm_entrydate = datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "ผ่ายรายการแสดงผลพวกหยุดเก็บ"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_display	= create n_ds
lds_display.dataobject	= "d_kp_rcvpost_display"
lds_display.settransobject( itr_sqlca )

// สร้างชุด SQL สำหรับการดึงรายการ
li_ret = this.of_setsqlselect( lds_display )
if ( li_ret <> 1 ) then
	destroy lds_display
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL รายการแสดงผลพวกหยุดเก็บ"
	return -1
end if

ll_count	= lds_display.retrieve()
inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index
	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_display
		return 0
	end if
	
	ls_memno		= trim( lds_display.getitemstring( ll_index, "member_no" ) )
	ls_refmemno	= trim( lds_display.getitemstring( ll_index, "ref_membno" ) )
	li_rcvseqno		= lds_display.getitemnumber( ll_index, "seq_no" )

	// ผ่านรายการไป master
	if ls_memno <> ls_memprior or ls_refmemno <> ls_refprior then
		li_ret = this.of_posttomast( ls_memno, is_recvperiod, ls_refmemno )
		if ( li_ret <> 1 ) then
			destroy lds_display
			ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการการแสดงผลพวกหยุดเก็บ( Master )~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
			return -1
		end if
		
		ls_memprior	= ls_memno
		ls_refprior	= ls_refmemno
	end if
	
	// ผ่านรายการไป master det
	li_ret = this.of_posttomastdet( ls_memno, is_recvperiod, ls_refmemno, li_rcvseqno, ldtm_entrydate )
	if ( li_ret <> 1 ) then
		destroy lds_display
		ithw_exception.text += "~nnพบข้อผิดพลาดในการผ่านรายการการแสดงผลพวกหยุดเก็บ( Detail )~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
	
	inv_progress.istr_progress.subprogress_text	= string( ll_index ) +". ทะเบียน "+ls_memno+" > รายการหยุดเก็บ "
	
next	

destroy lds_display

return 1
end function

protected function integer of_postffee () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการค่าธรรมเนียมแรกเข้า
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

string			ls_memno, ls_refmemno, ls_memprior, ls_refprior
integer		li_rcvseqno, li_chk, li_keepstatus, li_ret
long			ll_index, ll_count
dec{2}		ldc_feeamt
n_ds	lds_ffee
datetime		ldtm_entrydate

ldtm_entrydate	= datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "ค่าธรรมเนียมแรกเข้า"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_ffee	= create n_ds
lds_ffee.dataobject	= "d_kp_rcvpost_ffee"
lds_ffee.settransobject( itr_sqlca )

//// สร้างชุด SQL สำหรับการดึงรายการ
//li_ret = this.of_setsqlselect( lds_ffee )
//if ( li_ret <> 1 ) then
//	destroy lds_ffee
//	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL รายการค่าธรรมเนียมแรกเข้า"
//	return -1
//end if
//
//ll_count = lds_ffee.retrieve()

inv_kpsrv.of_setsqlselect( "kptempreceive" )
if inv_kpsrv.of_setsqldw( lds_ffee ) <> 1 then
	destroy lds_ffee
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL สร้างรายงานงบหน้าประจำเดือน(1)"
	return -1
end if

if inv_kpsrv.of_setsqldw_coop( lds_ffee , "kptempreceive" ) <> 1 then
	destroy lds_ffee
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL สร้างรายงานงบหน้าประจำเดือน(2)"
	return -1
end if

inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index
	
	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_ffee
		return 0
	end if
	
	ls_memno		= trim( lds_ffee.getitemstring( ll_index, "member_no" ) )
	ls_refmemno	= trim( lds_ffee.getitemstring( ll_index, "ref_membno" ) )
	ldc_feeamt		= lds_ffee.getitemdecimal( ll_index, "item_payment" )
	li_rcvseqno		= lds_ffee.getitemnumber( ll_index, "seq_no" )
	li_keepstatus	= lds_ffee.getitemnumber( ll_index, "keepitem_status" )
	
	// ผ่านรายการไป master
	if ( ls_memno <> ls_memprior ) or ( ls_refmemno <> ls_refprior ) then
		li_ret = this.of_posttomast( ls_memno, is_recvperiod, ls_refmemno )
		if ( li_ret <> 1 ) then
			destroy lds_ffee
			ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการค่าธรรมเนียมแรกเข้า ~r~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
			return -1
		end if

		ls_memprior	= ls_memno
		ls_refprior	= ls_refmemno
	end if
	
	// ผ่านรายการไป master det
	li_ret = this.of_posttomastdet( ls_memno, is_recvperiod, ls_refmemno, li_rcvseqno, ldtm_entrydate )
	if ( li_ret <> 1 ) then	
		destroy lds_ffee
		ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการค่าธรรมเนียมแรกเข้า ~r~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// ถ้าเป็นรายการยกเลิกข้ามทำอันต่อไป
	if ( li_keepstatus <> 1 ) then
		continue
	end if
	
	inv_progress.istr_progress.subprogress_text	= string( ll_index ) +". ทะเบียน "+ls_memno+" > ค่าธรรมเนียมแรกเข้า "+string( ldc_feeamt, "#,##0.00" )
	
	// บันทึกสถานะการเก็บค่าธรรมเนียม
	update	mbmembmaster
	set		firstfee_status	= 1
	where	( member_no	= :ls_memno ) using itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_ffee
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุงสถานะการรับค่าธรรมเนียมแรกเข้า ~r~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
next	

destroy lds_ffee

return 1
end function

protected function integer of_postfire () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการเบี้ยประกันอัคคีภัย
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

string		ls_memno, ls_refmemno, ls_memprior, ls_refprior, ls_insureno
integer		li_rcvseqno, li_chk, li_keepstatus, li_ret
long			ll_index, ll_count
dec{2}		ldc_insureamt
n_ds	lds_insure

datetime	ldtm_entrydate

ldtm_entrydate = datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "ค่าเบี้ยประกันอัคคีภัย"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_insure	= create n_ds
lds_insure.dataobject	= "d_kp_rcvpost_insurefire"
lds_insure.settransobject( itr_sqlca )

// สร้างชุด SQL สำหรับการดึงรายการ
li_ret = this.of_setsqlselect( lds_insure )
if ( li_ret <> 1 ) then
	destroy lds_insure
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL รายการค่าเบี้ยประกันอัคคีภัย"
	return -1
end if

ll_count	= lds_insure.retrieve()
inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index
	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_insure
		return 0
	end if
	
	ls_memno		= trim( lds_insure.getitemstring( ll_index, "member_no" ) )
	ls_refmemno	= trim( lds_insure.getitemstring( ll_index, "ref_membno" ) )
	ls_insureno		= trim( lds_insure.getitemstring( ll_index, "description" ) )
	ldc_insureamt	= lds_insure.getitemdecimal( ll_index, "item_payment" )
	li_rcvseqno		= lds_insure.getitemnumber( ll_index, "seq_no" )
	li_keepstatus	= lds_insure.getitemnumber( ll_index, "keepitem_status" )

	// ผ่านรายการไป master
	if ls_memno <> ls_memprior or ls_refmemno <> ls_refprior then
		li_ret = this.of_posttomast( ls_memno, is_recvperiod, ls_refmemno )
		if ( li_ret <> 1 ) then
			destroy lds_insure
			ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการเบี้ยประกันอัคคีภัย~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
			return -1
		end if
		
		ls_memprior	= ls_memno
		ls_refprior	= ls_refmemno
	end if
	
	// ผ่านรายการไป master det
	li_ret = this.of_posttomastdet( ls_memno, is_recvperiod, ls_refmemno, li_rcvseqno, ldtm_entrydate )
	if ( li_ret <> 1 ) then
		destroy lds_insure
		ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการเบี้ยประกันอัคคีภัย~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// ถ้าเป็นรายการยกเลิกข้ามทำอันต่อไป
	if li_keepstatus <> 1 then
		continue
	end if
	
	inv_progress.istr_progress.subprogress_text	= string( ll_index ) +". ทะเบียน "+ls_memno+" > ค่าเบี้ยประกันอัคคีภัย "+string( ldc_insureamt, "#,##0.00" )
	
	// บันทึกสถานะการเก็บค่าเบี้ยประกัน
	update	lninsurancefire
	set		insurepay_status	= 1
	where	( insurance_no	= :ls_insureno ) using itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_insure
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุงทะเบียนเบี้ยประกันอัคคีภัย~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
next	

destroy lds_insure

return 1
end function

protected function integer of_postloan () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการสัญญาเงินกู้
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
string		ls_memno, ls_refmemno, ls_contno, ls_contprior, ls_receiptno, ls_loanitem, ls_loantype, ls_keeptype, ls_trnfromcontno
string		ls_memprior, ls_refprior, ls_cancelid
integer	li_period, li_bfperiod, li_lastperiod, li_seqno, li_laststmno, li_stepvalue, li_ret, li_trnstatus, li_stmseqno
integer	li_chk, li_odflag, li_bfcontstatus, li_contstatus, li_bfcontlaw, li_conttype, li_keepstatus, li_genvcflag
long		ll_index, ll_count
dec{2}	ldc_prnpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_itembal, ldc_nkeepint, ldc_nkeepprin
dec{2}	ldc_apvamt, ldc_bfprnbal, ldc_bfwtdamt, ldc_bfprnarr, ldc_bfintarr, ldc_bfintarrmth, ldc_bfintarrset, ldc_bfintreturn, ldc_bfintaccum
dec{2}	ldc_prnbal, ldc_wtdamtbal, ldc_prnarrbal, ldc_intarrbal, ldc_intarrsetbal
dec{2}	ldc_bfintpayall, ldc_bfprnpayall, ldc_contintacm
dec{4}	ldc_contintrate
datetime	ldtm_receiptdate, ldtm_calintfrom, ldtm_calintto, ldtm_bflastpay, ldtm_bflastcalint, ldtm_bflastkeep
datetime	ldtm_entrydate, ldtm_lastpaydate, ldtm_lastkeepdate, ldtm_lastcaldate, ldtm_canceldate
n_ds		lds_loan

ldtm_entrydate	= datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "หนี้เงินกู้"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_loan	= create n_ds
lds_loan.dataobject	= "d_kp_rcvpost_loan"
lds_loan.settransobject( itr_sqlca )

// สร้างชุด SQL สำหรับการดึงรายการ
li_ret = this.of_setsqlselect( lds_loan )
if ( li_ret <> 1 ) then
	destroy lds_loan
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL รายการสัญญา"
	return -1
end if

ll_count	= lds_loan.retrieve()

inv_progress.istr_progress.subprogress_max		= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index

	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_loan
		return 0
	end if
	
	ls_memno			= trim( lds_loan.getitemstring( ll_index, "member_no" ) )
	ls_refmemno		= trim( lds_loan.getitemstring( ll_index, "ref_membno" ) )
	ls_contno			= trim( lds_loan.getitemstring( ll_index, "loancontract_no" ) )
	ls_receiptno			= trim( lds_loan.getitemstring( ll_index, "receipt_no" ) )
	ls_loantype			= trim( lds_loan.getitemstring( ll_index, "shrlontype_code" ) )
	ls_keeptype			= lds_loan.getitemstring( ll_index, "keepitemtype_code" )
	ls_cancelid			= lds_loan.getitemstring( ll_index, "cancel_id" )
	li_seqno				= lds_loan.getitemnumber( ll_index, "seq_no" )
	li_laststmno			= lds_loan.getitemnumber( ll_index, "last_stm_no" )
	li_period				= lds_loan.getitemnumber( ll_index, "period" )
	li_bfperiod			= lds_loan.getitemnumber( ll_index, "last_periodpay" )
	li_odflag				= lds_loan.getitemnumber( ll_index, "od_flag" )
	li_bfcontstatus		= lds_loan.getitemnumber( ll_index, "contract_status" )
	li_bfcontlaw			= lds_loan.getitemnumber( ll_index, "contlaw_status" )
	li_keepstatus		= lds_loan.getitemnumber( ll_index, "keepitem_status" )
	li_genvcflag			= lds_loan.getitemnumber( ll_index, "posttovc_flag" )
	ldc_prnpay			= lds_loan.getitemdecimal( ll_index, "principal_payment" )
	ldc_intpay			= lds_loan.getitemdecimal( ll_index, "interest_payment" )
	ldc_intarrpay		= lds_loan.getitemdecimal( ll_index, "intarrear_payment" )
	ldc_itempay			= lds_loan.getitemdecimal( ll_index, "item_payment" )
	ldc_itembal			= lds_loan.getitemdecimal( ll_index, "item_balance" )
	ldc_apvamt			= lds_loan.getitemdecimal( ll_index, "loanapprove_amt" )
	ldc_bfprnbal			= lds_loan.getitemdecimal( ll_index, "principal_balance" )
	ldc_bfwtdamt		= lds_loan.getitemdecimal( ll_index, "withdrawable_amt" )
	ldc_bfprnarr			= lds_loan.getitemdecimal( ll_index, "principal_arrear" )
	ldc_bfintaccum		= lds_loan.getitemdecimal( ll_index, "interest_accum" )
	ldc_bfintarr			= lds_loan.getitemdecimal( ll_index, "interest_arrear" )
	ldc_bfintarrmth		= lds_loan.getitemdecimal( ll_index, "intmonth_arrear" )
	ldc_bfintarrset		= lds_loan.getitemdecimal( ll_index, "intset_arrear" )
	ldc_bfintreturn		= lds_loan.getitemdecimal( ll_index, "interest_return" )
	ldc_nkeepint			= lds_loan.getitemdecimal( ll_index, "interest_period" )
	ldc_nkeepprin		= lds_loan.getitemdecimal( ll_index, "principal_period" )
	ldc_bfprnpayall		= lds_loan.getitemdecimal( ll_index, "prnpayment_amt" )
	ldc_bfintpayall		= lds_loan.getitemdecimal( ll_index, "intpayment_amt" )
	ldtm_receiptdate	= lds_loan.getitemdatetime( ll_index, "receipt_date" )
	ldtm_calintfrom		= lds_loan.getitemdatetime( ll_index, "calintfrom_date" )
	ldtm_calintto		= lds_loan.getitemdatetime( ll_index, "calintto_date" )
	ldtm_bflastpay		= lds_loan.getitemdatetime( ll_index, "lastpayment_date" )
	ldtm_bflastcalint	= lds_loan.getitemdatetime( ll_index, "lastcalint_date" )
	ldtm_bflastkeep	= lds_loan.getitemdatetime( ll_index, "lastkeeping_date" )
	ldtm_canceldate	= lds_loan.getitemdatetime( ll_index, "cancel_date" )

	li_trnstatus			= lds_loan.getitemnumber( ll_index, "transfer_status" )
	ls_trnfromcontno	= lds_loan.getitemstring( ll_index, "trnfrom_contno" )

	if isnull( li_laststmno ) then li_laststmno = 0
	if isnull( li_bfperiod ) then li_bfperiod = 0
	if isnull( li_odflag ) then li_odflag = 0
	if isnull( ldc_prnpay ) then ldc_prnpay = 0
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_bfprnbal ) then ldc_bfprnbal = 0
	if isnull( ldc_bfwtdamt ) then ldc_bfwtdamt = 0
	if isnull( ldc_bfprnarr ) then ldc_bfprnarr = 0
	if isnull( ldc_bfintaccum ) then ldc_bfintaccum = 0
	if isnull( ldc_bfintarr ) then ldc_bfintarr = 0
	if isnull( ldc_bfintarrmth ) then ldc_bfintarrmth = 0
	if isnull( ldc_bfintarrset ) then ldc_bfintarrset = 0
	if isnull( ldc_nkeepint ) then ldc_nkeepint = 0
	if isnull( ldc_nkeepprin ) then ldc_nkeepprin = 0
	if isnull( ldc_bfintpayall ) then ldc_bfintpayall = 0
	if isnull( ldc_bfprnpayall ) then ldc_bfprnpayall = 0
	
	if ls_memno <> ls_memprior or ls_refmemno <> ls_refprior then
		this.of_posttomast( ls_memno, is_recvperiod, ls_refmemno )
		
		ls_memprior	= ls_memno
		ls_refprior		= ls_refmemno
	end if

	// กำหนดค่าต่าง ๆ
	ls_loanitem		= "LPM"
	
	// -------------- เริ่มกระบวนการ ตรวจเช็ค ตัดยอด ------------------------------
	// พวกที่ตัดยอดหรือเพิ่มยอดได้เลย
	ldc_prnbal		= ldc_bfprnbal - ldc_prnpay
	ldc_prnarrbal	= ldc_bfprnarr - ( ldc_prnpay - ldc_nkeepprin )
	ldc_intarrbal		= ldc_bfintarr - ( ldc_intpay - ldc_nkeepint )
	
	// ถ้าดอกเบี้ยที่ตั้งค้างติดลบ
	if ldc_intarrbal < 0 then ldc_intarrbal = 0

	// พวก ต้นเงิน,ด/บ ชำระสะสม
	ldc_bfintaccum		= ldc_bfintaccum + ldc_intpay
	ldc_bfintpayall		= ldc_bfintpayall + ldc_intpay
	ldc_bfprnpayall		= ldc_bfprnpayall + ldc_prnpay
	
	li_laststmno ++

	// ถ้าเป็นสัญญา OD ต้องเพิ่มยอดรอเบิก
	if li_odflag = 1 then
		ldc_wtdamtbal	= ldc_apvamt - ldc_prnbal
	end if

	// งวดชำระเงิน
	if li_period > li_bfperiod then
		li_lastperiod = li_period
	end if
	
	// วันที่คิด ด/บ ล่าสุด
	if ldtm_calintto > ldtm_bflastcalint then
		ldtm_lastcaldate = ldtm_calintto
	end if
	
	// วันที่ชำระล่าสุด
	if ldtm_receiptdate > ldtm_bflastpay or isnull( ldtm_bflastpay ) then
		ldtm_lastpaydate = ldtm_receiptdate
	end if
	
	// เรียกเก็บล่าสุด
	if ldtm_receiptdate > ldtm_bflastkeep or isnull( ldtm_bflastkeep ) then
		ldtm_lastkeepdate = ldtm_receiptdate
	end if

	// ถ้าหมดและไม่เป็นบัญชี OD ปิดสัญญา
	if ldc_prnbal = 0 and ldc_wtdamtbal = 0 and ldc_intarrbal = 0 and li_odflag = 0 then
		li_contstatus	= STATUS_CLOSE
	else
		li_contstatus	= li_bfcontstatus
	end if
	
	// ส่วนของการ Set ยอด ด/บ ค้างตัดจ่าย
	// init ค่ายอดค้างรับไว้ก่อน
	ldc_intarrsetbal	= ldc_bfintarrset
	
	// ถ้าไม่ Gen voucher ไว้ก็เปลี่ยนไปตามยอดค้างคงเหลือ ณวันที่ตัดยอด
	// แต่ถ้า Gen ไปแล้วห้ามเปลี่ยนค่า เพราะจะทำให้ยอด ด/บ ค้างตัดจ่ายไม่ตรงกับบัญชีได้
	if ( ldc_intarrpay > 0 or ldc_bfintarrset > 0 ) and li_genvcflag = 0 then
		if li_keepstatus = -99 then
			ldc_intarrpay	= 0
		else
			if ldc_bfintarrset > ldc_intpay then
				ldc_intarrpay	= ldc_intpay
			else
				ldc_intarrpay	= ldc_bfintarrset
			end if
		end if
		
		ldc_intarrsetbal		= ldc_intarrsetbal - ldc_intarrpay
	end if
	
	// ผ่านรายการไป master
	insert into kpmastreceivedet
			( member_no, recv_period, ref_membno, seq_no, keepitemtype_code, shrlontype_code, loancontract_no,
			  period, principal_payment, interest_payment, intarrear_payment, item_payment, item_balance, principal_balance,
			  calintfrom_date, calintto_date, principal_period, interest_period, bfprinbalance_amt,
			  bfperiod, bflastcalint_date, bflastpay_date, bfinterest_arrear, bfintmonth_arrear, bfintyear_arrear,
			  bfcontract_status, bfcontlaw_status, keepitem_status, posting_date, cancel_id, cancel_date )
	values( :ls_memno, :is_recvperiod, :ls_refmemno, :li_seqno, :ls_keeptype, :ls_loantype, :ls_contno, 
			  :li_lastperiod, :ldc_prnpay, :ldc_intpay, :ldc_intarrpay, :ldc_itempay, :ldc_itembal, :ldc_prnbal,
			  :ldtm_calintfrom, :ldtm_calintto, :ldc_nkeepprin, :ldc_nkeepint, :ldc_bfprnbal,
			  :li_bfperiod, :ldtm_bflastcalint, :ldtm_bflastpay, :ldc_bfintarr, :ldc_bfintarrmth, :ldc_bfintarrset,
			  :li_bfcontstatus, :li_bfcontlaw, :li_keepstatus, :idtm_operate, :ls_cancelid, :ldtm_canceldate )
	using	itr_sqlca;
			  
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในผ่านรายการใบเสร็จของ สัญญา #"+ls_contno+ "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if

	// ถ้าเป็นสัญญายกเลิกกระดาษทำการ Update วันที่อย่างเดียวแล้วข้ามทำอันต่อไป
	if li_keepstatus <> 1 then
		update	lncontmaster
		set			lastkeeping_date	= :ldtm_lastkeepdate,
					lastprocess_date	= :ldtm_lastkeepdate
		where	( loancontract_no	= :ls_contno ) using itr_sqlca;
		
		if ( itr_sqlca.sqlcode <> 0 ) then
			destroy lds_loan
			ithw_exception.text +="~nพบข้อผิดพลาดในการปรับปรุงสัญญา #"+ls_contno+ "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
			return -1
		end if
		
		continue
	end if

	inv_progress.istr_progress.subprogress_text	= string(ll_index) +". ทะเบียน "+ls_memno+" เงินต้น "+string(ldc_prnpay,"#,##0.00")+" ด/บ "+string(ldc_intpay, "#,##0.00")

	update	lncontmaster
	set		principal_balance	= :ldc_prnbal,
			withdrawable_amt	= :ldc_wtdamtbal,
			last_periodpay		= :li_lastperiod,
			lastpayment_date	= :ldtm_lastpaydate,
			lastcalint_date		= :ldtm_lastcaldate,
			lastkeeping_date	= :ldtm_lastkeepdate,
			last_stm_no			= :li_laststmno,
			principal_arrear	= :ldc_prnarrbal,
			interest_arrear		= :ldc_intarrbal,
			intmonth_arrear	= 0,
			intset_arrear		= :ldc_intarrsetbal,
			interest_accum		= :ldc_bfintaccum,
			intpayment_amt	= :ldc_bfintpayall,
			prnpayment_amt	= :ldc_bfprnpayall,
			nkeep_principal		= 0,
		 	nkeep_interest		= 0,
			rkeep_principal		= 0,
			rkeep_interest		= 0,
			contract_status		= :li_contstatus,
			countpay_flag		= 1
	where ( loancontract_no	= :ls_contno ) using itr_sqlca;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุงสัญญา #"+ls_contno+ "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// บันทึกดอกเบี้ยสะสมให้สมาชิก
	update	mbmembmaster
	set			accum_interest	= accum_interest + :ldc_intpay
	where	( member_no = :ls_memno )
	using		itr_sqlca;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุง ด/บ สะสมของสมาชิก #"+ls_memno+ "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// บันทึกลง Statement
	insert into lncontstatement
			( loancontract_no,		seq_no,					slip_date,				operate_date,			account_date,
			  ref_slipno,				ref_docno,				loanitemtype_code,	
			  period,		 			principal_payment,	interest_payment,		principal_balance,		
			  prncalint_amt,		calint_from,				calint_to,					bfintarrear_amt,		bfintreturn_amt,		interest_period,
			  interest_arrear,		interest_return,			moneytype_code,		item_status,				entry_id,					entry_date )
	values ( :ls_contno,			:li_laststmno,			:ldtm_receiptdate,		:ldtm_receiptdate,		:ldtm_receiptdate,
			   :ls_receiptno,		:ls_receiptno,			:ls_loanitem,
			   :li_lastperiod,		:ldc_prnpay,				:ldc_intpay,				:ldc_prnbal,
			   :ldc_prnbal,			:ldtm_calintfrom,		:ldtm_calintto,			:ldc_bfintarr,			:ldc_bfintreturn,		:ldc_nkeepint,
			   :ldc_intarrbal,		:ldc_bfintreturn,		'TRN',						1,							:is_userid,				:ldtm_entrydate )
	using itr_sqlca ;

	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการบันทึก Statement สัญญา #"+ls_contno+"~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if

	// -----------------------------------------------------------------------------
	// ตรวจสอบว่าเป็นสัญญารับโอนหรือเปล่าถ้าเป็นต้องไปตัดสัญญาต้นทางด้วย
	// -----------------------------------------------------------------------------
	if li_trnstatus = 1 and ls_trnfromcontno <> "" then
	end if

	// ปรับปรุงสถานะการผ่านรายการ
	update	kptempreceivedet
	set			posting_status	= 1,
				posting_date	= :ldtm_entrydate
	where( member_no	= :ls_memno ) and
			( recv_period	= :is_recvperiod ) and
			( ref_membno	= :ls_refmemno ) and
			( seq_no		= :li_seqno ) using itr_sqlca ;

	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุงสถานะผ่านรายการ สัญญา #"+ls_contno+"~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
next	

destroy lds_loan

return 1
end function

protected function integer of_postloanemertrn () throws Exception;/***********************************************************
<description>
	ผ่านรายการ ฉุกเฉินโอน ไปที่ทะเบียนสัญญา
	ผ่านรายการ หลักประกัน ไปที่ทะเบียนหลักประกัน
</description>

<arguments>  
	ai_year				Integer		ปี
	ai_month				Integer		เดือน
	adtm_avpdate		Datetime		วันที่อนุมัติเลขสัญญา	
	as_userid			String			ผู้ทำรายการ
</arguments> 

<return> 
	Integer				1 = success
</return> 

<usage> 
	ต้องทำการผ่านรายการสัญญาฉุกเฉินโอนนี้ ก่อนการประมวลผลเรียกเก็บ
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

//string		ls_year, ls_month, ls_memno, ls_contno, ls_reqno, ls_startkpperiod, ls_collno, ls_collname
//string		ls_refmemno, ls_memprior, ls_refprior, ls_contprior, ls_cclcause
//long		ll_index, ll_count
//integer	li_continttype, li_ret, li_inttype, li_intsteptype, li_keepstatus
//string		ls_colltype, ls_refcollno, ls_desc, ls_intratetab, ls_intfixtab
//integer	li_seqno, li_reqstatus, li_nxtmth, li_nxtyear
//datetime	ldtm_apvdate, ldtm_entrydate, ldtm_startkeep
//boolean	lb_clsreq, lb_dupcont
//dec{2}	ldc_collamt, ldc_useamt, ldc_collbal, ldc_loanamt, ldc_continueamt, ldc_shrstkvalue
//dec{4}	ldc_collperc, ldc_baseperc, ldc_intrate, ldc_intinc
//n_ds 		lds_loan
//n_cst_datetimeservice	lnv_datetimesrv
//
//lnv_datetimesrv	= create n_cst_datetimeservice
//
//inv_progress.istr_progress.progress_text		= "ฉุกเฉินหักโอน"
//inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
//inv_progress.istr_progress.subprogress_index	= 0
//inv_progress.istr_progress.subprogress_max	= 0
//
//lds_loan = create n_ds
//lds_loan.dataobject = "d_kp_rcvpost_loanemertrn"
//lds_loan.settransobject( itr_sqlca )
//
//ldtm_entrydate		= datetime( today(), now() )
//
//// สร้างชุด SQL สำหรับการดึงรายการ
//li_ret = this.of_setsqlselect( lds_loan )
//if ( li_ret <> 1 ) then
//	destroy lds_loan
//	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL รายการฉุกเฉินหักโอน"
//	return -1
//end if
//
//ll_count	= lds_loan.retrieve()
//if ll_count <= 0 then
//	return 1
//end if
//
//ls_year		= mid( is_recvperiod, 1, 4 )
//ls_month		= mid( is_recvperiod, 5, 2 )
//
//if ls_month = "12" then
//	li_nxtmth		= 1
//	li_nxtyear	= integer( ls_year )+1
//else
//	li_nxtmth		= integer( ls_month )+1
//	li_nxtyear	= integer( ls_year )
//end if
//
//// เริ่มเก็บงวดแรก
//ls_startkpperiod	= string( li_nxtyear )+string( li_nxtmth, "00" )
//
//// วันที่อนุมัติ
//ldtm_apvdate		= datetime( date( li_nxtyear - 543, li_nxtmth, 1 ) )
//
//ldtm_startkeep		= datetime( lnv_datetimesrv.of_lastdayofmonth( date( ldtm_apvdate ) ) )
//
//// อัตรา ด/บ สัญญาใหม่ (เหมาเอาเลย)
//select		contint_type, inttabfix_code, inttabrate_code, intrate_increase, intstep_type
//into		:li_inttype, :ls_intfixtab, :ls_intratetab, :ldc_intinc, :li_intsteptype
//from		lnloantype
//where	( loantype_code	= '11' )
//using		itr_sqlca ;
//
//choose case li_inttype
//	case 0, 2
//		ldc_intrate	= 0
//	case 1
//		this.of_setsrvlninterest( true )
//		ldc_intrate	= inv_intsrv.of_getloanintrate( ls_intfixtab, ldtm_apvdate, 1 )
//		this.of_setsrvlninterest( false )
//end choose
//
//ls_cclcause		= "ปิดคำขอโดยระบบผ่านรายการ เดือน "+is_recvperiod
//
//inv_progress.istr_progress.progress_max 		= 1
//inv_progress.istr_progress.subprogress_max	= ll_count
//
//for ll_index = 1 to ll_count
//	
//	inv_progress.istr_progress.subprogress_index		= ll_index
//	
//	// ตรวจสอบการสั่งหยุดทำงาน
//	yield()
//	if inv_progress.of_is_stop() then
//		destroy lds_loan
//		return 0
//	end if
//
//	ls_memno 		= lds_loan.object.member_no[ ll_index ]
//	ls_refmemno	= lds_loan.object.ref_membno[ ll_index ]
//	ls_reqno			= lds_loan.object.loanrequest_docno[ ll_index ]
//	ls_contno		= lds_loan.object.loancontract_no[ ll_index ]
//	ls_collno			= lds_loan.object.reqgrt_memno[ ll_index ]
//	ls_collname		= lds_loan.object.coll_name[ ll_index ]
//	li_seqno			= lds_loan.object.seq_no[ ll_index ]
//	li_keepstatus	= lds_loan.object.keepitem_status[ ll_index ]
//	ldc_loanamt		= lds_loan.object.principal_payment[ ll_index ]
//	ldc_shrstkvalue	= lds_loan.object.sharestk_value[ ll_index ]
//	
//	if isnull( ls_collno ) then ls_collno = ""
//	
//	// ผ่านรายการไป master
//	if ls_memno <> ls_memprior or ls_refmemno <> ls_refprior then
//		li_ret = this.of_posttomast( ls_memno, is_recvperiod, ls_refmemno )
//		if ( li_ret <> 1 ) then
//			destroy lds_loan
//			ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการฉุกเฉินหักโอนไปแฟ้มหลัก #" + ls_memno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
//			return -1
//		end if
//		
//		ls_memprior	= ls_memno
//		ls_refprior		= ls_refmemno
//	end if
//	
//	// ผ่านรายการไป master det
//	li_ret = this.of_posttomastdet( ls_memno, is_recvperiod, ls_refmemno, li_seqno, ldtm_entrydate ) 
//	if ( li_ret <> 1 ) then
//		destroy lds_loan
//		ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการฉุกเฉินหักโอนไปแฟ้มหลัก #" + ls_memno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
//		return -1
//	end if
//	
//	// ถ้าเป็นรายการยกเลิกข้ามทำอันต่อไป
//	if li_keepstatus <> 1 then
//		continue
//	end if
//	
//	lb_dupcont	= false
//	
//	select	count( member_no )
//	into	:li_ret
//	from	lncontmaster
//	where	( loancontract_no	= :ls_contno )
//	using		itr_sqlca ;
//	
//	if isnull( li_ret ) then li_ret = 0
//	
//	if li_ret > 0 then
//		ls_contno	= ls_contno+"D"
//		lb_dupcont	= true
//	end if
////	if ls_contno = ls_contprior then
////		ls_contno	= ls_contno+"D"
////		lb_dupcont	= true
////	end if
//	
//	ls_contprior		= ls_contno
//
//	lb_clsreq			= false
//	
//	// ตรวจดูว่าเดือนถัดไปมีเขียนไว้อีกหรือเปล่า ถ้าไม่มีต้องปิดคำขอ
//	if li_nxtmth = 12 then
//		lb_clsreq		= true
//	else
//		ldc_continueamt	= lds_loan.getitemdecimal( ll_index, "month"+string( li_nxtmth + 1 )+"_amt" )
//		
//		if ldc_continueamt = 0 or isnull( ldc_continueamt ) then
//			lb_clsreq		= true
//		end if
//	end if
//
//	insert into lncontmaster
//			( loancontract_no,			member_no,		loantype_code,			loanobjective_code,			loanrequest_docno,		loanrequest_amt,
//			  loanapprove_date,		loanapprove_amt,	withdrawable_amt,	principal_balance,				loanpayment_type,
//			  period_payamt,			period_payment,	period_lastpayment,	payment_status,				startkeep_period,
//			  startcont_date,			startkeep_date,		lastcalint_date,
//			  od_flag,					contlaw_status,		contract_status,		approve_id,
//			  remark,						int_continttype,		int_contintrate,			int_continttabcode,			int_contintincrease,		int_intsteptype )
//			  
//	select	  :ls_contno,					member_no,		loantype_code,			loanobjective_code,			loanrequest_docno,		:ldc_loanamt,
//			  :ldtm_apvdate,			:ldc_loanamt,		0,							:ldc_loanamt,					loanpayment_type,
//			  1,							:ldc_loanamt,		0,							1,									:ls_startkpperiod,
//			  :ldtm_apvdate,			:ldtm_startkeep,	:ldtm_apvdate,
//			  od_flag,					1,						1,							approve_id,
//			  remark,						:li_inttype,			:ldc_intrate,				:ls_intratetab,					:ldc_intinc,					:li_intsteptype
//	from		lnreqloan	
//	where	( lnreqloan.loanrequest_docno	= :ls_reqno )
//	using		itr_sqlca ;
//	
//	if ( itr_sqlca.sqlcode <> 0 ) then
//		ithw_exception.text	= "ไม่สามารถผ่านรายการใบคำขอเลขที่ : " + ls_reqno + " ของสมาชิกเลขที่ "+ls_memno+" ไปสร้างเป็นสัญญาเลขที่ "+ls_contno+" ได้~r~n" + itr_sqlca.sqlerrtext
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// ถ้ามีคนค้ำประกัน
//	if ls_collno <> "" then
//		insert into lncontcoll
//				( loancontract_no,			seq_no,				loancolltype_code,
//				  ref_collno,					description,			coll_amt,
//				  coll_balance,				coll_percent,		base_percent,
//				  use_amt,					coll_status )
//		values( :ls_contno,				2, 						'01',
//				  :ls_collno,					:ls_collname,		 :ldc_loanamt,
//				  999999999,				1,						1,
//				  :ldc_loanamt,				1 )
//		using		itr_sqlca ;
//		
//		if ( itr_sqlca.sqlcode <> 0 ) then
//			ithw_exception.text = "ไม่สามารถเพิ่มหลักประกัน(คนค้ำประกัน) ได้ ใบคำขอเลขที่ : " + ls_reqno + "~r~n" + itr_sqlca.sqlerrtext
//			rollback using itr_sqlca ;
//			throw ithw_exception
//		end if
//	else
//		// ใส่ทุนเรือนหุ้นเป็นหลักประกัน
//		insert into lncontcoll
//				( loancontract_no,			seq_no,				loancolltype_code,
//				  ref_collno,					description,			coll_amt,
//				  coll_balance,				coll_percent,		base_percent,
//				  use_amt,					coll_status )
//		values( :ls_contno,				1, 						'02',
//				  :ls_memno,				'ทุนเรือนหุ้นของตนเอง', :ldc_loanamt,
//				  :ldc_shrstkvalue,			1,						.9,
//				  :ldc_loanamt,				1 )
//		using		itr_sqlca ;
//		if ( itr_sqlca.sqlcode <> 0 ) then
//			ithw_exception.text = "ไม่สามารถเพิ่มหลักประกัน(ทุนเรือนหุ้น) ได้ ใบคำขอเลขที่ : " + ls_reqno + "~r~n" + itr_sqlca.sqlerrtext
//			rollback using itr_sqlca ;
//			throw ithw_exception
//		end if
//	end if
//	
//	if lb_clsreq then
//		// CAT Update ตัวเก่าของอ๊อด
//		update lnreqloan 
//		set		loanrequest_status	= -1,
//				cancel_date				= :ldtm_apvdate ,
//				cancel_id					= :is_userid
//		where	( loanrequest_docno	= :ls_reqno )
//		using		itr_sqlca ;
//		
//		if ( itr_sqlca.sqlcode <> 0 ) then
//			rollback using itr_sqlca ;
//			ithw_exception.text = "ไม่สามารถปรับปรุงสถานะการยกเลิกใบคำขอเลขที่ : " + ls_reqno + "~r~n" + itr_sqlca.sqlerrtext
//			throw ithw_exception
//		end if
//		
//		// Update ตัวใหม่ของโอ้
//		update	lnreqloanyear
//		set			loanrequest_status	= -1,
//					cancel_id					= :is_userid,
//					cancel_date				= :ldtm_apvdate,
//					cancel_cause			= :ls_cclcause
//		where	( loanrequest_docno	= :ls_reqno )
//		using		itr_sqlca ;
//		
//		if ( itr_sqlca.sqlcode <> 0 ) then
//			rollback using itr_sqlca ;
//			ithw_exception.text = "ไม่สามารถปรับปรุงสถานะการยกเลิกใบคำขอ (lnreqloanyear) เลขที่ : " + ls_reqno + "~r~n" + itr_sqlca.sqlerrtext
//			throw ithw_exception
//		end if
//	end if
//	
//	// ถ้าเลขที่สัญญาซ้ำกันจำเป็นต้องมีการเปลี่ยนแปลงเลขที่ ต้องบันทึกกลับไปที่ kpmastreceivedet
//	if lb_dupcont then
//		update	kpmastreceivedet
//		set			loancontract_no	= :ls_contno
//		where	( member_no		= :ls_memno ) and
//					( recv_period		= :is_recvperiod ) and
//					( ref_membno		= :ls_refmemno ) and
//					( seq_no				= :li_seqno )
//		using		itr_sqlca ;
//		
//		if ( itr_sqlca.sqlcode <> 0 ) then
//			rollback using itr_sqlca ;
//			ithw_exception.text = "ไม่สามารถปรับปรุงเลขที่สัญญา ฉอ กลับไปที่ใบเสร็จเดือนได้ ทะเบียน " + ls_memno + "~r~n" + itr_sqlca.sqlerrtext
//			throw ithw_exception
//		end if
//		
//	end if
//	
//	inv_progress.istr_progress.subprogress_text	= string( ll_index ) +". ทะเบียน "+ls_memno  + "  เลขสัญญา " + ls_contno
//next
//
//inv_progress.istr_progress.progress_max	= 1
//inv_progress.istr_progress.status				= 1
//
return 1
end function

protected function integer of_postloanemertrn_bck () throws Exception;/***********************************************************
<description>
	ผ่านรายการ ฉุกเฉินโอน ไปที่ทะเบียนสัญญา
	ผ่านรายการ หลักประกัน ไปที่ทะเบียนหลักประกัน
</description>

<arguments>  
	ai_year				Integer		ปี
	ai_month				Integer		เดือน
	adtm_avpdate		Datetime		วันที่อนุมัติเลขสัญญา	
	as_userid			String			ผู้ทำรายการ
</arguments> 

<return> 
	Integer				1 = success
</return> 

<usage> 
	ต้องทำการผ่านรายการสัญญาฉุกเฉินโอนนี้ ก่อนการประมวลผลเรียกเก็บ
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

//string		ls_year, ls_month, ls_memno, ls_contno, ls_reqno, ls_startkpperiod
//string		ls_refmemno, ls_memprior, ls_refprior
//long		ll_index, ll_count
//integer	li_continttype, li_ret, li_inttype, li_intsteptype, li_keepstatus
//string		ls_colltype, ls_refcollno, ls_desc, ls_intratetab, ls_intfixtab
//integer	li_seqno, li_reqstatus, li_nxtmth, li_nxtyear
//datetime	ldtm_apvdate, ldtm_entrydate, ldtm_startkeep
//boolean	lb_clsreq
//dec{2}	ldc_collamt, ldc_useamt, ldc_collbal, ldc_loanamt, ldc_continueamt
//dec{4}	ldc_collperc, ldc_baseperc, ldc_intrate, ldc_intinc
//n_ds 		lds_loan
//n_cst_datetimeservice	lnv_datetimesrv
//
//lnv_datetimesrv	= create n_cst_datetimeservice
//
//inv_progress.istr_progress.progress_text		= "ฉุกเฉินหักโอน"
//inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
//inv_progress.istr_progress.subprogress_index	= 0
//inv_progress.istr_progress.subprogress_max	= 0
//
//lds_loan = create n_ds
//lds_loan.dataobject = "d_kp_rcvpost_loanemertrn"
//lds_loan.settransobject( itr_sqlca )
//
//ldtm_entrydate		= datetime( today(), now() )
//
//// สร้างชุด SQL สำหรับการดึงรายการ
//li_ret = this.of_setsqlselect( lds_loan )
//if ( li_ret <> 1 ) then
//	destroy lds_loan
//	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL รายการฉุกเฉินหักโอน"
//	return -1
//end if
//
//ll_count	= lds_loan.retrieve()
//if ll_count <= 0 then
//	return 0
//end if
//
//ls_year		= mid( is_recvperiod, 1, 4 )
//ls_month		= mid( is_recvperiod, 5, 2 )
//
//if ls_month = "12" then
//	li_nxtmth		= 1
//	li_nxtyear	= integer( ls_year )+1
//else
//	li_nxtmth		= integer( ls_month )+1
//	li_nxtyear	= integer( ls_year )
//end if
//
//// เริ่มเก็บงวดแรก
//ls_startkpperiod	= string( li_nxtyear )+string( li_nxtmth, "00" )
//
//// วันที่อนุมัติ
//ldtm_apvdate		= datetime( date( li_nxtyear, li_nxtmth, 1 ) )
//
//ldtm_startkeep		= datetime( lnv_datetimesrv.of_lastdayofmonth( date( ldtm_apvdate ) ) )
//
//// อัตรา ด/บ สัญญาใหม่ (เหมาเอาเลย)
//select		contint_type, inttabfix_code, inttabrate_code, intrate_increase, intstep_type
//into		:li_inttype, :ls_intfixtab, :ls_intratetab, :ldc_intinc, :li_intsteptype
//from		lnloantype
//where	( loantype_code	= '11' )
//using		itr_sqlca ;
//
//choose case li_inttype
//	case 0, 2
//		ldc_intrate	= 0
//	case 1
//		this.of_setsrvlninterest( true )
//		ldc_intrate	= inv_intsrv.of_getloanintrate( ls_intfixtab, ldtm_apvdate, 1 )
//		this.of_setsrvlninterest( false )
//end choose
//
//inv_progress.istr_progress.progress_max 		= 1
//inv_progress.istr_progress.subprogress_max	= ll_count
//
//for ll_index = 1 to ll_count
//	
//	inv_progress.istr_progress.subprogress_index		= ll_index
//	
//	// ตรวจสอบการสั่งหยุดทำงาน
//	yield()
//	if inv_progress.of_is_stop() then
//		destroy lds_loan
//		return 0
//	end if
//
//	ls_memno 		= lds_loan.object.member_no[ ll_index ]
//	ls_refmemno	= lds_loan.object.ref_membno[ ll_index ]
//	ls_reqno			= lds_loan.object.loanrequest_docno[ ll_index ]
//	ls_contno		= lds_loan.object.loancontract_no[ ll_index ]
//	li_seqno			= lds_loan.object.seq_no[ ll_index ]
//	li_keepstatus	= lds_loan.object.keepitem_status[ ll_index ]
//	ldc_loanamt		= lds_loan.object.principal_payment[ ll_index ]
//	
//	// ผ่านรายการไป master
//	if ls_memno <> ls_memprior or ls_refmemno <> ls_refprior then
//		li_ret = this.of_posttomast( ls_memno, is_recvperiod, ls_refmemno )
//		if ( li_ret <> 1 ) then
//			destroy lds_loan
//			ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการทุนเรือนหุ้นสมาชิก #" + ls_memno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
//			return -1
//		end if
//		
//		ls_memprior	= ls_memno
//		ls_refprior		= ls_refmemno
//	end if
//	
//	// ผ่านรายการไป master det
//	li_ret = this.of_posttomastdet( ls_memno, is_recvperiod, ls_refmemno, li_seqno, ldtm_entrydate ) 
//	if ( li_ret <> 1 ) then
//		destroy lds_loan
//		ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการทุนเรือนหุ้นสมาชิก #" + ls_memno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
//		return -1
//	end if
//	
//	// ถ้าเป็นรายการยกเลิกข้ามทำอันต่อไป
//	if li_keepstatus <> 1 then
//		continue
//	end if
//
//	lb_clsreq			= false
//	
//	// ตรวจดูว่าเดือนถัดไปมีเขียนไว้อีกหรือเปล่า ถ้าไม่มีต้องปิดคำขอ
//	if li_nxtmth = 12 then
//		lb_clsreq		= true
//	else
//		ldc_continueamt	= lds_loan.getitemdecimal( ll_index, "month"+string( li_nxtmth + 1 )+"_amt" )
//		
//		if ldc_continueamt = 0 or isnull( ldc_continueamt ) then
//			lb_clsreq		= true
//		end if
//	end if
//
//	insert into lncontmaster
//			( loancontract_no,			member_no,		loantype_code,			loanobjective_code,			loanrequest_docno,		loanrequest_amt,
//			  loanapprove_date,		loanapprove_amt,	withdrawable_amt,	principal_balance,				loanpayment_type,
//			  period_payamt,			period_payment,	period_lastpayment,	payment_status,				startkeep_period,
//			  startcont_date,			startkeep_date,		lastcalint_date,
//			  od_flag,					contlaw_status,		contract_status,		approve_id,
//			  remark,						int_continttype,		int_contintrate,			int_continttabcode,			int_contintincrease,		int_intsteptype )
//			  
//	select	  :ls_contno,					member_no,		loantype_code,			loanobjective_code,			loanrequest_docno,		:ldc_loanamt,
//			  :ldtm_apvdate,			:ldc_loanamt,		0,							:ldc_loanamt,					loanpayment_type,
//			  1,							:ldc_loanamt,		0,							1,									:ls_startkpperiod,
//			  :ldtm_apvdate,			:ldtm_startkeep,	:ldtm_apvdate,
//			  od_flag,					1,						1,							approve_id,
//			  remark,						:li_inttype,			:ldc_intrate,				:ls_intratetab,					:ldc_intinc,					:li_intsteptype
//	from		lnreqloan	
//	where	( lnreqloan.loanrequest_docno	= :ls_reqno )
//	using		itr_sqlca ;
//	
//	if ( itr_sqlca.sqlcode <> 0 ) then
//		continue
//		ithw_exception.text	= "ไม่สามารถผ่านรายการใบคำขอเลขที่ : " + ls_reqno + " ของสมาชิกเลขที่ "+ls_memno+" ไปสร้างเป็นสัญญาเลขที่ "+ls_contno+" ได้~r~n" + itr_sqlca.sqlerrtext
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	insert into lncontcoll
//			( loancontract_no,			seq_no,				loancolltype_code,
//			  ref_collno,					description,			coll_amt,
//			  coll_balance,				coll_percent,		base_percent,
//			  use_amt,					coll_status )
//	select	  :ls_contno,					seq_no,				loancolltype_code,
//			  ref_collno,					description,			coll_amt,
//			  coll_balance,				coll_percent,		base_percent,
//			  use_amt,					1
//	from	  lnreqloancoll
//	where	( lnreqloancoll.loanrequest_docno	= :ls_reqno )
//	using		itr_sqlca ;
//	
//	if lb_clsreq then
//		update lnreqloan 
//		set		loanrequest_status	= -1,
//				cancel_date				= :ldtm_apvdate ,
//				cancel_id					= :is_userid
//		where	( loanrequest_docno	= :ls_reqno )
//		using		itr_sqlca ;
//		
//		if ( itr_sqlca.sqlcode <> 0 ) then
//			rollback using itr_sqlca ;
//			ithw_exception.text = "ไม่สามารถปรับปรุงสถานะการยกเลิกใบคำขอเลขที่ : " + ls_reqno + "~r~n" + itr_sqlca.sqlerrtext
//			throw ithw_exception
//		end if
//	end if
//	
//	inv_progress.istr_progress.subprogress_text	= string( ll_index ) +". ทะเบียน "+ls_memno  + "  เลขสัญญา " + ls_contno
//next
//
//inv_progress.istr_progress.progress_max	= 1
//inv_progress.istr_progress.status				= 1

return 1
end function

protected function integer of_postloanintarr () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการสัญญาเงินกู้
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
string		ls_memno, ls_refmemno, ls_contno, ls_receiptno, ls_loanitem, ls_loantype, ls_keeptype, ls_trnfromcontno
string		ls_memprior, ls_refprior, ls_cancelid
integer	li_period, li_bfperiod, li_lastperiod, li_seqno, li_laststmno, li_ret, li_trnstatus
integer	li_odflag, li_bfcontstatus, li_contstatus, li_bfcontlaw, li_keepstatus
long		ll_index, ll_count
dec{2}	ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_itembal
dec{2}	ldc_bfprnbal, ldc_bfwtdbal, ldc_bfintarr, ldc_bfintarrmth, ldc_bfintarrset, ldc_bfintaccont, ldc_bfintreturn
dec{2}	ldc_intarrbal
dec{2}	ldc_bfintpayall
datetime	ldtm_receiptdate, ldtm_calintfrom, ldtm_calintto, ldtm_bflastpay, ldtm_bflastcalint, ldtm_bflastkeep
datetime	ldtm_entrydate, ldtm_lastpaydate, ldtm_lastkeepdate, ldtm_canceldate
n_ds		lds_loan

ldtm_entrydate	= datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "ดอกเบี้ยค้างชำระ"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_loan	= create n_ds
lds_loan.dataobject	= "d_kp_rcvpost_loanintarr"
lds_loan.settransobject( itr_sqlca )

// สร้างชุด SQL สำหรับการดึงรายการ
li_ret = this.of_setsqlselect( lds_loan )
if ( li_ret <> 1 ) then
	destroy lds_loan
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL รายการสัญญา"
	return -1
end if

ll_count	= lds_loan.retrieve()

inv_progress.istr_progress.subprogress_max		= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index

	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_loan
		return 0
	end if
	
	ls_memno			= trim( lds_loan.getitemstring( ll_index, "member_no" ) )
	ls_refmemno		= trim( lds_loan.getitemstring( ll_index, "ref_membno" ) )
	ls_contno			= trim( lds_loan.getitemstring( ll_index, "loancontract_no" ) )
	ls_receiptno			= trim( lds_loan.getitemstring( ll_index, "receipt_no" ) )
	ls_loantype			= trim( lds_loan.getitemstring( ll_index, "shrlontype_code" ) )
	ls_keeptype			= lds_loan.getitemstring( ll_index, "keepitemtype_code" )
	ls_cancelid			= lds_loan.getitemstring( ll_index, "cancel_id" )
	li_seqno				= lds_loan.getitemnumber( ll_index, "seq_no" )
	li_period				= lds_loan.getitemnumber( ll_index, "period" )
	li_bfperiod			= lds_loan.getitemnumber( ll_index, "last_periodpay" )
	li_odflag				= lds_loan.getitemnumber( ll_index, "od_flag" )
	li_bfcontstatus		= lds_loan.getitemnumber( ll_index, "contract_status" )
	li_bfcontlaw			= lds_loan.getitemnumber( ll_index, "contlaw_status" )
	li_keepstatus		= lds_loan.getitemnumber( ll_index, "keepitem_status" )
	li_laststmno			= lds_loan.getitemnumber( ll_index, "last_stm_no" )
	ldc_intpay			= lds_loan.getitemdecimal( ll_index, "interest_payment" )
	ldc_intarrpay		= lds_loan.getitemdecimal( ll_index, "intarrear_payment" )
	ldc_itempay			= lds_loan.getitemdecimal( ll_index, "item_payment" )
	ldc_itembal			= lds_loan.getitemdecimal( ll_index, "item_balance" )
	ldc_bfprnbal			= lds_loan.getitemdecimal( ll_index, "principal_balance" )
	ldc_bfwtdbal		= lds_loan.getitemdecimal( ll_index, "withdrawable_amt" )
	ldc_bfintarr			= lds_loan.getitemdecimal( ll_index, "interest_arrear" )
	ldc_bfintarrmth		= lds_loan.getitemdecimal( ll_index, "intmonth_arrear" )
	ldc_bfintarrset		= lds_loan.getitemdecimal( ll_index, "intset_arrear" )
	ldc_bfintreturn		= lds_loan.getitemdecimal( ll_index, "interest_return" )
	ldc_bfintpayall		= lds_loan.getitemdecimal( ll_index, "intpayment_amt" )
	ldtm_receiptdate	= lds_loan.getitemdatetime( ll_index, "receipt_date" )
	ldtm_calintfrom		= lds_loan.getitemdatetime( ll_index, "calintfrom_date" )
	ldtm_calintto		= lds_loan.getitemdatetime( ll_index, "calintto_date" )
	ldtm_bflastpay		= lds_loan.getitemdatetime( ll_index, "lastpayment_date" )
	ldtm_bflastkeep	= lds_loan.getitemdatetime( ll_index, "lastkeeping_date" )
	ldtm_canceldate	= lds_loan.getitemdatetime( ll_index, "cancel_date" )

	li_trnstatus			= lds_loan.getitemnumber( ll_index, "transfer_status" )
	ls_trnfromcontno	= lds_loan.getitemstring( ll_index, "trnfrom_contno" )

	if isnull( li_laststmno ) then li_laststmno = 0
	if isnull( li_bfperiod ) then li_bfperiod = 0
	if isnull( li_odflag ) then li_odflag = 0
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_bfprnbal ) then ldc_bfprnbal = 0
	if isnull( ldc_bfwtdbal ) then ldc_bfwtdbal = 0
	if isnull( ldc_bfintarr ) then ldc_bfintarr = 0
	if isnull( ldc_bfintarrmth ) then ldc_bfintarrmth = 0
	if isnull( ldc_bfintarrset ) then ldc_bfintarrset = 0
	if isnull( ldc_bfintaccont ) then ldc_bfintaccont = 0
	if isnull( ldc_bfintpayall ) then ldc_bfintpayall = 0
	
	if ls_memno <> ls_memprior or ls_refmemno <> ls_refprior then
		this.of_posttomast( ls_memno, is_recvperiod, ls_refmemno )
		
		ls_memprior	= ls_memno
		ls_refprior		= ls_refmemno
	end if

	// กำหนดค่าต่าง ๆ
	ls_loanitem		= "LPM"
	
	// -------------- เริ่มกระบวนการ ตรวจเช็ค ตัดยอด ------------------------------
	// พวกที่ตัดยอดหรือเพิ่มยอดได้เลย
	ldc_intarrbal		= ldc_bfintarr - ldc_intpay
	
	// ถ้าดอกเบี้ยที่ตั้งค้างติดลบ
	if ldc_intarrbal < 0 then ldc_intarrbal = 0

	// พวก ต้นเงิน,ด/บ ชำระสะสม
	ldc_bfintaccont		= ldc_bfintaccont + ldc_intpay
	ldc_bfintpayall		= ldc_bfintpayall + ldc_intpay
	
	li_laststmno ++

	// วันที่ชำระล่าสุด
	if ldtm_receiptdate > ldtm_bflastpay or isnull( ldtm_bflastpay ) then
		ldtm_lastpaydate = ldtm_receiptdate
	end if
	
	// เรียกเก็บล่าสุด
	if ldtm_receiptdate > ldtm_bflastkeep or isnull( ldtm_bflastkeep ) then
		ldtm_lastkeepdate = ldtm_receiptdate
	end if

	// ถ้าหมดและไม่เป็นบัญชี OD ปิดสัญญา
	if ldc_bfprnbal = 0 and ldc_bfwtdbal = 0 and ldc_intarrbal = 0 and li_odflag = 0 then
		li_contstatus	= STATUS_CLOSE
	else
		li_contstatus	= li_bfcontstatus
	end if
	
	// ผ่านรายการไป master
	insert into kpmastreceivedet
			( member_no, recv_period, ref_membno, seq_no, keepitemtype_code, shrlontype_code, loancontract_no,
			  period, principal_payment, interest_payment, intarrear_payment, item_payment, item_balance, principal_balance,
			  calintfrom_date, calintto_date, principal_period, interest_period, bfprinbalance_amt,
			  bfperiod, bflastcalint_date, bflastpay_date, bfinterest_arrear, bfintmonth_arrear, bfintyear_arrear,
			  bfcontract_status, bfcontlaw_status, keepitem_status, posting_date, cancel_id, cancel_date )
	values( :ls_memno, :is_recvperiod, :ls_refmemno, :li_seqno, :ls_keeptype, :ls_loantype, :ls_contno, 
			  :li_lastperiod, 0, :ldc_intpay, :ldc_intarrpay, :ldc_itempay, :ldc_itembal, :ldc_bfprnbal,
			  :ldtm_calintfrom, :ldtm_calintto, 0, 0, :ldc_bfprnbal,
			  :li_bfperiod, :ldtm_bflastcalint, :ldtm_bflastpay, :ldc_bfintarr, :ldc_bfintarrmth, :ldc_bfintarrset,
			  :li_bfcontstatus, :li_bfcontlaw, :li_keepstatus, :idtm_operate, :ls_cancelid, :ldtm_canceldate )
	using	itr_sqlca;
			  
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในผ่านรายการดอกเบี้ยค้างของ สัญญา #"+ls_contno+ "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if

	// ถ้าเป็นสัญญายกเลิกกระดาษทำการ Update วันที่อย่างเดียวแล้วข้ามทำอันต่อไป
	if li_keepstatus <> 1 then
		update	lncontmaster
		set			lastkeeping_date	= :ldtm_lastkeepdate,
					lastprocess_date	= :ldtm_lastkeepdate
		where	( loancontract_no	= :ls_contno ) using itr_sqlca;
		
		if ( itr_sqlca.sqlcode <> 0 ) then
			destroy lds_loan
			ithw_exception.text +="~nพบข้อผิดพลาดในการปรับปรุงสัญญา #"+ls_contno+ "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
			return -1
		end if
		
		continue
	end if

	inv_progress.istr_progress.subprogress_text	= string(ll_index) +". ทะเบียน "+ls_memno+" ด/บ "+string(ldc_intpay, "#,##0.00")

	update	lncontmaster
	set		lastpayment_date	= :ldtm_lastpaydate,
			lastkeeping_date	= :ldtm_lastkeepdate,
			last_stm_no			= :li_laststmno,
			interest_arrear		= :ldc_intarrbal,
			intmonth_arrear	= 0,
			interest_accum		= :ldc_bfintaccont,
			intpayment_amt	= :ldc_bfintpayall,
			contract_status		= :li_contstatus,
			countpay_flag		= 1
	where ( loancontract_no	= :ls_contno ) using itr_sqlca;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุงสัญญา #"+ls_contno+ "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// บันทึกดอกเบี้ยสะสมให้สมาชิก
	update	mbmembmaster
	set			accum_interest	= accum_interest + :ldc_intpay
	where	( member_no = :ls_memno )
	using		itr_sqlca;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุง ด/บ สะสมของสมาชิก #"+ls_memno+ "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// บันทึกลง Statement
	insert into lncontstatement
			( loancontract_no,		seq_no,					slip_date,				operate_date,			account_date,
			  ref_slipno,				ref_docno,				loanitemtype_code,	
			  period,		 			principal_payment,	interest_payment,		principal_balance,		
			  prncalint_amt,		calint_from,				calint_to,					bfintarrear_amt,		bfintreturn_amt,		interest_period,
			  interest_arrear,		interest_return,			moneytype_code,		item_status,				entry_id,					entry_date )
	values ( :ls_contno,			:li_laststmno,			:ldtm_receiptdate,		:ldtm_receiptdate,		:ldtm_receiptdate,
			   :ls_receiptno,		:ls_receiptno,			:ls_loanitem,
			   :li_lastperiod,		0,							:ldc_intpay,				:ldc_bfprnbal,
			   0,						:ldtm_calintfrom,		:ldtm_calintto,			:ldc_bfintarr,			:ldc_bfintreturn,		0,
			   :ldc_intarrbal,		:ldc_bfintreturn,		'TRN',						1,							:is_userid,				:ldtm_entrydate )
	using itr_sqlca ;

	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการบันทึก Statement สัญญา #"+ls_contno+"~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if

	// -----------------------------------------------------------------------------
	// ตรวจสอบว่าเป็นสัญญารับโอนหรือเปล่าถ้าเป็นต้องไปตัดสัญญาต้นทางด้วย
	// -----------------------------------------------------------------------------
	if li_trnstatus = 1 and ls_trnfromcontno <> "" then
	end if

	// ปรับปรุงสถานะการผ่านรายการ
	update	kptempreceivedet
	set			posting_status	= 1,
				posting_date	= :ldtm_entrydate
	where( member_no	= :ls_memno ) and
			( recv_period	= :is_recvperiod ) and
			( ref_membno	= :ls_refmemno ) and
			( seq_no		= :li_seqno ) using itr_sqlca ;

	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_loan
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุงสถานะผ่านรายการ สัญญา #"+ls_contno+"~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
next	

destroy lds_loan

return 1
end function

protected function integer of_postmoneyreturn () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการจ่ายคืนเงิน
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

string		ls_memno, ls_refmemno, ls_memprior, ls_refprior, ls_contno, ls_receiptno
string		ls_sqlext, ls_temp, ls_sqlexttemp
long		ll_index, ll_count
integer	li_seqno, li_itemseqno, li_stepvalue, li_chk, li_laststmno, li_keepstatus, li_ret
dec{2}	ldc_intretamt, ldc_contintacc, ldc_memintacc, ldc_allintpay
dec{2}	ldc_bfprnbal, ldc_bfintret, ldc_bfintarrear
dec{2}	ldc_intretbal
datetime	ldtm_receiptdate
n_ds		lds_moneyret

datetime	ldtm_entrydate

ldtm_entrydate = datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "หักคืนจำนวนเงินที่เรียกเก็บเกิน"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_moneyret	= create n_ds
lds_moneyret.dataobject	= "d_kp_rcvpost_moneyreturn"
lds_moneyret.settransobject(itr_sqlca)

// สร้างชุด SQL สำหรับการดึงรายการ
li_ret = this.of_setsqlselect( lds_moneyret )
if ( li_ret <> 1 ) then
	destroy lds_moneyret
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL รายการจ่ายเงินคืน"
	return -1
end if

ll_count		= lds_moneyret.retrieve()
inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index

	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_moneyret
		return 0
	end if
		
	ls_memno			= trim( lds_moneyret.getitemstring( ll_index, "member_no" ) )
	ls_refmemno		= trim( lds_moneyret.getitemstring( ll_index, "ref_membno" ) )
	ls_contno			= trim( lds_moneyret.getitemstring( ll_index, "loancontract_no" ) )
	ls_receiptno			= trim( lds_moneyret.getitemstring( ll_index, "receipt_no" ) )
	li_seqno				= lds_moneyret.getitemnumber( ll_index, "seq_no" )
	li_laststmno			= lds_moneyret.getitemnumber( ll_index, "last_stm_no" )
	li_keepstatus		= lds_moneyret.getitemnumber( ll_index, "keepitem_status" )
	ldc_contintacc		= lds_moneyret.getitemdecimal( ll_index, "interest_accum" )
	ldc_memintacc		= lds_moneyret.getitemdecimal( ll_index, "accum_interest" )
	ldc_allintpay			= lds_moneyret.getitemdecimal( ll_index, "intpayment_amt" )
	ldc_intretamt		= lds_moneyret.getitemdecimal( ll_index, "item_payment" )
	ldc_bfprnbal			= lds_moneyret.getitemdecimal( ll_index, "principal_balance" )
	ldc_bfintarrear		= lds_moneyret.getitemdecimal( ll_index, "interest_arrear" )
	ldc_bfintret			= lds_moneyret.getitemdecimal( ll_index, "interest_return" )
	ldtm_receiptdate	= lds_moneyret.getitemdatetime( ll_index, "receipt_date" )
	
	if isnull( ldc_contintacc ) then ldc_contintacc = 0
	if isnull( ldc_memintacc ) then ldc_memintacc = 0
	if isnull( ldc_allintpay ) then ldc_allintpay = 0
	if isnull( ldc_intretamt ) then ldc_intretamt = 0
	if isnull( ldc_bfintret ) then ldc_bfintret = 0
	if isnull( li_laststmno ) then li_laststmno = 0
	
	li_laststmno ++
	
	ldc_memintacc	-= ldc_intretamt
	ldc_contintacc	-= ldc_intretamt
	ldc_allintpay		-= ldc_intretamt
	ldc_intretbal		= ldc_bfintret - ldc_intretamt
	
	if ldc_contintacc < 0 then ldc_contintacc = 0
	if ldc_allintpay < 0 then ldc_allintpay = 0
	

	// ผ่านรายการไป master
	if ls_memno <> ls_memprior or ls_refmemno <> ls_refprior then
		li_ret = this.of_posttomast( ls_memno, is_recvperiod, ls_refmemno )
		if ( li_ret <> 1 ) then
			destroy lds_moneyret
			ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการ สัญญา #"+ ls_contno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
			return -1
		end if
		
		ls_memprior	= ls_memno
		ls_refprior	= ls_refmemno
	end if
	
	// ผ่านรายการไป master det
	li_ret = this.of_posttomastdet( ls_memno, is_recvperiod, ls_refmemno, li_seqno, ldtm_entrydate )
	if ( li_ret <>1 ) then
		destroy lds_moneyret
		ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการ สัญญา #"+ ls_contno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// ถ้าเป็นรายการยกเลิกข้ามทำอันต่อไป
	if li_keepstatus <> 1 then
		continue
	end if

	inv_progress.istr_progress.subprogress_text	= string(ll_index) +". ทะเบียน "+ls_memno+" > สัญญา "+ls_contno+" > คืนด/บ "+string(ldc_intretamt,"#,##0.00")
	
	// หักดอกเบี้ยสะสมออกจากสัญญา
	update	lncontmaster
	set		interest_accum		= :ldc_contintacc,
			interest_return		= :ldc_intretbal,
			intpayment_amt	= :ldc_allintpay,
			last_stm_no			= :li_laststmno
	where	( loancontract_no	= :ls_contno )
	using itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_moneyret
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุงยอดคืนในสัญญา #"+ ls_contno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if

	// หักดอกเบี้ยสะสมออกจากสมาชิก
	update	mbmembmaster
	set			accum_interest	= :ldc_memintacc
	where	( member_no	= :ls_memno )
	using		itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_moneyret
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุงยอด ด/บ สะสมของสมาชิก #" + ls_memno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if

	// เพิ่มรายการใน STM
	insert into lncontstatement
			( loancontract_no,		seq_no,					slip_date,				operate_date,			account_date,
			  ref_slipno,				ref_docno,				loanitemtype_code,	
			  period,		 			principal_payment,	interest_payment,		principal_balance,		
			  prncalint_amt,		calint_from,				calint_to,					bfintarrear_amt,		bfintreturn_amt,		interest_period,
			  interest_arrear,		interest_return,			moneytype_code,		item_status,				entry_id,					entry_date )
	values ( :ls_contno,			:li_laststmno,			:ldtm_receiptdate,		:ldtm_receiptdate,		:ldtm_receiptdate,
			   :ls_receiptno,		:ls_receiptno,			'LRT',
			   0,						0,							:ldc_intretamt,			:ldc_bfprnbal,
			   0,						:ldtm_receiptdate,		:ldtm_receiptdate,		:ldc_bfintarrear,		:ldc_bfintret,			0,
			   :ldc_bfintarrear,		:ldc_intretbal,			'TRN',						1,							:is_userid,				:ldtm_entrydate )
	using itr_sqlca ;
			  
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_moneyret
		ithw_exception.text += "~nพบข้อผิดพลาดในการเพิ่ม Statement สัญญา # "+ls_contno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
next

destroy lds_moneyret

return 1
end function

protected function integer of_postother () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการเรียกเก็บอื่น ๆ
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

string		ls_memno, ls_refmemno, ls_memprior, ls_refprior, ls_sqlext, ls_temp, ls_sqlexttemp
string		ls_kpitemtype
integer	li_rcvseqno, li_stepvalue, li_chk, li_keepstatus, li_ret
long		ll_index, ll_count
dec{2}	ldc_otheramt
n_ds		lds_other
datetime	ldtm_entrydate

ldtm_entrydate	= datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "เรียกเก็บอื่น ๆ"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_other	= create n_ds
lds_other.dataobject	= "d_kp_rcvpost_other"
lds_other.settransobject( itr_sqlca )

// สร้างชุด SQL สำหรับการดึงรายการ
li_ret = this.of_setsqlselect( lds_other )
if ( li_ret <> 1 ) then
	destroy lds_other
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL รายการเรียกเก็บอื่น ๆ"
	return -1
end if

ll_count = lds_other.retrieve()
inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index

	yield()
	if inv_progress.of_is_stop() then
		destroy lds_other
		return 0
	end if
	
	ls_memno		= trim( lds_other.getitemstring( ll_index, "member_no" ) )
	ls_refmemno	= trim( lds_other.getitemstring( ll_index, "ref_membno" ) )
	ls_kpitemtype	= trim( lds_other.getitemstring( ll_index, "keepitemtype_code" ) )
	ldc_otheramt	= lds_other.getitemdecimal( ll_index, "item_payment" )
	li_rcvseqno		= lds_other.getitemnumber( ll_index, "seq_no" )
	li_keepstatus	= lds_other.getitemnumber( ll_index, "keepitem_status" )

	// ผ่านรายการไป master
	if ( ls_memno <> ls_memprior ) or ( ls_refmemno <> ls_refprior ) then
		li_ret = this.of_posttomast( ls_memno, is_recvperiod, ls_refmemno )
		if ( li_ret <> 1 ) then
			destroy lds_other
			ithw_exception.text +="~nพบข้อผิดพลาดในการผ่านรายการจัดเก็บอื่น ๆ #"+ ls_memno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
			return -1
		end if
		
		ls_memprior	= ls_memno
		ls_refprior	= ls_refmemno
	end if
	
	// ผ่านรายการไป master det
	li_ret = this.of_posttomastdet( ls_memno, is_recvperiod, ls_refmemno, li_rcvseqno, ldtm_entrydate ) 
	if ( li_ret <> 1 ) then
		destroy lds_other
		ithw_exception.text +="~nพบข้อผิดพลาดในการผ่านรายการจัดเก็บอื่น ๆ #"+ ls_memno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// ถ้าเป็นรายการยกเลิกข้ามทำอันต่อไป
	if li_keepstatus <> 1 then
		continue
	end if

	inv_progress.istr_progress.subprogress_text	= string( ll_index ) +". ทะเบียน "+ls_memno+" > รายการเรียกเก็บอื่น ๆ "+string(ldc_otheramt, "#,##0.00" )
	
	// ถ้าเป็นรายการเรียกเก็บอื่นๆ ที่ไม่มีผลต่อด/บสะสมข้ามไปทำอันต่อไปเลย
	if ls_kpitemtype <> "UIA" and ls_kpitemtype <> "UIR" then
		continue
	end if
	
	// บันทีกในส่วน ด/บ สะสมของสมาชิก
	choose case ls_kpitemtype
		case "UIA"
			update	mbmembmaster
			set			accum_interest	= accum_interest + :ldc_otheramt
			where	( member_no	= :ls_memno )
			using		itr_sqlca ;
		case "UIR"
			update	mbmembmaster
			set			accum_interest	= accum_interest - :ldc_otheramt
			where	( member_no	= :ls_memno )
			using		itr_sqlca ;
	end choose
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_other
		ithw_exception.text +="~nพบข้อผิดพลาดในการปรับปรุงยอด ด/บ สะสมของสมาชิก  #"+ ls_memno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
next	

destroy lds_other

return 1
end function

protected function integer of_postshare () throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการหุ้น
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

string			ls_memno, ls_refmemno, ls_memprior, ls_refprior, ls_receiptno
string			ls_shritem, ls_sharetype, ls_sqlext, ls_temp, ls_sqlexttemp
integer		li_period, li_lastperiod, li_laststmno, li_seqno, li_stepvalue, li_chk, li_keepstatus, li_ret
long			ll_index, ll_count
dec{2}		ldc_shrperiodamt, ldc_shrperiodvalue, ldc_shrvalue, ldc_shrstkamt
datetime		ldtm_receiptdate
n_ds			lds_share

datetime	ldtm_entrydate

ldtm_entrydate	= datetime( today(), now() )

inv_progress.istr_progress.progress_text		= "ค่าธรรมเนียมแรกเข้า"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_share	= create n_ds
lds_share.dataobject	= "d_kp_rcvpost_share"
lds_share.settransobject(itr_sqlca)

// สร้างชุด SQL สำหรับการดึงรายการ
li_ret = this.of_setsqlselect( lds_share )
if ( li_ret <> 1 ) then
	destroy lds_share
	ithw_exception.text += "~nพบข้อผิดพลาดในการสร้างชุด SQL รายการหุ้น"
	return -1
end if

lds_share.retrieve()

ll_count = lds_share.rowcount()
inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index
	
	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_share
		return 0
	end if
	
	ls_memno				= trim( lds_share.getitemstring( ll_index, "member_no" ) )
	ls_refmemno			= trim( lds_share.getitemstring( ll_index, "ref_membno" ) )
	ls_receiptno				= trim( lds_share.getitemstring( ll_index, "receipt_no" ) )
	ls_sharetype			= trim( lds_share.getitemstring( ll_index, "shrlontype_code" ) )
	li_laststmno				= lds_share.getitemnumber( ll_index, "last_stm_no" )
	li_seqno					= lds_share.getitemnumber( ll_index, "seq_no" )
	li_period					= lds_share.getitemnumber( ll_index, "period" )
	li_lastperiod				= lds_share.getitemnumber( ll_index, "last_period" )
	li_keepstatus			= lds_share.getitemnumber( ll_index, "keepitem_status" )
	ldc_shrstkamt			= lds_share.getitemdecimal( ll_index, "sharestk_amt" )
	ldc_shrperiodvalue		= lds_share.getitemdecimal( ll_index, "item_payment" )
	ldc_shrvalue				= lds_share.getitemdecimal( ll_index, "share_value" )
	ldtm_receiptdate		= lds_share.getitemdatetime( ll_index, "receipt_date" )
	
	if isnull( ldc_shrstkamt ) then ldc_shrstkamt = 0
	if isnull( li_lastperiod ) then li_lastperiod = 0
	if isnull( li_laststmno ) then li_laststmno = 0

	// กำหนดค่าต่าง ๆ
	ls_shritem			= "SPM"
	ldc_shrperiodamt	= ldc_shrperiodvalue / ldc_shrvalue
	ldc_shrstkamt		+= ldc_shrperiodamt
	li_laststmno ++
	if li_period > li_lastperiod then li_lastperiod = li_period
	
	// ผ่านรายการไป master
	if ls_memno <> ls_memprior or ls_refmemno <> ls_refprior then
		li_ret = this.of_posttomast( ls_memno, is_recvperiod, ls_refmemno )
		if ( li_ret <> 1 ) then
			destroy lds_share
			ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการทุนเรือนหุ้นสมาชิก #" + ls_memno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
			return -1
		end if
		
		ls_memprior	= ls_memno
		ls_refprior	= ls_refmemno
	end if
	
	// ผ่านรายการไป master det
	li_ret = this.of_posttomastdet( ls_memno, is_recvperiod, ls_refmemno, li_seqno, ldtm_entrydate ) 
	if ( li_ret <> 1 ) then
		destroy lds_share
		ithw_exception.text += "~nพบข้อผิดพลาดในการผ่านรายการทุนเรือนหุ้นสมาชิก #" + ls_memno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// ถ้าเป็นรายการยกเลิกข้ามทำอันต่อไป
	if li_keepstatus <> 1 then
		continue
	end if
	
	inv_progress.istr_progress.subprogress_text	= string(ll_index) +". ทะเบียน "+ls_memno+" > หุ้นรายเดือน "+string(ldc_shrperiodamt,"#,##0.00")+" > ทุนเรือนหุ้น "+string(ldc_shrstkamt,"#,##0.00")
	
	// บันทึกทุนเรือนหุ้น
	update	shsharemaster
	set		last_period		= :li_lastperiod,	
			sharestk_amt	= :ldc_shrstkamt,
			last_stm_no		= :li_laststmno,
			rkeep_sharevalue	= 0,
			lastkeeping_date	= :ldtm_receiptdate
	where( member_no		= :ls_memno ) and
			( sharetype_code	= :ls_sharetype ) using itr_sqlca ;
			
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_share
		ithw_exception.text += "~nพบข้อผิดพลาดในการปรับปรุงทุนเรือนหุ้นสมาชิก #" + ls_memno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
	
	// บันทึกลง Statement
	insert into shsharestatement
			( member_no, sharetype_code, seq_no, operate_date, slip_date, ref_docno, shritemtype_code, period,
			  share_amount, sharestk_amt, entry_id, entry_date, coopbranch_id, moneytype_code )
	values	( :ls_memno, :ls_sharetype, :li_laststmno, :ldtm_receiptdate, :ldtm_receiptdate, :ls_receiptno, :ls_shritem, :li_period,
			  :ldc_shrperiodamt, :ldc_shrstkamt, :is_userid, :ldtm_entrydate, :is_branchid, 'TMT' ) using itr_sqlca ;
			  
	if ( itr_sqlca.sqlcode <> 0 ) then
		destroy lds_share
		ithw_exception.text += "~nพบข้อผิดพลาดในการบันทึก Statement หุ้น #" + ls_memno + "~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		return -1
	end if
next	

destroy lds_share

return 1
end function

protected function integer of_posttodetpmthcut () throws Exception;string		ls_memno, ls_recvperiod
string		ls_membgrp, ls_mbbranchid, ls_deptaccno, ls_dpbranchid
integer	li_poststatus, li_ret
long		ll_index, ll_count, ll_chkdept
dec{2}	ldc_keepamt
n_ds		lds_mthcut

inv_progress.istr_progress.progress_text		= "ส่งรายการเรียกเก็บไปหักจากระบบเงินฝาก"
inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 0

lds_mthcut	= create n_ds
lds_mthcut.dataobject	= "d_kp_rcvpost_trntodeptmthcut"
lds_mthcut.settransobject(itr_sqlca)

// สร้างชุด SQL สำหรับการดึงรายการ
li_ret = this.of_setsqlselect( lds_mthcut )
if ( li_ret <> 1 ) then
	destroy lds_mthcut
	ithw_exception.text += "~nพบขอผิดพลาดในการสร้างชุด SQL รายการหักชำระจากเงินฝาก"
	return -1
end if

ll_count = lds_mthcut.retrieve()

inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	inv_progress.istr_progress.subprogress_index	= ll_index
	
	// ตรวจสอบการสั่งหยุดทำงาน
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_mthcut
		return 0
	end if
	
	ls_memno		= trim( lds_mthcut.getitemstring( ll_index, "member_no" ) )
	ls_membgrp		= trim( lds_mthcut.getitemstring( ll_index, "membgroup_code" ) )
	ls_mbbranchid	= trim( lds_mthcut.getitemstring( ll_index, "mb_branch_id" ) )
	ls_deptaccno	= trim( lds_mthcut.getitemstring( ll_index, "expense_accid" ) )
	ldc_keepamt	= lds_mthcut.getitemdecimal( ll_index, "sum_cut" )
	
//	select	deptclose_status, branch_id
//	into	:ll_chkdept, :ls_dpbranchid
//	from	dpdeptmaster
//	where( deptaccount_no		= :ls_deptaccno )
//	using	itr_sqlca ;
//	
	// ถ้าไม่มีเลขที่บัญชีที่ระบุ ข้าม
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ทะเบียน "+ls_memno+ " เลขที่บัญชี "+ls_deptaccno +" ไม่พบข้อมูลในระบบเงินฝาก"
		throw ithw_exception
	end if
	
	// ตรวจว่าปิดบัญชีไปหรือยัง
	if ll_chkdept = 1 then
		ithw_exception.text	= "ทะเบียน "+ls_memno+ " เลขที่บัญชี "+ls_deptaccno +" เลขที่บัญชีเงินฝากที่ระบุได้ทำการปิดบัญชีไปแล้ว "
		throw ithw_exception
	end if
	
	select	post_status
	into	:li_poststatus
	from	dpdeptmonthlycut
	where( deptaccount_no	= :ls_deptaccno ) and
			( yearmonth		= :ls_recvperiod ) and
			( system_code		= 'KEP' )
	using	itr_sqlca ;
	
	if itr_sqlca.sqlcode = 0 then
		if li_poststatus = 1 then
			ithw_exception.text	= "ทะเบียน "+ls_memno+ " เลขที่บัญชี "+ls_deptaccno +" ยอดหักบัญชีเงินฝากนี้ ได้มีการนำไปทำรายการแล้วไม่สามารถส่งไปหักชำระซ้ำได้อีก"
			throw ithw_exception
		else
			delete from dpdeptmonthlycut
			where	( deptaccount_no	= :ls_deptaccno ) and
					( yearmonth		= :ls_recvperiod ) and
					( system_code		= 'KEP' )
			using	itr_sqlca ;
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถลบข้อมูลส่งหักเดิมที่มีอยู่ก่อนแล้วได้ ทะเบียน "+ls_memno+ " เลขที่บัญชี "+ls_deptaccno +"~r~n"+sqlca.sqlerrtext
				throw ithw_exception
			end if
		end if
	end if
	
	inv_progress.istr_progress.subprogress_text	= string( ll_index ) +". ทะเบียน "+ls_memno+" > ยอดเรียกเก็บ "+string( ldc_keepamt, "#,##0.00" )
	
//	insert into dpdeptmonthlycut
//			( yearmonth,		seq_no,		member_no,	member_branchid,	deptaccount_no,		account_branchid,		amount_amt,
//			  item_status,		post_status,	post_id,			post_branch,			member_groupcode,	system_code )
//	values( :ls_recvperiod,	1,				:ls_memno,		:ls_mbbranchid,		:ls_deptaccno,			:ls_dpbranchid,			:ldc_keepamt,
//			  1,					0,				'',					'',							:ls_membgrp,			'KEP' )
//	using	itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "พบข้อผิดพลาดในการผ่านรายการไปตัดยอดเรียกเก็บ จากระบบเงินฝาก ~r~n"+sqlca.sqlerrtext
		throw ithw_exception
	end if
next

destroy lds_mthcut

return 1
end function

protected function integer of_posttomast (string as_memno, string as_recvperiod, string as_refmemno) throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการหัวใบเสร็จไปที่ kpmastreceive
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

integer		li_count

select	count( member_no )
into	:li_count
from	kpmastreceive
where	( member_no = :as_memno ) and
		( recv_period = :as_recvperiod ) and
		( ref_membno = :as_refmemno ) using itr_sqlca;

if ( li_count = 0 ) or isnull( li_count ) then
	
	insert into kpmastreceive
			( member_no, recv_period, ref_membno, receipt_no, receipt_date,
			  receipt_amt, receipt_amttext, sharestkbf_value, sharestk_value, interest_accum,
			  membgroup_code, subgroup_code, branch_id, keeping_status, moneytype_code, tofrom_accid,
			  expense_code, expense_bank, expense_branch, expense_accid, grt_list, emertrn_contno, emertrn_amt,
			  diskkeep_amt, diskmoney_amt )
	select	member_no, recv_period, ref_membno, receipt_no, receipt_date,
			receipt_amt, receipt_amttext, sharestkbf_value, sharestk_value, interest_accum,
			membgroup_code, subgroup_code, branch_id, keeping_status, moneytype_code, tofrom_accid,
			expense_code, expense_bank, expense_branch, expense_accid, grt_list, emertrn_contno, emertrn_amt,
			diskkeep_amt, diskmoney_amt
	from	kptempreceive
	where( member_no	= :as_memno ) and
			( recv_period	= :as_recvperiod ) and
			( ref_membno	= :as_refmemno )
	using itr_sqlca;
			
	if ( itr_sqlca.sqlcode <> 0 ) then
		return -1
	end if
			
	
end if

return 1
end function

protected function integer of_posttomastdet (string as_memno, string as_recvperiod, string as_refmemno, integer ai_seqno, datetime adtm_postdate) throws Exception;/***********************************************************
<description>
	ประมวลผ่านรายการหัวใบเสร็จไปที่ kpmastreceivedet
</description>

<arguments>  

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
// บันทึกการผ่านรายการ
update	kptempreceivedet
set			posting_status	= 1,
			posting_date	= :adtm_postdate
where( kptempreceivedet.member_no	= :as_memno ) and
		( kptempreceivedet.recv_period	= :as_recvperiod ) and
		( kptempreceivedet.ref_membno	= :as_refmemno ) and
		( kptempreceivedet.seq_no		= :ai_seqno )
using itr_sqlca;
		
if ( itr_sqlca.sqlcode <> 0 ) then
	return -1
end if

insert into kpmastreceivedet
		( member_no, recv_period, ref_membno, seq_no, keepitemtype_code, shrlontype_code, item_seqno,
		  loancontract_no, description, period, principal_payment, interest_payment, intarrear_payment, item_payment,
		  item_balance, calintfrom_date, calintto_date, principal_period, interest_period, bfprinbalance_amt,
		  bfperiod, bflastcalint_date, bflastpay_date, bfinterest_arrear, bfintmonth_arrear, bfintyear_arrear, bfprincipal_arrear,
		  bfcontract_status, bfcontlaw_status, keepitem_status, status_desc, posting_date, cancel_id, cancel_date )
select	member_no, recv_period, ref_membno, seq_no, keepitemtype_code, shrlontype_code, item_seqno,
		loancontract_no, description, period, principal_payment, interest_payment, intarrear_payment, item_payment,
		item_balance, calintfrom_date, calintto_date, principal_period, interest_period, bfprinbalance_amt,		
		bfperiod, bflastcalint_date, bflastpay_date, bfinterest_arrear, bfintmonth_arrear, bfintyear_arrear, bfprincipal_arrear,
		bfcontract_status, bfcontlaw_status, keepitem_status, status_desc, :adtm_postdate, cancel_id, cancel_date
from	kptempreceivedet
where	( member_no	= :as_memno ) and
		( recv_period	= :as_recvperiod ) and
		( ref_membno	= :as_refmemno ) and
		( seq_no		= :ai_seqno )
using itr_sqlca;
		
if ( itr_sqlca.sqlcode <> 0 ) then
	return -1
end if

return 1
end function

protected function integer of_set_sql_chkdpbal (ref n_ds ads_info, string as_tablename) throws Exception;/***********************************************************
<description>
	สร้างชุด sql ในส่วน Where เพิ่มเติมสำหรับการประมวลผล 
	ตรวจสอบยอดเงินฝากคงเหลือ
</description>

<arguments>  
	ads_info			n_ds		datastore ข้อมูลรายการที่จะทำการจัดเก็บ
	as_tablename	String		table ที่เชื่อมต่อ
</arguments> 

<return> 
	integer		1 = success, -1 = failure
</return> 

<usage> 
		
	Revision History:
	Version 1.0 (Initial version) Modified Date 23/06/2012 by Godji
</usage> 
***********************************************************/
string		ls_temp , ls_sqlext
integer	li_pos
integer	li_ret

ls_sqlext		= " and not exists ( "
ls_sqlext		+= " select 1 "
ls_sqlext		+= " from kpreceiveexpense ke , dpdeptmaster dm "
ls_sqlext		+= " where ke.expense_accid = dm.deptaccount_no "
ls_sqlext		+= " and ke.coop_id = dm.coop_id "
ls_sqlext		+= " and ke.moneytype_code = 'TDP' "
ls_sqlext		+= " and ke.item_payment > case when dm.sequest_status = 1 then nvl( dm.prncbal , 0 ) - nvl( dm.sequest_amount , 0 ) else nvl( dm.prncbal , 0 ) end "
ls_sqlext		+= " and ke.coop_id = "+ as_tablename + ".coop_id "
ls_sqlext		+= " and ke.kpslip_no = "+ as_tablename + ".kpslip_no "
ls_sqlext		+= " ) "
	
//	sequest_amount,sequest_status
	
ls_temp	= ads_info.getsqlselect()
li_pos		= pos( ls_temp , 'GROUP BY' )
if isnull( li_pos ) or li_pos = 0 then ls_temp	+= ls_sqlext
if li_pos > 0 then ls_temp = mid( ls_temp , 1 , li_pos - 1 ) + ' ' + ls_sqlext + ' ' + mid( ls_temp , li_pos , len( ls_temp ))

li_ret = ads_info.setsqlselect( ls_temp )

if ( li_ret <> 1 ) then
	ithw_exception.text += "~r~n" + ads_info.of_geterrormessage()
	return -1
end if	

return 1
end function

protected function integer of_setsqlselect (ref n_ds ads_info) throws Exception;/***********************************************************
<description>
	สร้างชุด sql ในส่วน Where เพิ่มเติมสำหรับการประมวลผล 
	จากการเลือกช่วงสังกัด หรือ ช่วงเลขสมาชิก
</description>

<arguments>  
	ads_info			n_ds		datastore ข้อมูลรายการที่จะทำการจัดเก็บ
</arguments> 

<return> 
	integer		1 = success, -1 = failure
</return> 

<usage> 
		
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/


string		ls_sqlexttemp, ls_sqlext, ls_temp
integer	li_ret

ls_sqlexttemp	= "and ( kptempreceive.recv_period = '"+is_recvperiod+"' ) "

choose case ii_proctype
	case 1
		ls_sqlext	= ls_sqlexttemp
	case 2
		inv_stringsrv.of_buildsqlext( is_arg[], "kptempreceive.membgroup_code", ls_sqlext )
		ls_sqlext	= ls_sqlexttemp+" and "+ls_sqlext
	case 3
		inv_stringsrv.of_buildsqlext( is_arg[], "kptempreceive.member_no", ls_sqlext )
		ls_sqlext	= ls_sqlexttemp+" and "+ls_sqlext
end choose

ads_info.settransobject( itr_sqlca )

if ( ls_sqlext <> "" ) then
	ls_temp	= ads_info.getsqlselect()
	ls_temp	+= ls_sqlext
	li_ret 		= ads_info.setsqlselect( ls_temp )
	if ( li_ret <> 1 ) then
		return -1
	end if
	
	ads_info.settransobject( itr_sqlca )
end if

return 1
end function

protected function integer of_setsrvdw (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_dwsrv ) or not isvalid( inv_dwsrv ) then
		inv_dwsrv	= create n_cst_datawindowsservice
		inv_dwsrv.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_dwsrv ) then
		destroy inv_dwsrv
		return 1
	end if
end if

return 0
end function

protected function integer of_setsrvlninterest (boolean ab_switch);// Check argument
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

protected function integer of_update_expense () throws Exception;string ls_sql , ls_sqlext

inv_progress.istr_progress.progress_text		= "อัพเดทสถานะการผ่านรายการหักเงินประจำเดือน " + is_recvperiod
inv_progress.istr_progress.subprogress_text	= "กำลังทำรายการ"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 1

inv_kpsrv.of_setsqlselect( "kt" )
inv_kpsrv.of_getsqlselect(ls_sqlext)

ls_sql		= " update kpreceiveexpense kr "
ls_sql		+= " set kr.item_status = 1 , "
ls_sql		+= " kr.moneyenough_flag = " + string( ii_mnenoughflg )
ls_sql		+= " where kr.coop_id = '" + is_coopid + "'"
ls_sql		+= " and kr.recv_period = '" + is_recvperiod + "'"
ls_sql		+= " and kr.item_status = 0 "
ls_sql		+= " and exists ( select 1 from kptempreceive kt where kt.coop_id = kr.coop_id and kt.kpslip_no = kr.kpslip_no "
ls_sql		+= ls_sqlext
ls_sql		+= " ) "

if ii_chkbaldept = 1 then
	ls_sql		+= " and not exists ( "
	ls_sql		+= " select 1 "
	ls_sql		+= " from kpreceiveexpense ke , dpdeptmaster dm "
	ls_sql		+= " where ke.expense_accid = dm.deptaccount_no "
	ls_sql		+= " and ke.coop_id = dm.coop_id "
	ls_sql		+= " and ke.moneytype_code = 'TDP' "
	ls_sql		+= " and ke.item_payment > case when dm.sequest_status = 1 then nvl( dm.prncbal , 0 ) - nvl( dm.sequest_amount , 0 ) else nvl( dm.prncbal , 0 ) end "
	ls_sql		+= " and ke.coop_id = kr.coop_id "
	ls_sql		+= " and ke.kpslip_no = kr.kpslip_no "
	ls_sql		+= " ) "
end if

execute immediate :ls_sql using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "~r~nอัพเดทสถานะการผ่านรายการหักเงินประจำเดือน(80.1) " + is_recvperiod
	ithw_exception.text	+= "~r~n" + string( itr_sqlca.sqlcode )
	ithw_exception.text	+= "~r~n"+itr_sqlca.sqlerrtext
	ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"	
	rollback using itr_sqlca ;
	return -1
end if

if ii_mnenoughflg = 0 then
	//เงินเดือนไม่พอหัก , อัพสถานะไม่ให้ผ่านรายการ
	ls_sql		= " update kpreceiveexpense kr "
	ls_sql		+= " set kr.post_status = -1 "
	ls_sql		+= " where kr.coop_id = '" + is_coopid + "'"
	ls_sql		+= " and kr.recv_period = '" + is_recvperiod + "'"
	ls_sql		+= " and kr.item_status = 1 "
	ls_sql		+= " and kr.moneyenough_flag = 0 "
	ls_sql		+= " and exists ( select 1 from kptempreceive kt where kt.coop_id = kr.coop_id and kt.kpslip_no = kr.kpslip_no "
	ls_sql		+= ls_sqlext
	ls_sql		+= " ) "
	
	execute immediate :ls_sql using itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "~r~nอัพเดทสถานะการผ่านรายการยอดเงินไม่พอหักไม่ให้ผ่านรายการ(80.2) " + is_recvperiod
		ithw_exception.text	+= "~r~n" + string( itr_sqlca.sqlcode )
		ithw_exception.text	+= "~r~n"+itr_sqlca.sqlerrtext
		ithw_exception.text	+= "~r~nกรุณาตรวจสอบ"	
		rollback using itr_sqlca ;
		return -1
	end if
	
end if

inv_progress.istr_progress.subprogress_text	= "ทำรายการเสร็จเรียบร้อย..."
inv_progress.istr_progress.subprogress_index	= 1
return 1
end function

on n_cst_keeping_post.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_keeping_post.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ithw_exception = create Exception
end event

event destructor;this.of_setsrvdw( false )
this.of_setsrvlninterest( false )
if isvalid( ithw_exception ) then destroy ithw_exception
if isvalid( inv_progress ) then destroy inv_progress
if isvalid( inv_stringsrv ) then destroy inv_stringsrv
end event
