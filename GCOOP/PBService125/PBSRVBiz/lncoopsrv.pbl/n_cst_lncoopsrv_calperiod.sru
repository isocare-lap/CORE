$PBExportHeader$n_cst_lncoopsrv_calperiod.sru
$PBExportComments$lcsrv ส่วนบริการการหายอดชำระ/งวด
forward
global type n_cst_lncoopsrv_calperiod from nonvisualobject
end type
end forward

global type n_cst_lncoopsrv_calperiod from nonvisualobject
end type
global n_cst_lncoopsrv_calperiod n_cst_lncoopsrv_calperiod

type variables
string		is_coopcontrol

integer	ii_estinttype, ii_roundpaytype
long		il_roundpayfactor

transaction		itr_sqlca
Exception		ithw_exception

n_cst_dbconnectservice		inv_transection
n_cst_lncoopsrv_interest		inv_intsrv
end variables

forward prototypes
public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans)
public function integer of_loadconfigdefault ()
public subroutine of_setperiodpayroundattrib (integer ai_roundtype, long al_factor)
public function integer of_getmaxperiodpay (string as_coopid, string as_loantype, decimal adc_prnamt) throws Exception
public function integer of_initinstallment (ref str_lccalperiod astr_lccalperiod) throws Exception
private function integer of_setsrvlcinterest (boolean ab_switch)
private function decimal of_roundpayment (string as_loantype, decimal adc_payment)
public function integer of_calperiodpay (ref str_lccalperiod astr_lccalperiod)
private function integer of_calfixpayinstallment (decimal adc_prncalamt, decimal adc_periodpay, decimal adc_intrate, integer ai_maxinstallment, ref integer ai_installment, ref decimal adc_lastperiodpay)
public function integer of_calinstallment (ref str_lccalperiod astr_lccalperiod) throws Exception
end prototypes

public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans);// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
	inv_transection	= anv_dbtrans
end if

itr_sqlca 			= inv_transection.itr_dbconnection
is_coopcontrol	= inv_transection.is_coopcontrol

return 1
end function

public function integer of_loadconfigdefault ();select		fixpaycal_type
into		:ii_estinttype
from		lccfloanconstant
where	( coop_id		= :is_coopcontrol )
using		itr_sqlca ;

if isnull( ii_estinttype ) then
	ii_estinttype		= 1
end if

return 1
end function

public subroutine of_setperiodpayroundattrib (integer ai_roundtype, long al_factor);ii_roundpaytype	= ai_roundtype
il_roundpayfactor	= al_factor
end subroutine

public function integer of_getmaxperiodpay (string as_coopid, string as_loantype, decimal adc_prnamt) throws Exception;integer		li_maxperiod

select		max_period
into		:li_maxperiod
from		lccfloantypeperiod
where	( branch_id			= :as_coopid ) and
			( loantype_code	= :as_loantype ) and
			( :adc_prnamt between money_from and money_to )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่พบงวดการชำระเงินของเงินกู้ประเภท "+as_loantype+" ยอดเงิน "+string( adc_prnamt )+" กรุณาตรวจสอบ"
	throw ithw_exception
end if

return li_maxperiod
end function

public function integer of_initinstallment (ref str_lccalperiod astr_lccalperiod) throws Exception;string		ls_loantype
integer	li_paytype, li_maxperiod, li_installment
dec		ldc_paypercent, ldc_payfixamt, ldc_prncalamt, ldc_periodpay, ldc_periodlast
dec		ldc_intrate, ldc_interest, ldc_prnpay
dec		ldc_fr = 0

ls_loantype			= astr_lccalperiod.loantype_code
li_paytype			= astr_lccalperiod.loanpayment_type
ldc_paypercent		= astr_lccalperiod.loanpayment_percent
ldc_payfixamt		= astr_lccalperiod.loanpayment_fixamt

li_maxperiod		= astr_lccalperiod.calperiod_maxinstallment
ldc_prncalamt		= astr_lccalperiod.calperiod_prnamt
ldc_intrate			= astr_lccalperiod.calperiod_intrate

