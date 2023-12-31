$PBExportHeader$n_keeping.sru
namespace
namespace pbservice125
end namespace

forward
global type n_keeping from NonVisualObject
end type
end forward

global type n_keeping from NonVisualObject
end type
global n_keeping n_keeping

forward prototypes
public function string of_test (string as_test)
public function integer of_save_adjust_monthly (string as_wspass, str_keep_adjust astr_keep_adjust)
public function integer of_init_adjust_monthly (string as_wspass, ref str_keep_adjust astr_keep_adjust) throws Exception
public function integer of_save_adjmth_ccl (string as_wspass, ref str_keep_adjust astr_keep_adjust) throws Exception
public function integer of_init_kpmast_detail (string as_wspass, ref str_keep_detail astr_keep_detail) throws Exception
public function integer of_init_adjust_monthly_prc_option (string as_wspass, ref str_keep_adjust astr_keep_adjust) throws Exception
public function integer of_save_kptp_ccl (string as_wspass, ref str_keep_adjust astr_keep_adjust) throws Exception
public function integer of_slcls_year_lon_opt (string as_wspass, ref str_slcls_proc astr_slcls_proc) throws Exception
public function integer of_init_slcls_year_lon_opt (string as_wspass, ref str_slcls_proc astr_slcls_proc) throws Exception
public function integer of_save_req_expense (string as_wspass, ref str_keep_request astr_keep_request)
public function integer of_init_rcv_post (string as_wspass, ref str_keep_proc astr_keep_proc) throws Exception
public function integer of_init_req_expense (string as_wspass, ref str_keep_request astr_keep_request) throws Exception
public function integer of_init_kptp_ccl (string as_wspass, ref str_keep_adjust astr_keep_adjust) throws Exception
public function integer of_init_adjmth_ccl (string as_wspass, ref str_keep_adjust astr_keep_adjust) throws Exception
public function integer of_init_mr_opr_proc (string as_wspass, ref str_money_return_xml astr_mr_xml) throws Exception
public function integer of_imp_orther_lap (string as_wspass, string as_path_file, string as_period) throws Exception
end prototypes

public function string of_test (string as_test);string ls_result

ls_result = "test " + as_test

return ls_result
end function

public function integer of_save_adjust_monthly (string as_wspass, str_keep_adjust astr_keep_adjust);integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_keeping_adjust_monthly kp_service
	kp_service = create n_cst_keeping_adjust_monthly
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_save_adjust_monthly(astr_keep_adjust)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_init_adjust_monthly (string as_wspass, ref str_keep_adjust astr_keep_adjust) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_keeping_adjust_monthly kp_service
	kp_service = create n_cst_keeping_adjust_monthly
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_init_adjust_monthly(astr_keep_adjust)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_save_adjmth_ccl (string as_wspass, ref str_keep_adjust astr_keep_adjust) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_keeping_adjust_monthly kp_service
	kp_service = create n_cst_keeping_adjust_monthly
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_save_adjmth_ccl(astr_keep_adjust)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_init_kpmast_detail (string as_wspass, ref str_keep_detail astr_keep_detail) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_keeping_memdet kp_service
	kp_service = create n_cst_keeping_memdet
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_init_kpmast_detail(astr_keep_detail)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_init_adjust_monthly_prc_option (string as_wspass, ref str_keep_adjust astr_keep_adjust) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_keeping_adjust_monthly kp_service
	kp_service = create n_cst_keeping_adjust_monthly
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_init_adjust_monthly_prc_option(astr_keep_adjust)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_save_kptp_ccl (string as_wspass, ref str_keep_adjust astr_keep_adjust) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_keeping_adjust_monthly kp_service
	kp_service = create n_cst_keeping_adjust_monthly
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_save_kptp_ccl(astr_keep_adjust)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_slcls_year_lon_opt (string as_wspass, ref str_slcls_proc astr_slcls_proc) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_slcls_process kp_service
	kp_service = create n_cst_slcls_process
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_slcls_year_lon_opt(astr_slcls_proc)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_init_slcls_year_lon_opt (string as_wspass, ref str_slcls_proc astr_slcls_proc) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_slcls_process kp_service
	kp_service = create n_cst_slcls_process
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_init_slcls_year_lon_opt(astr_slcls_proc)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_save_req_expense (string as_wspass, ref str_keep_request astr_keep_request);integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_keeping_request_all kp_service
	kp_service = create n_cst_keeping_request_all
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_save_req_expense(astr_keep_request)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_init_rcv_post (string as_wspass, ref str_keep_proc astr_keep_proc) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_keeping_post kp_service
	kp_service = create n_cst_keeping_post
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_init_rcv_post(astr_keep_proc)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_init_req_expense (string as_wspass, ref str_keep_request astr_keep_request) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_keeping_request_all kp_service
	kp_service = create n_cst_keeping_request_all
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_init_req_expense(astr_keep_request)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_init_kptp_ccl (string as_wspass, ref str_keep_adjust astr_keep_adjust) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_keeping_adjust_monthly kp_service
	kp_service = create n_cst_keeping_adjust_monthly
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_init_kptp_ccl(astr_keep_adjust)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_init_adjmth_ccl (string as_wspass, ref str_keep_adjust astr_keep_adjust) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_keeping_adjust_monthly kp_service
	kp_service = create n_cst_keeping_adjust_monthly
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_init_adjmth_ccl(astr_keep_adjust)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_init_mr_opr_proc (string as_wspass, ref str_money_return_xml astr_mr_xml) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_money_return_opr kp_service
	kp_service = create n_cst_money_return_opr
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_init_mr_opr_proc(astr_mr_xml)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_imp_orther_lap (string as_wspass, string as_path_file, string as_period) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_keeping_service kp_service
	kp_service = create n_cst_keeping_service
	
	kp_service.of_initservice(in_conn)
	
	result = kp_service.of_imp_orther_lap( as_path_file, as_period)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

on n_keeping.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_keeping.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on
