$PBExportHeader$n_cst_pmservice.sru
$PBExportComments$ตัวบริการระบบเงินลงทุน
forward
global type n_cst_pmservice from nonvisualobject
end type
end forward

global type n_cst_pmservice from nonvisualobject
end type
global n_cst_pmservice n_cst_pmservice

type variables
CONSTANT Integer	SUCCESS = 1
CONSTANT Integer	FAILURE = -1

Private:
	n_cst_datetimeservice 	inv_DateTime
	n_cst_doccontrolservice	inv_DocService
	n_cst_stringservice		inv_String
	n_cst_dbconnectservice	inv_DB
	n_cst_calendarservice	inv_Calendar_SRV
	n_cst_dwxmlieservice		inv_xmlieservice
	
	transaction		itr_SQLCA
	
	Exception	ithw_exception
	n_cst_progresscontrol	inv_progresscontrol
	
	String		is_CoopContrl
	String		is_slipno
	
	// For open account
	n_ds		ids_ReqMaster, ids_ReqDetail, ids_ReqInt
	
	// For withdraw
	n_ds		ids_Slip , ids_SlipDetail
end variables

forward prototypes
public function integer of_init ()
public function string of_getdocumentno (string as_coopid, string as_doccodeno) throws Exception
public function integer of_checkbeforesavepmreq (string as_main_xml, string as_detail_xml, string as_int_xml) throws Exception
public function string of_err_generate_import_xml (integer ai_error)
public function integer of_savepmreq (string as_main_xml, string as_detail_xml, string as_interate_xml) throws Exception
public function integer of_saveaccintpmreq (string as_accountno) throws Exception
public function integer of_savedetailpmreg (string as_reqdocno) throws Exception
public function integer of_saveintpmreg (string as_reqdocno) throws Exception
public function integer of_savemainpmreg (string as_accountno, string as_reqdocno) throws Exception
public function integer of_savemasterpmreq (string as_accountno) throws Exception
public function integer of_saveslippmreq (string as_accountno) throws Exception
public function integer of_savestatemnetpmreq (string as_accountno) throws Exception
public function string of_get_rcvint_list (datetime adtm_begindate, datetime adtm_enddate) throws Exception
public function string of_calint_rcv_list (string as_xml) throws Exception
public function integer of_postint_rcv_list (string as_xml, datetime adtm_operate, datetime adtm_entrydate, string as_entryid) throws Exception
public function string of_setslipmain_withdraw (string as_slipmain_xml, string as_accountno) throws Exception
public function string of_posttoslip (string as_coopid, string as_accountno, datetime adtm_operate, datetime adtm_entrydate, string as_entryid, decimal adc_itemamt, decimal adc_intamt, decimal adc_taxamt, decimal adc_fineamt) throws Exception
public function integer of_postto_rcvint_history (string as_coopid, string as_accountno, datetime adtm_operate, decimal adc_balance, datetime adtm_startcal, datetime adtm_endcal, decimal adc_int, decimal adc_tax) throws Exception
public function integer of_posttostatement (string as_coopid, string as_accountno, datetime adtm_operate, datetime adtm_entrydate, decimal adc_itemamount, string as_itemcode, integer ai_side, decimal adc_balancebefore, string as_slipno, string as_entryid) throws Exception
public function integer of_posttoslip_det (string as_slipno, string as_coopid, integer ai_seqno, string as_moneycode, string as_accountid, decimal adc_itemnet, string as_bankaccno, string as_bankbranch, string as_bankcode) throws Exception
public function integer of_checkbeforesavewd (string as_slip_xml, string as_slipdet_xml) throws Exception
public function integer of_savewithdraw (string as_slip_xml, string as_slipdet_xml) throws Exception
public function integer of_savestatmentwd (string as_slipno) throws Exception
public function string of_genduedate (string as_condition_xml) throws Exception
public function integer of_process_intrecvable (datetime adtm_calintto) throws Exception
public function integer of_process_shortlong (integer ai_year) throws Exception
public function integer of_set_industry (string as_xml) throws Exception
public function integer of_set_investgroup (string as_xml) throws Exception
public function integer of_set_investtype (string as_xml) throws Exception
public function integer of_set_investsource (string as_xml) throws Exception
public function string of_get_warrantylist (string as_coopid, string as_accountno)
public function integer of_set_warrantylist (string as_xml, string as_coopid, string as_accountno) throws Exception
public function integer of_del_warranty (string as_coopid, string as_accountno, integer ai_seqno) throws Exception
public function integer of_settrans (n_cst_dbconnectservice anv_db)
public function boolean of_isvalidcalendar (datetime adtm_date)
public function string of_calint_report_advancd (datetime adtm_startdate, datetime adtm_enddate)
public function decimal of_compute_int (string as_accountno, string as_coopid, decimal adc_balance, datetime adtm_calintfrom, datetime adtm_calintto)
public function decimal of_getint_rate (string as_accountno, string as_coopid, datetime adtm_calintfrom, datetime adtm_calintto)
public function integer of_updateinvestmaster (string as_xml) throws Exception
public function integer of_updateduedate (string as_xml, string as_accountno) throws Exception
public function integer of_del_investtype (string as_coopid, string as_investcode) throws Exception
public function integer of_del_investgroup (string as_coopid, string as_investgroupcode) throws Exception
public function integer of_del_investsource (string as_coopid, string as_investsourcecode) throws Exception
public function integer of_del_industry (string as_coopid, string as_industrycode) throws Exception
public function decimal of_get_upperlower (string as_coopid, string as_accountno)
public function decimal of_getavg_int (string as_coopid, string as_accountno, boolean ab_yield)
public function integer of_get_receiveint_period (string as_coopid, string as_accountno, datetime adtm_buydate)
public function integer of_set_upperlower (string as_coopid, string as_accountno, decimal adc_accuintamt) throws Exception
public function decimal of_getint_rate_yield (string as_accountno, string as_coopid, datetime adtm_calintfrom, datetime adtm_calintto)
public function integer of_duration_calculation (string as_accountno, string as_coopid, datetime adtm_buydate, datetime adtm_duedate)
public function decimal of_completecal_duration (string as_accountno, string as_coopid, integer ai_period)
public function integer of_cutdiffer_calculation (string as_accountno, string as_coopid) throws Exception
end prototypes

public function integer of_init ();// รหัสสหกรณ์ ที่ควบคุมสาขา (เพื่อหาค่าคงที่ต่างๆ)
is_CoopContrl 		=  inv_db.is_CoopControl

inv_datetime			= CREATE n_cst_datetimeservice 	
inv_docservice			= CREATE n_cst_doccontrolservice	
inv_string				= CREATE n_cst_stringservice
inv_calendar_srv		= CREATE n_cst_calendarservice
inv_progresscontrol	= CREATE n_cst_progresscontrol
inv_xmlieservice		= CREATE n_cst_dwxmlieservice

inv_calendar_srv.of_initservice( inv_db )
inv_docservice.of_settrans(inv_db)

RETURN SUCCESS
end function

public function string of_getdocumentno (string as_coopid, string as_doccodeno) throws Exception;String		ls_InvestAccno

ls_InvestAccno		= inv_DocService.of_GetNewDocno(as_coopid ,as_DocCodeNo )

IF IsNull(ls_InvestAccno) or (ls_InvestAccno = "" ) THEN
	ls_InvestAccno	=	"NO"
END IF

RETURN ls_investaccno
end function

public function integer of_checkbeforesavepmreq (string as_main_xml, string as_detail_xml, string as_int_xml) throws Exception;Integer		li_RcDet , li_RowDetail  , li_IndexDetail , li_SeqNo , li_rc , li_rcInt , li_RowInt
Integer		li_Index , li_IndexNext, li_InvestPeriod, li_InvestPeriodUnit
Long			ll_UnitAmt
String			ls_CoopID , ls_accountno , ls_InvSourceCode
String			ls_InvestTypeCode , ls_BranchID , ls_AccidPrnc
String			ls_SymbolCode , ls_RateCode, ls_InvestmentDocNo
String			ls_AccountID, ls_MoneyCode, ls_AccountName
Dec{2}		ldc_MoneyAmt , ldc_ItemAmt , ldc_UnitCost, ldc_MaturityAmt
DateTime	ldtm_OperateDate , ldtm_DueDate, ldtm_BuyDate , ldtm_TestDate

// Master
ids_ReqMaster		= CREATE n_ds
ids_ReqMaster.DataObject = "d_pm_main_pmreqinvestment"
ids_ReqMaster.SetTransObject( itr_SQLCA )

IF not  IsNull( as_main_xml ) and Trim( as_main_xml ) <> ""  THEN
	li_rc	= inv_XmlieService.of_XmlImport( ids_ReqMaster, as_main_xml )
	IF ( li_rc < 1 ) THEN
		Destroy(ids_ReqDetail)
		Destroy(ids_ReqMaster)
		ithw_Exception.Text	+= "ไม่สามารถดูค่าข้อมูลรายการหลักเพื่อตรวจสอบได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(ids_ReqDetail)
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML ข้อมูลรายการหลักมายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

ldc_ItemAmt				= ids_ReqMaster.GetItemDecimal( 1 , "purchase_price" )
ldc_MaturityAmt			= ids_ReqMaster.GetItemDecimal( 1 , "maturity_price" )
ldc_UnitCost					= ids_ReqMaster.GetItemDecimal( 1 , "unit_cost" )

ldtm_DueDate				= ids_ReqMaster.GetItemDateTime( 1 , "due_date" )
ldtm_OperateDate			= ids_ReqMaster.GetItemDateTime( 1 , "open_date" )
ldtm_BuyDate				= ids_ReqMaster.GetItemDateTime( 1 , "buy_date" )

ll_UnitAmt					= ids_ReqMaster.GetItemNumber( 1 , "unit_amt" )
li_InvestPeriod				= ids_ReqMaster.GetItemNumber( 1 , "investment_period" )
li_InvestPeriodUnit			= ids_ReqMaster.GetItemNumber( 1 , "invest_period_unit" )

ls_CoopID					= Trim(ids_ReqMaster.GetItemString( 1 , "coop_id" ))
ls_accountno				= Trim(ids_ReqMaster.GetItemString( 1 , "account_no" ))
ls_BranchID					= Trim(ids_ReqMaster.GetItemString( 1 , "branch_id" ))
ls_InvSourceCode			= Trim(ids_ReqMaster.GetItemString( 1 , "invsource_code" ))
ls_InvestTypeCode			= Trim(ids_ReqMaster.GetItemString( 1 , "investtype_code" ))
ls_AccidPrnc					= Trim(ids_ReqMaster.GetItemString( 1 , "accid_prnc" ))
ls_SymbolCode				= Trim(ids_ReqMaster.GetItemString( 1 , "symbol_code" ))
ls_RateCode					= Trim(ids_ReqMaster.GetItemString( 1 , "rate_code" ))
ls_InvestmentDocNo		= Trim(ids_ReqMaster.GetItemString( 1 , "investment_docno" ))
ls_AccountName			= Trim(ids_ReqMaster.GetItemString( 1 , "account_name" ))

CHOOSE CASE li_InvestPeriodUnit
	CASE 1 // วัน
		ldtm_TestDate	= DateTime( RelativeDate( Date( ldtm_OperateDate), li_InvestPeriod ) )
		
	CASE 2 // เดือน
		ldtm_TestDate	= DateTime( inv_DateTime.of_RelativeMonth( Date( ldtm_OperateDate), li_InvestPeriod ) )
		
	CASE 3 // ปี
		ldtm_TestDate	= DateTime( inv_DateTime.of_RelativeYear( Date( ldtm_OperateDate), li_InvestPeriod ) )
		
END CHOOSE

IF ( Date(ldtm_TestDate) > Date(ldtm_DueDate) ) THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ วันที่ครบกำหนดลงทุนไม่สัมพันธ์กับอายุการลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull( ls_AccountName ) or Trim (ls_AccountName) = "" Then	
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุชื่อบัญชีเงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull( ldtm_OperateDate ) Then	
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุวันที่ลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull( ldtm_DueDate ) Then
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุวันที่ครบกำหนด"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF


IF IsNull(ls_AccidPrnc) or ls_AccidPrnc = "" THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุรหัสบันทึกบัญชีเงินต้น"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ls_CoopID) or ls_CoopID = "" THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุรหัสสหกรณ์"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ldc_ItemAmt) or ldc_ItemAmt <= 0  THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุราคาซื้อเงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ldc_MaturityAmt) or ldc_MaturityAmt <= 0  THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุราคาจริงเงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ls_InvSourceCode) or ls_InvSourceCode = "" THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุแหล่งเงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ls_InvestTypeCode) or ls_InvestTypeCode = "" THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุประเภทเงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ll_UnitAmt) or ll_UnitAmt <= 0  THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุจำนวนหน่วยลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ldc_UnitCost) or ldc_UnitCost <= 0  THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุราคาต่อหน่วยลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF ( ( ldc_UnitCost * ll_UnitAmt ) <> ldc_MaturityAmt ) THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ราคาต่อหน่วย * จำนวนหน่วยลงทุน ไม่เท่ากับค่าระบุหน้าบัญชีลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ls_SymbolCode) or ls_SymbolCode = "" THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุ Symbol เงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ls_RateCode) or ls_RateCode = "" THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุ RATE เงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ls_InvestmentDocNo) or ls_InvestmentDocNo = "" THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุเลขที่บัญชีลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ldtm_BuyDate) or String (ldtm_BuyDate, "YYYYMMDD") = "19000101" THEN
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการวันที่ซื้อหน่วยลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

// Detail
ids_ReqDetail		= CREATE n_ds
ids_ReqDetail.DataObject = "d_pm_detail_pmreqinvestment"
ids_ReqDetail.SetTransObject( itr_SQLCA )

IF Not  IsNull( as_Detail_XML ) and Trim( as_Detail_XML ) <> ""  THEN
	li_RowDetail	= inv_XmlieService.of_XmlImport( ids_ReqDetail, as_Detail_XML )
	IF ( li_RowDetail < 1 ) or IsNull(li_RowDetail) THEN
		Destroy(ids_ReqDetail)
		Destroy(ids_ReqMaster)
		ithw_Exception.Text	+= "ไม่สามารถดูค่าข้อมูลรายละเอียดรายการเพื่อตรวจสอบได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(ids_ReqDetail)
	Destroy(ids_ReqMaster)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML ข้อมูลรายละเอียดรายการมายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

FOR li_IndexDetail = 1 TO li_RowDetail
	ldc_MoneyAmt	= ids_ReqDetail.GetItemDecimal( li_IndexDetail , "money_amount" )
	ls_AccountID	= Trim( ids_ReqDetail.GetItemString( li_IndexDetail , "account_id" ) )
	ls_MoneyCode	= Trim( ids_ReqDetail.GetItemString( li_IndexDetail , "money_code" ) )
	
	IF IsNull(ldc_MoneyAmt) or ldc_MoneyAmt <=0 THEN
		Destroy(ids_ReqDetail)
		Destroy(ids_ReqMaster)
		ithw_Exception.Text	+= "รายการไม่สมบูรณ์ จำนวนเงินในรายละเอียดไม่ถูกต้อง"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	IF IsNull(ls_AccountID) or ls_AccountID = ""  THEN
		Destroy(ids_ReqDetail)
		Destroy(ids_ReqMaster)
		ithw_Exception.Text	+= "รายการไม่สมบูรณ์ รหัสบันทึกบัญชีในรายละเอียดไม่ถูกต้อง"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	IF IsNull(ls_MoneyCode) or ls_MoneyCode = ""  THEN
		Destroy(ids_ReqDetail)
		Destroy(ids_ReqMaster)
		ithw_Exception.Text	+= "รายการไม่สมบูรณ์ ประเภทเงินในรายละเอียดไม่ถูกต้อง"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
NEXT

// Int
ids_ReqInt	= CREATE n_ds
ids_ReqInt.DataObject = "d_pm_interate_pmreqinvestment"
ids_ReqInt.SetTransObject( itr_SQLCA )

IF not  IsNull( as_Int_XML ) and Trim( as_Int_XML ) <> ""  THEN
	li_RowInt	= inv_XmlieService.of_XmlImport( ids_ReqInt, as_Int_XML )
	IF ( li_RowInt < 1 ) THEN
		Destroy(ids_ReqDetail)
		Destroy(ids_ReqMaster)
		Destroy(ids_ReqInt)
		
		ithw_Exception.Text	+= "ไม่สามารถดูค่าข้อมูลรายการดอกเบี้ยเพื่อตรวจสอบได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(ids_ReqDetail)
	Destroy(ids_ReqMaster)
	Destroy(ids_ReqInt)
	
	ithw_Exception.Text	+= "ไม่มีการส่ง XML ข้อมูลรายการดอกเบี้ยมายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(li_RowInt) or li_RowInt <= 0 THEN RETURN -1

String			ls_IntCoopID
DateTime	ldtm_Start , ldtm_End , ldtm_Nextdate , ldtm_StartNext
Dec{7}		ldc_IntRate , ldc_IntYieldRate

FOR li_Index = 1 TO li_RowInt	
	ls_IntCoopID	= Trim(ids_ReqInt.GetItemString( li_Index , "coop_id" ))	
	ldtm_Start		= ids_ReqInt.GetItemDateTime( li_Index , "int_start_date" )
	ldtm_End			= ids_ReqInt.GetItemDateTime( li_Index , "int_end_date" )
	ldc_IntRate		= ids_ReqInt.GetItemDecimal( li_Index , "int_rate" )
	
	ldc_IntYieldRate	= ids_ReqInt.GetItemDecimal( li_Index , "int_yield_rate" )	
	
	//วันที่ถัดไป
	ldtm_NEXTdate		= ldtm_End // DateTime(RelativeDate( Date(ldtm_End), 1))

	IF	Date( ldtm_Start ) > Date( ldtm_End ) THEN
		Destroy(ids_ReqDetail)
		Destroy(ids_ReqMaster)
		Destroy(ids_ReqInt)
		
		ithw_Exception.Text	+= "ข้อมูลดอกเบี้ยไม่สัมพันธ์ วันที่เริ่มต้นมากกว่าวันที่สิ้นสุด"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	//ถ้าไม่ใช่แถวสุดท้ายให้เช็ค start แถวถัดไป
	IF	( li_Index < li_RowInt ) THEN
		ldtm_StartNext	= ids_ReqInt.GetItemDateTime( li_Index + 1 , "int_start_date" )
		
		//ถ้าวันที่เริ่มต้นในแถวถัดไป ไม่เท่ากับ วันที่สุดท้าย +1 = Error			
		IF ( Date( ldtm_StartNext ) <> Date( ldtm_NextDate ) )THEN
			Destroy(ids_ReqDetail)
			Destroy(ids_ReqMaster)
			Destroy(ids_ReqInt)
			
			ithw_Exception.Text	+= "ข้อมูลดอกเบี้ยไม่สัมพันธ์ วันที่เริ่มต้นของแถวถัดไปต้องเป็นวันจากวันที่สิ้นสุดแถวก่อนหน้า"
			ROLLBACK USING itr_SQLCA ;
			THROW ithw_Exception
		END IF
	END IF
	
NEXT

// ตรวจสอบ วันที่ครบกำหนด กับวันสุดท้ายของอัตราดอกเบี้ย
IF Date(ldtm_End) < Date(ldtm_DueDate) THEN
	Destroy(ids_ReqDetail)
	Destroy(ids_ReqMaster)
	Destroy(ids_ReqInt)
	
	ithw_Exception.Text	+= "ข้อมูลไม่สัมพันธ์กัน วันครบกำหนดมากกว่าวันสิ้นสุดในตารางดอกเบี้ยแถวสุดท้าย"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

RETURN SUCCESS
end function

public function string of_err_generate_import_xml (integer ai_error);choose case ai_Error
	case	-1   
		return "No rows or startrow value supplied is greater than the number of rows in the string"
	case	-3
		return "Invalid argument"
	case	-4
		return "Invalid input"
	case	-11
		return "XML Parsing Error; XML parser libraries not found or XML not well formed"
	case	-12
		return "XML Template does not exist or does not match the DataWindow"
	case	-13
		return "Unsupported DataWindow style for import"
	case	-14
		return "Error resolving DataWindow nesting"
	case else
		return "No Error Message"
end choose
end function

public function integer of_savepmreq (string as_main_xml, string as_detail_xml, string as_interate_xml) throws Exception;string		ls_investaccno, ls_InvestReqNo
integer	li_savemain , li_savedet , li_saveint , li_saveslip
integer	li_savemaster , li_savestm , li_saveaccint , li_checkbfsave

//ตรวจสอบข้อมูล
This.of_checkbeforesavepmreq( as_main_xml  , as_detail_xml , as_interate_xml)

//ดึงเลขที่บัญชี เงินลงทุน
ls_investaccno		=	This.of_GetDocumentNo(is_CoopContrl, "INVESTACCOUNT" )
IF isnull(ls_investaccno) or ls_investaccno = "" or  ls_investaccno = "NO" THEN
	ithw_Exception.Text	+= "ดึงเลขที่เอกสารไม่ได้ "
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_ReqDetail)
	Destroy(ids_ReqMaster)
	Destroy(ids_ReqInt)
	THROW ithw_Exception
END IF
ls_investaccno	= Right( "0000000000" + ls_investaccno , 10 )

//ดึงเลขที่บัญชี เงินลงทุน
ls_InvestReqNo		=	This.of_GetDocumentNo(is_CoopContrl, "INVESTDOCNO" )
IF isnull(ls_InvestReqNo) or ls_InvestReqNo = "" or  ls_InvestReqNo = "NO" THEN
	ithw_Exception.Text	+= "ดึงเลขที่เอกสารไม่ได้ "
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_ReqDetail)
	Destroy(ids_ReqMaster)
	Destroy(ids_ReqInt)
	THROW ithw_Exception
END IF
ls_InvestReqNo	= Right( "0000000000" + ls_InvestReqNo , 10 )

//-	PMINVESTSLIP
This.of_saveslippmreq( ls_InvestAccNo  ) 

//-	pminvestmaster
This.of_savemasterpmreq( ls_InvestAccNo) 

//-	PMINVESTSTATEMENT
This.of_savestatemnetpmreq( ls_InvestAccNo  ) 

//-	PMINVESTINTRATE
This.of_saveaccintpmreq( ls_InvestAccNo ) 


//update MAIN
This.of_savemainpmreg( ls_InvestAccNo, ls_InvestReqNo  ) 


//update DETAIL
This.of_savedetailpmreg( ls_InvestReqNo) 


//update INTERATE
This.of_saveintpmreg( ls_InvestReqNo  ) 

		
is_slipno	= ""

COMMIT USING itr_SQLCA ;

