$PBExportHeader$n_cst_loansrv_allrequest.sru
forward
global type n_cst_loansrv_allrequest from NonVisualObject
end type
end forward

global type n_cst_loansrv_allrequest from NonVisualObject
end type
global n_cst_loansrv_allrequest n_cst_loansrv_allrequest

type variables
n_ds		ids_infocont, ids_infomemdet

transaction		itr_sqlca
Exception		ithw_exception

string		is_coopcontrol, is_coopid

n_cst_dbconnectservice		inv_transection
n_cst_doccontrolservice		inv_docsrv
n_cst_loansrv_interest		inv_intsrv
n_cst_datetimeservice		inv_datetimesrv
n_cst_dwxmlieservice			inv_dwxmliesrv
n_cst_loansrv_collpermiss	inv_collpermisssrv

string		DWCONTADJ			= "d_loansrv_req_contadj"
string		DWCONTADJPAY		= "d_loansrv_req_contadj_payment"
string		DWCONTADJLNPAY	= "d_loansrv_req_contadj_loanpay"
string		DWCONTADJINT		= "d_loansrv_req_contadj_contint"
string		DWCONTADJINTSPC	= "d_loansrv_req_contadj_contintspc"
string		DWCONTADJCOLL		= "d_loansrv_req_contadj_collateral"
end variables

forward prototypes
public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception
public function integer of_initlncollmastdet (ref str_lncollmast astr_collmast) throws Exception
public function integer of_initlncollmastall (ref str_lncollmast astr_collmast) throws Exception
public function integer of_savelncollmast (ref str_lncollmast astr_collmast) throws Exception
private function integer of_setsrvdoccontrol (boolean ab_switch)
private function integer of_setsrvdatetime (boolean ab_switch)
private function integer of_setsrvlninterest (boolean ab_switch)
public function integer of_initreq_contadjust (ref str_lncontaj astr_lncontaj) throws Exception
public function integer of_savereq_contadjust (str_lncontaj astr_lncontaj) throws Exception
public function integer of_initreq_compound (ref str_compound astr_compound) throws Exception
public function integer of_savereq_compound (ref str_compound astr_compound) throws Exception
public function integer of_initreq_lnpause (ref str_lnpause astr_lnpause) throws Exception
public function integer of_initreq_mthpayrcv (ref str_mthpayrcv astr_mthpayrcv) throws Exception
public function integer of_savereq_mthpayrcv (ref str_mthpayrcv astr_mthpayrcv) throws Exception
private function datetime of_getpaytabkeepdate (datetime adtm_refdate, integer ai_daytype, integer ai_daynum)
public function integer of_setdsmodify (ref n_ds ads_requester, long al_row, boolean ab_keymodify)
public function integer of_initlncontpaytable (ref str_paytab astr_paytab) throws Exception
public function integer of_initlncontpaycriteria (ref str_paytab astr_paytab) throws Exception
public function integer of_savereq_lnpause (ref str_lnpause lstr_lnpause) throws Exception
public function integer of_initlncontpaytabcat (ref str_paytab astr_paytab) throws Exception
private function integer of_setsrvdwxmlie (boolean ab_switch)
public function integer of_setcontstatusdesc (string as_contno) throws Exception
public function integer of_setpausekeepup (string as_memno, datetime adtm_opedate) throws Exception
public function integer of_initreq_chgcontlaw (ref str_contlaw astr_contlaw) throws Exception
public function integer of_savereq_chgcontlaw (ref str_contlaw astr_contlaw) throws Exception
public function string of_getmembdetail (string as_coopid, string as_memno) throws Exception
public function string of_initreq_contcancel (string as_coopid, string as_contno) throws Exception
public function integer of_savereq_contcancel (string as_xmlcontccl, string as_cancelid, datetime adtm_cancel, string as_coopid) throws Exception
private function integer of_postreq_contadjust (str_lncontaj astr_lncontaj, boolean ab_chgpay, boolean ab_chglnpay, boolean ab_chgint, boolean ab_chgcoll) throws Exception
private function integer of_setsrvcollpermiss (boolean ab_switch)
public function integer of_post_reqcontadj_pay (n_ds ads_adjmast, n_ds ads_adjpay) throws Exception
public function integer of_post_reqcontadj_int (n_ds ads_adjmast, n_ds ads_adjint, n_ds ads_adjintspc) throws Exception
public function integer of_post_reqcontadj_coll (n_ds ads_adjmast, n_ds ads_adjcoll) throws Exception
private function integer of_setlncontadjdocno (string as_entryid, ref n_ds ads_adjmast, ref n_ds ads_adjpay, ref n_ds ads_adjlnpay, ref n_ds ads_adjint, ref n_ds ads_adjintspc, ref n_ds ads_adjcoll, ref n_ds ads_adjintspcold, ref n_ds ads_adjcollold) throws Exception
public function integer of_post_reqcontadj_lnpay (n_ds ads_adjmast, n_ds ads_adjlnpay) throws Exception
private function integer of_setlncontadjdata (str_lncontaj astr_lncontaj, ref n_ds ads_adjpay, ref n_ds ads_adjlnpay, ref n_ds ads_adjint, ref n_ds ads_adjintspc, ref n_ds ads_adjcoll, ref n_ds ads_adjintspcold, ref n_ds ads_adjcollold) throws Exception
private function boolean of_checkcontadjustdet (n_ds ads_data, string as_oldcol[], string as_newcol[])
private function boolean of_checkcontadjustdetrow (n_ds ads_old, n_ds ads_new, string as_col[])
public function integer of_savereq_loan (ref str_lnreqloan astr_reqloan) throws Exception
public function integer of_savelncollmast_pea (ref str_lncollmast astr_collmast) throws Exception
public function integer of_initreq_lnpause_lawer (ref str_lnpause astr_lnpause) throws Exception
public function integer of_savereq_lnpause_lawer (ref str_lnpause lstr_lnpause) throws Exception
end prototypes

public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception;// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
end if

inv_transection	= anv_dbtrans
itr_sqlca 			= inv_transection.itr_dbconnection
is_coopcontrol	= inv_transection.is_coopcontrol
is_coopid			= inv_transection.is_coopid

// initial info contno
ids_infocont = create n_ds
ids_infocont.dataobject = "d_loansrv_info_contract"
ids_infocont.settransobject( itr_sqlca )

// initial info memdetail
ids_infomemdet = create n_ds
ids_infomemdet.dataobject = "d_loansrv_info_memdetail"
ids_infomemdet.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( true )

return 1
end function

public function integer of_initlncollmastdet (ref str_lncollmast astr_collmast) throws Exception;/***********************************************************

===========================================
return type = integer
pass by = reference  ,argument type = str_lncollmast ,argument name = astr_lncollmast
=========================================
<description>
	สำหรับ initial ข้อมูลรายละเอียดทะเบียนหลักทรัพย์ที่ระบุเลขหลักทรัพย์เข้ามา
</description>

<arguments>  
	str_lncollmast		Structure รายการทะเบียนหลักทรัพย์
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- Collmast_no				String		เลขที่ทะเบียนหลักทรัพย์
		- xml_collmastdet{ref}	String		XML ส่วนแสดงผลรายละเอียดทะเบียนหลักทรัพย์
		- xml_collmemco{ref}		String		XML ส่วนแสดงผลรายละเอียดผู้กู้ร่วม
</arguments> 

<return> 
	integer
	1		ถ้าไม่มีข้อผิดพลาด
	0		ถ้าไม่มีรายการี่ทะเบียนหลักทรัพย์ที่ระบุเข้ามา
</return> 

<usage> 
	เรียกใช้โดยส่งเลขที่ี่ทะเบียนหลักทรัพย์ผ่าน Structure รายการทะเบียนหลักทรัพย์
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่ข้อมูลรายละเอียดที่เป็นของรายการทะเบียนหลักทรัพย์นั้น
	แล้วส่งกลับไป
	
	str_lncollmast		lstr_lncollmast
	
	lstr_lncollmast.collmast_no	= dw_example.getitemstring( 1, "collmast_no" )
	
	lnv_lnoperate.of_initlncollmastdet( lstr_lncollmast )
	
	dw_collmastdet.reset()
	dw_collmastdet.importstring( XML!, lstr_lncollmast.xml_collmastdet )
	
	dw_collmemco.reset()
	dw_collmemco.importstring( XML!, lstr_lncollmast.xml_collmemco )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO
</usage> 
***********************************************************/

string		ls_collmastno
long		ll_count
datetime	ldtm_ccldate
n_ds		lds_temp

// ข้อมูลการ init ค่า
ls_collmastno	= astr_collmast.collmast_no

astr_collmast.xml_collmastdet	= ""
astr_collmast.xml_collmemco	= ""
astr_collmast.xml_review		= ""
astr_collmast.xml_prop			= ""

this.of_setsrvdwxmlie( true )

lds_temp		= create n_ds

// ส่วนของรายละเอียดหลักทรัพย์
lds_temp.dataobject	= "d_loansrv_lncollmast_detail"
lds_temp.settransobject( itr_sqlca )
lds_temp.retrieve( is_coopcontrol, ls_collmastno )

astr_collmast.xml_collmastdet	= inv_dwxmliesrv.of_xmlexport( lds_temp )

// ส่วนของผู้กู้ร่วม
lds_temp.dataobject	= "d_loansrv_lncollmast_memco"
lds_temp.settransobject( itr_sqlca )
lds_temp.retrieve( is_coopcontrol, ls_collmastno )

astr_collmast.xml_collmemco	= inv_dwxmliesrv.of_xmlexport( lds_temp )

// ส่วนของการทบทวนราคา
lds_temp.dataobject	= "d_loansrv_lncollmast_review"
lds_temp.settransobject( itr_sqlca )
lds_temp.retrieve( is_coopcontrol, ls_collmastno )

astr_collmast.xml_review	= inv_dwxmliesrv.of_xmlexport( lds_temp )

// ส่วนของการผู้มีกรรมสิทธิ์
lds_temp.dataobject	= "d_loansrv_lncollmast_prop"
lds_temp.settransobject( itr_sqlca )
lds_temp.retrieve( is_coopcontrol, ls_collmastno )

astr_collmast.xml_prop		= inv_dwxmliesrv.of_xmlexport( lds_temp )

// ส่วนของการใช้ไป
lds_temp.dataobject	= "d_loansrv_lncollmast_colluse"
lds_temp.settransobject( itr_sqlca )
lds_temp.retrieve( is_coopcontrol, ls_collmastno )

astr_collmast.xml_colluse		= inv_dwxmliesrv.of_xmlexport( lds_temp )

destroy lds_temp

this.of_setsrvdwxmlie( false )

return 1
end function

public function integer of_initlncollmastall (ref str_lncollmast astr_collmast) throws Exception;/*********************************************************** 
===========================================
return type = integer
pass by = reference ,argument type = str_lncollmast,argument name = astr_lncollmast
=========================================
<description>
	สำหรับ initial ข้อมูลรายการทะเบียนหลักทรัพย์ทั้งหมดของสมาชิกที่ถูกระบุทะเบียนเข้ามา
</description>

<arguments>  
	str_lncollmast	Structure 	รายการทะเบียนหลักทรัพย์
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no				String		ทะเบียนสมาชิก
		- xml_memdet{ref}		String		XML ส่วนแสดงผลรายละเอียดสมาชิก
		- xml_collmastlist{ref}	String		XML รายการทะเบียนหลักทรัพย์ของสมาชิกคนนั้น
</arguments> 

<return> 
	integer
	1		ถ้าทำงานครบถ้วนมีข้อมูล
	0		ถ้าไม่มีข้อมูลสมาชิก
</return> 

<usage> 
	เรียกใช้โดยส่งทะเบียนสมาชิกผ่าน Structure ทะเบียนหลักทรัพย์เข้ามา
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่รายละเอียดที่เป็นของทะเบียนสมาชิกและ
	รายการทะเบียนหลักทรัพย์ของสมาชิกคนนั้น แล้วส่งกลับไป
	
	str_lncollmast		lstr_lncollmast
	
	lstr_lncollmast.member_no	= dw_example.getitemstring( 1, "member_no" )
	
	lnv_lnoperate.of_initlncollmastall( lstr_lncollmast )
	
	dw_example.reset()
	dw_example.importstring( XML!, lstr_lncollmast.xml_memdet )
	
	dw_collmastlist.reset()
	dw_collmastlist.importstring( XML!, lstr_lncollmast.xml_collmastlist )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_xmlmemdet, ls_xmlcollmastlist,as_coopid
long		ll_count
n_ds		lds_temp

ls_memno			= astr_collmast.member_no
as_coopid= astr_collmast.coop_id
ls_xmlcollmastlist	= ""

ls_xmlmemdet		= of_getmembdetail(as_coopid,ls_memno )

lds_temp	= create n_ds
lds_temp.dataobject	= "d_loansrv_lncollmast_list"
lds_temp.settransobject( itr_sqlca )

ll_count		= lds_temp.retrieve(as_coopid, ls_memno )

if ll_count > 0 then
	ls_xmlcollmastlist		= string( lds_temp.describe( "Datawindow.data.XML" ) )
end if

astr_collmast.xml_memdet		= ls_xmlmemdet
astr_collmast.xml_collmastlist	= ls_xmlcollmastlist

destroy( lds_temp )

return 1
end function

public function integer of_savelncollmast (ref str_lncollmast astr_collmast) throws Exception;/***********************************************************


===========================================
return type = integer
pass by = reference  ,argument type = str_lncollmast ,argument name = astr_lncollmast
Throws : Exception
=========================================

<description>
	สำหรับบันทึกรายละเอียดทะเบียนหลักทรัพย์
</description>

<arguments>  
	str_lncollmast		Structure รายการทะเบียนหลักทรัพย์
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String			ทะเบียนสมาชิกที่เป็นเจ้าของทะเบียนหลักทรัพย์
		- xml_collmastdet		String			XML รายละเอียดทะเบียนหลักทรัพย์
		- xml_collmemco		String			XML รายการผู้กู้ที่จะใช้ทะเบียนหลักทรัพย์นี้
		- entry_id				String			ผู้ทำรายการ
		- branch_id				String			สาขาที่ทำรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	ส่ง XML รายการทะเบียนหลักทรัพย์ทีเพิ่มหรือแก้ไขผ่าน Structure เข้ามา 
	ระบบจะนำข้อมูลไปบันทึกลงฐานข้อมูล
	
	str_lncollmast	lstr_lncollmast
	
	lstr_lncollmast.member_no			= dw_memdet.getitemstring( 1, "member_no" )
	
	lstr_lncollmast.xml_collmastdet		= dw_collmastdet.describe( "Datawindow.Data.XML" )
	lstr_lncollmast.xml_collmemco		= dw_collmemco.describe( "Datawindow.Data.XML" )
	lstr_lncollmast.entry_id				= entry_id
	lstr_lncollmast.branch_id				= branch_id
	
	lnv_lnoperate.of_savelncollmast( str_lncollmast )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_xmlcollmastdet, ls_xmlcollmemco, ls_mrtg1, ls_mrtg2, ls_mrtg3
string		ls_collmastno, ls_collnochk, ls_updatestatus, ls_iskey, ls_colname,ls_prop,ls_xmlprop
string		ls_entryid,ls_coopid
long		ll_index, ll_count, ll_find, ll_row
integer	li_impchk
n_ds		lds_collmast, lds_collmemco, lds_mrtg1, lds_mrtg2, lds_mrtg3, lds_prop, lds_review

ls_memno			= astr_collmast.member_no
ls_xmlcollmastdet	= astr_collmast.xml_collmastdet
ls_xmlcollmemco	= astr_collmast.xml_collmemco
ls_mrtg1				= astr_collmast.xml_mrtg1
ls_mrtg2				= astr_collmast.xml_mrtg2
ls_entryid			= astr_collmast.entry_id
ls_xmlprop			= astr_collmast.xml_prop
ls_coopid			= astr_collmast.coop_id
lds_collmast		= create n_ds
lds_collmast.dataobject	= "d_loansrv_lncollmast_detail"
lds_collmast.settransobject( itr_sqlca )
li_impchk			= lds_collmast.importstring( XML!, ls_xmlcollmastdet )

if li_impchk	<= 0 then
	ithw_exception.text	= "ไม่สามารถ Import String ทะเบียนหลักทรัพย์ได้ (รายละเอียด 1)"
	throw ithw_exception
end if

//ผู้กู้ร่วม
lds_collmemco		= create n_ds
lds_collmemco.dataobject	= "d_loansrv_lncollmast_memco"
lds_collmemco.settransobject( itr_sqlca )
li_impchk			= lds_collmemco.importstring( XML!, ls_xmlcollmemco )

// ตรวจแค่ว่า error หรือเปล่าก็พอ ไม่ต้องตรวจว่ามีแถวหรือไม่
if li_impchk	< 0 then
	ithw_exception.text	= "ไม่สามารถ Import String ทะเบียนกู้ร่วมได้"
	throw ithw_exception
end if

//ผู้มีกรรมสิทธิ 
lds_prop		= create n_ds
lds_prop.dataobject	= "d_loansrv_lncollmast_prop"
lds_prop.settransobject( itr_sqlca )
li_impchk			= lds_prop.importstring( XML!, ls_xmlprop )

// ตรวจแค่ว่า error หรือเปล่าก็พอ ไม่ต้องตรวจว่ามีแถวหรือไม่
if li_impchk	< 0 then
	ithw_exception.text	= "ไม่สามารถ Import String ผู้มีกรรมสิทธิ"
	throw ithw_exception
end if

// ส่วนของรายละเอียดจำนอง 1
lds_mrtg1		= create n_ds
lds_mrtg1.dataobject	= "d_loansrv_lncollmast_mrtg1"
lds_mrtg1.settransobject( itr_sqlca )
li_impchk			= lds_mrtg1.importstring( XML!, ls_mrtg1 )

if li_impchk	<= 0 then
	ithw_exception.text	= "ไม่สามารถ Import String ทะเบียนหลักทรัพย์ (รายละเอียด 2) ได้"
	throw ithw_exception
end if


// ส่วนของรายละเอียดจำนอง 2
lds_mrtg2		= create n_ds
lds_mrtg2.dataobject	= "d_loansrv_lncollmast_mrtg2"
lds_mrtg2.settransobject( itr_sqlca )
li_impchk			= lds_mrtg2.importstring( XML!, ls_mrtg2 )

if li_impchk	<= 0 then
	ithw_exception.text	= "ไม่สามารถ Import String ทะเบียนหลักทรัพย์ (ส่วนงานจำนอง 1 )ได้"
	throw ithw_exception
end if


ls_collmastno		= trim( lds_collmast.getitemstring( 1, "collmast_no" ) )

// ถ้าไม่มีทะเบียนหลักทรัพย์มาแสดงว่าเป็นการเพิ่ม
if ls_collmastno = "" or isnull( ls_collmastno ) or lower( ls_collmastno ) = "auto"   or len( ls_collmastno )  < 5  then
	this.of_setsrvdoccontrol( true )
	ls_collmastno		= inv_docsrv.of_getnewdocno(ls_coopid, "COLLMASTER" )
	this.of_setsrvdoccontrol( false )
	lds_collmast.setitem( 1, "coop_id", ls_coopid )
	lds_collmast.setitem( 1, "collmast_no", ls_collmastno )
	lds_collmast.setitem( 1, "collmast_no", ls_collmastno )
	lds_collmast.setitem( 1, "member_no", ls_memno )
	ls_updatestatus		= "NEW"
else
	ls_updatestatus		= "MODIFY"
end if

// ตรวจว่ามีทะเบียนสมาชิกใน MemCo หรือเปล่า
//ll_count	= lds_collmemco.rowcount()
//ll_find		= lds_collmemco.find( "memco_no = '"+ls_memno+"'", 1, ll_count )
//
//if ll_count <= 0 or ll_find <= 0 then
//	ll_row		= lds_collmemco.insertrow( 0 )
//	
//	lds_collmemco.setitem( ll_row, "coop_id", ls_coopid )
//	lds_collmemco.setitem( ll_row, "memco_no", ls_memno )
//	lds_collmemco.setitem( ll_row, "collmastmain_flag", 1 )
//end if

// ใส่ทะเบียนเลขที่หลักทรัพย์
ll_count	= lds_collmemco.rowcount()
for ll_index = 1 to ll_count
	lds_collmemco.setitem(ll_index, "collmast_no", ls_collmastno )
	lds_collmemco.setitem(ll_index, "coop_id", ls_coopid )
	lds_collmemco.setitem(ll_index, "memcoop_id", ls_coopid )
next

// ใส่ผู้มีกรรมสิทธิ
ll_count	= lds_prop.rowcount()
for ll_index = 1 to ll_count
	lds_prop.setitem(ll_index, "collmast_no", ls_collmastno )
	lds_prop.setitem(ll_index, "coop_id", ls_coopid )
	lds_prop.setitem(ll_index, "seq_no", ll_index )
next

// ใส่ทะเบียนเลขที่หลักทรัพย์ในส่วนงานจำนอง
lds_mrtg1.setitem( 1, "collmast_no", ls_collmastno )
lds_mrtg2.setitem( 1, "collmast_no", ls_collmastno )
lds_mrtg1.setitem( 1, "coop_id", ls_coopid )
lds_mrtg2.setitem( 1, "coop_id", ls_coopid )

// -----------------------
// เริ่มกระบวนการบันทึก
// -----------------------

//// ถ้าเป็นการ Modify ของเก่า
//if ls_updatestatus = "MODIFY" then
//	// ลบ Memco ของเก่าทิ้งก่อน
//	delete from lncollmastmemco
//	where	( collmast_no	= :ls_collmastno ) 
//	using		itr_sqlca ;
//	
//	
//	// ปรับ Attrib ทุก Column ให้เป็น Update ซะ
//	this.of_setdsmodify( lds_collmast, 1, false )
//	
//end if
//
// ลบส่วนการพิมพ์จำนองทิ้งไปก่อน
delete from lncolldetail
where	( collmast_no	= :ls_collmastno )
using		itr_sqlca ;

delete from lncollmastmemco
where	( collmast_no	= :ls_collmastno )
using		itr_sqlca ;

delete from lncollmastprop
where	( collmast_no	= :ls_collmastno )
using		itr_sqlca ;

delete from lncollmaster
where	( collmast_no	= :ls_collmastno )
using		itr_sqlca ;	
// งานจำนอง 1 เป็นการ insert เสมอไม่ต้องปรับ attrib 
// ส่วนงานจำนองส่วน 2-3 เป็นการ Update ต้องปรับ Attrib ให้เป็น Update
this.of_setdsmodify( lds_mrtg2, 1, false )
//this.of_setdsmodify( lds_mrtg3, 1, false )

// บันทึก Master
if lds_collmast.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลทะเบียนหลักทรัพย์ (CollMaster) ไม่ได้  "
	ithw_exception.text	+= ls_collmastno +"  "+ lds_collmast.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
	return -1
end if

// บันทึก Memco
if lds_collmemco.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลรายการผู้กู้ร่วม (MemCo) ไม่ได้  "
	ithw_exception.text	+= ls_collmastno +"  "+ lds_collmemco.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
	return -1
end if
// บันทึก Prop
if lds_prop.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลผู้มีกรรมสิทธิ ไม่ได้  "
	ithw_exception.text	+= ls_collmastno +"  "+ lds_prop.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
	return -1
end if


lds_mrtg1.object.mrtg_memberno[1]			= lds_mrtg2.object.mrtg_memberno[1]
lds_mrtg1.object.mrtg_name[1]				= lds_mrtg2.object.mrtg_name[1]
lds_mrtg1.object.mrtg_personid[1]			= lds_mrtg2.object.mrtg_personid[1]
lds_mrtg1.object.mrtg_age[1]					= lds_mrtg2.object.mrtg_age[1]
lds_mrtg1.object.mrtg_nationality[1]			= lds_mrtg2.object.mrtg_nationality[1]
lds_mrtg1.object.mrtg_citizenship[1]			= lds_mrtg2.object.mrtg_citizenship[1]
lds_mrtg1.object.mrtg_parentname[1]		= lds_mrtg2.object.mrtg_parentname[1]
lds_mrtg1.object.mrtg_matename[1]			= lds_mrtg2.object.mrtg_matename[1]
lds_mrtg1.object.mrtg_village[1]				= lds_mrtg2.object.mrtg_village[1]
lds_mrtg1.object.mrtg_address[1]				= lds_mrtg2.object.mrtg_address[1]
lds_mrtg1.object.mrtg_moo[1]					= lds_mrtg2.object.mrtg_moo[1]
lds_mrtg1.object.mrtg_soi[1]					= lds_mrtg2.object.mrtg_soi[1]
lds_mrtg1.object.mrtg_road[1]					= lds_mrtg2.object.mrtg_road[1]
lds_mrtg1.object.mrtg_tumbol[1]				= lds_mrtg2.object.mrtg_tumbol[1]
lds_mrtg1.object.mrtg_district[1]				= lds_mrtg2.object.mrtg_district[1]
lds_mrtg1.object.mrtg_province[1]			= lds_mrtg2.object.mrtg_province[1]
lds_mrtg1.object.mrtg_tel[1]					= lds_mrtg2.object.mrtg_tel[1]
lds_mrtg1.object.mrtg_mariage[1]			= lds_mrtg2.object.mrtg_mariage[1]
lds_mrtg1.object.autrz_name01[1]			= lds_mrtg2.object.autrz_name01[1]
lds_mrtg1.object.autrz_name02[1]			= lds_mrtg2.object.autrz_name02[1]
lds_mrtg1.object.autrz_name03[1]			= lds_mrtg2.object.autrz_name03[1]
lds_mrtg1.object.autrz_pos01[1]				= lds_mrtg2.object.autrz_pos01[1]
lds_mrtg1.object.autrz_pos02[1]				= lds_mrtg2.object.autrz_pos02[1]
lds_mrtg1.object.autrz_age[1]					= lds_mrtg2.object.autrz_age[1]
lds_mrtg1.object.autrz_nationality[1]			= lds_mrtg2.object.autrz_nationality[1]
lds_mrtg1.object.autrz_citizenship[1]			= lds_mrtg2.object.autrz_citizenship[1]
lds_mrtg1.object.autrz_parentname[1]		= lds_mrtg2.object.autrz_parentname[1]
lds_mrtg1.object.autrz_parentname[1]		= lds_mrtg2.object.autrz_parentname[1]
lds_mrtg1.object.autrz_village[1]				= lds_mrtg2.object.autrz_village[1]
lds_mrtg1.object.autrz_address[1]			= lds_mrtg2.object.autrz_address[1]
lds_mrtg1.object.autrz_moo[1]					= lds_mrtg2.object.autrz_moo[1]
lds_mrtg1.object.autrz_soi[1]					= lds_mrtg2.object.autrz_soi[1]
lds_mrtg1.object.autrz_road[1]					= lds_mrtg2.object.autrz_road[1]
lds_mrtg1.object.autrz_tumbol[1]				= lds_mrtg2.object.autrz_tumbol[1]
lds_mrtg1.object.autrz_district[1]				= lds_mrtg2.object.autrz_district[1]
lds_mrtg1.object.autrz_province[1]			= lds_mrtg2.object.autrz_province[1]

/* ของ สุรินทร์ไม่ได้ใช้
lds_mrtg1.object.landcount[1]							= lds_mrtg3.object.landcount[1]
lds_mrtg1.object.landdepartment[1]					= lds_mrtg3.object.landdepartment[1]
lds_mrtg1.object.mortgage_date[1]					= lds_mrtg3.object.mortgage_date[1]
lds_mrtg1.object.mortgage_count[1]					= lds_mrtg3.object.mortgage_count[1]
lds_mrtg1.object.this_mrtg_amt[1]					= lds_mrtg3.object.this_mrtg_amt[1]
lds_mrtg1.object.old_mrtg_amt[1]						= lds_mrtg3.object.old_mrtg_amt[1]
lds_mrtg1.object.first_mrtg_amt[1]					= lds_mrtg3.object.first_mrtg_amt[1]
lds_mrtg1.object.secound_mrtg_amt[1]				= lds_mrtg3.object.secound_mrtg_amt[1]
lds_mrtg1.object.total_mrtg_amt[1]					= lds_mrtg3.object.total_mrtg_amt[1]
lds_mrtg1.object.interest_rate[1]						= lds_mrtg3.object.interest_rate[1]
lds_mrtg1.object.landdepartment_province[1]		= lds_mrtg3.object.landdepartment_province[1]
lds_mrtg1.object.duplicate_count[1]					= lds_mrtg3.object.duplicate_count[1]
*/
if lds_mrtg1.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลทะเบียนหลักทรัพย์ (รายละเอียด 1) ไม่ได้  "
		ithw_exception.text	+= ls_collmastno +"  "+ lds_mrtg1.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