if isnull( li_maxperiod ) or li_maxperiod = 0 then
	ithw_exception.text	= "ไม่มีจำนวนงวดที่ต้องส่ง กรุณาตรวจสอบ"
	throw ithw_exception
end if

choose case li_paytype
	case 0	// ไม่มีการเรียกเก็บต้นรายเดือน
		li_installment		= li_maxperiod
		ldc_periodpay		= 0
		ldc_periodlast		= ldc_prncalamt
		
	case 1	// ต้นเท่ากันทุกงวด + ดอก
		ldc_periodpay		= ldc_prncalamt / li_maxperiod
		ldc_periodpay		= this.of_roundpayment( ls_loantype, ldc_periodpay )

		// งวดสุดท้าย
		li_installment		= ceiling( ldc_prncalamt / ldc_periodpay )
		ldc_periodlast		= ldc_prncalamt - ( ldc_periodpay * ( li_installment - 1 ) )

	case 2	// ต้น + ดอกเท่ากันทุกงวด
		
		ldc_intrate		= ldc_intrate / 100

		// คงยอดดอกเบี้ยประมาณการนับวันแบบ 1 เดือนหรือ 30 วัน ( 1=1เดือน, 2=30วัน)
		if ii_estinttype = 1 then
			ldc_fr				= exp( - li_maxperiod * log( ( 1 + ldc_intrate / 12 ) ) )
			ldc_periodpay	= ldc_prncalamt * ( ldc_intrate / 12 ) / ( 1 - ldc_fr )
		else
			ldc_fr				= exp( - li_maxperiod * log( ( 1 + ldc_intrate * ( 30/365 ) ) ) )
			ldc_periodpay	= ldc_prncalamt * ( ldc_intrate * ( 30/365 ) ) / ( 1 - ldc_fr )
		end if
		
		ldc_periodpay		= this.of_roundpayment( ls_loantype, ldc_periodpay )
		
		// ส่งไปคำนวณย้อนกลับหางวดอีกรอบ
		this.of_calfixpayinstallment( ldc_prncalamt, ldc_periodpay, ldc_intrate, li_maxperiod, li_installment, ldc_periodlast )
		
	case 3	// ตาม % ที่ระบุแต่ไม่น้อยกว่ายอดชำระ/งวด
		
		ldc_periodpay		= ldc_prncalamt * ( ldc_paypercent / 100 )
		ldc_periodpay		= this.of_roundpayment( ls_loantype, ldc_periodpay )
		
		if ldc_periodpay < ldc_payfixamt then
			ldc_periodpay	= ldc_payfixamt
		end if

		// งวดสุดท้าย
		li_installment		= ceiling( ldc_prncalamt / ldc_periodpay )
		if li_installment > li_maxperiod then
			li_installment	= li_maxperiod
		end if
		
		ldc_periodlast		= ldc_prncalamt - ( ldc_periodpay * ( li_installment - 1 ) )
	case 4	// ตาม % ที่ระบุแต่ไม่มากกว่ายอดชำระ/งวด
		ldc_periodpay		= ldc_prncalamt * ( ldc_paypercent / 100 )
		ldc_periodpay		= this.of_roundpayment( ls_loantype, ldc_periodpay )
		
		if ldc_periodpay > ldc_payfixamt then
			ldc_periodpay	= ldc_payfixamt
		end if

		// งวดสุดท้าย
		li_installment		= ceiling( ldc_prncalamt / ldc_periodpay )
		if li_installment > li_maxperiod then
			li_installment	= li_maxperiod
		end if
		
		ldc_periodlast		= ldc_prncalamt - ( ldc_periodpay * ( li_installment - 1 ) )
end choose

astr_lccalperiod.period_installment		= li_installment
astr_lccalperiod.period_payment			= ldc_periodpay
astr_lccalperiod.period_lastpayment		= ldc_periodlast

return 1
end function

