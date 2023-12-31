$PBExportHeader$n_cst_error.sru
$PBExportComments$ส่วนบริการสำหรับข้อผิดพลาดต่างๆ ถูกรวมไว้ในคลาสพื้นฐานด้วย
forward
global type n_cst_error from nonvisualobject
end type
end forward

global type n_cst_error from nonvisualobject
end type
global n_cst_error n_cst_error

type variables

Protected:
String is_message = ""
ClassDefinition icd_parent

end variables

forward prototypes
public function string of_getmessage ()
public function integer of_seterror (powerobject apo_parentobject, string as_message)
public function str_error of_geterror ()
end prototypes

public function string of_getmessage ();return is_message

end function

public function integer of_seterror (powerobject apo_parentobject, string as_message);try
	is_message = as_message
	icd_parent = apo_parentobject.classdefinition
catch( Exception th )
	return -1
end try
return 1

end function

public function str_error of_geterror ();str_error lstr_err
lstr_err.errortext = is_message
return lstr_err
end function

on n_cst_error.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_error.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on