Destroy(ids_ReqMaster)
Destroy(ids_ReqDetail)
Destroy(ids_ReqInt)

RETURN SUCCESS
end function

public function integer of_saveaccintpmreq (string as_accountno) throws Exception;integer	li_RcInt , li_IndexDetail , li_RowDetail
string		ls_coopid , ls_accountno , ls_entryid , ls_intdesc
string		ls_coopidint
datetime	ldtm_intstartdate , ldtm_intenddate
dec{7}	ldc_intrate , ldc_intyieldrate


li_RowDetail	= ids_ReqInt.RowCount( )

FOR li_IndexDetail = 1 TO li_RowDetail
	ldtm_intstartdate	= ids_ReqInt.getitemdatetime( li_IndexDetail , "int_start_date" )
	ldtm_intenddate	= ids_ReqInt.getitemdatetime( li_IndexDetail , "int_end_date" )
	ldc_intrate			= ids_ReqInt.getitemdecimal( li_IndexDetail , "int_rate" )
	ldc_intyieldrate		= ids_ReqInt.getitemdecimal( li_IndexDetail , "int_yield_rate" )
	ls_intdesc			= trim(ids_ReqInt.getitemstring( li_IndexDetail , "int_desc" ))
	
	//INSERT
	INSERT INTO PMINVESTINTRATE  
	( COOP_ID,   
	  ACCOUNT_NO,   
	  SEQ_NO,   
	  INT_START_DATE,   
	  INT_END_DATE,   
	  INT_RATE,   
	  INT_YIELD_RATE,   
	  INT_DESC )  
	VALUES
	( :is_CoopContrl,   
	  :as_AccountNo,   
	  :li_IndexDetail,   
	  :ldtm_intstartdate,   
	  :ldtm_intenddate,   
	  :ldc_intrate,   
	  :ldc_intyieldrate,   
	  :ls_intdesc ) USING itr_SQLCA ;	
	
	IF itr_SQLCA.sqlcode <> 0 THEN
		ithw_Exception.Text	+= "ไม่สามารถบันทึก อัตราดอกเบี้ย ได้"  + " " + itr_SQLCA.SqlErrText
		ROLLBACK USING itr_SQLCA ;
		Destroy(ids_ReqInt)
		THROW ithw_Exception
	END IF

NEXT

RETURN SUCCESS
end function

public function integer of_savedetailpmreg (string as_reqdocno) throws Exception;Integer	li_rc, li_Index
String		ls_moneycode ,	ls_accountid, ls_bankaccno, ls_bankbranch, ls_bankcode
Dec{2}	ldc_itemnet

FOR li_Index = 1 TO ids_ReqDetail.RowCount()
	ids_ReqDetail.SetItem( li_Index, "seq_no", li_Index )
	ids_ReqDetail.SetItem( li_Index, "reqinvestment_no", as_reqdocno )
	ids_ReqDetail.SetItem( li_Index, "coop_id", is_CoopContrl )
	
	ls_moneycode	= ids_ReqDetail.GetItemString( li_Index, "money_code" )
	ls_accountid		= ids_ReqDetail.GetItemString( li_Index, "account_id" )
	ls_bankaccno	= ids_ReqDetail.GetItemString( li_Index, "bank_account_no" )
	ls_bankbranch	= ids_ReqDetail.GetItemString( li_Index, "bank_branch" )
	ls_bankcode		= ids_ReqDetail.GetItemString( li_Index, "bank_code" )
	ldc_itemnet		= ids_ReqDetail.GetItemDecimal( li_Index, "money_amount" )
	
	This.of_PostToSlip_Det( is_slipno, is_CoopContrl,li_Index, ls_moneycode , &
			ls_accountid, ldc_itemnet, ls_bankaccno, ls_bankbranch, ls_bankcode  )
NEXT

ids_ReqDetail.AcceptText()

IF ids_ReqDetail.UPDATE() <> 1 THEN
	ithw_Exception.text	+= "ไม่สามารถบันทึก DETAIL ได้ " + ids_ReqDetail.of_geterrormessage( )
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF


RETURN SUCCESS
end function

public function integer of_saveintpmreg (string as_reqdocno) throws Exception;integer	li_rc, li_Index

FOR li_Index = 1 To ids_ReqInt.RowCount()
	ids_ReqInt.SetItem( li_Index, "seq_no", li_Index )
	ids_ReqInt.SetItem( li_Index, "reqinvestment_no", as_ReqDocNo )
	ids_ReqInt.SetItem( li_Index, "coop_id", is_CoopContrl )
NEXT

ids_ReqInt.AcceptText()

if ids_ReqInt.UPDATE() <> 1 then
	ithw_Exception.Text	+= "ไม่สามารถบันทึก INTERATE ได้ " + ids_ReqInt.of_geterrormessage( )
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_ReqDetail)
	Destroy(ids_ReqMaster)
	Destroy(ids_ReqInt)
	THROW ithw_Exception
end if

RETURN SUCCESS
end function

public function integer of_savemainpmreg (string as_accountno, string as_reqdocno) throws Exception;integer	li_rc

// Set the value of account , slip no
ids_ReqMaster.SetItem(1, "reqinvestment_no", as_ReqDocNo)
ids_ReqMaster.SetItem(1, "account_no", as_AccountNo )
ids_ReqMaster.SetItem(1, "coop_id", is_CoopContrl )
ids_ReqMaster.Accepttext()

IF ids_ReqMaster.UPDATE() <> 1 THEN
	ithw_Exception.text	+= "ไม่สามารถบันทึก MAIN ได้ " + ids_ReqMaster.of_geterrormessage( )
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_ReqDetail)
	Destroy(ids_ReqMaster)
	Destroy(ids_ReqInt)
	THROW ithw_Exception
END IF

RETURN SUCCESS
end function

public function integer of_savemasterpmreq (string as_accountno) throws Exception;integer	li_rc, li_SlipStatus, li_InvestPeriodUnit, li_IntTimeDue
string		ls_CoopID , ls_slipno , ls_AccountNo , ls_entryid , ls_cancelid
datetime	ldtm_OperateDate , ldtm_entrydate , ldtm_canceldate, ldtm_BuyDate
dec{2}	ldc_ItemAmt , ldc_intamt , ldc_taxamt , ldc_fineamt , ldc_itemnetamt
string		ls_InvSourceCode , ls_InvestTypeCode , ls_BranchID , ls_reqinvestmentno
string		ls_AccidPrnc , ls_SymbolCode , ls_RateCode , ls_InvestmentDocNo, ls_Warranty
String		ls_InvestDetail, ls_AccountName
datetime	ldtm_DueDate, ldtm_PushDate, ldtm_CallDate
dec{2}	ldc_UnitCost, ldc_Balance, ldc_DeffAmt, ldc_AccuIntAmt, ldc_CleanPriceAmt
Long		ll_UnitAmt, ll_InvestPeriod
Dec{7}	ldc_TaxRate, ldc_IntPresentRate, ldc_DurationDue
String		ls_BankCode, ls_BankBranch, ls_TranBankAccNo, ls_AccIdInt, ls_Remark
Integer	li_PushStatus, li_CallStatus, li_Subordinated, li_NoDueFlag

ls_CoopID					= trim(ids_ReqMaster.GetItemString( 1 , "coop_id" ))
ls_AccountNo				= as_AccountNo
ls_InvSourceCode			= trim(ids_ReqMaster.GetItemString( 1 , "invsource_code" ))
ls_InvestTypeCode			= trim(ids_ReqMaster.GetItemString( 1 , "investtype_code" ))
ls_reqinvestmentno		= trim(ids_ReqMaster.GetItemString( 1 , "reqinvestment_no" ))
ls_BranchID					= trim(ids_ReqMaster.GetItemString( 1 , "branch_id" ))
ls_AccidPrnc					= trim(ids_ReqMaster.GetItemString( 1 , "accid_prnc" ))
ls_SymbolCode				= trim(ids_ReqMaster.GetItemString( 1 , "symbol_code" ))
ls_RateCode					= trim(ids_ReqMaster.GetItemString( 1 , "rate_code" ))
ls_InvestmentDocNo		= trim(ids_ReqMaster.GetItemString( 1 , "investment_docno" ))
ls_Warranty					= trim(ids_ReqMaster.GetItemString( 1 , "organ_warranty" ))
ls_InvestDetail				= trim(ids_ReqMaster.GetItemString( 1 , "invest_detail" ))
ls_AccountName			= trim(ids_ReqMaster.GetItemString( 1 , "account_name" ))

ls_BankCode				= trim(ids_ReqMaster.GetItemString( 1 , "bank_code" ))
ls_BankBranch				= trim(ids_ReqMaster.GetItemString( 1 , "bank_branch" ))
ls_TranBankAccNo			= trim(ids_ReqMaster.GetItemString( 1 , "tran_bankacc_no" ))
ls_AccIdInt					= trim(ids_ReqMaster.GetItemString( 1 , "accid_int" ))
ls_Remark					= trim(ids_ReqMaster.GetItemString( 1 , "remark" ))

ldc_ItemAmt				= ids_ReqMaster.GetItemDecimal( 1 , "purchase_price" )
ldc_UnitCost					= ids_ReqMaster.GetItemDecimal( 1 , "unit_cost" )
ldc_Balance					= ids_ReqMaster.GetItemDecimal( 1 , "maturity_price" )
ldc_TaxRate					= ids_ReqMaster.GetItemDecimal( 1 , "tax_rate" )
ldc_IntPresentRate			= ids_ReqMaster.GetItemDecimal( 1 , "int_present_rate" )
ldc_DurationDue			= ids_ReqMaster.GetItemDecimal( 1 , "duration_due" )
ldc_DeffAmt					= ids_ReqMaster.GetItemDecimal( 1 , "deff_amt" )
ldc_CleanPriceAmt			= ids_ReqMaster.GetItemDecimal( 1 , "cleanprice_amt" )
ldc_AccuIntAmt				= ids_ReqMaster.GetItemDecimal( 1 , "accuint_amt" )

ldtm_OperateDate			= ids_ReqMaster.GetItemDateTime( 1 , "open_date" )
ldtm_DueDate				= ids_ReqMaster.GetItemDateTime( 1 , "due_date" )
ldtm_BuyDate				= ids_ReqMaster.GetItemDateTime( 1 , "buy_date" )
ldtm_PushDate				= ids_ReqMaster.GetItemDateTime( 1 , "push_date" )
ldtm_CallDate				= ids_ReqMaster.GetItemDateTime( 1 , "call_date" )

ll_InvestPeriod				= ids_ReqMaster.GetItemNumber( 1 , "investment_period" )
li_InvestPeriodUnit			= ids_ReqMaster.GetItemNumber( 1 , "invest_period_unit" )
li_IntTimeDue				= ids_ReqMaster.GetItemNumber( 1 , "int_timedue" )
ll_UnitAmt					= ids_ReqMaster.GetItemNumber( 1 , "unit_amt" )
li_PushStatus				= ids_ReqMaster.GetItemNumber( 1 , "push_status" )
li_CallStatus					= ids_ReqMaster.GetItemNumber( 1 , "call_status" )
li_Subordinated				= ids_ReqMaster.GetItemNumber( 1 , "subordinated" )
li_NoDueFlag				= ids_ReqMaster.GetItemNumber( 1 , "nodue_flag" )

ldc_intamt	=	0
ldc_taxamt	=	0
ldc_fineamt	=	0

ldc_itemnetamt	=	ldc_ItemAmt
li_SlipStatus		=	1

IF IsNull (ldc_AccuIntAmt) THEN ldc_AccuIntAmt = 0.00

IF IsNull (ls_BranchID) or Trim (ls_BranchID) = "" THEN ls_BranchID = "001"
IF IsNull (ls_CoopID) or Trim (ls_CoopID) = "" THEN ls_CoopID = is_CoopContrl

// คำนวณส่วนเกินส่วนต่ำ

//INSERT
INSERT INTO pminvestmaster  
( COOP_ID,  
  ACCOUNT_NO,  
  INVSOURCE_CODE, 
  INVESTTYPE_CODE,   
  BRANCH_ID,   			// 5
  OPEN_DATE,  
  DUE_DATE,   
  CLOSE_STATUS,   
  CLOSE_DATE,   
  ACCOUNT_NAME,   		// 10
  COND_WITHDRAW,   
  INT_PRESENT_RATE,   
  TAX_RATE,   
  BANK_CODE,   
  BANK_BRANCH,   		// 15
  TRAN_BANKACC_NO,   
  TRANACC_NAME,   
  PRNCBAL,   
  LASTCALINT_DATE,   
  ACCUINT_AMT,   		// 20
  INTARREAR_AMT,   
  ACCUINTRCV_AMT,   
  ACCUTAXPAY_AMT,   
  WITHDRAW_COUNT,   
  LASTSTMSEQ_NO,   	// 25
  LASTACCESS_DATE,   
  REMARK,   
  INT_RCV_ABLE,   
  INT_RCV_ABLE_SUM,   
  START_INTDATE,   		// 30
  UNIT_AMT,   
  UNIT_COST,   
  ACCID_PRNC,   
  PURCHASE_PRICE,   
  SYMBOL_CODE,   		// 35
  RATE_CODE,   
  PUSH_STATUS,   
  PUSH_DATE,   
  CALL_STATUS,   
  CALL_DATE,   			// 40
  INVESTMENT_DOCNO,
  INVESTMENT_PERIOD,
  INVEST_PERIOD_UNIT,
  ORGAN_WARRANTY,
  INVEST_DETAIL,			// 45
  DURATION_DUE,
  BUY_DATE,
  INT_TIMEDUE,
  DEFF_AMT,
  SUBORDINATED,			// 50
  CLEANPRICE_AMT,
  ACCID_INT,
  NODUE_FLAG
)  
VALUES
( :ls_CoopID ,   
  :ls_AccountNo ,   
  :ls_InvSourceCode ,   
  :ls_InvestTypeCode ,   
  :ls_BranchID ,				// 5
  :ldtm_OperateDate ,   
  :ldtm_DueDate ,   
  0,   
  null,   
  :ls_AccountName,   		// 10
  null,   
  :ldc_IntPresentRate,   
  :ldc_TaxRate,  
  :ls_BankCode,   
  :ls_BankBranch,			// 15
  :ls_TranBankAccNo,   
  :ls_AccountName,   
  :ldc_Balance,   
  :ldtm_OperateDate,   
  :ldc_AccuIntAmt,			// 20
  0.00,   
  0.00,   
  0.00,   
  0,   
  1,   							// 25
  :ldtm_OperateDate,   
  :ls_Remark,   
  0.00,   
  0.00,   
  :ldtm_OperateDate,		// 30
  :ll_UnitAmt,   
  :ldc_UnitCost,   
  :ls_AccidPrnc,   
  :ldc_ItemAmt,   
  :ls_SymbolCode,   		// 35
  :ls_RateCode ,   
  :li_PushStatus,   
  :ldtm_PushDate,   
  :li_CallStatus,   
  :ldtm_CallDate,			// 40
  :ls_InvestmentDocNo,
  :ll_InvestPeriod,
  :li_InvestPeriodUnit,
  :ls_Warranty,
  :ls_InvestDetail,			// 45
  :ldc_DurationDue,
  :ldtm_BuyDate,
  :li_IntTimeDue,
  :ldc_DeffAmt,
  :li_Subordinated,			// 50
  :ldc_CleanPriceAmt,
  :ls_AccIdInt,
  :li_NoDueFlag)
 USING itr_SQLCA ;

IF itr_SQLCA.sqlcode <> 0 THEN
	ithw_Exception.text	+= "ไม่สามารถบันทึก MASTER ได้"  + " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_ReqDetail)
	Destroy(ids_ReqMaster)
	Destroy(ids_ReqInt)
	THROW ithw_Exception
END IF

RETURN SUCCESS
end function

public function integer of_saveslippmreq (string as_accountno) throws Exception;integer	li_rc, li_SlipStatus
String		ls_CoopID , ls_SlipNo , ls_AccountNo , ls_EntryID , ls_CancelID
Dec{2}	ldc_ItemAmt , ldc_IntAmt , ldc_TaxAmt , ldc_FineAmt , ldc_ItemNetAmt

DateTime	ldtm_OperateDate , ldtm_EntryDate , ldtm_CancelDate

ls_CoopID			= Trim(ids_ReqMaster.GetItemString( 1 , "coop_id" ))
ls_AccountNo		= as_accountno
ldtm_OperateDate	= ids_ReqMaster.GetItemDateTime( 1 , "open_date" )
ldc_ItemAmt		= ids_ReqMaster.GetItemDecimal( 1 , "purchase_price" )
li_SlipStatus			= 1
IF IsNull (ls_CoopID) or Trim (ls_CoopID) = "" THEN ls_CoopID = is_CoopContrl

//SLIP_NO
ls_SlipNo		=	this.of_GetDocumentNo( ls_CoopID, "INVESTSLIP" )
IF IsNull(ls_SlipNo) or ls_SlipNo = "" or  ls_SlipNo = "NO" THEN
	ithw_Exception.Text	+= "ไม่สามารถดึงเลขที่เอกสาร SLIP_NO ได้"
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_ReqDetail)
	Destroy(ids_ReqMaster)
	Destroy(ids_ReqInt)
	THROW ithw_Exception
else
	ls_SlipNo		= Right( "0000000000" + ls_SlipNo , 10 )
	is_slipno		=	ls_SlipNo
END IF

ldc_IntAmt	=	0.00
ldc_TaxAmt	=	0.00
ldc_FineAmt	=	0.00

ldc_ItemNetAmt	=	ldc_ItemAmt
li_SlipStatus			= 1

//INSERT
INSERT INTO PMINVESTSLIP (
	COOP_ID,   
	SLIP_NO,   
	ACCOUNT_NO,   
	OPERATE_DATE,   
	ITEM_AMOUNT,   
	INT_AMOUNT,   
	TAX_AMOUNT,  
	FINE_AMOUNT,  
	ITEM_NET_AMOUNT,  
	ENTEY_ID,   
	ENTRY_DATE,   
	SLIP_STATUS,   
	CANCEL_ID,   
	CANCEL_DATE )  
VALUES (
	:ls_CoopID,   
	:ls_SlipNo,   
	:ls_AccountNo,   
	:ldtm_OperateDate,   
	:ldc_ItemAmt,   
	:ldc_IntAmt,   
	:ldc_TaxAmt,   
	:ldc_FineAmt,   
	:ldc_ItemNetAmt,   
	:ls_EntryID,   
	:ldtm_EntryDate,   
	:li_SlipStatus,   
	:ls_CancelID,   
	:ldtm_CancelDate )
USING itr_SQLCA ;
		
IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถบันทึก SLIP ได้" + " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_ReqDetail)
	Destroy(ids_ReqMaster)
	Destroy(ids_ReqInt)
	THROW ithw_Exception
END IF

RETURN SUCCESS
end function

public function integer of_savestatemnetpmreq (string as_accountno) throws Exception;integer	li_rc , li_seqno
string		ls_coopid , ls_slipno , ls_accountno , ls_itemcode , ls_slipstatus
String		ls_EntryID
datetime	ldtm_OperateDate , ldtm_movmentdate , ldtm_effecdate , ldtm_EntryDate
dec{2}	ldc_ItemAmt , ldc_taxamt , ldc_fineamt , ldc_itemnetamt


ls_coopid			= trim(ids_ReqMaster.getitemstring( 1 , "coop_id" ))
ls_accountno	= as_accountno
ls_EntryID		= trim(ids_ReqMaster.getitemstring( 1 , "entry_id" ))
ldc_ItemAmt	= ids_ReqMaster.getitemdecimal( 1 , "maturity_price" )

ldtm_OperateDate	= ids_ReqMaster.getitemdatetime( 1 , "open_date" )
ldtm_EntryDate		= ids_ReqMaster.getitemdatetime( 1 , "entry_date" )


ls_itemcode					= "OAC"
ldtm_movmentdate		= ldtm_OperateDate
ldtm_effecdate				= ldtm_OperateDate

IF IsNull(li_seqno) THEN li_seqno = 0
li_seqno ++

//INSERT
INSERT INTO PMINVESTSTATEMENT  
( COOP_ID,   
  ACCOUNT_NO,   
  SEQ_NO,   
  MOVEMENT_DATE,   
  EFFECTIVE_DATE,   
  ITEM_CODE,   
  ITEM_SIDE,
  ITEM_AMOUNT,
  BALANCE_BEFORE,   
  OUTSTANDING_BALANCE,   
  ENTRY_ID,   
  ENTRY_DATE,   
  SLIPOPERATE_NO )  
VALUES ( :ls_coopid,   
  :ls_accountno,   
  :li_seqno,   
  :ldtm_movmentdate,   
  :ldtm_effecdate,   
  :ls_itemcode,   
  1,
  :ldc_ItemAmt,
  0.00,   
  :ldc_ItemAmt,   
  :ls_EntryID,   
  :ldtm_EntryDate ,   
  :is_SlipNo ) USING itr_SQLCA ;

IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถบันทึก STATEMENT ได้"  + " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_ReqDetail)
	Destroy(ids_ReqMaster)
	Destroy(ids_ReqInt)
	THROW ithw_Exception
END IF


RETURN SUCCESS
end function

public function string of_get_rcvint_list (datetime adtm_begindate, datetime adtm_enddate) throws Exception;String		ls_XML
n_ds		lds_RcvIntList
Integer	li_RowCount

lds_RcvIntList = CREATE n_ds
lds_RcvIntList.DataObject = "d_recperiod_int_list"
lds_RcvIntList.SetTransObject( itr_SQLCA )

li_RowCount		= lds_RcvIntList.Retrieve( adtm_begindate, adtm_enddate )

IF ( li_RowCount > 0 ) THEN
	ls_XML	= lds_RcvIntList.Describe( "Datawindow.data.XML" )
END IF

Destroy(lds_RcvIntList)
RETURN ls_XML
end function

public function string of_calint_rcv_list (string as_xml) throws Exception;String		ls_XML
n_ds		lds_RcvIntList
Integer	li_RowCount, li_Index 
String		ls_CoopID, ls_AccountNo
Dec{2}	ldc_Balance, ldc_IntAmt, ldc_TaxAmt
Dec{7}	ldc_TaxRate

DateTime	ldtm_CalIntFrom, ldtm_CalIntTo
	
lds_RcvIntList = CREATE n_ds
lds_RcvIntList.DataObject = "d_recperiod_int_list"
lds_RcvIntList.SetTransObject( itr_SQLCA )

IF Not  IsNull( as_xml ) and Trim( as_xml ) <> ""  THEN
	li_RowCount	= inv_XmlieService.of_XmlImport( lds_RcvIntList, as_xml )
	IF ( li_RowCount < 1 ) THEN
		Destroy(lds_RcvIntList)
		ithw_Exception.Text	+= "ไม่สามารถรับข้อมูลเพื่อคำนวณได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(lds_RcvIntList)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML มายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

