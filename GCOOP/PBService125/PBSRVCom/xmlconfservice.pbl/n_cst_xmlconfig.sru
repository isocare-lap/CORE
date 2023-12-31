$PBExportHeader$n_cst_xmlconfig.sru
$PBExportComments$XML Configuration Service
forward
global type n_cst_xmlconfig from n_cst_base
end type
end forward

global type n_cst_xmlconfig from n_cst_base
end type
global n_cst_xmlconfig n_cst_xmlconfig

type variables
Public:
string XML_CONSTMAP = "" //"C:\GCOOP_ALL\CEN\GCOOP\XMLConfig\xmlconf.constmap.xml"
string XML_CODEMAP = "" //"C:\GCOOP_ALL\CEN\GCOOP\XMLConfig\xmlconf.codemap.xml"
string XML_PATH = "" //"C:\GCOOP_ALL\CEN\GCOOP\XMLConfig\"

Protected:
String is_configcode
String is_xmlname
Datastore ids_config

end variables

forward prototypes
public function integer of_loadxml (string as_configcode)
public function datastore of_getdatastore ()
public function string of_getxml ()
public function string of_getxmlfilename (string as_configcode)
public function string of_getdataobject (string axml_data)
public function string of_getconstantvalue (string as_constantcode)
public function string of_getconstantdesc (string as_constantcode)
public function integer of_init (n_cst_dbconnectservice anv_connected)
end prototypes

public function integer of_loadxml (string as_configcode);/***********************************************
<description>
สั่งให้โหลดข้อมูล XML มาพักไว้ใน Object นี้
</description>

<arguments>	
as_configcode   รหัส Configuration ใช้จับคู่ไฟล์ XML.
</arguments>

<return>
1	=	success
-1	=	error
</return>

<usage>
n_cst_xmlconfig lnv_config
lnv_config = create n_cst_xmlconfig
lnv_config.of_loadxml( "pbservice.shrlonservice" )

datastore lds_config
lds_config = lnv_config.of_getdatastore()

li_myconfig = lds_config.getitemnumber( 1, "myconfig" )
</usage>
************************************************/

//หาชื่อไฟล์ XML สำหรับ configcode ที่ต้องการ.
is_configcode = as_configcode
is_xmlname = of_getxmlfilename( as_configcode )

//อ่านไฟล์ XML มาไว้ในตัวแปรพักไว้.เพื่อให้สามารถอ่านชื่อ datawindowobject ออกมาได้.
integer li_FileNum, li_read
string ls_xml
string ls_read
ls_xml = ""
li_FileNum = FileOpen(XML_PATH+is_xmlname,TextMode!)
FillA( ls_read, 32000 )
DO UNTIL ( FileReadEx(li_FileNum, ls_read) < 0 )
	ls_xml += ls_read
LOOP
FileClose( li_FileNum )

//หาชื่อ datawindow แล้วนำ xml เข้า datastore.
string ls_dwobject
integer li_imp
ls_dwobject = of_getdataobject( ls_xml )
if( isnull(ls_dwobject) or ls_dwobject = "" )then
	//of_debuglog( "" )
	return -1
end if
ids_config = create datastore
ids_config.dataobject = ls_dwobject
li_imp = ids_config.importstring( XML!, ls_xml )
if( li_imp < 0 )then
	destroy( ids_config )
	of_debuglog( "xmlconfig.of_loadxml('"+as_configcode+"'): Import xml failed !!" )
	return -1
elseif( isnull(li_imp) )then
	destroy( ids_config )
	of_debuglog( "xmlconfig.of_loadxml('"+as_configcode+"'): Datawindow object '"+ls_dwobject+"' not found." )
	return -2
end if

return 1

end function

public function datastore of_getdatastore ();/***********************************************
<description>
ขอ datastore ที่โหลด configuration ไว้แล้ว (ควรเรียกฟังชั่น of_loadxml ก่อนเสมอ)
</description>

<arguments>	
</arguments>

<return>
ถ้าเสร็จสมบูรณ์ส่งค่ากลับเป็น Datastore ที่มี Configuration โหลดไว้แล้ว
ถ้าไม่สมบูรณ์ส่งค่ากลับเป็น null
</return>

<usage>
n_cst_xmlconfig lnv_config
lnv_config = create n_cst_xmlconfig
lnv_config.of_loadxml( "pbservice.shrlonservice" )

datastore lds_config
lds_config = lnv_config.of_getdatastore()
...
li_myconfig = lds_config.getitemnumber( 1, "myconfig" )
</usage>
************************************************/
return ids_config

