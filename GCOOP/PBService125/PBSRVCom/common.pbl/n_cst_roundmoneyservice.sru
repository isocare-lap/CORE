$PBExportHeader$n_cst_roundmoneyservice.sru
$PBExportComments$สำหรับจัดการปัดเศษ
forward
global type n_cst_roundmoneyservice from nonvisualobject
end type
end forward

global type n_cst_roundmoneyservice from nonvisualobject
end type
global n_cst_roundmoneyservice n_cst_roundmoneyservice

type variables

PUBLIC:

/*สถานะการทำงาน*/
CONSTANT INTEGER STATUS_RUNNING = 8		//กำลังทำงานอยู่.
CONSTANT INTEGER STATUS_SUCCESS = 1		//ทำงานเสร็จแล้ว และเรียบร้อยดี.
CONSTANT INTEGER STATUS_FAILURE = -1		//ทำงานเสร็จแล้ว แต่ล้มเหลวไม่ประสบความสำเร็จ.
CONSTANT INTEGER STATUS_STOP = 0			//ถูกสั่งหยุดการทำงาน.

str_progress istr_progress	//สถานะและความคืบหน้าการประมวลผล.

transaction	itr_sqlca
Exception	ithw_exception

n_cst_dbconnectservice		inv_transection

PROTECTED:

string is_satangtyp , is_roundtyp
integer ii_trnposamt , ii_rdposamt
boolean ib_stop = false		//คำสั่งหยุดการทำงาน ซึ่งจะมีผลโดยตรงกับสถานะการทำงานใน progress struct.ถูกเปลี่ยนค่าด้วยฟังชั่น of_stop_process.ตรวจสอบค่าด้วยฟังชั่น of_is_stop. 
end variables

forward prototypes
public function decimal of_round_money (ref decimal adc_money) throws Exception
public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans)
public function integer of_set_satangtype (string as_satangtyp)
public function integer of_set_truncate_pos (integer ai_trnposamt)
public function integer of_set_roundtype (string as_rdtype)
public function integer of_set_round_pos (integer ai_rdposamt)
public function integer of_set_constant (string as_coopid, string as_applgrp, string as_function)
public function integer of_get_round_pos ()
public function string of_get_roundtype ()
public function string of_get_satangtype ()
public function integer of_get_truncate_pos ()
public function decimal of_round_pos (ref decimal adc_money)
end prototypes

public function decimal of_round_money (ref decimal adc_money) throws Exception;/*****************************************************
<description>
	การปัดจำนวนเงิน(สตางค์)
</description>

<arguments>
	adc_money			Decimal		จำนวนเงินที่ต้องการเปลี่ยน
	ai_rdsatangtype	Integer		ประเภทการปัดสตางค์
											0 : ไม่ปัด
											10 : ปัดขึ้นเต็ม 5 สตางค์
											11 : ปัดขึ้นเต็ม 10 สตางค์
											12 : ปัดขึ้นเต็ม 25 สตางค์ 
											13 : ปัดขึ้นเต็ม 50 สตางค์
											14 : ปัดขึ้นเต็ม 1 บาท
											49 : ปัดเต็ม 1 บาท แบบ5/4
											50 : ปัดลงเต็ม 5 สตางค์
											51 : ปัดลงเต็ม 10 สตางค์
											52 : ปัดลงเต็ม 25 สตางค์
											53 : ปัดลงเต็ม 50 สตางค์
											54 : ปัดลงเต็ม 1 บาท
											99 : ปัดตามตารางปัดเศษ
</arguments> 

<return> 
	Decimal	= ยอดเงินที่ปัดแล้ว
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 01/02/2012 by Godji
</usage> 
*******************************************************/
integer		li_index
dec{2}		ldc_integer, ldc_rdamt, ldc_facvalue, ldc_point1, ldc_point2

adc_money		= truncate( adc_money, ii_trnposamt )

for li_index = ii_trnposamt to ii_rdposamt step -1
	adc_money		= round( adc_money , li_index )
next

ldc_integer		= truncate( adc_money, 0 )
ldc_facvalue		= adc_money - ldc_integer

ldc_point1		= truncate( ldc_facvalue, 1 )
ldc_point2		= ldc_facvalue - ldc_point1