FOR li_Index = 1 TO li_RowCount
	ls_CoopID			= lds_RcvIntList.GetItemString( li_Index, "coop_id" )
	ls_AccountNo		= lds_RcvIntList.GetItemString( li_Index, "account_no" )
	ldc_Balance			= lds_RcvIntList.GetItemDecimal( li_Index, "prncbal" )
	ldc_TaxRate			= lds_RcvIntList.GetItemDecimal( li_Index, "tax_rate" )
	ldtm_CalIntFrom	= lds_RcvIntList.GetItemDateTime( li_Index, "start_calint_date" )
	ldtm_CalIntTo		= lds_RcvIntList.GetItemDateTime( li_Index, "last_cal_to_date" )
	
	IF IsNull( ldc_TaxRate ) THEN ldc_TaxRate = 0.00
	
	ldc_IntAmt	= This.of_Compute_Int(ls_AccountNo,ls_CoopID,ldc_Balance, ldtm_CalIntFrom, ldtm_CalIntTo  )
	ldc_TaxAmt	= ( ldc_IntAmt * ldc_TaxRate ) / 100
	
	lds_RcvIntList.SetItem( li_Index, "item_interest", ldc_IntAmt )
	lds_RcvIntList.SetItem( li_Index, "item_tax", ldc_TaxAmt )
	
NEXT

lds_RcvIntList.AcceptText()

ls_XML	= lds_RcvIntList.Describe( "Datawindow.data.XML" )

Destroy(lds_RcvIntList)
RETURN ls_XML
end function

public function integer of_postint_rcv_list (string as_xml, datetime adtm_operate, datetime adtm_entrydate, string as_entryid) throws Exception;String		ls_XML
n_ds		lds_RcvIntList
Integer	li_RowCount, li_Index, li_Selected
String		ls_CoopID, ls_AccountNo, ls_SlipNo
String		ls_BankCode, ls_BankBranch, ls_TranBankAccNo, ls_AccIdInt
Dec{2}	ldc_Balance, ldc_IntAmt, ldc_TaxAmt, ldc_ItemNet, ldc_BalanceCalInt

DateTime	ldtm_CalIntFrom, ldtm_CalIntTo, ldtm_DueDate
	
lds_RcvIntList = CREATE n_ds
lds_RcvIntList.DataObject = "d_recperiod_int_list"
lds_RcvIntList.SetTransObject( itr_SQLCA )

IF Not  IsNull( as_xml ) and Trim( as_xml ) <> ""  THEN
	li_RowCount	= inv_XmlieService.of_XmlImport( lds_RcvIntList, as_xml )
	IF ( li_RowCount < 1 ) THEN
		Destroy(lds_RcvIntList)
		ithw_Exception.Text	+= "ไม่สามารถรับข้อมูลเพื่อทำการผ่านรายการดอกเบี้ยได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(lds_RcvIntList)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML มายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

FOR li_Index = 1 TO li_RowCount
	li_Selected	= 0
	li_Selected	= lds_RcvIntList.GetItemNumber( li_Index, "item_selected" )
	IF IsNull( li_Selected ) THEN li_Selected = 0
	
	IF (li_Selected = 0) THEN CONTINUE
	
	ls_CoopID		= lds_RcvIntList.GetItemString( li_Index, "coop_id" )
	ls_AccountNo	= lds_RcvIntList.GetItemString( li_Index, "account_no" )
	ldc_Balance		= lds_RcvIntList.GetItemDecimal( li_Index, "prncbal" )
	
	ldtm_CalIntFrom	= lds_RcvIntList.GetItemDateTime( li_Index, "lastcalint_date" )
	ldtm_CalIntTo		= lds_RcvIntList.GetItemDateTime( li_Index, "last_cal_to_date" )	
	ldtm_DueDate		= lds_RcvIntList.GetItemDateTime( li_Index, "due_date" )	
	
	ldc_IntAmt	= lds_RcvIntList.GetItemDecimal( li_Index, "item_interest" )
	ldc_TaxAmt	= lds_RcvIntList.GetItemDecimal( li_Index, "item_tax" )
	
	IF IsNull( ldc_IntAmt ) THEN ldc_IntAmt = 0.00
	IF IsNull( ldc_TaxAmt ) THEN ldc_TaxAmt = 0.00
	
	ldc_BalanceCalInt	= ldc_Balance
	ldc_ItemNet			= ldc_IntAmt - ldc_TaxAmt
	
	ls_BankCode		= lds_RcvIntList.GetItemString( li_Index, "bank_code" )
	ls_BankBranch		= lds_RcvIntList.GetItemString( li_Index, "bank_branch" )
	ls_TranBankAccNo	= lds_RcvIntList.GetItemString( li_Index, "tran_bankacc_no" )
	ls_AccIdInt			= lds_RcvIntList.GetItemString( li_Index, "accid_int" )
	
	IF IsNull (ls_AccIdInt) THEN
		ithw_Exception.Text	+= "ระบุข้อมูลไม่สมบูรณ์ กรุณาตรวจสอบ รหัสบันทึกบัญชีรับดอกเบี้ย"
		ROLLBACK USING itr_SQLCA ;
		Destroy(lds_RcvIntList)
		THROW ithw_Exception
	END IF
	
	// ดอกเบี้ย
	IF (ldc_IntAmt > 0) THEN
		// บันทึกลง  PMINVESTSLIP
		ls_SlipNo	= This.of_PostToSlip(ls_CoopID,ls_AccountNo, adtm_operate, adtm_entrydate, &
							as_entryid, 0.00,ldc_IntAmt, ldc_TaxAmt, 0.00 )
		
		// บันทึกลง  PMINVESTSLIPDET
		This.of_PostToSlip_Det(ls_SlipNo, ls_CoopID, 1, "CBT", ls_AccIdInt, &
							ldc_ItemNet , ls_TranBankAccNo ,ls_BankBranch, ls_BankCode )
							
		// รายการเคลื่อนไหว PMINVESTSTATEMENT
		// ดอกเบี้ย
		This.of_PostToStatement(ls_CoopID, ls_AccountNo, adtm_operate, adtm_entrydate, ldc_IntAmt, &
				"INT", 1, ldc_Balance, ls_SlipNo, as_EntryID )
		
		// ภาษี
		ldc_Balance	= ldc_Balance + ldc_IntAmt
		IF ( ldc_TaxAmt > 0 ) THEN			
			This.of_PostToStatement(ls_CoopID, ls_AccountNo, adtm_operate, adtm_entrydate, ldc_TaxAmt, &
				"TAX", -1, ldc_Balance, ls_SlipNo, as_EntryID )
		END IF
		
		// ค่าปรับ -- ไม่มีในกรณีนี้
		
		// ถอนออกยอดสุทธิ
		ldc_Balance	= ldc_Balance - ldc_TaxAmt			
		This.of_PostToStatement(ls_CoopID, ls_AccountNo, adtm_operate, adtm_entrydate, ldc_ItemNet, &
			"WTD", -1, ldc_Balance, ls_SlipNo, as_EntryID )
				
		// บัญชีหลักเงินลงทุน PMINVESTMASTER
		UPDATE	PMINVESTMASTER
		      SET	accuintrcv_amt = accuintrcv_amt + :ldc_IntAmt,
					accutaxpay_amt = accutaxpay_amt + :ldc_TaxAmt,
					laststmseq_no = laststmseq_no + 3,
					lastcalint_date = :ldtm_CalIntTo,
					lastaccess_date = :adtm_operate
		WHERE	coop_id = :ls_CoopID
		     AND	account_no = :ls_AccountNo
		  USING	itr_SQLCA ;
		
		IF itr_SQLCA.SqlCode <> 0 THEN
			ithw_Exception.Text	+= "ไม่สามารถปรับปรุงข้อมูล PMINVESTMASTER ได้" + " " + itr_SQLCA.SqlErrText
			ROLLBACK USING itr_SQLCA ;
			Destroy(lds_RcvIntList)
			THROW ithw_Exception
		END IF

		// ประวัติการรับดอกเบี้ย PMINTTAXSTATEMENT
		This.of_PostTo_RcvInt_History( ls_CoopID,ls_AccountNo, adtm_Operate, ldc_BalanceCalInt, &
				ldtm_CalIntFrom, ldtm_CalIntTo, ldc_IntAmt, ldc_TaxAmt)
		
	END IF
	
	// Update ว่างวดนี้ รับดอกเบี้ยไปแล้ว
	UPDATE pminvestduedate
	      SET recint_flag = 1
	 WHERE coop_id = :ls_CoopID
	      AND account_no = :ls_AccountNo
		 AND due_date = :ldtm_DueDate
	  USING itr_SQLCA ;
	
	IF itr_SQLCA.SqlCode <> 0 THEN
		ithw_Exception.Text	+= "ไม่สามารถปรับปรุงข้อมูล PMINVESTDUEDATE ได้" + " " + itr_SQLCA.SqlErrText
		ROLLBACK USING itr_SQLCA ;
		Destroy(lds_RcvIntList)
		THROW ithw_Exception
	END IF
		
NEXT

COMMIT USING itr_SQLCA;

Destroy(lds_RcvIntList)
RETURN SUCCESS
end function

public function string of_setslipmain_withdraw (string as_slipmain_xml, string as_accountno) throws Exception;Integer		li_rc, li_INVESTMENT_PERIOD, li_INVESTPERIODUNIT
String			ls_COOP_ID	,ls_INVSOURCE_CODE ,ls_INVESTTYPE_CODE	,ls_BRANCH_ID	,ls_ACCOUNT_NAME
String			ls_RATE_CODE	,ls_INVESTMENT_DOCNO , ls_ACCID_PRNC, ls_SYMBOL_CODE
Dec{7}		ldc_INTPRESENTRATE , ldc_TAX_RATE	
Dec{2}		ldc_PRNCBAL, ldc_IntAmount , ldc_FineAmount
Dec{2}		ldc_INTARREAR_AMT	,ldc_ACCUINTRCV_AMT	, ldc_ACCUTAXPAY_AMT , ldc_TaxAmount , ldc_itemnetamt,ldc_accuintamt,ldc_cleanpriceamt
Dec{2}		ldc_PURCHASE_PRICE , ldc_DAY_INYEAR	, ldc_UNIT_COST , ldc_ACCUINT_AMT
DateTime	ldtm_OPEN_DATE	, ldtm_DUE_DATE , ldtm_LASTCALINT_DATE , ldtm_START_INTDATE 
DateTime	ldtm_OperateDate
String			ls_ReturnXML
Long			ll_UNIT_AMT

n_ds		lds_SlipMain

lds_SlipMain	= CREATE n_ds
lds_SlipMain.DataObject = "d_pm_main_withdraw"

IF Not  IsNull( as_SlipMain_XML ) and trim( as_SlipMain_XML ) <> ""  THEN
	li_rc	= inv_XmlieService.of_XmlImport( lds_SlipMain, as_SlipMain_XML )
	IF ( li_rc < 1 ) THEN
		ithw_Exception.Text		+= This.of_Err_Generate_Import_XML( li_rc )
		THROW ithw_Exception
	END IF
ELSE
	ithw_Exception.Text		+= "ไม่มีการส่ง XML ข้อมูลทำรายการหลักมายังตัวบริการ"
	THROW ithw_Exception	
END IF

//ดึงข้อมูลจาก PMMASTER
DECLARE c_Master CURSOR FOR
   SELECT distinct	m.COOP_ID						,		m.INVEST_PERIOD_UNIT		,		m.INVSOURCE_CODE			,		m.INVESTTYPE_CODE		,
			m.BRANCH_ID					,		m.OPEN_DATE						,		m.DUE_DATE					,		m.ACCOUNT_NAME			,
			m.INT_PRESENT_RATE		, 		m.TAX_RATE						,		m.PRNCBAL						,		m.LASTCALINT_DATE 		,		
			m.ACCUINT_AMT				,		m.INTARREAR_AMT				,		m.ACCUINTRCV_AMT		,		m.ACCUTAXPAY_AMT 		, 		
			m.START_INTDATE			,		m.UNIT_AMT						,		m.UNIT_COST					,		m.ACCID_PRNC				,
			m.PURCHASE_PRICE			,		m.SYMBOL_CODE					,		m.RATE_CODE					,		m.INVESTMENT_DOCNO		,		
			m.DAY_INYEAR				,		m.INVESTMENT_PERIOD         ,       d.account_balance
    FROM	pminvestmaster m, pminvestduedate d
  WHERE	m.account_no = :as_AccountNo
       AND	m.coop_id = :is_CoopContrl
       AND m.account_no = d.account_no 
       //AND d.due_date <= sysdate
       AND d.account_balance = (select min(account_balance) from pminvestduedate where account_no = :as_AccountNo) //and due_date <= sysdate) 
    USING	itr_SQLCA ;	

OPEN c_Master ;
FETCH c_Master INTO	:ls_COOP_ID				,		:li_INVESTPERIODUNIT 		,		:ls_INVSOURCE_CODE	,		:ls_INVESTTYPE_CODE	,
								:ls_BRANCH_ID				,		:ldtm_OPEN_DATE				,		:ldtm_DUE_DATE			,		:ls_ACCOUNT_NAME		,
								:ldc_INTPRESENTRATE	,		:ldc_TAX_RATE				,		:ldc_PRNCBAL				,		:ldtm_LASTCALINT_DATE	,
								:ldc_ACCUINT_AMT		,		:ldc_INTARREAR_AMT		,		:ldc_ACCUINTRCV_AMT	,		:ldc_ACCUTAXPAY_AMT	,
								:ldtm_START_INTDATE	,		:ll_UNIT_AMT					,		:ldc_UNIT_COST			,		:ls_ACCID_PRNC			,
								:ldc_PURCHASE_PRICE	,		:ls_SYMBOL_CODE				,		:ls_RATE_CODE			,		:ls_INVESTMENT_DOCNO	,
								:ldc_DAY_INYEAR			,		:li_INVESTMENT_PERIOD     ,        :ldc_cleanpriceamt ;
								
IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่พบเลขที่บัญชีลงทุน" + " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	CLOSE c_Master ;
	Destroy(lds_SlipMain)
	THROW ithw_Exception
END IF

CLOSE c_Master ;

ldtm_OperateDate	= lds_SlipMain.GetItemDateTime( 1, "operate_date" )

//คำนวนดอกเบี้ย
ldc_IntAmount	=	this.of_compute_int(as_AccountNo , ls_COOP_ID , ldc_PRNCBAL , ldtm_LASTCALINT_DATE , ldtm_OperateDate )

IF isnull(ldc_IntAmount) or ldc_IntAmount < 0 THEN	ldc_IntAmount = 0.00

//คำนวนภาษี
ldc_TaxAmount	=	( ldc_IntAmount * ldc_TAX_RATE ) / 100
IF IsNull(ldc_TaxAmount) or ldc_TaxAmount < 0 THEN ldc_TaxAmount	= 0.00

ldc_FineAmount	=	0	//ค่าปรับ
//ldc_itemnetamt		=	ldc_PRNCBAL +  ldc_IntAmount - ldc_TaxAmount - ldc_FineAmount //จำนวนเงินสุทธิ

lds_SlipMain.SetItem( 1	, "coop_id", ls_COOP_ID )
lds_SlipMain.SetItem( 1	, "account_name", ls_ACCOUNT_NAME )
lds_SlipMain.SetItem( 1	, "investment_docno", ls_INVESTMENT_DOCNO )
lds_SlipMain.SetItem( 1	, "accid_prnc", ls_ACCID_PRNC )
lds_SlipMain.SetItem( 1	, "symbol_code", ls_SYMBOL_CODE )
lds_SlipMain.SetItem( 1	, "investtype_code", ls_INVESTTYPE_CODE )
lds_SlipMain.SetItem( 1	, "invsource_code", ls_INVSOURCE_CODE )
lds_SlipMain.SetItem( 1	, "rate_code", ls_RATE_CODE )
lds_SlipMain.SetItem( 1	, "purchase_price", ldc_PURCHASE_PRICE )
lds_SlipMain.SetItem( 1	, "investment_period", li_INVESTMENT_PERIOD )
lds_SlipMain.SetItem( 1	, "invest_period_unit", li_INVESTPERIODUNIT )
lds_SlipMain.SetItem( 1	, "unit_amt", ll_UNIT_AMT )
lds_SlipMain.SetItem( 1	, "unit_cost", ldc_UNIT_COST )
lds_SlipMain.SetItem( 1	, "maturity_price", ldc_PRNCBAL )
lds_SlipMain.SetItem( 1	, "item_amount", ldc_PRNCBAL )
lds_SlipMain.SetItem( 1	, "int_amount", ldc_IntAmount )
lds_SlipMain.SetItem( 1	, "tax_amount", ldc_TaxAmount )
lds_SlipMain.SetItem( 1	, "fine_amount", ldc_FineAmount )
lds_SlipMain.SetItem( 1	, "cleanprice_amt", ldc_cleanpriceamt )
//lds_SlipMain.SetItem( 1	, "item_net_amount", ldc_itemnetamt )
lds_SlipMain.SetItem( 1	, "req_tdate", String( ldtm_OPEN_DATE, 'DDMM' ) + String( Year( Date( ldtm_OPEN_DATE ) )+ 543 ) )
lds_SlipMain.SetItem( 1	, "due_tdate", String( ldtm_DUE_DATE, 'DDMM' ) + String( Year( Date( ldtm_DUE_DATE ) )+ 543 ) )

lds_SlipMain.AcceptText()

ls_ReturnXML	= lds_SlipMain.Describe( "Datawindow.data.XML" )

Destroy(lds_SlipMain)
RETURN ls_ReturnXML
end function

public function string of_posttoslip (string as_coopid, string as_accountno, datetime adtm_operate, datetime adtm_entrydate, string as_entryid, decimal adc_itemamt, decimal adc_intamt, decimal adc_taxamt, decimal adc_fineamt) throws Exception;String		ls_SlipNo
Dec{2}	ldc_ItemNet

ldc_ItemNet	= adc_ItemAmt + adc_IntAmt - adc_TaxAmt - adc_FineAmt
ls_SlipNo		= This.of_GetDocumentNo( as_CoopID, "INVESTSLIP" )

IF IsNull(ls_SlipNo) or ls_SlipNo = "" or  ls_SlipNo = "NO" THEN
	ithw_Exception.Text	+= "ไม่สามารถดึงเลขที่เอกสาร SLIP_NO ได้"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
else
	ls_SlipNo		= Right( "0000000000" + ls_SlipNo , 10 )
END IF

INSERT INTO PMINVESTSLIP  
( COOP_ID,   
  SLIP_NO,   
  ACCOUNT_NO,   
  OPERATE_DATE,   
  ITEM_AMOUNT,   			// 5
  INT_AMOUNT,   
  TAX_AMOUNT,   
  FINE_AMOUNT,   
  ITEM_NET_AMOUNT,   
  ENTEY_ID,   					// 10
  ENTRY_DATE,   
  SLIP_STATUS,   
  CANCEL_ID,   
  CANCEL_DATE )  
VALUES
( :as_CoopID,  
  :ls_SlipNo,
  :as_AccountNo,
  :adtm_Operate,   
  :adc_ItemAmt,   				// 5
  :adc_IntAmt,   
  :adc_TaxAmt,   
  :adc_FineAmt,   
  :ldc_ItemNet,   
  :as_EntryID,   				// 10
  :adtm_EntryDate,   
  1,   
  null,   
  null
 ) USING itr_SQLCA ;

IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถเพื่มรายการใบลงรับดอกเบี้ยได้ " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

// ส่งค่าใบบันทึกรายการกลับไป เพื่อนำไปใช้ต่อ
RETURN ls_SlipNo
end function

public function integer of_postto_rcvint_history (string as_coopid, string as_accountno, datetime adtm_operate, decimal adc_balance, datetime adtm_startcal, datetime adtm_endcal, decimal adc_int, decimal adc_tax) throws Exception;

String		ls_IntTaxDocNo

ls_IntTaxDocNo		= This.of_GetDocumentNo( as_CoopID, "INTTAXDOCNO" )

IF IsNull(ls_IntTaxDocNo) or ls_IntTaxDocNo = "" or  ls_IntTaxDocNo = "NO" THEN
	ithw_Exception.Text	+= "ไม่สามารถดึงเลขที่เอกสารบันทึกประวัติรับดอกเบี้ยได้"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
else
	ls_IntTaxDocNo		= Right( "0000000000" + ls_IntTaxDocNo , 10 )
END IF

INSERT INTO PMINTTAXSTATEMENT (
	COOP_ID,
	INTTAXDOC_NO,
	ACCOUNT_NO,
	RECEIVE_DATE,
	BALANCE_CALINT,
	START_CALINT_DATE ,
	END_CALINT_DATE ,
	INTEREST_AMOUNT ,
	TAX_AMOUNT )
VALUES (
	:as_CoopID,
	:ls_IntTaxDocNo,
	:as_AccountNo,
	:adtm_Operate,
	:adc_balance,
	:adtm_startcal,
	:adtm_endcal,
	:adc_int,
	:adc_tax ) USING itr_SQLCA ;

IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถเพื่มรายการประวัติลงรับดอกเบี้ยได้ " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

RETURN SUCCESS

end function

public function integer of_posttostatement (string as_coopid, string as_accountno, datetime adtm_operate, datetime adtm_entrydate, decimal adc_itemamount, string as_itemcode, integer ai_side, decimal adc_balancebefore, string as_slipno, string as_entryid) throws Exception;Integer	li_SeqNo
Dec{2}	ldc_OutStandingBalance

DECLARE c_MaxSeq CURSOR FOR
  SELECT Max (seq_no)
    FROM pminveststatement
  WHERE coop_id = :as_CoopID
       AND account_no = :as_AccountNo
    USING itr_SQLCA ;

OPEN 	 c_MaxSeq ;
FETCH c_MaxSeq INTO :li_SeqNo ;
CLOSE c_MaxSeq ;

IF IsNull( li_SeqNo ) THEN li_SeqNo = 0
li_SeqNo ++

ldc_OutStandingBalance	= adc_BalanceBefore + (ai_side * adc_ItemAmount )

INSERT INTO PMINVESTSTATEMENT (
	COOP_ID ,
	ACCOUNT_NO ,
	SEQ_NO ,
	MOVEMENT_DATE ,
	EFFECTIVE_DATE ,			// 5
	ITEM_CODE ,
	ITEM_SIDE ,
	ITEM_AMOUNT,
	BALANCE_BEFORE ,
	OUTSTANDING_BALANCE ,	// 10
	ENTRY_ID ,
	ENTRY_DATE ,
	SLIPOPERATE_NO
)
VALUES (
	:as_CoopID,
	:as_AccountNo,
	:li_SeqNo,
	:adtm_Operate,
	:adtm_Operate,				// 5
	:as_ItemCode,
	:ai_Side,
	:adc_ItemAmount,
	:adc_BalanceBefore,
	:ldc_OutStandingBalance,	// 10
	:as_EntryID,
	:adtm_EntryDate,
	:as_SlipNo	
) USING itr_SQLCA ;

IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถบันทึก STATEMENT ได้" + " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

RETURN SUCCESS
end function

public function integer of_posttoslip_det (string as_slipno, string as_coopid, integer ai_seqno, string as_moneycode, string as_accountid, decimal adc_itemnet, string as_bankaccno, string as_bankbranch, string as_bankcode) throws Exception;
INSERT INTO PMINVESTSLIPDET  
( COOP_ID,   
  SLIP_NO,   
  SEQ_NO,   
  MONEY_CODE,   
  ACCOUNT_ID,   			// 5
  BANK_ACCOUNT_NO,   
  BANK_BRANCH,   
  BANK_CODE,   
  MONEY_AMOUNT)  		// 9
VALUES
( :as_CoopID,  
  :as_SlipNo,
  :ai_SeqNo,
  :as_MoneyCode,   
  :as_AccountID,   				// 5
  :as_BankAccNo,   
  :as_BankBranch,   
  :as_BankCode,   
  :adc_ItemNet   				// 9
 ) USING itr_SQLCA ;

IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถเพื่มรายละเอียดการใบลงรับดอกเบี้ยได้ " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF


RETURN SUCCESS
end function

public function integer of_checkbeforesavewd (string as_slip_xml, string as_slipdet_xml) throws Exception;Integer		li_RcDet , li_RowDetail  , li_IndexDetail , li_SeqNo , li_rc , li_rcInt , li_RowInt
Integer		li_Index , li_IndexNext, li_UnitAmt
String			ls_CoopID , ls_accountno , ls_InvSourceCode
String			ls_InvestTypeCode , ls_BranchID , ls_AccidPrnc
String			ls_SymbolCode , ls_RateCode, ls_InvestmentDocNo
String			ls_AccountID, ls_MoneyCode
Dec{2}		ldc_ItemAmt , ldc_IntAmt , ldc_TaxAmt, ldc_FineAmt , ldc_ItemNetAmt , ldc_MoneyAmt
DateTime	ldtm_OperateDate , ldtm_DueDate

// SLIP
ids_Slip		= CREATE n_ds
ids_Slip.DataObject = "d_pm_main_withdraw"
ids_Slip.SetTransObject( itr_SQLCA )

IF not  IsNull( as_Slip_XML ) and Trim( as_Slip_XML ) <> ""  THEN
	li_rc	= inv_XmlieService.of_XmlImport( ids_Slip, as_Slip_XML )
	IF ( li_rc < 1 ) THEN
		Destroy(ids_Slip)
		ithw_Exception.Text	+= "ไม่สามารถดูค่าข้อมูลรายการหลักเพื่อตรวจสอบได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(ids_Slip)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML ข้อมูลรายการหลักมายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

ls_CoopID					= Trim(ids_Slip.GetItemString( 1 , "coop_id" ))
ls_AccountNo				= Trim(ids_Slip.GetItemString( 1 , "account_no" ))
ldtm_OperateDate			= ids_Slip.GetItemDateTime( 1 , "operate_date" )
ldc_ItemAmt				= ids_Slip.GetItemDecimal( 1 , "item_amount" )
ldc_IntAmt					= ids_Slip.GetItemDecimal( 1 , "int_amount" )
ldc_TaxAmt					= ids_Slip.GetItemDecimal( 1 , "tax_amount" )
ldc_FineAmt					= ids_Slip.GetItemDecimal( 1 , "fine_amount" )
ldc_ItemNetAmt			= ids_Slip.GetItemDecimal( 1 , "item_net_amount" )


IF IsNull( ldtm_OperateDate ) Then	
	Destroy(ids_Slip)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุวันที่ถอนเงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF



IF IsNull(ls_CoopID) or ls_CoopID = "" THEN
	Destroy(ids_Slip)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุรหัสสหกรณ์"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ls_AccountNo) or ls_AccountNo = "" THEN
	Destroy(ids_Slip)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุเลขบัญชีลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ldc_ItemAmt) or ldc_ItemAmt < 0  THEN
	Destroy(ids_Slip)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุจำนวนเงิน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ldc_IntAmt) or ldc_IntAmt < 0  THEN
	Destroy(ids_Slip)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุจำนวนค่าดอกเบี้ย"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF ( ldc_TaxAmt < 0 ) THEN
	Destroy(ids_Slip)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ มีการระบุจำนวนค่าภาษีเป็นค่าติดลบ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF ( ldc_FineAmt < 0 ) THEN
	Destroy(ids_Slip)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ มีการระบุจำนวนค่าปรับเป็นค่าติดลบ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF ( ldc_ItemNetAmt < 0 ) THEN
	Destroy(ids_Slip)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ มีการระบุจำนวนเงินสุทธิเป็นค่าติดลบ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF


// SlipDet
ids_SlipDetail		= CREATE n_ds
ids_SlipDetail.DataObject = "d_pm_slipdet_withdraw"
ids_SlipDetail.SetTransObject( itr_SQLCA )

IF Not  IsNull( as_SlipDet_XML ) and Trim( as_SlipDet_XML ) <> ""  THEN
	li_RowDetail	= inv_XmlieService.of_XmlImport( ids_SlipDetail, as_SlipDet_XML )
	IF ( li_RowDetail < 1 ) or IsNull(li_RowDetail) THEN
		Destroy(ids_SlipDetail)
		Destroy(ids_Slip)
		ithw_Exception.Text	+= "ไม่สามารถดูค่าข้อมูลรายละเอียดรายการเพื่อตรวจสอบได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(ids_SlipDetail)
	Destroy(ids_Slip)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML ข้อมูลรายละเอียดรายการมายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

FOR li_IndexDetail = 1 TO li_RowDetail
	ldc_MoneyAmt	= ids_SlipDetail.GetItemDecimal( li_IndexDetail , "money_amount" )
	ls_AccountID	= Trim( ids_SlipDetail.GetItemString( li_IndexDetail , "account_id" ) )
	ls_MoneyCode	= Trim( ids_SlipDetail.GetItemString( li_IndexDetail , "money_code" ) )
	
	IF IsNull(ldc_MoneyAmt) or ldc_MoneyAmt <=0 THEN
		Destroy(ids_SlipDetail)
		Destroy(ids_Slip)
		ithw_Exception.Text	+= "รายการไม่สมบูรณ์ จำนวนเงินในรายละเอียดไม่ถูกต้อง"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	IF IsNull(ls_AccountID) or ls_AccountID = ""  THEN
		Destroy(ids_SlipDetail)
		Destroy(ids_Slip)
		ithw_Exception.Text	+= "รายการไม่สมบูรณ์ รหัสบันทึกบัญชีในรายละเอียดไม่ถูกต้อง"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	IF IsNull(ls_MoneyCode) or ls_MoneyCode = ""  THEN
		Destroy(ids_SlipDetail)
		Destroy(ids_Slip)
		ithw_Exception.Text	+= "รายการไม่สมบูรณ์ ประเภทเงินในรายละเอียดไม่ถูกต้อง"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
NEXT

RETURN SUCCESS
end function

public function integer of_savewithdraw (string as_slip_xml, string as_slipdet_xml) throws Exception;String		ls_Slipno, ls_CoopID
Integer	li_Index

//ตรวจสอบข้อมูล
This.of_CheckBeforeSaveWD( as_Slip_XML  , as_SlipDet_XML )

//ดึงเลขที่ Slipno
ls_Slipno		=	This.of_GetDocumentNo(is_CoopContrl, "INVESTSLIP" )
IF isnull(ls_Slipno) or ls_Slipno = "" or  ls_Slipno = "NO" THEN
	ithw_Exception.Text	+= "ดึงเลขที่เอกสารไม่ได้ "
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_SlipDetail)
	Destroy(ids_Slip)
	THROW ithw_Exception
END IF
ls_Slipno	= Right( "0000000000" + ls_Slipno , 10 )


//-	PMINVESTSTATEMENT pminvestmaster
This.of_SaveStatmentWD( ls_Slipno  ) 


//update SLIP
ids_Slip.SetItem(1, "slip_no", ls_Slipno )
ids_Slip.Accepttext()

IF ids_Slip.UPDATE() <> 1 THEN
	ithw_Exception.text	+= "ไม่สามารถบันทึก SLIP ได้ " + ids_Slip.of_geterrormessage( )
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_SlipDetail)
	Destroy(ids_Slip)
	THROW ithw_Exception
END IF


//update SLIPDET
ls_CoopID	= trim(ids_Slip.GetItemString( 1 , "coop_id" ))
FOR li_Index = 1 To ids_SlipDetail.RowCount()
	ids_SlipDetail.SetItem( li_Index, "seq_no", li_Index )
	ids_SlipDetail.SetItem( li_Index, "slip_no", ls_Slipno )
	ids_SlipDetail.SetItem( li_Index, "coop_id", ls_CoopID )
NEXT

ids_SlipDetail.AcceptText()

if ids_SlipDetail.UPDATE() <> 1 then
	ithw_Exception.text	+= "ไม่สามารถบันทึก SLIPDETAIL ได้ " + ids_SlipDetail.of_geterrormessage( )
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_SlipDetail)
	Destroy(ids_Slip)
	THROW ithw_Exception
end if


COMMIT USING itr_SQLCA ;

Destroy(ids_Slip)
Destroy(ids_SlipDetail)

RETURN SUCCESS
end function

public function integer of_savestatmentwd (string as_slipno) throws Exception;//return integer	of_savestatmentwd(as_slipno)
integer	li_rc , li_seqno, li_ClostStatus, li_SellUnit
string		ls_coopid , ls_slipno , ls_accountno , ls_itemcode , ls_slipstatus
String		ls_EntryID  , ls_itemcodefine , ls_itemcodeint , ls_itemcodetax , ls_itemcodewtd
datetime	ldtm_OperateDate , ldtm_EntryDate, ldtm_LastCalInt
dec{2}	ldc_ItemNetAmt , ldc_IntAmt , ldc_TaxAmt , ldc_FineAmt, ldc_Balance, ldc_ItemAmount, ldc_UnitCost
Dec		ldc_RateChange

ls_coopid				= trim(ids_Slip.getitemstring( 1 , "coop_id" ))
ls_accountno		= trim(ids_Slip.getitemstring( 1 , "account_no" ))
ls_EntryID			= trim(ids_Slip.getitemstring( 1 , "entey_id" ))
ldtm_OperateDate	= ids_Slip.getitemdatetime( 1 , "operate_date" )
ldtm_EntryDate		= ids_Slip.getitemdatetime( 1 , "entry_date" )
ldc_IntAmt			= ids_Slip.GetItemDecimal( 1 , "int_amount" )
ldc_TaxAmt			= ids_Slip.GetItemDecimal( 1 , "tax_amount" )
ldc_FineAmt			= ids_Slip.GetItemDecimal( 1 , "fine_amount" )
ldc_ItemNetAmt	= ids_Slip.GetItemDecimal( 1 , "item_net_amount" )
ldc_ItemAmount	= ids_Slip.GetItemDecimal( 1 , "item_amount" )
li_ClostStatus		= 0

IF IsNull( ldc_ItemAmount ) THEN ldc_ItemAmount = 0.00
IF IsNull( ldc_IntAmt ) THEN ldc_IntAmt = 0.00
IF IsNull( ldc_TaxAmt ) THEN ldc_TaxAmt = 0.00
IF IsNull( ldc_FineAmt ) THEN ldc_FineAmt = 0.00
IF IsNull( ldc_ItemNetAmt ) THEN ldc_ItemNetAmt = 0.00

DECLARE c_Balance CURSOR FOR
  SELECT prncbal, lastcalint_date, unit_cost
    FROM pminvestmaster
  WHERE coop_id = :ls_coopid
       AND account_no = :ls_accountno
    USING itr_SQLCA ;

OPEN c_Balance ;
FETCH c_Balance INTO :ldc_Balance, :ldtm_LastCalInt, :ldc_UnitCost ;
IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถอ่านค่าข้อมูลคงเหลือ PMINVESTMASTER ได้"  + " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_SlipDetail)
	Destroy(ids_Slip)
	CLOSE c_Balance;
	THROW ithw_Exception
END IF

CLOSE c_Balance;

ldc_RateChange	= ldc_ItemAmount / ldc_Balance
li_SellUnit			= ldc_ItemAmount / ldc_UnitCost

IF ( ldc_Balance - ldc_ItemAmount = 0.00 ) THEN li_ClostStatus = 1
//STM ดอกเบี้ย +
IF	ldc_IntAmt > 0 THEN
	This.of_PostToStatement(ls_CoopID, ls_AccountNo, ldtm_OperateDate, ldtm_EntryDate, ldc_IntAmt, &
				"INT", 1, ldc_Balance, as_SlipNo, ls_EntryID )
	
	//บันทึกประวัติรับดอกเบี้ย
	This.of_PostTo_RcvInt_History( ls_CoopID,ls_AccountNo, ldtm_OperateDate, ldc_Balance, &
				ldtm_LastCalInt, ldtm_OperateDate, ldc_IntAmt, ldc_TaxAmt)
END IF

//STM ภาษี  - 
ldc_Balance	= ldc_Balance + ldc_IntAmt
IF	ldc_TaxAmt > 0 THEN	
	This.of_PostToStatement(ls_CoopID, ls_AccountNo, ldtm_OperateDate, ldtm_EntryDate, ldc_TaxAmt, &
				"TAX", -1, ldc_Balance, as_SlipNo, ls_EntryID )
END IF


//STM ค่าปรับ -
ldc_Balance	= ldc_Balance - ldc_TaxAmt
IF	ldc_FineAmt > 0 THEN
	
	This.of_PostToStatement(ls_CoopID, ls_AccountNo, ldtm_OperateDate, ldtm_EntryDate, ldc_FineAmt, &
				"FNE", -1, ldc_Balance, as_SlipNo, ls_EntryID )
END IF


//STM ถอน
ldc_Balance	= ldc_Balance - ldc_FineAmt
IF	ldc_ItemNetAmt > 0 THEN	
	This.of_PostToStatement(ls_CoopID, ls_AccountNo, ldtm_OperateDate, ldtm_EntryDate, ldc_ItemNetAmt, &
				"WTD", -1, ldc_Balance, as_SlipNo, ls_EntryID )
END IF

//UPDATE MASTER
UPDATE		PMINVESTMASTER
SET			CLOSE_STATUS		= :li_ClostStatus	,
				CLOSE_DATE			= :ldtm_OperateDate	,
				LASTACCESS_DATE	= :ldtm_OperateDate	,
				ACCUINTRCV_AMT	= ACCUINTRCV_AMT + :ldc_IntAmt	,
				ACCUTAXPAY_AMT	= ACCUTAXPAY_AMT + :ldc_TaxAmt	,
				PRNCBAL					= PRNCBAL - :ldc_ItemAmount	,
				LASTCALINT_DATE	= :ldtm_OperateDate,
				PURCHASE_PRICE		= PURCHASE_PRICE - ( PURCHASE_PRICE * :ldc_RateChange ),
				DEFF_AMT				= DEFF_AMT - ( DEFF_AMT * :ldc_RateChange ),
				ACCUINT_AMT			= ACCUINT_AMT - ( ACCUINT_AMT * :ldc_RateChange ),
				CLEANPRICE_AMT		= CLEANPRICE_AMT - ( CLEANPRICE_AMT * :ldc_RateChange ),
				UNIT_AMT				= UNIT_AMT - :li_SellUnit
WHERE		ACCOUNT_NO			= :ls_accountno 
AND			COOP_ID					= :ls_coopid 
USING itr_SQLCA ;

IF itr_SQLCA.sqlcode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถบันทึก MASTER ได้" + " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	Destroy(ids_SlipDetail)
	Destroy(ids_Slip)
	THROW ithw_Exception
END IF

RETURN SUCCESS
end function

public function string of_genduedate (string as_condition_xml) throws Exception;Integer	li_Row,li_MonthPeriod, li_IntCondition, li_IntTimeDue
Integer	li_CalintToStatus, li_InsertRow
Integer	li_Day,li_Periodrr, li_MonthUnit, li_PeriodDuration,li_month,li_year,li_years
String		ls_AccountNo, ls_CoopID, ls_XML
Boolean	lb_Stop = FALSE

DateTime	ldtm_StartDate, ldtm_LastWork, ldtm_CalIntFrom, ldtm_IntDue
DateTime	ldtm_CalIntTo, ldtm_DueDate, ldtm_Test[], ldtm_toDay, ldtm_BuyDate
Dec{2}		ldc_UpperLower
Dec{7}		ldc_IntRate, ldc_IntYieldRate, ldc_SumDuration

n_ds		lds_DueDate, lds_Condition

lds_DueDate = CREATE n_ds
lds_DueDate.DataObject = "d_account_due_date3"
lds_DueDate.SetTransObject( itr_SQLCA )

lds_Condition = CREATE n_ds
lds_Condition.DataObject = "d_due_date_condition"
lds_Condition.SetTransObject( itr_SQLCA )
IF Not  IsNull( as_condition_xml ) and Trim( as_condition_xml ) <> ""  THEN
	li_Row	= 0
	li_Row	= inv_XmlieService.of_XmlImport( lds_Condition, as_condition_xml )
	IF ( li_Row < 1 ) THEN
		Destroy(lds_DueDate)
		Destroy(lds_Condition)
		ithw_Exception.Text	+= "ไม่สามารถรับข้อมูลเงื่อนไขเพื่อคำนวณได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(lds_DueDate)
	Destroy(lds_Condition)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML ข้อมูลเงื่อนไขมายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

ldtm_toDay		= DateTime (ToDay())

ls_AccountNo	= lds_Condition.GetItemString( 1, "account_no")
ls_CoopID		= lds_Condition.GetItemString( 1, "coop_id")

ldtm_StartDate		= lds_Condition.GetItemDateTime( 1, 'start_intdate')
ldtm_DueDate		= lds_Condition.GetItemDateTime( 1, 'due_date')
ldtm_BuyDate		= lds_Condition.GetItemDateTime( 1, 'buy_date')

li_MonthUnit			= lds_Condition.GetItemNumber ( 1, "invest_period_unit" )
li_MonthPeriod		= lds_Condition.GetItemNumber ( 1, "investment_period" )
li_IntCondition		= lds_Condition.GetItemNumber( 1, 'due_date_int_cond')
li_IntTimeDue		= lds_Condition.GetItemNumber( 1, 'int_timedue')
li_CalintToStatus	= lds_Condition.GetItemNumber( 1, 'calintto_status')

// ทำการลบข้อมูลเดิมก่อน
DELETE FROM pminvestduedate
WHERE coop_id = :ls_CoopID
     AND account_no = :ls_AccountNo
  USING itr_SQLCA ;
  
IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถล้างข้อมูล PMINVESTDUEDATE ก่อนการจัดทำใหม่ได้" + " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	Destroy(lds_Condition)
	Destroy(lds_DueDate)
	THROW ithw_Exception
END IF

ldtm_CalIntFrom	= ldtm_StartDate
ldtm_IntDue			= ldtm_StartDate

// ระบุวันรับดอกเบี้ย
li_Day				= lds_Condition.GetItemNumber ( 1, "set_rcv_date" )
li_month			= lds_Condition.GetItemNumber ( 1, "set_rcv_month" )
li_year			= lds_Condition.GetItemNumber ( 1, "set_rcv_year" )
li_years = li_year - 543
IF(li_Day <1 or li_Day > 31) or IsNull(li_Day) THEN li_Day=0

IF ( li_IntTimeDue > 0 ) THEN
	ldtm_IntDue		= DateTime( inv_DateTime.of_RelativeMonth( Date( ldtm_IntDue ), li_IntTimeDue ) )
	
	IF (li_Day <> 0) THEN		
		ldtm_IntDue		= DateTime( Date( li_years,li_month , li_Day ) )		//Month( Date( li_month )  )
	ELSE		
		// หาวันที่สิ้นเดือน
		IF (li_IntCondition = 3) THEN
			ldtm_IntDue  	=  DateTime (inv_DateTime.of_LastDayofMonth( Date(ldtm_IntDue)))
		END IF
		
	END IF
ELSE
	ldtm_IntDue		= ldtm_DueDate
END IF

//************************************
//************************************
//************************************

// ให้วันที่คำนวณดอกเบี้ยถึง เป็นวันเดียวกับงวดก่อน
ldtm_CalIntTo	= ldtm_IntDue

// เช็คเงื่อนไขการรับดอกเบี้ย
IF	(li_IntCondition = 1 ) THEN
	//กรณีวันที่ชำระ ตรงกับวันหยุด ให้เลื่อนวันทำการเข้ามา
	IF ( This.of_IsValidCalendar(ldtm_IntDue) ) THEN
		IF ( inv_Calendar_SRV.of_IsWorkingDate(ldtm_IntDue )  = FALSE ) THEN
			inv_Calendar_SRV.of_GetPrevWorkDay( ldtm_IntDue,ldtm_LastWork  )
		ELSE
			ldtm_LastWork	= ldtm_IntDue
		END IF
	ELSE
		CHOOSE CASE inv_DateTime.of_DayOfWeek ( Date (ldtm_IntDue) )
			CASE 1
				ldtm_LastWork	= DateTime( RelativeDate( Date( ldtm_IntDue ), -2 ) )
			CASE 7
				ldtm_LastWork	= DateTime( RelativeDate( Date( ldtm_IntDue ), -1 ) )
			CASE ELSE
				ldtm_LastWork	= ldtm_IntDue
		END CHOOSE		
	END IF
		
ELSE
	IF	(li_IntCondition = 2) THEN
		// กรณีวันที่ชำระ ตรงกับวันหยุด ให้เลื่อนวันทำการออกไป
		IF ( This.of_IsValidCalendar(ldtm_IntDue) ) and (This.of_IsValidCalendar(  DateTime( inv_DateTime.of_RelativeMonth( Date( ldtm_IntDue ), 1)))) THEN
			IF ( inv_Calendar_SRV.of_IsWorkingDate(ldtm_IntDue )  = FALSE ) THEN
				inv_Calendar_SRV.of_GetNextWorkDay( ldtm_IntDue,ldtm_LastWork  )
			ELSE
				ldtm_LastWork	= ldtm_IntDue
			END IF
		ELSE
			CHOOSE CASE inv_DateTime.of_DayOfWeek ( Date (ldtm_IntDue) )
				CASE 1
					ldtm_LastWork	= DateTime( RelativeDate( Date( ldtm_IntDue ), 1 ) )
				CASE 7
					ldtm_LastWork	= DateTime( RelativeDate( Date( ldtm_IntDue ), 2 ) )
				CASE ELSE
					ldtm_LastWork	= ldtm_IntDue
			END CHOOSE		
		END IF
	
	ELSE
		IF (li_IntCondition = 3 ) or ( li_Day > 0) THEN ldtm_LastWork	= ldtm_IntDue
	END IF
