$PBExportHeader$n_cst_insurance_slip.sru
forward
global type n_cst_insurance_slip from nonvisualobject
end type
end forward

global type n_cst_insurance_slip from nonvisualobject
end type
global n_cst_insurance_slip n_cst_insurance_slip

type variables

n_ds		ids_loandata, ids_contintspc, ids_inttable
n_ds		ids_constant

n_cst_dbconnectservice		inv_transection
n_cst_loansrv_interest		inv_intsrv
n_cst_progresscontrol		inv_progress
n_cst_doccontrolservice		inv_docsrv
n_cst_dwxmlieservice				inv_dwxmliesrv
transaction	itr_sqlca
Exception	ithw_exception
end variables

forward prototypes
public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans)
public function integer of_xmlimport (n_ds ads_info, string as_dwobjname, string as_xmlinfo)
public function string of_xmlexport (n_ds ads_info)
public function string of_get_insreceive (string as_period)
public function integer of_setsrvdoccontrol (boolean ab_switch)
public function integer of_print_slippayin (string as_slipno, string as_formset) throws Exception
public function integer of_print_slippayin_tax (string as_slipno, string as_formset) throws Exception
public function string of_init_setinitinfoslip (string as_memno) throws Exception
public function string of_init_setinitmbinfo (string as_memno, string as_xmalmain) throws Exception
public function string of_set_membnoformat (string as_memno) throws Exception
public function integer of_insslip_dwetcitemchanged (ref string as_xmlslipmain, ref string as_xmlslipdet) throws Exception
public function integer of_postsave_slipins (ref str_ins_slippayin astr_inslippayin) throws Exception
public function integer of_setsrvdwxmlie (boolean ab_switch)
end prototypes

public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans);/***********************************************************
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

if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection = create n_cst_dbconnectservice
	inv_transection = atr_dbtrans
end if
itr_sqlca = atr_dbtrans.itr_dbconnection


return 1
end function

public function integer of_xmlimport (n_ds ads_info, string as_dwobjname, string as_xmlinfo);/***********************************************************
<description>
	Import Xml
</description>

<arguments>  
	ads_info				n_ds		datastore ที่จะ import ข้อมูลเข้า
	as_dwobjname		String		ชื่อ dw object
	as_xmlinfo			String		ข้อมูลในรูปแบบ xml ที่ต้องการ import
</arguments> 

<return> 
	Integer	 	จำนวนแถวที่ import ได้
					-1   No rows or startrow value supplied is greater than the number of rows in the string
					-3   Invalid argument
					-4   Invalid input
					-11   XML Parsing Error; XML parser libraries not found or XML not well formed
					-12   XML Template does not exist or does not match the DataWindow
					-13    Unsupported DataWindow style for import
					-14    Error resolving DataWindow nesting
</return> 

<usage> 
	Revision History:
	Version 1.0 (Initial version) Modified Date 13/10/2010 by MiT
</usage> 
***********************************************************/
integer	li_row

if not isvalid( ads_info ) or isnull( ads_info ) then
	ads_info = create n_ds
end if

ads_info.dataobject = as_dwobjname
ads_info.settransobject( itr_sqlca )

if ( as_xmlinfo = "" ) then return 0

li_row = ads_info.importstring( XML!, as_xmlinfo )

return li_row
end function

public function string of_xmlexport (n_ds ads_info);/***********************************************************
<description>
	Export xml เข้าสู่ datastore
</description>

<arguments>  
	ads_info				n_ds		datastore ที่จะ export ข้อมูล
</arguments> 

<return> 
	String		 	xml ที่ export ได้
</return> 

<usage> 
	Revision History:
	Version 1.0 (Initial version) Modified Date 13/10/2010 by MiT
</usage> 
***********************************************************/
string		ls_xml

if ( ads_info.rowcount() > 0 ) then
	ls_xml = string( ads_info.describe( "Datawindow.data.XML" ) )
else
	ls_xml = ""
end if

return ls_xml
end function