choose case is_satangtyp
	case "00"
		return adc_money
	case "10"	// ปัดขึ้นเต็ม 5 สตางค์
		
		choose case ldc_point2
			case 0.00, 0.05
				return adc_money
				
			case 0.01 to 0.04
				ldc_point2	= 0.05
			case 0.06 to 0.09
				ldc_point2	= 0.1
		end choose
		
		ldc_rdamt	= ldc_point1 + ldc_point2
		
	case "11"	// ปัดขึ้นเต็ม 10 สตางค์
		if ldc_point2 = 0.00 then
			return adc_money
		else
			ldc_point2		= 0.1
		end if
		
		ldc_rdamt	= ldc_point1 + ldc_point2
		
	case "12"	// ปัดขึ้นเต็ม 25 สตางค์ 
		
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
	
	case "13"	// ปัดขึ้นเต็ม 50 สตางค์ 
		
		choose case ldc_facvalue
			case 0.01 to 0.50
				ldc_rdamt	= 0.50
			case 0.51 to 0.99
				ldc_rdamt	= 1
			case else
				ldc_rdamt	= 0
		end choose
	
	case "14"	// ปัดขึ้นเต็ม 1 บาท
		if ldc_facvalue > 0.00 then
			ldc_rdamt	= 1
		else
			ldc_rdamt	= 0
		end if
	case "48"	// ปัดแบบ 5/4 เต็ม 5 สตางค์
		choose case ldc_point2
			case 0.00 to 0.04
				ldc_point2	= 0.00
			case 0.06 to 0.09
				ldc_point2	= 0.10
			case else
				ldc_point2	= 0.05
		end choose
		
		ldc_rdamt	= ldc_point1 + ldc_point2
	case "49"	// ปัดแบบ 5/4 เต็ม1บาท ต่ำกว่า 50 ปัดทิ้ง ตั้งแต่ 50 ขี้นไป ปัดเต็มบาท
		choose case ldc_facvalue
			case 0.01 to 0.49
				ldc_rdamt	= 0.00
			case 0.50 to 0.99
				ldc_rdamt	= 1
			case else
				ldc_rdamt	= 0
		end choose
	case "50"	// ปัดลงเต็ม 5 สตางค์
		
		choose case ldc_point2
			case 0.00, 0.05
				return adc_money
				
			case 0.01 to 0.04
				ldc_point2	= 0.00
			case 0.06 to 0.09
				ldc_point2	= 0.05
		end choose
		
		ldc_rdamt	= ldc_point1 + ldc_point2
		
	case "51"	// ปัดลงเต็ม 10 สตางค์
		if ldc_point2 = 0.00 then
			return adc_money
		else
			ldc_point2		= 0.00
		end if
		
		ldc_rdamt	= ldc_point1 + ldc_point2
		
	case "52"	// ปัดลงเต็ม 25 สตางค์ 
		
		choose case ldc_facvalue
			case 0.01 to 0.25
				ldc_rdamt	= 0.00
			case 0.26 to 0.50
				ldc_rdamt	= 0.25
			case 0.51 to 0.75
				ldc_rdamt	= 0.50
			case 0.76 to 0.99
				ldc_rdamt	= 0.75
			case else
				ldc_rdamt	= 0
		end choose
	
	case "53"	// ปัดลงเต็ม 50 สตางค์ 
		
		choose case ldc_facvalue
			case 0.01 to 0.50
				ldc_rdamt	= 0.00
			case 0.51 to 0.99
				ldc_rdamt	= 0.50
			case else
				ldc_rdamt	= 0
		end choose
	
	case "54"	// ปัดลงเต็ม 1 บาท
		ldc_rdamt	= 0

//	case 99	// ปัดตามตารางการปัด
//		li_find	= ids_roundfactor.find( "factor_code = '"+is_rdsatangtab+"' and factor_step >= "+string( ldc_facvalue, "0.00" ), 1, ids_roundfactor.rowcount() )
//		if li_find <= 0 then
//			return adc_money
//		end if
//		
//		ldc_rdamt	= ids_roundfactor.getitemdecimal( li_find, "round_amt" )
	case else
		ldc_rdamt	= ldc_facvalue
end choose

ldc_integer	= ldc_integer + ldc_rdamt

return ldc_integer
end function

public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans);itr_sqlca = anv_dbtrans.itr_dbconnection

if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection = create n_cst_dbconnectservice
	inv_transection = anv_dbtrans
end if

return 1
end function

