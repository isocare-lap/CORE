$PBExportHeader$n_cst_loan_short_long.sru
forward
global type n_cst_loan_short_long from nonvisualobject
end type
end forward

global type n_cst_loan_short_long from nonvisualobject
end type
global n_cst_loan_short_long n_cst_loan_short_long

type variables
transaction			itr_sqlca
Exception			ithw_exception
n_cst_progresscontrol		inv_progress
n_cst_dbconnectservice		inv_connection
n_cst_loansrv_interest		inv_intsrv

datastore	ids_loandata, ids_contintspc, ids_inttable
end variables

forward prototypes
public function integer of_daysinyear (integer ai_year) throws Exception
public function integer of_proclnshortlong (integer ai_accyear, datetime adtm_accstart, datetime adtm_accend) throws Exception
public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans) throws Exception
public function integer of_setprogress (ref n_cst_progresscontrol anv_progress) throws Exception
public function integer of_monthafter (date ad_start, date ad_end)
end prototypes

public function integer of_daysinyear (integer ai_year) throws Exception;/***********************************************************
<description>
	หาจำนวนวันในปีที่ระบุ
</description>

<arguments>
	ai_year			integer	ปี
</arguments> 

<return> 
	Integer	365 หรือ 366
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

if isdate( string( ai_year) +"/02/29" ) then
	return 366
else
	return 365
end if
end function

public function integer of_proclnshortlong (integer ai_accyear, datetime adtm_accstart, datetime adtm_accend) throws Exception;/***********************************************************
<description>
	คำนวณลูกหนี้ระยะสั้น ระยะยาว
</description>

<arguments>
	ai_accyear			Integer		ปีงบประมาณถัดไป
  	adtm_accstart  		Datetime		วันเริ่มปีบัญชี
	adtm_accend		Datetime		วันสิ้นปีบัญชี
</arguments> 

<return> 
	Integer		1 = success, -1 = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
string		ls_contno, ls_memno, ls_lookinttype, ls_memgroup, ls_loantype
integer		li_allperiod, li_continttype, li_loanpaytype, li_month, li_daysinyear
long		ll_index, ll_count, ll_intcount, ll_find
dec{2}		ldc_approveamt, ldc_prinbalamt, ldc_periodpay, ldc_lnshortamt, ldc_lnlongamt, ldc_temp
dec{2}		ldc_tempint, ldc_periodprin, ldc_tempbal, ldc_periodpaymax
dec{4}		ldc_contintrate
date		ld_tempstart, ld_tempend
datastore	lds_contdata, lds_intrate
n_cst_datetimeservice		lnv_datetime

// สร้าง Progress สำหรับแสดงสถานะการประมวลผล
inv_progress.istr_progress.progress_text = "จัดทำลูกหนี้ระยะสั้นระยะยาว"
inv_progress.istr_progress.subprogress_text	= "ลบข้อมูลเก่าลูกหนี้ระยะสั้นระยะยาว ปี "+string( ai_accyear )

delete from	lnestloanshortlong
where ( acc_year	= :ai_accyear ) using itr_sqlca ;

inv_progress.istr_progress.subprogress_text	= "กำลังดึงข้อมูลลูกหนี้"

// ข้อมูลอัตราดอกเบี้ย
lds_intrate = create datastore
lds_intrate.dataobject	= "d_sl_shortloan_info_intrate"
lds_intrate.settransobject( itr_sqlca )
ll_intcount = lds_intrate.retrieve()

// ข้อมูลสัญญาที่จะทำหนี้สั้น-ยาว
lds_contdata = create datastore
lds_contdata.dataobject	= "d_sl_shortloan_info_contract"
lds_contdata.settransobject( itr_sqlca )
ll_count = lds_contdata.retrieve()

li_month = this.of_monthafter( date( adtm_accstart ), date( adtm_accend ) )
li_daysinyear = this.of_daysinyear( ai_accyear - 543 )
ld_tempend	= date( adtm_accend )

inv_progress.istr_progress.subprogress_text	= "จัดทำลูกหนี้ระยะสั้นระยะยาว"
inv_progress.istr_progress.subprogress_max = ll_count

for ll_index = 1 to ll_count
	yield()
	if inv_progress.of_is_stop() then
		destroy lds_contdata
		destroy lds_intrate
		return -1
	end if
	
	ls_contno			= lds_contdata.object.loancontract_no[ ll_index ]
	ls_memno			= lds_contdata.object.member_no[ ll_index ]
	ls_memgroup		= lds_contdata.object.membgroup_code[ ll_index ]
	ls_loantype			= lds_contdata.object.loantype_code[ ll_index ]
	ls_lookinttype		= lds_contdata.object.continttable_code[ ll_index ]
	li_loanpaytype		= lds_contdata.object.loanpayment_type[ ll_index ]
	li_allperiod			= lds_contdata.object.period_payamt[ ll_index ]
	li_continttype		= lds_contdata.object.contractint_type[ ll_index ]
	ldc_approveamt	= lds_contdata.object.loanapprove_amt[ ll_index ]
	ldc_prinbalamt		= lds_contdata.object.principal_balance[ ll_index ]
	ldc_periodpay		= lds_contdata.object.period_payment[ ll_index ]
	ldc_periodpaymax	= lds_contdata.object.period_payment_max[ ll_index ]
	
	if ( ldc_periodpaymax > 0 ) then
		ldc_periodpay = ldc_periodpaymax
	end if
	
	ldc_lnshortamt		= 0
	ldc_lnlongamt		= 0
	
	choose case li_loanpaytype
		case 1	// คงต้น
			ldc_temp			= ldc_periodpay * li_month
			
			if ldc_prinbalamt <= ldc_temp then
				// ถ้าหมดภายใน 1 ปี เป็นระยะสั้น
				ldc_lnshortamt		= ldc_prinbalamt
				ldc_lnlongamt		= 0
			else
				// ถ้าไม่หมดภายใน 1 ปี มีระยะยาวด้วย
				ldc_lnshortamt		= ldc_temp
				ldc_lnlongamt		= ldc_prinbalamt - ldc_temp
			end if
		case 2	// คงยอด
			choose case li_continttype
				case 0 // ไม่คิดดอกเบี้ย
						ldc_contintrate = 0
						
				case 1 // คงที่ตลอด
						ldc_contintrate	= lds_contdata.object.contract_interest[ ll_index ]
						
				case 2 // ตามประกาศ
						ll_find	= lds_intrate.find( "loantype_code = '"+ls_lookinttype+"' ", 1, ll_intcount )
						if ( ll_find <= 0 ) then
							
							ithw_exception.text += "ไม่พบอัตราดอกเบี้ย สัญญา #"+ls_contno
							destroy lds_intrate
							destroy lds_contdata
							
							return -1
						end if
						ldc_contintrate		= lds_intrate.getitemdecimal( ll_find, "interest_rate" )

				case 3 // อัตราดอกเบี้ย rate พิเศษ ยังไม่มีพี่โอ้จะทำให้
						ldc_contintrate	 = lds_contdata.object.contract_interest[ ll_index ]
						
			end choose
			
			ld_tempstart = date( adtm_accstart )
			ldc_tempbal	= ldc_prinbalamt
			
			do while ( ld_tempstart < ld_tempend ) and ( ldc_tempbal > 0 )
				ld_tempstart	= lnv_datetime.of_lastdayofmonth( ld_tempstart )
				ld_tempstart	= relativedate( ld_tempstart, 1 )
				
				ldc_tempint	= ( ( ldc_tempbal * ldc_contintrate ) * 30 ) / li_daysinyear
				
				ldc_periodprin	= ldc_periodpay - ldc_tempint
				if ( ldc_periodprin < 0 ) then ldc_periodprin = 0
				
				if ldc_periodprin > ldc_tempbal then
					ldc_periodprin	= ldc_tempbal
				end if
				
				ldc_lnshortamt	+= ldc_periodprin
				
				ldc_tempbal	-= ldc_periodprin
			loop
			
			ldc_lnlongamt	= ldc_tempbal
			
	end choose
	
	insert into lnestloanshortlong
				( acc_year, member_no, loancontract_no, membgroup_code, loantype_code, period_payamt, period_payment, loanapprove_amt, principal_balance, loanshort_amt, loanlong_amt )
	values	( :ai_accyear, :ls_memno, :ls_contno, :ls_memgroup, :ls_loantype, :li_allperiod, :ldc_periodpay, :ldc_approveamt, :ldc_prinbalamt, :ldc_lnshortamt, :ldc_lnlongamt ) using itr_sqlca;

	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text += "บันทึกรายการหนี้ระยะสั้นระยะยาวของ เลขสมาชิก #"+ls_memno+" สัญญา #"+ls_contno+itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	inv_progress.istr_progress.subprogress_index = ll_index
	inv_progress.istr_progress.subprogress_text = string( ll_index )+". เลขสมาชิก "+ls_memno+"  สัญญา "+ls_contno+" ระยะสั้น "+string( ldc_lnshortamt, "#,##0.00" )+"  ระยะยาว "+string( ldc_lnlongamt, "#,##0.00" )
next

destroy lds_contdata
destroy lds_intrate

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

inv_progress = create n_cst_progresscontrol

return 1
end function

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

public function integer of_monthafter (date ad_start, date ad_end);/***********************************************************
<description>
	หาเดือนหลังจากวันที่ ที่ระบุ
</description>

<arguments>
	ad_start		Date	 วันที่เริ่ม
  	ad_end		Date	 วันที่สิ้นสุด

</arguments> 

<return> 
	Integer		1 = success, -1 = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

date 		ld_temp
integer 		li_month
integer		li_mult

//Check parameters
If IsNull(ad_start) or IsNull(ad_end) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

If ad_start > ad_end Then
	ld_temp = ad_start
	ad_start = ad_end
	ad_end = ld_temp
	li_mult = -1
else
	li_mult = 1
End If

li_month = (year(ad_end) - year(ad_start) ) * 12
li_month = li_month + month(ad_end) - month(ad_start)

// ต้องบวก 1 เสมอเพราะต้องนับเดือนทั้งหน้าทั้งหลัง
li_month = li_month + 1

Return li_month * li_mult
end function

on n_cst_loan_short_long.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_loan_short_long.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ithw_exception = create Exception
end event

event destructor;if isvalid( ithw_exception ) then destroy ithw_exception
if isvalid( itr_sqlca ) then destroy itr_sqlca
if isvalid( inv_connection ) then destroy inv_connection

end event

