$PBExportHeader$n_cst_doccontrolservice.sru
$PBExportComments$ส่วนบริการเลขที่เอกสาร
forward
global type n_cst_doccontrolservice from NonVisualObject
end type
end forward

/// <summary> ส่วนบริการเลขที่เอกสาร
/// </summary>
global type n_cst_doccontrolservice from NonVisualObject
end type
global n_cst_doccontrolservice n_cst_doccontrolservice

type variables
Public:
// - Common return value constants:
constant integer 		SUCCESS = 1
constant integer 		FAILURE = -1
constant integer 		NO_ACTION = 0
// - Continue/Prevent return value constants:
constant integer 		CONTINUE_ACTION = 1
constant integer 		PREVENT_ACTION = 0
//constant integer 		FAILURE = -1

transaction	itr_dbconnection
Exception	ithw_exception

string		is_coopcontrol
end variables

forward prototypes
public subroutine of_settrans (n_cst_dbconnectservice anv_db)
public function integer of_update (string as_coopid, string as_doccode, ref long al_lastdocno) throws Exception
public function integer of_open (ref string as_coopid, string as_doccode, ref long al_lastdocno, ref integer ai_doclength, ref string as_docprefix, ref string as_docformat, ref string as_docyear) throws Exception
public function integer of_new (string as_coopid, string as_doccode, ref long al_lastdocno, ref integer ai_doclength, ref string as_docprefix, ref string as_docformat, ref string as_docyear) throws Exception
public function string of_getnewdocno (string as_coopid, string as_doccode, string as_prefixcustom) throws Exception
public function string of_getnewdocno (string as_coopid, string as_doccode) throws Exception
public function integer of_add (string as_coopid, string as_doccode, string as_docdesc, long al_lastdocno, string as_docprefix, string as_doclength, string as_docformat, string as_docyear) throws Exception
public function string of_getnextdocno (string as_coopid, string as_doccode, string as_prefixcustom) throws Exception
public function string of_getnextdocno (string as_coopid, string as_doccode) throws Exception
public function string of_incrementalfanumeric (string as_alfanumeric, long al_increment)
public function integer of_delete (string as_coopid, string as_doccode) throws Exception
public function integer of_open (ref string as_coopid, string as_doccode, ref long al_lastdocno, ref integer ai_doclength, ref string as_docprefix, ref string as_docformat, ref string as_docyear, boolean ab_forupdate) throws Exception
end prototypes

public subroutine of_settrans (n_cst_dbconnectservice anv_db);this.itr_dbconnection = anv_db.itr_dbconnection

is_coopcontrol = anv_db.is_coopcontrol
end subroutine

public function integer of_update (string as_coopid, string as_doccode, ref long al_lastdocno) throws Exception;//  parameter check
as_doccode	= trim( as_doccode )
as_coopid	= trim( as_coopid )

if isnull( as_doccode ) or as_doccode = "" then
	ithw_exception.text	+= "ไม่พบเลขที่เอกสารที่จะทำการปรับปรุงเลขที่ล่าสุดได้ "
	throw ithw_exception
end if

if isnull( as_coopid ) or as_coopid = "" then
	ithw_exception.text	+= "ไม่พบสาขาของเลขที่เอกสารที่จะทำการปรับปรุงเลขที่ล่าสุดได้"
	throw ithw_exception
end if

update	cmdocumentcontrol
set			last_documentno	= :al_lastdocno
where	( document_code	= :as_doccode ) and
			( coop_id				= :as_coopid )
using		itr_dbconnection;

if itr_dbconnection.sqlcode <> 0  then
	ithw_exception.text	+= "ไม่สามารถปรับปรุงเลขที่เอกสารล่าสุดได้ " + itr_dbconnection.sqlerrtext
	throw ithw_exception
end if

return SUCCESS
end function

public function integer of_open (ref string as_coopid, string as_doccode, ref long al_lastdocno, ref integer ai_doclength, ref string as_docprefix, ref string as_docformat, ref string as_docyear) throws Exception;return this.of_open( as_coopid, as_doccode, al_lastdocno, ai_doclength, as_docprefix, as_docformat, as_docyear, false )
end function

public function integer of_new (string as_coopid, string as_doccode, ref long al_lastdocno, ref integer ai_doclength, ref string as_docprefix, ref string as_docformat, ref string as_docyear) throws Exception;this.of_open( as_coopid, as_doccode, al_lastdocno, ai_doclength, as_docprefix, as_docformat, as_docyear, true )

al_lastdocno	= al_lastdocno + 1
	