end if


commit using itr_sqlca ;

astr_collmast.xml_collmastdet	= lds_collmast.describe( "Datawindow.Data.XML" )
astr_collmast.xml_collmemco	= lds_collmemco.describe( "Datawindow.Data.XML" )
astr_collmast.xml_mrtg1			= lds_mrtg1.describe( "Datawindow.Data.XML" )
astr_collmast.xml_mrtg2			= lds_mrtg2.describe( "Datawindow.Data.XML" )
astr_collmast.xml_prop			= lds_prop.describe( "Datawindow.Data.XML" )
//astr_collmast.xml_mrtg3			= lds_mrtg3.describe( "Datawindow.Data.XML" )
//astr_collmast.xml_prop			= lds_prop.describe( "Datawindow.Data.XML" )

destroy lds_collmast
destroy lds_mrtg1
destroy lds_mrtg2
//destroy lds_mrtg3
destroy lds_collmemco
destroy lds_prop
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

public function integer of_initreq_contadjust (ref str_lncontaj astr_lncontaj) throws Exception;string ls_contno, ls_memno, ls_loantype, ls_colltype, ls_refcollno
string ls_prename, ls_mbname, ls_mbsurname, ls_colldesc
string ls_xmlcontdet, ls_xmlcontpay, ls_xmlcontcoll, ls_xmlcontint, ls_xmlcontintspc
long ll_count, ll_row, ll_index
integer li_continttype, li_memtype, li_collretsts
dec{2}ldc_prnbal, ldc_wtdamt
dec{4}ldc_collactiveperc, ldc_collbaseperc, ldc_basepermiss, ldc_basepercent, ldc_maxamt, ldc_usedcont, ldc_usedreq, ldc_collbalance, ldc_collactive
datetime ldtm_contaj
boolean lb_error
n_ds lds_infocont, lds_colllist, lds_contintspc, lds_temp

ls_contno = astr_lncontaj.loancontract_no
ldtm_contaj = astr_lncontaj.contaj_date

lb_error = false

astr_lncontaj.xml_contdetail = ""
astr_lncontaj.xml_contpayment = ""
astr_lncontaj.xml_contloanpay = ""
astr_lncontaj.xml_contcoll = ""
astr_lncontaj.xml_contint = ""
astr_lncontaj.xml_contintspc = ""

// รายละเอียดสัญญาที่จะทำการเปลี่ยนแปลงแก้ไข
lds_infocont = create n_ds
lds_infocont.dataobject = "d_loansrv_info_contract"
lds_infocont.settransobject(itr_sqlca)

lds_colllist = create n_ds
lds_colllist.dataobject = "d_loansrv_info_listcoll"
lds_colllist.settransobject(itr_sqlca)

// รายการดอกเบี้ยอ้ตราพิเศษ
lds_contintspc = create n_ds
lds_contintspc.dataobject = "d_loansrv_info_contintspcall"
lds_contintspc.settransobject(itr_sqlca)

ll_count = lds_infocont.retrieve(is_coopcontrol, ls_contno)
if ll_count <= 0 then
	ithw_exception.text = "ไม่พบข้อมูลเสัญญาที่ส่งเข้ามา สัญญาเลขที่ '" + ls_contno + "' กรุณาตรวจสอบ"
	lb_error = true
	goto objdestroy
end if

ls_memno = lds_infocont.getitemstring(ll_count, "member_no")
ls_loantype = lds_infocont.getitemstring(ll_count, "loantype_code")
li_continttype = lds_infocont.getitemnumber(ll_count, "int_continttype")
ldc_prnbal = lds_infocont.getitemdecimal(ll_count, "principal_balance")
ldc_wtdamt = lds_infocont.getitemdecimal(ll_count, "withdrawable_amt")
li_collretsts = lds_infocont.GetItemNumber(ll_count, "collreturnval_status")

select mbucfprename.prename_desc, mbmembmaster.memb_name,
mbmembmaster.memb_surname, mbmembmaster.member_type
into :ls_prename, :ls_mbname, :ls_mbsurname, :li_memtype
from mbmembmaster, mbucfprename
where(mbmembmaster.prename_code = mbucfprename.prename_code) and
(mbmembmaster.coop_id = :is_coopcontrol) and
(mbmembmaster.member_no = :ls_memno)
using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text = "ไม่พบทะเบียนสมาชิกที่ถูกระบุในสัญญา ทะเบียนเลขที่ " + ls_memno + " กรุณาตรวจสอบ"
	lb_error = true
	goto objdestroy
end if

lds_temp = create n_ds

// รายละเอียดสัญญาที่ทำการแก้ไข
lds_temp.dataobject = DWCONTADJ
ll_row = lds_temp.insertrow(0)

lds_temp.object.loantype_code[ll_row] = lds_infocont.object.loantype_code[1]
lds_temp.object.loantype_desc[ll_row] = lds_infocont.object.loantype_desc[1]
lds_temp.object.loan_prefix[ll_row] = lds_infocont.object.loan_prefix[1]
lds_temp.object.principal_balance[ll_row] = lds_infocont.object.principal_balance[1]
lds_temp.object.loanapprove_amt[ll_row] = lds_infocont.object.loanapprove_amt[1]
lds_temp.object.withdrawable_amt[ll_row] = lds_infocont.object.withdrawable_amt[1]
lds_temp.object.contlaw_status[ll_row] = lds_infocont.object.contlaw_status[1]

lds_temp.setitem(ll_row, "prename_desc", ls_prename)
lds_temp.setitem(ll_row, "memb_name", ls_mbname)
lds_temp.setitem(ll_row, "memb_surname", ls_mbsurname)
lds_temp.setitem(ll_row, "member_type", li_memtype)
lds_temp.setitem(ll_row, "collreturnval_status", li_collretsts)

lds_temp.setitem(ll_row, "memcoop_id", is_coopcontrol)
lds_temp.setitem(ll_row, "member_no", ls_memno)
lds_temp.setitem(ll_row, "concoop_id", is_coopcontrol)
lds_temp.setitem(ll_row, "loancontract_no", ls_contno)
lds_temp.setitem(ll_row, "contadjust_date", ldtm_contaj)
lds_temp.setitem(ll_row, "contadjust_status", 1)

astr_lncontaj.xml_contdetail = inv_dwxmliesrv.of_xmlexport(lds_temp)

// เงื่อนไขการชำระประจำเดือน
lds_temp.dataobject = DWCONTADJPAY
ll_row = lds_temp.insertrow(0)

lds_temp.object.contadjust_code[ll_row] = "PAY"
lds_temp.object.loanpayment_type[ll_row] = lds_infocont.object.loanpayment_type[1]
lds_temp.object.period_payamt[ll_row] = lds_infocont.object.period_payamt[1]
lds_temp.object.period_payment[ll_row] = lds_infocont.object.period_payment[1]
lds_temp.object.payment_status[ll_row] = lds_infocont.object.payment_status[1]
lds_temp.object.oldpayment_type[ll_row] = lds_infocont.object.loanpayment_type[1]
lds_temp.object.oldperiod_payamt[ll_row] = lds_infocont.object.period_payamt[1]
lds_temp.object.oldperiod_payment[ll_row] = lds_infocont.object.period_payment[1]
lds_temp.object.oldpayment_status[ll_row] = lds_infocont.object.payment_status[1]

astr_lncontaj.xml_contpayment = inv_dwxmliesrv.of_xmlexport(lds_temp)

// เงื่อนไขวิธีการหักชำระ
lds_temp.dataobject = DWCONTADJLNPAY
ll_row = lds_temp.insertrow(0)

lds_temp.object.contadjust_code[ll_row] = "KEP"
lds_temp.object.loanpay_code[ll_row] = lds_infocont.object.loanpay_code[1]
lds_temp.object.loanpay_bank[ll_row] = lds_infocont.object.loanpay_bank[1]
lds_temp.object.loanpay_branch[ll_row] = lds_infocont.object.loanpay_branch[1]
lds_temp.object.loanpay_accid[ll_row] = lds_infocont.object.loanpay_accid[1]
lds_temp.object.oldloanpay_code[ll_row] = lds_infocont.object.loanpay_code[1]
lds_temp.object.oldloanpay_bank[ll_row] = lds_infocont.object.loanpay_bank[1]
lds_temp.object.oldloanpay_branch[ll_row] = lds_infocont.object.loanpay_branch[1]
lds_temp.object.oldloanpay_accid[ll_row] = lds_infocont.object.loanpay_accid[1]

astr_lncontaj.xml_contloanpay = inv_dwxmliesrv.of_xmlexport(lds_temp)

// เงื่อนไขการคิด ด/บ
lds_temp.dataobject = DWCONTADJINT
ll_row = lds_temp.insertrow(0)

lds_temp.object.contadjust_code[ll_row] = "INT"
lds_temp.object.int_continttype[ll_row] = lds_infocont.object.int_continttype[1]
lds_temp.object.int_contintrate[ll_row] = lds_infocont.object.int_contintrate[1]
lds_temp.object.int_continttabcode[ll_row] = lds_infocont.object.int_continttabcode[1]
lds_temp.object.int_contintincrease[ll_row] = lds_infocont.object.int_contintincrease[1]
lds_temp.object.int_intsteptype[ll_row] = lds_infocont.object.int_intsteptype[1]

lds_temp.object.oldint_continttype[ll_row] = lds_infocont.object.int_continttype[1]
lds_temp.object.oldint_contintrate[ll_row] = lds_infocont.object.int_contintrate[1]
lds_temp.object.oldint_continttabcode[ll_row] = lds_infocont.object.int_continttabcode[1]
lds_temp.object.oldint_contintincrease[ll_row] = lds_infocont.object.int_contintincrease[1]
lds_temp.object.oldint_intsteptype[ll_row] = lds_infocont.object.int_intsteptype[1]

astr_lncontaj.xml_contint = inv_dwxmliesrv.of_xmlexport(lds_temp)

// ถ้าเป็นดอกเบี้ยอัตราพิเศษเป็นช่วง
if li_continttype = 3 then
	
	lds_contintspc.retrieve(is_coopcontrol, ls_contno)
	
	lds_temp.dataobject = DWCONTADJINTSPC

	for ll_index = 1 to lds_contintspc.rowcount()
		ll_row = lds_temp.insertrow(0)
		
		lds_temp.object.contadjust_type[ll_row] = "NEW"
		lds_temp.object.seq_no[ll_row] = ll_index
		lds_temp.object.int_continttype[ll_row] = lds_contintspc.object.int_continttype[ll_index]
		lds_temp.object.int_contintrate[ll_row] = lds_contintspc.object.int_contintrate[ll_index]
		lds_temp.object.int_continttabcode[ll_row] = lds_contintspc.object.int_continttabcode[ll_index]
		lds_temp.object.int_contintincrease[ll_row] = lds_contintspc.object.int_contintincrease[ll_index]
		lds_temp.object.int_timetype[ll_row] = lds_contintspc.object.int_timetype[ll_index]
		lds_temp.object.int_timeamt[ll_row] = lds_contintspc.object.int_timeamt[ll_index]
		lds_temp.object.effective_date[ll_row] = lds_contintspc.object.effective_date[ll_index]
	next
	
	astr_lncontaj.xml_contintspc = inv_dwxmliesrv.of_xmlexport(lds_temp)

end if

// รายการค้ำประกัน
this.of_setsrvcollpermiss( true )
lds_temp.dataobject = DWCONTADJCOLL

ll_count = lds_colllist.retrieve(is_coopcontrol, ls_contno)

for ll_index = 1 to ll_count
	ll_row = lds_temp.insertrow(0)
	
	ls_colltype = lds_colllist.getitemstring(ll_index, "loancolltype_code")
	ls_refcollno = lds_colllist.getitemstring(ll_index, "ref_collno")
	ldc_collbaseperc = lds_colllist.getitemdecimal(ll_index, "collbase_percent")
	ldc_collactiveperc = lds_colllist.getitemdecimal(ll_index, "collactive_percent")
	ldc_collactive = lds_colllist.GetItemDecimal(ll_index, "collactive_amt")
	
	// คำนวณยอดค้ำได้
	try
		inv_collpermisssrv.of_setresigncheck( false )
		inv_collpermisssrv.of_getcollpermiss(ls_loantype, ls_colltype, is_coopcontrol, ls_refcollno, ldtm_contaj, ldc_basepermiss, ldc_maxamt, ldc_basepercent)
		ldc_usedcont = inv_collpermisssrv.of_getcollusecontamt(is_coopcontrol, ls_refcollno, ls_loantype, ls_colltype, ls_contno, "")
		ldc_usedreq = inv_collpermisssrv.of_getcollusereqamt(is_coopcontrol, ls_refcollno, ls_loantype, ls_colltype, "")
		
		// base percent ให้ใช้ของเดิมเพราะเป็นการ init จะเปลี่ยนแปลงค่ากลางทางไม่ได้
		ldc_collbalance = (ldc_basepermiss - (ldc_usedcont + ldc_usedreq)) * (ldc_collbaseperc / 100)
		
		if ldc_collbalance < 0 then
			ldc_collbalance = 0
		end if
		
	catch (Exception lthw_error)
		ldc_collbalance = 0
	end try
	
	if li_collretsts = 1 then
		ldc_collactive = (ldc_prnbal + ldc_wtdamt) * (ldc_collactiveperc / 100)
	end if
	
	lds_temp.object.description[ll_row] = lds_colllist.object.description[ll_index]
	
	lds_temp.setitem(ll_row, "contadjust_type", "NEW")
	lds_temp.setitem(ll_row, "seq_no", ll_index)
	lds_temp.setitem(ll_row, "loancolltype_code", ls_colltype)
	lds_temp.setitem(ll_row, "refcoop_id", is_coopcontrol)
	lds_temp.setitem(ll_row, "ref_collno", ls_refcollno)
	lds_temp.setitem(ll_row, "collbase_amt", ldc_basepermiss)
	lds_temp.setitem(ll_row, "collbase_percent", ldc_collbaseperc)
	lds_temp.setitem(ll_row, "collused_amt", ldc_usedcont + ldc_usedreq)
	lds_temp.setitem(ll_row, "collbalance_amt", ldc_collbalance)
	lds_temp.setitem(ll_row, "collmax_amt", ldc_maxamt)
	lds_temp.setitem(ll_row, "collactive_amt", ldc_collactive)
	lds_temp.setitem(ll_row, "collactive_percent", ldc_collactiveperc)

next

this.of_setsrvcollpermiss( false )

astr_lncontaj.xml_contcoll = inv_dwxmliesrv.of_xmlexport(lds_temp)

objdestroy:
if isvalid(lds_infocont) then destroy lds_infocont
if isvalid(lds_temp) then destroy lds_temp
if isvalid(lds_colllist) then destroy lds_colllist
if isvalid(lds_contintspc) then destroy lds_contintspc

if lb_error then
	throw ithw_exception
end if

return 1
end function

public function integer of_savereq_contadjust (str_lncontaj astr_lncontaj) throws Exception;string		ls_contajdocno, ls_oldcol[], ls_newcol[]
string		ls_entryid, ls_ecoopid
boolean	lb_chgpay, lb_chglnpay, lb_chgint, lb_chgcoll, lb_error
n_ds		lds_adjmast, lds_adjpay, lds_adjlnpay, lds_adjint, lds_adjintspc, lds_adjcoll, lds_adjintspcold, lds_adjcollold

ls_entryid		= astr_lncontaj.entry_id
ls_ecoopid		= is_coopid

lb_chgpay	= false
lb_chglnpay	= false
lb_chgint		= false
lb_chgcoll	= false
lb_error		= false

this.of_setsrvdwxmlie( true )

// สร้าง DS ใบคำขอ
lds_adjmast		= create n_ds
lds_adjmast.dataobject	= DWCONTADJ
lds_adjmast.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( lds_adjmast, astr_lncontaj.xml_contdetail )

// สร้าง DS ชุดการเปลี่ยนแปลง
this.of_setlncontadjdata( astr_lncontaj, lds_adjpay, lds_adjlnpay, lds_adjint, lds_adjintspc, lds_adjcoll, lds_adjintspcold, lds_adjcollold )

// ตรวจสอบการเปลี่ยนแปลงการชำระ
ls_newcol	= { "loanpayment_type", "period_payamt", "period_payment", "payment_status", "period_payment_max" }
ls_oldcol		= { "oldpayment_type", "oldperiod_payamt", "oldperiod_payment", "oldpayment_status", "oldperiod_paymax" }
lb_chgpay	= this.of_checkcontadjustdet( lds_adjpay, ls_newcol, ls_oldcol )

// ตรวจสอบรูปแบบการชำระเมื่อถึงกำหนดชำระ
ls_newcol	= { "loanpay_code", "loanpay_bank", "loanpay_branch", "loanpay_accid" }
ls_oldcol		= { "oldloanpay_code", "oldloanpay_bank", "oldloanpay_branch", "oldloanpay_accid" }
lb_chglnpay	= this.of_checkcontadjustdet( lds_adjlnpay, ls_newcol, ls_oldcol )

// ตรวจสอบการเปลี่ยนแปลงอัตรา ด/บ
ls_newcol	= { "int_continttype", "int_contintrate", "int_continttabcode", "int_contintincrease", "int_intsteptype" }
ls_oldcol		= { "oldint_continttype", "oldint_contintrate", "oldint_continttabcode", "oldint_contintincrease", "oldint_intsteptype" }
lb_chgint		= this.of_checkcontadjustdet( lds_adjint, ls_newcol, ls_oldcol )

// อัตรา ดอกเบี้ยพิเศษ
if lb_chgint = false then
	ls_newcol	= { "effective_date", "int_continttype", "int_continttabcode", "int_contintincrease", "int_contintrate" }
	lb_chgint		= this.of_checkcontadjustdetrow( lds_adjintspcold, lds_adjintspc, ls_newcol )
end if

// ตรวจสอบการเปลี่ยนแปลงหลักประกัน
ls_newcol	= { "loancolltype_code", "ref_collno", "description", "collbase_amt", "collbase_percent", "collactive_percent" }
lb_chgcoll	= this.of_checkcontadjustdetrow( lds_adjcoll, lds_adjcollold, ls_newcol )

// ถ้าไม่มีการเปลี่ยนแปลงอะไรเลย
if lb_chgpay = false and lb_chgint = false and lb_chgcoll = false and lb_chglnpay = false then
	ithw_exception.text	= "ไม่พบว่ามีการการเปลี่ยนแปลงข้อมูลสัญญา กรุณาตรวจสอบ"
	lb_error					= true
	goto objdestroy
end if

// ส่งไปสร้างเลขที่เอกสาร
this.of_setlncontadjdocno( ls_entryid, lds_adjmast, lds_adjpay, lds_adjlnpay, lds_adjint, lds_adjintspc, lds_adjcoll, lds_adjintspcold, lds_adjcollold )

ls_contajdocno		= lds_adjmast.getitemstring( 1, "contadjust_docno" )

if lds_adjmast.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลการเปลี่ยนแปลงรายละเอียดสัญญา (ContractAdjust) ไม่ได้  "
	ithw_exception.text	+= ls_contajdocno +"  "+ lds_adjmast.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// การเปลี่ยนแปลงการชำระประจำเดือน
if lb_chgpay then
	if lds_adjpay.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลการเปลี่ยนแปลงรายละเอียดสัญญาในส่วนการชำระประจำเดือน (Contract Payment) ไม่ได้  "
		ithw_exception.text	+= ls_contajdocno +"  "+ lds_adjpay.of_geterrormessage()
		lb_error					= true
		goto objdestroy
	end if
end if

// การเปลี่ยนแปลงรูปแบบการชำระเมื่อครบกำหนด
if lb_chglnpay then
	if lds_adjlnpay.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลการเปลี่ยนแปลงรูปแบบการชำระเมื่อครบกำหนด (Contract Loanpay) ไม่ได้  "
		ithw_exception.text	+= ls_contajdocno +"  "+ lds_adjlnpay.of_geterrormessage()
		lb_error					= true
		goto objdestroy
	end if
end if

// การเปลี่ยนแปลงอัตราด/บของสัญญา
if lb_chgint then
	if lds_adjint.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลการเปลี่ยนแปลงรายละเอียดสัญญาในส่วนการคิดอัตรา ด/บ (Contract Interest) ไม่ได้  "
		ithw_exception.text	+= ls_contajdocno +"  "+ lds_adjint.of_geterrormessage()
		lb_error					= true
		goto objdestroy
	end if
	
	// อัตรา ด/บ พิเศษเป็นช่วง
	if lds_adjintspc.rowcount() > 0 then
		if lds_adjintspc.update() <> 1 then
			ithw_exception.text	= "บันทึกข้อมูลการเปลี่ยนแปลงรายละเอียดสัญญาในส่วนอัตรา ด/บ พิเศษเป็นช่วง (Contract IntSpecial) ไม่ได้  "
			ithw_exception.text	+= ls_contajdocno +"  "+ lds_adjintspc.of_geterrormessage()
			lb_error					= true
			goto objdestroy
		end if
	end if
	
	// อัตรา ด/บ พิเศษเป็นช่วง<ก่อนเปลี่ยนแปลง>
	if lds_adjintspcold.rowcount() > 0 then
		if lds_adjintspc.update() <> 1 then
			ithw_exception.text	= "บันทึกข้อมูลการเปลี่ยนแปลงรายละเอียดสัญญาในส่วนอัตรา ด/บ พิเศษเป็นช่วง (Contract IntSpecial Old) ไม่ได้  "
			ithw_exception.text	+= ls_contajdocno +"  "+ lds_adjintspcold.of_geterrormessage()
			lb_error					= true
			goto objdestroy
		end if
	end if
end if

// การเปลี่ยนแปลงรายละเอียดการค้ำประกัน
if lb_chgcoll then
	if lds_adjcoll.rowcount() > 0 then
		if lds_adjcoll.update() <> 1 then
			ithw_exception.text	= "บันทึกข้อมูลการเปลี่ยนแปลงรายละเอียดสัญญาในส่วนการค้ำประกันไม่ได้(Contract Coll) ไม่ได้  "
			ithw_exception.text	+= ls_contajdocno +"  "+ lds_adjcoll.of_geterrormessage()
			lb_error					= true
			goto objdestroy
		end if
	end if
	
	if lds_adjcollold.rowcount() > 0 then
		if lds_adjcollold.update() <> 1 then
			ithw_exception.text	= "บันทึกข้อมูลการเปลี่ยนแปลงรายละเอียดสัญญาในส่วนการค้ำประกันไม่ได้(Contract Coll Old) ไม่ได้  "
			ithw_exception.text	+= ls_contajdocno +"  "+ lds_adjcollold.of_geterrormessage()
			lb_error					= true
			goto objdestroy
		end if
	end if
end if

// ผ่านรายการแก้ไขไปปรับปรุงในสัญญา
try
	if lb_chgpay	then
		this.of_post_reqcontadj_pay( lds_adjmast, lds_adjpay )
	end if
	
	if lb_chglnpay	then
		this.of_post_reqcontadj_lnpay( lds_adjmast, lds_adjlnpay )
	end if

	if lb_chgint	then
		this.of_post_reqcontadj_int( lds_adjmast, lds_adjint, lds_adjintspc )
	end if

	if lb_chgcoll	then
		this.of_post_reqcontadj_coll( lds_adjmast, lds_adjcoll )
	end if
catch( Exception lthw_postadj )
	ithw_exception.text	= lthw_postadj.text
	lb_error					= true
end try

objdestroy:
destroy lds_adjmast
destroy lds_adjpay
destroy lds_adjlnpay
destroy lds_adjint
destroy lds_adjintspc
destroy lds_adjcoll
destroy lds_adjintspcold
destroy lds_adjcollold
this.of_setsrvdwxmlie( false )

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

// ส่งเลขที่ใบคำขอกลับ เผื่อนำไปทำรายการได้
astr_lncontaj.contaj_docno		= ls_contajdocno

return 1
end function

public function integer of_initreq_compound (ref str_compound astr_compound) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายการขอผ่อนผันการชำระประจำเดือนของสมาชิกที่ส่งทะเบียนเข้ามา (ได้ค่า XML กลับไป)
</description>

<arguments>  
	str_compound{ref}		Structure รายการขอผ่อนผันการชำระเงินประจำเดือน
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no		String			ทะเบียนสมาชิก
		- comp_date		datetime		วันที่ทำรายการ
</arguments>

<return> 
	Integer
	1			ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะส่งรายละเอียด
	รายการขอผ่อนผันกลับไปในรูปแบบ XML
	
	str_compound	lstr_compound
	
	lstr_compound.member_no			= dw_master.getitemstring( 1, "member_no" )
	lstr_compound.comp_date			= dw_master.getitemdatetime( 1, "reqcomp_date" )
	
	lnv_lnoperate.of_initreq_compound( lstr_compound )
	
	dw_master.reset()
	dw_master.importstring( XML!, lstr_compound.xml_comphead )
	
	dw_compshr.reset()
	dw_compshr.importstring( XML!, lstr_compound.xml_compshare )	

	dw_comploan.reset()
	dw_comploan.importstring( XML!, lstr_compound.xml_comploan )	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_contno
long		ll_count, ll_index, ll_row
integer	li_status, li_comptype
datetime	ldtm_compdate
n_ds		lds_data, lds_infoshare, lds_infomemcont

ls_memno		= astr_compound.member_no
li_comptype		= astr_compound.comp_type
ldtm_compdate	= astr_compound.comp_date

astr_compound.xml_comphead		= ""
astr_compound.xml_compmemb	= ""
astr_compound.xml_compshare	= ""
astr_compound.xml_comploan		= ""

ll_count	= ids_infomemdet.retrieve( ls_memno )
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลทะเบียนสมาชิกที่ส่งเข้ามา ทะเบียนเลขที่ " + ls_memno + "' กรุณาตรวจสอบ"
	throw ithw_exception
end if

lds_data		= create n_ds
lds_data.dataobject	= "d_loansrv_req_compound"
lds_data.insertrow( 0 )

lds_data.object.prename_desc[ 1 ]		= ids_infomemdet.object.prename_desc[ 1 ]
lds_data.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ 1 ]
lds_data.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ 1 ]
lds_data.object.membgroup_code[ 1 ]	= ids_infomemdet.object.membgroup_code[ 1 ]
lds_data.object.membgroup_desc[ 1 ]	= ids_infomemdet.object.membgroup_desc[ 1 ]
lds_data.object.memb_remark[ 1 ]		= ids_infomemdet.object.remark[ 1 ]
lds_data.object.sharestk_value[ 1 ]		= ids_infomemdet.object.sharestk_value[ 1 ]