public function integer of_set_satangtype (string as_satangtyp);//ประเภทการปัดสตางค์
//00 : ไม่ปัด
//10 : ปัดขึ้นเต็ม 5 สตางค์
//11 : ปัดขึ้นเต็ม 10 สตางค์
//12 : ปัดขึ้นเต็ม 25 สตางค์ 
//13 : ปัดขึ้นเต็ม 50 สตางค์
//14 : ปัดขึ้นเต็ม 1 บาท
//50 : ปัดลงเต็ม 5 สตางค์
//51 : ปัดลงเต็ม 10 สตางค์
//52 : ปัดลงเต็ม 25 สตางค์
//53 : ปัดลงเต็ม 50 สตางค์
//54 : ปัดลงเต็ม 1 บาท
is_satangtyp = as_satangtyp

return 1
end function

public function integer of_set_truncate_pos (integer ai_trnposamt);// ใช้ทศนิยมถึงหลักที่เท่าไหร่ 
// ex 19.4999999 
// ai_trnposamt = 2 จะได้ค่า 19.49
ii_trnposamt		= ai_trnposamt
return 1
end function

public function integer of_set_roundtype (string as_rdtype);// วิธีการปัดเศษ
// 1 : ปัดแต่ละขั้น
// 2 : รวมแล้วปัด
is_roundtyp = as_rdtype
return 1
end function

public function integer of_set_round_pos (integer ai_rdposamt);// ตำแหน่งที่ปัด 5/4 ถึง
// ex 19.4999999 
// ai_trnposamt = 5 จะได้ค่า 19.49499
// ai_rdposamt = 2 จะได้ค่า 19.50
ii_rdposamt		= ai_rdposamt
return 1
end function

public function integer of_set_constant (string as_coopid, string as_applgrp, string as_function);select satang_type , truncate_pos_amt , round_type , round_pos_amt
into :is_satangtyp , :ii_trnposamt , :is_roundtyp , :ii_rdposamt
from (
	select satang_type , truncate_pos_amt , round_type , round_pos_amt , 1 as sort
	from cmroundmoney
	where coop_id = :as_coopid
	and applgroup_code = :as_applgrp
	and function_code = 'ALL'
	and use_flag = 1
	union
	select satang_type , truncate_pos_amt , round_type , round_pos_amt , 2 as sort
	from cmroundmoney
	where coop_id = :as_coopid
	and applgroup_code = :as_applgrp
	and function_code = :as_function
	and use_flag = 1
) cmrd
where rownum = 1
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	// default
	is_satangtyp		= "00"	// ไม่ปัดเศษ
	ii_trnposamt		= 3		// ใช้ทศนิยมหลักที่ 3
	is_roundtyp		= "2"		// รวมหมดถึงปัด
	ii_rdposamt		= 2		// ปัดถึงทศนิยมหลักที่ 2
end if

return 1
end function

public function integer of_get_round_pos ();// ตำแหน่งที่ปัด 5/4 ถึง
// ex 19.4999999 
// ai_trnposamt = 5 จะได้ค่า 19.49499
// ai_rdposamt = 2 จะได้ค่า 19.50
return ii_rdposamt
end function

public function string of_get_roundtype ();// วิธีการปัดเศษ
// 1 : ปัดแต่ละขั้น
// 2 : รวมแล้วปัด
return is_roundtyp
end function

public function string of_get_satangtype ();//ประเภทการปัดสตางค์
//00 : ไม่ปัด
//10 : ปัดขึ้นเต็ม 5 สตางค์
//11 : ปัดขึ้นเต็ม 10 สตางค์
//12 : ปัดขึ้นเต็ม 25 สตางค์ 
//13 : ปัดขึ้นเต็ม 50 สตางค์
//14 : ปัดขึ้นเต็ม 1 บาท
//50 : ปัดลงเต็ม 5 สตางค์
//51 : ปัดลงเต็ม 10 สตางค์
//52 : ปัดลงเต็ม 25 สตางค์
//53 : ปัดลงเต็ม 50 สตางค์
//54 : ปัดลงเต็ม 1 บาท

return is_satangtyp
end function

public function integer of_get_truncate_pos ();// ใช้ทศนิยมถึงหลักที่เท่าไหร่ 
// ex 19.4999999 
// ai_trnposamt = 2 จะได้ค่า 19.49
return ii_trnposamt
end function

public function decimal of_round_pos (ref decimal adc_money);integer li_index

adc_money		= truncate( adc_money, ii_trnposamt )

for li_index = ii_trnposamt to ii_rdposamt step -1
	adc_money		= round( adc_money , li_index )
next

return adc_money
end function

on n_cst_roundmoneyservice.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_roundmoneyservice.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;
ithw_exception = create Exception
end event

event destructor;if isvalid( ithw_exception ) then destroy ithw_exception

end event