END IF

// หาก วันเริ่มคิดดอกเบี้ย ยังมากกว่า วันที่ต้องได้ดอกเบี้ยรอบแรก
IF Date(ldtm_StartDate) >= Date(ldtm_LastWork) THEN
	ldtm_IntDue			= DateTime( inv_DateTime.of_RelativeMonth( Date( ldtm_IntDue ), li_IntTimeDue ) )
	
	IF  li_Day > 0 THEN // มีการกำหนดวันรับดอกเบี้ย
		ldtm_IntDue			= DateTime( Date( li_years , li_month, li_Day ) )
	ELSE		
		// หาวันที่สิ้นเดือน
		IF ( li_IntCondition = 3) THEN
			ldtm_IntDue  	=  DateTime( inv_DateTime.of_LastDayofMonth( Date(ldtm_IntDue)) )
		END IF
		
	END IF
	
	// เช็คเงื่อนไขการรับดอกเบี้ย
	IF	(li_IntCondition = 1) THEN
		//กรณีวันที่ชำระ ตรงกับวันหยุด ให้เลื่อนวันทำการเข้ามา		
		IF ( This.of_IsValidCalendar(ldtm_IntDue) )  THEN
			IF ( inv_Calendar_SRV.of_IsWorkingDate(ldtm_IntDue )  = FALSE ) THEN
				inv_Calendar_SRV.of_GetPrevWorkDay( ldtm_IntDue,ldtm_LastWork  )
			ELSE
				ldtm_LastWork	= ldtm_IntDue
			END IF
		ELSE
			CHOOSE CASE inv_DateTime.of_DayOfWeek ( Date (ldtm_IntDue) )
				CASE 1
					ldtm_LastWork	= DateTime( RelativeDate( Date( ldtm_IntDue ), -2 ) )
				CASE 7
					ldtm_LastWork	= DateTime( RelativeDate( Date( ldtm_IntDue ), -1 ) )
				CASE ELSE
					ldtm_LastWork	= ldtm_IntDue
			END CHOOSE		
		END IF
		
	ELSE
		IF	(li_IntCondition = 2) THEN
			// กรณีวันที่ชำระ ตรงกับวันหยุด ให้เลื่อนวันทำการออกไป
			IF ( This.of_IsValidCalendar(ldtm_IntDue) ) and (This.of_IsValidCalendar(  DateTime( inv_DateTime.of_RelativeMonth( Date( ldtm_IntDue ), 1)))) THEN
				IF ( inv_Calendar_SRV.of_IsWorkingDate(ldtm_IntDue )  = FALSE ) THEN
					inv_Calendar_SRV.of_GetNextWorkDay( ldtm_IntDue,ldtm_LastWork  )
				ELSE
					ldtm_LastWork	= ldtm_IntDue
				END IF
			ELSE
				CHOOSE CASE inv_DateTime.of_DayOfWeek ( Date (ldtm_IntDue) )
					CASE 1
						ldtm_LastWork	= DateTime( RelativeDate( Date( ldtm_IntDue ), 1 ) )
					CASE 7
						ldtm_LastWork	= DateTime( RelativeDate( Date( ldtm_IntDue ), 2 ) )
					CASE ELSE
						ldtm_LastWork	= ldtm_IntDue
				END CHOOSE		
			END IF
		
		ELSE
			IF (li_IntCondition = 3 ) or ( li_Day > 0) THEN ldtm_LastWork	= ldtm_IntDue
		END IF
	END IF	

END IF

// หากวันคำนวณดอกเบี้ยใช้วันเดียวกับวันรับ
IF ( li_CalintToStatus = 1 ) THEN ldtm_CalIntTo = ldtm_LastWork

IF ( Date (ldtm_LastWork) > Date (ldtm_DueDate)  ) THEN
	ldtm_LastWork	= ldtm_DueDate
END IF

IF ( Date (ldtm_CalIntTo) > Date (ldtm_DueDate)  ) THEN
	ldtm_CalIntTo	= ldtm_DueDate
END IF

// หากรับดอกเบี้ยเมื่อครบกำหนด
IF ( li_IntTimeDue = 0 ) THEN
	// เพิ่มแถวก่อน
	li_InsertRow		= lds_DueDate.InsertRow(0)
	
	ldc_IntRate			= This.of_GetInt_Rate (ls_AccountNo, ls_CoopID, ldtm_CalIntFrom, ldtm_CalIntTo )
	ldc_IntYieldRate	= This.of_GetInt_Rate_Yield (ls_AccountNo, ls_CoopID, ldtm_CalIntFrom, ldtm_CalIntTo )
	
	lds_DueDate.SetItem(li_InsertRow,"account_no",ls_AccountNo)
	lds_DueDate.SetItem(li_InsertRow,"coop_id",ls_CoopID)
	lds_DueDate.SetItem(li_InsertRow,"due_date",ldtm_LastWork)
	lds_DueDate.SetItem(li_InsertRow,"start_calint_date",ldtm_CalIntFrom)
	lds_DueDate.SetItem(li_InsertRow,"last_cal_to_date",ldtm_CalIntTo)
	
	lds_DueDate.SetItem(li_InsertRow,"int_rate",ldc_IntRate)
	lds_DueDate.SetItem(li_InsertRow,"intyield_rate",ldc_IntYieldRate)
	
	lds_DueDate.SetItem(li_InsertRow,"periodpayrr", 1)
	lds_DueDate.SetItem(li_InsertRow,"recint_flag", 0)

	lds_DueDate.AcceptText()
	
	ls_XML	= lds_DueDate.Describe( "Datawindow.data.XML" )
	
	IF lds_DueDate.UPDATE() <> 1 THEN
		ithw_Exception.Text	+= "ไม่สามารถปรับปรุงข้อมูล PMINVESTDUEDATE ได้" + " " + lds_DueDate.of_geterrormessage()
		ROLLBACK USING itr_SQLCA ;
		Destroy(lds_DueDate)
		Destroy(lds_Condition)
		THROW ithw_Exception
	END IF
	
	RETURN ls_XML
END IF

// เริ่มทำการจัดทำดอกเบี้ยงวดอื่นๆ
Integer li_UserM, li_UserY
Integer li_PeriodM, li_PeriodY, li_RowST

DO WHILE ( Date (ldtm_CalIntTo) <= Date (ldtm_DueDate) ) 
	li_InsertRow	= lds_DueDate.InsertRow(0)	
	
	// หากวันที่ ครบเหลือไม่ถึง 10 วัน ให้เป็นวันครบกำหนดไปเลย
	IF DaysAfter( Date (ldtm_LastWork), Date (ldtm_DueDate) ) < 10 THEN
		ldtm_LastWork	= ldtm_DueDate
		ldtm_CalIntTo	= ldtm_DueDate
	END IF
	
	ldtm_Test[Upperbound(ldtm_Test) + 1 ]	= ldtm_LastWork	
	lds_DueDate.SetItem(li_InsertRow,"account_no",ls_AccountNo) 
	lds_DueDate.SetItem(li_InsertRow,"coop_id",ls_CoopID)
	lds_DueDate.SetItem(li_InsertRow,"due_date",ldtm_LastWork)
	lds_DueDate.SetItem(li_InsertRow,"start_calint_date",ldtm_CalIntFrom)
	lds_DueDate.SetItem(li_InsertRow,"last_cal_to_date",ldtm_CalIntTo)
	
	ldc_IntRate			= 0.00
	ldc_IntYieldRate	= 0.00
	
	ldc_IntRate			= This.of_GetInt_Rate (ls_AccountNo, ls_CoopID, ldtm_CalIntFrom, ldtm_CalIntTo )
	ldc_IntYieldRate	= This.of_GetInt_Rate_Yield (ls_AccountNo, ls_CoopID, ldtm_CalIntFrom, ldtm_CalIntTo )
	
	lds_DueDate.SetItem(li_InsertRow,"int_rate",ldc_IntRate)
	lds_DueDate.SetItem(li_InsertRow,"intyield_rate",ldc_IntYieldRate)
	
	// Set ค่าว่า รับดอกเบี้ยแล้วหรือไม่ โดยเปรียบเทียบกับวันปัจจุบัน
	IF ( Date (ldtm_toDay) > Date (ldtm_LastWork) ) THEN
		lds_DueDate.SetItem(li_InsertRow,"recint_flag", 1)
		
		UPDATE pminvestmaster
		      SET lastcalint_date = :ldtm_CalIntTo
		 WHERE coop_id = :ls_CoopID
               AND account_no = :ls_AccountNo
            USING itr_SQLCA ;
		
		IF itr_SQLCA.SqlCode <> 0 THEN
			ithw_Exception.Text	+= "ไม่สามารถปรับปรุงข้อมูล วันที่คำนวณดอกเบี้นล่าสุด ใน PMINVESTMASTER ได้" + " " + itr_SQLCA.SqlErrText
			ROLLBACK USING itr_SQLCA ;
			Destroy(lds_Condition)
			Destroy(lds_DueDate)
			THROW ithw_Exception
		END IF

				
	ELSE
		lds_DueDate.SetItem(li_InsertRow,"recint_flag", 0)
	END IF
	
	lds_DueDate.setitem(li_InsertRow,"periodpayrr",1)
	ldtm_CalIntFrom	= ldtm_CalIntTo
	
	// จบการทำงาน
	IF ( Date (ldtm_LastWork) = Date (ldtm_DueDate)  ) OR ( lb_Stop = TRUE ) THEN
		EXIT
	END IF
	
	IF (li_Day <> 0) THEN
		ldtm_IntDue	= DateTime( inv_DateTime.of_RelativeMonth( Date( ldtm_IntDue ), li_IntTimeDue ) )
		
		IF(li_IntCondition = 1) or (li_IntCondition = 2) THEN //กรณีเลื่อนวันทำการ เลื่อนเข้า - เลื่อนออก
			// เช็คกรณี เดือนกุมภาพันธ์ มี 28 วัน
			IF li_Day  <> Day ( Date ( ldtm_IntDue ) )  THEN
				IF Month ( Date ( ldtm_IntDue ) ) = 2 THEN
					ldtm_IntDue	= DateTime( Date( Year( Date( ldtm_IntDue ) ) , Month( Date( ldtm_IntDue )  ), day ( date ( ldtm_IntDue ) )  ) )
				ELSE
					ldtm_IntDue	= DateTime( Date( li_years ,li_month, li_Day  ) )
				END IF
			END IF	
		ELSE
			// เช็คทุกวันที่สิ้นเดือน
			IF (li_IntCondition = 3) THEN
				ldtm_IntDue  =  DateTime (inv_DateTime.of_LastDayofMonth( Date (ldtm_IntDue)))
			ELSE
				// เช็คกรณี เดือนกุมภาพันธ์ มี 28 วัน
				IF li_Day  <> Day ( Date ( ldtm_LastWork ) )  THEN
					ldtm_IntDue	= DateTime( Date( Year( Date( ldtm_IntDue ) ) , Month( Date( ldtm_IntDue )  ), day ( date ( ldtm_IntDue ) ) +1 ) )
				ELSE
					ldtm_IntDue	= DateTime( Date( Year( Date( ldtm_IntDue ) ) , Month( Date( ldtm_IntDue )  ), day ( date ( ldtm_IntDue ) )  ) )
				END IF
			END IF
		END IF
	ELSE
		ldtm_IntDue	= DateTime( inv_DateTime.of_RelativeMonth( Date( ldtm_IntDue ), li_IntTimeDue ) )
		
		// หาวันที่สิ้นเดือน
		IF ( li_IntCondition = 3 ) THEN
			ldtm_IntDue	= DateTime (inv_DateTime.of_LastDayofMonth( Date (ldtm_IntDue)))
		END IF
		
	END IF
	
	// วันที่คำนวณดอกเบี้ย ใช้วันเดียวกับงวดก่อน
	ldtm_CalIntTo = ldtm_IntDue
	
	// เช็คเงื่อนไขการรับดอกเบี้ย
	IF	( li_IntCondition = 1) THEN
		//กรณีวันที่ชำระ ตรงกับวันหยุด ให้เลื่อนวันทำการเข้ามา		
		IF ( This.of_IsValidCalendar(ldtm_IntDue) ) THEN
			IF ( inv_Calendar_SRV.of_IsWorkingDate(ldtm_IntDue )  = FALSE ) THEN
				inv_Calendar_SRV.of_GetPrevWorkDay( ldtm_IntDue,ldtm_LastWork  )
			ELSE
				ldtm_LastWork	= ldtm_IntDue
			END IF
		ELSE
			CHOOSE CASE inv_DateTime.of_DayOfWeek ( Date (ldtm_IntDue) )
				CASE 1
					ldtm_LastWork	= DateTime( RelativeDate( Date( ldtm_IntDue ), -2 ) )
				CASE 7
					ldtm_LastWork	= DateTime( RelativeDate( Date( ldtm_IntDue ), -1 ) )
				CASE ELSE
					ldtm_LastWork	= ldtm_IntDue
			END CHOOSE		
		END IF
	
	ELSE
		IF	(li_IntCondition = 2) THEN
			// กรณีวันที่ชำระ ตรงกับวันหยุด ให้เลื่อนวันทำการออกไป			
			IF ( This.of_IsValidCalendar(ldtm_IntDue) ) and (This.of_IsValidCalendar(  DateTime( inv_DateTime.of_RelativeMonth( Date( ldtm_IntDue ), 1)))) THEN
				IF ( inv_Calendar_SRV.of_IsWorkingDate(ldtm_IntDue )  = FALSE ) THEN
					inv_Calendar_SRV.of_GetNextWorkDay( ldtm_IntDue,ldtm_LastWork  )
				ELSE
					ldtm_LastWork	= ldtm_IntDue
				END IF
			ELSE
				CHOOSE CASE inv_DateTime.of_DayOfWeek ( Date (ldtm_IntDue) )
					CASE 1
						ldtm_LastWork	= DateTime( RelativeDate( Date( ldtm_IntDue ), 1 ) )
					CASE 7
						ldtm_LastWork	= DateTime( RelativeDate( Date( ldtm_IntDue ), 2 ) )
					CASE ELSE
						ldtm_LastWork	= ldtm_IntDue
				END CHOOSE		
			END IF
			
		ELSE
			IF (li_IntCondition = 0) or (li_Day > 0) THEN ldtm_LastWork = ldtm_IntDue
		END IF
	END IF
	
	// หากวันคำนวณดอกเบี้ยใช้วันเดียวกับวันรับ
	IF ( li_CalintToStatus = 1 ) THEN ldtm_CalIntTo = ldtm_LastWork
	
	IF ( Date (ldtm_LastWork) > Date (ldtm_DueDate)  ) THEN
		ldtm_LastWork	= ldtm_DueDate
	END IF
	
	IF ( Date (ldtm_CalIntTo) > Date (ldtm_DueDate)  ) THEN
		ldtm_CalIntTo	= ldtm_DueDate
		lb_Stop			= TRUE
	END IF
	
LOOP

IF lds_DueDate.UPDATE() <> 1 THEN
	ithw_Exception.Text	+= "ไม่สามารถปรับปรุงข้อมูล PMINVESTDUEDATE ได้"+ " " + lds_DueDate.of_geterrormessage()
	ROLLBACK USING itr_SQLCA ;
	Destroy(lds_DueDate)
	Destroy(lds_Condition)
	THROW ithw_Exception
END IF

COMMIT USING itr_SQLCA;

// ทำการลบข้อมูลที่ไม่ต้องการ ออกไป
DELETE FROM pminvestduedate
WHERE coop_id = :ls_CoopID
     AND account_no = :ls_AccountNo
	AND periodpayrr = 0
  USING itr_SQLCA ;
  
COMMIT USING itr_SQLCA;

// คำนวณ Duration
This.of_Duration_Calculation(ls_AccountNo, ls_CoopID, ldtm_BuyDate, ldtm_DueDate )

IF (li_IntTimeDue = 0) THEN
	li_PeriodDuration	= 1
ELSE
	li_PeriodDuration	= 12 / li_IntTimeDue
END IF

ldc_SumDuration = This.of_CompleteCal_Duration (ls_AccountNo, ls_CoopID, li_PeriodDuration)

// จัดทำ ส่วนเกินส่วนต่ำ
ldc_UpperLower	= This.of_Get_UpperLower(ls_CoopID, ls_AccountNo)

UPDATE pminvestmaster
      SET deff_amt = :ldc_UpperLower,
		    duration_due = :ldc_SumDuration
 WHERE coop_id = :ls_CoopID
      AND account_no = :ls_AccountNo
   USING itr_SQLCA ;

IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถปรับปรุงข้อมูล pminvestmaster ได้"+ " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	Destroy(lds_DueDate)
	Destroy(lds_Condition)
	THROW ithw_Exception
END IF

THIS.of_cutdiffer_calculation(  ls_AccountNo, ls_CoopID);

COMMIT USING itr_SQLCA;

// ดึงข้อมูลมาใหม่
lds_DueDate.Retrieve (ls_CoopID, ls_AccountNo)

ls_XML	= lds_DueDate.Describe( "Datawindow.data.XML" )

Destroy(lds_DueDate)
Destroy(lds_Condition)
	
RETURN ls_XML
end function

public function integer of_process_intrecvable (datetime adtm_calintto) throws Exception;String	ls_CoopID, ls_AccountNo
DateTime	ldtm_CalIntFrom
Dec{2}		ldc_Balance, ldc_TaxAmount,  ldc_IntAmount
Dec{7}		ldc_TaxRate
Integer		li_Year, li_Month
DateTime	ldtm_DueDate, ldtm_CalIntTo

li_Year	= Year( Date(adtm_calintto) )
li_Month	= Month( Date(adtm_calintto) )

DECLARE C_Master CURSOR FOR
  SELECT COOP_ID,
              ACCOUNT_NO,
              PRNCBAL,
              LASTCALINT_DATE,
			TAX_RATE,
			DUE_DATE
    FROM pminvestmaster
  WHERE close_status = 0
       AND prncbal > 0
   USING	itr_SQLCA ;

DELETE FROM pmintreceiveable
WHERE YEAR_SETTING = :li_Year
     AND MONTH_SETTING = :li_Month
  USING itr_SQLCA;

IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถลบข้อมูล pmintreceiveable ได้" + " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF
		
OPEN C_Master ;
FETCH C_Master 
  INTO :ls_CoopID,
          :ls_AccountNo,
		 :ldc_Balance,
		 :ldtm_CalIntFrom, 
          :ldc_TaxRate,
		 :ldtm_DueDate;
			 
DO WHILE itr_SQLCA.SqlNrows > 0	
	
	ldtm_CalIntTo	= DateTime( RelativeDate( Date( adtm_CalIntTo ) , 1 ) )
	IF Date (ldtm_CalIntTo) > Date (ldtm_DueDate) THEN ldtm_CalIntTo = ldtm_DueDate
	
	ldc_IntAmount	= This.of_Compute_Int(ls_AccountNo,ls_CoopID,ldc_Balance, ldtm_CalIntFrom, ldtm_CalIntTo  )
	ldc_TaxAmount	= ( ldc_IntAmount * ldc_TaxRate ) / 100
	
	INSERT INTO pmintreceiveable (
		COOP_ID,
		ACCOUNT_NO,
		YEAR_SETTING,
		MONTH_SETTING,
		CALINTFROM_DATE,
		CALINTTO_DATE,
		BALANCE_AMOUNT,
		INTEREST_AMOUNT,
		TAX_AMOUNT
	)
	VALUES(
		:ls_CoopID,
		:ls_AccountNo,
		:li_Year,
		:li_Month,
		:ldtm_CalIntFrom,
		:adtm_CalIntTo,
		:ldc_Balance,
		:ldc_IntAmount,
		:ldc_TaxAmount
	)
	USING itr_SQLCA;
	
	IF itr_SQLCA.SqlCode <> 0 THEN
		ithw_Exception.Text	+= "ไม่สามารถเพิ่มข้อมูล pmintreceiveable ได้" + " " + itr_SQLCA.SqlErrText
		ROLLBACK USING itr_SQLCA ;
		CLOSE C_Master;
		THROW ithw_Exception
	END IF

	FETCH C_Master 
	  INTO :ls_CoopID,
			 :ls_AccountNo,
			 :ldc_Balance,
			 :ldtm_CalIntFrom, 
			 :ldc_TaxRate,
			 :ldtm_DueDate;
			 
LOOP

CLOSE C_Master;
COMMIT USING itr_SQLCA;

RETURN SUCCESS
end function

public function integer of_process_shortlong (integer ai_year) throws Exception;integer	li_type, li_row, li_index
string		ls_DEPTACCOUNT_NO, ls_BRANCH_ID
integer	ai_Year_INT, li_ARR_TYPE, li_CONDITION, li_UNIT_AMT
dec{2}	ldc_IntDuringYear, ldc_IntArrAmt, ldc_AMOUNT_PERUNIT
DateTime	ldtm_StartDate, ldtm_EndDate, ldtm_LastCalDate, ldtm_CalIntTo
DateTime	ldtm_Start, ldtm_End

IF ( ai_Year <= Year( Today() ) ) THEN
	ithw_Exception.Text	+= "ไม่สามารถคำนวณปีที่น้อยกว่าปีปัจจุบันได้"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

// select end date and startdate
DECLARE c_AccountYear CURSOR FOR
  SELECT beginning_of_accou, ending_of_account
    FROM accaccountyear
  WHERE account_year = :ai_Year - 543
    USING itr_SQLCA  ;

OPEN c_AccountYear ;
FETCH c_AccountYear INTO :ldtm_Start, :ldtm_End ;

IF ( itr_SQLCA.SqlCode <> 0 ) THEN
	ithw_Exception.Text	+= "ไม่สามารถหาข้อมูลปีบัญชีได้" + " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	CLOSE c_AccountYear;
	THROW ithw_Exception
END IF

CLOSE c_AccountYear;

DELETE FROM pmshortlong
WHERE year_setting = :ai_Year
USING itr_SQLCA;

IF ( itr_SQLCA.SqlCode <> 0 ) THEN
	ithw_Exception.Text	+= "ไม่สามารถลบข้อมูลเดิมได้" + " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

DECLARE c_Master CURSOR FOR
  SELECT COOP_ID,
              ACCOUNT_NO,
              PRNCBAL,
			OPEN_DATE,
              LASTCALINT_DATE,
			TAX_RATE,
			DUE_DATE,
			UNIT_AMT,
			UNIT_COST,
			PURCHASE_PRICE,
			REMARK
    FROM pminvestmaster
  WHERE close_status = 0
       AND prncbal > 0
    USING	itr_SQLCA ;

