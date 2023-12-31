$PBExportHeader$n_cst_loansrv_interest.sru
forward
global type n_cst_loansrv_interest from NonVisualObject
end type
end forward

global type n_cst_loansrv_interest from NonVisualObject
end type
global n_cst_loansrv_interest n_cst_loansrv_interest

type variables
protected:
n_ds	ids_inttable
n_ds	ids_contintinfo
n_ds	ids_roundfactor
n_ds	ids_contintspc

string		is_rdsatangtab, is_errmsg
string		is_coopcontrol
integer	ii_rdsatangtype
integer	ii_rdintdectype, ii_rdintdecdigit
integer	ii_intdateviewtype, ii_daysinyear
dec{4}	idc_intincrease = 0.0000
dec		idc_intmthtimeinc	= 0

transaction		itr_sqlca
Exception		ithw_exception

constant integer	success = 1
constant integer	failure = -1
end variables

forward prototypes
public function integer of_setintincrease (decimal adc_intincrease)
public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans)
public function integer of_setcalintattribdefault ()
public function integer of_setrdattribdefault ()
public function decimal of_roundmoney (decimal adc_money)
public function decimal of_roundinterest (decimal adc_intamt, integer ai_rdintdectype)
public function integer of_daysinyear (integer ai_year)
public function integer of_setrddecformat (integer ai_rddecformat)
public function integer of_setrdsatangtab (string as_rdsatangtab)
public function integer of_setrdsatangtype (integer ai_rdsatangtype)
public function integer of_setcalintdateviewtype (integer ai_dayviewtype)
public function integer of_setcalintdayinyear (integer ai_dayinyear)
public function decimal of_calculateinterest (decimal adc_intrate, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal)
public function integer of_getrddecformat ()
public function string of_getrdsatangtab ()
public function integer of_getrdsatangtype ()
public function integer of_setrddecdigit (integer ai_rddecdigit)
public function integer of_getrddecdigit ()
public function decimal of_roundinterest (decimal adc_intamt, integer ai_rdintdectype, integer ai_rdintdecdigit)
public function decimal of_computeinterestx (string as_xmlcontmast, string as_xmlcontintspc, decimal adc_prncalint, datetime adtm_calintfrom, datetime adtm_calintto)
public function string of_getcontintratedetail (string as_coopid, string as_contno, datetime adtm_contintto) throws Exception
public function decimal of_computeinterest (decimal adc_intrate, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal)
public function decimal of_calculateinterest (n_ds ads_inttable, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception
public function decimal of_calculateinterest (n_ds ads_inttable, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal, decimal adc_apvamt) throws Exception
public function decimal of_getloantypeintrate (string as_coopid, string as_loantype, datetime adtm_intdate, decimal adc_money) throws Exception
public function decimal of_getloanintrate (string as_coopid, string as_inttabcode, datetime adtm_intdate, decimal adc_money) throws Exception
public function decimal of_getloanintrate (string as_coopid, string as_inttabcode, datetime adtm_intdate) throws Exception
public function integer of_getinteresttable (string as_coopid, string as_inttabcode, datetime adtm_enddate, ref n_ds ads_inttable)
public function decimal of_computeinterest (string as_coopid, string as_inttabcode, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal)
public function decimal of_computeinterest (string as_coopid, string as_inttabcode, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal, decimal adc_apvamt)
private function integer of_monthsafter (date ad_start, date ad_end)
public function decimal of_computeintmonthx (string as_coopid, string as_xmlcontmast, string as_xmlintspc, decimal adc_principal, datetime adtm_calintfrom, datetime adtm_calintto) throws Exception
public function integer of_computeinterest (str_calinterest astr_calintcri, datetime adtm_calintfrom, datetime adtm_calintto, ref decimal adc_intperiod) throws Exception
public function decimal of_computeinterest (string as_coopid, string as_contno, decimal adc_prncalint, datetime adtm_calintfrom, datetime adtm_calintto) throws Exception
public function decimal of_computeinterest (string as_coopid, string as_contno, datetime adtm_calintto) throws Exception
public function decimal of_computeintmonth (string as_coopid, string as_loantype, decimal adc_fixrate, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception
public function decimal of_computeintmonth (string as_coopid, string as_loantype, string as_inttabcode, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception
public function decimal of_calculateintmonth (string as_coopid, string as_loantype, decimal adc_fixrate, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception
public function decimal of_calculateintmonth (string as_coopid, string as_loantype, n_ds ads_inttable, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception
private function decimal of_monthcount (string as_coopid, string as_loantype, datetime adtm_startdate, datetime adtm_enddate)
public function integer of_setintmthtimeincrease (decimal adc_inttimeincrease)
public function decimal of_computeinterest (n_ds ads_contract, n_ds ads_inttable, datetime adtm_calintto, long al_row) throws Exception
protected function decimal of_computeintdept (n_ds ads_continfo, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal, long al_row)
public function decimal of_roundinterest (decimal adc_intamt)
end prototypes

public function integer of_setintincrease (decimal adc_intincrease);if isnull( adc_intincrease ) then
	adc_intincrease	= 0
end if

idc_intincrease		= adc_intincrease

return 1
end function

public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans);itr_sqlca 			= atr_dbtrans.itr_dbconnection
is_coopcontrol	= atr_dbtrans.is_coopcontrol

// initial loan interest rate
ids_inttable = create n_ds
ids_inttable.dataobject = "d_loansrv_attrib_cfintereststep"
ids_inttable.settransobject( itr_sqlca )
ids_inttable.retrieve( is_coopcontrol )

// initial round factor
ids_roundfactor = create n_ds
ids_roundfactor.dataobject = "d_loansrv_attrib_cfroundingfactor"
ids_roundfactor.settransobject( itr_sqlca )
 ids_roundfactor.retrieve( is_coopcontrol )

// initial contint info
ids_contintinfo = create n_ds
ids_contintinfo.dataobject = "d_loansrv_info_contract"
ids_contintinfo.settransobject( itr_sqlca )

// initial contintspc info
ids_contintspc = create n_ds
ids_contintspc.dataobject = "d_loansrv_info_contintspc"
ids_contintspc.settransobject( itr_sqlca )

// set ค่าที่เกี่ยวข้องกับการปัดเศษให้เป็นไปตามที่กำหนดใน constant
this.of_setrdattribdefault()

// set ค่าที่เกี่ยวข้องกับการคำนวณดอกเบี้ยให้เป็นไปตาม constant
this.of_setcalintattribdefault()

// set อัตราเพิ่มลดดอกเบี้ยให้เป็น 0
this.of_setintincrease( 0 )

return 1
end function

public function integer of_setcalintattribdefault ();select		intdateview_type, dayinyear
into		:ii_intdateviewtype, :ii_daysinyear
from		lnloanconstant
where	( coop_id		= :is_coopcontrol )
using		itr_sqlca ;

if isnull( ii_intdateviewtype ) then
	ii_intdateviewtype	= 1
end if

if isnull( ii_daysinyear ) then
	ii_daysinyear		= 0
end if

return 1
end function

public function integer of_setrdattribdefault ();string		ls_debugmsg

select		rdintsatang_type, rdintsatang_tabcode, rdintdec_type, rdintdec_digit
into		:ii_rdsatangtype, :is_rdsatangtab, :ii_rdintdectype, :ii_rdintdecdigit
from		lnloanconstant
where	( coop_id		= :is_coopcontrol )
using		itr_sqlca ;

// การปัดเศษสตางค์ ไม่ปัด 0/ ปัดรูปแบบต่างๆ > 0
if isnull( ii_rdsatangtype ) then
	ii_rdsatangtype		= 0
end if

// รูปแบบทศนิยมตามหลักที่กำหนด
if isnull( ii_rdintdectype ) then
	ii_rdintdectype		= 0
end if

// จำนวนหลักทศนิยมที่ใช้
if isnull( ii_rdintdecdigit ) then
	ii_rdintdecdigit		= 2
end if

// ตารางการปัดสตางค์
if ii_rdsatangtype = 99 and ( is_rdsatangtab = "" or isnull( is_rdsatangtab ) ) then
	ii_rdsatangtype		= 0
end if

return 1
end function

public function decimal of_roundmoney (decimal adc_money);integer		li_find
dec{2}		ldc_integer, ldc_rdamt, ldc_facvalue, ldc_point1, ldc_point2

// กรณีไม่ปัด ตัดให้เหลือ 2 หลักแล้วออก
if ii_rdsatangtype = 0 or isnull( ii_rdsatangtype ) then
	adc_money		= truncate( adc_money, 2 )
	return adc_money
end if

adc_money		= round( adc_money, 2 )

ldc_integer		= truncate( adc_money, 0 )
ldc_facvalue		= adc_money - ldc_integer

ldc_point1		= truncate( ldc_facvalue, 1 )
ldc_point2		= ldc_facvalue - ldc_point1

choose case ii_rdsatangtype
	case 1	// ปัดทีละสลึง
		
		choose case ldc_facvalue
			case 0.01 to 0.25
				ldc_rdamt	= 0.25
			case 0.26 to 0.50
				ldc_rdamt	= 0.50
			case 0.51 to 0.75
				ldc_rdamt	= 0.75
			case 0.76 to 0.99
				ldc_rdamt	= 1
			case else
				ldc_rdamt	= 0
		end choose
		
	case 2	// ปัดทีละ 5 สตางค์
		
		choose case ldc_point2
			case 0.00, 0.05
				return adc_money
				
			case 0.01 to 0.04
				ldc_point2	= 0.05
			case 0.06 to 0.09
				ldc_point2	= 0.1
		end choose
		
		ldc_rdamt	= ldc_point1 + ldc_point2
		
	case 3	// ปัดทีละ 10 สตางค์
		if ldc_point2 = 0.00 then
			return adc_money
		else
			ldc_point2		= 0.1
		end if
		
		ldc_rdamt	= ldc_point1 + ldc_point2
  case 4	// ปัดเต็ม 1 บาท
		if ldc_facvalue > 0.49 then
			ldc_rdamt	= 1
		else
			ldc_rdamt	= 0
		end if
	
	case 99	// ปัดตามตารางการปัด
		li_find	= ids_roundfactor.find( "factor_code = '"+is_rdsatangtab+"' and factor_step >= "+string( ldc_facvalue, "0.00" ), 1, ids_roundfactor.rowcount() )
		if li_find <= 0 then
			return adc_money
		end if
		
		ldc_rdamt	= ids_roundfactor.getitemdecimal( li_find, "round_amt" )
	case else
		ldc_rdamt	= ldc_facvalue
end choose

ldc_integer	= ldc_integer + ldc_rdamt

return ldc_integer
end function

public function decimal of_roundinterest (decimal adc_intamt, integer ai_rdintdectype);return this.of_roundinterest( adc_intamt, ai_rdintdectype, ii_rdintdecdigit )
end function

public function integer of_daysinyear (integer ai_year);if isdate( string( ai_year) +"/02/29" ) then
	return 366
else
	return 365
end if
end function

public function integer of_setrddecformat (integer ai_rddecformat);ii_rdintdectype			= ai_rddecformat

return 1
end function

public function integer of_setrdsatangtab (string as_rdsatangtab);is_rdsatangtab			= trim( as_rdsatangtab )

return 1
end function

public function integer of_setrdsatangtype (integer ai_rdsatangtype);ii_rdsatangtype 		= ai_rdsatangtype

return 1
end function

public function integer of_setcalintdateviewtype (integer ai_dayviewtype);ii_intdateviewtype	= ai_dayviewtype

return 1
end function

public function integer of_setcalintdayinyear (integer ai_dayinyear);ii_daysinyear		= ai_dayinyear

return 1
end function

public function decimal of_calculateinterest (decimal adc_intrate, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal);string ls_debugmsg, ls_round
integer li_daysinyear, li_dayinterest
dec ldc_inttemp, ldc_interestamt, ldc_tpintrate
datetime ldtm_calintfrom, ldtm_calintto

// ตรวจสอบว่าวันที่ส่งเข้ามาถูกต้องหรือไม่
if date(adtm_calintto) < date(adtm_calintfrom) then return 0.00

// ตรวจสอบยอดเงินที่ส่งเข้ามา
if adc_principal = 0 then return 0.00

ldtm_calintfrom = adtm_calintfrom
ldc_interestamt = 0.00

// mike รองรับการเชื่อมระบบ cen กับ core
if is_coopcontrol = '006001' then
	ldc_tpintrate = (adc_intrate + idc_intincrease)
else
	ldc_tpintrate = (adc_intrate + idc_intincrease) / 100
end if

do while date(ldtm_calintto) < date(adtm_calintto)
		
	ldtm_calintto = adtm_calintto
	
	// ตรวจสอบการคิด ด/บ ข้ามปี
	if ii_daysinyear > 0 then
		li_daysinyear = ii_daysinyear
	else
		integer li_yearfrom, li_yearend
			
		li_yearfrom = year(date(ldtm_calintfrom))
		li_yearend = year(date(ldtm_calintto))
	
		// ตรวจสอบว่าวันที่คิด ด/บ คาบเกี่ยวระหว่างปีหรือเปล่า
		if li_yearend - li_yearfrom > 0 then
			ldtm_calintto = datetime(date(li_yearfrom + 1, 1, 1))
		end if
		li_daysinyear = this.of_daysinyear(year(date(ldtm_calintfrom)))
	end if
	
	// เริ่มคำนวณ ด/บ
	ldc_inttemp = 0.00
				
	// นับจำนวนวันสำหรับคำนวณ ด/บ
	li_dayinterest = daysafter(date(ldtm_calintfrom), date(ldtm_calintto))
					
	// คิดดอกเบี้ยพักใส่ตัวแปร
	ldc_inttemp = adc_principal * ldc_tpintrate * li_dayinterest / li_daysinyear
	
	if is_coopcontrol = "010001" then
		ldc_inttemp = truncate(ldc_inttemp, 3)
		ldc_inttemp = round(ldc_inttemp, 2)
	end if

	ldtm_calintfrom = ldtm_calintto
	ldc_interestamt += ldc_inttemp
loop

// ปัดดอกเบี้ยตามหลักที่กำหนด
if ii_rdintdectype > 0 then
	ldc_interestamt = this.of_roundinterest(ldc_interestamt, ii_rdintdectype, ii_rdintdecdigit)
end if

// ถ้าปัดสตางค์ตอนรวมทุกขั้นแล้ว
if ii_rdsatangtype > 0 then
	ldc_interestamt = this.of_roundmoney(ldc_interestamt)
end if

return ldc_interestamt
end function

public function integer of_getrddecformat ();return ii_rdintdectype
end function

public function string of_getrdsatangtab ();return is_rdsatangtab
end function

public function integer of_getrdsatangtype ();return ii_rdsatangtype
end function

public function integer of_setrddecdigit (integer ai_rddecdigit);ii_rdintdecdigit			= ai_rddecdigit

return 1
end function

public function integer of_getrddecdigit ();return ii_rdintdecdigit
end function

public function decimal of_roundinterest (decimal adc_intamt, integer ai_rdintdectype, integer ai_rdintdecdigit);// ++++++++++++++++++++++++++++
// รูปแบบการปัดทศนิยมตามหลักที่กำหนดไว้
// ++++++++++++++++++++++++++++
dec		ldc_intround
integer	li_decdigit

li_decdigit	= ai_rdintdecdigit

if isnull( li_decdigit ) then
	li_decdigit	= 7
end if

choose case ai_rdintdectype
	case 1 // ปัด5/4
		ldc_intround	= round( adc_intamt, li_decdigit )
	case 2 // ปัดทิ้ง
		ldc_intround	= truncate( adc_intamt, li_decdigit )
	case 3 // ปัดขึ้น
		string	ls_tempstr, ls_format

		ls_format		= "0."+fill( "0", li_decdigit+1 )
		
		ls_tempstr		= string( adc_intamt, ls_format )
		
		if integer( right( ls_tempstr, 1 ) ) = 0 then
			ldc_intround	= dec( ls_tempstr )
		else
			ldc_intround	= dec( left( ls_tempstr, len( ls_tempstr ) - 1 ) )
			ldc_intround	= ldc_intround + dec( "0."+fill( "0", li_decdigit - 1 )+"1" )
		end if
	case else
		ldc_intround	= adc_intamt

end choose

return ldc_intround
end function

public function decimal of_computeinterestx (string as_xmlcontmast, string as_xmlcontintspc, decimal adc_prncalint, datetime adtm_calintfrom, datetime adtm_calintto);string		ls_coopid, ls_continttabcode, ls_expr, ls_intspctabcode
long		ll_count, ll_index, ll_find
integer	li_continttype, li_intsteptype, li_intspcratetype
dec{2}	ldc_apvamt, ldc_intamt, ldc_inttotal
dec{4}	ldc_contintrate, ldc_intincrease, ldc_intspcfixrate, ldc_intspcincrease
datetime	ldtm_calintfrom, ldtm_calintto

if as_xmlcontmast = "" then
	return 0
end if

ids_contintinfo.reset()
ids_contintinfo.importstring( XML!, as_xmlcontmast )

if ids_contintinfo.rowcount() <= 0 then
	return 0
end if

// ข้อกำหนดเรื่องดอกเบี้ย
ls_coopid				= ids_contintinfo.getitemstring( 1, "coop_id" )
li_continttype		= ids_contintinfo.getitemnumber( 1, "int_continttype" )
ls_continttabcode	= ids_contintinfo.getitemstring( 1, "int_continttabcode" )
ldc_contintrate		= ids_contintinfo.getitemdecimal( 1, "int_contintrate" )
ldc_intincrease		= ids_contintinfo.getitemdecimal( 1, "int_contintincrease" )
li_intsteptype		= ids_contintinfo.getitemnumber( 1, "int_intsteptype" )

ldc_apvamt			= ids_contintinfo.getitemdecimal( 1, "loanapprove_amt" )

// ถ้าไม่มียอดต้นที่จะคิด ด/บ เป็น 0
if adc_prncalint <= 0 then
	return 0
end if

// ถ้าสถานะนี้เป็นไม่คิด ด/บ
if li_continttype = 0 then
	return 0
end if

// ถ้าวันที่คิดดอกเบี้ยถึงน้อยกว่าวันที่คิดดอกเบี้ยล่าสุด ด/บ 0
if adtm_calintto <= adtm_calintfrom then
	return 0
end if

// ถ้าไม่ได้ set รูปแบบขั้นดอกเบี้ยไว้ set ให้เป็นจากยอดอนุมัติ
if isnull( li_intsteptype ) then
	li_intsteptype = 1
end if

ldtm_calintfrom		= adtm_calintfrom
ldtm_calintto		= adtm_calintto

choose case li_continttype
	case 1	// ตาม rate ที่ระบุ
		
		// อัตราด/บเพิ่มลดพิเศษ
		this.of_setintincrease( 0 )
		
		ldc_inttotal	= this.of_computeinterest( ldc_contintrate, ldtm_calintfrom, ldtm_calintto, adc_prncalint )
		
	case 2	// ตามตารางด/บที่ระบุ
		
		// อัตราด/บเพิ่มลดพิเศษ
		this.of_setintincrease( ldc_intincrease )
		
		// ตรวจว่าดูอัตราด/บจากยอดอนุมัติหรือคงเหลือ
		if li_intsteptype = 2 then
			ldc_inttotal	= this.of_computeinterest( ls_coopid, ls_continttabcode, ldtm_calintfrom, ldtm_calintto, adc_prncalint )
		else
			ldc_inttotal	= this.of_computeinterest( ls_coopid, ls_continttabcode, ldtm_calintfrom, ldtm_calintto, adc_prncalint, ldc_apvamt )
		end if
		
	case 3	// ตามตารางเวลาด/บ
		
		if as_xmlcontintspc = "" then
			return 0
		end if
		
		ids_contintspc.reset()
		ids_contintspc.importstring( XML!, as_xmlcontintspc )
		
		ll_count	= ids_contintspc.rowcount()
		
		if ll_count <= 0 then
			is_errmsg		= "ไม่พบตารางอัตราดอกเบี้ยพิเศษ"
			return 0
		end if
		
		// หาวันที่คิดด/บล่าสุดว่าอยู่ช่วงไหน
		ls_expr		= "'"+string( ldtm_calintfrom, 'yyyy-mm-dd' ) + "' >= string( effective_date, 'yyyy-mm-dd' )"
		ll_find		= ids_contintspc.find( ls_expr, ll_count, 1 )		//  ค้นจากข้างล่างขึ้นมา จะค้นจากข้างบนลงล่างไม่ได้
		
		// กรณีไม่เจอวันที่เริ่มใช้ ด/บ (วันที่จะคิด ด/บ ดันมีก่อน วันที่กำหนด ด/บ วันแรก)
		if ll_find <= 0 then
			is_errmsg		= "( อัตราดอกเบี้ยพิเศษ ) ไม่พบอัตรา ด/บ ของช่วงวันที่ "+string( ldtm_calintfrom, "dd/mm/yyyy" )
			return 0
		end if

		// ลบอัตรา ด/บ ก่อนหน้านี้ทั้งหมด
		if ll_find > 1 then
			ids_contintspc.rowsdiscard( 1, ll_find - 1, primary! )
		end if
		
		ldtm_calintfrom	= adtm_calintfrom
		
		// เริ่มหาอัตราพิเศษ
		for ll_index = 1 to ids_contintspc.rowcount()
			
			if ll_index = ids_contintspc.rowcount() then
				ldtm_calintto		= adtm_calintto
			else
				ldtm_calintto		= ids_contintspc.getitemdatetime( ll_index + 1, "effective_date" )
			end if
			
			li_intspcratetype	= ids_contintspc.getitemnumber( ll_index, "int_continttype" )
			ls_intspctabcode	= ids_contintspc.getitemstring( ll_index, "int_continttabcode" )
			ldc_intspcfixrate	= ids_contintspc.getitemdecimal( ll_index, "int_contintrate" )
			ldc_intspcincrease	= ids_contintspc.getitemdecimal( ll_index, "int_contintincrease" )
			
			// อัตราด/บเพิ่มลดพิเศษ
			this.of_setintincrease( ldc_intspcincrease )
			
			choose case li_intspcratetype
				case 0	//	ไม่คิดดอกเบี้ย
					
					ldc_intamt		= 0
					
				case 1	//	ตามอัตราที่กำหนด
					
					ldc_intamt	= this.of_computeinterest( ldc_intspcfixrate, ldtm_calintfrom, ldtm_calintto, adc_prncalint )
					
				case 2	//	ตามตารางดอกเบี้ย
					
					// ตรวจว่าดูอัตราด/บจากยอดอนุมัติหรือคงเหลือ
					if li_intsteptype = 2 then
						ldc_intamt	= this.of_computeinterest( ls_coopid, ls_intspctabcode, ldtm_calintfrom, ldtm_calintto, adc_prncalint )
					else
						ldc_intamt	= this.of_computeinterest( ls_coopid, ls_intspctabcode, ldtm_calintfrom, ldtm_calintto, adc_prncalint, ldc_apvamt )
					end if
					
			end choose
			
			ldtm_calintfrom		= ldtm_calintto
			ldc_inttotal			+= ldc_intamt
		next
	case 4, 5	// ตามอัตราดอกเบี้ยเงินฝากที่นำมาค้ำประกัน
		
		ldc_inttotal	= this.of_computeintdept( ids_contintinfo, ldtm_calintfrom, ldtm_calintto, adc_prncalint, 1 )
end choose

return ldc_inttotal
end function

public function string of_getcontintratedetail (string as_coopid, string as_contno, datetime adtm_contintto) throws Exception;string		ls_loantype, ls_inttabcode, ls_intdesc, ls_incrdesc
integer		li_inttype, li_intsteptype
long		ll_count
dec{2}		ldc_apvamt, ldc_prnbal
dec{4}		ldc_intrate, ldc_intincrease
datetime	ldtm_lastcalint

// ดึงข้อมูลสำหรับคำนวณ
ll_count	= ids_contintinfo.retrieve( as_coopid, as_contno )
if ll_count <= 0 then
	return ""
end if

ls_intdesc		= ""
ldc_intrate		= 0

ls_loantype			= trim( ids_contintinfo.getitemstring( 1, "loantype_code" ) )
ldc_apvamt			= ids_contintinfo.getitemdecimal( 1, "loanapprove_amt" )
ldc_prnbal			= ids_contintinfo.getitemdecimal( 1, "principal_balance" )

li_intsteptype		= ids_contintinfo.getitemnumber( 1, "int_intsteptype" )
li_inttype				= ids_contintinfo.getitemnumber( 1, "int_continttype" )
ldc_intrate			= ids_contintinfo.getitemdecimal( 1, "int_contintrate" )
ls_inttabcode		= ids_contintinfo.getitemstring( 1, "int_continttabcode" )
ldc_intincrease		= ids_contintinfo.getitemdecimal( 1, "int_contintincrease" )
ldtm_lastcalint		= ids_contintinfo.getitemdatetime( 1, "lastcalint_date" )

if isnull( ldtm_lastcalint ) or string( ldtm_lastcalint, "yyyy-mm-dd" ) = "1900-01-01" then
	ldtm_lastcalint	= adtm_contintto
end if

// ถ้าเป็นอัตราพิเศษตามช่วงเวลา
if li_inttype = 3 then
	ll_count	= ids_contintspc.retrieve( as_coopid, as_contno, adtm_contintto )
	
	if ll_count = 0 then
		is_errmsg	= "ไม่พบตารางอัตราดอกเบี้ยพิเศษ"
		return ""
	end if
		
	li_inttype				= ids_contintspc.getitemnumber( ll_count, "int_continttype" )
	ldc_intrate			= ids_contintspc.getitemdecimal( ll_count, "int_contintrate" )
	ls_inttabcode		= ids_contintspc.getitemstring( ll_count, "int_continttabcode" )
	ldc_intincrease		= ids_contintspc.getitemdecimal( ll_count, "int_contintincrease" )
	
end if

choose case li_inttype
	case 0
		ls_intdesc	= "** ไม่คิดดอกเบี้ย **"
	case 1
		ls_intdesc	= "อัตราคงที่ ด/บ "+string( ldc_intrate, "#,##0.00%" )
	case 2
		if li_intsteptype = 1 then
			ldc_intrate		= this.of_getloanintrate( as_coopid, ls_inttabcode, adtm_contintto, ldc_apvamt )
		else
			ldc_intrate		= this.of_getloanintrate( as_coopid, ls_inttabcode, adtm_contintto, ldc_prnbal )
		end if
		
		if ldc_intincrease <> 0 then
			ls_incrdesc		= " ("+string( ldc_intincrease, "0.00%" )+")"
		end if
		
		ls_intdesc		= "ณ วันที่ "+string( adtm_contintto, "dd/mm/yyyy" ) +" อัตรา ด/บ "+ string( ldc_intrate, "#,##0.00%" )+ls_incrdesc
	case 3
		
end choose

return ls_intdesc
end function

public function decimal of_computeinterest (decimal adc_intrate, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal);string		ls_debugmsg
dec		ldc_intamount

// ตรวจสอบ Parameter ที่ส่งเข้ามา
if date(adtm_calintfrom) > date(adtm_calintto) then
	return 0.00
end if

if adc_principal = 0 then
	return 0.00
end if

if isnull(adc_intrate) or adc_intrate = 0 then
	return 0.00
end if

ls_debugmsg	= "Of_computeinterest(memint) :  ประเภทการคิดดอกเบี้ย : "+string( ii_intdateviewtype ) +"  ประเภทการปัด : "+string( ii_rdsatangtype )
	
ldc_intamount	= this.of_calculateinterest( adc_intrate, adtm_calintfrom, adtm_calintto, adc_principal )

return ldc_intamount
end function

public function decimal of_calculateinterest (n_ds ads_inttable, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception;// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ถ้าไม่มีการส่งยอดอนุมัติมาแสดงว่าเป็นการคำนวณดอกเบี้ยเป็นขยักตามขั้นดอกเบี้ย
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

string		ls_expr, ls_debugmsg
integer	li_found, li_index, li_count, li_days, li_daysinyear, li_lastchgint
dec		ldc_tempinterest, ldc_intrate, ldc_interestamt, ldc_tempintamt, ldc_tpintrate
dec{2}	ldc_upperamt, ldc_loweramt, ldc_tempprincipal
datetime	ldtm_calintfrom, ldtm_calintto, ldtm_fromint

// ตรวจสอบว่ามี ตารางดอกเบี้ยหรือไม่
if not isvalid(ads_inttable) or (ads_inttable.rowcount() = 0) then return 0.00

// ตรวจสอบว่าวันที่ส่งเข้ามาถูกต้องหรือไม่
if date(adtm_calintto) < date(adtm_calintfrom) then return 0.00

// ตรวจสอบยอดเงินที่ส่งเข้ามา
if adc_principal = 0 then return 0.00

ldtm_calintfrom = adtm_calintfrom

do while date( ldtm_calintto ) < date( adtm_calintto ) or li_lastchgint = 1
	// กำหนดค่าเริ่มต้นให้ตาราง ด/บ
	ads_inttable.setfilter("")
	ads_inttable.filter()
	ads_inttable.setsort( "effective_date A, lower_amt A" )
	ads_inttable.sort()

	// ค้นหาว่าใช้อัตรา ด/บ ของช่วงไหน
	ls_expr		= " '" + string( ldtm_calintfrom, 'yyyy-mm-dd' ) + "' >= string( effective_date, 'yyyy-mm-dd' ) "
	li_found		= ads_inttable.find( ls_expr, ads_inttable.rowcount(), 1 ) //  ค้นจากข้างล่างขึ้นมา จะค้นจากข้างบนลงล่างไม่ได้
	
	// กรณีไม่เจอวันที่เริ่มใช้ ด/บ (วันที่จะคิด ด/บ ดันมีก่อน วันที่กำหนด ด/บ วันแรก)
	if li_found <= 0 then
		ithw_exception.text	= "ไม่พบตารางดอกเบี้ยสำหรับ ช่วงวันที่่ ("+string(ldtm_calintfrom, "dd/mm/yyyy" )+")"
		throw ithw_exception
	end if

	// ลบอัตรา ด/บ ก่อนหน้านี้ทั้งหมด
	ldtm_fromint	= ads_inttable.getitemdatetime( li_found, "effective_date" )
	ls_expr			= "'" + string( ldtm_fromint, "yyyy-mm-dd" ) + "' > string( effective_date, 'yyyy-mm-dd' ) "
	li_found			= ads_inttable.find( ls_expr, li_found, 1 )
	if li_found > 0 then
		ads_inttable.rowsdiscard( 1, li_found, primary! )
	end if
	
	// กำหนดวันที่คิด ด/บ ถึง
	ls_expr		= " string( effective_date, 'yyyy-mm-dd' ) >'" + string( ldtm_calintfrom, "yyyy-mm-dd" ) + "'"
	li_found		= ads_inttable.find( ls_expr, 1, ads_inttable.rowcount() )
	
	if li_found <= 0 then
		ldtm_calintto = adtm_calintto // ถ้าไม่มี วันที่เริ่มใช้ใหม่ ใช้วันที่ที่ส่งมา
		li_lastchgint = 0
	else
		ldtm_calintto	= ads_inttable.getitemdatetime( li_found, "effective_date" )
		ads_inttable.setfilter( "string( effective_date, 'yyyy-mm-dd' ) < '" + string( ldtm_calintto, 'yyyy-mm-dd' ) + "'" )
		ads_inttable.filter()
		if date( adtm_calintto ) = date( ldtm_calintto ) then li_lastchgint = 1
	end if
	
	// ตรวจสอบการคิด ด/บ ข้ามปี
	if ii_daysinyear > 0 then
		li_daysinyear = ii_daysinyear
	else
		integer		li_yearfrom, li_yearend
		li_yearfrom		= year( date( ldtm_calintfrom ) )
		li_yearend		= year( date( ldtm_calintto ) )
	
		// ตรวจสอบว่าวันที่คิด ด/บ คาบเกี่ยวระหว่างปีหรือเปล่า
		if li_yearend - li_yearfrom > 0 then
			ldtm_calintto = datetime( date( li_yearfrom + 1, 1, 1 ) )
		end if
		li_daysinyear	= this.of_daysinyear( year( date( ldtm_calintfrom ) ) )
	end if
	
	// --------------- เริ่มคำนวณ ด/บ ------------------
	ldc_tempintamt		= 0.00

	 // นับจำนวนขั้น
	li_count	= ads_inttable.rowcount()
	for li_index = 1 to li_count
		ldc_loweramt	= ads_inttable.getitemdecimal( li_index, "lower_amt" )
		ldc_upperamt	= ads_inttable.getitemdecimal( li_index, "upper_amt" )

		if adc_principal <= ldc_loweramt then
			exit
		end if
				
		if adc_principal > ldc_upperamt then
			ldc_tempprincipal = ldc_upperamt
		else
			ldc_tempprincipal = adc_principal
		end if
					
		// ยอดเงินที่จะคิด ด/บ ขั้นนั้น
		ldc_tempprincipal	= ldc_tempprincipal - ldc_loweramt
				
		ldc_intrate			= ads_inttable.getitemdecimal( li_index, "interest_rate" )
				
		// นับจำนวนวันสำหรับคำนวณ ด/บ
		li_days		= daysafter( date(ldtm_calintfrom), date(ldtm_calintto) )
				
		choose case ii_intdateviewtype
			case 1 // สำหรับแบบปกติ (ดอกเมื่อวาน ดูอัตราเมื่อวาน)
				li_lastchgint = 0
				
			case 2 // (ดอกเมื่อวาน ดูอัตราวันนี้)
				if date( adtm_calintfrom ) = date( ldtm_calintfrom ) and date( adtm_calintto ) <> date( ldtm_calintto ) then
					// กรณีเป็นวันที่เริ่มคิดแล้วมีการเปลี่ยน ด/บ ก่อนวันที่คิดถึง ต้อง ลบ 1 วัน
					li_days --
				elseif date( adtm_calintfrom ) = date( ldtm_calintfrom ) and date( adtm_calintto ) = date( ldtm_calintto ) and li_lastchgint = 1 then
					// กรณีเป็นวันที่เริ่มคิดและวันที่คิดถึงเปลี่ยน ด/บ  ต้อง ลบ 1 วัน
					li_days --
				elseif date( adtm_calintfrom ) <> date( ldtm_calintfrom ) and date( adtm_calintto ) = date( ldtm_calintto ) and li_lastchgint = 0 then
					// กรณีเป็นวันที่คิดถึงและวันที่คิดถึงไม่ได้เปลี่ยน อัตรา ด/บ ต้อง บวก 1 วัน
					li_days ++
				end if
		end choose
		
		// mike รองรับการเชื่อมระบบ cen กับ core
		if is_coopcontrol = "006001" then
			ldc_tpintrate	= ( ldc_intrate + idc_intincrease )
		else
			ldc_tpintrate	= ( ( ldc_intrate + idc_intincrease ) / 100 )
		end if
		
		ldc_tempinterest	= ldc_tempprincipal * ldc_tpintrate  * li_days / li_daysinyear  // คิดดอกเบี้ยพักใส่ตัวแปร
		
		if is_coopcontrol = "010001" then
			ldc_tempinterest	= round( ldc_tempinterest, 3 )
			ldc_tempinterest	= round( ldc_tempinterest, 2 )
		end if
		
		// สะสมดอกเบี้ยสำหรับขั้นต่อไป
		ldc_tempintamt 	+= ldc_tempinterest
	next

	ldtm_calintfrom		= ldtm_calintto
	ldc_interestamt		+= ldc_tempintamt
	// จบขั้นตอนการคำนวณ ด/บ
loop

// ปัดดอกเบี้ยตามหลักที่กำหนด
if ii_rdintdectype > 0 then
	ldc_interestamt	= this.of_roundinterest( ldc_interestamt, ii_rdintdectype, ii_rdintdecdigit )
end if

// ถ้าปัดสตางค์ตอนรวมทุกขั้นแล้ว
if ii_rdsatangtype > 0 then
	ldc_interestamt	= this.of_roundmoney( ldc_interestamt )
end if

return ldc_interestamt
end function

public function decimal of_calculateinterest (n_ds ads_inttable, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal, decimal adc_apvamt) throws Exception;// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// มีการส่งยอดอนุมัติมาแสดงว่าต้องดูอัตราดอกเบี้ยจากขั้นที่อนุมัติ ไม่มีการคิดเป็นขยัก
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

string		ls_expr, ls_debugmsg, ls_round
integer	li_found, li_days, li_daysinyear, li_lastchgint
dec		ldc_intrate, ldc_interestamt, ldc_tempintamt, ldc_tpintrate
datetime	ldtm_calintfrom, ldtm_calintto, ldtm_fromint

// ตรวจสอบว่ามี ตารางดอกเบี้ยหรือไม่
if not isvalid(ads_inttable) or (ads_inttable.rowcount() = 0) then return 0.00

// ตรวจสอบว่าวันที่ส่งเข้ามาถูกต้องหรือไม่
if date(adtm_calintto) < date(adtm_calintfrom) then return 0.00

// ตรวจสอบยอดเงินที่ส่งเข้ามา
if adc_principal = 0 then return 0.00

ldtm_calintfrom = adtm_calintfrom

do while date( ldtm_calintto ) < date( adtm_calintto ) or li_lastchgint = 1
	// กำหนดค่าเริ่มต้นให้ตาราง ด/บ
	ads_inttable.setfilter("")
	ads_inttable.filter()
	ads_inttable.setsort( "effective_date A, lower_amt A" )
	ads_inttable.sort()

	// ค้นหาว่าใช้อัตรา ด/บ ของช่วงไหน
	ls_expr		= " '" + string( ldtm_calintfrom, 'yyyy-mm-dd' ) + "' >= string( effective_date, 'yyyy-mm-dd' ) "
	li_found	= ads_inttable.find( ls_expr, ads_inttable.rowcount(), 1 ) //  ค้นจากข้างล่างขึ้นมา จะค้นจากข้างบนลงล่างไม่ได้
	
	// กรณีไม่เจอวันที่เริ่มใช้ ด/บ (วันที่จะคิด ด/บ ดันมีก่อน วันที่กำหนด ด/บ วันแรก)
	if li_found <= 0 then
		ithw_exception.text	= "ไม่พบตารางดอกเบี้ยสำหรับ ช่วงวันที่่ ("+string(ldtm_calintfrom, "dd/mm/yyyy" )+")"
		throw ithw_exception
	end if

	// ลบอัตรา ด/บ ก่อนหน้านี้ทั้งหมด
	ldtm_fromint	= ads_inttable.getitemdatetime( li_found, "effective_date" )
	ls_expr			= "'" + string( ldtm_fromint, "yyyy-mm-dd" ) + "' > string( effective_date, 'yyyy-mm-dd' ) "
	li_found			= ads_inttable.find( ls_expr, li_found, 1 )
	if li_found > 0 then
		ads_inttable.rowsdiscard( 1, li_found, primary! )
	end if
	
	// กำหนดวันที่คิด ด/บ ถึง
	ls_expr		= " string( effective_date, 'yyyy-mm-dd' ) >'" + string( ldtm_calintfrom, "yyyy-mm-dd" ) + "'"
	li_found	= ads_inttable.find( ls_expr, 1, ads_inttable.rowcount() )
	
	if li_found <= 0 then
		ldtm_calintto = adtm_calintto // ถ้าไม่มี วันที่เริ่มใช้ใหม่ ใช้วันที่ที่ส่งมา
		li_lastchgint = 0
	else
		ldtm_calintto	= ads_inttable.getitemdatetime( li_found, "effective_date" )
		ads_inttable.setfilter( "string( effective_date, 'yyyy-mm-dd' ) < '" + string( ldtm_calintto, 'yyyy-mm-dd' ) + "'" )
		ads_inttable.filter()
		if date( adtm_calintto ) = date( ldtm_calintto ) then li_lastchgint = 1
	end if
	
	// ตรวจสอบการคิด ด/บ ข้ามปี
	if ii_daysinyear > 0 then
		li_daysinyear = ii_daysinyear
	else
		integer		li_yearfrom, li_yearend
		li_yearfrom		= year( date( ldtm_calintfrom ) )
		li_yearend		= year( date( ldtm_calintto ) )
	
		// ตรวจสอบว่าวันที่คิด ด/บ คาบเกี่ยวระหว่างปีหรือเปล่า
		if li_yearend - li_yearfrom > 0 then
			ldtm_calintto = datetime( date( li_yearfrom + 1, 1, 1 ) )
		end if
		li_daysinyear	= this.of_daysinyear( year( date( ldtm_calintfrom ) ) )
	end if
	
	// --------------- เริ่มคำนวณ ด/บ ------------------
	ldc_tempintamt		= 0.00

	ls_expr		= "lower_amt <= "+string( adc_apvamt, "0.00" )+" and upper_amt >= "+string( adc_apvamt, "0.00" )
	li_found	= ads_inttable.find( ls_expr, 1, ads_inttable.rowcount() )
	
	if li_found <= 0 then
		ls_debugmsg	= "ไม่พบขั้นดอกเบี้ย(Step) สำหรับ สำหรับยอดเงิน "+string( adc_apvamt, "#,##0.00" )
		is_errmsg		= ls_debugmsg
		
		return failure
	end if
	
	ldc_intrate		= ads_inttable.getitemdecimal( li_found, "interest_rate" )
	
	// นับจำนวนวันสำหรับคำนวณ ด/บ
	li_days		= daysafter( date(ldtm_calintfrom), date(ldtm_calintto) )
				
	choose case ii_intdateviewtype
		case 1 // สำหรับแบบปกติ (นับหน้าไม่นับหลัง)
			li_lastchgint = 0
			
		case 2 // (นับหลังไม่นับหน้า)
			if date( adtm_calintfrom ) = date( ldtm_calintfrom ) and date( adtm_calintto ) <> date( ldtm_calintto ) then
				// กรณีเป็นวันที่เริ่มคิดแล้วมีการเปลี่ยน ด/บ ก่อนวันที่คิดถึง ต้อง ลบ 1 วัน
				li_days --
			elseif date( adtm_calintfrom ) = date( ldtm_calintfrom ) and date( adtm_calintto ) = date( ldtm_calintto ) and li_lastchgint = 1 then
				// กรณีเป็นวันที่เริ่มคิดและวันที่คิดถึงเปลี่ยน ด/บ  ต้อง ลบ 1 วัน
				li_days --
			elseif date( adtm_calintfrom ) <> date( ldtm_calintfrom ) and date( adtm_calintto ) = date( ldtm_calintto ) and li_lastchgint = 0 then
				// กรณีเป็นวันที่คิดถึงและวันที่คิดถึงไม่ได้เปลี่ยน อัตรา ด/บ ต้อง บวก 1 วัน
				li_days ++
			end if
	end choose
	
	// mike รองรับการเชื่อมระบบ cen กับ core
	if is_coopcontrol = "006001" then
		ldc_tpintrate	= ( ldc_intrate + idc_intincrease )
	else
		ldc_tpintrate	= ( ( ldc_intrate + idc_intincrease ) / 100 )
	end if
	
	ldc_tempintamt 	= adc_principal * ldc_tpintrate * li_days / li_daysinyear  // คิดดอกเบี้ยพักใส่ตัวแปร
	
	if is_coopcontrol = "010001" then
		ldc_tempintamt		= truncate( ldc_tempintamt, 3 )
		ldc_tempintamt		= round( ldc_tempintamt, 2 )
	end if

	// ปัดดอกเบี้ยตามหลักที่กำหนด
	if ii_rdintdectype > 0 then
		ldc_tempintamt	= this.of_roundinterest( ldc_tempintamt, ii_rdintdectype, ii_rdintdecdigit )
	end if

	ldtm_calintfrom		= ldtm_calintto
	ldc_interestamt		+= ldc_tempintamt
	// จบขั้นตอนการคำนวณ ด/บ
loop

// ถ้าปัดสตางค์ตอนรวมทุกขั้นแล้ว
if ii_rdsatangtype > 0 then
	ldc_interestamt	= this.of_roundmoney( ldc_interestamt )
end if

return ldc_interestamt
end function

public function decimal of_getloantypeintrate (string as_coopid, string as_loantype, datetime adtm_intdate, decimal adc_money) throws Exception;string		ls_inttablecode

select		inttabrate_code
into		:ls_inttablecode
from		lnloantype
where	( loantype_code	= :as_loantype ) and
			( coop_id				= :as_coopid )
using		itr_sqlca ;

return this.of_getloanintrate( as_coopid, ls_inttablecode, adtm_intdate, adc_money )
end function

public function decimal of_getloanintrate (string as_coopid, string as_inttabcode, datetime adtm_intdate, decimal adc_money) throws Exception;string		ls_expr, ls_debugmsg
integer	li_found
long		ll_count
dec{5}	ldc_intrate
datetime	ldtm_fromint
	ids_inttable.retrieve(as_coopid )
ll_count	= ids_inttable.rowcount()

// ค้นหาว่าใช้อัตรา ด/บ ของช่วงไหน
ls_expr		= "('" + string( adtm_intdate, 'yyyy-mm-dd' ) + "' >= string( effective_date, 'yyyy-mm-dd' ) ) and " + &
				   "("+ string(adc_money) +" >= lower_amt and "+ string(adc_money) +" <= upper_amt ) "
					
li_found		= ids_inttable.find( ls_expr, ids_inttable.rowcount(), 1 )
	
// กรณีไม่เจอวันที่เริ่มใช้ ด/บ
if li_found <= 0 then
	ithw_exception.text	="ไม่พบตารางดอกเบี้ยสำหรับ ช่วงวันที่ (" + string(adtm_intdate, "dd/mm/yyyy" ) + ") ยอดเงิน "+string( adc_money, "#,##0.00" )
	throw ithw_exception
end if

ldc_intrate		= ids_inttable.getitemdecimal( li_found, "interest_rate" )
									 
if isnull( ldc_intrate ) then ldc_intrate = 0

return ldc_intrate
end function

public function decimal of_getloanintrate (string as_coopid, string as_inttabcode, datetime adtm_intdate) throws Exception;return this.of_getloanintrate( as_coopid, as_inttabcode, adtm_intdate, 1 )
end function

public function integer of_getinteresttable (string as_coopid, string as_inttabcode, datetime adtm_enddate, ref n_ds ads_inttable);// validate parameter 1
if not isvalid(ads_inttable) then
	ads_inttable	= create n_ds
	ads_inttable.dataobject	= ids_inttable.dataobject
end if
	
if (ads_inttable.dataobject <> ids_inttable.dataobject) then 
	ads_inttable.dataobject = ids_inttable.dataobject
end if
string		ls_expr
long		ll_count

ll_count	= ids_inttable.rowcount()
if ll_count <= 0 then
	ids_inttable.retrieve( as_coopid )
end if


as_inttabcode	= trim( as_inttabcode )
ls_expr			= "( loanintrate_code = '" + as_inttabcode+"') and (string(effective_date, 'yyyy-mm-dd') <= '" + string( adtm_enddate, 'yyyy-mm-dd')+ "')"

ids_inttable.setfilter( ls_expr  )
ids_inttable.filter()

ll_count	= ids_inttable.rowcount()

if ll_count <= 0 then
	return 1
end if

ids_inttable.setsort( "effective_date A , lower_amt A" )
ids_inttable.sort()

ads_inttable.reset()

ids_inttable.rowscopy( 1, ll_count, primary!, ads_inttable, 1, primary! )

ids_inttable.setfilter("")
ids_inttable.filter()

return success
end function

public function decimal of_computeinterest (string as_coopid, string as_inttabcode, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal);string		ls_debugmsg
dec		ldc_intamount
n_ds	lds_inttable

// ตรวจสอบ Parameter ที่ส่งเข้ามา
if date(adtm_calintfrom) > date(adtm_calintto) then
	return 0.00
end if

if adc_principal = 0 then
	return 0.00
end if

if isnull(as_inttabcode) or trim(as_inttabcode) = "" then
	return 0.00
end if

// ดึงตารางดอกเบี้ย ----------
this.of_getinteresttable( as_coopid, as_inttabcode, adtm_calintto, lds_inttable )

ls_debugmsg	= "Of_computeinterest( int-table) :  แบบการนับวัน : "+string( ii_intdateviewtype ) +"  แบบการปัด : "+string( ii_rdsatangtype )

try
	ldc_intamount	= this.of_calculateinterest( lds_inttable, adtm_calintfrom, adtm_calintto, adc_principal )
catch( Exception lthw_error )
	destroy( lds_inttable )
	return 0
end try

destroy( lds_inttable )

return ldc_intamount
end function

public function decimal of_computeinterest (string as_coopid, string as_inttabcode, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal, decimal adc_apvamt);string		ls_debugmsg
dec		ldc_intamount
n_ds	lds_inttable

// ตรวจสอบ Parameter ที่ส่งเข้ามา
if date(adtm_calintfrom) > date(adtm_calintto) then
	return 0.00
end if

if adc_principal = 0 then
	return 0.00
end if

if isnull(as_inttabcode) or trim(as_inttabcode) = "" then
	return 0.00
end if

if adc_apvamt = 0 then
	adc_apvamt	= adc_principal
end if

// ดึงตารางดอกเบี้ย ----------
this.of_getinteresttable( as_coopid, as_inttabcode, adtm_calintto, lds_inttable )

ls_debugmsg	= "Of_computeinterest( int-table) :  แบบการนับวัน : "+string( ii_intdateviewtype ) +"  แบบการปัด : "+string( ii_rdsatangtype )

try
	ldc_intamount	= this.of_calculateinterest( lds_inttable, adtm_calintfrom, adtm_calintto, adc_principal, adc_apvamt )
catch( Exception lthw_eror )
	destroy( lds_inttable )
	return 0
end try

return ldc_intamount
end function

private function integer of_monthsafter (date ad_start, date ad_end);date 		ld_temp
integer 	li_month
integer	li_mult

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

Return li_month * li_mult
end function

public function decimal of_computeintmonthx (string as_coopid, string as_xmlcontmast, string as_xmlintspc, decimal adc_principal, datetime adtm_calintfrom, datetime adtm_calintto) throws Exception;string	ls_debugmsg , ls_loantype , ls_continttabcode , ls_coopid
integer li_continttype
dec	ldc_interestamt,ldc_tempintamt
dec	ldc_months , ldc_contintrate
 
ids_contintinfo.reset()
ids_contintinfo.importstring( XML! , as_xmlcontmast )

if ids_contintinfo.rowcount() <= 0 then
	return 0
end if

ls_coopid				= ids_contintinfo.getitemstring( 1, "coop_id" )
ls_loantype			= ids_contintinfo.getitemstring( 1, "loantype_code" )
ls_continttabcode	= ids_contintinfo.getitemstring( 1, "int_continttabcode" )
li_continttype		= ids_contintinfo.getitemnumber( 1, "int_continttype" )
ldc_contintrate		= ids_contintinfo.getitemdecimal( 1, "int_contintrate" )

// ถ้าสถานะนี้เป็นไม่คิด ด/บ
if li_continttype = 0 then
	return 0
end if

if date(adtm_calintto) <= date(adtm_calintfrom) then return 0.00

if adc_principal = 0 then return 0.00


choose case li_continttype
	case 1	// ตาม rate ที่ระบุ
		ldc_interestamt		= this.of_calculateintmonth( ls_coopid, ls_loantype, ldc_contintrate, adtm_calintfrom, adtm_calintto, adc_principal )
		
	case 2	// ตามตารางด/บที่ระบุ
		n_ds		lds_inttable
		
		// อัตราด/บเพิ่มลดพิเศษ
		this.of_setintincrease( 0 )
		
		this.of_getinteresttable( ls_coopid, ls_continttabcode, adtm_calintto, lds_inttable )
		
		ldc_interestamt		= this.of_calculateintmonth( ls_coopid, ls_loantype, lds_inttable, adtm_calintfrom, adtm_calintto, adc_principal )
		
		destroy lds_inttable
end choose

// ปัดดอกเบี้ยตามหลักที่กำหนด
if ii_rdintdectype > 0 then
	ldc_interestamt	= this.of_roundinterest( ldc_interestamt, ii_rdintdectype, ii_rdintdecdigit )
end if

// ถ้าปัดสตางค์ตอนรวมทุกขั้นแล้ว
if ii_rdsatangtype > 0 then
	ldc_interestamt	= this.of_roundmoney( ldc_interestamt )
end if

return ldc_interestamt
end function

public function integer of_computeinterest (str_calinterest astr_calintcri, datetime adtm_calintfrom, datetime adtm_calintto, ref decimal adc_intperiod) throws Exception;string		ls_continttabcode, ls_loantype, ls_contno, ls_contcoopid
string		ls_expr
integer	li_calintmethod, li_continttype, li_spcinttype, li_intsteptype
long		ll_ispccount, ll_ispcindex, ll_find
dec{2}	ldc_prnbal, ldc_apvamt, ldc_intamt
dec{4}	ldc_contintfixrate, ldc_contintincrease
dec		ldc_intallamt
datetime	ldtm_calintfrom, ldtm_calintto

n_ds lds_inttable

lds_inttable = create n_ds
lds_inttable.dataobject = "d_loansrv_attrib_cfintereststep"
lds_inttable.settransobject( itr_sqlca )

if adtm_calintfrom > adtm_calintto then
	adc_intperiod	= 0
	return 0
end if

ls_contno				= astr_calintcri.loancontract_no
ls_contcoopid			= astr_calintcri.contcoop_id
ls_loantype				= astr_calintcri.loantype_code
ldc_prnbal				= astr_calintcri.principal_balance
ldc_apvamt				= astr_calintcri.loanapprove_amt
li_calintmethod			= astr_calintcri.interest_method
li_continttype			= astr_calintcri.int_continttype
ldc_contintfixrate		= astr_calintcri.int_contintrate
ls_continttabcode		= astr_calintcri.int_continttabcode
ldc_contintincrease	= astr_calintcri.int_contintincrease
li_intsteptype			= astr_calintcri.int_intsteptype

ldc_intallamt			= 0

choose case li_continttype
	case 0	// ไม่คิดดอกเบี้ย
		ldc_intallamt	= 0
		
	case 1	// อัตราคงที่
		// รูปแบบการคิด ด/บ
		choose case li_calintmethod
			case 1	// รายวัน
				ldc_intallamt	= this.of_calculateinterest( ldc_contintfixrate, adtm_calintfrom, adtm_calintto, ldc_prnbal )
			case 2	// รายเดือน
				ldc_intallamt	= this.of_calculateintmonth( ls_contcoopid, ls_loantype, ldc_contintfixrate, adtm_calintfrom, adtm_calintto, ldc_prnbal )
		end choose

	case 2	// ตามตารางดอกเบี้ย
		// ดึงตาราง ด/บ
		this.of_getinteresttable( ls_contcoopid, ls_continttabcode, adtm_calintto, lds_inttable )
		
		// อัตราด/บเพิ่มลดพิเศษ
		this.of_setintincrease( ldc_contintincrease )
		
		// ดูประเภทการคิด ด/บ รายวัน, รายเดือน
		if li_calintmethod = 1 then
			
			try
				// ตรวจว่าดูอัตราด/บจากยอดอนุมัติหรือคงเหลือ
				if li_intsteptype = 2 then
					ldc_intallamt	= this.of_calculateinterest( lds_inttable, adtm_calintfrom, adtm_calintto, ldc_prnbal )
				else
					ldc_intallamt	= this.of_calculateinterest( lds_inttable, adtm_calintfrom, adtm_calintto, ldc_prnbal, ldc_apvamt )
				end if
			catch( Exception lthw_error )
				if isvalid(lds_inttable) then destroy lds_inttable
				throw lthw_error
			end try
		else
			// รายเดือน
			ldc_intallamt	= this.of_calculateintmonth( ls_contcoopid, ls_loantype, lds_inttable, adtm_calintfrom, adtm_calintto, ldc_prnbal )
		end if
		
	case 3	// อัตรา ด/บ เป็นช่วง
		ldtm_calintfrom	= adtm_calintfrom
		
		ll_ispccount	= ids_contintspc.retrieve( ls_contcoopid, ls_contno, adtm_calintto )
		
		if ll_ispccount = 0 then
			ldc_intallamt	= 0
		else
			// หาวันที่คิดด/บล่าสุดว่าอยู่ช่วงไหน
			ls_expr		= "'"+string( ldtm_calintfrom, 'yyyy-mm-dd' ) + "' >= string( effective_date, 'yyyy-mm-dd' )"
			ll_find		= ids_contintspc.find( ls_expr, ll_ispccount, 1 )		//  ค้นจากข้างล่างขึ้นมา จะค้นจากข้างบนลงล่างไม่ได้
			
			// ลบอัตรา ด/บ ของช่วงวันที่ที่ผ่านมาแล้ว
			if ll_find > 1 then
				ids_contintspc.rowsdiscard( 1, ll_find - 1, primary! )
			end if
			
			// เริ่มหาอัตราพิเศษ
			for ll_ispcindex = 1 to ids_contintspc.rowcount()
				
				if ll_ispcindex = ids_contintspc.rowcount() then
					ldtm_calintto		= adtm_calintto
				else
					ldtm_calintto		= ids_contintspc.getitemdatetime( ll_ispcindex + 1, "effective_date" )
				end if
				
				li_spcinttype				= ids_contintspc.getitemnumber( ll_ispcindex, "int_continttype" )
				ls_continttabcode		= ids_contintspc.getitemstring( ll_ispcindex, "int_continttabcode" )
				ldc_contintfixrate		= ids_contintspc.getitemdecimal( ll_ispcindex, "int_contintrate" )
				ldc_contintincrease	= ids_contintspc.getitemdecimal( ll_ispcindex, "int_contintincrease" )
				
				// อัตราด/บเพิ่มลดพิเศษ
				this.of_setintincrease( ldc_contintincrease )
				
				choose case li_spcinttype
					case 0	//	ไม่คิดดอกเบี้ย
						
						ldc_intamt = 0
						
					case 1	//	ตามอัตราที่กำหนด
						
						ldc_intamt	= this.of_calculateinterest( ldc_contintfixrate, ldtm_calintfrom, ldtm_calintto, ldc_prnbal )
					case 2	//	ตามตารางดอกเบี้ย
						
						try
							// ดึงตาราง ด/บ
							this.of_getinteresttable( ls_contcoopid, ls_continttabcode, ldtm_calintto, lds_inttable)
							
							// ตรวจว่าดูอัตราด/บจากยอดอนุมัติหรือคงเหลือ
							if li_intsteptype = 2 then
								ldc_intamt	= this.of_calculateinterest( lds_inttable, ldtm_calintfrom, ldtm_calintto, ldc_prnbal )
							else
								ldc_intamt	= this.of_calculateinterest( lds_inttable, ldtm_calintfrom, ldtm_calintto, ldc_prnbal, ldc_apvamt )
							end if
						catch( Exception lthw_intspc )
							if isvalid(lds_inttable) then destroy lds_inttable
						end try
				end choose
				
				ldtm_calintfrom		= ldtm_calintto
				ldc_intallamt		+= ldc_intamt
			next
		end if
		
end choose

if ldc_intallamt > 0 then
	adc_intperiod	= ldc_intallamt
else
	adc_intperiod	= 0
end if

if isvalid(lds_inttable) then destroy lds_inttable

return 1
end function

public function decimal of_computeinterest (string as_coopid, string as_contno, decimal adc_prncalint, datetime adtm_calintfrom, datetime adtm_calintto) throws Exception;string		ls_xmlcontmast, ls_xmlintspc
integer	li_continttype , li_interestmethod
long		ll_count
dec{2}	ldc_inttotal

ls_xmlcontmast		= ""
ls_xmlintspc			= ""

// ดึงข้อมูลสำหรับคำนวณ
ll_count	= ids_contintinfo.retrieve( as_coopid, as_contno )
if ll_count <= 0 then
	return 0
end if

ls_xmlcontmast	= string( ids_contintinfo.describe( "Datawindow.data.XML" ) )

// ตรวจประเภท ด/บ ของสัญญา ถ้าเป็นอัตราพิเศษต้องดึงข้อมูล อัตราเป็นช่วงส่งไปด้วย
li_continttype	= ids_contintinfo.getitemnumber( 1, "int_continttype" )
li_interestmethod	= ids_contintinfo.getitemnumber( 1, "interest_method" )

if li_continttype = 3 then
	ll_count	= ids_contintspc.retrieve( as_coopid, as_contno, adtm_calintto )
	
	if ll_count > 0 then
		ls_xmlintspc		= string( ids_contintspc.describe( "Datawindow.data.XML" ) )
	end if
end if

choose case li_interestmethod
	case 1
		ldc_inttotal		= this.of_computeinterestx( ls_xmlcontmast, ls_xmlintspc, adc_prncalint, adtm_calintfrom, adtm_calintto )
	case 2
		//คิดแบบเดือน
		ldc_inttotal		= this.of_computeintmonthx( as_coopid , ls_xmlcontmast, ls_xmlintspc , adc_prncalint, adtm_calintfrom, adtm_calintto )
	case else
		ldc_inttotal		= this.of_computeinterestx( ls_xmlcontmast, ls_xmlintspc, adc_prncalint, adtm_calintfrom, adtm_calintto )
end choose

return ldc_inttotal
end function

public function decimal of_computeinterest (string as_coopid, string as_contno, datetime adtm_calintto) throws Exception;string		ls_xmlcontmast, ls_xmlintspc
integer	li_continttype , li_interestmethod
long		ll_count
dec{2}	ldc_inttotal, ldc_prncalint
datetime	ldtm_lastcalint

ls_xmlcontmast		= ""
ls_xmlintspc			= ""

// ดึงข้อมูลสำหรับคำนวณ
ll_count	= ids_contintinfo.retrieve( as_coopid, as_contno )
if ll_count <= 0 then
	return 0
end if

li_continttype		= ids_contintinfo.getitemnumber( 1, "int_continttype" )
li_interestmethod	= ids_contintinfo.getitemnumber( 1, "interest_method" )
ldc_prncalint		= ids_contintinfo.getitemdecimal( 1, "principal_balance" )
ldtm_lastcalint		= ids_contintinfo.getitemdatetime( 1, "lastcalint_date" )

ls_xmlcontmast	= string( ids_contintinfo.describe( "Datawindow.data.XML" ) )

// ตรวจประเภท ด/บ ของสัญญา ถ้าเป็นอัตราพิเศษต้องดึงข้อมูล อัตราเป็นช่วงส่งไปด้วย
if li_continttype = 3 then
	ll_count	= ids_contintspc.retrieve( as_coopid, as_contno, adtm_calintto )
	
	if ll_count > 0 then
		ls_xmlintspc		= string( ids_contintspc.describe( "Datawindow.data.XML" ) )
	end if
end if

choose case li_interestmethod
	case 1
		ldc_inttotal		= this.of_computeinterestx( ls_xmlcontmast, ls_xmlintspc, ldc_prncalint, ldtm_lastcalint, adtm_calintto )
	case 2
		//คิดแบบเดือน
		ldc_inttotal		= this.of_computeintmonthx( as_coopid, ls_xmlcontmast, ls_xmlintspc, ldc_prncalint, ldtm_lastcalint, adtm_calintto )
	case else
		ldc_inttotal		= this.of_computeinterestx( ls_xmlcontmast, ls_xmlintspc, ldc_prncalint, ldtm_lastcalint, adtm_calintto )
end choose

return ldc_inttotal
end function

public function decimal of_computeintmonth (string as_coopid, string as_loantype, decimal adc_fixrate, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception;dec		ldc_intamount

// ตรวจสอบ Parameter ที่ส่งเข้ามา
if date(adtm_calintfrom) > date(adtm_calintto) or adc_principal = 0 or adc_fixrate = 0 then
	return 0.00
end if

ldc_intamount	= this.of_calculateintmonth( as_coopid, as_loantype, adc_fixrate, adtm_calintfrom, adtm_calintto, adc_principal )

return ldc_intamount
end function

public function decimal of_computeintmonth (string as_coopid, string as_loantype, string as_inttabcode, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception;dec		ldc_intamount
n_ds		lds_inttable

// ตรวจสอบ Parameter ที่ส่งเข้ามา
if date(adtm_calintfrom) > date(adtm_calintto) or adc_principal = 0 then
	return 0.00
end if

if isnull(as_inttabcode) or trim(as_inttabcode) = "" then
	return 0.00
end if

// ดึงตารางดอกเบี้ย ----------
this.of_getinteresttable( as_coopid, as_inttabcode, adtm_calintto, lds_inttable )

try
	ldc_intamount	= this.of_calculateintmonth( as_coopid, as_loantype, lds_inttable, adtm_calintfrom, adtm_calintto, adc_principal )
catch( Exception lthw_error )
	destroy( lds_inttable )
	throw lthw_error
end try

destroy( lds_inttable )

return ldc_intamount
end function

public function decimal of_calculateintmonth (string as_coopid, string as_loantype, decimal adc_fixrate, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception;dec		ldc_months , ldc_interestamt

// ถ้า argument ที่ส่งเข้ามาไม่ถูกต้อง
if adc_principal <= 0 or date(adtm_calintto) < date(adtm_calintfrom) or adc_fixrate = 0 then
	return 0
end if

ldc_months			= this.of_monthcount( as_coopid , as_loantype, adtm_calintfrom, adtm_calintto )

// เพิ่มเวลาหรือหักลดจากที่ Fix เข้ามา
ldc_months			= ldc_months + idc_intmthtimeinc

ldc_interestamt		= adc_principal * ( adc_fixrate / 100 )* ( ldc_months /12 )

// ปัดดอกเบี้ยตามหลักที่กำหนด
if ii_rdintdectype > 0 then
	ldc_interestamt	= this.of_roundinterest( ldc_interestamt, ii_rdintdectype, ii_rdintdecdigit )
end if

// ถ้าปัดสตางค์ตอนรวมทุกขั้นแล้ว
if ii_rdsatangtype > 0 then
	ldc_interestamt	= this.of_roundmoney( ldc_interestamt )
end if

return ldc_interestamt
end function

public function decimal of_calculateintmonth (string as_coopid, string as_loantype, n_ds ads_inttable, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception;string		ls_expr, ls_intspctabcode
integer	li_found , li_count , li_index
dec{2}	ldc_apvamt, ldc_intamt, ldc_inttotal , ldc_upperamt, ldc_loweramt
dec		ldc_tempprincipal , ldc_tempintamt , ldc_tempinterest , ldc_intrate , ldc_months , ldc_interestamt
datetime	ldtm_calintfrom, ldtm_calintto, ldtm_fromint

ldtm_calintfrom		= adtm_calintfrom

// ถ้า argument ที่ส่งเข้ามาไม่ถูกต้อง
if adc_principal <= 0 or date(adtm_calintto) < date(adtm_calintfrom) then
	return 0
end if

// ตรวจสอบว่ามี ตารางดอกเบี้ยหรือไม่
if not isvalid(ads_inttable) or (ads_inttable.rowcount() = 0) then
	ithw_exception.text	= "ไม่พบตารางดอกเบี้ยที่จะนำมาคำนวณดอกเบี้ยได้ ประเภทเงินกู้ "+as_loantype
	throw ithw_exception
end if

do while  date(ldtm_calintto) < date(adtm_calintto)
	ads_inttable.setfilter("")
	ads_inttable.filter()
	ads_inttable.setsort( "effective_date A, lower_amt A" )
	ads_inttable.sort()
	
	ls_expr		= " '" + string( ldtm_calintfrom, 'yyyy-mm-dd' ) + "' >= string( effective_date, 'yyyy-mm-dd' ) "
	li_found	= ads_inttable.find( ls_expr, ads_inttable.rowcount(), 0) 
	
	if li_found <= 0 then
		ithw_exception.text	= "ไม่พบตารางดอกเบี้ยสำหรับ ช่วงวันที่่ ("+string(ldtm_calintfrom, "dd/mm/yyyy" )+")"
		throw ithw_exception
	else
		ldtm_fromint	= ads_inttable.getitemdatetime( li_found, "effective_date" )
		ls_expr			= " '" + string( ldtm_fromint, "yyyy-mm-dd" ) + "' > string( effective_date, 'yyyy-mm-dd' ) "
		li_found			= ads_inttable.find( ls_expr, li_found, 0 )
		
		if li_found > 0 then
			ads_inttable.rowsdiscard( 1, li_found, primary! )
		end if

		ls_expr			= " string( effective_date, 'yyyy-mm-dd' ) >  '" + string( ldtm_calintfrom, "yyyy-mm-dd" ) + "'"
		li_found			= ads_inttable.find( ls_expr, 0, ads_inttable.rowcount() )
		
		if li_found > 0 then
			ldtm_calintto		= ads_inttable.getitemdatetime( li_found, "effective_date" )
			ldtm_calintto		= datetime(relativedate(date(ldtm_calintto), -1))
			ads_inttable.setfilter( "string( effective_date, 'yyyy-mm-dd' ) < '" + string(ldtm_calintto, 'yyyy-mm-dd' ) + "'" )
		else
			ldtm_calintto = adtm_calintto
			ads_inttable.setfilter( "string( effective_date, 'yyyy-mm-dd' ) <= '" + string(ldtm_calintto, 'yyyy-mm-dd' ) + "'" )
		end if
		
		ads_inttable.filter()
		
		if ads_inttable.rowcount() <= 0 then 
			ithw_exception.text	= "of_computeintmonthx(2)"
			throw ithw_exception
		end if

		ldc_tempprincipal	= adc_principal
		li_count				= ads_inttable.rowcount()
		
		ldc_tempintamt		= 0.00
		
		for li_index = 1 to li_count
			ldc_loweramt	= ads_inttable.getitemdecimal( li_index, "lower_amt" )
			ldc_upperamt	= ads_inttable.getitemdecimal( li_index, "upper_amt" )
			
			if adc_principal >= ldc_loweramt then
				if adc_principal > ldc_upperamt then
					ldc_tempprincipal = ldc_upperamt
				else
					ldc_tempprincipal = adc_principal
				end if
			else
				ithw_exception.text	= "of_computeintmonthx(3)"
				throw ithw_exception
			end if
				
			ldc_tempprincipal	= ldc_tempprincipal - ldc_loweramt
			ldc_intrate			= ads_inttable.getitemdecimal( li_index, "interest_rate" )
			ldc_months			= this.of_monthcount( as_coopid , as_loantype, ldtm_calintfrom, ldtm_calintto )
			
			// เพิ่มเวลาหรือหักลดจากที่ Fix เข้ามา
			ldc_months			= ldc_months + idc_intmthtimeinc
			
			ldc_tempinterest	= ldc_tempprincipal* ( ldc_intrate / 100 ) * ( ldc_months/12 )

			ldc_tempintamt		+= ldc_tempinterest
			
		next

		ldtm_calintfrom		= datetime(relativedate(date(ldtm_calintto), 1))
		ldc_interestamt		+= ldc_tempintamt
	end if
loop

// ปัดดอกเบี้ยตามหลักที่กำหนด
if ii_rdintdectype > 0 then
	ldc_interestamt	= this.of_roundinterest( ldc_interestamt, ii_rdintdectype, ii_rdintdecdigit )
end if

// ถ้าปัดสตางค์ตอนรวมทุกขั้นแล้ว
if ii_rdsatangtype > 0 then
	ldc_interestamt	= this.of_roundmoney( ldc_interestamt )
end if

return ldc_interestamt
end function

private function decimal of_monthcount (string as_coopid, string as_loantype, datetime adtm_startdate, datetime adtm_enddate);integer		li_notrcvdate, li_notpaydate, li_halfrcvdate, li_haftpaydate
integer		li_notrcvtype, li_notpaytype, li_halfrcvtype, li_halfpaytype
integer		li_dayintfrom, li_dayintto
integer		li_year, li_month, li_lastdayofmth
Integer		li_DaysInMonth[12] = {31,28,31,30,31,30,31,31,30,31,30,31}
boolean		lb_lyear
datetime		ldtm_lastdayofmthstart, ldtm_lastdayofmthend
date			ld_startdate, ld_enddate
dec			ldc_monthamt

ld_startdate		= date(adtm_startdate)
ld_enddate		= date(adtm_enddate)

li_dayintfrom	= day(ld_startdate)
li_dayintto		= day(ld_enddate)

// หาวันสิ้นเดือนของวันเริ่มคำนวณ
li_year			= year(ld_startdate)
li_month			= month(ld_startdate)

if mod( li_year, 4 ) = 0 then
	lb_lyear	= true
else
	lb_lyear	= false
end if

if li_month = 2 and lb_lyear then
	li_lastdayofmth	= 29
else
	li_lastdayofmth	= li_daysinmonth[li_month]
end if

ldtm_lastdayofmthstart	= datetime( date( li_year, li_month, li_lastdayofmth ) )

// หาวันสิ้นเดือนของวันที่คำนวณถึง
li_year			= year(ld_enddate)
li_month			= month(ld_enddate)

if mod( li_year, 4 ) = 0 then
	lb_lyear	= true
else
	lb_lyear	= false
end if

if li_month = 2 and lb_lyear then
	li_lastdayofmth	= 29
else
	li_lastdayofmth	= li_daysinmonth[li_month]
end if

ldtm_lastdayofmthend	= datetime( date( li_year, li_month, li_lastdayofmth ) )

// ดึง config ของการคิดดอกเบี้ยสิ้นเดือน
select		calintrcv_nottype, calintpay_nottype, calintrcv_halftype, calintpay_halftype,
			calintrcv_notdate, calintpay_notdate, calintrcv_halfdate, calintpay_halfdate
into		:li_notrcvtype, :li_notpaytype, :li_halfrcvtype, :li_halfpaytype,
			:li_notrcvdate, :li_notpaydate, :li_halfrcvdate, :li_haftpaydate
from		lnloantype
where	( coop_id = :as_coopid ) and
			( loantype_code = :as_loantype )
using itr_sqlca ;

// การรับเงินที่ไม่คิด ด/บ ถ้าเป็นการนับวันขึ้นมาจากสิ้นเดือน
if li_notrcvtype = 2 then
	li_notrcvdate	= day( date( ldtm_lastdayofmthstart ) ) - li_notrcvdate
end if

// การรับเงินที่คิด ด/บ ครึ่งเดือนถ้าเป็นการนับวันขึ้นมาจากสิ้นเดือน
if li_halfrcvtype = 2 then
	li_halfrcvdate	= day( date( ldtm_lastdayofmthstart ) ) - li_halfrcvdate
end if

// หาจำนวนเดือน
ldc_monthamt	= this.of_monthsafter(ld_startdate, ld_enddate)

// การเพิ่มลดจำนวนเดือนตาม config
if ld_startdate <> date(ldtm_lastdayofmthstart) then
	if li_notrcvtype = 0 or li_dayintfrom < li_notrcvdate then
		if li_halfrcvtype > 0 and li_dayintfrom >= li_halfrcvdate then
			ldc_monthamt	+= 0.5 
		else
			ldc_monthamt	++ 
		end if
	end if
end if
	
if ld_enddate <> date(ldtm_lastdayofmthend) then
	if li_notpaytype = 0 or li_dayintto > li_notpaydate then
		if li_halfpaytype > 0 and li_dayintto <= li_haftpaydate then
			ldc_monthamt	-= 0.5 
		end if
	end if
end if

return ldc_monthamt
end function

public function integer of_setintmthtimeincrease (decimal adc_inttimeincrease);if isnull( adc_inttimeincrease ) then
	adc_inttimeincrease	= 0
end if

idc_intmthtimeinc		= adc_inttimeincrease

return 1
end function

public function decimal of_computeinterest (n_ds ads_contract, n_ds ads_inttable, datetime adtm_calintto, long al_row) throws Exception;string		ls_continttabcode, ls_loantype, ls_contno, ls_contcoopid
string		ls_expr
integer	li_calintmethod, li_continttype, li_spcinttype, li_intsteptype
long		ll_ispccount, ll_ispcindex, ll_find
dec{2}	ldc_prnbal, ldc_apvamt, ldc_intamt
dec{4}	ldc_contintfixrate, ldc_contintincrease
dec		ldc_intallamt , ldc_intperiod
datetime	ldtm_calintfrom, ldtm_calintto , ldtm_tpcalintfrom , ldtm_tpcalintto

ls_contno				= ads_contract.object.loancontract_no[al_row]
ls_contcoopid			= ads_contract.object.coop_id[al_row]
ls_loantype				= ads_contract.object.loantype_code[al_row]
ls_continttabcode		= ads_contract.object.int_continttabcode[al_row]
li_calintmethod			= ads_contract.object.interest_method[al_row]
li_continttype			= ads_contract.object.int_continttype[al_row]
li_intsteptype			= ads_contract.object.int_intsteptype[al_row]
ldc_prnbal				= ads_contract.object.balance_value[al_row]
ldc_apvamt				= ads_contract.object.loanapprove_amt[al_row]
ldc_contintfixrate		= ads_contract.object.int_contintrate[al_row]
ldc_contintincrease	= ads_contract.object.int_contintincrease[al_row]
ldtm_tpcalintfrom		= ads_contract.object.lastcalint_date[al_row]
ldtm_tpcalintto			= adtm_calintto

if ldtm_tpcalintfrom > ldtm_tpcalintto then
	ldc_intperiod	= 0
	return ldc_intperiod
end if

ldc_intallamt			= 0

choose case li_continttype
	case 0	// ไม่คิดดอกเบี้ย
		ldc_intallamt	= 0
		
	case 1	// อัตราคงที่
		// รูปแบบการคิด ด/บ
		choose case li_calintmethod
			case 1	// รายวัน
				ldc_intallamt	= this.of_calculateinterest( ldc_contintfixrate, ldtm_tpcalintfrom, ldtm_tpcalintto, ldc_prnbal )
			case 2	// รายเดือน
				ldc_intallamt	= this.of_calculateintmonth( ls_contcoopid, ls_loantype, ldc_contintfixrate, ldtm_tpcalintfrom, ldtm_tpcalintto, ldc_prnbal )
		end choose

	case 2	// ตามตารางดอกเบี้ย
		// ดึงตาราง ด/บ
		this.of_getinteresttable( ls_contcoopid, ls_continttabcode, ldtm_tpcalintto, ads_inttable )
		
		// อัตราด/บเพิ่มลดพิเศษ
		this.of_setintincrease( ldc_contintincrease )
		
		// ดูประเภทการคิด ด/บ รายวัน, รายเดือน
		if li_calintmethod = 1 then
			
			try
				// ตรวจว่าดูอัตราด/บจากยอดอนุมัติหรือคงเหลือ
				if li_intsteptype = 2 then
					ldc_intallamt	= this.of_calculateinterest( ads_inttable, ldtm_tpcalintfrom, ldtm_tpcalintto, ldc_prnbal )
				else
					ldc_intallamt	= this.of_calculateinterest( ads_inttable, ldtm_tpcalintfrom, ldtm_tpcalintto, ldc_prnbal, ldc_apvamt )
				end if
			catch( Exception lthw_error )
				if isvalid(ads_inttable) then destroy ads_inttable
				throw lthw_error
			end try
		else
			// รายเดือน
			ldc_intallamt	= this.of_calculateintmonth( ls_contcoopid, ls_loantype, ads_inttable, ldtm_tpcalintfrom, ldtm_tpcalintto, ldc_prnbal )
		end if
		
	case 3	// อัตรา ด/บ เป็นช่วง
		ldtm_calintfrom	= ldtm_tpcalintfrom
		
		ll_ispccount	= ids_contintspc.retrieve( ls_contcoopid, ls_contno, ldtm_tpcalintto )
		
		if ll_ispccount = 0 then
			ldc_intallamt	= 0
		else
			// หาวันที่คิดด/บล่าสุดว่าอยู่ช่วงไหน
			ls_expr		= "'"+string( ldtm_calintfrom, 'yyyy-mm-dd' ) + "' >= string( effective_date, 'yyyy-mm-dd' )"
			ll_find		= ids_contintspc.find( ls_expr, ll_ispccount, 1 )		//  ค้นจากข้างล่างขึ้นมา จะค้นจากข้างบนลงล่างไม่ได้
			
			// ลบอัตรา ด/บ ของช่วงวันที่ที่ผ่านมาแล้ว
			if ll_find > 1 then
				ids_contintspc.rowsdiscard( 1, ll_find - 1, primary! )
			end if
			
			// เริ่มหาอัตราพิเศษ
			for ll_ispcindex = 1 to ids_contintspc.rowcount()
				
				if ll_ispcindex = ids_contintspc.rowcount() then
					ldtm_calintto		= ldtm_tpcalintto
				else
					ldtm_calintto		= ids_contintspc.getitemdatetime( ll_ispcindex + 1, "effective_date" )
				end if
				
				li_spcinttype				= ids_contintspc.getitemnumber( ll_ispcindex, "int_continttype" )
				ls_continttabcode		= ids_contintspc.getitemstring( ll_ispcindex, "int_continttabcode" )
				ldc_contintfixrate		= ids_contintspc.getitemdecimal( ll_ispcindex, "int_contintrate" )
				ldc_contintincrease	= ids_contintspc.getitemdecimal( ll_ispcindex, "int_contintincrease" )
				
				// อัตราด/บเพิ่มลดพิเศษ
				this.of_setintincrease( ldc_contintincrease )
				
				choose case li_spcinttype
					case 0	//	ไม่คิดดอกเบี้ย
						
						ldc_intamt = 0
						
					case 1	//	ตามอัตราที่กำหนด
						
						ldc_intamt	= this.of_calculateinterest( ldc_contintfixrate, ldtm_calintfrom, ldtm_calintto, ldc_prnbal )
					case 2	//	ตามตารางดอกเบี้ย
						
						try
							// ดึงตาราง ด/บ
							this.of_getinteresttable( ls_contcoopid, ls_continttabcode, ldtm_calintto, ads_inttable)
							
							// ตรวจว่าดูอัตราด/บจากยอดอนุมัติหรือคงเหลือ
							if li_intsteptype = 2 then
								ldc_intamt	= this.of_calculateinterest( ads_inttable, ldtm_calintfrom, ldtm_calintto, ldc_prnbal )
							else
								ldc_intamt	= this.of_calculateinterest( ads_inttable, ldtm_calintfrom, ldtm_calintto, ldc_prnbal, ldc_apvamt )
							end if
						catch( Exception lthw_intspc )
							if isvalid(ads_inttable) then destroy ads_inttable
						end try
				end choose
				
				ldtm_calintfrom		= ldtm_calintto
				ldc_intallamt		+= ldc_intamt
			next
		end if
	case 4, 5	// ตามอัตราดอกเบี้ยเงินฝากที่นำมาค้ำประกัน

		ldc_intallamt	= this.of_computeintdept( ads_contract, ldtm_tpcalintfrom, ldtm_tpcalintto, ldc_prnbal, al_row )
end choose

if ldc_intallamt > 0 then
	ldc_intperiod	= ldc_intallamt
else
	ldc_intperiod	= 0
end if

return ldc_intperiod
end function

protected function decimal of_computeintdept (n_ds ads_continfo, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal, long al_row);string		ls_dpaccno, ls_dpgroup, ls_dpintcode
string		ls_contno
long		ll_count
dec		ldc_intamount, ldc_intincrease, ldc_intrate, ldc_intstep, ldc_apvamt, ldc_dpbal
boolean	lb_error = false
datetime	ldtm_prnfixfrom, ldtm_prnfixto, ldtm_calintfrom, ldtm_calintto
n_ds		lds_inttable

ls_contno			= ads_continfo.getitemstring( al_row, "loancontract_no" )
ldc_intincrease		= ads_continfo.getitemdecimal( al_row, "int_contintincrease" )
ldc_apvamt			= ads_continfo.getitemdecimal( al_row, "loanapprove_amt" )

// หาก่อนว่าเป็นเงินฝากประเภทไหน
declare data_cur cursor for
select		lc.ref_collno, dt.deptgroup_code, dt.closebf_inttype, prncbal
from		lncontcoll lc, dpdeptmaster dm, dpdepttype dt
where	( lc.coop_id		= dm.coop_id )
and		( lc.ref_collno	= dm.deptaccount_no )
and		( dm.coop_id	= dt.coop_id )
and		( dm.depttype_code	= dt.depttype_code )
and		( lc.coop_id				= :is_coopcontrol )
and		( lc.loancontract_no	= :ls_contno )
and 		( lc.loancolltype_code	= '03' )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_dpaccno, :ls_dpgroup, :ls_dpintcode, :ldc_dpbal ;

if itr_sqlca.sqlcode <> 0 then
	lb_error		= true
	close data_cur ;
	goto objdestroy
end if

close data_cur ;

// ถ้าเป็นเงินฝากประจำ
if ls_dpgroup = "01" then
	
	ldc_intamount		= 0
	
	ldtm_calintfrom		= adtm_calintfrom
	
	declare int_cur cursor for 
	select		prnc_date, prncdue_date, interest_rate * 100 as interest_rate 
	from		dpdeptprncfixed 
	where	coop_id		= :is_coopcontrol
	and		deptaccount_no = :ls_dpaccno
	and		prncfixed_status = 1
	and		( :adtm_calintfrom between prnc_date and prncdue_date or :adtm_calintto between prnc_date and prncdue_date )
	order by	prnc_date
	using		itr_sqlca ;
	
	open int_cur ;
	fetch int_cur into :ldtm_prnfixfrom, :ldtm_prnfixto, :ldc_intrate ;
	
	do while itr_sqlca.sqlcode = 0
		if ldtm_prnfixto < adtm_calintto then
			ldtm_calintto	= ldtm_prnfixto
		else
			ldtm_calintto	= adtm_calintto
		end if
		
		ldc_intrate			= ldc_intrate + ldc_intincrease
		
		ldc_intstep			= this.of_calculateinterest( ldc_intrate, ldtm_calintfrom, ldtm_calintto, adc_principal )
		ldc_intamount		= ldc_intamount + ldc_intstep
		
		ldtm_calintfrom		= ldtm_calintto
		
		if ldtm_calintto >= adtm_calintto then
			exit
		end if
		
		fetch int_cur into :ldtm_prnfixfrom, :ldtm_prnfixto, :ldc_intrate ;
	loop
	close int_cur ;
else
	// ดึงตารางดอกเบี้ย ----------
	lds_inttable	= create n_ds
	lds_inttable.dataobject	= "d_loansrv_attrib_cfintdeptstep"
	lds_inttable.settransobject( itr_sqlca )
	lds_inttable.retrieve( is_coopcontrol, ls_dpintcode, adtm_calintto )
	
	lds_inttable.setsort( "effective_date A , lower_amt A" )
	lds_inttable.sort()
	
	ll_count		= lds_inttable.rowcount()
	
	if ll_count <= 0 then
		lb_error		= true
		goto objdestroy
	end if
	
	// อัตราด/บเพิ่มลดพิเศษ
	this.of_setintincrease( ldc_intincrease )

	try
		ldc_intamount	= this.of_calculateinterest( lds_inttable, adtm_calintfrom, adtm_calintto, adc_principal, ldc_dpbal )
	catch( Exception lthw_error )
		ithw_exception.text	= lthw_error.text
		lb_error					= true
	end try
	
end if

objdestroy:
destroy( lds_inttable )

if lb_error then
	ldc_intamount		= 0
end if

return ldc_intamount
end function

public function decimal of_roundinterest (decimal adc_intamt);return this.of_roundinterest( adc_intamt, ii_rdintdectype, ii_rdintdecdigit)
end function

on n_cst_loansrv_interest.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_loansrv_interest.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;// ประกาศ Throw สำหรับ Err
ithw_exception	= create Exception
end event