this.of_update( as_coopid, as_doccode, al_lastdocno )

return 1
end function

public function string of_getnewdocno (string as_coopid, string as_doccode, string as_prefixcustom) throws Exception;string			ls_docprefix, ls_docformat, ls_docyear
string			ls_newdocno, ls_fillzero
long			ll_lastdocno
integer		li_doclength, li_lenrunning, li_lenlastdocno

as_doccode	= trim( as_doccode )

this.of_new( as_coopid, as_doccode, ll_lastdocno, li_doclength, ls_docprefix, ls_docformat, ls_docyear )

// ถ้าไม่มีการกำหนดรูปแบบเลขที่เอกสาร
if ls_docformat = "" then
	
	// ถ้าความยาวของเลขที่เอกสารไม่ได้กำหนดหรือกำหนดต่ำกว่า 0
	if li_doclength <= 0 then
		li_doclength	= 10
	end if
	
	// จำนวนหลักของ Running Number
	li_lenrunning	= li_doclength - len( ls_docprefix )
	
	// ความยาวของ Running number ล่าสุด
	li_lenlastdocno	= len( string( ll_lastdocno ) )
	
	if li_lenlastdocno > li_lenrunning then
		ls_fillzero	= ""
	else
		ls_fillzero	= fill( "0", li_lenrunning - li_lenlastdocno )
	end if
	
	ls_newdocno	= ls_docprefix + ls_fillzero + string( ll_lastdocno )
	
else
	// Y ปีเอกสาร, R เลขที running, B สาขาที่ส่งเข้ามา, P คำนำหน้าที่กำหนดไว้ที่ doccontrol, C คำนำหน้าที่กำหนดเองโดยคนเรียก Srv
	integer	li_count, li_index, li_num
	string		ls_value[], ls_char[] = {"Y","R","P","C","B"}
	string		ls_tempt, ls_tempv
	n_cst_stringservice	lnv_string
	
	lnv_string	= create n_cst_stringservice
	
	ls_newdocno	= trim( ls_docformat )
	
	ls_value[1]	= trim( ls_docyear )
	ls_value[2]	= string( ll_lastdocno )
	ls_value[3]	= trim( ls_docprefix )
	ls_value[4]	= trim( as_prefixcustom )
	ls_value[5]	= trim( as_coopid )
	
	li_count	= upperbound(ls_char[])
	
	for li_index = 1 to li_count
		li_num	 	= lnv_string.of_countoccurrences ( ls_docformat, ls_char[li_index] )
		
		if li_num = 0 then continue
		
		ls_tempt			= fill( ls_char[li_index], li_num )
		ls_tempv			= right("0000000000"+ls_value[li_index], li_num)
		ls_newdocno	= lnv_string.of_globalreplace( ls_newdocno, ls_tempt, ls_tempv )
	next

	destroy( lnv_string )

end if

return ls_newdocno
end function

public function string of_getnewdocno (string as_coopid, string as_doccode) throws Exception;return this.of_getnewdocno( as_coopid, as_doccode, "" )
end function

public function integer of_add (string as_coopid, string as_doccode, string as_docdesc, long al_lastdocno, string as_docprefix, string as_doclength, string as_docformat, string as_docyear) throws Exception;
insert into cmdocumentcontrol
			( document_code, coop_id, document_name, last_documentno, document_prefix, document_length, document_format, document_year )
values	( :as_doccode, :as_coopid, :as_docdesc, :al_lastdocno, :as_docprefix, :as_doclength, :as_docformat, :as_docyear )
using	itr_dbconnection ;

if itr_dbconnection.sqlcode <> 0  then
	ithw_exception.text	+= "ไม่สามารถเพิ่มรายการเอกสารใหม่ได้ " + itr_dbconnection.sqlerrtext
	throw ithw_exception
end if

return SUCCESS
end function

public function string of_getnextdocno (string as_coopid, string as_doccode, string as_prefixcustom) throws Exception;string			ls_docprefix, ls_docformat, ls_docyear
string			ls_nextdocno, ls_fillzero
long			ll_lastdocno
integer		li_doclength, li_lenrunning, li_lenlastdocno

as_doccode	= trim( as_doccode )

// ไม่มีการขยับเลขที่เอกสารเป็นแค่ดูเฉยๆ ว่าเลขถัดไปเป็นเลขอะไร
this.of_open( as_coopid, as_doccode, ll_lastdocno, li_doclength, ls_docprefix, ls_docformat, ls_docyear )

ll_lastdocno	= ll_lastdocno + 1