private function integer of_setsrvlcinterest (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_intsrv ) or not isvalid( inv_intsrv ) then
		inv_intsrv	= create n_cst_lncoopsrv_interest
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

private function decimal of_roundpayment (string as_loantype, decimal adc_payment);integer	li_roundtype
long		ll_roundfactor
dec		ldc_mod

select		payround_type, payround_factor
into		:li_roundtype, :ll_roundfactor
from		lccfloantype
where	( coop_id		= :is_coopcontrol ) and
			( loantype_code	= :as_loantype )
using		itr_sqlca ;

// ถ้าไม่มีการปรับค่าออกได้เลย
if li_roundtype = 0 or ll_roundfactor = 0 then
	return adc_payment
end if

// หาเศษเพื่อทำการปรับค่า
ldc_mod	= mod( adc_payment, ll_roundfactor )

// ถ้าค่าก่อนปรับเท่ากับค่าหลังปรับก็คืนค่าได้เลย
if ldc_mod = 0 and adc_payment > ll_roundfactor then
	return adc_payment
end if

// ทำการปรับค่า
adc_payment 	= adc_payment - ldc_mod

if li_roundtype = 1 then
	adc_payment	= adc_payment + ll_roundfactor
end if

return adc_payment
end function

public function integer of_calperiodpay (ref str_lccalperiod astr_lccalperiod);//--------------------------
// หาจำนวน เงินที่ต้องชำระต่องวด
//--------------------------
string		ls_loantype
integer	li_paytype, li_maxperiod, li_installment, li_insttemp
dec		ldc_paypercent, ldc_payfixamt, ldc_prncalamt, ldc_intrate
dec		ldc_periodpay, ldc_periodlast, ldc_fr
dec		ldc_fixperc, ldc_fixamt

ls_loantype			= astr_lccalperiod.loantype_code
li_paytype			= astr_lccalperiod.loanpayment_type
ldc_paypercent		= astr_lccalperiod.loanpayment_percent
ldc_payfixamt		= astr_lccalperiod.loanpayment_fixamt

li_maxperiod		= astr_lccalperiod.calperiod_maxinstallment
ldc_prncalamt		= astr_lccalperiod.calperiod_prnamt
ldc_intrate			= astr_lccalperiod.calperiod_intrate
li_installment		= astr_lccalperiod.period_installment

if ldc_prncalamt = 0 then
	return 0
end if