String		ls_CoopID, ls_AccountNo, ls_Remark
Dec{2}	ldc_Balance, ldc_UnitCost, ldc_BuyPrice
Integer	li_SettingType
Long		ll_UnitAmt
Dec{7}	ldc_TaxRate
DateTime	ldtm_CalIntFrom, ldtm_DueDate, ldtm_OpenDate

OPEN c_Master ;
FETCH c_Master 
  INTO	:ls_CoopID,
			:ls_AccountNo,
			:ldc_Balance,
			:ldtm_OpenDate,
			:ldtm_CalIntFrom, 
			:ldc_TaxRate,
			:ldtm_DueDate,
			:ll_UnitAmt,
			:ldc_UnitCost,
			:ldc_BuyPrice,
			:ls_Remark;

DO WHILE itr_SQLCA.SqlNrows > 0
	
	DECLARE c_SumInt CURSOR FOR
	  SELECT SUM (interest_amount)
	    FROM pminttaxstatement
	  WHERE coop_id = :ls_CoopID
	       AND account_no = :ls_AccountNo
		  AND receive_date BETWEEN :ldtm_Start AND :ldtm_END
	    USING itr_SQLCA ;
	
	ldc_IntDuringYear = 0.00
	
	OPEN c_SumInt ;
	FETCH c_SumInt INTO :ldc_IntDuringYear ;
	CLOSE c_SumInt;
	
	IF IsNull (ldc_IntDuringYear) THEN ldc_IntDuringYear = 0.00
	
	ldtm_CalIntTo	= ldtm_END
	IF Date (ldtm_CalIntTo) > Date (ldtm_DueDate) THEN ldtm_CalIntTo = ldtm_DueDate
	
	ldc_IntArrAmt	= This.of_Compute_Int(ls_AccountNo,ls_CoopID,ldc_Balance, ldtm_CalIntFrom, ldtm_CalIntTo  )
	
	IF ( DaysAfter( Date(ldtm_END) , Date(ldtm_DueDate) ) > 365 ) THEN
		li_SettingType = 2
	ELSE
		li_SettingType = 1
	END IF
	
	INSERT INTO pmshortlong (
		COOP_ID,				
		ACCOUNT_NO,
		YEAR_SETTING,
		SETTING_TYPE,
		INT_DURINTYEAR,			// 5
		INT_ARRAMT,
		CONDITION_REM,
		UNIT_AMT,
		UNIT_COST,
		BALANCE_AMT,				// 10
		BUY_PRICE,
		START_DATE,
		DUE_DATE,
		LASTCAL_DATE,
		CALINT_TO					// 15
	)
	VALUES (
		:ls_CoopID,
		:ls_AccountNo,
		:ai_Year,
		:li_SettingType,
		:ldc_IntDuringYear,
		:ldc_IntArrAmt,				// 5
		:ls_Remark,
		:ll_UnitAmt,
		:ldc_UnitCost,
		:ldc_Balance,
		:ldc_BuyPrice,				// 10
		:ldtm_OpenDate,
		:ldtm_DueDate,
		:ldtm_CalIntFrom,
		:ldtm_CalIntTo
	)
	USING itr_SQLCA ;
	IF ( itr_SQLCA.SqlCode <> 0 ) THEN
		ithw_Exception.Text	+= "ไม่สามารถเพิ่มข้อมูลกระดาษทำการได้" + " " + itr_SQLCA.SqlErrText
		ROLLBACK USING itr_SQLCA ;
		CLOSE c_Master ;
		THROW ithw_Exception
	END IF
	
	FETCH c_Master 
	INTO	:ls_CoopID,
			:ls_AccountNo,
			:ldc_Balance,
			:ldtm_OpenDate,
			:ldtm_CalIntFrom, 
			:ldc_TaxRate,
			:ldtm_DueDate,
			:ll_UnitAmt,
			:ldc_UnitCost,
			:ldc_BuyPrice,
			:ls_Remark;
		 
LOOP

CLOSE c_Master ;

COMMIT USING itr_SQLCA;
RETURN SUCCESS
end function

public function integer of_set_industry (string as_xml) throws Exception;n_ds	lds_Industry
Integer	li_RowCount, li_Index, li_OldNew
String		ls_IndestryCode, ls_IndestryDesc

lds_Industry = CREATE n_ds
lds_Industry.DataObject = "d_industry"

IF Not  IsNull( as_xml ) and Trim( as_xml ) <> ""  THEN
	li_RowCount	= inv_XmlieService.of_XmlImport( lds_Industry, as_xml )
	IF ( li_RowCount < 1 ) THEN
		Destroy(lds_Industry)
		ithw_Exception.Text	+= "ไม่สามารถรับข้อมูลเพื่อจัดการประเภทธุกิจได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(lds_Industry)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML ข้อมูลทำรายการมายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

FOR li_Index = 1 TO li_RowCount
	ls_IndestryDesc		= Trim( lds_Industry.GetItemString( li_Index, "industry_desc" ) )
	
	IF IsNull (ls_IndestryDesc) or (ls_IndestryDesc = "") THEN
		ithw_Exception.Text	+= "ไม่สามารถเพื่มประเภทธุรกิจได้ ระบุชื่อประเภทธุรกิจไม่สมบูรณ์"
		Destroy(lds_Industry)
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	ls_IndestryCode	= lds_Industry.GetItemString( li_Index, "industry_code" )
	ls_IndestryCode	= Right ( "000" + ls_IndestryCode , 3 )
	
	
	li_OldNew			= lds_Industry.GetItemNumber( li_Index, "old_new" )	
	IF IsNull (li_OldNew) THEN li_OldNew = 0
	
	IF ( li_OldNew = 0 ) THEN
		// New Row
		INSERT INTO pmucfindustry_group (
			coop_id,
			industry_code,
			industry_desc
		)
		VALUES (
			:is_CoopContrl,
			:ls_IndestryCode,
			:ls_IndestryDesc
		)
		USING itr_SQLCA ;
		
		IF itr_SQLCA.SqlCode <> 0 THEN
			ithw_Exception.Text	+= "ไม่สามารถเพื่มประเภทธุรกิจได้ " + itr_SQLCA.SqlErrText
			Destroy(lds_Industry)
			ROLLBACK USING itr_SQLCA ;
			THROW ithw_Exception
		END IF
	ELSE
		// Old row => Editing
		UPDATE pmucfindustry_group
		      SET industry_desc = :ls_IndestryDesc
		 WHERE coop_id = :is_CoopContrl
		      AND industry_code = :ls_IndestryCode
		   USING itr_SQLCA ;
		
		IF itr_SQLCA.SqlCode <> 0 THEN
			ithw_Exception.Text	+= "ไม่สามารถปรับปรุงประเภทธุรกิจได้ " + itr_SQLCA.SqlErrText
			Destroy(lds_Industry)
			ROLLBACK USING itr_SQLCA ;
			THROW ithw_Exception
		END IF
	END IF
	
NEXT

COMMIT USING itr_SQLCA ;

Destroy(lds_Industry)

RETURN SUCCESS
end function

public function integer of_set_investgroup (string as_xml) throws Exception;n_ds	lds_InvGroup
Integer	li_RowCount, li_Index, li_OldNew
String		ls_InvestCode, ls_InvestDesc

lds_InvGroup = CREATE n_ds
lds_InvGroup.DataObject = "d_investgroup"

IF Not  IsNull( as_xml ) and Trim( as_xml ) <> ""  THEN
	li_RowCount	= inv_XmlieService.of_XmlImport( lds_InvGroup, as_xml )
	IF ( li_RowCount < 1 ) THEN
		Destroy(lds_InvGroup)
		ithw_Exception.Text	+= "ไม่สามารถรับข้อมูลเพื่อจัดการประเภทหน่วยงานได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(lds_InvGroup)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML ข้อมูลทำรายการมายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

FOR li_Index = 1 TO li_RowCount
	
	ls_InvestDesc	= Trim( lds_InvGroup.GetItemString( li_Index, "group_desc" ) )
	ls_InvestCode	= lds_InvGroup.GetItemString( li_Index, "group_code" )
	ls_InvestCode	= Right ( "000" + ls_InvestCode , 3 )
	
	IF IsNull (ls_InvestDesc) or (ls_InvestDesc = "") THEN
		ithw_Exception.Text	+= "ไม่สามารถเพื่มประเภทหน่วยงานได้ ระบุชื่อประเภทหน่วยงานไม่สมบูรณ์"
		Destroy(lds_InvGroup)
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	li_OldNew			= lds_InvGroup.GetItemNumber( li_Index, "old_new" )	
	IF IsNull (li_OldNew) THEN li_OldNew = 0
	IF ( li_OldNew = 0 ) THEN
		INSERT INTO pmucfinvest_group (
			coop_id,
			group_code,
			group_desc
		)
		VALUES (
			:is_CoopContrl,
			:ls_InvestCode,
			:ls_InvestDesc
		)
		USING itr_SQLCA ;
		
		IF itr_SQLCA.SqlCode <> 0 THEN
			ithw_Exception.Text	+= "ไม่สามารถเพื่มประเภทหน่วยงานได้ " + itr_SQLCA.SqlErrText
			Destroy(lds_InvGroup)
			ROLLBACK USING itr_SQLCA ;
			THROW ithw_Exception
		END IF
	ELSE
		UPDATE pmucfinvest_group
		      SET group_desc = :ls_InvestDesc
		 WHERE coop_id = :is_CoopContrl
		      AND group_code = :ls_InvestCode
		   USING itr_SQLCA ;
		
		IF itr_SQLCA.SqlCode <> 0 THEN
			ithw_Exception.Text	+= "ไม่สามารถปรับปรุงประเภทหน่วยงานได้ " + itr_SQLCA.SqlErrText
			Destroy(lds_InvGroup)
			ROLLBACK USING itr_SQLCA ;
			THROW ithw_Exception
		END IF
	END IF
	
NEXT


COMMIT USING itr_SQLCA ;
Destroy(lds_InvGroup)
RETURN SUCCESS
end function

public function integer of_set_investtype (string as_xml) throws Exception;n_ds	lds_InvType
Integer	li_RowCount, li_Index, li_OldNew
String		ls_InvestTypeCode, ls_InvestTypeDesc

lds_InvType = CREATE n_ds
lds_InvType.DataObject = "d_investtype"
lds_InvType.SetTransObject( itr_SQLCA )

IF Not  IsNull( as_xml ) and Trim( as_xml ) <> ""  THEN
	li_RowCount	= inv_XmlieService.of_XmlImport( lds_InvType, as_xml )
	IF ( li_RowCount < 1 ) THEN
		Destroy(lds_InvType)
		ithw_Exception.Text	+= "ไม่สามารถรับข้อมูลเพื่อจัดการประเภทเงินลงทุนได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(lds_InvType)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML ข้อมูลทำรายการมายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

FOR li_Index = 1 TO li_RowCount
	ls_InvestTypeDesc	= Trim( lds_InvType.GetItemString( li_Index, "investtype_desc" ) )
	
	IF IsNull (ls_InvestTypeDesc) or (ls_InvestTypeDesc = "") THEN
		ithw_Exception.Text	+= "ไม่สามารถเพื่มประเภทเงินลงทุนได้ ระบุชื่อประเภทเงินลงทุนไม่สมบูรณ์"
		Destroy(lds_InvType)
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	ls_InvestTypeCode	= lds_InvType.GetItemString( li_Index, "investtype_code" )
	ls_InvestTypeCode	= Right ( "000" + ls_InvestTypeCode , 3 )
	
	li_OldNew			= lds_InvType.GetItemNumber( li_Index, "old_new" )	
	IF IsNull (li_OldNew) THEN li_OldNew = 0
	
	IF ( li_OldNew = 0 ) THEN
		INSERT INTO pmucfinvest_type (
			coop_id,
			investtype_code,
			investtype_desc
		)
		VALUES (
			:is_CoopContrl,
			:ls_InvestTypeCode,
			:ls_InvestTypeDesc
		)
		USING itr_SQLCA ;
		
		IF itr_SQLCA.SqlCode <> 0 THEN
			ithw_Exception.Text	+= "ไม่สามารถเพื่มประเภทเงินลงทุนได้ " + itr_SQLCA.SqlErrText
			Destroy(lds_InvType)
			ROLLBACK USING itr_SQLCA ;
			THROW ithw_Exception
		END IF
	ELSE
		UPDATE pmucfinvest_type
		      SET investtype_desc = :ls_InvestTypeDesc
		 WHERE coop_id = :is_CoopContrl
		      AND investtype_code = :ls_InvestTypeCode
		   USING itr_SQLCA ;
		
		IF itr_SQLCA.SqlCode <> 0 THEN
			ithw_Exception.Text	+= "ไม่สามารถปรับปรุงประเภทเงินลงทุนได้ " + itr_SQLCA.SqlErrText
			Destroy(lds_InvType)
			ROLLBACK USING itr_SQLCA ;
			THROW ithw_Exception
		END IF
	END IF
	
NEXT

COMMIT USING itr_SQLCA ;
Destroy(lds_InvType)
RETURN SUCCESS
end function

public function integer of_set_investsource (string as_xml) throws Exception;n_ds	lds_InvSource
Integer	li_RowCount, li_Index, li_OldNew
String		ls_InvestSource, ls_InvestDesc, ls_IndustryCode, ls_InvGroupCode

lds_InvSource = CREATE n_ds
lds_InvSource.DataObject = "d_investsource"

IF Not  IsNull( as_xml ) and Trim( as_xml ) <> ""  THEN
	li_RowCount	= inv_XmlieService.of_XmlImport( lds_InvSource, as_xml )
	IF ( li_RowCount < 1 ) THEN
		Destroy(lds_InvSource)
		ithw_Exception.Text	+= "ไม่สามารถรับข้อมูลเพื่อจัดการกิจลงทุนได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(lds_InvSource)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML ข้อมูลทำรายการมายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception	
END IF

FOR li_Index = 1 TO li_RowCount
	ls_InvestDesc		= Trim( lds_InvSource.GetItemString( li_Index, "invsource_desc" ) )
	IF IsNull (ls_InvestDesc) or (ls_InvestDesc = "") THEN
		ithw_Exception.Text	+= "ไม่สามารถเพื่มกิจการลงทุนได้ ระบุชื่อกิจการลงทุนไม่สมบูรณ์"
		Destroy(lds_InvSource)
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	ls_InvGroupCode		= Trim( lds_InvSource.GetItemString( li_Index, "group_code" ) )
	IF IsNull (ls_InvGroupCode) or (ls_InvGroupCode = "") THEN
		ithw_Exception.Text	+= "ไม่สามารถเพื่มกิจการลงทุนได้ ระบุประเภทหน่วยงานไม่สมบูรณ์"
		Destroy(lds_InvSource)
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	ls_IndustryCode		= Trim( lds_InvSource.GetItemString( li_Index, "industry_code" ) )
	IF IsNull (ls_IndustryCode) or (ls_IndustryCode = "") THEN
		ithw_Exception.Text	+= "ไม่สามารถเพื่มกิจการลงทุนได้ ระบุประเภทธุกิจไม่สมบูรณ์"
		Destroy(lds_InvSource)
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
			
	ls_InvestSource	= lds_InvSource.GetItemString( li_Index, "invsource_code" )
	ls_InvestSource	= Right ( "000" + ls_InvestSource , 3 )
	
	li_OldNew			= lds_InvSource.GetItemNumber( li_Index, "old_new" )	
	IF IsNull (li_OldNew) THEN li_OldNew = 0
	IF ( li_OldNew = 0 ) THEN
		// New Row
		INSERT INTO pmucfinvsource (
			coop_id,
			invsource_code,
			invsource_desc,
			group_code,
			industry_code
		)
		VALUES (
			:is_CoopContrl,
			:ls_InvestSource,
			:ls_InvestDesc,
			:ls_InvGroupCode,
			:ls_IndustryCode
		)
		USING itr_SQLCA ;
		
		IF itr_SQLCA.SqlCode <> 0 THEN
			ithw_Exception.Text	+= "ไม่สามารถเพื่มกิจการลงทุนได้ " + itr_SQLCA.SqlErrText
			Destroy(lds_InvSource)
			ROLLBACK USING itr_SQLCA ;
			THROW ithw_Exception
		END IF
	ELSE
		// Old row => Editing
		UPDATE pmucfinvsource
		      SET invsource_desc = :ls_InvestDesc,
				    group_code = :ls_InvGroupCode,
				    industry_code = :ls_IndustryCode
		 WHERE coop_id = :is_CoopContrl
		      AND invsource_code = :ls_InvestSource
		   USING itr_SQLCA ;
		
		IF itr_SQLCA.SqlCode <> 0 THEN
			ithw_Exception.Text	+= "ไม่สามารถปรับปรุงกิจการลงทุนได้ " + itr_SQLCA.SqlErrText
			Destroy(lds_InvSource)
			ROLLBACK USING itr_SQLCA ;
			THROW ithw_Exception
		END IF
	END IF
	
NEXT

COMMIT USING itr_SQLCA ;
Destroy(lds_InvSource)

RETURN SUCCESS
end function

public function string of_get_warrantylist (string as_coopid, string as_accountno);n_ds		lds_WarrantyList
String		ls_XML
Integer	li_RowCount

lds_WarrantyList = CREATE n_ds
lds_WarrantyList.DataObject = "d_warranty_list"
lds_WarrantyList.SetTransObject( itr_SQLCA )

li_RowCount	= lds_WarrantyList.Retrieve (as_coopid, as_accountno )

IF ( li_RowCount > 0 ) THEN
	ls_XML	= lds_WarrantyList.Describe( "Datawindow.data.XML" )
ELSE
	ls_XML	= ""
END IF

Destroy(lds_WarrantyList)
RETURN ls_XML
end function

public function integer of_set_warrantylist (string as_xml, string as_coopid, string as_accountno) throws Exception;n_ds		lds_WarrantyList
String		ls_XML
Integer	li_RowCount, li_Index, li_Status
DateTime	ldtm_RevokeDate

lds_WarrantyList = CREATE n_ds
lds_WarrantyList.DataObject = "d_warranty_list"
lds_WarrantyList.SetTransObject( itr_SQLCA )

IF Not  IsNull( as_xml ) and Trim( as_xml ) <> ""  THEN
	li_RowCount	= inv_XmlieService.of_XmlImport( lds_WarrantyList, as_xml )
	IF ( li_RowCount < 1 ) THEN
		Destroy(lds_WarrantyList)
		ithw_Exception.Text	+= "ไม่สามารถรับข้อมูลเพื่อจัดการปรับปรุงได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(lds_WarrantyList)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML ข้อมูลทำรายการมายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

FOR li_Index = 1 TO li_RowCount
	
	li_Status	= lds_WarrantyList.GetItemNumber (li_Index, "warranty_status")
	IF IsNull (li_Status) THEN li_Status = 1
	
	ldtm_RevokeDate	= lds_WarrantyList.GetItemDateTime (li_Index, "revoke_date")
	
	// หากเป็นการไถ่ถอนจำนำ
	IF (li_Status = 2) THEN
		IF IsNull (ldtm_RevokeDate) or String (ldtm_RevokeDate, "YYYYMMDD") = "19000101" THEN
			ithw_Exception.Text	+= "ไม่สามารถทำการบันทึกรายการไถ่ถอนจำนำตั๋วได้ ไม่ได้ระบุวันที่ไถ่ถอน"
			ROLLBACK USING itr_SQLCA ;
			Destroy(lds_WarrantyList)
			THROW ithw_Exception
		END IF
	END IF
	
	lds_WarrantyList.SetItem( li_Index, "coop_id", as_CoopID )
	lds_WarrantyList.SetItem( li_Index, "account_no", as_AccountNo )
	lds_WarrantyList.SetItem( li_Index, "seq_no", li_Index )
	lds_WarrantyList.SetItem( li_Index, "warranty_status", li_Status )
	
NEXT

lds_WarrantyList.AcceptText()

DELETE FROM pmwarranty
 WHERE coop_id = :as_CoopID
      AND account_no = :as_AccountNo
   USING itr_SQLCA;
	 
IF lds_WarrantyList.UPDATE() <> 1 THEN
	ithw_Exception.Text	+= "ไม่สามารถเพื่มรายการจำนำตั๋วได้ " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	Destroy(lds_WarrantyList)
	THROW ithw_Exception
END IF


COMMIT USING itr_SQLCA;
Destroy(lds_WarrantyList)

RETURN SUCCESS
end function

public function integer of_del_warranty (string as_coopid, string as_accountno, integer ai_seqno) throws Exception;// ไม่ทำอะไรหากลำดับไม่มีค่า หรือ มีค่าเป็น 0
IF IsNull (ai_seqno) or (ai_seqno = 0) THEN
	RETURN SUCCESS
END IF

DELETE FROM pmwarranty
  WHERE coop_id = :as_CoopID
       AND account_no = :as_AccountNo
	  AND seq_no = :ai_seqno
    USING itr_SQLCA;

IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถลบรายการจำนำตั๋วได้ " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

COMMIT USING itr_SQLCA;

RETURN SUCCESS
end function

public function integer of_settrans (n_cst_dbconnectservice anv_db);
itr_sqlca = CREATE transaction

inv_db		= anv_db
itr_SQLCA	= inv_db.itr_dbconnection

IF IsNull( inv_db.is_CoopControl ) or Trim (inv_db.is_CoopControl) = "" THEN inv_db.is_CoopControl = '010001'

RETURN SUCCESS
end function

public function boolean of_isvalidcalendar (datetime adtm_date);Integer	li_Year, li_Month, li_Found

li_Year	= Year( Date (adtm_date)) + 543
li_Month	= Month( Date (adtm_date))

DECLARE c_Valid CURSOR FOR
  SELECT Count(1)
    FROM amworkcalendar
  WHERE year = :li_Year
       AND month = :li_Month
    USING itr_SQLCA ;
	 
OPEN c_Valid;
FETCH c_Valid INTO :li_Found ;
CLOSE c_Valid;

IF IsNull (li_Found) or li_Found = 0 THEN RETURN FALSE

RETURN TRUE
end function

public function string of_calint_report_advancd (datetime adtm_startdate, datetime adtm_enddate);String		ls_XML
n_ds		lds_ReportIntList
Integer	li_RowCount, li_Index 
String		ls_CoopID, ls_AccountNo
Dec{2}	ldc_Balance, ldc_IntAmt, ldc_TaxAmt
Dec{7}	ldc_IntRate

DateTime	ldtm_CalIntFrom, ldtm_CalIntTo
	
lds_ReportIntList = CREATE n_ds
lds_ReportIntList.DataObject = "rpt_intreceiveable_inadvance"
lds_ReportIntList.SetTransObject( itr_SQLCA )