end function

public function string of_getxml ();/***********************************************
<description>
ขอ XML ที่โหลดจากไฟล์ configuration (ควรเรียกฟังชั่น of_loadxml ก่อนเสมอ)
</description>

<arguments>	
</arguments>

<return>
ถ้าเสร็จสมบูรณ์ส่งค่ากลับเป็น DatawindowXML
ถ้าไม่สมบูรณ์ส่งค่ากลับเป็น null
</return>

<usage>
n_cst_xmlconfig lnv_config
lnv_config = create n_cst_xmlconfig
lnv_config.of_loadxml( "pbservice.shrlonservice" )

string ls_config
ls_config = lnv_config.of_getxml()
</usage>
************************************************/
if( isvalid( ids_config ) )then
	return ids_config.describe( "Datawindow.data.XML" )
else
	String ls_null
	setnull( ls_null )
	return ls_null
end if

end function

public function string of_getxmlfilename (string as_configcode);/***********************************************
<description>
อยากรู้ชื่อไฟล์ XML ที่จับคู่กับ ConfigCode
</description>

<arguments>	
as_configcode		รหัส Configuration ใช้จับคู่ไฟล์ XML
</arguments>

<return>
ถ้าเสร็จสมบูรณ์ส่งค่ากลับเป็น ชื่อไฟล์ XML
ถ้าไม่สมบูรณ์ส่งค่ากลับเป็น null
</return>

<usage>
n_cst_xmlconfig lnv_config
lnv_config = create n_cst_xmlconfig

string ls_xmlfile
ls_xmlfile = lnv_config.of_getxmlfilename( "pbservice.shrlonservice" )
</usage>
************************************************/
string ls_name
integer li_imp
datastore ids_codemap
ids_codemap = create datastore
setnull( ls_name )
ids_codemap.dataobject = "d_config_codemap"
li_imp = ids_codemap.importfile( XML!, XML_CODEMAP )
if( li_imp > 0 )then
	integer li_find
	li_find = ids_codemap.find( "config_code = '"+as_configcode+"'", 1, ids_codemap.rowcount() )
	if( li_find > 0 )then
		ls_name = trim(ids_codemap.getitemstring( li_find, "xmlfile_name" ))
	end if	
end if
return ls_name

end function

public function string of_getdataobject (string axml_data);/***********************************************
<description>
ขอชื่อ dataobject จาก DatawindowXML
</description>

<args>	
axml_data		ข้อมูล XML ของ Datawindow (หรือเรียกว่า DatawindowXML)
</args>

<return>
คืนชื่อ datawindow object, ถ้าไม่สำเร็จคืนค่า null
</return>

<usage>
ถูกใช้จากภายใน Object, ไม่แนะนำให้ใช้จากภายนอก เนื่องจากอนาคตอาจมีการเปลี่ยนแปลงสิทธิการเข้าถึงฟังชั่นนี้
</usage>
************************************************/
string ls_dataobject, ls_dw, ls_tmp
integer li_pos, li_end
try
	ls_dw = trim(axml_data)
	ls_tmp = left(right( ls_dw, 3 ),2)
	if( ls_tmp = "/>" )then
		li_pos = LastPos( ls_dw, "<" )
		if( li_pos > 0 )then
			ls_dataobject = right( ls_dw, len( ls_dw ) - li_pos )
			li_end = LastPos( ls_dataobject, "/>" )
			ls_dataobject  = left( ls_dataobject, li_end - 1 )
		end if
	else
		li_pos = LastPos( ls_dw, "/" )
		if( li_pos > 0 )then
			ls_dataobject = right( ls_dw, len( ls_dw ) - li_pos )
			li_end = LastPos( ls_dataobject, ">" )
			ls_dataobject  = left( ls_dataobject, li_end - 1 )
		end if	
	end if
catch( Exception th )
	of_debuglog( th.getmessage() )
	setnull( ls_dataobject )
end try
return ls_dataobject

end function