lds_data.setitem( 1, "member_no", ls_memno )
lds_data.setitem( 1, "reqcomp_date", ldtm_compdate )
lds_data.setitem( 1, "reqcomp_type", li_comptype )
lds_data.setitem( 1, "reqcomp_status", 1 )

astr_compound.xml_comphead		= inv_dwxmliesrv.of_xmlexport( lds_data )

// DW สำหรับ init รายการ
lds_data.dataobject	= "d_loansrv_req_compounddet"

choose case li_comptype
	case 1	// ผ่อนผันขอส่งชำระเองไม่ต้องไปหักที่ต้นสังกัด
		ll_row			= lds_data.insertrow( 0 )
		
		lds_data.setitem( ll_row, "reqcomptype_code", "GRP" )
		lds_data.setitem( ll_row, "seq_no", ll_index )
		lds_data.setitem( ll_row, "operate_flag", 0 )
		lds_data.setitem( ll_row, "comp_period", 0 )
		
		lds_data.object.bfcomp_oldgrp[ ll_row ]		= ids_infomemdet.object.membgroup_code[ 1 ]
		
		astr_compound.xml_compmemb	= inv_dwxmliesrv.of_xmlexport( lds_data )
	case 2	// ผ่อนผันขอหยุดส่ง
		ll_row			= lds_data.insertrow( 0 )
		
		lds_data.setitem( ll_row, "reqcomptype_code", "ALL" )
		lds_data.setitem( ll_row, "seq_no", ll_index )
		lds_data.setitem( ll_row, "operate_flag", 0 )
		lds_data.setitem( ll_row, "comp_period", 0 )
		
		lds_data.object.bfcomp_paystatus[ ll_row ]		= ids_infomemdet.object.pausekeep_flag[ 1 ]
		
		astr_compound.xml_compmemb	= inv_dwxmliesrv.of_xmlexport( lds_data )
	case 3	// ผ่อนผันเป็นบางรายการ
		// รายละเอียดหุ้น
		lds_infoshare	= create n_ds
		lds_infoshare.dataobject		= "d_loansrv_info_memshare"
		lds_infoshare.settransobject( itr_sqlca )
		lds_infoshare.retrieve( ls_memno )
		
		li_status		= lds_infoshare.getitemnumber( 1, "sharemaster_status" )
		
		// init หุ้นเฉพาะพวกที่มีสถานะเป็นปกติเท่านั้น
		if li_status = 1 then
			lds_data.insertrow( 0 )
			
			lds_data.setitem( 1, "reqcomptype_code", "SHR" )
			lds_data.setitem( 1, "seq_no", 1 )
			lds_data.setitem( 1, "operate_flag", 0 )
			lds_data.setitem( 1, "comp_period", 0 )
			lds_data.setitem( 1, "comp_payment", 0 )
			lds_data.setitem( 1, "comp_paystatus", 1 )
			
			lds_data.object.shrlontype_code[ 1 ]		= lds_infoshare.object.sharetype_code[ 1 ]
			lds_data.object.bfshrcont_balamt[ 1 ]		= lds_infoshare.object.sharestk_value[ 1 ]
			lds_data.object.bfpayment_type[ 1 ]		= lds_infoshare.object.payment_status[ 1 ]
			lds_data.object.bfperiod_payment[ 1 ]	= lds_infoshare.object.periodshare_amt[ 1 ]
			lds_data.object.bfpayment_status[ 1 ]	= lds_infoshare.object.payment_status[ 1 ]
			lds_data.object.bfcomp_status[ 1 ]		= lds_infoshare.object.compound_status[ 1 ]
			lds_data.object.bfcomp_period[ 1 ]		= lds_infoshare.object.compound_period[ 1 ]
			lds_data.object.bfcomp_duedate[ 1 ]		= lds_infoshare.object.compounddue_date[ 1 ]
			lds_data.object.bfcomp_payment[ 1 ]		= lds_infoshare.object.compound_payment[ 1 ]
			lds_data.object.bfcomp_paystatus[ 1 ]	= lds_infoshare.object.compound_paystatus[ 1 ]
			
			astr_compound.xml_compshare	= inv_dwxmliesrv.of_xmlexport( lds_data )
		end if
		
		// รายละเอียดหนี้
		lds_data.reset()
		
		// หนี้ของสมาชิกที่มีอยู่
		lds_infomemcont	= create n_ds
		lds_infomemcont.dataobject		= "d_loansrv_info_memcont"
		lds_infomemcont.settransobject( itr_sqlca )
		
		ll_count	=lds_infomemcont.retrieve( ls_memno )
		for ll_index = 1 to ll_count
			ls_contno	= lds_infomemcont.getitemstring( ll_index, "loancontract_no" )
			
			ids_infocont.retrieve( ls_contno )
			
			ll_row			= lds_data.insertrow( 0 )
			
			lds_data.setitem( ll_row, "reqcomptype_code", "LON" )
			lds_data.setitem( ll_row, "seq_no", ll_index )
			lds_data.setitem( ll_row, "operate_flag", 0 )
			lds_data.setitem( ll_row, "comp_period", 0 )
			lds_data.setitem( ll_row, "comp_payment", 0 )
			lds_data.setitem( ll_row, "comp_paystatus", 1 )
			
			lds_data.object.shrlontype_code[ ll_row ]	= ids_infocont.object.loantype_code[ 1 ]
			lds_data.object.loancontract_no[ ll_row ]	= ids_infocont.object.loancontract_no[ 1 ]
			lds_data.object.bfshrcont_balamt[ ll_row ]	= ids_infocont.object.principal_balance[ 1 ]
			lds_data.object.bfpayment_type[ ll_row ]	= ids_infocont.object.loanpayment_type[ 1 ]
			lds_data.object.bfperiod_payment[ ll_row ]	= ids_infocont.object.period_payment[ 1 ]
			lds_data.object.bfpayment_status[ ll_row ]	= ids_infocont.object.payment_status[ 1 ]
			lds_data.object.bfcomp_status[ ll_row ]		= ids_infocont.object.compound_status[ 1 ]
			lds_data.object.bfcomp_period[ ll_row ]		= ids_infocont.object.compound_period[ 1 ]
			lds_data.object.bfcomp_duedate[ ll_row ]	= ids_infocont.object.compounddue_date[ 1 ]
			lds_data.object.bfcomp_paytype[ ll_row ]	= ids_infocont.object.compound_paytype[ 1 ]
			lds_data.object.bfcomp_payment[ ll_row ]	= ids_infocont.object.compound_payment[ 1 ]
			lds_data.object.bfcomp_paystatus[ ll_row ]	= ids_infocont.object.compound_paystatus[ 1 ]
			lds_data.object.comp_paytype[ ll_row ]		= ids_infocont.object.loanpayment_type[ 1 ]
		next
		
		astr_compound.xml_comploan		= inv_dwxmliesrv.of_xmlexport( lds_data )
end choose

return 1
end function

public function integer of_savereq_compound (ref str_compound astr_compound) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกและทำรายการขอผ่อนผันการชำระเงินประจำเดือน
</description>

<arguments>  
	str_compound		Structure รายการขอผ่อนผันการชำระเงินประจำเดือน
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_comphead		String			XML รายละเอียดการขอผ่อนผัน
		- xml_compshare		String			XML รายการขอผ่อนผันการส่งหุ้น
		- xml_comploan		String			XML รายการขอผ่อนผันการส่งหนี้
		- entry_id				string			ผู้ทำรายการ
		- branch_id				string			สาขาที่ทำรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะทำการบันทึกใบทำรายการขอผ่อนผันและไปปรับปรุงในทะเบียนหุ้นหรือสัญญาว่ามีการขอผ่อนผัน
	
	str_compound		lstr_compound
	
	lstr_compound.xml_comphead		= dw_master.describe( "Datawindow.Data.XML" )
	lstr_compound.xml_compshare		= dw_depshare.describe( "Datawindow.Data.XML" )
	lstr_compound.xml_comploan		= dw_deploan.describe( "Datawindow.Data.XML" )
	lstr_compound.entry_id				= entry_id
	lstr_compound.branch_id			= branch_id
	
	lnv_lnoperate.of_savereq_compound( lstr_compound )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 11/10/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_contno, ls_compdocno, ls_comptype, ls_compprior, ls_compcode
string		ls_entryid, ls_coopid, ls_errtext, ls_newgroup
long		ll_count, ll_index, ll_row, ll_seqno
integer	li_compstatus, li_compperiod, li_compaytype, li_comptype
dec{2}	ldc_comppayment
datetime	ldtm_compdate, ldtm_compdue, ldtm_entrydate, ldtm_nulldate
n_ds		lds_head, lds_detail

ls_entryid			= astr_compound.entry_id
ls_coopid				= astr_compound.coop_id
ldtm_entrydate		= datetime( today(), now() )

lds_head		= create n_ds
lds_head.dataobject	= "d_loansrv_req_compound"
lds_head.settransobject( itr_sqlca )

lds_detail	= create n_ds
lds_detail.dataobject	= "d_loansrv_req_compounddet"
lds_detail.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( lds_head, astr_compound.xml_comphead )

ll_count	= lds_head.rowcount()
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลสำหรับการบันทึกการขอผ่อนผัน กรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_dwxmliesrv.of_xmlimport( lds_detail, astr_compound.xml_compmemb )
inv_dwxmliesrv.of_xmlimport( lds_detail, astr_compound.xml_compshare )
inv_dwxmliesrv.of_xmlimport( lds_detail, astr_compound.xml_comploan )

// ลบพวกไม่มีการทำรายการออก
lds_detail.setfilter( "operate_flag = 1" )
lds_detail.filter()

if lds_detail.filteredcount() > 0 then
	lds_detail.rowsdiscard( 1, lds_detail.filteredcount(), filter! )
end if

// ตรวจว่ามีการทำรายการหรือเปล่า
ll_count	= lds_detail.rowcount()
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบว่ามีการทำรายการที่จะขอผ่อนผัน กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ขอเลขที่เอกสาร
this.of_setsrvdoccontrol( true )
ls_compdocno	= inv_docsrv.of_getnewdocno( ls_coopid, "SLCOMPOUND" )
this.of_setsrvdoccontrol( false )

// ให้ค่าเลขที่เอกสาร
lds_head.setitem( 1, "reqcomp_docno", ls_compdocno )
lds_head.setitem( 1, "entry_id", ls_entryid )
lds_head.setitem( 1, "entry_date", ldtm_entrydate )
lds_head.setitem( 1, "coop_id", ls_coopid )

lds_detail.setsort( "reqcomptype_code a, seq_no a" )
lds_detail.sort()

// ใส่เลขที่เอกสารและลำดับที่ใน detail
for ll_index = 1 to ll_count
	ls_comptype		= lds_detail.getitemstring( ll_index, "reqcomptype_code" )
	
	if ls_comptype <> ls_compprior then
		ll_seqno			= 0
		ls_compprior	= ls_comptype
	end if
	
	ll_seqno ++
	
	lds_detail.setitem( ll_index, "reqcomp_docno", ls_compdocno )
	lds_detail.setitem( ll_index, "seq_no", ll_seqno )
next

// -----------------------
// เริ่มกระบวนการบันทึก
// -----------------------
// บันทึก Master
if lds_head.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลการขอผ่อนผัน (Compound Master) ไม่ได้  "
	ithw_exception.text	+= ls_compdocno +"  "+ lds_head.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Detail
if lds_detail.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล รายการขอผ่อนผัน (Compound Detail) ไม่ได้  "
	ithw_exception.text	+= ls_compdocno +"  "+ lds_detail.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

ls_memno		= lds_head.getitemstring( 1, "member_no" )
li_comptype		= lds_head.getitemnumber( 1, "reqcomp_type" )
ldtm_compdate	= lds_head.getitemdatetime( 1, "reqcomp_date" )

// ปรับปรุงข้อมูลการขอผ่อนผันในตัวทะเบียนหุ้นหรือสัญญา
for ll_index = 1 to ll_count
	ls_comptype			= lds_detail.getitemstring( ll_index, "reqcomptype_code" )
	ls_contno			= lds_detail.getitemstring( ll_index, "loancontract_no" )
	ls_compcode		= lds_detail.getitemstring( ll_index, "comp_typecode" )
	ls_newgroup		= lds_detail.getitemstring( ll_index, "comp_newgrp" )
	li_compperiod		= lds_detail.getitemnumber( ll_index, "comp_period" )
	li_compaytype		= lds_detail.getitemnumber( ll_index, "comp_paytype" )
	ldc_comppayment	= lds_detail.getitemdecimal( ll_index, "comp_payment" )
	li_compstatus		= lds_detail.getitemnumber( ll_index, "comp_paystatus" )
	ldtm_compdue		= lds_detail.getitemdatetime( ll_index, "comp_duedate" )
	
	choose case ls_comptype
		case "GRP"
			if ls_compcode = "NML" then
				update	mbmembmaster
				set			compoundkeep_status	= 0,
							compoundkeep_nmldate	= :ldtm_compdate
				where	( member_no	= :ls_memno )
				using		itr_sqlca ;
			else
				update	mbmembmaster
				set			compoundkeep_period	= :li_compperiod,
							compoundkeep_duedate	= :ldtm_compdue,
							compoundkeep_date		= :ldtm_compdate,
							compoundkeep_group	= :ls_newgroup,
							compoundkeep_status	= 1
				where	( member_no	= :ls_memno )
				using		itr_sqlca ;
			end if
		case "ALL"
			if ls_compcode = "NML" then
				setnull( ldtm_nulldate )
				
				update	mbmembmaster
				set			pausekeep_flag		= 0,
							pausekeep_date	= :ldtm_nulldate,
							compoundkeep_status	= 0
				where	( member_no	= :ls_memno )
				using		itr_sqlca ;
			else
				update	mbmembmaster
				set			pausekeep_flag				= 1,
							pausekeep_date			= :ldtm_compdate,
							compoundkeep_period	= :li_compperiod,
							compoundkeep_duedate	= :ldtm_compdue,
							compoundkeep_date		= :ldtm_compdate,
							compoundkeep_status	= 2
				where	( member_no	= :ls_memno )
				using		itr_sqlca ;
			end if
		case "SHR"
			if ls_compcode = "NML" then
				update	shsharemaster
				set			compound_status		= 0,
							compound_nmldate	= :ldtm_compdate
				where	( member_no	= :ls_memno )
				using		itr_sqlca ;
			else
				ldc_comppayment		= ldc_comppayment / 10
				
				update	shsharemaster
				set			compound_status	= 1,
							compound_date	= :ldtm_compdate,
							compound_period	= :li_compperiod,
							compounddue_date	= :ldtm_compdue,
							compound_payment	= :ldc_comppayment,
							compound_paystatus	= :li_compstatus
				where	( member_no	= :ls_memno )
				using		itr_sqlca ;
			end if
			
			ls_errtext	= "ไม่สามารถปรับปรุงข้อมูลการขอผ่อนผันในทะเบียนหุ้นได้ ทะเบียนสมาชิก "+ls_memno
		case "LON"
			choose case ls_compcode
				case "NML"
					update	lncontmaster
					set			compound_status		= 0,
								compound_nmldate	= :ldtm_compdate
					where	( loancontract_no	= :ls_contno )
					using		itr_sqlca ;
					
				case "CMP"
					update	lncontmaster
					set			compound_status	= 1,
								compound_date	= :ldtm_compdate,
								compound_period	= :li_compperiod,
								compounddue_date	= :ldtm_compdue,
								compound_paytype	= :li_compaytype,
								compound_payment	= :ldc_comppayment,
								compound_paystatus	= :li_compstatus
					where	( loancontract_no	= :ls_contno )
					using		itr_sqlca ;
					
				case "CMI"
					update	lncontmaster
					set			compound_status	= 11,
								compound_date	= :ldtm_compdate,
								compound_period	= :li_compperiod,
								compounddue_date			= :ldtm_compdue,
								compound_intarrpayment	= :ldc_comppayment
					where	( loancontract_no	= :ls_contno )
					using		itr_sqlca ;
					
			end choose
			
			ls_errtext	= "ไม่สามารถปรับปรุงข้อมูลการขอผ่อนผันในสัญญาเงินกู้ได้ เลขที่สัญญา "+ls_contno
	end choose
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= ls_errtext+"~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

next

commit using itr_sqlca ;

// Export ข้อมูลอีกครั้ง
astr_compound.xml_comphead		= inv_dwxmliesrv.of_xmlexport( lds_head )

// รายการที่ตัวหลัก
lds_detail.setfilter( "reqcomptype_code in ('GRP', 'ALL')" )
lds_detail.filter()
astr_compound.xml_compmemb	= inv_dwxmliesrv.of_xmlexport( lds_detail )

// รายการหุ้น
lds_detail.setfilter( "reqcomptype_code = 'SHR'" )
lds_detail.filter()
astr_compound.xml_compshare	= inv_dwxmliesrv.of_xmlexport( lds_detail )

// รายการหนี้
lds_detail.setfilter( "reqcomptype_code = 'LON'" )
lds_detail.filter()
astr_compound.xml_comploan		= inv_dwxmliesrv.of_xmlexport( lds_detail )

return 1
end function

public function integer of_initreq_lnpause (ref str_lnpause astr_lnpause) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายการเงินกู้ที่จะทำการงดกู้เงินหรือให้กู้เงินต่อของสมาชิกที่ส่งทะเบียนเข้ามา (ได้ค่า XML กลับไป)
</description>

<arguments>  
	str_lnpause{ref}		Structure รายการงดกู้เงินบางประเภทหรือให้กู้เงินต่อ
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no		String			ทะเบียนสมาชิก
		- loanpause_date	datetime		วันที่ทำรายการ
</arguments>

<return> 
	Integer
	1			ถ้าไม่มีข้อผิดพลาด
</return> 
***********************************************************/
string		ls_memno, ls_loantype, ls_desc, ls_prefix, ls_pausecode,ls_pauseloan_cause
long		ll_index, ll_count, ll_row, ll_find, ll_cntpause
datetime	ldtm_pause
int			int_lawerflag  
n_ds		lds_master, lds_detail

ls_memno		= astr_lnpause.member_no
ldtm_pause		= astr_lnpause.loanpause_date
int li_lawerflag
string ls_check
ll_count		= ids_infomemdet.retrieve( is_coopcontrol, ls_memno)
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลทะเบียนสมาชิกที่ส่งเข้ามา ทะเบียนเลขที่ " + ls_memno + "' กรุณาตรวจสอบ"
	throw ithw_exception
end if
//li_lawerflag = lds_master.GetItemNumber(1,"lawer_flag")
select max(lawer_flag) , max(pauseloan_docno)  
into  :li_lawerflag ,:ls_check
from lnmembpauseloan 
where member_no=:ls_memno 
//and pauseloan_cause is not null and trim(pauseloan_cause) <>'' 
and ( coop_id		= :is_coopcontrol )
using		itr_sqlca ;
//if IsNull(li_lawerflag) then li_lawerflag = 0
if IsNull(ls_check) then ls_check = ""

if li_lawerflag = 1 and ls_check <> "" then
	ithw_exception.text	= " ทะเบียนเลขที่ " + ls_memno + "' ห้ามกู้จากนิติกร กรุณาตรวจสอบ"
	throw ithw_exception
end if
	
lds_master	= create n_ds
lds_master.dataobject	= "d_loansrv_req_loanpause"

lds_detail	= create n_ds
lds_detail.dataobject		= "d_loansrv_req_loanpausedet"

lds_master.insertrow( 0 )

lds_master.setitem( 1, "memcoop_id", is_coopcontrol )
lds_master.setitem( 1, "member_no", ls_memno )
lds_master.setitem( 1, "pauseloan_date", ldtm_pause )

lds_master.object.prename_desc[ 1 ]			= ids_infomemdet.object.prename_desc[ 1 ]
lds_master.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ 1 ]
lds_master.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ 1 ]
lds_master.object.membgroup_code[ 1 ]	= ids_infomemdet.object.membgroup_code[ 1 ]
lds_master.object.membgroup_desc[ 1 ]		= ids_infomemdet.object.membgroup_desc[ 1 ]


// ดึงข้อมูลเงินกู้ที่มีทั้งหมด
ls_pausecode	= "NML"

declare loanlist_cur cursor for
select		loantype_code, loantype_desc, prefix
from		lnloantype
where	( coop_id		= :is_coopcontrol )
order by	loantype_code
using		itr_sqlca ;

open loanlist_cur ;
fetch loanlist_cur into :ls_loantype, :ls_desc, :ls_prefix ;
do while itr_sqlca.sqlcode = 0
	ll_row		= lds_detail.insertrow( 0 )
	
	lds_detail.setitem( ll_row, "loantype_code", ls_loantype )
	lds_detail.setitem( ll_row, "loantype_desc", ls_desc )
	lds_detail.setitem( ll_row, "prefix", ls_prefix )
	lds_detail.setitem( ll_row, "operate_old", ls_pausecode )
	lds_detail.setitem( ll_row, "operate_code", ls_pausecode )
	
	fetch loanlist_cur into :ls_loantype, :ls_desc, :ls_prefix ;
loop
close loanlist_cur ;

// ดึงข้อมูลเงินกู้ที่ถูกงดกู้
ls_pausecode	= "PUS"
declare pauselist_cur cursor for
select		loantype_code,pauseloan_cause
from		lnmembpauseloan
where	( coop_id			= :is_coopcontrol )
and		( member_no	= :ls_memno )
using		itr_sqlca ;

open pauselist_cur ;
fetch pauselist_cur into :ls_loantype ,:ls_pauseloan_cause;
do while itr_sqlca.sqlcode = 0
	ll_find			= lds_detail.find( "loantype_code = '"+ls_loantype+"'", 1, lds_detail.rowcount() )
	if ll_find > 0 then
		lds_detail.setitem( ll_find, "operate_old", ls_pausecode )
		lds_detail.setitem( ll_find, "operate_code", ls_pausecode )
	end if
	
	fetch pauselist_cur into :ls_loantype ,:ls_pauseloan_cause ;
loop
close pauselist_cur ;
lds_master.SetItem(1,"pauseloan_cause",ls_pauseloan_cause)
astr_lnpause.xml_pause		= inv_dwxmliesrv.of_xmlexport( lds_master )
astr_lnpause.xml_pausedet	= inv_dwxmliesrv.of_xmlexport( lds_detail )

destroy lds_master ;
destroy lds_detail ;

return 1
end function

public function integer of_initreq_mthpayrcv (ref str_mthpayrcv astr_mthpayrcv) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายการเงินรับเงินจ่ายรายเดือนนอกเหนือจากรายการหักของสหกรณ์
	ของสมาชิกที่ส่งทะเบียนเข้ามา (ได้ค่า XML กลับไป)
</description>

<arguments>  
	str_mthpayrcv{ref}	Structure รายการเงินรับเงินหักอื่นๆ รายเดือน
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no		String			ทะเบียนสมาชิก
</arguments>

<return> 
	Integer
	1			ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะส่งรายละเอียด
	รายการเงินหักเงินรับประจำเดือนนอกเหนือจากการหักของสหกรณ์
	ทั้งหมดกลับไปในรูปแบบ XML
	
	str_mthpayrcv	lstr_mthpayrcv
	
	lstr_mthpayrcv.member_no		= dw_infomem.getitemstring( 1, "member_no" )
	
	lnv_lnoperate.of_initreq_mthpayrcv( lstr_mthpayrcv )
	
	dw_infomem.reset()
	dw_infomem.importstring( XML!, lstr_mthpayrcv.xml_infomem )
	
	dw_plus.reset()
	dw_plus.importstring( XML!, lstr_mthpayrcv.xml_mthrcv )
	
	dw_minus.reset()
	dw_minus.importstring( XML!, lstr_mthpayrcv.xml_mthpay )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno
long		ll_count
n_ds		lds_data

ls_memno		= astr_mthpayrcv.member_no

astr_mthpayrcv.xml_infomem	= ""
astr_mthpayrcv.xml_mthpay		= ""
astr_mthpayrcv.xml_mthrcv		= ""

ll_count		= ids_infomemdet.retrieve( ls_memno )
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลทะเบียนสมาชิกที่ส่งเข้ามา ทะเบียนเลขที่ " + ls_memno + "' กรุณาตรวจสอบ"
	throw ithw_exception
end if

astr_mthpayrcv.xml_infomem	= inv_dwxmliesrv.of_xmlexport( ids_infomemdet )

// รายการฝั่งจ่ายอื่นๆประจำเดือน
lds_data		= create n_ds
lds_data.dataobject	= "d_loansrv_req_mthpyrc_minus"
lds_data.settransobject( itr_sqlca )
lds_data.retrieve( ls_memno )

astr_mthpayrcv.xml_mthpay		= inv_dwxmliesrv.of_xmlexport( lds_data )

// รายการฝั่งรับอื่นๆประจำเดือน
lds_data.dataobject	= "d_loansrv_req_mthpyrc_plus"
lds_data.settransobject( itr_sqlca )
lds_data.retrieve( ls_memno )

astr_mthpayrcv.xml_mthrcv		= inv_dwxmliesrv.of_xmlexport( lds_data )

return 1
end function

public function integer of_savereq_mthpayrcv (ref str_mthpayrcv astr_mthpayrcv) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกข้อมูลรายรับ-รายจ่ายนอกเหนือรายการหักของสหกรณ์ เพื่อใช้ประกอบการขอกู้เงิน
	เวลาที่ต้องตรวจเงินเดือนคงเหลือ
</description>

<arguments>  
	str_mthpayrcv		Structure รายการรายรับ-รายจ่ายนอกเหนือรายการหักประจำเดือน
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_infomem		String			XML รายละเอียดสมาชิก
		- xml_mthpay		String			XML รายการหักอื่นๆ ที่หักจากเงินเดือน(ไม่ใช่รายการหักสหกรณ์)
		- xml_mthrcv		String			XML รายการรับอืนๆ นอกจากเงินเดือน
		- entry_id			string			ผู้ทำรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะทำการบันทึกรายรับ-รายจ่ายไว้เป็นข้อมูลสำหรับตรวจสอบ
	เงินเดือนคงเหลือ ณ ตอนขอกู้
	
	str_mthpayrcv		lstr_mthpayrcv
	
	lstr_mthpayrcv.xml_infomem	= dw_infomem.describe( "Datawindow.Data.XML" )
	lstr_mthpayrcv.xml_mthpay		= dw_minus.describe( "Datawindow.Data.XML" )
	lstr_mthpayrcv.xml_mthrcv		= dw_plus.describe( "Datawindow.Data.XML" )
	lstr_mthpayrcv.entry_id			= entry_id
	
	lnv_lnoperate.of_savereq_mthpayrcv( lstr_mthpayrcv )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 11/10/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_temp
long		ll_index, ll_count, ll_seqno
integer	li_signflag, li_signprior
n_ds		lds_data

ls_memno	= astr_mthpayrcv.member_no