li_RowCount		= lds_ReportIntList.Retrieve (adtm_startdate, adtm_enddate)

IF ( li_RowCount < 0 ) THEN
	Destroy(lds_ReportIntList)
	RETURN ""
END IF

FOR li_Index = 1 TO li_RowCount
	ls_CoopID			= lds_ReportIntList.GetItemString( li_Index, "coop_id" )
	ls_AccountNo		= lds_ReportIntList.GetItemString( li_Index, "account_no" )
	ldc_Balance			= lds_ReportIntList.GetItemDecimal( li_Index, "pminvestmaster_prncbal" )
	 
	ldtm_CalIntFrom	= lds_ReportIntList.GetItemDateTime( li_Index, "pminvestduedate_start_calint_date" )
	ldtm_CalIntTo		= lds_ReportIntList.GetItemDateTime( li_Index, "pminvestduedate_last_cal_to_date" )
	
	ldc_IntRate			= This.of_getint_rate(ls_AccountNo, ls_CoopID, ldtm_CalIntFrom,ldtm_CalIntTo )
	IF IsNull( ldc_IntRate ) THEN ldc_IntRate = 0.00
	
	ldc_IntAmt	= This.of_Compute_Int(ls_AccountNo,ls_CoopID,ldc_Balance, ldtm_CalIntFrom, ldtm_CalIntTo  )
	
	lds_ReportIntList.SetItem( li_Index, "int_amount", ldc_IntAmt )
	lds_ReportIntList.SetItem( li_Index, "interate_rate", ldc_IntRate )
	
NEXT

lds_ReportIntList.AcceptText()

ls_XML	= lds_ReportIntList.Describe( "Datawindow.data.XML" )

Destroy(lds_ReportIntList)
RETURN ls_XML
end function

public function decimal of_compute_int (string as_accountno, string as_coopid, decimal adc_balance, datetime adtm_calintfrom, datetime adtm_calintto);Integer		li_IntRow, li_Found, li_DayInYear
Integer		li_DayCounted
Dec{7}		ldc_IntRate
Dec			ldc_IntStep, ldc_SumInt
Dec{2}		ldc_IntReturn
DateTime	ldtm_CalIntFrom, ldtm_CalIntTo
String			ls_Expr
n_ds	lds_IntTable

lds_IntTable		= CREATE n_ds
lds_IntTable.DataObject = "d_account_interest"
lds_IntTable.SetTransObject( itr_SQLCA )

li_IntRow		= lds_IntTable.Retrieve( as_AccountNo, as_CoopID )

IF (li_IntRow = 0) THEN RETURN 0.00

// ตรวจสอบ วันที่ต้องมีค่า
IF IsNull(adtm_CalIntFrom) THEN RETURN 0.00
IF IsNull(adtm_CalIntTo) THEN RETURN 0.00

// ตรวจสอบความถูกต้องของวันที่
IF ( adtm_CalIntTo < adtm_CalIntFrom ) THEN RETURN 0.00

ldc_IntStep		= 0.00
ldc_SumInt		= 0.00
ldc_IntRate		= 0.00
ldc_IntReturn	= 0.00
li_DayInYear		= 0

ldtm_CalIntFrom 		= adtm_CalIntFrom
ldtm_CalIntTo			= adtm_CalIntFrom

// ทำการนำค่าข้อมูลที่เกี่ยวข้องมาเก็บในตัวแปรก่อน
DECLARE c_CalInfo CURSOR FOR
    SELECT	day_inyear
	 FROM	pminvestmaster
    WHERE	account_no = :as_AccountNo
	    AND	coop_id = :as_CoopID
	 USING	itr_SQLCA ;

OPEN c_CalInfo;
FETCH c_CalInfo INTO :li_DayInYear ;
CLOSE c_CalInfo;

// หากเป็นค่า NULL ให้กำหนดจำนวนวันให้เป็น 0 คือ ตามปีปฏิทิน
IF IsNull(li_DayInYear) THEN li_DayInYear = 0
	
DO WHILE (ldtm_CalIntTo < adtm_CalIntTo)
	// ยกเลิกช่วงตารางที่ไม่ได้ใช้
	li_Found		= 0
	ls_Expr		= " '" + string( ldtm_CalIntFrom, 'yyyy-mm-dd' ) + "' < string( int_end_date, 'yyyy-mm-dd' ) "
	li_Found		= lds_IntTable.find( ls_Expr, 0, lds_IntTable.RowCount() )
	
	IF ( li_Found <= 0 ) THEN		
		RETURN ldc_IntReturn
	ELSE
		// ดูว่าวันสุดท้ายของอัตรานี้เป็นวันที่เท่าไหร่
		ldtm_CalIntTo	= lds_IntTable.GetItemDateTime( li_Found, "int_end_date" )
		
		// หากวันที่ที่หามาได้ มากกว่า วันที่ส่งมา ให้คิดถึงแค่วันที่ส่งมา
		IF ( ldtm_CalIntTo > adtm_CalIntTo ) THEN ldtm_CalIntTo = adtm_CalIntTo
		
		// อัตราดอกเบี้ย
		ldc_IntRate	= lds_IntTable.GetItemDecimal( li_Found, "int_rate" )
		IF IsNull(ldc_IntRate) THEN ldc_IntRate = 0.00
		
		// หากวันตามปี
		IF ( li_DayInYear = 0 ) THEN
			// ตรวจสอบว่า 29.02.ปีนี้ เป็นวันที่หรือเปล่า
			IF ( inv_DateTime.of_IsLeapYear( Date(ldtm_CalIntFrom) ) ) THEN
				li_DayInYear		= 366
			ELSE
				li_DayInYear		= 365
			END IF
			
			// ตรวจว่าคิดดอกเบี้ยข้อมปีหรือไม่
			IF ( Date( ldtm_CalIntTo ) > Date( Year(Date(ldtm_CalIntTo)), 12, 31 )  ) THEN
				ldtm_CalIntTo	= DateTime( Date(Year(Date(ldtm_CalIntTo)), 12, 31) )
			END IF
			
			// หากวันที่ที่หามาได้ มากกว่า วันที่ส่งมา ให้คิดถึงแค่วันที่ส่งมา
			IF ( ldtm_CalIntTo > adtm_CalIntTo ) THEN ldtm_CalIntTo = adtm_CalIntTo
		
			// หากเป็นการข้ามปี ให้กำหนดวันที่คิดดอกเบี้ยล่าสุด เป็นวันที่ 1 มกราคา ปีถัดไป
			IF ( Year(Date(adtm_CalIntTo)) <> Year(Date(ldtm_CalIntTo))) THEN
				ldtm_CalIntTo	= DateTime( RelativeDate( Date(ldtm_CalIntTo) , 1 ) )
			END IF
		
		END IF // ตรวจสอบข้อมปี
		
		li_DayCounted	= 0
		li_DayCounted	= DaysAfter( Date(ldtm_CalIntFrom), Date(ldtm_CalIntTo) )
		
		ldc_IntStep	= 0.00
		ldc_IntStep	= ( adc_Balance * li_DayCounted * ldc_IntRate ) / ( li_DayInYear * 100 )
		
		ldc_SumInt	= ldc_SumInt + ldc_IntStep
		
		// ขยับวันที่ เริ่มคิดสำหรับรอบต่อไป
		ldtm_CalIntFrom	= ldtm_CalIntTo
	END IF
LOOP

ldc_IntReturn	= ldc_SumInt

RETURN ldc_IntReturn
end function

public function decimal of_getint_rate (string as_accountno, string as_coopid, datetime adtm_calintfrom, datetime adtm_calintto);Dec{7}		ldc_IntRate
String			ls_Expr

// ตรวจสอบ วันที่ต้องมีค่า
IF IsNull(adtm_CalIntFrom) THEN RETURN 0.00
IF IsNull(adtm_CalIntTo) THEN RETURN 0.00

// ตรวจสอบความถูกต้องของวันที่
IF ( adtm_CalIntTo < adtm_CalIntFrom ) THEN RETURN 0.00

DECLARE c_Intrate CURSOR FOR
  SELECT int_rate
    FROM pminvestintrate
  WHERE coop_id = :as_coopid
       AND account_no = :as_accountno
       AND int_end_date >= :adtm_calintfrom
ORDER BY int_end_date ASC
USING itr_SQLCA ;

ldc_IntRate		= 0.00

OPEN c_Intrate ;
FETCH c_Intrate INTO :ldc_IntRate;
CLOSE c_Intrate ;

IF IsNull (ldc_IntRate) THEN ldc_IntRate = 0.00

RETURN ldc_IntRate
end function

public function integer of_updateinvestmaster (string as_xml) throws Exception;n_ds	lds_InvestMaster
Integer	li_RowCount, li_Index
Integer		li_InvestPeriod, li_InvestPeriodUnit
Long			ll_UnitAmt
DateTime	ldtm_DueDate,ldtm_CalIntTo, ldtm_CalIntFrom
String			ls_AccountNo
String			ls_InvestTypeCode , ls_BranchID , ls_AccidPrnc, ls_InvSourceCode
String			ls_SymbolCode , ls_RateCode
String			ls_AccountID, ls_AccountName, ls_CoopID
Dec{2}		ldc_ItemAmt , ldc_UnitCost, ldc_BalanceAmt, ldc_AccuIntAmt, ldc_DeffAmt
DateTime	ldtm_OpenDate , ldtm_BuyDate , ldtm_TestDate

lds_InvestMaster = CREATE n_ds
lds_InvestMaster.DataObject = "d_invest_master"
lds_InvestMaster.SetTransObject( itr_SQLCA )

IF Not  IsNull( as_xml ) and Trim( as_xml ) <> ""  THEN
	li_RowCount	= inv_XmlieService.of_XmlImport( lds_InvestMaster, as_xml )
	IF ( li_RowCount < 1 ) THEN
		Destroy(lds_InvestMaster)
		ithw_Exception.Text	+= "ไม่สามารถรับข้อมูลเพื่อทำการบันทึกแก้ไขได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML มายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

ls_InvSourceCode			= Trim(lds_InvestMaster.GetItemString( 1 , "invsource_code" ))
ls_InvestTypeCode			= Trim(lds_InvestMaster.GetItemString( 1 , "investtype_code" ))
ls_AccidPrnc					= Trim(lds_InvestMaster.GetItemString( 1 , "accid_prnc" ))
ls_SymbolCode				= Trim(lds_InvestMaster.GetItemString( 1 , "symbol_code" ))
ls_RateCode					= Trim(lds_InvestMaster.GetItemString( 1 , "rate_code" ))
ls_AccountName			= Trim(lds_InvestMaster.GetItemString( 1 , "account_name" ))
ls_CoopID					= Trim(lds_InvestMaster.GetItemString( 1 , "coop_id" ))
ls_AccountNo				= Trim(lds_InvestMaster.GetItemString( 1 , "account_no" ))

//ls_CondWithdraw			= Trim(lds_InvestMaster.GetItemString( 1 , "cond_withdraw" ))
//ls_BankCode				= Trim(lds_InvestMaster.GetItemString( 1 , "bank_code" ))
//ls_BankBranch				= Trim(lds_InvestMaster.GetItemString( 1 , "bank_branch" ))
//ls_TranBankAccNo			= Trim(lds_InvestMaster.GetItemString( 1 , "tran_bankacc_no" ))
//ls_TranAccName			= Trim(lds_InvestMaster.GetItemString( 1 , "tranacc_name" ))
//ls_Remark					= Trim(lds_InvestMaster.GetItemString( 1 , "remark" ))
//ls_AccIdInt					= Trim(lds_InvestMaster.GetItemString( 1 , "accid_int" ))
//ls_OrganWarranty			= Trim(lds_InvestMaster.GetItemString( 1 , "organ_warranty" ))
//ls_InvestDetail				= Trim(lds_InvestMaster.GetItemString( 1 , "invest_detail" ))

ldc_ItemAmt				= lds_InvestMaster.GetItemDecimal( 1 , "purchase_price" )
ldc_BalanceAmt			= lds_InvestMaster.GetItemDecimal( 1 , "prncbal" )
ldc_UnitCost					= lds_InvestMaster.GetItemDecimal( 1 , "unit_cost" )
ldc_AccuIntAmt				= lds_InvestMaster.GetItemDecimal( 1 , "accuint_amt" )

//ldc_IntPresentRate			= lds_InvestMaster.GetItemDecimal( 1 , "int_present_rate" )
//ldc_TaxRate					= lds_InvestMaster.GetItemDecimal( 1 , "tax_rate" )
//ldc_DurationDue			= lds_InvestMaster.GetItemDecimal( 1 , "duration_due" )
ldc_DeffAmt					= lds_InvestMaster.GetItemDecimal( 1 , "deff_amt" )

ldtm_DueDate				= lds_InvestMaster.GetItemDateTime( 1 , "due_date" )
ldtm_OpenDate			= lds_InvestMaster.GetItemDateTime( 1 , "open_date" )
ldtm_BuyDate				= lds_InvestMaster.GetItemDateTime( 1 , "buy_date" )
//ldtm_CloseDate				= lds_InvestMaster.GetItemDateTime( 1 , "close_date" )
//ldtm_StartIntDate			= lds_InvestMaster.GetItemDateTime( 1 , "start_intdate" )
//ldtm_PushDate				= lds_InvestMaster.GetItemDateTime( 1 , "push_date" )
//ldtm_CallDate				= lds_InvestMaster.GetItemDateTime( 1 , "call_date" )

ll_UnitAmt					= lds_InvestMaster.GetItemNumber( 1 , "unit_amt" )
li_InvestPeriod				= lds_InvestMaster.GetItemNumber( 1 , "investment_period" )
li_InvestPeriodUnit			= lds_InvestMaster.GetItemNumber( 1 , "invest_period_unit" )
//li_CloseStatus				= lds_InvestMaster.GetItemNumber( 1 , "close_status" )
//li_PushStatus				= lds_InvestMaster.GetItemNumber( 1 , "invest_period_unit" )
//li_DayInYear					= lds_InvestMaster.GetItemNumber( 1 , "invest_period_unit" )
//li_CallStatus					= lds_InvestMaster.GetItemNumber( 1 , "invest_period_unit" )
//li_IntTimeDue				= lds_InvestMaster.GetItemNumber( 1 , "invest_period_unit" )


CHOOSE CASE li_InvestPeriodUnit
	CASE 1 // วัน
		ldtm_TestDate	= DateTime( RelativeDate( Date( ldtm_OpenDate), li_InvestPeriod ) )
		
	CASE 2 // เดือน
		ldtm_TestDate	= DateTime( inv_DateTime.of_RelativeMonth( Date( ldtm_OpenDate), li_InvestPeriod ) )
		
	CASE 3 // ปี
		ldtm_TestDate	= DateTime( inv_DateTime.of_RelativeYear( Date( ldtm_OpenDate), li_InvestPeriod ) )
		
END CHOOSE

IF ( Date(ldtm_TestDate) > Date(ldtm_DueDate) ) THEN
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ วันที่ครบกำหนดลงทุนไม่สัมพันธ์กับอายุการลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull( ls_AccountName ) or Trim (ls_AccountName) = "" Then	
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุชื่อบัญชีเงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull( ldtm_OpenDate ) Then	
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุวันที่ลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull( ldtm_DueDate ) Then
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุวันที่ครบกำหนด"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ls_CoopID) or ls_CoopID = "" THEN
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุรหัสสหกรณ์"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ldc_ItemAmt) or ldc_ItemAmt <= 0  THEN
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุราคาซื้อเงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ls_InvSourceCode) or ls_InvSourceCode = "" THEN
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุแหล่งเงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ls_InvestTypeCode) or ls_InvestTypeCode = "" THEN
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุประเภทเงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ll_UnitAmt) or ll_UnitAmt <= 0  THEN
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุจำนวนหน่วยลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ldc_UnitCost) or ldc_UnitCost <= 0  THEN
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุราคาต่อหน่วยลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ls_SymbolCode) or ls_SymbolCode = "" THEN
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุ Symbol เงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull(ls_RateCode) or ls_RateCode = "" THEN
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุ RATE เงินลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF


IF IsNull(ldtm_BuyDate) or String (ldtm_BuyDate, "YYYYMMDD") = "19000101" THEN
	Destroy(lds_InvestMaster)
	ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการวันที่ซื้อหน่วยลงทุน"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

lds_InvestMaster.SetItemStatus( 1, 0, Primary!, DataModified! )

IF lds_InvestMaster.UPDATE() <> 1 THEN
	ithw_Exception.text	+= "ไม่สามารถบันทึก MAIN ได้ " + lds_InvestMaster.of_geterrormessage( )
	ROLLBACK USING itr_SQLCA ;
	Destroy(lds_InvestMaster)
	THROW ithw_Exception
END IF

COMMIT USING itr_SQLCA ;
Destroy(lds_InvestMaster)

// ปรับปรุงส่วนเกินส่วนต่ำ
THIS.of_set_UpperLower(ls_CoopID, ls_AccountNo, ldc_AccuIntAmt)

RETURN SUCCESS
end function

public function integer of_updateduedate (string as_xml, string as_accountno) throws Exception;n_ds	lds_DueDate
Integer	li_RowCount, li_Index
DateTime	ldtm_DueDate,ldtm_CalIntTo, ldtm_CalIntFrom

lds_DueDate = CREATE n_ds
lds_DueDate.DataObject = "d_account_due_date3"
lds_DueDate.SetTransObject( itr_SQLCA )

IF Not  IsNull( as_xml ) and Trim( as_xml ) <> ""  THEN
	li_RowCount	= inv_XmlieService.of_XmlImport( lds_DueDate, as_xml )
	IF ( li_RowCount < 1 ) THEN
		Destroy(lds_DueDate)
		ithw_Exception.Text	+= "ไม่สามารถรับข้อมูลเพื่อทำการบันทึกแก้ไขได้"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
ELSE
	Destroy(lds_DueDate)
	ithw_Exception.Text	+= "ไม่มีการส่ง XML มายังตัวบริการ"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

// ล้างข้อมูลเดิมก่อน แล้วค่อยบันทึกข้อมูลใหม่เข้าไป
DELETE FROM pminvestduedate
WHERE account_no = :as_accountno
     AND coop_id = :is_CoopContrl
  USING itr_SQLCA ;

IF itr_SQLCA.SQLCODE <> 0 THEN
	Destroy(lds_DueDate)
	ithw_Exception.Text	+= "ไม่สามารถล้างข้อมูลเก่า ก่อนทำการปรับปรุงได้" + " " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

FOR li_Index = 1 TO li_RowCount
	lds_DueDate.SetItem(li_Index,"account_no",as_accountno)
	lds_DueDate.SetItem(li_Index,"coop_id",is_CoopContrl)
	
	ldtm_DueDate		= lds_DueDate.GetItemDateTime(li_Index,"due_date")
	ldtm_CalIntTo		= lds_DueDate.GetItemDateTime(li_Index,"last_cal_to_date")
	ldtm_CalIntFrom	= lds_DueDate.GetItemDateTime(li_Index,"start_calint_date")
	
	IF IsNull (ldtm_DueDate) or String (ldtm_DueDate, "YYYYMMDD") = "19000101" THEN
		Destroy(lds_DueDate)
		ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุ วันที่ลงรับดอกเบี้ย"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	IF IsNull (ldtm_CalIntTo) or String (ldtm_CalIntTo, "YYYYMMDD") = "19000101" THEN
		Destroy(lds_DueDate)
		ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุ วันสิ้นสุดการคำนวณดอกเบี้ย"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	IF IsNull (ldtm_CalIntFrom) or String (ldtm_CalIntFrom, "YYYYMMDD") = "19000101" THEN
		Destroy(lds_DueDate)
		ithw_Exception.Text	+= "ข้อมูลไม่สมบูรณ์ ไม่มีการระบุ วันที่เริ่มต้นคำนวณดอกเบี้ย"
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	
NEXT

lds_DueDate.AcceptText()
IF lds_DueDate.UPDATE() <> 1 THEN
	ithw_Exception.Text	+= "ไม่สามารถปรับปรุงข้อมูล PMINVESTDUEDATE ได้"+ " " + lds_DueDate.of_geterrormessage()
	ROLLBACK USING itr_SQLCA ;
	Destroy(lds_DueDate)
	THROW ithw_Exception
END IF

COMMIT USING itr_SQLCA;
Destroy(lds_DueDate)

RETURN SUCCESS
end function

public function integer of_del_investtype (string as_coopid, string as_investcode) throws Exception;Integer	li_Found

IF IsNull (as_investcode) or ( Trim (as_investcode) = "") THEN
	RETURN SUCCESS
END IF

// ตรวจสอบการอ้างอิงรายการ เปิดบัญชี
DECLARE c_Open CURSOR FOR
  SELECT Count (1)
    FROM pmreqinvestment
  WHERE coop_id = :as_CoopID
       AND investtype_code = :as_investcode 
    USING itr_SQLCA;

li_Found	= 0

OPEN c_Open ;
FETCH c_Open INTO :li_Found ;
CLOSE c_Open;

IF IsNull (li_Found) THEN li_Found = 0
IF (li_Found >0) THEN
	ithw_Exception.Text	+= "ไม่สามารถลบรายการประเภทเงินลงทุนได้ มีการอ้างอิงรหัสดังกล่าว"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF
// ตรวจสอบการอ้างอิง บัญชีเงินลงทุน
DECLARE c_Master CURSOR FOR
  SELECT Count (1)
    FROM pmreqinvestment
  WHERE coop_id = :as_CoopID
       AND investtype_code = :as_investcode
    USING itr_SQLCA;

li_Found	= 0

OPEN c_Master ;
FETCH c_Master INTO :li_Found ;
CLOSE c_Master;

IF IsNull (li_Found) THEN li_Found = 0
IF (li_Found >0) THEN
	ithw_Exception.Text	+= "ไม่สามารถลบรายการประเภทเงินลงทุนได้ มีการอ้างอิงรหัสดังกล่าว"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

DELETE FROM pmucfinvest_type
  WHERE coop_id = :as_CoopID
       AND investtype_code = :as_investcode
    USING itr_SQLCA;

IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถลบรายการประเภทเงินลงทุนได้ " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

COMMIT USING itr_SQLCA;

RETURN SUCCESS
end function

public function integer of_del_investgroup (string as_coopid, string as_investgroupcode) throws Exception;Integer	li_Found


IF IsNull (as_investgroupcode) or ( Trim (as_investgroupcode) = "") THEN
	RETURN SUCCESS
END IF

// ตรวจสอบการอ้างอิงรายการ แหล่งเงินลงทุน
DECLARE c_Source CURSOR FOR
  SELECT Count (1)
    FROM pmucfinvsource
  WHERE coop_id = :as_CoopID
       AND group_code = :as_investgroupcode 
    USING itr_SQLCA;