public function string of_get_insreceive (string as_period);
string		ls_return

n_ds		lds_recv
lds_recv	= create n_ds
lds_recv.dataobject	= "d_ins_receive_master"
lds_recv.settransobject( itr_sqlca )

long		ll_currentrow , ll_rowcount

ll_rowcount		= lds_recv.retrieve( as_period )

ls_return			= this.of_xmlexport( lds_recv )

return ls_return
end function

public function integer of_setsrvdoccontrol (boolean ab_switch);// Check argument
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

public function integer of_print_slippayin (string as_slipno, string as_formset) throws Exception;/***********************************************
<description>
	Print ใบเสร็จรับเงิน
</description>

<arguments>
    as_slipno					เลขที่สลิป
	as_formset				ฟอร์ม Set การพิมพ์	
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
    n_cst_loansrv_print  lnv_lnprint
	
	Integer 	li_return
	String 	ls_slipno , ls_formset 
	
	li_return = lnv_lnprint.of_print_slippayin( ls_slipno, ls_formset )
	
	Initial version Modified Date 28/03/2011 by POm
</usage>
************************************************/
n_ds	lds_slip

n_cst_printservice			lnv_print_srv
lnv_print_srv 	= create n_cst_printservice 

lnv_print_srv.of_reloadsetting( )

integer li_count
string  as_listslip[]

n_cst_stringservice			lnv_string_srv
lnv_string_srv 	= create n_cst_stringservice 

//lnv_string_srv.of_analyzestring(as_slipno ,as_listslip[])


lds_slip = create n_ds
lds_slip.dataobject = "d_shrln_printslip"
lds_slip.settransobject( itr_sqlca )

li_count  =lds_slip.retrieve( as_slipno  )
if li_count  > 0 then
	lnv_print_srv.of_print( lds_slip , "SLIPPAYIN" , as_formset  )
else
	ithw_exception.text	= "ไม่มีข้อมูลสำหรับพิมพ์"
	throw ithw_exception
end if
	
return 1
end function

public function integer of_print_slippayin_tax (string as_slipno, string as_formset) throws Exception;/***********************************************
<description>
	Print ใบเสร็จรับเงิน
</description>

<arguments>
    as_slipno					เลขที่สลิป
	as_formset				ฟอร์ม Set การพิมพ์	
</arguments>

<return>
	Integer		คืนค่ากลับเป็น 1 ในกรณีปกติ, หากมีข้อผิดพลาดคืนค่าเป็น -1
</return>

<usage>
    n_cst_loansrv_print  lnv_lnprint
	
	Integer 	li_return
	String 	ls_slipno , ls_formset 
	
	li_return = lnv_lnprint.of_print_slippayin( ls_slipno, ls_formset )
	
	Initial version Modified Date 28/03/2011 by POm
</usage>
************************************************/
n_ds	lds_slip

n_cst_printservice			lnv_print_srv
lnv_print_srv 	= create n_cst_printservice 

lnv_print_srv.of_reloadsetting( )

integer li_count
string  as_listslip[]

n_cst_stringservice			lnv_string_srv
lnv_string_srv 	= create n_cst_stringservice 


lds_slip = create n_ds
lds_slip.dataobject = "d_shrln_printslip_tax"
lds_slip.settransobject( itr_sqlca )

li_count  =lds_slip.retrieve( as_slipno  )
if li_count  > 0 then
	lnv_print_srv.of_print( lds_slip , "SLIPPAYIN_TAX" , as_formset  )
else
	ithw_exception.text	= "ไม่มีข้อมูลสำหรับพิมพ์"
	throw ithw_exception
end if
	
return 1
end function