public function string of_getconstantvalue (string as_constantcode);/***********************************************
<description>
อยากรู้ค่าของค่าคงที่ ที่จับคู่กับ Constant Code นี้
</description>

<arguments>	
as_constantcode		รหัสค่าคงที่
</arguments>

<return>
ถ้าเสร็จสมบูรณ์ส่งค่ากลับเป็น ค่าของค่าคงที่ ที่ัจับคู่กับ Constant Code นี้
ถ้าไม่สมบูรณ์ส่งค่ากลับเป็น null
</return>

<usage>
n_cst_xmlconfig lnv_config
lnv_config = create n_cst_xmlconfig

integer li_flag
li_flag = Integer(lnv_config.of_getconstantname( "shrlonservice.calcintflag" ))		//flag = 1
</usage>
************************************************/
string ls_name
integer li_imp
datastore ids_codemap
ids_codemap = create datastore
setnull( ls_name )
ids_codemap.dataobject = "d_constant_codemap"
li_imp = ids_codemap.importfile( XML!, XML_CONSTMAP )
if( li_imp > 0 )then
	integer li_find
	li_find = ids_codemap.find( "config_code = '"+as_constantcode+"'", 1, ids_codemap.rowcount() )
	if( li_find > 0 )then
		ls_name = trim(ids_codemap.getitemstring( li_find, "config_value" ))
	end if	
end if
return ls_name

end function

public function string of_getconstantdesc (string as_constantcode);/***********************************************
<description>
อยากรู้ชื่อค่าคงที่ ที่จับคู่กับ Constant Code นี้
</description>
 
<arguments>	
as_constantcode		รหัสค่าคงที่
</arguments>

<return>
ถ้าเสร็จสมบูรณ์ส่งค่ากลับเป็น ชื่อค่าคงที่ ที่ัจับคู่กับ Constant Code นี้
ถ้าไม่สมบูรณ์ส่งค่ากลับเป็น null
</return>

<usage>
n_cst_xmlconfig lnv_config
lnv_config = create n_cst_xmlconfig

String ls_name
ls_name = lnv_config.of_getconstantname( "shrlonservice.calcintflag" )		//name = ให้คิดดอกเบี้ยด้วยหรือไม่, 1=ให้คิดดอกเบี้ย, 0=ไม่ต้องคิดดอกเบี้ย.
</usage>
************************************************/
string ls_name
integer li_imp
datastore ids_codemap
ids_codemap = create datastore
setnull( ls_name )
ids_codemap.dataobject = "d_constant_codemap"
li_imp = ids_codemap.importfile( XML!, XML_CONSTMAP )
if( li_imp > 0 )then
	integer li_find
	li_find = ids_codemap.find( "config_code = '"+as_constantcode+"'", 1, ids_codemap.rowcount() )
	if( li_find > 0 )then
		ls_name = trim(ids_codemap.getitemstring( li_find, "config_name" ))
	end if	
end if
return ls_name

end function

public function integer of_init (n_cst_dbconnectservice anv_connected);XML_CONSTMAP = anv_connected.is_gcoop_path + "XMLConfig\xmlconf.constmap.xml"

XML_CODEMAP = anv_connected.is_gcoop_path + "XMLConfig\xmlconf.codemap.xml"

XML_PATH = anv_connected.is_gcoop_path + "XMLConfig\"

return 1
end function

on n_cst_xmlconfig.create
call super::create
end on

on n_cst_xmlconfig.destroy
call super::destroy
end on

event constructor;/***********************************************
<object>
XMLConfigService ใช้สำหรับอ่านค่า Configuration ทั้งหมดของโปรแกรมโดยการระบุ ConfigCode
ConfigCode คือ รหัสสำหรับจับคู่ไฟล์ XML ที่เก็บ Configuration ที่ต้องกำหนดไว้ก่อนแล้วใน XMLConfig.MapConfig
</object>

<also>
</also>

<author>
Initial Version 1.0 by Prazit (R) Jitmanozot
</author>

<usage>
ตัวอย่างนี้เป็นการร้องขอ datastore ที่บรรจุ config เกี่ยวกับงานพิมพ์มาเพื่ออ่านค่า printpreview_flag

integer li_printpreviewflag
datastore lds_config
n_cst_xmlconfig lnv_config

lnv_config = create n_cst_xmlconfig
lnv_config.of_loadxml( "program.print.config" )
lds_config = lnv_config.of_getdatastore()
li_printpreviewflag = lds_config.getitemnumber( 1, "printpreview_flag" )
</usage>
<exclude>
************************************************/

////DOYS
//integer li_FileNum
//string ls_Emp_Input
//li_FileNum = FileOpen("C:\TEMP\GCOOP_PATH.TXT",   LineMode!)
//FileRead(li_FileNum, ls_Emp_Input)
//FileClose(li_FileNum)
//
//XML_PATH = trim(ls_Emp_Input) + "XMLConfig\"
//XML_CONSTMAP = XML_PATH + "xmlconf.constmap.xml"
//XML_CODEMAP = XML_PATH + "xmlconf.codemap.xml"
end event