// ถ้าไม่มีการกำหนดรูปแบบเลขที่เอกสาร
if ls_docformat = "" then
	
	// ถ้าความยาวของเลขที่เอกสารไม่ได้กำหนดหรือกำหนดต่ำกว่า 0
	if li_doclength <= 0 then
		li_doclength	= 10
	end if
	
	// จำนวนหลักของ Running Number
	li_lenrunning	= li_doclength - len( ls_docprefix )
	
	// ความยาวของ Running number ล่าสุด
	li_lenlastdocno	= len( string( ll_lastdocno ) )
	
	if li_lenlastdocno > li_lenrunning then
		ls_fillzero	= ""
	else
		ls_fillzero	= fill( "0", li_lenrunning - li_lenlastdocno )
	end if
	
	ls_nextdocno	= ls_docprefix + ls_fillzero + string( ll_lastdocno )
	
else
	// Y ปีเอกสาร, R เลขที running, B สาขาที่ส่งเข้ามา, P คำนำหน้าที่กำหนดไว้ที่ doccontrol, C คำนำหน้าที่กำหนดเองโดยคนเรียก Srv
	integer	li_count, li_index, li_num
	string		ls_value[], ls_char[] = {"Y","R","P","C","B"}
	string		ls_tempt, ls_tempv
	n_cst_stringservice	lnv_string
	
	lnv_string		= create n_cst_stringservice
	
	ls_nextdocno	= trim( ls_docformat )
	
	ls_value[1]		= trim( ls_docyear )
	ls_value[2]		= string( ll_lastdocno )
	ls_value[3]		= trim( ls_docprefix )
	ls_value[4]		= trim( as_prefixcustom )
	ls_value[5]		= trim( as_coopid )
	
	li_count	= upperbound(ls_char[])
	
	for li_index = 1 to li_count
		li_num	 		= lnv_string.of_countoccurrences ( ls_docformat, ls_char[li_index] )
		
		if li_num = 0 then continue
		
		ls_tempt			= fill( ls_char[li_index], li_num )
		ls_tempv			= right("0000000000"+ls_value[li_index], li_num)
		ls_nextdocno	= lnv_string.of_globalreplace( ls_nextdocno, ls_tempt, ls_tempv )
	next

	destroy( lnv_string )

end if

return ls_nextdocno
end function

public function string of_getnextdocno (string as_coopid, string as_doccode) throws Exception;return this.of_getnextdocno( as_coopid, as_doccode, "" )
end function

public function string of_incrementalfanumeric (string as_alfanumeric, long al_increment);string	ls_numeric_block[]
char	lc_pointto_alfanumeric[]
int		li_block_index, li_block_count, li_alfanum_index, li_alfanum_count
int		li_block_size[]
int		li_block_start[]

// initial for increament
lc_pointto_alfanumeric	= as_alfanumeric
li_alfanum_count			= len( as_alfanumeric )

for li_alfanum_index = 1 to li_alfanum_count
	
	if not isnumber( lc_pointto_alfanumeric[ li_alfanum_index ]) then
		// find first index numeric character
		int			li_index
		boolean	lb_found_numeric
		
		lb_found_numeric	= false
		
		for li_index = li_alfanum_index to li_alfanum_count
			if isnumber( lc_pointto_alfanumeric[ li_index ] ) then 
				lb_found_numeric	= true
				li_alfanum_index	= li_index - 1
				li_block_count++
				li_block_start[ li_block_count ]		= li_alfanum_index + 1
				if lb_found_numeric then exit // this for
			end if
		next
		
		if not lb_found_numeric then exit // first for
		
	else
		if li_block_count=0 then
			// first character is number
			li_block_count						=1
			li_block_start[ li_block_count ]	= 1
		end if
		
		lb_found_numeric	= false
		li_block_size[ li_block_count ] ++
		ls_numeric_block[ li_block_count ] = ls_numeric_block[ li_block_count ] + lc_pointto_alfanumeric[ li_alfanum_index ]
	end if
next

string ls_hold_incremented_value

for li_block_index = li_block_count to 1 step -1
	ls_hold_incremented_value			= string( long( ls_numeric_block[li_block_index] ) + al_increment )
	ls_numeric_block[li_block_index]	= right( fill( '0', li_block_size[li_block_index] )+ls_hold_incremented_value, li_block_size[li_block_index] )
	as_alfanumeric 						= replace( as_alfanumeric, li_block_start[li_block_index], li_block_size[li_block_index], ls_numeric_block[li_block_index] )

	// check for overflow
	if len( ls_hold_incremented_value  ) > li_block_size[li_block_index] then
		// left value is
		al_increment = long( left(ls_hold_incremented_value, len(ls_hold_incremented_value) - li_block_size[li_block_index] ) )
	else
		al_increment=0
	end if
	
	if al_increment <= 0 then exit
	
