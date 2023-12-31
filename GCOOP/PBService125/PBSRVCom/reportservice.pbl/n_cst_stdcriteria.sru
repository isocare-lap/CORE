$PBExportHeader$n_cst_stdcriteria.sru
$PBExportComments$Standard Criteria - ชุด Criteria มาตรฐานในการส่งผ่านข้อมูลระหว่าง PBService <--> WebService <--> WebUI
forward
global type n_cst_stdcriteria from nonvisualobject
end type
end forward

global type n_cst_stdcriteria from nonvisualobject
end type
global n_cst_stdcriteria n_cst_stdcriteria

type variables

constant integer ARGTYPE_STRING = 1
constant integer ARGTYPE_NUMBER = 2
constant integer ARGTYPE_DATETIME = 3

datastore ids_criteria

end variables

forward prototypes
public function integer of_setxml (string axml_criteria)
public function any of_getargvalue (integer ai_argindex)
public function string of_getargstring (integer ai_argindex)
public function double of_getargnumber (integer ai_argindex)
public function datetime of_getargdatetime (integer ai_argindex)
public function integer of_argcount ()
end prototypes

public function integer of_setxml (string axml_criteria);//Import Criteria DatawindowXML
ids_criteria = create datastore
ids_criteria.dataobject = "d_print_stdcriteria"
try
	integer li_imp
	li_imp = ids_criteria.importstring( XML!, axml_criteria )
	if( li_imp < 0 )then
		return li_imp
	end if
catch ( Throwable th )
	return -1
end try

return 1

end function

public function any of_getargvalue (integer ai_argindex);//argument to any variable
integer li_type
string ls_value
any la_value
if( ai_argindex <= 0 or ai_argindex > ids_criteria.rowcount() )Then
	setnull( la_value )
	return la_value
end if
li_type = ids_criteria.getitemnumber( ai_argindex, "argument_type" )
ls_value = ids_criteria.getitemstring( ai_argindex, "argument_value" )
choose case li_type
	case ARGTYPE_STRING
		la_value = ls_value
	case ARGTYPE_NUMBER
		la_value = double( ls_value )
	case ARGTYPE_DATETIME
		la_value = datetime( ls_value )
end choose
return la_value

end function

public function string of_getargstring (integer ai_argindex);//argument to string
integer li_type
string ls_value
if( ai_argindex <= 0 or ai_argindex > ids_criteria.rowcount() )Then
	setnull( ls_value )
	return ls_value
end if
li_type = ids_criteria.getitemnumber( ai_argindex, "argument_type" )
ls_value = ids_criteria.getitemstring( ai_argindex, "argument_value" )
return ls_value

end function

public function double of_getargnumber (integer ai_argindex);//argument to double called as number
integer li_type
string ls_value
double ldb_value
if( ai_argindex <= 0 or ai_argindex > ids_criteria.rowcount() )Then
	setnull( ldb_value )
	return ldb_value
end if
li_type = ids_criteria.getitemnumber( ai_argindex, "argument_type" )
if( li_type = ARGTYPE_NUMBER )then
	try
		ldb_value = double( ids_criteria.getitemstring( ai_argindex, "argument_value" ) )
	catch ( Throwable th )
		setnull( ldb_value )
	end try
	return ldb_value
else
	setnull( ldb_value )
	return ldb_value
end if


end function

public function datetime of_getargdatetime (integer ai_argindex);//argument to datetime
integer li_type
string ls_value
datetime ldtm_value
if( ai_argindex <= 0 or ai_argindex > ids_criteria.rowcount() )Then
	setnull( ldtm_value )
	return ldtm_value
end if
li_type = ids_criteria.getitemnumber( ai_argindex, "argument_type" )
if( li_type = ARGTYPE_DATETIME )then
	try
		ldtm_value = datetime( ids_criteria.getitemstring( ai_argindex, "argument_value" ) )
	catch ( Throwable th )
		setnull( ldtm_value )
	end try
	return ldtm_value
else
	setnull( ldtm_value )
	return ldtm_value
end if

end function

public function integer of_argcount ();if( isvalid( ids_criteria ) )then
	return ids_criteria.rowcount( )
else
	return 0
end if
end function

on n_cst_stdcriteria.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_stdcriteria.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

