$PBExportHeader$n_cst_print_service_fund.sru
forward
global type n_cst_print_service_fund from NonVisualObject
end type
end forward

global type n_cst_print_service_fund from NonVisualObject
end type
global n_cst_print_service_fund n_cst_print_service_fund

type variables
integer		ii_page, ii_line, ii_noupdate, ii_printbook = 1, il_linenofrec_pb, ii_cls_width_split_prnc = 0
integer		ii_prnfront, ii_prnback
string			is_DW_FrontBook, is_DW_BackBook
n_ds			ids_newrateint
n_ds			ids_bookback, ids_bookfront
Exception	ithw_exception

n_cst_printservice inv_print
n_cst_thailibservice	inv_thailib
str_newdppbk_detail			istr_newpb

transaction		itr_sqlca

constant string ITEM_GROUP_DEPT = 'DEP'
constant string ITEM_GROUP_OPEN = 'OPN'
constant string GROUP_FIXED = '01'
constant string BOOK_BASE = 'B'
constant string CERT_BASE = 'C'
constant string CHQ_BASE = 'Q'
end variables

forward prototypes
public function integer of_skip_line (integer ai_skip_from, integer ai_skip_to, ref n_ds ads_passbook, integer ai_totallinepage)
public function integer of_settrans (n_cst_dbconnectservice anv_db)
public function integer of_print_first_page (string as_member_no, string as_coop_control, datetime adtm_date, string as_entryid, ref string as_xml_return) throws Exception
public function integer of_getpassbookconstant (ref integer ll_pageperbook, ref integer ll_linesperpage, ref integer ll_skipmiddleline, ref integer ll_skipmiddlelineamount, string as_coop) throws Exception
public function integer of_print_passbook (string as_member_no, string as_coopid, integer ai_print_from_seq_no, integer ai_page, integer ai_line, boolean ab_bf, ref string as_xml_return, ref string as_return) throws Exception
public function integer of_set_page (ref n_ds ads_passbook, integer al_linesperpage, integer al_skipmiddlelineamount, integer al_skipmiddleline)
public function integer of_set_history (string as_member_no, integer ai_page, integer ai_line, integer ai_pageperbook, integer ai_linperpage, n_ds ads_passbook, string as_coop_control, integer ai_count_pass) throws Exception
public function integer of_reprint_first_page (string as_member_no, string as_coop_control, datetime adtm_date, string as_entryid, ref string as_xml_return, string as_newpassbook_no, string as_reson) throws Exception
public function integer of_genstatement_forprint_fund (n_ds ads_passbook, integer ai_seq_no, integer al_linesperpage, integer al_skipmiddlelineamount, string as_fundmember, string as_coop_control, ref long al_count_pass)
end prototypes

public function integer of_skip_line (integer ai_skip_from, integer ai_skip_to, ref n_ds ads_passbook, integer ai_totallinepage);integer li_loop

for li_loop = ai_skip_from to ai_skip_to
	ads_passbook.insertrow(li_loop)
	ads_passbook.setitem(li_loop,'an_linepage',( ai_totallinepage ))
	ads_passbook.setitem(li_loop,'al_rowstatus',0)
next

ads_passbook.accepttext()
return 1
end function

public function integer of_settrans (n_cst_dbconnectservice anv_db);itr_sqlca	= anv_db.itr_dbconnection

inv_thailib	= create n_cst_thailibservice
ithw_exception = create Exception


return 1
end function

public function integer of_print_first_page (string as_member_no, string as_coop_control, datetime adtm_date, string as_entryid, ref string as_xml_return) throws Exception;// 1 : success, else -1
string 	ls_dw_prnfirstpage_pb

n_ds lds_prnpbkfrt_pb
lds_prnpbkfrt_pb = create n_ds

lds_prnpbkfrt_pb.dataobject = 'd_dppbkfrt_fund'
lds_prnpbkfrt_pb.settransobject( itr_sqlca )
lds_prnpbkfrt_pb.retrieve( as_coop_control, as_member_no )


if lds_prnpbkfrt_pb.rowcount( ) < 1 then
	
	destroy( lds_prnpbkfrt_pb )
	ithw_exception.text	= "Error on prepare to print firstpage of passbook "
	rollback using itr_sqlca;
	throw ithw_exception
	