choose case li_paytype
	case 0	// ไม่มีการเรียกเก็บต้นรายเดือน
		li_installment		= li_installment
		ldc_periodpay		= 0
		ldc_periodlast		= ldc_prncalamt
		
	case 1	// ต้นเท่ากันทุกงวด + ดอก
		ldc_periodpay		= ldc_prncalamt / li_installment
		ldc_periodpay		= this.of_roundpayment( ls_loantype, ldc_periodpay )

		// งวดสุดท้าย
		ldc_periodlast		= ldc_prncalamt - ( ldc_periodpay * ( li_installment - 1 ) )

	case 2	// ต้น + ดอกเท่ากันทุกงวด
		
		ldc_intrate		= ldc_intrate / 100

		// คงยอดดอกเบี้ยประมาณการนับวันแบบ 1 เดือนหรือ 30 วัน ( 1=1เดือน, 2=30วัน)
		if ii_estinttype = 1 then
			ldc_fr				= exp( - li_installment * log( ( 1 + ldc_intrate / 12 ) ) )
			ldc_periodpay	= ldc_prncalamt * ( ldc_intrate / 12 ) / ( 1 - ldc_fr )
		else
			ldc_fr				= exp( - li_installment * log( ( 1 + ldc_intrate * ( 30/365 ) ) ) )
			ldc_periodpay	= ldc_prncalamt * ( ldc_intrate * ( 30/365 ) ) / ( 1 - ldc_fr )
		end if
		
		ldc_periodpay		= this.of_roundpayment( ls_loantype, ldc_periodpay )
		
		// ส่งไปคำนวณย้อนกลับหางวดอีกรอบ
		this.of_calfixpayinstallment( ldc_prncalamt, ldc_periodpay, ldc_intrate, li_installment, li_installment, ldc_periodlast )
		
	case 3	// ตาม % ที่ระบุแต่ไม่น้อยกว่ายอดชำระ/งวด
		// หาขั้นต่ำก่อน
		ldc_fixamt			= ldc_prncalamt * ( ldc_paypercent / 100 )
		
		if ldc_fixamt < ldc_payfixamt then
			ldc_fixamt	= ldc_payfixamt
		else
			ldc_fixamt	= this.of_roundpayment( ls_loantype, ldc_fixamt )
		end if
		
		// ชำระ/งวด
		ldc_periodpay		= ldc_prncalamt / li_installment
		ldc_periodpay		= this.of_roundpayment( ls_loantype, ldc_periodpay )

		// ถ้าชำระต่องวดน้อยกว่าขั้นต่ำ
		if ldc_periodpay < ldc_fixamt then
			ldc_periodpay	= ldc_fixamt
		end if

		li_insttemp			= ceiling( ldc_prncalamt / ldc_periodpay )
		if li_insttemp < li_installment then
			li_installment	= li_insttemp
		end if
		
		// งวดสุดท้าย
		ldc_periodlast		= ldc_prncalamt - ( ldc_periodpay * ( li_installment - 1 ) )
	case 4	// ตาม % ที่ระบุแต่ไม่มากกว่ายอดชำระ/งวด
		// หายอดสูงสุดก่อน
		ldc_fixamt			= ldc_prncalamt * ( ldc_paypercent / 100 )
		
		if ldc_fixamt > ldc_payfixamt then
			ldc_fixamt	= ldc_payfixamt
		else
			ldc_fixamt	= this.of_roundpayment( ls_loantype, ldc_fixamt )
		end if
		
		// ชำระ/งวด
		ldc_periodpay		= ldc_prncalamt / li_installment
		ldc_periodpay		= this.of_roundpayment( ls_loantype, ldc_periodpay )
		
		// ถ้าชำระต่องวดมากกว่ายอดสูงสุด
		if ldc_periodpay > ldc_fixamt then
			ldc_periodpay	= ldc_fixamt
		end if

		// งวดสุดท้าย
		ldc_periodlast		= ldc_prncalamt - ( ldc_periodpay * ( li_installment - 1 ) )
end choose

astr_lccalperiod.period_installment		= li_installment
astr_lccalperiod.period_payment			= ldc_periodpay
astr_lccalperiod.period_lastpayment		= ldc_periodlast

return 1
end function

private function integer of_calfixpayinstallment (decimal adc_prncalamt, decimal adc_periodpay, decimal adc_intrate, integer ai_maxinstallment, ref integer ai_installment, ref decimal adc_lastperiodpay);dec		ldc_interest, ldc_prnpay

ai_installment		= 0
adc_lastperiodpay	= 0

do while adc_prncalamt > 0
	
	if ii_estinttype = 1 then
		ldc_interest	= ( adc_prncalamt / 12 ) * adc_intrate
	else
		ldc_interest	= ( adc_prncalamt * 30 / 365 ) * adc_intrate
	end if
	
	ldc_interest	= round( ldc_interest, 2 )
	
	ldc_prnpay	= ( adc_periodpay - ldc_interest )
	
	// ตรวจสอบว่ามากกว่ายอดคงเหลือหรือเปล่า
	if ldc_prnpay > adc_prncalamt then
		ldc_prnpay	= adc_prncalamt
	end if
	
	adc_prncalamt	= adc_prncalamt - ldc_prnpay
	
	ai_installment++
	
	if ai_installment < ai_maxinstallment then
		continue
	end if

	//เอาเศษที่เกินมาไปเพิ่มไว้งวดสุดท้าย
	adc_lastperiodpay	= ldc_prnpay + ldc_interest + adc_prncalamt
loop

return 1

end function