li_Found	= 0

OPEN c_Source ;
FETCH c_Source INTO :li_Found ;
CLOSE c_Source;

IF IsNull (li_Found) THEN li_Found = 0
IF (li_Found >0) THEN
	ithw_Exception.Text	+= "ไม่สามารถลบรายการกลุ่มเงินลงทุนได้ มีการอ้างอิงรหัสดังกล่าว"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF


DELETE FROM pmucfinvest_group
  WHERE coop_id = :as_CoopID
       AND group_code = :as_investgroupcode
    USING itr_SQLCA;

IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถลบรายการกลุ่มเงินลงทุนได้ " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

COMMIT USING itr_SQLCA;

RETURN SUCCESS
end function

public function integer of_del_investsource (string as_coopid, string as_investsourcecode) throws Exception;Integer	li_Found


IF IsNull (as_investsourcecode) or ( Trim (as_investsourcecode) = "") THEN
	RETURN SUCCESS
END IF

// ตรวจสอบการอ้างอิงรายการ เปิดบัญชี
DECLARE c_Open CURSOR FOR
  SELECT Count (1)
    FROM pmreqinvestment
  WHERE coop_id = :as_CoopID
       AND invsource_code = :as_investsourcecode 
    USING itr_SQLCA;

li_Found	= 0

OPEN c_Open ;
FETCH c_Open INTO :li_Found ;
CLOSE c_Open;

IF IsNull (li_Found) THEN li_Found = 0
IF (li_Found >0) THEN
	ithw_Exception.Text	+= "ไม่สามารถลบรายการประเภทเงินลงทุนได้ มีการอ้างอิงรหัสดังกล่าว"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

// ตรวจสอบการอ้างอิง บัญชีเงินลงทุน
DECLARE c_Master CURSOR FOR
  SELECT Count (1)
    FROM pminvestmaster
  WHERE coop_id = :as_CoopID
       AND invsource_code = :as_investsourcecode
    USING itr_SQLCA;

li_Found	= 0

OPEN c_Master ;
FETCH c_Master INTO :li_Found ;
CLOSE c_Master;

IF IsNull (li_Found) THEN li_Found = 0
IF (li_Found >0) THEN
	ithw_Exception.Text	+= "ไม่สามารถลบรายการประเภทเงินลงทุนได้ มีการอ้างอิงรหัสดังกล่าว"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

DELETE FROM pmucfinvsource
  WHERE coop_id = :as_CoopID
       AND invsource_code = :as_investsourcecode
    USING itr_SQLCA;

IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถลบรายการแหล่งเงินลงทุนได้ " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

COMMIT USING itr_SQLCA;

RETURN SUCCESS
end function

public function integer of_del_industry (string as_coopid, string as_industrycode) throws Exception;Integer	li_Found

IF IsNull (as_industrycode) or ( Trim (as_industrycode) = "") THEN
	RETURN SUCCESS
END IF

// ตรวจสอบการอ้างอิงรายการ แหล่งเงินลงทุน
DECLARE c_Source CURSOR FOR
  SELECT Count (1)
    FROM pmucfinvsource
  WHERE coop_id = :as_CoopID
       AND industry_code = :as_industrycode 
    USING itr_SQLCA;

li_Found	= 0

OPEN c_Source ;
FETCH c_Source INTO :li_Found ;
CLOSE c_Source;

IF IsNull (li_Found) THEN li_Found = 0
IF (li_Found >0) THEN
	ithw_Exception.Text	+= "ไม่สามารถลบรายการกลุ่มเงินลงทุนได้ มีการอ้างอิงรหัสดังกล่าว"
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

DELETE FROM pmucfindustry_group
  WHERE coop_id = :as_CoopID
       AND industry_code = :as_industrycode
    USING itr_SQLCA;

IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถลบรายการกลุ่มธุรกิจได้ " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

COMMIT USING itr_SQLCA;

RETURN SUCCESS
end function

public function decimal of_get_upperlower (string as_coopid, string as_accountno);Dec{2}		ldc_CleanPriceAmt, ldc_PrncBal, ldc_PurchasePrice, ldc_Difference, ldc_AccuInt
DateTime	ldtm_BuyDate, ldtm_DueDate
Integer		li_IntTimeDue, li_Count

DECLARE c_Master CURSOR FOR
  SELECT cleanprice_amt, buy_date, prncbal, purchase_price, due_date, accuint_amt
    FROM pminvestmaster
  WHERE coop_id = :as_CoopID
       AND account_no = :as_AccountNo
    USING itr_SQLCA ;

OPEN c_Master;
FETCH c_Master INTO :ldc_CleanPriceAmt, :ldtm_BuyDate, :ldc_PrncBal, :ldc_PurchasePrice, :ldtm_DueDate, :ldc_AccuInt ;
CLOSE c_Master ;

IF IsNull (ldc_CleanPriceAmt) THEN ldc_CleanPriceAmt = 0.00
IF IsNull (ldc_PrncBal) THEN ldc_PrncBal = 0.00
IF IsNull (ldc_PurchasePrice) THEN ldc_PurchasePrice = 0.00
IF IsNull (ldc_AccuInt) THEN ldc_AccuInt = 0.00

// ส่วนต่าง
ldc_Difference	= ldc_PurchasePrice - ldc_PrncBal - ldc_AccuInt
li_Count = daysafter( date( ldtm_BuyDate ), date( ldtm_DueDate ) )


ldc_Difference	= round( ldc_Difference / li_Count, 2 )

RETURN ldc_Difference
end function

public function decimal of_getavg_int (string as_coopid, string as_accountno, boolean ab_yield);Integer		li_IntRow, li_Index, li_TotalPeriod, li_Period
Dec{7}		ldc_IntRate, ldc_IntRateTotal
DateTime	ldtm_CalIntFrom, ldtm_CalIntTo
String			ls_Expr

n_ds	lds_IntTable

lds_IntTable		= CREATE n_ds
lds_IntTable.DataObject = "d_account_interest"
lds_IntTable.SetTransObject( itr_SQLCA )

li_IntRow		= lds_IntTable.Retrieve( as_AccountNo, as_CoopID )

IF (li_IntRow = 0) THEN RETURN 0.00

ldc_IntRate			= 0.00
li_TotalPeriod		= 0
ldc_IntRateTotal	= 0.00

FOR li_Index = 1 TO li_IntRow
	
		ldtm_CalIntTo		= lds_IntTable.GetItemDateTime( li_Index, "int_end_date" )
		ldtm_CalIntFrom	= lds_IntTable.GetItemDateTime( li_Index, "int_end_date" )
		
		ldc_IntRate		= 0.00
		li_Period			= 0
		li_Period			= inv_DateTime.of_monthsAfter( Date (ldtm_CalIntFrom), Date (ldtm_CalIntTo) )
		
		li_TotalPeriod	= li_TotalPeriod + li_Period
		
		// อัตราดอกเบี้ย
		IF ( ab_yield ) THEN
			ldc_IntRate	= lds_IntTable.GetItemDecimal( li_Index, "int_yield_rate" )
		ELSE
			ldc_IntRate	= lds_IntTable.GetItemDecimal( li_Index, "int_rate" )
		END IF
		
		IF IsNull(ldc_IntRate) THEN ldc_IntRate = 0.00
		
		ldc_IntRate			= ldc_IntRate * li_Period
		ldc_IntRateTotal	= ldc_IntRateTotal + ldc_IntRate
NEXT

ldc_IntRateTotal	= ldc_IntRateTotal / li_TotalPeriod

RETURN ldc_IntRateTotal

end function

public function integer of_get_receiveint_period (string as_coopid, string as_accountno, datetime adtm_buydate);Integer		li_Count

DECLARE c_CountPeriod CURSOR FOR
  SELECT Count(1)
    FROM pminvestduedate
  WHERE	coop_id = :as_CoopID
       AND account_no = :as_AccountNo
	  AND periodpayrr = 1
	  AND	recint_flag = 1
	  AND due_date >= :adtm_BuyDate
    USING itr_SQLCA ;

OPEN c_CountPeriod;
FETCH c_CountPeriod INTO :li_Count ;
CLOSE c_CountPeriod ;

IF IsNull (li_Count)  THEN li_Count = 0

RETURN li_Count
end function

public function integer of_set_upperlower (string as_coopid, string as_accountno, decimal adc_accuintamt) throws Exception;Dec{2}		ldc_PrncBal, ldc_PurchasePrice, ldc_Difference, ldc_CleanPriceAmt
DateTime	ldtm_BuyDate, ldtm_DueDate
Integer		li_IntTimeDue, li_Count

DECLARE c_Master CURSOR FOR
  SELECT cleanprice_amt, buy_date, prncbal, purchase_price
    FROM pminvestmaster
  WHERE coop_id = :as_CoopID
       AND account_no = :as_AccountNo
    USING itr_SQLCA ;

OPEN c_Master;
FETCH c_Master INTO :ldc_CleanPriceAmt, :ldtm_BuyDate, :ldc_PrncBal, :ldc_PurchasePrice ;
CLOSE c_Master ;

IF IsNull (ldc_CleanPriceAmt) THEN ldc_CleanPriceAmt = 0.00
IF IsNull (ldc_PrncBal) THEN ldc_PrncBal = 0.00
IF IsNull (ldc_PurchasePrice) THEN ldc_PurchasePrice = 0.00

// ส่วนต่าง
ldc_Difference	= ldc_PrncBal - ldc_CleanPriceAmt

DECLARE c_CountPeriod CURSOR FOR
  SELECT Count(1)
    FROM pminvestduedate
  WHERE	coop_id = :as_CoopID
       AND account_no = :as_AccountNo
	  AND periodpayrr = 1
	  AND due_date >= :ldtm_BuyDate
    USING itr_SQLCA ;

OPEN c_CountPeriod;
FETCH c_CountPeriod INTO :li_Count ;
CLOSE c_CountPeriod ;

IF IsNull (li_Count) or (li_Count = 0) THEN li_Count = 1

ldc_Difference	= ldc_Difference / li_Count

UPDATE pminvestmaster
      SET deff_amt = :ldc_Difference
  WHERE coop_id = :as_CoopID
       AND account_no = :as_AccountNo
    USING itr_SQLCA ;
	 
IF itr_SQLCA.SqlCode <> 0 THEN
	ithw_Exception.Text	+= "ไม่สามารถปรับปรุง ส่วนเกิน/ส่วนต่ำ ได้ " + itr_SQLCA.SqlErrText
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

COMMIT USING itr_SQLCA;

RETURN SUCCESS
end function

public function decimal of_getint_rate_yield (string as_accountno, string as_coopid, datetime adtm_calintfrom, datetime adtm_calintto);Dec{7}		ldc_IntRate
String			ls_Expr


// ตรวจสอบ วันที่ต้องมีค่า
IF IsNull(adtm_CalIntFrom) THEN RETURN 0.00
IF IsNull(adtm_CalIntTo) THEN RETURN 0.00

// ตรวจสอบความถูกต้องของวันที่
IF ( adtm_CalIntTo < adtm_CalIntFrom ) THEN RETURN 0.00

DECLARE c_Intrate CURSOR FOR
  SELECT int_yield_rate
    FROM pminvestintrate
  WHERE coop_id = :as_coopid
       AND account_no = :as_accountno
       AND int_end_date >= :adtm_calintfrom
ORDER BY int_end_date ASC
USING itr_SQLCA ;

ldc_IntRate		= 0.00

OPEN c_Intrate ;
FETCH c_Intrate INTO :ldc_IntRate;
CLOSE c_Intrate ;

IF IsNull (ldc_IntRate) THEN ldc_IntRate = 0.00

RETURN ldc_IntRate
end function

public function integer of_duration_calculation (string as_accountno, string as_coopid, datetime adtm_buydate, datetime adtm_duedate);Integer	li_Period, li_DayNumber, li_DaiInYear
DateTime	ldtm_StartIntDate, ldtm_EndIntDate, ldtm_DueDate
Dec{7}		ldc_IntRate, ldc_IntYieldRate
Dec{2}		ldc_CashFlowRecv, ldc_CshFlwOfCt, ldc_Balance, ldc_PurchasePrice, ldc_Accuint

//DaysAfter( Date( if( date( pminvestduedate_start_calint_date ) < date( pminvestmaster_buy_date ) , pminvestmaster_buy_date , pminvestduedate_start_calint_date )), Date( pminvestduedate_last_cal_to_date ) ) * ((  pminvestmaster_purchase_price -  pminvestmaster_accuint_amt  )) * pminvestduedate_intyield_rate / ( day_inyear * 100 )
DECLARE c_Duedate CURSOR FOR
  SELECT b.start_calint_date,	b.last_cal_to_date,
              b.int_rate,				b.intyield_rate,
              b.due_date,				a.prncbal,
              a.purchase_price, 		a.accuint_amt,
              a.day_inyear
    FROM pminvestmaster a, pminvestduedate b
  WHERE a.coop_id = b.coop_id
       AND a.account_no = b.account_no
       AND b.coop_id = :as_CoopID
       AND b.account_no = :as_AccountNo
       AND b.due_date >= :adtm_BuyDate
       AND b.periodpayrr = 1
ORDER BY b.due_date ASC
USING itr_SQLCA;

OPEN c_Duedate ;
FETCH c_Duedate INTO :ldtm_StartIntDate, :ldtm_EndIntDate, 
		:ldc_IntRate, :ldc_IntYieldRate, :ldtm_DueDate, :ldc_Balance, :ldc_PurchasePrice, :ldc_Accuint, :li_DaiInYear ;

li_Period	= 0

DO WHILE itr_SQLCA.SQLCODE = 0
	li_Period ++
	
	IF IsNull (ldc_PurchasePrice) THEN ldc_PurchasePrice = 0.00
	IF IsNull (ldc_Accuint) THEN ldc_Accuint = 0.00
	IF IsNull (li_DaiInYear) THEN li_DaiInYear = 365
	
	IF IsNull (ldc_IntRate) THEN ldc_IntRate = 0.00
	IF IsNull (ldc_IntYieldRate) THEN ldc_IntYieldRate = 0.00
	
	li_DayNumber		= DaysAfter( Date (ldtm_StartIntDate), Date (ldtm_EndIntDate) )
	ldc_CashFlowRecv	= 0.00
	ldc_CshFlwOfCt		= 0.00
	
	ldc_CashFlowRecv	= ldc_Balance * ( ldc_IntRate / 100 )  * ( li_DayNumber / 365 ) 
	
	IF ( Date (adtm_duedate) = Date (ldtm_EndIntDate) ) THEN
		ldc_CashFlowRecv	= ldc_CashFlowRecv + ldc_Balance
	END IF

	ldc_CshFlwOfCt		= ldc_CashFlowRecv /  ( ( 1 + (ldc_IntYieldRate / 100 * ( li_DayNumber / 365) ) ) ^  li_Period )	
	
	// คำนวณ
	UPDATE pminvestduedate
	      SET c1_amt = :ldc_CashFlowRecv,
			    pv_of_c1 = :ldc_CshFlwOfCt
      WHERE coop_id = :as_CoopID
          AND account_no = :as_AccountNo
	     AND due_date = :ldtm_DueDate
          AND periodpayrr = 1
       USING itr_SQLCA;

	ldc_IntRate			= 0.00
	ldc_IntYieldRate	= 0.00
	
	FETCH c_Duedate INTO :ldtm_StartIntDate, :ldtm_EndIntDate, 
			:ldc_IntRate, :ldc_IntYieldRate, :ldtm_DueDate, :ldc_Balance , :ldc_PurchasePrice, :ldc_Accuint , :li_DaiInYear ;
LOOP

CLOSE c_Duedate ;

COMMIT USING itr_SQLCA;
RETURN SUCCESS
end function

public function decimal of_completecal_duration (string as_accountno, string as_coopid, integer ai_period);Dec{2}		ldc_SumCshFlwOfCt, ldc_PVofC
Dec{7}		ldc_DurationPeriod, ldc_PVofCbyV, ldc_SumDuration
Integer		li_Period
DateTime	ldtm_DueDate

DECLARE c_SumPVC CURSOR FOR
  SELECT SUM (pv_of_c1)
    FROM pminvestduedate
  WHERE coop_id = :as_CoopID
       AND account_no = :as_AccountNo
    USING itr_SQLCA;

OPEN c_SumPVC ;
FETCH c_SumPVC INTO :ldc_SumCshFlwOfCt ;
CLOSE c_SumPVC ;

DECLARE c_PVC CURSOR FOR
  SELECT pv_of_c1, due_date
    FROM pminvestduedate
  WHERE coop_id = :as_CoopID
       AND account_no = :as_AccountNo
       AND pv_of_c1 > 0
ORDER BY due_date ASC
    USING itr_SQLCA;

OPEN c_PVC ;
FETCH c_PVC INTO :ldc_PVofC, :ldtm_DueDate ;

li_Period	 = 0

DO WHILE itr_SQLCA.SQLCODE = 0
	li_Period ++
	
	ldc_PVofCbyV			= ldc_PVofC / ldc_SumCshFlwOfCt
	ldc_DurationPeriod		= ldc_PVofCbyV * li_Period
	ldc_DurationPeriod		= ldc_DurationPeriod / ai_period
	
	UPDATE pminvestduedate
	      SET pvc1_of_v = :ldc_PVofCbyV,
			    pvc1ofv_by_t = :ldc_DurationPeriod
      WHERE coop_id = :as_CoopID
          AND account_no = :as_AccountNo
	     AND due_date = :ldtm_DueDate
       USING itr_SQLCA;
	
	ldc_SumDuration		= ldc_SumDuration + ldc_DurationPeriod
	ldc_DurationPeriod		= 0.00
	ldc_PVofCbyV			= 0.00
	
	ldc_PVofC	= 0.00
	FETCH c_PVC INTO :ldc_PVofC, :ldtm_DueDate ;
LOOP

CLOSE c_PVC;

COMMIT USING itr_SQLCA;
RETURN ldc_SumDuration
end function

public function integer of_cutdiffer_calculation (string as_accountno, string as_coopid) throws Exception;Integer	li_Period, li_DayNumber, li_DaiInYear
DateTime	ldtm_StartIntDate, ldtm_EndIntDate, ldtm_DueDate, ldtm_BuyDate, ldtm_AccDueDate
Dec{7}		ldc_IntRate, ldc_IntYieldRate
Dec{2}		ldc_CashFlowRecv, ldc_CshFlwOfCt, ldc_Balance, ldc_PurchasePrice, ldc_Accuint
Dec{2}		ldc_BalCalInt, ldc_Differ, ldc_IntAmountCoupon, ldc_IntAmountYield

DECLARE c_Duedate CURSOR FOR
  SELECT b.start_calint_date,	b.last_cal_to_date,
              b.int_rate,				b.intyield_rate,
              b.due_date,				a.prncbal,
              a.purchase_price,		a.accuint_amt,
              a.day_inyear,			a.buy_date,
              a.due_date
    FROM pminvestmaster a, pminvestduedate b
  WHERE a.coop_id = b.coop_id
       AND a.account_no = b.account_no
       AND b.coop_id = :as_CoopID
       AND b.account_no = :as_AccountNo
       AND b.last_cal_to_date > a.buy_date
       AND b.periodpayrr = 1
ORDER BY b.due_date ASC
USING itr_SQLCA;

OPEN c_Duedate ;
FETCH c_Duedate INTO :ldtm_StartIntDate, :ldtm_EndIntDate, 
		:ldc_IntRate, :ldc_IntYieldRate, :ldtm_DueDate, :ldc_Balance, :ldc_PurchasePrice, :ldc_Accuint, :li_DaiInYear, :ldtm_BuyDate, :ldtm_AccDueDate  ;

li_Period	= 0

DO WHILE itr_SQLCA.SQLCODE = 0
	li_Period ++
	
	IF IsNull (ldc_PurchasePrice) THEN ldc_PurchasePrice = 0.00
	IF IsNull (ldc_Accuint) THEN ldc_Accuint = 0.00
	IF IsNull (li_DaiInYear) or ( li_DaiInYear = 0 ) THEN li_DaiInYear = 365
	
	IF IsNull (ldc_IntRate) THEN ldc_IntRate = 0.00
	IF IsNull (ldc_IntYieldRate) THEN ldc_IntYieldRate = 0.00
	
	 
	if ( li_Period = 1 ) THEN
		ldc_BalCalInt	= ldc_PurchasePrice - ldc_Accuint
		IF ( Date( ldtm_BuyDate ) > Date( ldtm_StartIntDate ) ) THEN
			ldtm_StartIntDate	= ldtm_BuyDate			
		END IF
	END IF
	
	li_DayNumber		= DaysAfter( Date (ldtm_StartIntDate), Date (ldtm_EndIntDate) )
	
	ldc_IntAmountCoupon		=  ldc_Balance * ( ldc_IntRate / 100 )  * ( li_DayNumber / li_DaiInYear )
	ldc_IntAmountYield		=  ldc_BalCalInt * ( ldc_IntYieldRate / 100 )  * ( li_DayNumber / li_DaiInYear )
	 
	ldc_Differ	= ldc_IntAmountCoupon - ldc_IntAmountYield
	
	// หากเป็น งวดสุดท้าย
	IF ( Date( ldtm_AccDueDate ) = Date( ldtm_EndIntDate ) ) THEN
		ldc_Differ		= ldc_BalCalInt - ldc_Balance
		ldc_BalCalInt	= ldc_Balance
		ldc_IntAmountYield	= ldc_IntAmountCoupon - ldc_Differ
	else
	ldc_BalCalInt		= ldc_BalCalInt - ldc_Differ
	END IF
	// คำนวณ
	UPDATE pminvestduedate
	      SET intcoupon_amount = :ldc_IntAmountCoupon,
			    intyield_amount = :ldc_IntAmountYield,
			    account_balance = :ldc_BalCalInt
      WHERE coop_id = :as_CoopID
          AND account_no = :as_AccountNo
	     AND due_date = :ldtm_DueDate
          AND periodpayrr = 1
       USING itr_SQLCA;

	ldc_IntRate			= 0.00
	ldc_IntYieldRate	= 0.00
	
	FETCH c_Duedate INTO :ldtm_StartIntDate, :ldtm_EndIntDate, 
			:ldc_IntRate, :ldc_IntYieldRate, :ldtm_DueDate, :ldc_Balance , :ldc_PurchasePrice, :ldc_Accuint , :li_DaiInYear, :ldtm_BuyDate, :ldtm_AccDueDate  ;
LOOP

CLOSE c_Duedate ;

COMMIT USING itr_SQLCA;
RETURN SUCCESS
end function

on n_cst_pmservice.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_pmservice.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ithw_Exception		= Create Exception
end event

event destructor;IF IsValid(ithw_Exception) THEN Destroy(ithw_Exception)
end event