else
	
	as_xml_return	= lds_prnpbkfrt_pb.Describe( "Datawindow.data.XML" )
	
end if


destroy( lds_prnpbkfrt_pb )

return 1
end function

public function integer of_getpassbookconstant (ref integer ll_pageperbook, ref integer ll_linesperpage, ref integer ll_skipmiddleline, ref integer ll_skipmiddlelineamount, string as_coop) throws Exception;SELECT		pagetotal_pb, 		lineperpage_pb,		linenomidpage_pb,		nlinenextmid_pb
INTO 		:ll_PagePerBook, 	:ll_LinesPerPage, 	:ll_SkipMiddleLine, 	:ll_SkipMiddleLineAmount
FROM		fundcollconstant
where		coop_id = :as_coop
using 		itr_sqlca;

if isnull( ll_PagePerBook ) then ll_PagePerBook = 0
if isnull( ll_LinesPerPage ) then ll_LinesPerPage = 0
if isnull( ll_SkipMiddleLine ) then ll_SkipMiddleLine = 0
if isnull( ll_SkipMiddleLineAmount ) then ll_SkipMiddleLineAmount = 0 

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถตรวจสอบค่าคงที่การพิมพ์ได้ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

return 1
end function

public function integer of_print_passbook (string as_member_no, string as_coopid, integer ai_print_from_seq_no, integer ai_page, integer ai_line, boolean ab_bf, ref string as_xml_return, ref string as_return) throws Exception;string		ls_return, ls_work
integer	li_line, li_page, li_chack
integer	ll_PagePerBook, ll_LinesPerPage, ll_SkipMiddleLine, ll_SkipMiddleLineAmount
long		ll_count_pass, ll_linemidlepage, ll_rowindex, li_line_count, ll_rowcount
datetime	ldtm_work
n_ds	lds_passbook_print

li_line		= ai_line
li_page	= ai_page

ls_return		= "0@0" // 0 คือไม่พิมพ์แล้ว พิมพ์หมดแล้ว

lds_passbook_print	= create n_ds
lds_passbook_print.dataobject = "d_dppbkstm_fund_book"
lds_passbook_print.settransobject( itr_sqlca )

this.of_getpassbookconstant( ll_PagePerBook, ll_LinesPerPage, ll_SkipMiddleLine, ll_SkipMiddleLineAmount, as_coopid)

if ( li_line > 1 or li_page > 1 ) or ai_print_from_seq_no = 1  then
	ab_bf	= false
else
	ab_bf	= true
end if

if ab_bf = true then
	select		max( seq_no )
	into		:ai_print_from_seq_no
	from		fundcollstatement
	where	( member_No	= :as_member_no ) and
				( coop_id			= :as_coopid ) and
				( seq_no			< :ai_print_from_seq_no )
	using itr_sqlca ;	
	
	if ( ai_print_from_seq_no < 1 ) or isnull( ai_print_from_seq_no ) then ai_print_from_seq_no = 1
	
end if

li_chack = this.of_genstatement_forprint_fund( lds_passbook_print ,ai_print_from_seq_no, ll_LinesPerPage,ll_SkipMiddleLineAmount, as_member_no, as_coopid, ll_count_pass  )