public function string of_init_setinitinfoslip (string as_memno) throws Exception;/*
of_init_setinitinfoslip init รายงานประกันชีวิต
as_memno เลขที่สมาชิก
ans_xmlinfo xml รายการประกัน
return string xml
*/
string		ls_return, ls_instypecode,ls_insgroupdocno, ls_mbtype,ls_insdesc, ls_xmlexport,ls_memno
long		ll_row , ll_rowcount , ll_insid, li_krow,ll_insgroupid
string		ls_membno , ls_prename , ls_name , ls_sname , ls_insname , ls_level, ls_desc
dec{2}	ldc_loan , ldc_extra , ldc_insblanc , ldc_insamt , ldc_ins, ldc_inspayment, ldc_inspayarrear, ldc_inspayarrearmth, ldc_rkeepins
datetime	ldtm_approve

n_ds		lds_insinfo, lds_etc

lds_insinfo	= create n_ds
lds_insinfo.dataobject	= "d_ins_master_info_list"
lds_insinfo.settransobject( itr_sqlca )

lds_etc	= create n_ds
lds_etc.dataobject	= "d_ins_slip_payindet"
lds_etc.settransobject( itr_sqlca )
ls_memno =  as_memno
ls_memno = this.of_set_membnoformat(ls_memno)
ll_rowcount	= lds_insinfo.retrieve( ls_memno )
if ll_rowcount <= 0 then
	lds_insinfo.insertrow(0)
	ithw_exception.text = "ไม่พบข้อมูลประกันชีวิต "
	throw ithw_exception
	
end if
for ll_row = 1 to ll_rowcount
	
	ll_insgroupid 				= lds_insinfo.getitemnumber( ll_row,"insgroup_id")
	ls_instypecode 			= lds_insinfo.getitemstring( ll_row,"instype_code")
	ls_insdesc				= trim( lds_insinfo.getitemstring( ll_row,"short_desc"))
	ls_mbtype					= trim( lds_insinfo.getitemstring( ll_row,"insmemb_desc"))
	ls_insgroupdocno 		=  lds_insinfo.getitemstring( ll_row,"insgroupdoc_no")
	ldc_inspayment			= lds_insinfo.getitemdecimal( ll_row,"inspayment_amt")
	ldc_inspayarrear			= lds_insinfo.getitemdecimal( ll_row,"inspayment_arrear")
	ldc_inspayarrearmth		= lds_insinfo.getitemdecimal( ll_row,"insarrear_month")
	ldc_rkeepins				= lds_insinfo.getitemdecimal( ll_row,"rkeep_insvalue")
	ls_desc 	 = ls_insdesc + ' ' +  ls_mbtype
	
	li_krow = lds_etc.insertrow(0)
	
	lds_etc.setitem( li_krow,"seq_no", li_krow )
	lds_etc.setitem( li_krow,"shrlontype_code",ls_instypecode )
	lds_etc.setitem( li_krow,"slipitemtype_code",'INS' )
	lds_etc.setitem( li_krow,"loancontract_no",ls_insgroupdocno )
	lds_etc.setitem( li_krow,"slipitem_desc", ls_desc )
	lds_etc.setitem( li_krow,"bfshrcont_balamt", ldc_inspayarrear  )
	lds_etc.setitem( li_krow,"bfintarr_amt", ldc_inspayarrearmth )
	lds_etc.setitem( li_krow,"item_balance",  ldc_inspayarrear )
	lds_etc.setitem( li_krow,"rkeep_principal", ldc_rkeepins )
	lds_etc.setitem( li_krow,"bfwithdraw_amt",ll_insgroupid  )
	//lds_etc.setitem( li_krow,"bfperiod_payamt",ll_insgroupid  )
next

ls_xmlexport = this.of_xmlexport( lds_etc )

return		ls_xmlexport
end function

public function string of_init_setinitmbinfo (string as_memno, string as_xmalmain) throws Exception;/*
of_init_setinitmbinfo init รายงานประกันชีวิต
as_memno เลขที่สมาชิก
ans_xmlinfo xml รายการประกัน

*/
string		ls_return, ls_instypecode,ls_insgroupdocno, ls_mbtype,ls_insdesc,ls_xmlexport,ls_fname,ls_lname
string 		ls_groupcode, ls_groupdesc,ls_memno
long		ll_row , ll_rowcount , ll_insid, li_krow,ll_insgroupid
string		ls_membno , ls_prename , ls_name , ls_sname , ls_insname , ls_level, ls_desc
dec{2}		ldc_sharestkval, ldc_accumint
datetime	ldtm_operate, ldtm_slip,ls_entryid
integer  li_mbrow
n_ds		lds_mbinfo, lds_main