next

// if any error, or not need to increment
return as_alfanumeric
end function

public function integer of_delete (string as_coopid, string as_doccode) throws Exception;delete from cmdocumentcontrol
where	( document_code	= :as_doccode ) and
			( coop_id				= :as_coopid )
using		itr_dbconnection ;

if itr_dbconnection.sqlcode <> 0  then
	ithw_exception.text	+= "ไม่สามารถลบรายการเอกสารได้ " + itr_dbconnection.sqlerrtext
	throw ithw_exception
end if

return SUCCESS
end function

public function integer of_open (ref string as_coopid, string as_doccode, ref long al_lastdocno, ref integer ai_doclength, ref string as_docprefix, ref string as_docformat, ref string as_docyear, boolean ab_forupdate) throws Exception;//  parameter check
as_doccode = trim(as_doccode)
as_coopid = trim(as_coopid)

if isnull(as_doccode) or (len(as_doccode) = 0) then
	ithw_exception.text += "ไม่มีรหัสเอกสาร (เป็นค่าว่าง) กรุณาตรวจสอบ"
	throw ithw_exception
end if

if isnull(as_coopid) or as_coopid = "" then
	ithw_exception.text += "ไม่มีรหัสสาขา (เป็นค่าว่าง) กรุณาตรวจสอบ"
	throw ithw_exception
end if

integer li_count = 0;
select count(1)
into :li_count
from cmdocumentcontrol
where (document_code = :as_doccode) and
(coop_id = :as_coopid)
using itr_dbconnection;

if li_count > 0 then
		
	if ab_forupdate then
		select last_documentno, document_length, document_prefix, document_format, document_year
		into :al_lastdocno, :ai_doclength, :as_docprefix, :as_docformat, :as_docyear
		from cmdocumentcontrol
		where (document_code = :as_doccode) and
		(coop_id = :as_coopid)
		for update of last_documentno
		using itr_dbconnection;
	else
		select last_documentno, document_length, document_prefix, document_format, document_year
		into :al_lastdocno, :ai_doclength, :as_docprefix, :as_docformat, :as_docyear
		from cmdocumentcontrol
		where (document_code = :as_doccode) and
		(coop_id = :as_coopid)
		using itr_dbconnection;
	
	end if
else
	// หาไม่เจอ
	// ถ้าไม่ใช่สำนักงานใหญ่ก็ลองหาจากสำนักงานใหญ่
	if as_coopid <> is_coopcontrol then
		if ab_forupdate then
			select last_documentno, document_length, document_prefix, document_format, document_year
			into :al_lastdocno, :ai_doclength, :as_docprefix, :as_docformat, :as_docyear
			from cmdocumentcontrol
			where (document_code = :as_doccode) and
			(coop_id = :is_coopcontrol)
			for update of last_documentno
			using itr_dbconnection;
		else
			select last_documentno, document_length, document_prefix, document_format, document_year
			into :al_lastdocno, :ai_doclength, :as_docprefix, :as_docformat, :as_docyear
			from cmdocumentcontrol
			where (document_code = :as_doccode) and
			and (coop_id = :is_coopcontrol)
			using itr_dbconnection;
		end if
		
		if itr_dbconnection.sqlcode <> 0 then
			ithw_exception.text += "ไม่สามารถดึงเลขที่เอกสาร รหัส " + as_doccode + " สาขา " + as_coopid + " ได้ " + itr_dbconnection.sqlerrtext
			throw ithw_exception
		end if
		
		as_coopid = is_coopcontrol
	else
		ithw_exception.text += "ไม่สามารถดึงเลขที่เอกสาร รหัส " + as_doccode + " สาขา " + as_coopid + " ได้ " + itr_dbconnection.sqlerrtext
		throw ithw_exception
	end if
end if

if isnull(as_docprefix) then as_docprefix = ""
if isnull(as_docformat) then as_docformat = ""

if isnull(al_lastdocno) then al_lastdocno = 0
if isnull(ai_doclength) then ai_doclength = 0

as_docprefix = trim(as_docprefix)
as_docformat = trim(as_docformat)

return SUCCESS
end function

on n_cst_doccontrolservice.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_doccontrolservice.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ithw_exception	= create Exception
end event