if ( li_chack >  0  ) then
	
	ll_linemidlepage	= ll_SkipMiddleLine
	li_page 			= ai_page
	
	if  ai_line > 1 then
		this.of_skip_line( 1, ( ai_line - 1  ), lds_passbook_print, ( ll_LinesPerPage + ll_SkipMiddleLineAmount ) )
		
		if ai_line > ll_SkipMiddleLine then
			if  ll_SkipMiddleLineAmount > 0 then
				this.of_skip_line( ai_line , ( ai_line + ll_SkipMiddleLineAmount - 1 ), lds_passbook_print, ( ll_LinesPerPage + ll_SkipMiddleLineAmount ) )
				ai_line 				+=  ll_SkipMiddleLineAmount
				ll_linemidlepage 	= ll_LinesPerPage + ll_SkipMiddleLineAmount + ll_SkipMiddleLine + 1
			end if
		end if
	end if
	
	ai_print_from_seq_no		= 0
	
	ll_rowindex		= ai_line
	li_line_count		= ai_line
	ll_rowcount		= lds_passbook_print.rowcount( )
	
	do while  ll_rowindex <= ll_rowcount
		if  ll_rowindex  =  ll_linemidlepage then
			if  ll_SkipMiddleLineAmount > 0 then
				this.of_skip_line( ll_rowindex , ( ll_rowindex + ll_SkipMiddleLineAmount - 1 ), lds_passbook_print, ( ll_LinesPerPage + ll_SkipMiddleLineAmount ) )
				ll_linemidlepage	= ll_linemidlepage + ll_LinesPerPage + ll_SkipMiddleLineAmount 
				ll_rowcount			= ll_rowcount + ll_SkipMiddleLineAmount
				ll_rowindex			= ll_rowindex +  ll_SkipMiddleLineAmount
				li_line_count			= li_line_count +  ll_SkipMiddleLineAmount
			end if
		end if
		
		// หากหมดหน้าแล้ว ก็ไม่ทำแล้ว จะพิมพ์ครั้งละ 1 หน้า
		if  li_line_count = ( ll_LinesPerPage + ll_SkipMiddleLineAmount ) then
			li_line_count = 0
			if  ll_rowindex < ll_rowcount then
				ai_print_from_seq_no =  lds_passbook_print.getitemnumber(ll_rowindex + 1,'al_seq_no')
				
				// ตรวจสอบว่าต้องขึ้นเล่มใหม่หรือไม่
				if ( ( ai_page + 1 ) > ll_PagePerBook ) then
					ls_return		= "1@" + string( ai_print_from_seq_no ) // 1 คือขึ้นเล่มใหม่
				else
					ls_return		=  string( ai_page + 1 )+"@" + string( ai_print_from_seq_no ) // ai_page+1  คือ พิมพ์หน้าถัดไป
				end if
			end if
			
			lds_passbook_print.rowsdiscard( ll_rowindex + 1, ll_rowcount, primary! )
			exit
		end if
		
		li_line_count ++
		ll_rowindex ++
	loop 
	
	if ab_bf = true then	
			select workdate
			into	:ldtm_work
			from amappstatus
			where application = 'ap_deposit'
			using itr_sqlca ;	
			
			ls_work	= string( ldtm_work, 'dd/mm/yyyy' )
			
			lds_passbook_print.setitem( 1, "t_date", ''  ) //ls_work )
			lds_passbook_print.setitem( 1, "shritemtype_code", "ยอดยกมา" )
			lds_passbook_print.setitem( 1, "t_cmp_withdraw", "")
			lds_passbook_print.setitem( 1, "t_cmp_dept", "")
			
	end if
	
	this.of_set_page( lds_passbook_print, ll_LinesPerPage,ll_SkipMiddleLineAmount, ll_SkipMiddleLine )
	this.of_set_history( as_member_no, ai_page, li_line, ll_PagePerBook, ll_LinesPerPage, lds_passbook_print , as_coopid, ll_count_pass ) // บันทึกประวัติการพิมพ์
	

	as_xml_return	= lds_passbook_print.Describe( "Datawindow.data.XML" )

	
	// ปรับปรุงสถานะการออกสมุดกรณีที่บรรทัด และ หน้าสุดท้ายพอดี
	if ( ii_page = ( ai_page - 1 ) ) and ( ii_line = ( ll_rowcount - ll_SkipMiddleLineAmount ) )  then		
//		update	dpdeptmaster
//		set			prnbook_status		= 0
//		where	( deptaccount_no	= :as_account_no ) and
//					( coop_id				= :ls_coop_control )
//		using itr_sqlca ;
//		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถบันทึกรายการ สถานะออกสมุดใหม่ได้ " + itr_sqlca.sqlerrtext
			rollback using itr_sqlca;
			destroy( lds_passbook_print )
			throw ithw_exception
		else
			commit using itr_sqlca ;
		end if
		
	end if	
	
else
	ai_print_from_seq_no = 0
end if

as_return	= ls_return

destroy( lds_passbook_print )

return 1
end function

public function integer of_set_page (ref n_ds ads_passbook, integer al_linesperpage, integer al_skipmiddlelineamount, integer al_skipmiddleline);long ll_rowcount,ll_loop
long ll_count,ll_skipundo,ll_line
string ls_bal


ads_passbook.accepttext()
ll_rowcount = ads_passbook.rowcount()
ll_skipundo = al_SkipMiddleLineAmount