lds_mbinfo	= create n_ds
lds_mbinfo.dataobject	= "d_ins_memb_detail_info"
lds_mbinfo.settransobject( itr_sqlca )

lds_main	= create n_ds
lds_main.dataobject	= "d_inssrv_payin_slip_main"
//lds_main.settransobject( itr_sqlca )
lds_main.importstring( XML!, as_xmalmain )

li_mbrow = lds_main.rowcount()

ldtm_operate = lds_main.getitemdatetime(1,"operate_date")
ldtm_slip = lds_main.getitemdatetime(1,"slip_date")

if isnull(as_memno ) or len( as_memno ) < 1 then 
	ls_memno = lds_main.object.member_no[1]
else
	ls_memno =  as_memno
end if
ls_memno = this.of_set_membnoformat(ls_memno)
ll_rowcount	= lds_mbinfo.retrieve( ls_memno  )

if ll_rowcount > 0 then
	ls_prename = lds_mbinfo.getitemstring( 1,"prename_desc")
	ls_fname = lds_mbinfo.getitemstring( 1,"memb_name")
	ls_lname = lds_mbinfo.getitemstring( 1,"memb_surname")
	ls_groupcode  = lds_mbinfo.getitemstring( 1,"membgroup_code")
	ls_groupdesc  = lds_mbinfo.getitemstring( 1,"membgroup_desc")
	ldc_sharestkval = lds_mbinfo.getitemdecimal( 1,"sharestk_value")
	ldc_accumint = lds_mbinfo.getitemdecimal( 1,"sharestk_value")
	
	li_krow = lds_main.rowcount()
	if li_krow <=  0 then
		lds_main.insertrow(0)
	end if
	lds_main.setitem( 1,"member_no",ls_memno )
	lds_main.setitem( 1,"prename_desc",ls_prename )
	lds_main.setitem( 1,"memb_name",ls_fname )
	lds_main.setitem( 1,"memb_surname",ls_lname )
	lds_main.setitem( 1,"sharestk_value",ldc_sharestkval )
	lds_main.setitem( 1,"intaccum_amt",ldc_accumint )
	lds_main.setitem( 1,"membgroup_code",ls_groupcode )
	lds_main.setitem( 1,"membgroup_desc",ls_groupdesc )
	
else
	ithw_exception.text = "ประกันชีวิต  ไม่พบข้อมูลสมาชิก # " + ls_memno
	throw ithw_exception
	//messagebox('','ไม่พบข้อมูลสมาชิก #' + ls_memno)
end if
ls_xmlexport = this.of_xmlexport( lds_main )

return		ls_xmlexport
end function

public function string of_set_membnoformat (string as_memno) throws Exception;string		ls_membformat, ls_memno
integer	li_len

ls_memno	= trim( as_memno )

if trim( ls_memno ) = "" or isnull( ls_memno ) then return ""

// ดึง format ทะเบียนสมาชิก
select	membno_format
into	:ls_membformat
from	cmcoopconstant 
using itr_sqlca
;

if isnull( ls_membformat ) then ls_membformat = "000000"

li_len			= len( trim( ls_membformat ) )

ls_memno	= fill( "0", li_len ) + ls_memno
ls_memno	= right( ls_memno, li_len )

return ls_memno
end function

public function integer of_insslip_dwetcitemchanged (ref string as_xmlslipmain, ref string as_xmlslipdet) throws Exception;string ls_slipno, ls_memno
integer li_row, li_count,li_currow
dec{2} ldc_total, ldc_itempay
n_ds lds_slipmain,  lds_slipdet