public function integer of_calinstallment (ref str_lccalperiod astr_lccalperiod) throws Exception;//--------------------------
// หาจำนวน งวดที่ต้องผ่อนชำระ โดยที่ต้องไม่เกินงวดสูงสุดที่ส่งเข้ามา
// ถ้าหารออกมาแล้วเกินงวดสูงสุด จะปัดไปชำระงวดสุดท้ายทั้งหมด
// ถ้าเป็นประเภท 4 จะมองเหมือนประเภท 1 เพราะว่าถ้าอยากชำระมากกว่าที่ระบุก็ได้
//--------------------------

string		ls_loantype
integer	li_paytype, li_maxperiod, li_installment
dec		ldc_prncalamt, ldc_intrate, ldc_periodpay, ldc_periodlast
dec		ldc_paypercent, ldc_payfixamt, ldc_fixamt

ls_loantype			= astr_lccalperiod.loantype_code
li_paytype			= astr_lccalperiod.loanpayment_type
ldc_paypercent		= astr_lccalperiod.loanpayment_percent
ldc_payfixamt		= astr_lccalperiod.loanpayment_fixamt

li_maxperiod		= astr_lccalperiod.calperiod_maxinstallment
ldc_prncalamt		= astr_lccalperiod.calperiod_prnamt
ldc_intrate			= astr_lccalperiod.calperiod_intrate
ldc_periodpay		= astr_lccalperiod.period_payment

if ldc_prncalamt = 0 then
	return 0
end if

choose case li_paytype
	case 0	// ไม่มีการเรียกเก็บต้นรายเดือน
		li_installment		= li_maxperiod
		ldc_periodlast		= ldc_prncalamt
		
	case 1, 4	// ต้นเท่ากันทุกงวด + ดอก
		li_installment		= ceiling( ( ldc_prncalamt / ldc_periodpay ) )
		
		if li_installment > li_maxperiod then
			li_installment = li_maxperiod
		end if
		
		// งวดสุดท้าย
		ldc_periodlast		= ldc_prncalamt - ( ldc_periodpay * ( li_installment - 1 ) )

	case 2	// ต้น + ดอกเท่ากันทุกงวด
		
		ldc_intrate		= ldc_intrate / 100

		// ส่งไปคำนวณย้อนกลับหางวดอีกรอบ
		this.of_calfixpayinstallment( ldc_prncalamt, ldc_periodpay, ldc_intrate, li_maxperiod, li_installment, ldc_periodlast )

	case 3	// ตาม % ที่ระบุแต่ไม่น้อยกว่ายอดชำระ/งวด
		// หาขั้นต่ำก่อน
		ldc_fixamt			= ldc_prncalamt * ( ldc_paypercent / 100 )
		
		if ldc_fixamt < ldc_payfixamt then
			ldc_fixamt	= ldc_payfixamt
		else
			ldc_fixamt	= this.of_roundpayment( ls_loantype, ldc_fixamt )
		end if
		
		// ถ้าชำระต่องวดน้อยกว่าขั้นต่ำ
		if ldc_periodpay < ldc_fixamt then
			ithw_exception.text	= "ยอดชำระ/งวดน้อยกว่าขั้นต่ำที่ระบุ กรุณาตรวจสอบ"
			throw ithw_exception
		end if

		// คำนวณจำนวนงวดใหม่
		li_installment		= ceiling( ldc_prncalamt / ldc_periodpay )
		if li_installment > li_maxperiod then
			li_installment	= li_maxperiod
		end if
		
		ldc_periodlast		= ldc_prncalamt - ( ldc_periodpay * ( li_installment - 1 ) )
		
end choose

astr_lccalperiod.period_installment		= li_installment
astr_lccalperiod.period_payment			= ldc_periodpay
astr_lccalperiod.period_lastpayment		= ldc_periodlast

return 1
end function

on n_cst_lncoopsrv_calperiod.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_lncoopsrv_calperiod.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;// ประกาศ Throw สำหรับ Err
ithw_exception	= create Exception
end event

event destructor;// ล้าง object
if isvalid( ithw_exception ) then destroy ithw_exception
end event