if ll_rowcount > 0 then
	ll_count	= 0 
	ll_line	= 0
	for ll_loop = 1 to  ll_rowcount
//		ads_passbook.setitem(ll_loop,'al_seq_no',ll_loop)
		ads_passbook.setitem(ll_loop,'an_linepage',al_LinesPerPage +  al_SkipMiddleLineAmount)
		ll_count ++ 
		ll_line ++
		if ll_line > al_SkipMiddleLine and  ll_skipundo > 0 then
			ll_line --
			ll_skipundo --
		end if
		ls_bal = ads_passbook.getitemstring(ll_loop, 't_cmp_bal' )
		if isnull( ls_bal )  then
			ads_passbook.setitem( ll_loop,'t_line_num', '' )
		else
			ads_passbook.setitem( ll_loop,'t_line_num', string( ll_line ) )
		end if
		ads_passbook.setitem( ll_loop,'line_num', ll_line )
		
		
		if ll_count =  (al_LinesPerPage +  al_SkipMiddleLineAmount) then 
			ll_count		= 0
			ll_line		= 0
			ll_skipundo = al_SkipMiddleLineAmount
		end if
	next
	ads_passbook.setsort('line_num')
	ads_passbook.sort()
	ads_passbook.groupCalc()
end if

return 1
end function

public function integer of_set_history (string as_member_no, integer ai_page, integer ai_line, integer ai_pageperbook, integer ai_linperpage, n_ds ads_passbook, string as_coop_control, integer ai_count_pass) throws Exception;integer	li_rowcount, li_page, li_rowtotal, li_rowcurrent, li_rowcurrent_temp, li_page_temp, li_line_temp
integer	li_seq_no


li_rowcount		= ads_passbook.rowcount( )

if ai_count_pass > 0 then
	li_rowtotal		=  ai_pageperbook *  ai_linperpage
	li_rowcurrent	= ( ( ai_page - 1 )	 * ai_linperpage ) +  ai_count_pass + ai_line - 1
	
	do while  li_rowcurrent >= li_rowtotal
		li_rowcurrent = li_rowcurrent - li_rowtotal
	loop
	
	if li_rowcurrent = 0 then
		ai_page	= 1
		ai_line	= 1
	else
		ai_page	=  truncate( ( li_rowcurrent / ai_linperpage ), 0 )
		ai_line	= li_rowcurrent - ( ai_page * ai_linperpage ) + 1
		
		ai_page ++
		if ai_line = ( ai_linperpage + 1 ) then
			ai_line = 1
			ai_page ++
		end if
	end if
	
	as_member_no	= trim(as_member_no)
	li_seq_no		= ads_passbook.getitemnumber( li_rowcount ,'al_seq_no')

	
	
		UPDATE	fundcollmaster
		SET		lastrec_no_pb		= :li_seq_no,	
				lastpage_no_pb		= :ai_page,
				lastline_no_pb		= :ai_line
		WHERE	fundmember_no		= :as_member_no 
		and		coop_id				= :as_coop_control
		using itr_sqlca;


	if itr_sqlca.SQLCODE = 0 then
		commit using itr_sqlca;
	else
		ithw_exception.text	= "ไม่สามารถบันทึกรายการ ค่าการพิมพ์ได้ " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if			
end if

return 1
end function

public function integer of_reprint_first_page (string as_member_no, string as_coop_control, datetime adtm_date, string as_entryid, ref string as_xml_return, string as_newpassbook_no, string as_reson) throws Exception;// 1 : success, else -1
string 	ls_dw_prnfirstpage_pb, ls_oldpassbook_No

n_ds lds_prnpbkfrt_pb
lds_prnpbkfrt_pb = create n_ds

lds_prnpbkfrt_pb.dataobject = 'd_dppbkfrt_fund'
lds_prnpbkfrt_pb.settransobject( itr_sqlca )
lds_prnpbkfrt_pb.retrieve( as_coop_control, as_member_no )


if lds_prnpbkfrt_pb.rowcount( ) < 1 then
	
	destroy( lds_prnpbkfrt_pb )
	ithw_exception.text	= "Error on prepare to print firstpage of passbook "
	rollback using itr_sqlca;
	throw ithw_exception
	