lds_slipmain	= create n_ds
lds_slipmain.dataobject	= "d_inssrv_payin_slip_main"
//lds_slipmain.settransobject( itr_sqlca )
lds_slipmain.importstring( XML!, as_xmlslipmain )


lds_slipdet	= create n_ds
lds_slipdet.dataobject	= "d_ins_slip_payindet"
//lds_slipdet.settransobject( itr_sqlca )
lds_slipdet.importstring( XML!, as_xmlslipdet )

ldc_total = dec(lds_slipdet.describe(" evaluate( 'sum( item_payamt  for all)'," + string( lds_slipdet.rowcount()) + " )"))
//ldc_etcamt		= dec( dw_etc.describe( "evaluate( 'sum( item_payamt for all)', "+string( dw_etc.rowcount() )+" )" ) )
lds_slipmain.setitem(1,"slip_amt", ldc_total )
lds_slipmain.accepttext()

as_xmlslipmain = this.of_xmlexport( lds_slipmain )

return 1
end function

public function integer of_postsave_slipins (ref str_ins_slippayin astr_inslippayin) throws Exception;string ls_memno, ls_instype, ls_desc,ls_payinslipno, ls_receiptno,ls_documentno,ls_xmlslipmain,ls_xmlslipdet
string ls_entryid, ls_insdocno, ls_moneytype
integer  li_row, li_count,li_period, li_operateflag,li_seqno,ll_find
long ll_insgroupid
datetime ldtm_entry, ldtm_slip, ldtm_operate
dec{2}  ldc_itempayment, ldc_insbalance
n_ds  lds_slipmain, lds_slipdet

ls_xmlslipmain = astr_inslippayin.as_xmlslipmain
ls_xmlslipdet	 = astr_inslippayin.as_xmlslipdet
ls_entryid = astr_inslippayin.as_entryid
ldtm_entry = astr_inslippayin.adtm_entry
ls_memno = astr_inslippayin.as_memno

lds_slipmain	= create n_ds
lds_slipmain.dataobject	= "d_inssrv_payin_slip_main"
lds_slipmain.settransobject( itr_sqlca )

this.of_setsrvdwxmlie(true)
inv_dwxmliesrv.of_xmlimport( lds_slipmain , ls_xmlslipmain )

lds_slipdet	= create n_ds
lds_slipdet.dataobject	= "d_ins_slip_payindet"
lds_slipdet.settransobject( itr_sqlca )

this.of_setsrvdwxmlie(true)
inv_dwxmliesrv.of_xmlimport( lds_slipdet , ls_xmlslipdet )

// ขอเลขที่ Slip
this.of_setsrvdoccontrol( true )
//a_edit     ls_payinslipno	= inv_docsrv.of_getnewdocno( "SLSLIPPAYIN" )
//a_edit     ls_documentno	= inv_docsrv.of_getnewdocno( "CMSLIPRECEIPT" )
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ Slip ใน Header
lds_slipmain.setitem( 1, "payinslip_no", ls_payinslipno )
lds_slipmain.setitem( 1, "document_no", ls_documentno )
this.of_setsrvdoccontrol( false )

ldtm_slip  = lds_slipmain.getitemdatetime( 1,"slip_date")
ldtm_operate  = lds_slipmain.getitemdatetime( 1,"operate_date")
ls_moneytype = 	lds_slipmain.getitemstring( 1,"moneytype_code")
li_count =lds_slipdet.rowcount()

// ตรวจเช็คจำนวนแถว
li_count		= lds_slipdet.rowcount()
if li_count <= 0 then
	return -1
end if

// กรองให้เหลือแต่พวกที่ทำรายการเท่านั้น
lds_slipdet.setfilter( "operate_flag > 0" )
lds_slipdet.filter()

// ลบพวกไม่ทำรายการทิ้งไป
lds_slipdet.rowsdiscard( 1, lds_slipdet.filteredcount(), filter! )


