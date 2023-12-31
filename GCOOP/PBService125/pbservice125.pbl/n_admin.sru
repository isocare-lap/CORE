$PBExportHeader$n_admin.sru
namespace
namespace pbservice125
end namespace

forward
global type n_admin from NonVisualObject
end type
end forward

global type n_admin from NonVisualObject
end type
global n_admin n_admin

forward prototypes
public function string of_test (string as_test)
public function string of_getuserpages (string as_wspass, string as_userid, string as_appid) throws Exception
public function integer of_existinguser (string as_wspass, string as_userid, string as_fullname) throws Exception
public function string of_decodestring (string as_wspass, string as_string) throws Exception
public function integer of_resetuserpassword (string as_wspass, string as_userid) throws Exception
public function integer of_savenewuser (string as_wspass, string axml_user, ref string as_err) throws Exception
public function integer of_saveuserpassword (string as_wspass, string as_userid, string as_password) throws Exception
public function string of_getgroup (string as_wspass, string as_groupid) throws Exception
public function integer of_savenewgroup (string as_wspass, string as_group) throws Exception
public function string of_getusers (string as_wspass) throws Exception
public function string of_getuser (string as_wspass, string as_userid) throws Exception
public function string of_getgrouppages (string as_wspass, string as_groupid, string as_appid) throws Exception
public function string of_getgroupusers (string as_wspass, string as_groupid) throws Exception
end prototypes

public function string of_test (string as_test);string ls_result

ls_result = "test " + as_test

return ls_result
end function

public function string of_getuserpages (string as_wspass, string as_userid, string as_appid) throws Exception;string result    

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_user_service ln_service				
	ln_service = create n_cst_user_service
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_getuserpages(as_userid,as_appid)
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_existinguser (string as_wspass, string as_userid, string as_fullname) throws Exception;integer result  
result = 0

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_user_service ln_service				
	ln_service = create n_cst_user_service
	
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_existinguser(as_userid,as_fullname)
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_decodestring (string as_wspass, string as_string) throws Exception;string result  

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_user_service ln_service				
	ln_service = create n_cst_user_service
	
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_decodestring(as_string)
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_resetuserpassword (string as_wspass, string as_userid) throws Exception;integer result  
result = 0

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_user_service ln_service				
	ln_service = create n_cst_user_service
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_resetuserpassword(as_userid)
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savenewuser (string as_wspass, string axml_user, ref string as_err) throws Exception;integer result  
result = 0

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_user_service ln_service				
	ln_service = create n_cst_user_service
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_savenewuser(axml_user,ref as_err)
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveuserpassword (string as_wspass, string as_userid, string as_password) throws Exception;integer result  
result = 0

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_user_service ln_service				
	ln_service = create n_cst_user_service
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_saveuserpassword(as_userid,as_password)
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_getgroup (string as_wspass, string as_groupid) throws Exception;string result    

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_user_service ln_service				
	ln_service = create n_cst_user_service
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_getgroup(as_groupid)
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savenewgroup (string as_wspass, string as_group) throws Exception;integer result    

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_user_service ln_service				
	ln_service = create n_cst_user_service
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_savenewgroup(as_group)
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_getusers (string as_wspass) throws Exception;string result    

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_user_service ln_service				
	ln_service = create n_cst_user_service
	
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_getusers()
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_getuser (string as_wspass, string as_userid) throws Exception;string result    

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_user_service ln_service				
	ln_service = create n_cst_user_service
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_getuser(as_userid)
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_getgrouppages (string as_wspass, string as_groupid, string as_appid) throws Exception;string result    

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_user_service ln_service				
	ln_service = create n_cst_user_service
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_getgrouppages(as_groupid,as_appid)
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_getgroupusers (string as_wspass, string as_groupid) throws Exception;string result    

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_user_service ln_service				
	ln_service = create n_cst_user_service
	ln_service.of_settrans(in_conn)
	
	result = ln_service.of_getgroupusers(as_groupid)
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

on n_admin.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_admin.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on