else
	
	as_xml_return	= lds_prnpbkfrt_pb.Describe( "Datawindow.data.XML" )
	
end if


destroy( lds_prnpbkfrt_pb )

return 1
end function

public function integer of_genstatement_forprint_fund (n_ds ads_passbook, integer ai_seq_no, integer al_linesperpage, integer al_skipmiddlelineamount, string as_fundmember, string as_coop_control, ref long al_count_pass);string		ls_coop_control, ls_prntcode, ls_entry, ls_initial, ls_seq_no, ls_deptitem_amt, ls_prncbal
string		ls_period, ls_ref_slipno
integer	li_seq_no, li_flag, li_period
long		ll_rowcount, ll_loop
datetime	ldtm_date
dec{2}	ldc_item
n_ds		lds_stm_forprint_fund

ls_coop_control = as_coop_control

lds_stm_forprint_fund = create n_ds
lds_stm_forprint_fund.dataobject = "d_dp_prnfund_statement_service"
lds_stm_forprint_fund.settransobject( itr_sqlca )

ll_rowcount = lds_stm_forprint_fund.retrieve( as_fundmember, ls_coop_control , ai_seq_no  )

al_count_pass =  lds_stm_forprint_fund.rowcount()


for ll_loop = 1 to ll_rowcount 
		ls_prntcode		= trim( lds_stm_forprint_fund.getitemstring( ll_loop, 'itemtype_code' ) )
		ldtm_date		= lds_stm_forprint_fund.object.operate_date[ ll_loop ]
		//ldc_item		= lds_stm_forprint_fund.object.shritemtype_code[ ll_loop ]
		ls_prncbal		= string( lds_stm_forprint_fund.getitemnumber( ll_loop,'fundbalance') ) 
		ls_deptitem_amt = string( lds_stm_forprint_fund.getitemnumber( ll_loop, 'itempay_amt' ) )
		ls_entry		= lds_stm_forprint_fund.GetItemstring(ll_loop, 'entry_id')
		
		// ระ - ตรวจสอบการ no book adtm_entrydate  
		li_seq_no		= lds_stm_forprint_fund.getitemnumber( ll_loop, 'seq_no' )
		
		choose case ls_prntcode
			case 'FPX'
				li_flag	= 1
			case 'FRT'
				li_flag = -1
			case 'RPX'
				li_flag = -1
			case 'RRT'
				li_flag = 1
		end choose
		if li_seq_no = 0 then 
			ls_seq_no = ''
		else
			ls_seq_no = string( li_seq_no )
		end if
		
		ads_passbook.insertrow( ll_loop )
		ads_passbook.setitem( ll_loop, 'al_seq_no', li_seq_no )
		ads_passbook.setitem( ll_loop, 't_seq_no', ls_seq_no )
		ads_passbook.setitem( ll_loop, 'al_rowstatus', 1 )
		ads_passbook.setitem( ll_loop, 'an_linepage', ( al_LinesPerPage  + al_SkipMiddleLineAmount ) )
		ads_passbook.setitem( ll_loop,'adtm_opdare', lds_stm_forprint_fund.getitemdatetime( ll_loop,'operate_date' ) )
		
			
		ads_passbook.setitem( ll_loop, 't_date', string( lds_stm_forprint_fund.getitemdatetime( ll_loop,'operate_date'), 'dd/mm/' ) &
								+  string( year( date( lds_stm_forprint_fund.getitemdatetime( ll_loop,'operate_date') ) ) + 543 ) )
		
		ads_passbook.setitem( ll_loop, 'shritemtype_code', ls_prntcode )
		
		
		if li_flag = 1 then
			ads_passbook.setitem( ll_loop,'t_cmp_dept', ls_deptitem_amt ) 
		else
			ads_passbook.setitem( ll_loop,'t_cmp_withdraw', ls_deptitem_amt ) 
		end if
		
		ads_passbook.setitem( ll_loop, 't_cmp_bal', ls_prncbal )
		
		ads_passbook.setitem( ll_loop, 'entry_id', ls_entry )
		ads_passbook.setitem( ll_loop, 'prnc_no', "" )

next


DESTROY lds_stm_forprint_fund

ads_passbook.accepttext( )

return ads_passbook.rowcount( )
end function

on n_cst_print_service_fund.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_print_service_fund.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on
