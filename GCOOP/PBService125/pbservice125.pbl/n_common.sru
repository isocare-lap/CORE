$PBExportHeader$n_common.sru
namespace
namespace pbservice125
end namespace

forward
global type n_common from NonVisualObject
end type
end forward

global type n_common from NonVisualObject
end type
global n_common n_common

forward prototypes
public function integer of_getnextworkday (string as_wspass, datetime adtm_fromdate, ref datetime adtm_nextworkdate) throws Exception
public function string of_getnewdocno (string as_wspass, string as_coopid, string docCode)
public function boolean of_isworkingdate (string as_wspass, datetime adtm_checkdate) throws Exception
public function string of_getdddwxml (string as_wspass, string as_dddwobj)
public function integer of_dwexportexcel_etn (string as_wspass, str_rptexcel astr_rptexcel) throws Exception
public function integer of_dwexportexcel_rpt (string as_wspass, ref str_rptexcel astr_rptexcel) throws Exception
public function date of_lastdayofmonth (string as_wspass, date ad_source) throws Exception
end prototypes

public function integer of_getnextworkday (string as_wspass, datetime adtm_fromdate, ref datetime adtm_nextworkdate) throws Exception;//n_cst_calendarservice
int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_calendarservice ln_service
	ln_service = create n_cst_calendarservice	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_getnextworkday(adtm_fromdate, adtm_nextworkdate)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_getnewdocno (string as_wspass, string as_coopid, string docCode);//n_cst_calendarservice
string result
result = ""
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_doccontrolservice ln_service
	ln_service = create n_cst_doccontrolservice	
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_getnewdocno(as_coopid,docCode)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function boolean of_isworkingdate (string as_wspass, datetime adtm_checkdate) throws Exception;//n_cst_calendarservice
boolean result
result = false
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_calendarservice ln_service
	ln_service = create n_cst_calendarservice	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_isworkingdate(adtm_checkdate)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_getdddwxml (string as_wspass, string as_dddwobj);string result
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_utility ln_service
	ln_service = create n_cst_utility	
	
	result = ln_service.of_getdddwxml(as_dddwobj)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_dwexportexcel_etn (string as_wspass, str_rptexcel astr_rptexcel) throws Exception;//n_cst_calendarservice
integer result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_dwexportexcel ln_service
	ln_service = create n_cst_dwexportexcel
	//ln_service.of_initservice(in_conn)
	
	result = ln_service.of_dwexportexcel_etn(astr_rptexcel)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_dwexportexcel_rpt (string as_wspass, ref str_rptexcel astr_rptexcel) throws Exception;integer result
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_dwexportexcel ln_service
	ln_service = create n_cst_dwexportexcel	
	
	result = ln_service.of_dwexportexcel_rpt(astr_rptexcel)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function date of_lastdayofmonth (string as_wspass, date ad_source) throws Exception;//n_cst_calendarservice
date result
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_datetimeservice ln_service
	ln_service = create n_cst_datetimeservice	
	//ln_service.of_initservice(in_conn)
	
	result = ln_service.of_lastdayofmonth(ad_source)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

on n_common.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_common.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on