select		member_no
into		:ls_temp
from		mbmembmaster
where	( member_no	= :ls_memno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่พบข้อมูลทะเบียนสมาชิกที่ส่งเข้ามา ทะเบียนเลขที่ " + ls_memno + "' กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ลบรายการทั้งหมดทิ้งก่อน
delete from mbmembmthexpense
where	( member_no	= :ls_memno )
using		( itr_sqlca ) ;

// รายการรับจ่ายอื่นๆประจำเดือน
lds_data		= create n_ds
lds_data.dataobject	= "d_loansrv_req_mthpyrc_minus"
lds_data.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( lds_data, astr_mthpayrcv.xml_mthpay )
inv_dwxmliesrv.of_xmlimport( lds_data, astr_mthpayrcv.xml_mthrcv )

ll_count		= lds_data.rowcount()
if ll_count <= 0 then
	commit using itr_sqlca ;
	
	return 1
end if

// เรียงข้อมูลตามรายการรับ-จ่าย
lds_data.setsort( "sign_flag A" )
lds_data.sort()

// ใส่ลำดับที่ใน detail
for ll_index = 1 to ll_count
	li_signflag		= lds_data.getitemnumber( ll_index, "sign_flag" )
	
	if li_signflag <> li_signprior then
		ll_seqno		= 0
		li_signprior	= li_signflag
	end if
	
	ll_seqno ++
	
	lds_data.setitem( ll_index, "member_no", ls_memno )
	lds_data.setitem( ll_index, "seq_no", ll_seqno )
next

// บันทึก DW การรับจ่าย
if lds_data.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลรายรับ-รายจ่าย ประจำเดือนนอกรายการหัก ไม่ได้  "
	ithw_exception.text	+= ls_memno +"  "+ lds_data.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

private function datetime of_getpaytabkeepdate (datetime adtm_refdate, integer ai_daytype, integer ai_daynum);// -----------------------------------------------------
// สำคัญ ***
// ต้องมีการเรียก Datetime Service มาจากภายนอกเสมอ
// -----------------------------------------------------

integer		li_month, li_year, li_dayweek
datetime	ldtm_nextkeep
date		ld_tempdate, ld_nextkeep

ld_nextkeep	= date( adtm_refdate )

li_month		= month( ld_nextkeep )
li_year		= year( ld_nextkeep )

choose case ai_daytype
	case 0	// ทุกสิ้นเดือน
		ldtm_nextkeep		= datetime( inv_datetimesrv.of_lastdayofmonth( date( li_year, li_month, 1 ) ) )
		
	case 1	// ทุกสิ้นเดือนตรงเสาร์-อาทิตย์เลื่อนขึ้น
		ld_tempdate			= inv_datetimesrv.of_lastdayofmonth( date( li_year, li_month, 1 ) )
		li_dayweek			= daynumber( date( ld_tempdate ) )
		
		choose case  li_dayweek
			case 1
				ld_tempdate	= relativedate( ld_tempdate, -2 )
			case 7
				ld_tempdate	= relativedate( ld_tempdate, -1 )
		end choose
			
		ldtm_nextkeep		= datetime( ld_tempdate )
		
	case 2	// ตามวันที่ระบุ
		if inv_datetimesrv.of_isdate( li_year, li_month, ai_daynum ) then
			ldtm_nextkeep		= datetime( date( li_year, li_month, ai_daynum ) )
		else
			ldtm_nextkeep		= datetime( inv_datetimesrv.of_lastdayofmonth( date( li_year, li_month, 1 ) ) )
		end if
		
	case 3	// ตามวันที่ระบุตรงเสาร์-อาทิตย์เลื่อนขึ้น
		if inv_datetimesrv.of_isdate( li_year, li_month, ai_daynum ) then
			ld_tempdate	= date( li_year, li_month, ai_daynum )
			
			li_dayweek		= daynumber( ld_tempdate )
			choose case  li_dayweek
				case 1
					ld_tempdate	= relativedate( ld_tempdate, -2 )
				case 7
					ld_tempdate	= relativedate( ld_tempdate, -1 )
			end choose
			
			ldtm_nextkeep		= datetime( ld_tempdate )
		end if
		
	case 4	// ตามวันที่ระบุตรงเสาร์-อาทิตย์เลื่อนไป
		if inv_datetimesrv.of_isdate( li_year, li_month, ai_daynum ) then
			ld_tempdate	= date( li_year, li_month, ai_daynum )
			
			li_dayweek		= daynumber( ld_tempdate )
			choose case  li_dayweek
				case 1
					ld_tempdate	= relativedate( ld_tempdate, 1 )
				case 7
					ld_tempdate	= relativedate( ld_tempdate, 2 )
			end choose
			
			ldtm_nextkeep		= datetime( ld_tempdate )
		end if
		
	case 5	// ศุกร์สุดท้ายของเดือน
		
		ld_tempdate	= inv_datetimesrv.of_lastdayofmonth( date( li_year, li_month, 1 ) )
		li_dayweek		= daynumber( ld_tempdate )
		choose case  li_dayweek
			case 1 to 5
				ld_tempdate	= relativedate( ld_tempdate, - ( li_dayweek + 1 ) )
			case 7
				ld_tempdate	= relativedate( ld_tempdate, -1 )
		end choose
		ldtm_nextkeep		= datetime( ld_tempdate )
end choose

return ldtm_nextkeep
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

public function integer of_initlncontpaytable (ref str_paytab astr_paytab) throws Exception;dec		ldc_principal, ldc_interest, ldc_intrate, ldc_payamt, ldc_prinpay, ldc_intmonth
dec{2}	ldc_sumprn, ldc_sumint
integer	li_row, li_paytype, li_installment
integer	li_day, li_month, li_year, li_period, li_tabtype, li_daytype, li_daynum, li_dayweek
integer	li_daymth, li_startyear, li_startmonth
string		ls_recvperiod, ls_tempstrdate
datetime	ldtm_nextkeep, ldtm_startcont, ldtm_lastkeep, ldtm_endmthfirst
date		ld_tempdate
n_ds		lds_criteria, lds_paytable

lds_criteria		= create n_ds
lds_paytable		= create n_ds

lds_criteria	= create n_ds
lds_criteria.dataobject	= "d_loansrv_lnpaytab_paycritiria"
inv_dwxmliesrv.of_xmlimport( lds_criteria, astr_paytab.xml_criteria )

lds_paytable	= create n_ds
lds_paytable.dataobject	= "d_loansrv_lnpaytab_paytable"

li_tabtype			= lds_criteria.getitemnumber( 1, "paytab_type")
li_paytype			= lds_criteria.getitemnumber( 1, "payment_type")
li_installment		= lds_criteria.getitemnumber( 1, "installment")
ldc_principal			= lds_criteria.getitemdecimal( 1, "principal_amt")
ldc_payamt			= lds_criteria.getitemdecimal( 1, "period_amt")
ldc_intrate			= lds_criteria.getitemdecimal( 1, "intrate_amt")
li_daytype			= lds_criteria.getitemnumber( 1, "payeveryday_type" )
li_daynum			= lds_criteria.getitemnumber( 1, "payeveryday_daynum" )
ls_recvperiod		= lds_criteria.getitemstring( 1, "firstpay_period")
ldtm_startcont		= lds_criteria.getitemdatetime( 1, "startcont_date" )

// วันที่ชำระครั้งแรก
//if len( trim( ls_recvperiod ) ) <> 6 or isnull( ls_recvperiod ) then
//	ithw_exception.text	= "กรุณาใส่งวดชำระงวดแรกด้วย รูปแบบ ( ดด/ปปปป )"
//	throw ithw_exception
//end if
// a edit 25092555
ldc_sumprn			= 0
ldc_sumint			= 0

li_period				= 0
li_month				= integer( left( ls_recvperiod, 2 ) )
li_year				= integer( right( ls_recvperiod, 4 ) ) - 543

ldtm_nextkeep		= datetime( date( li_year, li_month, 1 ) )

// วันที่เริ่มต้นที่จะคำนวณ
if li_tabtype = 1 then
	ldtm_lastkeep	= ldtm_startcont
else
	if string( ldtm_startcont, "yyyy-dd-mm" ) = "1900-01-01" or isnull( ldtm_startcont ) then
		if li_month = 1 then
			li_startyear		= li_year - 1
			li_startmonth	= 12
		else
			li_startyear		= li_year
			li_startmonth	= li_month - 1
		end if
		
		ldtm_lastkeep	= datetime( date( li_startyear, li_startmonth, 1 ) )
		ldtm_lastkeep	= this.of_getpaytabkeepdate( ldtm_lastkeep, li_daytype, li_daynum )
	else
		ldtm_lastkeep	= ldtm_startcont
	end if
end if

// ประกาศ Service ที่ใช้ประกอบการทำงาน
this.of_setsrvlninterest( true )
this.of_setsrvdatetime( true )

do while ldc_principal > 0
	li_period ++
	
	if li_period > li_installment then
		li_row	= li_installment
		
		ldc_prinpay	= lds_paytable.getitemdecimal( li_row, "prinpay_amt" )
		ldc_prinpay	= ldc_prinpay + ldc_principal
		
		lds_paytable.setitem( li_row, "prinpay_amt", ldc_prinpay )
		lds_paytable.setitem( li_row, "balance_amt", 0 )
		exit
	else
		li_row ++
		lds_paytable.object.seq_no[ li_row ]	= li_row
	end if
	
	// วันที่เริ่มชำระ
	ldtm_nextkeep	= this.of_getpaytabkeepdate( ldtm_nextkeep, li_daytype, li_daynum )
	li_day				= daysafter( date( ldtm_lastkeep ), date( ldtm_nextkeep ) )
	li_year			= year( date( ldtm_nextkeep ) )
	
	// คำนวนดอกเบี้ย
	if  mod( li_year, 4 ) = 0 then
		li_year = 366
	else
		li_year = 365
	end if

	// ดอกเบี้ยทั้งหมด
	ldc_interest	= ( ( ldc_principal * ldc_intrate ) / li_year ) * li_day
	
	ldc_interest		= inv_intsrv.of_roundmoney( ldc_interest )
	
	if li_paytype = 1 then
		ldc_prinpay	= ldc_payamt
	else
		// ถ้าเป็นงวดแรก
		if li_period = 1 then
			ldtm_endmthfirst	= this.of_getpaytabkeepdate( ldtm_lastkeep, li_daytype, li_daynum )
			
			if ldtm_endmthfirst < ldtm_nextkeep then
				li_daymth		= daysafter( date( ldtm_endmthfirst ), date( ldtm_nextkeep ) )
				ldc_intmonth	= ( ( ldc_principal * ldc_intrate ) / li_year ) * li_daymth
				ldc_prinpay		= ldc_payamt - ldc_intmonth
			else
				ldc_prinpay		= ldc_payamt - ldc_interest
			end if
		else
			ldc_prinpay		= ldc_payamt - ldc_interest
		end if
	end if
	
	if ldc_principal < ldc_prinpay then ldc_prinpay = ldc_principal
	
	ldc_principal	= ldc_principal - ldc_prinpay

	lds_paytable.object.prinpay_amt[ li_row ]	= ldc_prinpay
	lds_paytable.object.intpay_amt[ li_row ]		= ldc_interest
	lds_paytable.object.balance_amt[ li_row ]	= ldc_principal
	lds_paytable.object.interest_date[ li_row ]	= string( li_day )

	lds_paytable.setitem( li_row, "payment_date", ldtm_nextkeep )

	ldc_sumprn		+= ldc_prinpay
	ldc_sumint		+= ldc_interest
	
	ldtm_lastkeep	= ldtm_nextkeep
	ldtm_nextkeep	= datetime( inv_datetimesrv.of_relativemonth( date( ldtm_nextkeep ), 1 ) )
loop

lds_criteria.setitem( 1, "paysum_prnamt", ldc_sumprn )
lds_criteria.setitem( 1, "paysum_intamt", ldc_sumint )

// เลิกใช้ Service ประกอบ
this.of_setsrvlninterest( false )
this.of_setsrvdatetime( false )

astr_paytab.xml_paytab	= inv_dwxmliesrv.of_xmlexport( lds_paytable )

return 1
end function

public function integer of_initlncontpaycriteria (ref str_paytab astr_paytab) throws Exception;string		ls_contno, ls_memno, ls_loantype, ls_inttable, ls_memname, ls_fstperiod,ls_coopid
integer	li_paytabtype, li_prnbalfrom, li_paytype, li_installment, li_lastperiod, li_inttype
integer	li_year, li_month
long			l
dec{2}	ldc_apvamt, ldc_prnbal, ldc_periodpay, ldc_prnamt
dec{4}	ldc_intrate
datetime	ldtm_lastcalint, ldtm_startcont, ldtm_startkeep, ldtm_today
n_ds		lds_criteria

ls_contno		= astr_paytab.loancontract_no
li_paytabtype	= astr_paytab.paytab_type
li_prnbalfrom	= astr_paytab.prnbalfrom_type
ls_coopid         = astr_paytab.coop_id
astr_paytab.xml_criteria	= ""

ldtm_today		= datetime( today(), now() )

lds_criteria	= create n_ds
lds_criteria.dataobject	= "d_loansrv_lnpaytab_paycritiria"

choose case li_paytabtype
	case 1
		ids_infocont.retrieve(ls_coopid, ls_contno )
		
		if ids_infocont.rowcount() <= 0 then
			ithw_exception.text	= "ไม่พบเลขที่สัญญา '"+ls_contno+"' กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		ls_memno		= ids_infocont.getitemstring( 1, "member_no" )
		ls_loantype		= ids_infocont.getitemstring( 1, "loantype_code" )
		ldc_apvamt		= ids_infocont.getitemdecimal( 1, "loanapprove_amt" )
		ldc_prnbal		= ids_infocont.getitemdecimal( 1, "principal_balance" )
		li_paytype		= ids_infocont.getitemnumber( 1, "loanpayment_type" )
		li_installment	= ids_infocont.getitemnumber( 1, "period_payamt" )
		li_lastperiod		= ids_infocont.getitemnumber( 1, "last_periodpay" )
		ldc_periodpay	= ids_infocont.getitemdecimal( 1, "period_payment" )
		ldtm_lastcalint	= ids_infocont.getitemdatetime( 1, "lastcalint_date" )
		ldtm_startcont	= ids_infocont.getitemdatetime( 1, "startcont_date" )
		ldtm_startkeep	= ids_infocont.getitemdatetime( 1, "startkeep_date" )

		if isnull( ldtm_startkeep ) or string( ldtm_startkeep, "yyyymmdd" ) = "19000101" then
			ldtm_startkeep	= ldtm_startcont
		end if
		
		li_inttype			= ids_infocont.getitemnumber( 1, "int_continttype" )
		ldc_intrate		= ids_infocont.getitemdecimal( 1, "int_contintrate" )
		ls_inttable		= ids_infocont.getitemstring( 1, "int_continttabcode" )
		
	case 2
		select		member_no, loantype_code, loanrequest_amt, loanpayment_type, period_payamt,
					period_payment, loanrcvfix_date, startkeep_date,
					int_continttype, int_contintrate, int_continttabcode
		into		:ls_memno, :ls_loantype, :ldc_apvamt, :li_paytype, :li_installment,
					:ldc_periodpay, :ldtm_startcont, :ldtm_startkeep,
					:li_inttype, :ldc_intrate, :ls_inttable
		from		lnreqloan
		where	( loanrequest_docno	= :ls_contno )  and coop_id =:ls_coopid
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่พบเลขที่คำขอกู้เงิน '"+ls_contno+"' กรุณาตรวจสอบ"
			throw ithw_exception
		end if

		ldc_prnbal		= ldc_apvamt
		ldtm_lastcalint	= ldtm_startcont
		li_lastperiod		= 0
		
	case else
		return 0
end choose

// แยกเงื่อนไขการดูยอดเงินกู้จากยอดอนุมัติหรือคงเหลือ
choose case li_prnbalfrom
	case 1
		// อัตรา ด/บ
		if li_inttype > 1 then
			this.of_setsrvlninterest( true )
			ldc_intrate	= 0.055 //inv_intsrv.of_getloanintrate( ls_inttable,ls_coopid, ldtm_startcont, ldc_apvamt )
			this.of_setsrvlninterest( false )
		end if
		
		// ชำระครั้งแรก
		li_year		= year( date( ldtm_startkeep ) ) + 543
		li_month		= month( date( ldtm_startkeep ) )
		
		ldc_prnamt		= ldc_apvamt
	case 2
		// อัตรา ด/บ
		if li_inttype > 1 then
			this.of_setsrvlninterest( true )
			ldc_intrate	=0.055// inv_intsrv.of_getloanintrate( ls_inttable,ls_coopid,ldtm_lastcalint, ldc_prnbal )
			this.of_setsrvlninterest( false )
		end if
		
		// ชำระครั้งแรก
		li_year		= year( date( ldtm_today ) ) + 543
		li_month		= month( date( ldtm_today ) )
		
		ldc_prnamt		= ldc_prnbal
		li_installment	= li_installment - li_lastperiod
		ldtm_startcont	= ldtm_lastcalint
end choose

// หาชือสมาชิก
select		mbucfprename.prename_desc||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname  
into		:ls_memname
from		mbmembmaster, mbucfprename  
where	( mbmembmaster.prename_code	= mbucfprename.prename_code )  and
			( mbmembmaster.member_no		= :ls_memno )
using		( itr_sqlca ) ;

ls_fstperiod		= string( li_month, "00" )+string( li_year )

lds_criteria.insertrow( 0 )

lds_criteria.setitem( 1, "loancontract_no", ls_contno )
lds_criteria.setitem( 1, "paytab_type", li_paytabtype )
lds_criteria.setitem( 1, "prnbalfrom_type", li_prnbalfrom )
lds_criteria.setitem( 1, "member_no", ls_memno )

lds_criteria.setitem( 1, "payment_type", li_paytype )
lds_criteria.setitem( 1, "installment", li_installment )
lds_criteria.setitem( 1, "principal_amt", ldc_prnamt )
lds_criteria.setitem( 1, "period_amt", ldc_periodpay )
lds_criteria.setitem( 1, "intrate_amt", ldc_intrate )
lds_criteria.setitem( 1, "member_no", ls_memno )
lds_criteria.setitem( 1, "startcont_date", ldtm_startcont )
lds_criteria.setitem( 1, "member_name", ls_memname )
lds_criteria.setitem( 1, "firstpay_period", ls_fstperiod )

astr_paytab.xml_criteria		= inv_dwxmliesrv.of_xmlexport( lds_criteria )

return 1
end function

public function integer of_savereq_lnpause (ref str_lnpause lstr_lnpause) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกและทำรายการห้ามกู้เงินบางประเภท
</description>

<arguments>  
	str_lnpause		Structure รายการ ห้ามกู้เงินบางประเภท
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_pause			String			XML เหตุผลที่งดกู้เงินหรือให้กู้เงินต่อ
		- xml_pausedet		String			XML รายการเงินกู้ที่ทำการงดหรือให้กู้ต่อ
		- entry_id			string			ผู้ทำรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 
***********************************************************/
string		ls_pausedocno, ls_memno, ls_loantype, ls_opecode, ls_cause, ls_entryid,ls_pauseloan_cause
long		ll_index, ll_count
boolean	lb_error = false
datetime	ldtm_pausedate, ldtm_entrydate
n_ds		lds_master, lds_detail
int int_lawerflag
int_lawerflag = 0  //สำหรับสินเชื่อ
ls_entryid			= lstr_lnpause.entry_id
ldtm_entrydate		= datetime( today(), now() )

lds_master	= create n_ds
lds_master.dataobject	= "d_loansrv_req_loanpause"
lds_master.settransobject( itr_sqlca )

lds_detail	= create n_ds
lds_detail.dataobject		= "d_loansrv_req_loanpausedet"
lds_detail.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( lds_master, lstr_lnpause.xml_pause )
inv_dwxmliesrv.of_xmlimport( lds_detail, lstr_lnpause.xml_pausedet )

// ลบพวกไม่มีการทำรายการออก
lds_detail.setfilter( "operate_code <> operate_old" )
lds_detail.filter()

if lds_detail.filteredcount() > 0 then
	lds_detail.rowsdiscard( 1, lds_detail.filteredcount(), filter! )
end if

// ตรวจว่ามีการทำรายการหรือเปล่า
ll_count	= lds_detail.rowcount()
if ll_count <= 0  then
	if lds_master.rowcount() > 0 then
		goto uplnpausecause
	end if
	ithw_exception.text	= "ไม่พบว่ามีการทำรายการห้ามกู้หรือให้กู้ต่อ กรุณาตรวจสอบ"
	lb_error					= true
	goto objdestroy
end if

// ขอเลขที่เอกสาร
this.of_setsrvdoccontrol( true )
ls_pausedocno	= inv_docsrv.of_getnewdocno( is_coopcontrol, "LNPAUSELOAN" )
this.of_setsrvdoccontrol( false )

// ให้ค่าเลขที่เอกสาร
lds_master.setitem( 1, "coop_id", is_coopcontrol )
lds_master.setitem( 1, "pauseloan_docno", ls_pausedocno )
lds_master.setitem( 1, "entry_id", ls_entryid )
lds_master.setitem( 1, "entry_date", ldtm_entrydate )
lds_master.setitem( 1, "entry_bycoopid", is_coopid )
//lds_master.SetItem(1,"pauseloan_cause",ls_pauseloan_cause)
// ใส่เลขที่เอกสารและลำดับที่ใน detail
for ll_index = 1 to ll_count
	lds_detail.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_detail.setitem( ll_index, "pauseloan_docno", ls_pausedocno )
next

// -----------------------
// เริ่มกระบวนการบันทึก
// -----------------------
// บันทึก Master
if lds_master.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลการห้ามกู้ (PauseLoan Master) ไม่ได้  "
	ithw_exception.text	+= ls_pausedocno +"  "+ lds_master.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// บันทึก Detail
if lds_detail.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล รายการห้ามกู้หรือให้กู้ต่อ (PauseLoan Detail) ไม่ได้  "
	ithw_exception.text	+= ls_pausedocno +"  "+ lds_detail.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

ls_memno			= lds_master.getitemstring( 1, "member_no" )
ls_cause				= lds_master.getitemstring( 1, "pauseloan_cause" )
ldtm_pausedate	= lds_master.getitemdatetime( 1, "pauseloan_date" )

// ปรับปรุงข้อมูลการห้ามกู้
for ll_index = 1 to ll_count
	ls_opecode		= lds_detail.getitemstring( ll_index, "operate_code" )
	ls_loantype		= lds_detail.getitemstring( ll_index, "loantype_code" )
	
	if ls_opecode = "NML" then
		delete from lnmembpauseloan
		where	( coop_id				= :is_coopcontrol )
		and		( member_no		= :ls_memno )
		and		( loantype_code	= :ls_loantype )
		using		itr_sqlca ;
		
		UPDATE mbmembmaster
		SET remark = :ls_cause
		where	( member_no		= :ls_memno )
		//and		( lawer_flag	= :int_lawerflag )
		using		itr_sqlca ;
		
	else
		insert into lnmembpauseloan
					( coop_id, member_no, loantype_code, pauseloan_docno, pauseloan_date, pauseloan_cause, entry_id, entry_bycoopid,lawer_flag )
		values	( :is_coopcontrol, :ls_memno, :ls_loantype, :ls_pausedocno, :ldtm_pausedate, :ls_cause, :ls_entryid, :is_coopid, :int_lawerflag )
		using		itr_sqlca ;
		
		UPDATE mbmembmaster
		SET remark = :ls_cause
		where	( member_no		= :ls_memno )
		//and		( lawer_flag	= :int_lawerflag )
		using		itr_sqlca ;
	end if
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ผิดพลาด!!! ไม่สามารถปรับปรุงการห้ามกู้หรือให้กู้ต่อได้ รหัสประเภทเงินกู้ "+ls_loantype+"~n~r"+itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
next


objdestroy:
destroy lds_master
destroy lds_detail

uplnpausecause:
ls_memno			= lds_master.getitemstring( 1, "member_no" )
ls_cause				= lds_master.getitemstring( 1, "pauseloan_cause" )
ldtm_pausedate	= lds_master.getitemdatetime( 1, "pauseloan_date" )
//for ll_index = 1 to ll_count	
	//ls_loantype		= lds_detail.getitemstring( ll_index, "loantype_code" )
	UPDATE lnmembpauseloan
	SET pauseloan_cause = :ls_cause
	where		( member_no		= :ls_memno )
	and		( lawer_flag	= :int_lawerflag )
		//and		( loantype_code	= :ls_loantype )
		using		itr_sqlca ;	
//next
	UPDATE lnreqpauseloan
	SET pauseloan_cause = :ls_cause
	where	( member_no		= :ls_memno )
	and		( lawer_flag	= :int_lawerflag )
		using		itr_sqlca ;
	
	UPDATE mbmembmaster
	SET remark = :ls_cause
	where	( member_no		= :ls_memno )
	//and		( lawer_flag	= :int_lawerflag )
		using		itr_sqlca ;
		
	
	
if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function integer of_initlncontpaytabcat (ref str_paytab astr_paytab) throws Exception;dec		ldc_principal, ldc_interest, ldc_intrate, ldc_payamt, ldc_prinpay, ldc_intmonth, ldc_intall
dec{2}	ldc_sumprn, ldc_sumint
integer	li_row, li_paytype, li_installment
integer	li_day, li_month, li_year, li_period, li_tabtype, li_daytype, li_daynum, li_dayweek
integer	li_daymth, li_startyear, li_startmonth
string		ls_recvperiod, ls_tempstrdate, ls_dayrange
datetime	ldtm_nextkeep, ldtm_startcont, ldtm_lastkeep, ldtm_endmthfirst
date		ld_tempdate
n_ds		lds_criteria, lds_paytable

lds_criteria		= create n_ds
lds_paytable		= create n_ds

lds_criteria	= create n_ds
lds_criteria.dataobject	= "d_loansrv_lnpaytab_paycritiria"
inv_dwxmliesrv.of_xmlimport( lds_criteria, astr_paytab.xml_criteria )

lds_paytable	= create n_ds
lds_paytable.dataobject	= "d_loansrv_lnpaytab_paytable"

li_tabtype			= lds_criteria.getitemnumber( 1, "paytab_type" )
li_paytype			= lds_criteria.getitemnumber( 1, "payment_type" )
li_installment		= lds_criteria.getitemnumber( 1, "installment" )
ldc_principal			= lds_criteria.getitemdecimal( 1, "principal_amt" )
ldc_payamt			= lds_criteria.getitemdecimal( 1, "period_amt" )
ldc_intrate			= lds_criteria.getitemdecimal( 1, "intrate_amt" )
li_daytype			= lds_criteria.getitemnumber( 1, "payeveryday_type" )
li_daynum			= lds_criteria.getitemnumber( 1, "payeveryday_daynum" )
ls_recvperiod		= lds_criteria.getitemstring( 1, "firstpay_period" )
ldtm_startcont		= lds_criteria.getitemdatetime( 1, "startcont_date" )

// วันที่ชำระครั้งแรก
if len( trim( ls_recvperiod ) ) <> 6 or isnull( ls_recvperiod ) then
	ithw_exception.text	= "กรุณาใส่งวดชำระงวดแรกด้วย รูปแบบ ( ดด/ปปปป )"
	throw ithw_exception
end if

ldc_sumprn			= 0
ldc_sumint			= 0

li_period				= 0
li_month				= integer( left( ls_recvperiod, 2 ) )
li_year				= integer( mid( ls_recvperiod, 3 ) ) - 543

ldtm_nextkeep		= datetime( date( li_year, li_month, 1 ) )

// วันที่เริ่มต้นที่จะคำนวณ
if li_tabtype = 1 then
	ldtm_lastkeep	= ldtm_startcont
else
	if string( ldtm_startcont, "yyyy-dd-mm" ) = "1900-01-01" or isnull( ldtm_startcont ) then
		if li_month = 1 then
			li_startyear		= li_year - 1
			li_startmonth	= 12
		else
			li_startyear		= li_year
			li_startmonth	= li_month - 1
		end if
		
		ldtm_lastkeep	= datetime( date( li_startyear, li_startmonth, 1 ) )
		ldtm_lastkeep	= this.of_getpaytabkeepdate( ldtm_lastkeep, li_daytype, li_daynum )
	else
		ldtm_lastkeep	= ldtm_startcont
	end if
end if

// ประกาศ Service ที่ใช้ประกอบการทำงาน
this.of_setsrvlninterest( true )
this.of_setsrvdatetime( true )

do while ldc_principal > 0
	li_period ++
	
	if li_period > li_installment then
		li_row	= li_installment
		
		ldc_prinpay	= lds_paytable.getitemdecimal( li_row, "prinpay_amt" )
		ldc_prinpay	= ldc_prinpay + ldc_principal
		
		lds_paytable.setitem( li_row, "prinpay_amt", ldc_prinpay )
		lds_paytable.setitem( li_row, "balance_amt", 0 )
		exit
	else
		li_row ++
		lds_paytable.object.seq_no[ li_row ]	= li_row
	end if
	
	// วันที่เริ่มชำระ
	ldtm_nextkeep	= this.of_getpaytabkeepdate( ldtm_nextkeep, li_daytype, li_daynum )
	li_day				= 0
	
	if li_period = 1 then
		ldtm_endmthfirst	= this.of_getpaytabkeepdate( ldtm_lastkeep, li_daytype, li_daynum )
		
		li_day		= daysafter( date( ldtm_lastkeep ), date( ldtm_endmthfirst ) ) + 1
		li_year	= year( date( ldtm_endmthfirst ) )
		
		// คำนวนดอกเบี้ย
		if mod( li_year, 4 ) = 0 then
			li_year = 366
		else
			li_year = 365
		end if
		
		// ถ้างวดแรกมันเกิน 1 เดือน ต้องคิด ด/บ
		if ldtm_endmthfirst < ldtm_nextkeep then
			ldc_interest		= ( ( ldc_principal * ldc_intrate ) / li_year ) * li_day
			ldc_intmonth	= ( ( ldc_principal * ldc_intrate ) / 12 )
			ls_dayrange		= string( li_day )+" ว"
			ls_dayrange		= string( li_day )+"ว+1ด"
		else
			ldc_interest		= 0
			ldc_intmonth	= ( ( ldc_principal * ldc_intrate ) / li_year ) * li_day
			ls_dayrange		= string( li_day )+"ว"
		end if
	else
		ldc_interest		= 0
		ldc_intmonth	= ( ( ldc_principal * ldc_intrate ) / 12 )
		
		// จำนวนวันดอกเบี้ย
		ls_dayrange	= "1ด"
		li_day			= daysafter( date( ldtm_lastkeep ), date( ldtm_nextkeep ) )
	end if
	
	// ดอกเบี้ยทั้งหมด
	ldc_intall		= ldc_interest + ldc_intmonth
	ldc_intall		= inv_intsrv.of_roundmoney( ldc_intall )
	
	if li_paytype = 1 then
		ldc_prinpay	= ldc_payamt
	else
		if ldc_interest > 0 then
			ldc_intmonth	= inv_intsrv.of_roundmoney( ldc_intmonth )
			ldc_prinpay		= ldc_payamt - ldc_intmonth
		else
			ldc_prinpay	= ldc_payamt - ldc_intall
		end if
	end if
	
	if ldc_principal < ldc_prinpay then ldc_prinpay = ldc_principal
	
	ldc_principal	= ldc_principal - ldc_prinpay

	lds_paytable.object.prinpay_amt[ li_row ]	= ldc_prinpay
	lds_paytable.object.intpay_amt[ li_row ]		= ldc_intall
	lds_paytable.object.balance_amt[ li_row ]	= ldc_principal
	lds_paytable.object.interest_date[ li_row ]	= ls_dayrange

	lds_paytable.setitem( li_row, "payment_date", ldtm_nextkeep )

	ldc_sumprn		+= ldc_prinpay
	ldc_sumint		+= ldc_intall
	
	ldtm_lastkeep	= ldtm_nextkeep
	ldtm_nextkeep	= datetime( inv_datetimesrv.of_relativemonth( date( ldtm_nextkeep ), 1 ) )
loop

lds_criteria.setitem( 1, "paysum_prnamt", ldc_sumprn )
lds_criteria.setitem( 1, "paysum_intamt", ldc_sumint )

// เลิกใช้ Service ประกอบ
this.of_setsrvlninterest( false )
this.of_setsrvdatetime( false )

astr_paytab.xml_paytab	= inv_dwxmliesrv.of_xmlexport( lds_paytable )

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

public function integer of_setcontstatusdesc (string as_contno) throws Exception;string		ls_statusdesc
integer	li_insurecollflag, li_paystatus, li_contlaw, li_trnstatus

ls_statusdesc	= ""

select		insurecoll_flag, payment_status, contlaw_status, transfer_status
into		:li_insurecollflag, :li_paystatus, :li_contlaw, :li_trnstatus
from		lncontmaster
where	( loancontract_no	= :as_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "Generate สถานะสัญญา - ไม่พบข้อมูลสัญญาที่ส่งเข้ามา เลขที่สัญญา "+as_contno+"  "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

if li_insurecollflag = 1 then
	ls_statusdesc	= ls_statusdesc + "I"
end if

if li_paystatus < 0 then
	ls_statusdesc	= ls_statusdesc + "S"
end if

if li_trnstatus = 1 then
	ls_statusdesc	= ls_statusdesc + "R"
end if

if li_contlaw = 3 then
	ls_statusdesc	= ls_statusdesc + "C"
elseif li_contlaw = 4 then
	ls_statusdesc	= ls_statusdesc + "J"
end if

update	lncontmaster
set			status_desc	= :ls_statusdesc
where	( loancontract_no	= :as_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "Generate สถานะสัญญา - ไม่สามารถปรับปรุงสถานะสัญญาได้ เลขที่สัญญา "+as_contno+"  "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

public function integer of_setpausekeepup (string as_memno, datetime adtm_opedate) throws Exception;integer	li_payshrstatus, li_cntlon, li_cntlonpay, li_pausekeep

// สถานะการหยุดออกเก็บ
select		pausekeep_flag
into		:li_pausekeep
from		mbmembmaster
where	( member_no	= :as_memno )
using		itr_sqlca ;

// สถานะการส่งหุ้น
select		payment_status
into		:li_payshrstatus
from		shsharemaster
where	( member_no	= :as_memno )
using	itr_sqlca ;

// สถานะการส่งหนี้
select		count( member_no ),
			sum( case when payment_status <> -1 then 1 else 0 end )
into		:li_cntlon, :li_cntlonpay
from		lncontmaster
where	( member_no	= :as_memno ) and
			( ( principal_balance > 0 ) or ( interest_arrear > 0 ) )
using	itr_sqlca ;

// ถ้าสถานะการหยุดออกเก็บ เป็นเก็บอยู่
if li_pausekeep = 0 then
	if li_payshrstatus = -1 and li_cntlonpay = 0 then
		update	mbmembmaster
		set			pausekeep_flag		= 1,
					pausekeep_date	= :adtm_opedate
		where	( member_no		= :as_memno )
		using		itr_sqlca ;
	end if
else
	if li_payshrstatus = 1 or li_cntlonpay > 0 or li_cntlon = 0 then
		update	mbmembmaster
		set			pausekeep_flag		= 0,
					pausekeep_date	= :adtm_opedate
		where	( member_no		= :as_memno )
		using		itr_sqlca ;
	end if
end if

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงสถานะการหยุดออกใบเสร็จได้ "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

public function integer of_initreq_chgcontlaw (ref str_contlaw astr_contlaw) throws Exception;string		ls_contno, ls_mcoopid, ls_memno, ls_trncontno, ls_trnmemno, ls_trnccoopid, ls_trnmcoopid
string		ls_prename, ls_mbname, ls_mbsurname, ls_mbgrpcode, ls_mbgrpdesc
long		ll_count, ll_row
integer	li_contlaw
dec{2}	ldc_prnbal, ldc_intarr, ldc_intset
datetime	ldtm_chgdate, ldtm_lastcalint
n_ds		lds_main, lds_detail

ls_contno		= astr_contlaw.loancontract_no
ldtm_chgdate	= astr_contlaw.change_date

select		lm.memcoop_id, lm.member_no, mpre.prename_desc, mb.memb_name, mb.memb_surname, mb.membgroup_code, mgrp.membgroup_desc,
			lm.principal_balance, lm.interest_arrear, lm.lastcalint_date, lm.contlaw_status, lm.intset_arrear
into		:ls_mcoopid, :ls_memno, :ls_prename, :ls_mbname, :ls_mbsurname, :ls_mbgrpcode, :ls_mbgrpdesc,
			:ldc_prnbal, :ldc_intarr, :ldtm_lastcalint, :li_contlaw, :ldc_intset
from		lncontmaster lm, mbmembmaster mb, mbucfprename mpre, mbucfmembgroup mgrp
where	( lm.memcoop_id			= mb.coop_id )
and		( lm.member_no			= mb.member_no )
and		( mb.prename_code		= mpre.prename_code )
and		( mb.coop_id				= mgrp.coop_id )
and		( mb.membgroup_code	= mgrp.membgroup_code )
and		( lm.coop_id					= :is_coopcontrol )
and		( lm.loancontract_no		= :ls_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่พบข้อมูลสัญญาเงินกู้ที่ส่งเข้ามา เลขที่สัญญา " +ls_contno+ "' กรุณาตรวจสอบ"
	throw ithw_exception
end if

lds_main		= create n_ds
lds_main.dataobject	= "d_loansrv_req_chgcontlaw"

lds_detail	= create n_ds
lds_detail.dataobject	= "d_loansrv_req_chgcontlawcoll"

// ส่วน Master
lds_main.insertrow( 0 )

lds_main.setitem( 1, "prename_desc", ls_prename )
lds_main.setitem( 1, "memb_name", ls_mbname )
lds_main.setitem( 1, "memb_surname", ls_mbsurname )
lds_main.setitem( 1, "membgroup_code", ls_mbgrpcode )
lds_main.setitem( 1, "membgroup_desc", ls_mbgrpdesc )

lds_main.setitem( 1, "memcoop_id", ls_mcoopid )
lds_main.setitem( 1, "member_no", ls_memno )
lds_main.setitem( 1, "concoop_id", is_coopcontrol )
lds_main.setitem( 1, "loancontract_no", ls_contno )
lds_main.setitem( 1, "bfprnbal_amt", ldc_prnbal )
lds_main.setitem( 1, "bfintarrear_amt", ldc_intarr )
lds_main.setitem( 1, "bfintarrset_amt", ldc_intset )
lds_main.setitem( 1, "bflastcalint_date", ldtm_lastcalint )
lds_main.setitem( 1, "bfcontlaw_status", li_contlaw )

lds_main.setitem( 1, "contlaw_prnset", ldc_prnbal )
lds_main.setitem( 1, "contlaw_intarrset", ldc_intset )

lds_main.setitem( 1, "lnchgcontlaw_date", ldtm_chgdate )
lds_main.setitem( 1, "lnchgcontlaw_status", 1 )

// รายการสัญญาที่โอนไป
declare data_cur cursor for
select		lm.coop_id, lm.loancontract_no, lm.memcoop_id, lm.member_no,
			lm.principal_balance, lm.intset_arrear,
			lm.contlaw_status, mpre.prename_desc,
			mb.memb_name, mb.memb_surname
from		lncontmaster lm, mbmembmaster mb, mbucfprename mpre
where	( lm.memcoop_id			= mb.coop_id )
and		( lm.member_no			= mb.member_no )
and		( mb.prename_code		= mpre.prename_code )
and		( lm.transfer_status		= 1 )
and		( lm.coop_id					= :is_coopid )
and		( lm.trnfrom_contno		= :ls_contno )
using		itr_sqlca ;

open data_cur ;
	fetch data_cur into :ls_trnccoopid, :ls_trncontno, :ls_trnmcoopid, :ls_trnmemno, :ldc_prnbal, :ldc_intset, :li_contlaw, :ls_prename, :ls_mbname, :ls_mbsurname ;
	do while itr_sqlca.sqlcode = 0
		ll_row		= lds_detail.insertrow( 0 )
		
		lds_detail.setitem( ll_row, "trn_concoopid", ls_trnccoopid )
		lds_detail.setitem( ll_row, "trn_contractno", ls_trncontno )
		lds_detail.setitem( ll_row, "trn_memcoopid", ls_trnmcoopid )
		lds_detail.setitem( ll_row, "trn_memno", ls_trnmemno )
		lds_detail.setitem( ll_row, "collprnbal_amt", ldc_prnbal )
		lds_detail.setitem( ll_row, "collintsetarr_amt", ldc_intset )
		lds_detail.setitem( ll_row, "collcontlaw_status", li_contlaw )
		lds_detail.setitem( ll_row, "prename_desc", ls_prename )
		lds_detail.setitem( ll_row, "memb_name", ls_mbname )
		lds_detail.setitem( ll_row, "memb_surname", ls_mbsurname )
		
		fetch data_cur into :ls_trnccoopid, :ls_trncontno, :ls_trnmcoopid, :ls_trnmemno, :ldc_prnbal, :ldc_intset, :li_contlaw, :ls_prename, :ls_mbname, :ls_mbsurname ;
	loop
close data_cur ;

astr_contlaw.xml_main		= inv_dwxmliesrv.of_xmlexport( lds_main )

if lds_detail.rowcount() > 0 then
	astr_contlaw.xml_detail		= inv_dwxmliesrv.of_xmlexport( lds_detail )
else
	astr_contlaw.xml_detail		= ""
end if

destroy lds_main
destroy lds_detail

return 1
end function

public function integer of_savereq_chgcontlaw (ref str_contlaw astr_contlaw) throws Exception;string		ls_contno, ls_trncoopid, ls_trncontno
string		ls_chglawdocno, ls_entryid
long		ll_count, ll_index
integer	li_chgcontlaw
dec{2}	ldc_chgintarrset
datetime	ldtm_entrydate
boolean	lb_error = false
n_ds		lds_main, lds_detail

ls_entryid			= astr_contlaw.entry_id
ldtm_entrydate		= datetime( today(), now() )

// ส่วน Header
lds_main		= create n_ds
lds_main.dataobject	= "d_loansrv_req_chgcontlaw"
lds_main.settransobject( itr_sqlca )

// ส่วน Detail
lds_detail	= create n_ds
lds_detail.dataobject	= "d_loansrv_req_chgcontlawcoll"
lds_detail.settransobject( itr_sqlca )

// นำเข้าข้อมูล
try
	this.of_setsrvdwxmlie( true )
	inv_dwxmliesrv.of_xmlimport( lds_main, astr_contlaw.xml_main )
	inv_dwxmliesrv.of_xmlimport( lds_detail, astr_contlaw.xml_detail )
catch( Exception lthw_errimp )
	ithw_exception.text	= lthw_errimp.text
	lb_error					= true
end try

if lb_error then
	goto objdestroy
end if

ls_contno			= trim( lds_main.getitemstring( 1, "loancontract_no" ) )
li_chgcontlaw		= lds_main.getitemnumber( 1, "contlaw_chgtostatus" )
ldc_chgintarrset	= lds_main.getitemdecimal( 1, "contlaw_intarrset" )

// ขอเลขที่เอกสารการเปลี่ยนแปลง
this.of_setsrvdoccontrol( true )
ls_chglawdocno	= inv_docsrv.of_getnewdocno( is_coopid, "LNCHGCONTLAW" )
this.of_setsrvdoccontrol( false )

// ให้ค่าเลขที่เอกสาร
lds_main.setitem( 1, "coop_id", is_coopcontrol )
lds_main.setitem( 1, "lnchgcontlaw_docno", ls_chglawdocno )
lds_main.setitem( 1, "entry_id", ls_entryid )
lds_main.setitem( 1, "entry_date", ldtm_entrydate )
lds_main.setitem( 1, "entry_bycoopid", is_coopid )

ll_count		= lds_detail.rowcount()

// ใส่เลขที่เอกสารและลำดับที่ใน detail
for ll_index = 1 to ll_count
	lds_detail.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_detail.setitem( ll_index, "lnchgcontlaw_docno", ls_chglawdocno )
	lds_detail.setitem( ll_index, "seq_no", ll_index )
next

// -----------------------
// เริ่มกระบวนการบันทึก
// -----------------------
// บันทึก Master
if lds_main.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลการขอเปลี่ยนสถานะกฎหมาย (ChgContLaw Master) ไม่ได้  "
	ithw_exception.text	+= ls_chglawdocno +"  "+ lds_main.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// บันทึก Detail
if lds_detail.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล ส่วนรายการสัญญารับโอน (ChgContLaw Detail) ไม่ได้  "
	ithw_exception.text	+= ls_chglawdocno +"  "+ lds_detail.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// เริ่มทำการปรับปรุงสัญญา
update	lncontmaster
set			intset_arrear	= :ldc_chgintarrset,
			contlaw_status	= :li_chgcontlaw
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :ls_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ปรับปรุงสถานะทางกฎหมาย ให้สัญญาหลักไม่ได้ ( "+ls_contno +" )"
	ithw_exception.text	+= itr_sqlca.sqlerrtext
	lb_error					= true
	goto objdestroy
end if

// ส่วนของสัญญาที่รับโอนไป
ll_count		= lds_detail.rowcount()

for ll_index = 1 to ll_count
	ls_trncoopid			= lds_detail.getitemstring( ll_index, "trn_concoopid" )
	ls_trncontno			= lds_detail.getitemstring( ll_index, "trn_contractno" )
	ldc_chgintarrset	= lds_detail.getitemdecimal( ll_index, "collintsetarr_amt" )

	// เริ่มทำการปรับปรุงสัญญา
	update	lncontmaster
	set			contlaw_status		= :li_chgcontlaw,
				intset_arrear		= :ldc_chgintarrset
	where	( coop_id				= :ls_trncoopid )
	and		( loancontract_no	= :ls_trncontno )
	using		itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ปรับปรุงสถานะทางกฎหมาย ให้สัญญารับโอนไม่ได้ ( "+ls_trncontno +" )"
		ithw_exception.text	+= itr_sqlca.sqlerrtext
		lb_error					= true
		goto objdestroy
	end if
next

// Export ข้อมูลอีกครั้ง
astr_contlaw.xml_main		= inv_dwxmliesrv.of_xmlexport( lds_main )
astr_contlaw.xml_detail		= inv_dwxmliesrv.of_xmlexport( lds_detail )

objdestroy:
destroy lds_main
destroy lds_detail

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function string of_getmembdetail (string as_coopid, string as_memno) throws Exception;string		ls_xmlmemdet
long		ll_count

ll_count	= ids_infomemdet.retrieve( as_coopid, as_memno )

if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลเลขสมาชิก "+as_memno+" กรุณาตรวจสอบ"
	throw ithw_exception
end if

ls_xmlmemdet		= inv_dwxmliesrv.of_xmlexport( ids_infomemdet )

return ls_xmlmemdet
end function

public function string of_initreq_contcancel (string as_coopid, string as_contno) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายการสัญญาเงินกู้ที่จะทำการยกเลิก (ได้ค่า XML กลับไป)
</description>

<arguments>  
	as_contno		String	 	เลขที่สัญญาเงินกู้
</arguments>

<return> 
	Integer
	1			ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งเลขที่สัญญาเงินกู้เข้ามาฟังก์ชั่นจะส่งรายละเอียด
	สัญญาเงินกู้ที่จะทำการยกเลิกกลับไปในรูปแบบ XML
	
	string		ls_contno
	
	ls_contno			= dw_master.getitemstring( 1, "loancontract_no" )
	
	ls_xmlcclcontno		= lnv_lnoperate.of_initreq_contcancel( ls_contno )
	
	dw_master.reset()
	dw_master.importstring( XML!, ls_xmlcclcontno )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_xmlccldata, ls_loantype
long		ll_count
integer	li_contstatus
dec{2}	ldc_apvamt, ldc_wtdamt
n_ds		lds_ccldata

ll_count	= ids_infocont.retrieve(as_coopid, as_contno )
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลสัญญาเงินกู้ที่จะทำการยกเลิก กรุณาตรวจสอบ"
	throw ithw_exception
end if

ls_loantype		= trim( ids_infocont.getitemstring( ll_count, "loantype_code" ) )
li_contstatus		= ids_infocont.getitemnumber( ll_count, "contract_status" )
ldc_apvamt		= ids_infocont.getitemdecimal( ll_count, "loanapprove_amt" )
ldc_wtdamt		= ids_infocont.getitemdecimal( ll_count, "withdrawable_amt" )

if li_contstatus <> 1 then
	choose case li_contstatus
		case -9
			ithw_exception.text	= "สัญญาเงินกู้ที่ระบุมาได้ทำการยกเลิกไปแล้ว กรุณาตรวจสอบ"
		case else
			ithw_exception.text	= "สถานะสัญญาเงินกู้ที่ระบุมาเป็นสถานะที่ไม่สามารถยกเลิกได้ กรุณาตรวจสอบ"
	end choose
	
	throw ithw_exception
end if

// ยกเวันสัญญาฉุกเฉินโอนไม่ต้องตรวจ เฉพาะที่ กสท เท่านั้น
//if ldc_apvamt <> ldc_wtdamt and ls_loantype <> "11" then
//	ithw_exception.text	= "สัญญาเลขที่ "+as_contno+" มีการทำรายการไปแล้วไม่สามารถทำการยกเลิกได้ กรุณาตรวจสอบ"
//	throw ithw_exception
//end if

lds_ccldata	= create n_ds
lds_ccldata.dataobject	= "d_loansrv_req_contcancel"
lds_ccldata.settransobject( itr_sqlca )
lds_ccldata.retrieve(as_coopid, as_contno )

ls_xmlccldata	= inv_dwxmliesrv.of_xmlexport( lds_ccldata )

return ls_xmlccldata
end function

public function integer of_savereq_contcancel (string as_xmlcontccl, string as_cancelid, datetime adtm_cancel, string as_coopid) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกการทำรายการยกเลิกสัญญาเงินกู้ที่มีการอนุมัติออกเลขสัญญาไปแล้ว
	(ทำได้เฉพาะพวกที่มียอดรอเบิกเท่ากับยอดอนุมัติเท่านั้น สัญญาที่มีการทำรายการจ่ายไปแล้ว
	ไม่สามารถทำการยกเลิกได้ )
</description>

<arguments>  
	as_xmlcontccl		String 	XML รายละเอียดสัญญาเงินกู้ที่จะทำการยกเลิก
	as_cancelid			String		ผู้ทำการยกเลิก
	adtm_cancel		datetime	วันที่ทำการยกเลิก
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	
	string		ls_xmlcontccl, ls_cancelid
	datetime	ldtm_canceldate
	
	ls_xmlcontccl		= dw_cancel.describe( "Datawindow.Data.XML" )
	ls_cancelid			= entry_id
	ldtm_canceldate	= system_date
	
	lnv_lnoperate.of_savereq_contcancel( ls_xmlcontccl, ls_cancelid, ldtm_canceldate )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 11/10/2010 by OhhO

</usage> 
***********************************************************/
string		ls_cclcause, ls_contno, ls_cclcode
long		ll_count
integer	li_cclstatus
dec{2}	ldc_cclprn
n_ds		lds_ccldata

lds_ccldata	= create n_ds
lds_ccldata.dataobject	= "d_loansrv_req_contcancel"

inv_dwxmliesrv.of_xmlimport( lds_ccldata, as_xmlcontccl )

ll_count		= lds_ccldata.rowcount()
if ll_count <= 0 then
	
end if

ls_contno	= lds_ccldata.getitemstring( 1, "loancontract_no" )
li_cclstatus	= lds_ccldata.getitemnumber( 1, "contract_status" )
ls_cclcause	= lds_ccldata.getitemstring( 1, "cancel_cause" )
ls_cclcode	= lds_ccldata.getitemstring( 1, "contcclcause_code" )
ldc_cclprn	= lds_ccldata.getitemdecimal( 1, "principal_balance" )

update	lncontmaster
set			contract_status		= -9,
			cancel_id				= :as_cancelid,
			cancel_date			= :adtm_cancel,
			cancel_cause		= :ls_cclcause,
			contcclcause_code	= :ls_cclcode,
			cancel_prnbalamt	= :ldc_cclprn,
			principal_balance	= 0
where	( loancontract_no	= :ls_contno )
and   coop_id=:as_coopid
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ผิดพลาด!!! ไม่สามารถปรับปรุงสถานะของสัญญา #"+ls_contno+" ให้เป็นสถานะยกเลิกได้~n~r"+itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

destroy lds_ccldata

return 1
end function

private function integer of_postreq_contadjust (str_lncontaj astr_lncontaj, boolean ab_chgpay, boolean ab_chglnpay, boolean ab_chgint, boolean ab_chgcoll) throws Exception;string		ls_concoopid, ls_contno, ls_memno, ls_continttab
string		ls_colltype, ls_refcollno, ls_colldesc
integer	li_paytype, li_periodall, li_paystatus , li_mthstatus
integer	li_continttype, li_intsteptype, li_inttimetype, li_inttimeamt
long		ll_index
dec{2}	ldc_payment, ldc_collamt, ldc_collbal, ldc_useamt, ldc_collpercent, ldc_basepercent
dec{4}	ldc_contintrate, ldc_contintinc
datetime	ldtm_effdate, ldtm_chgdate
n_ds		lds_data

lds_data		= create n_ds
lds_data.dataobject	= "d_loansrv_req_contadj"

inv_dwxmliesrv.of_xmlimport( lds_data, astr_lncontaj.xml_contdetail )

ls_memno		= lds_data.getitemstring( 1, "member_no" )
ls_concoopid	= lds_data.getitemstring( 1, "concoop_id" )
ls_contno		= lds_data.getitemstring( 1, "loancontract_no" )
ldtm_chgdate	= lds_data.getitemdatetime( 1, "contadjust_date" )

if ab_chgpay then
	lds_data.dataobject	= "d_loansrv_req_contadj_payment"
	
	inv_dwxmliesrv.of_xmlimport( lds_data, astr_lncontaj.xml_contpayment )
	
	li_paytype		= lds_data.getitemnumber( 1, "loanpayment_type" )
	li_periodall		= lds_data.getitemnumber( 1, "period_payamt" )
	li_paystatus		= lds_data.getitemnumber( 1, "payment_status" )
	ldc_payment	= lds_data.getitemdecimal( 1, "period_payment" )
	li_mthstatus		= lds_data.getitemnumber( 1 , "monthkeep_status" )
	
	update	lncontmaster
	set			loanpayment_type		= :li_paytype,
				period_payamt			= :li_periodall,
				period_payment		= :ldc_payment,
				payment_status		= :li_paystatus,
				loanpaymentchg_date	= :ldtm_chgdate
	where	( coop_id					= :ls_concoopid ) and
				( loancontract_no		= :ls_contno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		destroy lds_data
		ithw_exception.text	= "ไม่สามารถปรับปรุงรายละเอียดการชำระรายเดือนได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	// ปรับปรุงสถานะการหยุดชำระหนี้
//	this.of_setpausekeepup( ls_memno, ldtm_chgdate )

end if

if ab_chglnpay then
	string		ls_lnpaycode, ls_lnpaybank, ls_lnpaybranch, ls_lnpayaccid
	
	lds_data.dataobject	= DWCONTADJLNPAY
	
	inv_dwxmliesrv.of_xmlimport( lds_data, astr_lncontaj.xml_contloanpay )
	
	ls_lnpaycode	= lds_data.getitemstring( 1, "loanpay_code" )
	ls_lnpaybank	= lds_data.getitemstring( 1, "loanpay_bank" )
	ls_lnpaybranch	= lds_data.getitemstring( 1, "loanpay_branch" )
	ls_lnpayaccid	= lds_data.getitemstring( 1, "loanpay_accid" )
	
	update	lncontmaster
	set			loanpay_code		= :ls_lnpaycode,
				loanpay_bank		= :ls_lnpaybank,
				loanpay_branch	= :ls_lnpaybranch,
				loanpay_accid		= :ls_lnpayaccid
	where	( coop_id					= :ls_concoopid ) and
				( loancontract_no		= :ls_contno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		destroy lds_data
		ithw_exception.text	= "ไม่สามารถปรับปรุงรายละเอียดวิธีการหักชำระได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
end if

if ab_chgint then
	lds_data.dataobject	= "d_loansrv_req_contadj_contint"
	
	inv_dwxmliesrv.of_xmlimport( lds_data, astr_lncontaj.xml_contint )
	
	li_continttype		= lds_data.getitemnumber( 1, "int_continttype" )
	ldc_contintrate		= lds_data.getitemdecimal( 1, "int_contintrate" )
	ls_continttab		= lds_data.getitemstring( 1, "int_continttabcode" )
	ldc_contintinc		= lds_data.getitemdecimal( 1, "int_contintincrease" )
	li_intsteptype		= lds_data.getitemnumber( 1, "int_intsteptype" )
	
	update	lncontmaster
	set			int_continttype			= :li_continttype,
				int_contintrate			= :ldc_contintrate,
				int_continttabcode		= :ls_continttab,
				int_contintincrease		= :ldc_contintinc,
				int_intsteptype			= :li_intsteptype
	where	( coop_id					= :ls_concoopid ) and
				( loancontract_no		= :ls_contno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		destroy lds_data
		ithw_exception.text	= "ไม่สามารถปรับปรุงรายละเอียดอัตรา ด/บ ได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	// ส่วนของ ด/บ พิเศษเป็นช่วง
	lds_data.dataobject	= "d_loansrv_req_contadj_contintspc"
	inv_dwxmliesrv.of_xmlimport( lds_data, astr_lncontaj.xml_contintspc )
	
	if lds_data.rowcount() > 0 then
		lds_data.setfilter( "contadjust_type = 'NEW'" )
		lds_data.filter()
		
		delete from lncontintspc
		where	( coop_id					= :ls_concoopid ) and
					( loancontract_no		= :ls_contno )
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			destroy lds_data
			ithw_exception.text	= "ไม่สามารถลบข้อมูลอัตรา ด/บ พิเศษเป็นช่วงได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
		
		// เรียงข้อมูลก่อน
		lds_data.setsort( "effective_date asc" )
		lds_data.sort()
		
		for ll_index = 1 to lds_data.rowcount()
			li_continttype		= lds_data.getitemnumber( 1, "int_continttype" )
			ldc_contintrate		= lds_data.getitemdecimal( 1, "int_contintrate" )
			ls_continttab		= lds_data.getitemstring( 1, "int_continttabcode" )
			ldc_contintinc		= lds_data.getitemdecimal( 1, "int_contintincrease" )
			li_inttimetype		= lds_data.getitemnumber( 1, "int_timetype" )
			li_inttimeamt		= lds_data.getitemnumber( 1, "int_timeamt" )
			ldtm_effdate		= lds_data.getitemdatetime( 1, "effective_date" )
			insert into lncontintspc
						( coop_id, loancontract_no, seq_no, effective_date, int_continttype, int_contintrate, int_continttabcode, int_contintincrease, int_timetype, int_timeamt )
			values	( :ls_concoopid, :ls_contno, :ll_index, :ldtm_effdate, :li_continttype, :ldc_contintrate, :ls_continttab, :ldc_contintinc, :li_inttimetype, :li_inttimeamt )
			using		itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				destroy lds_data
				ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลใหม่อัตรา ด/บ พิเศษเป็นช่วงได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
				throw ithw_exception
			end if
		next
	end if
end if

if ab_chgcoll then
	lds_data.dataobject	= "d_loansrv_req_contadj_collateral"
	inv_dwxmliesrv.of_xmlimport( lds_data, astr_lncontaj.xml_contcoll )
	
	if lds_data.rowcount() > 0 then
		lds_data.setfilter( "contadjust_type = 'NEW'" )
		lds_data.filter()
		
		// ข้อมูลเก่าลบทิ้งไป
		delete from lncontcoll
		where	( coop_id					= :ls_concoopid ) and
					( loancontract_no		= :ls_contno )
		using		itr_sqlca ;
		if itr_sqlca.sqlcode <> 0 then
			destroy lds_data
			ithw_exception.text	= "ไม่สามารถลบข้อมูลหลักประกันเก่าได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
		
		for ll_index = 1 to lds_data.rowcount()
		
			ls_colltype			= lds_data.object.loancolltype_code[ ll_index ]
			ls_refcollno			= lds_data.object.ref_collno[ ll_index ]
			ls_colldesc			= lds_data.object.description[ ll_index ]
			ldc_collamt			= lds_data.object.coll_amt[ ll_index ]
			ldc_collbal			= lds_data.object.coll_balance[ ll_index ]
			ldc_useamt			= lds_data.object.use_amt[ ll_index ]
			ldc_collpercent		= lds_data.object.coll_percent[ ll_index ]
			ldc_basepercent	= lds_data.object.base_percent[ ll_index ]
			
			insert into lncontcoll
						( coop_id, loancontract_no, seq_no, loancolltype_code, ref_collno, description, coll_amt, coll_balance, use_amt, coll_percent, base_percent, coll_status )
			values	( :ls_concoopid, :ls_contno, :ll_index, :ls_colltype, :ls_refcollno, :ls_colldesc, :ldc_collamt, :ldc_collbal, :ldc_useamt, :ldc_collpercent, :ldc_basepercent, 1 )
			using		itr_sqlca ;
			if itr_sqlca.sqlcode <> 0 then
				destroy lds_data
				ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลใหม่หลักประกันเงินกู้ได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
				throw ithw_exception
			end if
		next
	end if
		
end if

destroy lds_data

return 1
end function

private function integer of_setsrvcollpermiss (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_collpermisssrv ) or not isvalid( inv_collpermisssrv ) then
		inv_collpermisssrv	= create n_cst_loansrv_collpermiss
		inv_collpermisssrv.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_collpermisssrv ) then
		destroy inv_collpermisssrv
		return 1
	end if
end if

return 0
end function

public function integer of_post_reqcontadj_pay (n_ds ads_adjmast, n_ds ads_adjpay) throws Exception;string		ls_ccoopid, ls_contno
integer	li_paytype, li_periodall, li_paystatus
dec{2}	ldc_payment, ldc_paymax
datetime	ldtm_lastaccess, ldtm_operate

ls_ccoopid		= ads_adjmast.getitemstring( 1, "concoop_id" )
ls_contno		= ads_adjmast.getitemstring( 1, "loancontract_no" )

li_paytype		= ads_adjpay.getitemnumber( 1, "loanpayment_type" )
li_periodall		= ads_adjpay.getitemnumber( 1, "period_payamt" )
li_paystatus		= ads_adjpay.getitemnumber( 1, "payment_status" )
ldc_payment	= ads_adjpay.getitemdecimal( 1, "period_payment" )
ldc_paymax		= ads_adjpay.getitemdecimal( 1, "period_payment_max" )

ldtm_operate	= ads_adjmast.GetItemDateTime(1,"contadjust_date")

select lastaccess_date
into :ldtm_lastaccess
from lncontmaster
where coop_id = :ls_ccoopid
and loancontract_no = :ls_contno
using itr_sqlca;

if ldtm_operate > ldtm_lastaccess or IsNull( ldtm_lastaccess ) then
	ldtm_lastaccess = ldtm_operate
end if

update	lncontmaster
set			loanpayment_type		= :li_paytype,
			period_payamt			= :li_periodall,
			period_payment		= :ldc_payment,
			period_payment_max	= :ldc_paymax,
			payment_status		= :li_paystatus,
			lastaccess_date = :ldtm_lastaccess
where	( coop_id					= :ls_ccoopid )
and		( loancontract_no		= :ls_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงรายละเอียดการชำระรายเดือนได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if
	
return 1
end function

public function integer of_post_reqcontadj_int (n_ds ads_adjmast, n_ds ads_adjint, n_ds ads_adjintspc) throws Exception;string		ls_ccoopid, ls_contno, ls_continttab
integer	li_continttype, li_intsteptype
long		ll_index
dec{4}	ldc_contintrate, ldc_contintinc
datetime	ldtm_effdate, ldtm_expdate, ldtm_lastaccess, ldtm_operate

ls_ccoopid		= ads_adjmast.getitemstring( 1, "concoop_id" )
ls_contno		= ads_adjmast.getitemstring( 1, "loancontract_no" )

li_continttype		= ads_adjint.getitemnumber( 1, "int_continttype" )
ldc_contintrate		= ads_adjint.getitemdecimal( 1, "int_contintrate" )
ls_continttab		= ads_adjint.getitemstring( 1, "int_continttabcode" )
ldc_contintinc		= ads_adjint.getitemdecimal( 1, "int_contintincrease" )
li_intsteptype		= ads_adjint.getitemnumber( 1, "int_intsteptype" )

ldtm_operate	= ads_adjmast.GetItemDateTime(1,"contadjust_date")

select lastaccess_date
into :ldtm_lastaccess
from lncontmaster
where coop_id = :ls_ccoopid
and loancontract_no = :ls_contno
using itr_sqlca;

if ldtm_operate > ldtm_lastaccess or IsNull( ldtm_lastaccess ) then
	ldtm_lastaccess = ldtm_operate
end if

update	lncontmaster
set			int_continttype			= :li_continttype,
			int_contintrate			= :ldc_contintrate,
			int_continttabcode		= :ls_continttab,
			int_contintincrease		= :ldc_contintinc,
			int_intsteptype			= :li_intsteptype,
			lastaccess_date = :ldtm_lastaccess
where	( coop_id					= :ls_ccoopid )
and		( loancontract_no		= :ls_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงรายละเอียดอัตรา ด/บ ได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ส่วนของ ด/บ พิเศษเป็นช่วง
if ads_adjintspc.rowcount() > 0 then
	// ข้อมูลเก่าลบทิ้งไป
	delete from lncontintspc
	where	( coop_id					= :ls_ccoopid )
	and		( loancontract_no		= :ls_contno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถลบข้อมูลอัตรา ด/บ พิเศษเป็นช่วงได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	for ll_index = 1 to ads_adjintspc.rowcount()
		li_continttype		= ads_adjintspc.getitemnumber( ll_index, "int_continttype" )
		ldc_contintrate		= ads_adjintspc.getitemdecimal( ll_index, "int_contintrate" )
		ls_continttab		= ads_adjintspc.getitemstring( ll_index, "int_continttabcode" )
		ldc_contintinc		= ads_adjintspc.getitemdecimal( ll_index, "int_contintincrease" )
		ldtm_effdate		= ads_adjintspc.getitemdatetime( ll_index, "effective_date" )
		
		insert into lncontintspc
					( coop_id, loancontract_no, seq_no, effective_date, int_continttype, int_contintrate, int_continttabcode, int_contintincrease )
		values	( :ls_ccoopid, :ls_contno, :ll_index, :ldtm_effdate, :li_continttype, :ldc_contintrate, :ls_continttab, :ldc_contintinc )
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลใหม่อัตรา ด/บ พิเศษเป็นช่วงได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
	next
end if

return 1
end function

public function integer of_post_reqcontadj_coll (n_ds ads_adjmast, n_ds ads_adjcoll) throws Exception;string		ls_ccoopid, ls_contno
string		ls_colltype, ls_refcoopid, ls_refcollno, ls_colldesc
long		ll_index
dec{2}	ldc_baseamt, ldc_usedamt, ldc_balamt, ldc_maxamt, ldc_activeamt
dec{4}	ldc_baseperc, ldc_activeperc

ls_ccoopid		= ads_adjmast.getitemstring( 1, "concoop_id" )
ls_contno		= ads_adjmast.getitemstring( 1, "loancontract_no" )

// ลบข้อมูลเก่าทิ้งก่อน
delete from lncontcoll
where	( coop_id				= :ls_ccoopid )
and		( loancontract_no	= :ls_contno )
using		itr_sqlca ;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถลบข้อมูลหลักประกันเก่าได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

for ll_index = 1 to ads_adjcoll.rowcount()

	ls_colltype			= ads_adjcoll.object.loancolltype_code[ ll_index ]
	ls_refcoopid			= ads_adjcoll.object.refcoop_id[ ll_index ]
	ls_refcollno			= ads_adjcoll.object.ref_collno[ ll_index ]
	ls_colldesc			= ads_adjcoll.object.description[ ll_index ]
	
	ldc_baseamt		= ads_adjcoll.object.collbase_amt[ ll_index ]
	ldc_baseperc		= ads_adjcoll.object.collbase_percent[ ll_index ]
	ldc_usedamt		= ads_adjcoll.object.collused_amt[ ll_index ]
	ldc_balamt			= ads_adjcoll.object.collbalance_amt[ ll_index ]
	ldc_maxamt			= ads_adjcoll.object.collmax_amt[ ll_index ]
	ldc_activeamt		= ads_adjcoll.object.collactive_amt[ ll_index ]
	ldc_activeperc		= ads_adjcoll.object.collactive_percent[ ll_index ]
	
	insert into lncontcoll
				( coop_id, loancontract_no, seq_no, loancolltype_code, refcoop_id, ref_collno, description,
				  collbase_amt, collbase_percent, collused_amt, collbalance_amt, collmax_amt, collactive_amt, collactive_percent, coll_status )
	values	( :ls_ccoopid, :ls_contno, :ll_index, :ls_colltype, :ls_refcoopid, :ls_refcollno, :ls_colldesc,
				  :ldc_baseamt, :ldc_baseperc, :ldc_usedamt, :ldc_balamt, :ldc_maxamt, :ldc_activeamt, :ldc_activeperc, 1 )
	using		itr_sqlca ;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลใหม่หลักประกันเงินกู้ได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
next

return 1
end function

private function integer of_setlncontadjdocno (string as_entryid, ref n_ds ads_adjmast, ref n_ds ads_adjpay, ref n_ds ads_adjlnpay, ref n_ds ads_adjint, ref n_ds ads_adjintspc, ref n_ds ads_adjcoll, ref n_ds ads_adjintspcold, ref n_ds ads_adjcollold) throws Exception;string		ls_contajdocno
long		ll_index
datetime	ldtm_entrydate

ldtm_entrydate	= datetime( today(), now() )

// ส่วน Master ของการเปลี่ยนแปลงรายละเอียดสัญญา
this.of_setsrvdoccontrol( true )
ls_contajdocno		= inv_docsrv.of_getnewdocno( is_coopid, "CONTADJDOCNO" )
this.of_setsrvdoccontrol( false )

ads_adjmast.setitem( 1, "coop_id", is_coopcontrol )
ads_adjmast.setitem( 1, "contadjust_docno", ls_contajdocno )
ads_adjmast.setitem( 1, "entry_id", as_entryid )
ads_adjmast.setitem( 1, "entry_date", ldtm_entrydate )
ads_adjmast.setitem( 1, "entry_bycoopid", is_coopid )

// การเปลี่ยนแปลงการชำระประจำเดือน
ads_adjpay.setitem( 1, "coop_id", is_coopcontrol )
ads_adjpay.setitem( 1, "contadjust_docno", ls_contajdocno )

// การเปลี่ยนแปลงรูปแบบการชำระเมื่อถึงกำหนด
ads_adjlnpay.setitem( 1, "coop_id", is_coopcontrol )
ads_adjlnpay.setitem( 1, "contadjust_docno", ls_contajdocno )

// การเปลี่ยนแปลงอัตราด/บของสัญญา
ads_adjint.setitem( 1, "coop_id", is_coopcontrol )
ads_adjint.setitem( 1, "contadjust_docno", ls_contajdocno )

// การเปลี่ยนแปลงอัตราด/บของสัญญาพิเศษ
for ll_index = 1 to ads_adjintspc.rowcount()
	ads_adjintspc.setitem( ll_index, "coop_id", is_coopcontrol )
	ads_adjintspc.setitem( ll_index, "contadjust_docno", ls_contajdocno )
	ads_adjintspc.setitem( ll_index, "seq_no", ll_index )
next

// การเปลี่ยนแปลงอัตราด/บของสัญญาพิเศษ<ก่อนเปลี่ยนแปลง>
for ll_index = 1 to ads_adjintspcold.rowcount()
	ads_adjintspcold.setitem( ll_index, "coop_id", is_coopcontrol )
	ads_adjintspcold.setitem( ll_index, "contadjust_docno", ls_contajdocno )
	ads_adjintspcold.setitem( ll_index, "seq_no", ll_index )
next

// การเปลี่ยนแปลงการค้ำประกัน
for ll_index = 1 to ads_adjcoll.rowcount()
	ads_adjcoll.setitem( ll_index, "coop_id", is_coopcontrol )
	ads_adjcoll.setitem( ll_index, "contadjust_docno", ls_contajdocno )
	ads_adjcoll.setitem( ll_index, "seq_no", ll_index )
next

// การเปลี่ยนแปลงการค้ำประกัน<ก่อนเปลี่ยนแปลง>
for ll_index = 1 to ads_adjcollold.rowcount()
	ads_adjcollold.setitem( ll_index, "coop_id", is_coopcontrol )
	ads_adjcollold.setitem( ll_index, "contadjust_docno", ls_contajdocno )
	ads_adjcollold.setitem( ll_index, "seq_no", ll_index )
next

return 1
end function

public function integer of_post_reqcontadj_lnpay (n_ds ads_adjmast, n_ds ads_adjlnpay) throws Exception;string		ls_ccoopid, ls_contno
string		ls_lnpaycode, ls_lnpaybank, ls_lnpaybranch, ls_lnpayaccid

ls_ccoopid		= ads_adjmast.getitemstring( 1, "concoop_id" )
ls_contno		= ads_adjmast.getitemstring( 1, "loancontract_no" )

ls_lnpaycode	= ads_adjlnpay.getitemstring( 1, "loanpay_code" )
ls_lnpaybank	= ads_adjlnpay.getitemstring( 1, "loanpay_bank" )
ls_lnpaybranch	= ads_adjlnpay.getitemstring( 1, "loanpay_branch" )
ls_lnpayaccid	= ads_adjlnpay.getitemstring( 1, "loanpay_accid" )

update	lncontmaster
set			loanpay_code		= :ls_lnpaycode,
			loanpay_bank		= :ls_lnpaybank,
			loanpay_branch	= :ls_lnpaybranch,
			loanpay_accid		= :ls_lnpayaccid
where	( coop_id				= :ls_ccoopid )
and		( loancontract_no	= :ls_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงรูปแบบการชำระเมื่อครบกำหนดได้ สัญญา #"+ls_contno+"~n~r"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if
	
return 1
end function

private function integer of_setlncontadjdata (str_lncontaj astr_lncontaj, ref n_ds ads_adjpay, ref n_ds ads_adjlnpay, ref n_ds ads_adjint, ref n_ds ads_adjintspc, ref n_ds ads_adjcoll, ref n_ds ads_adjintspcold, ref n_ds ads_adjcollold) throws Exception;long		ll_index

// รายการชำระรายเดือน
ads_adjpay		= create n_ds
ads_adjpay.dataobject	= DWCONTADJPAY
ads_adjpay.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( ads_adjpay, astr_lncontaj.xml_contpayment )

// รูปแบบการชำระเมื่อถึงกำหนดชำระ
ads_adjlnpay	= create n_ds
ads_adjlnpay.dataobject	= DWCONTADJLNPAY
ads_adjlnpay.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( ads_adjlnpay, astr_lncontaj.xml_contloanpay )

// รายการวิธีคิดดอกเบี้ย
ads_adjint		= create n_ds
ads_adjint.dataobject	= DWCONTADJINT
ads_adjint.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( ads_adjint, astr_lncontaj.xml_contint )

// รายการวิธีคิดดอกเบี้ยอัตราพิเศษ
ads_adjintspc		= create n_ds
ads_adjintspc.dataobject	= DWCONTADJINTSPC
ads_adjintspc.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( ads_adjintspc, astr_lncontaj.xml_contintspc )
ads_adjintspc.setsort( "effective_date asc" )
ads_adjintspc.sort()
for ll_index = 1 to ads_adjintspc.rowcount()
	ads_adjintspc.setitem( ll_index, "contadjust_type", "NEW" )
next

// รายการวิธีคิดดอกเบี้ยอัตราพิเศษ<ก่อนเปลี่ยนแปลง>
ads_adjintspcold		= create n_ds
ads_adjintspcold.dataobject	= DWCONTADJINTSPC
ads_adjintspcold.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( ads_adjintspcold, astr_lncontaj.xml_oldcontintspc )
ads_adjintspcold.setsort( "effective_date asc" )
ads_adjintspcold.sort()
for ll_index = 1 to ads_adjintspcold.rowcount()
	ads_adjintspcold.setitem( ll_index, "contadjust_type", "OLD" )
next

// รายการการค้ำประกัน
ads_adjcoll		= create n_ds
ads_adjcoll.dataobject	= DWCONTADJCOLL
ads_adjcoll.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( ads_adjcoll, astr_lncontaj.xml_contcoll )
//ads_adjcoll.setsort( "loancolltype_code asc, seq_no asc" )
//ads_adjcoll.sort()
for ll_index = 1 to ads_adjcoll.rowcount()
	ads_adjcoll.setitem( ll_index, "contadjust_type", "NEW" )
next

// รายการการค้ำประกัน<ก่อนเปลี่ยนแปลง>
ads_adjcollold		= create n_ds
ads_adjcollold.dataobject	= DWCONTADJCOLL
ads_adjcollold.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( ads_adjcollold, astr_lncontaj.xml_oldcontcoll )
//ads_adjcollold.setsort( "loancolltype_code asc, seq_no asc" )
//ads_adjcollold.sort()
for ll_index = 1 to ads_adjcollold.rowcount()
	ads_adjcollold.setitem( ll_index, "contadjust_type", "OLD" )
next

return 1
end function

private function boolean of_checkcontadjustdet (n_ds ads_data, string as_oldcol[], string as_newcol[]);string		ls_coltype
any		la_bfdata, la_atdata
integer	li_colcount, li_colno
boolean	lb_adjust
datetime	ldtm_bfdate, ldtm_atdate

lb_adjust			= false
li_colcount		= upperbound( as_newcol )

for li_colno = 1 to li_colcount
	ls_coltype	= ads_data.describe( as_oldcol[ li_colno ]+".coltype" )
	
	if ls_coltype = "date" or ls_coltype = "datetime" then
		ldtm_bfdate	= ads_data.getitemdatetime( 1, as_oldcol[ li_colno ] )
		ldtm_atdate	= ads_data.getitemdatetime( 1, as_newcol[ li_colno ] )
		
		if isnull( ldtm_bfdate ) then ldtm_bfdate = datetime( date( 1900, 1, 1 ) )
		if isnull( ldtm_atdate ) then ldtm_atdate = datetime( date( 1900, 1, 1 ) )
		
		if ldtm_bfdate <> ldtm_atdate then
			lb_adjust	= true
			exit
		end if
	else
		la_bfdata		= ads_data.of_getitemany( 1, as_oldcol[ li_colno ] )
		la_atdata		= ads_data.of_getitemany( 1, as_newcol[ li_colno ] )
		
		if la_bfdata <> la_atdata or ( isnull( la_bfdata ) and not isnull( la_atdata ) ) or ( not isnull( la_bfdata ) and isnull( la_atdata) ) then
			lb_adjust	= true
			exit
		end if
	end if
	
next

return lb_adjust
end function

private function boolean of_checkcontadjustdetrow (n_ds ads_old, n_ds ads_new, string as_col[]);string		ls_coltype
any		la_bfdata, la_atdata
integer	li_colcount, li_colno
long		ll_index, ll_count
datetime	ldtm_bfdate, ldtm_atdate

if ads_old.rowcount() <> ads_new.rowcount() then
	return true
end if

li_colcount		= upperbound( as_col )
ll_count			= ads_old.rowcount()

// ตรวจทีละแถว
for ll_index = 1 to ll_count
	
	// ตรวจสอบทีละ column ที่ระบุมา
	for li_colno = 1 to li_colcount
		ls_coltype	= ads_old.describe( as_col[ li_colno ]+".coltype" )
		
		if ls_coltype = "date" or ls_coltype = "datetime" then
			ldtm_bfdate	= ads_old.getitemdatetime( ll_index, as_col[ li_colno ] )
			ldtm_atdate	= ads_new.getitemdatetime( ll_index, as_col[ li_colno ] )
			
			if isnull( ldtm_bfdate ) then ldtm_bfdate = datetime( date( 1900, 1, 1 ) )
			if isnull( ldtm_atdate ) then ldtm_atdate = datetime( date( 1900, 1, 1 ) )
			
			if ldtm_bfdate <> ldtm_atdate then
				return true
			end if
		else
			la_bfdata		= ads_old.of_getitemany( ll_index, as_col[ li_colno ] )
			la_atdata		= ads_new.of_getitemany( ll_index, as_col[ li_colno ] )
			
			if la_bfdata <> la_atdata or ( isnull( la_bfdata ) and not isnull( la_atdata ) ) or ( not isnull( la_bfdata ) and isnull( la_atdata) ) then
				return true
			end if
		end if
	next
next

return false
end function

public function integer of_savereq_loan (ref str_lnreqloan astr_reqloan) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกข้อมูลใบคำขอกู้
</description>

<arguments>  
	astr_savereqloan	Str_savereqloan	
		request_no				String		เลขที่คำขอกู้
		format_type				String		รูปแบบการดึงข้อมูล
		xml_main				String		Xml ใบคำขอกู้
		xml_clear				String		Xml ข้อมูลสัญญาเก่า
		xml_guarantee			String		Xml ข้อมูลการค้ำประกัน
		xml_insurance			String		Xml ข้อมูลประกัน
		xml_reqperiod			String		Xml ข้อมูลขอกู้วน
		xml_intspc				String		Xml อัตราดอกเบี้ยพิเศษ
		xml_otherclr				String		Xml รายการหักกลบอื่นๆ
		entry_id					String		ผู้ทำรายการ
		branch_id				String		สาขา
</arguments> 

<return> 
	1			Integer		ถ้าสำเสร็จจะ return 1
</return> 
<usage>
    เรียกใช้โดยส่งข้อมูลที่ต้องบันทึก
	
	int				li_chk
	Str_savereqloan			ls_savereqloan
	
	ls_savereqloan.request_no				= lds_main.object.loanrequest_dono[1]
	ls_savereqloan.format_type				= 'CAT'
	ls_savereqloan.xml_main				= this.of_exportxml( lds_main )
	ls_savereqloan.xml_clear				= this.of_exportxml( lds_main )
	ls_savereqloan.xml_guarantee			= this.of_exportxml( lds_main )
	ls_savereqloan.xml_insurance			= this.of_exportxml( lds_main )
	ls_savereqloan.xml_reqperiod			= this.of_exportxml( ids_reqloop )
	ls_savereqloan.xml_intspc				= this.of_exportxml( lds_intspc )
	ls_savereqloan.xml_otherclr				= this.of_exportxml( lds_othclr )
	ls_savereqloan.entry_id					= gnv_app.of_getusrid( )
	ls_savereqloan.branch_id				= gnv_app.of_getbranchid( )
	
	li_chk				= lnv_loanright.of_savereqloan( ls_savereqloan )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 15/10/2010 by Aod

</usage>

***********************************************************/

int			li_reqstatus, li_apvflag, li_runauto, li_postfeeacc,li_requesttype
string		ls_reqdocno, ls_format, ls_doccode, ls_runing, ls_prefix,ls_contnopri
string		ls_entryid, ls_branchid, ls_message, ls_loantype, ls_contno,ls_coopid,ls_contcoopid
string		ls_year, ls_document, ls_loangroup, ls_memcoopid,ls_coopidtest
string		ls_memno
integer	li_cntchk
long		ll_count, ll_index, ll_insert
dec{2}	ldc_insurance, ldc_agency, ldc_onlinefee, ldc_postagesrv, ldc_reqamt,ldc_loannet
dec{2}	ldc_bankfee, ldc_banksrv, ldc_postagefee, ldc_tax, ldc_emsfee, ldc_sumclear
datetime	ldtm_entrydate, ldtm_loanrcvfix, ldtm_reqdate
boolean	lb_err
n_ds lds_main , lds_clear , lds_guarantee , lds_intspc , lds_othclr

lds_main						= create n_ds
lds_main.dataobject		= 'd_sl_loanrequest_master'
lds_main.settransobject( itr_sqlca )

lds_clear						= create n_ds
lds_clear.dataobject		= 'd_sl_loanrequest_clear'
lds_clear.settransobject( itr_sqlca )

lds_guarantee				= create n_ds
lds_guarantee.dataobject= 'd_sl_loanrequest_collateral'
lds_guarantee.settransobject( itr_sqlca )

lds_intspc				= create n_ds
lds_intspc.dataobject	= 'd_sl_loanrequest_intratespc'
lds_intspc.settransobject( itr_sqlca )

lds_othclr				= create n_ds
lds_othclr.dataobject	= 'd_sl_loanrequest_otherclr'
lds_othclr.settransobject( itr_sqlca )

ls_format			= astr_reqloan.format_type
ls_entryid			= astr_reqloan.entry_id
//ls_coopid	        		= astr_reqloan.coop_id
//ls_contcoopid  		= astr_reqloan.contcoopid
ls_coopid				= is_coopid
ls_contcoopid		= is_coopcontrol
ldtm_entrydate		= datetime( today(), now() )

this.of_setsrvdwxmlie( true )
this.of_setsrvdoccontrol( true )	// เรียกใช้ Service doccontrol

// Import ตัวใบคำขอ
//this.of_importxml( lds_main, astr_reqloan.xml_main )
if inv_dwxmliesrv.of_xmlimport( lds_main , astr_reqloan.xml_main ) < 1 then
	ithw_exception.text = "<br/>พบขอผิดพลาดใน การนำเข้าข้อมูลใบคำขอ(0.10)"
	ithw_exception.text += "<br/>กรุณาตรวจสอบ"
	lb_err = true ; if lb_err then Goto objdestroy
end if

// Import รายการสัญญาหักกลบ
//this.of_importxml( lds_clear, astr_reqloan.xml_clear )
if inv_dwxmliesrv.of_xmlimport( lds_clear , astr_reqloan.xml_clear ) < 1 then
	ithw_exception.text = "<br/>พบขอผิดพลาดใน การนำเข้าข้อมูลใบคำขอ(0.11)"
	ithw_exception.text += "<br/>กรุณาตรวจสอบ"
	lb_err = true ; if lb_err then Goto objdestroy
end if

// Import การค้ำประกัน
//this.of_importxml( lds_guarantee, astr_reqloan.xml_guarantee )
if inv_dwxmliesrv.of_xmlimport( lds_guarantee , astr_reqloan.xml_guarantee ) < 1 then
	ithw_exception.text = "<br/>พบขอผิดพลาดใน การนำเข้าข้อมูลใบคำขอ(0.12)"
	ithw_exception.text += "<br/>กรุณาตรวจสอบ"
	lb_err = true ; if lb_err then Goto objdestroy
end if

// Import ดอกเบี้ยอัตราพิเศษเป็นช่วง
//this.of_importxml( lds_intspc, astr_reqloan.xml_intspc )
if inv_dwxmliesrv.of_xmlimport( lds_intspc , astr_reqloan.xml_intspc ) < 1 then
	ithw_exception.text = "<br/>พบขอผิดพลาดใน การนำเข้าข้อมูลใบคำขอ(0.13)"
	ithw_exception.text += "<br/>กรุณาตรวจสอบ"
	lb_err = true ; if lb_err then Goto objdestroy
end if

// Import รายการหักอื่นๆ
//this.of_importxml( lds_othclr, astr_reqloan.xml_otherclr )
if inv_dwxmliesrv.of_xmlimport( lds_othclr , astr_reqloan.xml_otherclr ) < 1 then
	ithw_exception.text = "<br/>พบขอผิดพลาดใน การนำเข้าข้อมูลใบคำขอ(0.14)"
	ithw_exception.text += "<br/>กรุณาตรวจสอบ"
	lb_err = true ; if lb_err then Goto objdestroy
end if

ls_reqdocno		= lds_main.object.loanrequest_docno[1]
ls_loantype		= lds_main.object.loantype_code[1]
ls_contnopri 	= lds_main.object.loancontract_no[1]
ls_memcoopid 	= lds_main.object.memcoop_id[1]
ls_memno		= lds_main.object.member_no[1]
li_apvflag		= lds_main.object.apvimmediate_status[1]
li_reqstatus		= lds_main.object.loanrequest_status[1]
li_requesttype  	= lds_main.object.loanrequest_type[1]  
ldc_insurance	= lds_main.object.inspayment_amt[1]
ldc_agency		= lds_main.object.agencyclr_amt[1]
ldc_bankfee		= lds_main.object.bankfee_amt[1]
ldc_banksrv		= lds_main.object.banksrv_amt[1]
ldc_postagefee	= lds_main.object.postagefee_amt[1]
ldc_tax			= lds_main.object.tax_amt[1]
ldc_emsfee		= lds_main.object.emsfee_amt[1]
ldc_onlinefee	= lds_main.object.onlinefee_amt[1]
ldc_postagesrv	= lds_main.object.postagesrv_amt[1]
ldc_reqamt      	= lds_main.object.loanrequest_amt[1]
ldc_sumclear   	= lds_main.object.sum_clear[1]
ldtm_loanrcvfix	= lds_main.getitemdatetime( 1, "loanrcvfix_date" )
ldtm_reqdate	= lds_main.getitemdatetime( 1, "loanrequest_date" )

if isnull( li_apvflag ) then li_apvflag = 0
if isnull( li_requesttype ) then li_requesttype = 1
if isnull( li_reqstatus ) then li_reqstatus = 8
if isnull( ldc_insurance ) then ldc_insurance = 0.00
if isnull( ldc_agency ) then ldc_agency = 0.00
if isnull( ldc_reqamt ) then ldc_reqamt = 0.00

ls_runing			= '000000'
ldc_loannet = ldc_reqamt - ldc_sumclear

//ดึงข้อมูลเกี่ยวกับค่าคงที่ประเภทหนี้
select nvl( reqdocument_code , '' ) as reqdocument_code , nvl( loangroup_code , '' ) as loangroup_code ,
nvl( runcontauto_flag , 0 ) as runcontauto_flag , nvl( prefix , '' ) as prefix , nvl( postfeetoacc_flag , 0 ) as postfeetoacc_flag
into :ls_document , :ls_loangroup , :li_runauto , :ls_prefix , :li_postfeeacc
from lnloantype
where coop_id = :is_coopcontrol
and loantype_code = :ls_loantype
using itr_sqlca;

if trim( ls_reqdocno ) = 'Auto' then	

	if isnull( ls_document ) then ls_document =  'LNREQUESDOCNO' + ls_loangroup
	
	// ขอเลขที่ ใบคำขอกู้เงิน
	ls_reqdocno	= inv_docsrv.of_getnewdocno(ls_contcoopid, ls_document )		
	
	// จะบันทึกครั้งแรกเท่านั้น
	lds_main.setitem( 1, "entry_id", ls_entryid )
	lds_main.setitem( 1, "entry_date", ldtm_entrydate )
	lds_main.setitem( 1, "coop_id", ls_coopid )

else
	
	select count( loanrequest_docno )
	into	:li_cntchk
	from lnreqloan
	where coop_id = :is_coopid
	and loanrequest_docno = :ls_reqdocno 
	using itr_sqlca ;
	
	if isnull( li_cntchk ) then li_cntchk = 0
	
	if li_cntchk > 0 then 
		// ลบข้อมูลตารางดอกเบี้ยพิเศษ
		delete lnreqloanintspc where coop_id =:is_coopid and loanrequest_docno = :ls_reqdocno using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text = "<br/>พบขอผิดพลาด ไม่สามารถลบข้อมูลรายการดอกเบี้ยอัตราพิเศษได้(0.20)"
			ithw_exception.text += "<br/>กรุณาตรวจสอบ"
			lb_err = true ; if lb_err then Goto objdestroy
		end if
		
		// ลบข้อมูลรายการค้ำประกัน
		delete lnreqloancoll where coop_id =:is_coopid and loanrequest_docno = :ls_reqdocno using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text = "<br/>พบขอผิดพลาด ไม่สามารถลบข้อมูลรายการหลักประกันเงินกู้ได้(0.21)"
			ithw_exception.text += "<br/>กรุณาตรวจสอบ"
			lb_err = true ; if lb_err then Goto objdestroy
		end if
		
		// ลบข้อมูลรายการหักชำระิื่อื่นๆ
		delete lnreqloanclrother where coop_id =:is_coopid and loanrequest_docno = :ls_reqdocno using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text = "<br/>พบขอผิดพลาด ไม่สามารถลบข้อมูลรายการหักชำระอื่นๆได้(0.22)"
			ithw_exception.text += "<br/>กรุณาตรวจสอบ"
			lb_err = true ; if lb_err then Goto objdestroy
		end if
		
		// ลบข้อมูลรายการหักกลบ
		delete lnreqloanclr where coop_id =:is_coopid and loanrequest_docno = :ls_reqdocno using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text = "<br/>พบขอผิดพลาด ไม่สามารถลบข้อมูลสัญญาที่หักกลบได้(0.23)"
			ithw_exception.text += "<br/>กรุณาตรวจสอบ"
			lb_err = true ; if lb_err then Goto objdestroy
		end if
		
		// ลบข้อมูลใบคำขอกู้
		delete lnreqloan where coop_id =:is_coopid and loanrequest_docno = :ls_reqdocno using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text = "<br/>พบขอผิดพลาด ไม่สามารถลบข้อมูลใบคำขอกู้ได้(0.24)"
			ithw_exception.text += "<br/>กรุณาตรวจสอบ"
			lb_err = true ; if lb_err then Goto objdestroy
		end if
	else
		ithw_exception.text = "<br/>พบขอผิดพลาดใน ค้นหาใบคำขอกู้(0.30)"
		ithw_exception.text += "<br/>เลขที่ใบคำขอกู้ : " + ls_reqdocno
		ithw_exception.text += "<br/>เลขที่สมาชิก : " + ls_memno
		ithw_exception.text += "<br/>กรุณาตรวจสอบ"
		lb_err = true ; if lb_err then Goto objdestroy
	end if
	
end if

/*
if isnull( li_runauto ) then li_runauto = 0

if li_apvflag >= 1 and li_reqstatus = 8 then
	if  li_runauto = 1 then
		this.of_setsrvlnoperate( true )
		
		ls_contno		= inv_lnoperate.of_gennewcontractno(ls_contcoopid, ls_loantype )
		
		lds_main.setitem( 1, "loancontract_no", ls_contno )
		lds_main.setitem( 1, "loanrequest_status", 1 )
		lds_main.setitem( 1, "approve_id", ls_entryid )
		lds_main.setitem( 1, "approve_date", ldtm_entrydate )	
		lds_main.setitem( 1, "loanapprove_amt", ldc_reqamt )		
		//this.of_setsrvlnoperate( false )
		
	else
		ls_runing			= lds_main.object.runing_no[1]
		
		if isnull( ls_runing ) or trim( ls_runing ) = '' then
			ithw_exception.text	= "ไม่ได้ระบุเลขที่สัญญา"
			rollback using itr_sqlca ;
			throw ithw_exception				
		end if
		
		ls_runing			= right( ( '000000' + trim( ls_runing ) ), 6 )
		ls_year			= string( ( year( date( ldtm_loanrcvfix ) ) + 543 ) )
		
		// อ๊อด Hard Code
		ls_contno		= left( trim( ls_prefix ), 2 ) + right( trim( ls_year ), 2 ) + trim( ls_runing )
		
		lds_main.setitem( 1, "loancontract_no", ls_contno )
		
		ls_runing			= trim( inv_docsrv.of_incrementalfanumeric( ls_runing, 1 ) )
		
	end if
else
	if li_reqstatus = 81 then
		if li_runauto = 1 then
			this.of_setsrvlnoperate( true )
		
			ls_contno		= inv_lnoperate.of_gennewcontractno(ls_contcoopid, ls_loantype )
			if	 inv_lnoperate.of_buildcontno_reqloan( ls_reqdocno, ls_contno) = 1 then
				lds_main.setitem( 1, "loancontract_no", ls_contno )
				lds_main.setitem( 1, "loanrequest_status", 1 )
				lds_main.setitem( 1, "approve_id", ls_entryid )
				lds_main.setitem( 1, "approve_date", ldtm_entrydate )	
				lds_main.setitem( 1, "loanapprove_amt", ldc_reqamt )		
			end if
			this.of_setsrvlnoperate( false )
			
		else
			ls_runing			= lds_main.object.runing_no[1]
			
			if isnull( ls_runing ) or trim( ls_runing ) = '' then
				ithw_exception.text	= "ไม่ได้ระบุเลขที่สัญญา"
				rollback using itr_sqlca ;
				throw ithw_exception				
			end if
			
			ls_runing			= right( ( '000000' + trim( ls_runing ) ), 6 )
			ls_year			= string( ( year( date( ldtm_loanrcvfix ) ) + 543 ) )
			
			// อ๊อด Hard Code
			ls_contno		= left( trim( ls_prefix ), 2 ) + right( trim( ls_year ), 2 ) + trim( ls_runing )
			
			lds_main.setitem( 1, "loancontract_no", ls_contno )
			
			ls_runing			= trim( inv_docsrv.of_incrementalfanumeric( ls_runing, 1 ) )
			
		end if			
	end if
end if

if li_reqstatus = 11 then
	lds_main.setitem( 1, "approve_id", ls_entryid )
	lds_main.setitem( 1, "approve_date", ldtm_entrydate )	
	lds_main.setitem( 1, "loanapprove_amt", ldc_reqamt )
end if

// Service doccontrol หมดประโยชน์
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ใบคำขอกู้ ใน Main
lds_main.setitem( 1, "loanrequest_docno", ls_reqdocno )

// ใส่เลขที่ใบคำขอกู้ในรายการหักกลบ
ll_count		= lds_clear.rowcount()
for ll_index = 1 to ll_count
	lds_clear.setitem( ll_index, "coop_id", ls_coopid )
	lds_clear.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
next

// ใส่เลขที่ใบคำขอกู้ และลำดับที่ในรายการค้ำประกัน
ll_count		= lds_guarantee.rowcount()
for ll_index = 1 to ll_count
	lds_guarantee.setitem( ll_index, "coop_id", ls_coopid )
	lds_guarantee.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
	lds_guarantee.setitem( ll_index, "seq_no", ll_index )
next

// ใส่เลขที่ใบคำขอกู้ และลำดับที่ในรายการด/บพิเศษเป็นช่วง
ll_count		= lds_intspc.rowcount()
for ll_index = 1 to ll_count
	lds_intspc.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
	lds_intspc.setitem( ll_index, "seq_no", ll_index )
next

// ใส่ค่าเลขที่ใบคำขอกู้กลับสำหรับนำไปพิมพ์ใบขาว
astr_reqloan.request_no		= ls_reqdocno
astr_reqloan.loancontract_no = ls_contno
// อ๊อด Hard Code
// Insert หักชำระค่าเบี้ยประำกันในรายการหักอื่นๆ
if ldc_insurance > 0 then
	ll_insert			= lds_othclr.insertrow( 0 )
	lds_othclr.object.clrothertype_code[ll_insert]	= 'INS'
	lds_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่าเบี้ยประกัน'
	lds_othclr.object.clrother_amt[ll_insert]			= ldc_insurance
	lds_othclr.object.clear_status[ll_insert]			= 1
end if

// Insert หักชำระตัวแทนในรายการหักอื่นๆ
if ldc_agency > 0 then
	ll_insert			= lds_othclr.insertrow( 0 )
	lds_othclr.object.clrothertype_code[ll_insert]	= 'AGC'
	lds_othclr.object.clrother_desc[ll_insert]			= 'ชำระตัวแทน'
	lds_othclr.object.clrother_amt[ll_insert]			= ldc_agency
	lds_othclr.object.clear_status[ll_insert]			= 1
end if

if li_postfeeacc = 1 then
	// Insert หักชำระค่าธรรมเนียมโอนธนาคาร
	if ldc_bankfee > 0 then
		ll_insert			= lds_othclr.insertrow( 0 )
		lds_othclr.object.clrothertype_code[ll_insert]	= 'BFE'
		lds_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่าธรรมเนียมโอนธนาคาร'
		lds_othclr.object.clrother_amt[ll_insert]			= ldc_bankfee
		lds_othclr.object.clear_status[ll_insert]			= 1
	end if
	
	// Insert หักชำระค่าโอนธนาคาร
	if ldc_banksrv > 0 then
		ll_insert			= lds_othclr.insertrow( 0 )
		lds_othclr.object.clrothertype_code[ll_insert]	= 'BTR'
		lds_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่าโอนธนาคาร'
		lds_othclr.object.clrother_amt[ll_insert]			= ldc_banksrv
		lds_othclr.object.clear_status[ll_insert]			= 1
	end if
	
	// Insert หักชำระค่าธรรมเนียมธนาณัติ
	if ldc_postagefee > 0 then
		ll_insert			= lds_othclr.insertrow( 0 )
		lds_othclr.object.clrothertype_code[ll_insert]	= 'MFE'
		lds_othclr.object.clrother_desc[ll_insert]			='ชำระค่าธรรมเนียมธนาณัติ'
		lds_othclr.object.clrother_amt[ll_insert]			= ldc_postagefee
		lds_othclr.object.clear_status[ll_insert]			= 1
	end if
	
	// Insert หักชำระค่า EMS
	if ldc_emsfee > 0 then
		ll_insert			= lds_othclr.insertrow( 0 )
		lds_othclr.object.clrothertype_code[ll_insert]	= 'EMS'
		lds_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่า EMS'
		lds_othclr.object.clrother_amt[ll_insert]			= ldc_emsfee
		lds_othclr.object.clear_status[ll_insert]			= 1
	end if
	
	// Insert หักชำระค่า Online
	if ldc_onlinefee > 0 then
		ll_insert			= lds_othclr.insertrow( 0 )
		lds_othclr.object.clrothertype_code[ll_insert]	= 'ONL'
		lds_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่า ONLINE'
		lds_othclr.object.clrother_amt[ll_insert]			= ldc_onlinefee
		lds_othclr.object.clear_status[ll_insert]			= 1
	end if
	
	// Insert หักชำระค่าบริการ
	if ldc_postagesrv > 0 then
		ll_insert			= lds_othclr.insertrow( 0 )
		lds_othclr.object.clrothertype_code[ll_insert]	= 'MTR'
		lds_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่าโอนธนาณัติ'
		lds_othclr.object.clrother_amt[ll_insert]			= ldc_postagesrv
		lds_othclr.object.clear_status[ll_insert]			= 1
	end if
	
	// Insert หักชำระภาษี
	if ldc_tax > 0 then
		ll_insert			= lds_othclr.insertrow( 0 )
		lds_othclr.object.clrothertype_code[ll_insert]	= 'VAT'
		lds_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่าภาษี'
		lds_othclr.object.clrother_amt[ll_insert]			= ldc_tax
		lds_othclr.object.clear_status[ll_insert]			= 1
	end if
end if

// ใส่เลขที่ใบคำขอกู้ และลำดับที่ในรายการหักชำระอื่นๆ
lds_othclr.accepttext( )
ll_count		= lds_othclr.rowcount()
for ll_index = 1 to ll_count
	lds_othclr.setitem( ll_index, "coop_id", ls_coopid )
	lds_othclr.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
	lds_othclr.setitem( ll_index, "seq_no", ll_index )
next

// ------------------------------------------
// เริ่มกระบวนการบันทึกและถ้ามีการอนุมัติเลยก็อนุมัติ
// ------------------------------------------

// บันทึกใบคำขอ
if lds_main.rowcount() > 0 then
	if lds_main.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลใบคำขอกู้ไม่ได้"
		ithw_exception.text	+= lds_main.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

// บันทึกข้อมูลการหักกลบ
if lds_clear.rowcount() > 0 then
	if lds_clear.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลการหักกลบไม่ได้"
		ithw_exception.text	+= lds_clear.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

// บันทึกข้อมูลการค้ำประกัน
if lds_guarantee.rowcount() > 0 then
	if lds_guarantee.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลการค้ำประกันไม่ได้"
		ithw_exception.text	+= lds_guarantee.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

// บันทึกข้อมูลดอกเบี้ยอัตราพิเศษ
if lds_intspc.rowcount() > 0 then 
	if lds_intspc.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลอัตราด/บพิเศษไม่ได้"
		ithw_exception.text	+= lds_intspc.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if


if lds_othclr.rowcount() > 0 then 
	if lds_othclr.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลรายการหักอื่นๆไม่ได้"
		ithw_exception.text	+= lds_othclr.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if


//มง
//กรณีกู้เพิ่ม ให้อัฟ ยอดรอเบิกสัญญาเดิม

if li_requesttype = 2 and len(ls_contnopri) > 5   then
	update lncontmaster 
	set withdrawable_amt = :ldc_loannet, 
		loanapprove_amt = :ldc_reqamt,
		loanrequest_amt = :ldc_reqamt,
		loanrequest_docno = :ls_reqdocno
	where loancontract_no = :ls_contnopri using itr_sqlca ;

end if

if li_apvflag >= 1 and li_reqstatus = 8 and  li_runauto = 1  then
		if	 inv_lnoperate.of_buildcontno_reqloan( ls_reqdocno, ls_contno) = 1 then
				
		end if
		this.of_setsrvlnoperate( false )
end if

string		ls_colltype, ls_refdetpno
dec		ldc_activeamt
boolean	lb_error = false

// ตรวจสอบกรณีใช้เงินฝากค้ำประกันต้องนำไปอายัด
ll_count		= lds_guarantee.rowcount()

this.of_setsrvdeposit( true )
for ll_index = 1 to ll_count
	ls_colltype		= lds_guarantee.getitemstring( ll_index, "loancolltype_code" )
	ls_refdetpno		= lds_guarantee.getitemstring( ll_index, "ref_collno" )
	ldc_activeamt	= lds_guarantee.getitemdecimal( ll_index, "collactive_amt" )
	
	if ls_colltype = "03" then
		try
			inv_deptsrv.of_autosequest_loan( ls_refdetpno, ls_coopid, ldc_activeamt, ldtm_reqdate, "", ls_reqdocno, "LON" )
		catch( Exception lthw_errseq )
			ithw_exception.text	= "Auto Dept Sequest : " + ls_refdetpno + " ยอดเงิน : " + string( ldc_activeamt , "#,##0.00" ) + " " + lthw_errseq.text
			lb_error					= true
		end try
		
		if lb_error then
			this.of_setsrvdeposit( false )
			destroy lds_main
			destroy lds_clear
			destroy lds_guarantee
			destroy lds_intspc
			destroy lds_othclr
			
			throw ithw_exception
		end if
	end if
next
this.of_setsrvdeposit( false )
	
destroy lds_main
destroy lds_clear
destroy lds_guarantee
destroy lds_intspc
destroy lds_othclr

commit using itr_sqlca ;
*/
objdestroy:

this.of_setsrvdwxmlie( false )
this.of_setsrvdoccontrol( false )

if isvalid( lds_main ) then destroy lds_main
if isvalid( lds_clear ) then destroy lds_clear
if isvalid( lds_guarantee ) then destroy lds_guarantee
if isvalid( lds_intspc ) then destroy lds_intspc
if isvalid( lds_othclr ) then destroy lds_othclr

if lb_err then
	ithw_exception.text	= "n_cst_loansrv_allrequest.of_savereq_loan()" + ithw_exception.text
	rollback using itr_sqlca;
	throw ithw_exception
else
	commit using itr_sqlca;
end if

return 1
end function

public function integer of_savelncollmast_pea (ref str_lncollmast astr_collmast) throws Exception;/***********************************************************


===========================================
return type = integer
pass by = reference  ,argument type = str_lncollmast ,argument name = astr_lncollmast
Throws : Exception
=========================================

<description>
	สำหรับบันทึกรายละเอียดทะเบียนหลักทรัพย์
</description>

<arguments>  
	str_lncollmast		Structure รายการทะเบียนหลักทรัพย์
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String			ทะเบียนสมาชิกที่เป็นเจ้าของทะเบียนหลักทรัพย์
		- xml_collmastdet		String			XML รายละเอียดทะเบียนหลักทรัพย์
		- xml_collmemco		String			XML รายการผู้กู้ที่จะใช้ทะเบียนหลักทรัพย์นี้
		- entry_id				String			ผู้ทำรายการ
		- branch_id				String			สาขาที่ทำรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	ส่ง XML รายการทะเบียนหลักทรัพย์ทีเพิ่มหรือแก้ไขผ่าน Structure เข้ามา 
	ระบบจะนำข้อมูลไปบันทึกลงฐานข้อมูล
	
	str_lncollmast	lstr_lncollmast
	
	lstr_lncollmast.member_no			= dw_memdet.getitemstring( 1, "member_no" )
	
	lstr_lncollmast.xml_collmastdet		= dw_collmastdet.describe( "Datawindow.Data.XML" )
	lstr_lncollmast.xml_collmemco		= dw_collmemco.describe( "Datawindow.Data.XML" )
	lstr_lncollmast.entry_id				= entry_id
	lstr_lncollmast.branch_id				= branch_id
	
	lnv_lnoperate.of_savelncollmast( str_lncollmast )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_xmlcollmastdet, ls_xmlcollmemco, ls_mrtg1, ls_mrtg2, ls_mrtg3,ls_colltype
string		ls_collmastno, ls_collnochk, ls_updatestatus, ls_iskey, ls_colname,ls_prop,ls_xmlprop,ls_documentcode
string		ls_entryid,ls_coopid,ls_pro_code
long		ll_index, ll_count, ll_find, ll_row, ll_rowcount
integer	li_impchk
n_ds		lds_collmast, lds_collmemco, lds_mrtg1, lds_mrtg2, lds_mrtg3, lds_prop, lds_review

ls_memno			= astr_collmast.member_no
ls_xmlcollmastdet	= astr_collmast.xml_collmastdet
ls_xmlcollmemco	= astr_collmast.xml_collmemco
ls_mrtg1				= astr_collmast.xml_mrtg1
ls_mrtg2				= astr_collmast.xml_mrtg2
ls_entryid			= astr_collmast.entry_id
ls_xmlprop			= astr_collmast.xml_prop
ls_coopid			= astr_collmast.coop_id
lds_collmast		= create n_ds
lds_collmast.dataobject	= "d_loansrv_lncollmast_detail_pea"
lds_collmast.settransobject( itr_sqlca )
li_impchk			= lds_collmast.importstring( XML!, ls_xmlcollmastdet )

if li_impchk	<= 0 then
	ithw_exception.text	= "ไม่สามารถ Import String ทะเบียนหลักทรัพย์ได้ (รายละเอียด 1)"
	throw ithw_exception
end if

//ผู้กู้ร่วม
lds_collmemco		= create n_ds
lds_collmemco.dataobject	= "d_loansrv_lncollmast_memco"
lds_collmemco.settransobject( itr_sqlca )
li_impchk			= lds_collmemco.importstring( XML!, ls_xmlcollmemco )

// ตรวจแค่ว่า error หรือเปล่าก็พอ ไม่ต้องตรวจว่ามีแถวหรือไม่
if li_impchk	< 0 then
	ithw_exception.text	= "ไม่สามารถ Import String ทะเบียนกู้ร่วมได้"
	throw ithw_exception
end if

//ผู้มีกรรมสิทธิ 
lds_prop		= create n_ds
lds_prop.dataobject	= "d_loansrv_lncollmast_prop"
lds_prop.settransobject( itr_sqlca )
li_impchk			= lds_prop.importstring( XML!, ls_xmlprop )

// ตรวจแค่ว่า error หรือเปล่าก็พอ ไม่ต้องตรวจว่ามีแถวหรือไม่
if li_impchk	< 0 then
	ithw_exception.text	= "ไม่สามารถ Import String ผู้มีกรรมสิทธิ"
	throw ithw_exception
end if

// ส่วนของรายละเอียดจำนอง 1
lds_mrtg1		= create n_ds
lds_mrtg1.dataobject	= "d_loansrv_lncollmast_mrtg1_pea" //"d_ln_colldetail_msk2"  
lds_mrtg1.settransobject( itr_sqlca )
li_impchk			= lds_mrtg1.importstring( XML!, ls_mrtg1 )


if li_impchk	<= 0 then
	ithw_exception.text	= "ไม่สามารถ Import String ทะเบียนหลักทรัพย์ (รายละเอียด 2) ได้"
	throw ithw_exception
end if


// ส่วนของรายละเอียดจำนอง 2
lds_mrtg2		= create n_ds
lds_mrtg2.dataobject	= "d_loansrv_lncollmast_mrtg2"
lds_mrtg2.settransobject( itr_sqlca )
li_impchk			= lds_mrtg2.importstring( XML!, ls_mrtg2 )

if li_impchk	<= 0 then
	ithw_exception.text	= "ไม่สามารถ Import String ทะเบียนหลักทรัพย์ (ส่วนงานจำนอง 1 )ได้"
	throw ithw_exception
end if
ll_rowcount = lds_mrtg2.RowCount()
if ( ll_rowcount > 1 ) then
	lds_mrtg2.DeleteRow(1)
end if
ls_collmastno		= trim( lds_collmast.getitemstring( 1, "collmast_no" ) )
ls_colltype			=  lds_collmast.getitemstring( 1, "collmasttype_code" ) 

// ถ้าไม่มีทะเบียนหลักทรัพย์มาแสดงว่าเป็นการเพิ่ม
if ls_collmastno = "" or isnull( ls_collmastno ) or lower( ls_collmastno ) = "auto"   or len( ls_collmastno )  < 5  then
	this.of_setsrvdoccontrol( true )
	select document_code 
	into :ls_documentcode
	from lnucfcollmasttype 
	where collmasttype_code = :ls_colltype using itr_sqlca;
	
	ls_collmastno		= inv_docsrv.of_getnewdocno(ls_coopid, ls_documentcode )
	this.of_setsrvdoccontrol( false )
	lds_collmast.setitem( 1, "coop_id", ls_coopid )
	lds_collmast.setitem( 1, "collmast_no", ls_collmastno )
	lds_collmast.setitem( 1, "collmast_no", ls_collmastno )
	lds_collmast.setitem( 1, "member_no", ls_memno )
	ls_updatestatus		= "NEW"
else
	ls_updatestatus		= "MODIFY"
end if

// ตรวจว่ามีทะเบียนสมาชิกใน MemCo หรือเปล่า
//ll_count	= lds_collmemco.rowcount()
//ll_find		= lds_collmemco.find( "memco_no = '"+ls_memno+"'", 1, ll_count )
//
//if ll_count <= 0 or ll_find <= 0 then
//	ll_row		= lds_collmemco.insertrow( 0 )
//	
//	lds_collmemco.setitem( ll_row, "coop_id", ls_coopid )
//	lds_collmemco.setitem( ll_row, "memco_no", ls_memno )
//	lds_collmemco.setitem( ll_row, "collmastmain_flag", 1 )
//end if

// ใส่ทะเบียนเลขที่หลักทรัพย์
ll_count	= lds_collmemco.rowcount()
for ll_index = 1 to ll_count
	lds_collmemco.setitem(ll_index, "collmast_no", ls_collmastno )
	lds_collmemco.setitem(ll_index, "coop_id", ls_coopid )
	lds_collmemco.setitem(ll_index, "memcoop_id", ls_coopid )
next

// ใส่ผู้มีกรรมสิทธิ
ll_count	= lds_prop.rowcount()
for ll_index = 1 to ll_count
	lds_prop.setitem(ll_index, "collmast_no", ls_collmastno )
	lds_prop.setitem(ll_index, "coop_id", ls_coopid )
	lds_prop.setitem(ll_index, "seq_no", ll_index )
next

// ใส่ทะเบียนเลขที่หลักทรัพย์ในส่วนงานจำนอง
lds_mrtg1.setitem( 1, "collmast_no", ls_collmastno )
lds_mrtg1.setitem( 1, "coop_id", ls_coopid )

// -----------------------
// เริ่มกระบวนการบันทึก
// -----------------------

//// ถ้าเป็นการ Modify ของเก่า
//if ls_updatestatus = "MODIFY" then
//	// ลบ Memco ของเก่าทิ้งก่อน
//	delete from lncollmastmemco
//	where	( collmast_no	= :ls_collmastno ) 
//	using		itr_sqlca ;
//	
//	
//	// ปรับ Attrib ทุก Column ให้เป็น Update ซะ
//	this.of_setdsmodify( lds_collmast, 1, false )
//	
//end if
//
// ลบส่วนการพิมพ์จำนองทิ้งไปก่อน


delete from lncolldetail
where	( collmast_no	= :ls_collmastno )
using		itr_sqlca ;

delete from lncollmastmemco
where	( collmast_no	= :ls_collmastno )
using		itr_sqlca ;

delete from lncollmastprop
where	( collmast_no	= :ls_collmastno )
using		itr_sqlca ;

delete from lncollmaster
where	( collmast_no	= :ls_collmastno )
using		itr_sqlca ;	

// งานจำนอง 1 เป็นการ insert เสมอไม่ต้องปรับ attrib 
// ส่วนงานจำนองส่วน 2-3 เป็นการ Update ต้องปรับ Attrib ให้เป็น Update

//this.of_setdsmodify( lds_mrtg2, 1, false )
//this.of_setdsmodify( lds_mrtg3, 1, false )



// บันทึก Master
if lds_collmast.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลทะเบียนหลักทรัพย์ (CollMaster) ไม่ได้  "
	ithw_exception.text	+= ls_collmastno +"  "+ lds_collmast.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
	return -1
end if

lds_mrtg2.AcceptText()
 string  mrtg_memberno = lds_mrtg2.object.mrtg_memberno[ll_rowcount]
 string  mrtg_name = lds_mrtg2.object.mrtg_name[ll_rowcount]
 string  mrtg_age = lds_mrtg2.object.mrtg_age[ll_rowcount]
 string  mrtg_parentname = lds_mrtg2.object.mrtg_parentname[ll_rowcount]
  string  landdepartment_province = lds_mrtg2.object.landdepartment_province[ll_rowcount]
  /*
lds_mrtg1.object.mrtg_memberno[1]			= mrtg_memberno // lds_mrtg2.object.mrtg_memberno[ll_rowcount]
lds_mrtg1.object.mrtg_name[1]				= mrtg_name // lds_mrtg2.object.mrtg_name[ll_rowcount]
lds_mrtg1.object.mrtg_personid[1]			= lds_mrtg2.object.mrtg_personid[ll_rowcount]
lds_mrtg1.object.mrtg_age[1]					=  mrtg_age //lds_mrtg2.object.mrtg_age[ll_rowcount]
lds_mrtg1.object.mrtg_nationality[1]			= lds_mrtg2.object.mrtg_nationality[ll_rowcount]
lds_mrtg1.object.mrtg_citizenship[1]			= lds_mrtg2.object.mrtg_citizenship[ll_rowcount]
lds_mrtg1.object.mrtg_parentname[1]		=  mrtg_parentname //lds_mrtg2.object.mrtg_parentname[ll_rowcount]
lds_mrtg1.object.mrtg_matename[1]			= lds_mrtg2.object.mrtg_matename[ll_rowcount]
lds_mrtg1.object.mrtg_village[1]				= lds_mrtg2.object.mrtg_village[ll_rowcount]
lds_mrtg1.object.mrtg_address[1]				= lds_mrtg2.object.mrtg_address[ll_rowcount]
lds_mrtg1.object.mrtg_moo[1]					= lds_mrtg2.object.mrtg_moo[ll_rowcount]
lds_mrtg1.object.mrtg_soi[1]					= lds_mrtg2.object.mrtg_soi[ll_rowcount]
lds_mrtg1.object.mrtg_road[1]					= lds_mrtg2.object.mrtg_road[ll_rowcount]
lds_mrtg1.object.mrtg_tumbol[1]				= lds_mrtg2.object.mrtg_tumbol[ll_rowcount]
lds_mrtg1.object.mrtg_district[1]				= lds_mrtg2.object.mrtg_district[ll_rowcount]
lds_mrtg1.object.mrtg_province[1]			= lds_mrtg2.object.mrtg_province[ll_rowcount]
lds_mrtg1.object.mrtg_tel[1]					= lds_mrtg2.object.mrtg_tel[ll_rowcount]
lds_mrtg1.object.mrtg_mariage[1]			= lds_mrtg2.object.mrtg_mariage[ll_rowcount]
lds_mrtg1.object.autrz_name01[1]			= lds_mrtg2.object.autrz_name01[ll_rowcount]
lds_mrtg1.object.autrz_age[1]			= lds_mrtg2.object.autrz_age[ll_rowcount]
lds_mrtg1.object.autrz_name02[1]			= lds_mrtg2.object.autrz_name02[ll_rowcount]
lds_mrtg1.object.autrz_name03[1]			= lds_mrtg2.object.autrz_name03[ll_rowcount]
lds_mrtg1.object.autrz_pos01[1]				= lds_mrtg2.object.autrz_pos01[ll_rowcount]
lds_mrtg1.object.autrz_pos02[1]				= lds_mrtg2.object.autrz_pos02[ll_rowcount]
lds_mrtg1.object.autrz_age[1]					= lds_mrtg2.object.autrz_age[ll_rowcount]
lds_mrtg1.object.autrz_nationality[1]			= lds_mrtg2.object.autrz_nationality[ll_rowcount]
lds_mrtg1.object.autrz_citizenship[1]			= lds_mrtg2.object.autrz_citizenship[ll_rowcount]
lds_mrtg1.object.autrz_parentname[1]		= lds_mrtg2.object.autrz_parentname[ll_rowcount]
lds_mrtg1.object.autrz_village[1]				= lds_mrtg2.object.autrz_village[ll_rowcount]
lds_mrtg1.object.autrz_address[1]			= lds_mrtg2.object.autrz_address[ll_rowcount]
lds_mrtg1.object.autrz_moo[1]					= lds_mrtg2.object.autrz_moo[ll_rowcount]
lds_mrtg1.object.autrz_soi[1]					= lds_mrtg2.object.autrz_soi[ll_rowcount]
lds_mrtg1.object.autrz_road[1]					= lds_mrtg2.object.autrz_road[ll_rowcount]
lds_mrtg1.object.autrz_tumbol[1]				= lds_mrtg2.object.autrz_tumbol[ll_rowcount]
lds_mrtg1.object.autrz_district[1]				= lds_mrtg2.object.autrz_district[ll_rowcount]
lds_mrtg1.object.autrz_province[1]			= lds_mrtg2.object.autrz_province[ll_rowcount]
lds_mrtg1.object.autrz_cardperson[1]			= lds_mrtg2.object.autrz_cardperson[ll_rowcount]
lds_mrtg1.object.landdepartment_province[1]			= landdepartment_province // lds_mrtg2.object.landdepartment_province[ll_rowcount]
*/
/* ของ สุรินทร์ไม่ได้ใช้
lds_mrtg1.object.landcount[1]							= lds_mrtg3.object.landcount[1]
lds_mrtg1.object.landdepartment[1]					= lds_mrtg3.object.landdepartment[1]
lds_mrtg1.object.mortgage_date[1]					= lds_mrtg3.object.mortgage_date[1]
lds_mrtg1.object.mortgage_count[1]					= lds_mrtg3.object.mortgage_count[1]
lds_mrtg1.object.this_mrtg_amt[1]					= lds_mrtg3.object.this_mrtg_amt[1]
lds_mrtg1.object.old_mrtg_amt[1]						= lds_mrtg3.object.old_mrtg_amt[1]
lds_mrtg1.object.first_mrtg_amt[1]					= lds_mrtg3.object.first_mrtg_amt[1]
lds_mrtg1.object.secound_mrtg_amt[1]				= lds_mrtg3.object.secound_mrtg_amt[1]
lds_mrtg1.object.total_mrtg_amt[1]					= lds_mrtg3.object.total_mrtg_amt[1]
lds_mrtg1.object.interest_rate[1]						= lds_mrtg3.object.interest_rate[1]
lds_mrtg1.object.landdepartment_province[1]		= lds_mrtg3.object.landdepartment_province[1]
lds_mrtg1.object.duplicate_count[1]					= lds_mrtg3.object.duplicate_count[1]
*/
lds_mrtg1.AcceptText()
if lds_mrtg1.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลทะเบียนหลักทรัพย์ (รายละเอียด 1) ไม่ได้  "
		ithw_exception.text	+= ls_collmastno +"  "+ lds_mrtg1.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
end if

// บันทึก Memco
if lds_collmemco.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลรายการผู้กู้ร่วม (MemCo) ไม่ได้  "
	ithw_exception.text	+= ls_collmastno +"  "+ lds_collmemco.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
	return -1
end if
// บันทึก Prop
if lds_prop.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลผู้มีกรรมสิทธิ ไม่ได้  "
	ithw_exception.text	+= ls_collmastno +"  "+ lds_prop.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
	return -1
end if
commit using itr_sqlca ;

astr_collmast.xml_collmastdet	= lds_collmast.describe( "Datawindow.Data.XML" )
astr_collmast.xml_collmemco	= lds_collmemco.describe( "Datawindow.Data.XML" )
astr_collmast.xml_mrtg1			= lds_mrtg1.describe( "Datawindow.Data.XML" )
astr_collmast.xml_mrtg2			= lds_mrtg2.describe( "Datawindow.Data.XML" )
astr_collmast.xml_prop			= lds_prop.describe( "Datawindow.Data.XML" )
//astr_collmast.xml_mrtg3			= lds_mrtg3.describe( "Datawindow.Data.XML" )
//astr_collmast.xml_prop			= lds_prop.describe( "Datawindow.Data.XML" )

destroy lds_collmast
destroy lds_mrtg1
destroy lds_mrtg2
//destroy lds_mrtg3
destroy lds_collmemco
destroy lds_prop
return 1
end function

public function integer of_initreq_lnpause_lawer (ref str_lnpause astr_lnpause) throws Exception;/***********************************************************
/////////////////// สำหรับนิติกร //////////////////
<description>
	สำหรับ Init รายการเงินกู้ที่จะทำการงดกู้เงินหรือให้กู้เงินต่อของสมาชิกที่ส่งทะเบียนเข้ามา (ได้ค่า XML กลับไป)
</description>

<arguments>  
	str_lnpause{ref}		Structure รายการงดกู้เงินบางประเภทหรือให้กู้เงินต่อ
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no		String			ทะเบียนสมาชิก
		- loanpause_date	datetime		วันที่ทำรายการ
</arguments>

<return> 
	Integer
	1			ถ้าไม่มีข้อผิดพลาด
</return> 
***********************************************************/
string		ls_memno, ls_loantype, ls_desc, ls_prefix, ls_pausecode,ls_pauseloan_cause
long		ll_index, ll_count, ll_row, ll_find, ll_cntpause
int			int_lawerflag
datetime	ldtm_pause
n_ds		lds_master, lds_detail
int li_lawerflag 
string ls_check
ls_memno		= astr_lnpause.member_no
ldtm_pause		= astr_lnpause.loanpause_date

ll_count		= ids_infomemdet.retrieve( is_coopcontrol, ls_memno  )
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลทะเบียนสมาชิกที่ส่งเข้ามา ทะเบียนเลขที่ " + ls_memno + "' กรุณาตรวจสอบ"
	throw ithw_exception
end if
select max(lawer_flag) , max(pauseloan_docno)  
into  :li_lawerflag ,:ls_check
from lnmembpauseloan 
where member_no=:ls_memno 
//and pauseloan_cause is not null and trim(pauseloan_cause) <>'' 
and ( coop_id		= :is_coopcontrol )
using		itr_sqlca ;
//if IsNull(li_lawerflag) then li_lawerflag = 0
if IsNull(ls_check) then ls_check = ""

if li_lawerflag = 0 and  ls_check  <> "" then
	ithw_exception.text	= " ทะเบียนเลขที่ " + ls_memno + "' ห้ามกู้จากฝ่ายสินเชื่อ กรุณาตรวจสอบ"
	throw ithw_exception
end if
lds_master	= create n_ds
lds_master.dataobject	= "d_loansrv_req_loanpause"

lds_detail	= create n_ds
lds_detail.dataobject		= "d_loansrv_req_loanpausedet"

lds_master.insertrow( 0 )

lds_master.setitem( 1, "memcoop_id", is_coopcontrol )
lds_master.setitem( 1, "member_no", ls_memno )
lds_master.setitem( 1, "pauseloan_date", ldtm_pause )

lds_master.object.prename_desc[ 1 ]			= ids_infomemdet.object.prename_desc[ 1 ]
lds_master.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ 1 ]
lds_master.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ 1 ]
lds_master.object.membgroup_code[ 1 ]	= ids_infomemdet.object.membgroup_code[ 1 ]
lds_master.object.membgroup_desc[ 1 ]		= ids_infomemdet.object.membgroup_desc[ 1 ]

// ดึงข้อมูลเงินกู้ที่มีทั้งหมด
ls_pausecode	= "NML"

declare loanlist_cur cursor for
select		loantype_code, loantype_desc, prefix
from		lnloantype
where	( coop_id		= :is_coopcontrol )
order by	loantype_code
using		itr_sqlca ;

open loanlist_cur ;
fetch loanlist_cur into :ls_loantype, :ls_desc, :ls_prefix ;
do while itr_sqlca.sqlcode = 0
	ll_row		= lds_detail.insertrow( 0 )
	
	lds_detail.setitem( ll_row, "loantype_code", ls_loantype )
	lds_detail.setitem( ll_row, "loantype_desc", ls_desc )
	lds_detail.setitem( ll_row, "prefix", ls_prefix )
	lds_detail.setitem( ll_row, "operate_old", ls_pausecode )
	lds_detail.setitem( ll_row, "operate_code", ls_pausecode )
	
	fetch loanlist_cur into :ls_loantype, :ls_desc, :ls_prefix ;
loop
close loanlist_cur ;

// ดึงข้อมูลเงินกู้ที่ถูกงดกู้
ls_pausecode	= "PUS"
declare pauselist_cur cursor for
select		loantype_code,pauseloan_cause
from		lnmembpauseloan
where	( coop_id			= :is_coopcontrol )
and		( member_no	= :ls_memno )
using		itr_sqlca ;

open pauselist_cur ;
fetch pauselist_cur into :ls_loantype ,:ls_pauseloan_cause;
do while itr_sqlca.sqlcode = 0
	ll_find			= lds_detail.find( "loantype_code = '"+ls_loantype+"'", 1, lds_detail.rowcount() )
	if ll_find > 0 then
		lds_detail.setitem( ll_find, "operate_old", ls_pausecode )
		lds_detail.setitem( ll_find, "operate_code", ls_pausecode )
	end if
	
	fetch pauselist_cur into :ls_loantype ,:ls_pauseloan_cause ;
loop
close pauselist_cur ;
lds_master.SetItem(1,"pauseloan_cause",ls_pauseloan_cause)
astr_lnpause.xml_pause		= inv_dwxmliesrv.of_xmlexport( lds_master )
astr_lnpause.xml_pausedet	= inv_dwxmliesrv.of_xmlexport( lds_detail )

destroy lds_master ;
destroy lds_detail ;

return 1
end function

public function integer of_savereq_lnpause_lawer (ref str_lnpause lstr_lnpause) throws Exception;/***********************************************************
///////////// สำหรับนิติกร //////////////////////////
<description>
	สำหรับบันทึกและทำรายการห้ามกู้เงินบางประเภท
</description>
    
<arguments>  
	str_lnpause		Structure รายการ ห้ามกู้เงินบางประเภท
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_pause			String			XML เหตุผลที่งดกู้เงินหรือให้กู้เงินต่อ
		- xml_pausedet		String			XML รายการเงินกู้ที่ทำการงดหรือให้กู้ต่อ
		- entry_id			string			ผู้ทำรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 
***********************************************************/
string		ls_pausedocno, ls_memno, ls_loantype, ls_opecode, ls_cause, ls_entryid
long		ll_index, ll_count
boolean	lb_error = false
int		int_lawerflag
datetime	ldtm_pausedate, ldtm_entrydate
n_ds		lds_master, lds_detail

ls_entryid			= lstr_lnpause.entry_id
ldtm_entrydate		= datetime( today(), now() )
	int_lawerflag	= 1  //สำหรับนิติกร
lds_master	= create n_ds
lds_master.dataobject	= "d_loansrv_req_loanpause"
lds_master.settransobject( itr_sqlca )

lds_detail	= create n_ds
lds_detail.dataobject		= "d_loansrv_req_loanpausedet"
lds_detail.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( lds_master, lstr_lnpause.xml_pause )
inv_dwxmliesrv.of_xmlimport( lds_detail, lstr_lnpause.xml_pausedet )

// ลบพวกไม่มีการทำรายการออก
lds_detail.setfilter( "operate_code <> operate_old" )
lds_detail.filter()

if lds_detail.filteredcount() > 0 then
	lds_detail.rowsdiscard( 1, lds_detail.filteredcount(), filter! )
end if

// ตรวจว่ามีการทำรายการหรือเปล่า
ll_count	= lds_detail.rowcount()
if ll_count <= 0  then
	if lds_master.rowcount() > 0 then
		goto uplnpausecause
	end if
	ithw_exception.text	= "ไม่พบว่ามีการทำรายการห้ามกู้หรือให้กู้ต่อ กรุณาตรวจสอบ"
	lb_error					= true
	goto objdestroy
end if

// ขอเลขที่เอกสาร
this.of_setsrvdoccontrol( true )
ls_pausedocno	= inv_docsrv.of_getnewdocno( is_coopcontrol, "LNPAUSELOAN" )
this.of_setsrvdoccontrol( false )

// ให้ค่าเลขที่เอกสาร
lds_master.setitem( 1, "coop_id", is_coopcontrol )
lds_master.setitem( 1, "pauseloan_docno", ls_pausedocno )
lds_master.setitem( 1, "entry_id", ls_entryid )
lds_master.setitem( 1, "entry_date", ldtm_entrydate )
lds_master.setitem( 1, "entry_bycoopid", is_coopid )

// ใส่เลขที่เอกสารและลำดับที่ใน detail
for ll_index = 1 to ll_count
	lds_detail.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_detail.setitem( ll_index, "pauseloan_docno", ls_pausedocno )
next

// -----------------------
// เริ่มกระบวนการบันทึก
// -----------------------
// บันทึก Master
if lds_master.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลการห้ามกู้ (PauseLoan Master) ไม่ได้  "
	ithw_exception.text	+= ls_pausedocno +"  "+ lds_master.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// บันทึก Detail
if lds_detail.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล รายการห้ามกู้หรือให้กู้ต่อ (PauseLoan Detail) ไม่ได้  "
	ithw_exception.text	+= ls_pausedocno +"  "+ lds_detail.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

ls_memno			= lds_master.getitemstring( 1, "member_no" )
ls_cause				= lds_master.getitemstring( 1, "pauseloan_cause" )
ldtm_pausedate	= lds_master.getitemdatetime( 1, "pauseloan_date" )

// ปรับปรุงข้อมูลการห้ามกู้
for ll_index = 1 to ll_count
	ls_opecode		= lds_detail.getitemstring( ll_index, "operate_code" )
	ls_loantype		= lds_detail.getitemstring( ll_index, "loantype_code" )
	if ls_opecode = "NML" then
		delete from lnmembpauseloan
		where	( coop_id				= :is_coopcontrol )
		and		( member_no		= :ls_memno )
		and		( loantype_code	= :ls_loantype )
		using		itr_sqlca ;
		
		UPDATE mbmembmaster
		SET remark = :ls_cause
		where	( member_no		= :ls_memno )
		//and		( lawer_flag	= :int_lawerflag )
		using		itr_sqlca ;
	else
		insert into lnmembpauseloan
					( coop_id, member_no, loantype_code, pauseloan_docno, pauseloan_date, pauseloan_cause, entry_id, entry_bycoopid, lawer_flag )
		values	( :is_coopcontrol, :ls_memno, :ls_loantype, :ls_pausedocno, :ldtm_pausedate, :ls_cause, :ls_entryid, :is_coopid, :int_lawerflag )
		using		itr_sqlca ;
			
		UPDATE mbmembmaster
		SET remark = :ls_cause
		where	( member_no		= :ls_memno )
		//and		( lawer_flag	= :int_lawerflag )
		using		itr_sqlca ;
	
	end if
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ผิดพลาด!!! ไม่สามารถปรับปรุงการห้ามกู้หรือให้กู้ต่อได้ รหัสประเภทเงินกู้ "+ls_loantype+"~n~r"+itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
next


objdestroy:
destroy lds_master
destroy lds_detail

uplnpausecause:
ls_memno			= lds_master.getitemstring( 1, "member_no" )
ls_cause				= lds_master.getitemstring( 1, "pauseloan_cause" )
ldtm_pausedate	= lds_master.getitemdatetime( 1, "pauseloan_date" )
//for ll_index = 1 to ll_count	
	//ls_loantype		= lds_detail.getitemstring( ll_index, "loantype_code" )
	UPDATE lnmembpauseloan
	SET pauseloan_cause = :ls_cause
	where		( member_no		= :ls_memno )
		and		( lawer_flag	= :int_lawerflag )
		using		itr_sqlca ;	
//next
	UPDATE lnreqpauseloan
	SET pauseloan_cause = :ls_cause
	where	( member_no		= :ls_memno )
	and		( lawer_flag	= :int_lawerflag )
		using		itr_sqlca ;
		
	UPDATE mbmembmaster
	SET remark = :ls_cause
	where	( member_no		= :ls_memno )
	//and		( lawer_flag	= :int_lawerflag )
	using		itr_sqlca ;	
	
if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

on n_cst_loansrv_allrequest.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_loansrv_allrequest.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;destroy ids_infocont
destroy ids_infomemdet

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