li_count =lds_slipdet.rowcount()
for li_row = 1 to li_count
	
	lds_slipdet.setitem( li_row,"payinslip_no", ls_payinslipno )
	lds_slipdet.setitem( li_row,"seq_no", li_row )
	lds_slipdet.setitem( li_row,"slipitemtype_code", 'INS' )
	ls_instype  		= lds_slipdet.getitemstring( li_row,"shrlontype_code")
	ls_insdocno 		= lds_slipdet.getitemstring( li_row,"loancontract_no")
	ll_insgroupid 		= long( lds_slipdet.getitemnumber( li_row,"bfwithdraw_amt"))
	ldc_itempayment =  lds_slipdet.getitemdecimal( li_row,"item_payamt")
	ldc_insbalance 	=  lds_slipdet.getitemdecimal( li_row,"item_balance")
	
	if ldc_itempayment <= 0 or isnull(ldc_itempayment)  then continue;
	li_seqno = 0
	select max( seq_no ) 
	into :li_seqno
	from INSGROUPSTATEMENT 
	where insgroup_id = :ll_insgroupid  and member_no = :ls_memno  using itr_sqlca  ;
	
	if isnull(li_seqno) then li_seqno = 0
	li_seqno ++
	INSERT INTO INSGROUPSTATEMENT  
		( 	MEMBER_NO,  	 	instype_code,   			SEQ_NO,						INSITEMTYPE_CODE,   insgroup_id,
			INSPERIOD_AMT,  INSPERIOD_PAYMENT,  	insprince_balance, 		moneytype_code,
			OPERATE_DATE,  	INSGROUPSLIP_DATE,    	ENTRY_DATE,  	 		insgroupdoc_no ,
			ENTRY_ID,			refdoc_no )  
		VALUES 
		( 	:ls_memno,   		:ls_instype,   				:li_seqno,   					'IPX',  						 :ll_insgroupid,
			1,					:ldc_itempayment,   		:ldc_insbalance,				:ls_moneytype,
			:ldtm_operate,  	:ldtm_slip,   				:ldtm_entry,					:ls_insdocno ,		
			:ls_entryid,		:ls_documentno 		)  using itr_sqlca  ;
				  
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ประกันชีวิต  statement พบข้อผิดพลาด~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext + "~n" + ithw_exception.text
		throw ithw_exception
		return -1
	end if
	
	update insgroupmaster
	set  	inspayment_arrear = :ldc_insbalance,  last_stm_no = :li_seqno,
			process_date = :ldtm_slip
	where member_no = :ls_memno  and insgroup_id  =  :ll_insgroupid using    itr_sqlca  ;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ประกันชีวิต พบข้อผิดพลาด~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext + "~n" + ithw_exception.text
		throw ithw_exception
		return -1
	end if
	
next

if lds_slipmain.update() = 1 then
	//commit using itr_sqlca;
	
else
	ithw_exception.text = "ประกันชีวิต slippayin พบข้อผิดพลาด~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext + "~n" + ithw_exception.text
	rollback using itr_sqlca;	
		throw ithw_exception
		return -1
end if


if lds_slipdet.update() = 1 then
	//commit using itr_sqlca  ;
	
//	ithw_exception.text = "เรียบร้อยแล้ว"
else
	ithw_exception.text = "ประกันชีวิต slippayindet พบข้อผิดพลาด~n รหัสผิดพลาด" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext + "~n" + ithw_exception.text
	rollback using itr_sqlca;	
	throw ithw_exception
	return -1
end if
commit using itr_sqlca;
 astr_inslippayin.as_xmlslipmain = this.of_xmlexport( lds_slipmain )
 astr_inslippayin.as_xmlslipdet   = this.of_xmlexport( lds_slipdet )
 astr_inslippayin.as_slipno = ls_payinslipno
destroy  lds_slipmain
destroy lds_slipdet

return 1
end function

public function integer of_setsrvdwxmlie (boolean ab_switch);// Check argument
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

on n_cst_insurance_slip.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_insurance_slip.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ithw_exception = create Exception
end event

event destructor;if isvalid( ithw_exception ) then destroy ithw_exception
if isvalid( inv_progress ) then destroy inv_progress
end event

