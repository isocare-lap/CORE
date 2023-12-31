$PBExportHeader$n_cst_account_service.sru
$PBExportComments$ตัวบริการ ระบบบัญชี
forward
global type n_cst_account_service from NonVisualObject
end type
end forward

/// <summary> ตัวบริการ ระบบบัญชี
/// </summary>
global type n_cst_account_service from NonVisualObject
end type
global n_cst_account_service n_cst_account_service

type variables
Exception	ithw_exception
transaction	itr_sqlca

string		is_cash_id,is_benifit_total_acc , is_benifit_account_id
string		is_account_pl_pf, is_finstatus_code
integer	ii_present_year, ii_begin_year, ii_begin_period
datetime		idtm_beginning_of_accou,idtm_ending_of_account
string is_coop_id,is_coop_control

n_cst_datetimeservice	inv_datetime
n_cst_doccontrolservice	inv_docservice
n_cst_stringservice		inv_string
n_cst_dwxmlieservice     inv_dwxml
n_cst_account_prepare_vc_service	inv_prepare


n_ds	ids_finance_statement, ids_finance_bs_show, ids_finance_bs_head
end variables

forward prototypes
private subroutine of_get_sum_between_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_branch_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, integer ai_flag)
private subroutine of_get_sum_between_drcr_adj (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount)
public function integer of_add_newaccount_id (string as_account_iddetail_xml, integer ai_update_add) throws Exception
public function integer of_save_contuseprofit (string as_conuse_xml) throws Exception
public function integer of_update_cashpaper_detail (string as_cash_detail_xml, integer ai_sheet, string as_type_activity) throws Exception
private function integer of_add_newyear (integer ai_account_year, string as_coop_id, datetime adtm_start_year, datetime adtm_end_year) throws Exception
public function integer of_cancel_post_to_gl (string as_postlist_xml, string as_entry_id, string as_coop_id, datetime adtm_date) throws Exception
public function integer of_cancel_voucher (datetime adtm_vc_date, string as_voucher, string as_coop_id) throws Exception
public function integer of_delete_accountid (string as_accountid, string as_coop_id) throws Exception
private function decimal of_find_sumlastyear (string as_account_id, string as_account_id_end, datetime adtm_start, datetime adtm_end, string as_coop_id, integer ai_bf_fw)
private function decimal of_find_sumlastyear (string as_account_id, string as_account_id_end, datetime adtm_start, datetime adtm_end, string as_coop_id, integer ai_bf_fw, integer ai_dr_cr)
public function integer of_gen_balance_sheet (string as_acc_bs_head_xml, string as_moneysheet_code, string as_coop_id, ref string as_acc_bs_ret_xml) throws Exception
public function integer of_gen_cashflow_sheet (string as_acc_bs_head_xml, string as_moneysheet_code, string as_coop_id, ref string as_acc_bs_ret_xml) throws Exception
public function string of_gen_cashpaper_activities (datetime adtm_start, datetime adtm_end, integer ai_sum_period, string as_coop_id)
public function string of_gen_cashpaper_drcr (datetime adtm_start, datetime adtm_end, integer ai_sum_period, string as_coop_id)
private function integer of_gen_data_cashflow (ref n_ds ads_finance_bs_show, integer arg_year, integer arg_period, string as_balance_data, string as_coop_id)
private subroutine of_get_sum_between_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id)
private subroutine of_get_sum_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id)
private subroutine of_get_sum_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, integer ai_flag, string as_coop_id)
public function integer of_gen_trial_bs (string as_choose_report_xml, string as_coop_id, ref string as_trial_report_xml) throws Exception
public function integer of_is_headquater (string as_coop_id)
private subroutine of_get_sum_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_coop_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, integer ai_flag)
private subroutine of_get_sum_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_coop_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount)
private subroutine of_get_sum_drcr (datetime adtm_begindate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id)
private subroutine of_get_sum_between_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, integer ai_flag, string as_coop_id)
public function string of_gen_day_journalreport (datetime adtm_start_date, datetime adtm_end_date, integer ai_type_group, string as_coop_id)
public function string of_gen_ledger_report (datetime adtm_start, datetime adtm_end, string as_account_id1, string as_account_id2, string as_coop_id) throws Exception
private function decimal of_gendata_sm_cashflow (string arg_data, string arg_balance_data, ref n_ds ads_help_show, integer arg_year, integer arg_period, string as_coop_id)
private subroutine of_get_sum_between_drcr_acc_cash (datetime adtm_begindate, datetime adtm_enddate, string as_account_id1, string as_account_id2, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id)
public function decimal of_get_result_gencash (string as_acclist, datetime adtm_start, datetime adtm_end, integer ai_choose, datetime adtm_year_begin, string as_coop_id, integer ai_cash_only)
private function decimal of_get_bal_cont (integer ai_acc_year, integer ai_acc_period, string as_acc_type, string as_coop_id)
public function decimal of_get_balance_begin (string as_account_id, datetime adtm_date_find, string as_coop_id)
public function decimal of_get_balance_begin (string as_account_id, integer ai_account_year, integer ai_period, string as_coop_id) throws Exception
public function decimal of_get_balance_begin (string as_account_id1, string as_account_id2, datetime adtm_date_find, string as_coop_id)
private function decimal of_get_bs_det (integer ai_sheet_seq, string as_sheetcode, string as_coop_id)
public function integer of_show_bs (string as_bs_code, integer ai_year, integer ai_period, string as_balance_data, string as_balance_percent, integer ai_mas, string as_coop_id)
private function decimal of_get_bs_sum (integer ai_sheet_seq, string as_sheetcode, string as_coop_id)
public function integer of_get_cash_bg_fw (datetime adtm_startdate, string as_coop_id, ref decimal adc_begin, ref decimal adc_forward)
public function string of_get_cashpaper_detail (integer ai_sheet, string as_type_activity, string as_coop_id) throws Exception
public function integer of_get_max_period (integer ai_account_year, string as_coop_id)
public function integer of_get_period_date (integer ai_year, integer ai_period, string as_coop_id, ref datetime adtm_begin_date, ref datetime adtm_end_date)
private function integer of_get_profit (integer ai_year, integer ai_period, integer ai_choose, ref decimal adc_pl_begin, ref decimal adc_pl_dr, ref decimal adc_pl_cr, string as_coop_id)
private subroutine of_get_sum_between_drcr_acc_range (datetime adtm_begindate, datetime adtm_enddate, string as_account_id1, string as_account_id2, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id)
public function decimal of_get_result_gencash_begin (string as_acclist, datetime adtm_start, string as_coop_id)
private subroutine of_get_sum_between_cr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_cr_amount, string as_coop_id)
private subroutine of_get_sum_between_dr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, string as_coop_id)
private subroutine of_get_sum_between_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_coop_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount)
private subroutine of_get_sum_between_drcr_adj (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_coop_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount)
private subroutine of_get_sum_between_notpost_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_coop_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount)
private subroutine of_get_sum_drcr_booktype (datetime adtm_begindate, integer ai_cashtype, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id)
private subroutine of_get_sum_notpost_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_coop_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount)
private function integer of_get_year_period (integer ai_year, integer ai_month, string as_coop_id, ref integer ai_periodyear, ref integer ai_period)
private function integer of_get_yearange_date (integer ai_year, string as_coop_id, ref datetime adtm_date_start, ref datetime adtm_date_end) throws Exception
public function integer of_is_closemonth (integer ai_year, integer ai_period, string as_coop_id) throws Exception
public function integer of_is_closeyear (integer ai_year, string as_coop_id) throws Exception
public function integer of_is_postall_voucher (datetime adtm_begin, datetime adtm_end, integer ai_post_status, string as_coop_id) throws Exception
public function integer of_is_postall_voucher (string as_voucher, integer ai_post_status, string as_coop_id) throws Exception
public function integer of_isexits_sumledger (string as_account_id, integer ai_account_year, integer ai_period, string as_coop_id)
private function integer of_post_to_sumledger (string as_account_id, integer ai_account_year, integer ai_period, integer ai_posttoallgl, decimal adc_sumdr, decimal adc_sumcr, string as_coop_id) throws Exception
public function integer of_profit_year (integer ai_year, integer ai_period, string as_coop_id)
public function integer of_save_account_splitactivity (string as_splitactivity_xml) throws Exception
private function integer of_set_contmoney (string as_string, integer an_year, integer an_month, ref decimal adc_result, string as_coop_id)
private function integer of_start_gen_finances_stm (string as_fs_code, datetime adtm_start_date, datetime adtm_end_date, string as_coop_id, integer ai_det)
public function integer of_sum_foradd_profit (integer ai_account_year, string as_coop_id) throws Exception
private function integer zof_new_voucher_no (string as_voucher_type, string as_coop_id, datetime adtm_date, ref string as_voucher_no) throws Exception
public function string of_err_generate_import_xml (integer ai_error)
public function integer of_get_year_period (datetime adtm_date, string as_coop_id, ref integer ai_year, ref integer ai_period)
private function integer zof_add_new_updatevoucher (string as_vcmas_xml, string as_vcdet_xml, string as_coop_id) throws Exception
private function integer zof_get_list_vcmas_det (string as_vcno, ref string as_vcmas_xml, ref string as_vcdet_xml, string as_coop_id)
private function integer zof_get_vclist_day (datetime adtm_date, string as_coop_id, ref string as_vclist_xml)
public function integer of_set_default_accountid (string as_coop_id)
public function integer of_initservice (n_cst_dbconnectservice anv_db)
public function integer of_close_month (integer ai_year, integer ai_period) throws Exception
public function integer of_cancel_closemonth (integer ai_year, integer ai_period) throws Exception
public function integer of_init_consstant_bs (string as_data_desc, ref string as_buzz_display_xml, ref string as_usr_type_xml)
public function integer of_save_constant_bs (string as_main_xml, string as_detail_xml, string as_money_code, integer an_sheet_seq) throws Exception
public function integer of_init_formular_fc (string as_money_sheetcode, integer an_data_group, ref string as_formular_fc_xml, ref string as_formular_fc_choose_xml) throws Exception
public function integer of_save_formula_fc (string as_main_xml, string as_money_code, string as_data_group) throws Exception
public function integer of_init_formula_sm (string as_money_sheetcode, integer an_data_group, ref string as_formular_sm_xml, ref string as_formular_sm_choose_xml)
public function integer of_save_formula_sm (string as_main_xml, string as_money_code, string as_data_group) throws Exception
public function integer of_close_year (integer ai_year) throws Exception
private function decimal of_get_profit_period (integer ai_account_year, integer ai_account_period, string as_coop_id)
private function string of_get_account_group (string as_account_id, string as_coop_id)
public function integer of_save_money_sheet (string as_main_xml, string as_money_code, string as_coop_id) throws Exception
public function integer of_sersrvdwxml (boolean ab_switch) throws Exception
public function integer of_cancel_closeyear (integer ai_year) throws Exception
private function string zof_get_contuseprofit (integer ai_year, integer ai_period)
public function string of_init_contuseprofit (integer ai_year, integer ai_period)
public function string of_init_account_splitactivity (integer ai_year, integer ai_period)
private function string zof_get_vcdetail_forset_noncash (datetime adtm_datebegin, datetime adtm_dateend, string as_account_id) throws Exception
public function integer of_save_vcset_noncash (string as_cash_detail_xml, datetime adtm_date_begin, datetime adtm_date_end, string as_account_id) throws Exception
public function integer of_candel_year (integer ai_year) throws Exception
public function integer of_candel_period (integer ai_year, integer ai_period) throws Exception
public function string of_init_vcset_noncash (datetime adtm_datebegin, datetime adtm_dateend, string as_account_id)
private function string zof_get_account_splitactivity (integer ai_year, integer ai_period)
private function integer zof_get_vc_listcancel (datetime adtm_date, string as_coop_id, ref string as_vclist_xml)
private function integer zof_get_vclist_nopost (datetime adtm_begin, datetime adtm_end, integer ai_poststatus, string as_coop_id, ref string as_vclist_xml)
private function integer zof_post_to_gl (string as_postlist_xml, string as_entry_id, string as_coop_id) throws Exception
private function integer zof_update_setnoncash_paper (string as_cash_detail_xml, datetime adtm_date_begin, datetime adtm_date_end, string as_account_id) throws Exception
public function integer of_save_accbegin (string as_begindata_xml, string as_coop_id) throws Exception
public function integer of_add_first_sumleger_period (integer ai_year, string as_coop_id) throws Exception
public function integer of_get_cash_bg_fw_notpost (datetime adtm_startdate, string as_coop_id, ref decimal adc_begin, ref decimal adc_forward)
public function integer of_add_contnext_year (integer ai_year, string as_coop_id, integer ai_yearadd) throws Exception
public function integer of_get_budgetpay (integer ai_year, integer ai_period, string as_coop, string as_account_desc, ref decimal adc_account_real, ref decimal adc_account_period, decimal adc_budget)
private subroutine of_get_budget_between_dr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, string as_coopid)
private subroutine of_get_budget_between_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, integer ai_flag, string as_coopid)
public function integer of_process_budget (string as_coopid, integer ai_year, integer ai_period) throws Exception
public function integer of_set_budget (string as_xml, string as_coopid, integer an_year, string as_budget_type) throws Exception
private function string of_get_acctrnpay_no (datetime adtm_date, ref string as_paytrn_no, string as_coopid) throws Exception
public function integer of_gen_data_paytrnbank (string as_head_xml, string as_share_xml, string as_loan_xml, string as_etc_xml) throws Exception
public function integer of_add_accyear (string as_year_xml) throws Exception
public function integer of_add_accperiod (integer ai_year, string as_accperiod_xml) throws Exception
public function integer of_cancel_closemonth_clear_vcno (integer ai_year, integer ai_period) throws Exception
public function integer of_close_month_clear_vcno (integer ai_year, integer ai_period) throws Exception
public function integer of_gen_delseries (datetime adtm_cal_delseries)
public function integer of_add_newemployee (string as_employee_detail_xml, integer ai_update_add) throws Exception
public function integer of_set_employee_salary (string as_xml, string as_coopid, integer an_year) throws Exception
public function integer of_process_pension (string as_coopid, integer ai_year) throws Exception
public function integer of_save_asset (string as_xml, string as_ratexml, string as_coop) throws Exception
public function decimal of_calculate_dp (string as_assetdoc, string as_coop, decimal adc_assetprice, datetime adtm_calfrom, datetime adtm_calto, ref string as_calrate) throws Exception
public function integer of_cal_dp (datetime adtm_caltodate, string as_coop) throws Exception
private function integer of_add_new_dpyear (integer ai_account_year, string as_coop_id, datetime adtm_start_year, datetime adtm_end_year) throws Exception
private function integer of_add_first_dp (string as_coopid, integer ai_year) throws Exception
public function integer of_close_depreciation (integer ai_year, datetime adtm_caltodate, string as_coopid) throws Exception
private function integer of_get_dpyear_last_date (integer ai_year, string as_coop_id, ref datetime adtm_date_start, ref datetime adtm_date_end) throws Exception
public function integer of_cancel_dpyear (integer ai_year, string as_coopid) throws Exception
public function integer of_process_member_balance (integer ai_year, integer ai_period, string as_coopid)
public function integer of_gen_trial_bs_coop (string as_choose_report_xml, string as_coop_id, ref string as_trial_report_xml) throws Exception
private function integer of_pf (integer ai_year, integer ai_period, integer ai_choose, string as_coopid, ref decimal adc_pl_begin, ref decimal adc_pl_dr, ref decimal adc_pl_cr)
public function integer of_gen_trial_bs2 (datetime adtm_start_date, datetime adtm_end_date, string as_check_flag, string as_coop_id) throws Exception
public function string of_gen_ledger_report_day (datetime adtm_start, datetime adtm_end, string as_account_id1, string as_account_id2, string as_coop_id) throws Exception
private subroutine of_get_sum_drcr_day (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, integer ai_flag, string as_coop_id)
private subroutine of_get_sum_drcr_day (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id)
public function decimal of_get_balance_begin_day (string as_account_id, datetime adtm_date_find, string as_coop_id)
public function integer of_set_voucher_no (datetime adtm_date, string as_coopid, string as_type) throws Exception
public function integer of_get_cash_bg_fw_first_period (datetime adtm_startdate, string as_coop_id, ref decimal adc_begin, ref decimal adc_forward)
public function integer of_gen_balance_sheet_excel (string as_moneysheet_code, integer ai_year_1, integer ai_year_2, integer ai_month_1, integer ai_month_2, integer ai_show_all, integer ai_data_1, integer ai_data_2, integer ai_compere_b1_b3, integer ai_show_remark, string as_coop_id, integer ai_total_show, integer ai_percent_status) throws Exception
end prototypes

private subroutine of_get_sum_between_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_branch_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, integer ai_flag);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( b.account_id		= :as_account_id)  and
			( a.coop_id		= :as_branch_id )	and
			( b.posttogl_allflag	= :ai_flag)and
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_between_drcr_adj (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( b.account_id		= :as_account_id)  and
			( a.cash_type		= 3 ) and
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

public function integer of_add_newaccount_id (string as_account_iddetail_xml, integer ai_update_add) throws Exception;/***********************************************
<description>
ทำรายการเพิ่มรหัสบัญชีใหม่

FXREF: AC-ACCSERVICE-of_add_newaccount_id-0000001
</description>

<arguments>
as_account_iddetail_xml		ข้อมูลเขที่บัญชีทึีต้องการเพิ่มหรือปรับปรุง ในรูปแบบ XML
ai_update_add					สถานะบอกว่า update หรือ เพิ่มใหม่
									1 = > Update
									2 => Add
</arguments>	

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/
n_ds		lds_accdetail
integer	li_rc, li_count, li_index

lds_accdetail		= create n_ds
lds_accdetail.dataobject = "d_acc_accmaster_add_service"
lds_accdetail.Settransobject( itr_sqlca )

if not  isnull( as_account_iddetail_xml ) and trim( as_account_iddetail_xml ) <> ""  then
	li_rc	= lds_accdetail.importstring( XML!, as_account_iddetail_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

if ( ai_update_add = 2 ) then
	//DataModified!	
	li_count	= integer( lds_accdetail.describe( "Datawindow.Column.Count" ) )
	lds_accdetail.SetItemStatus( 1, 0, Primary!, DataModified!)
	for li_index = 1 to li_count
		lds_accdetail.SetItemStatus( 1, li_index, Primary!, DataModified!)
	next
	
	lds_accdetail.SetItemStatus( 1, "account_id,coop_id", Primary!, NotModified!)   /* กำหนดให้รู้ว่าเป็น  Primary key  */

end if

  
 
li_rc	= lds_accdetail.update( ) 
if ( li_rc = -1 ) then
	if ( ai_update_add = 1 ) then
		ithw_exception.text	= "ไม่สามารถบันทึกรายละเอียด การเพิ่มรหัสบัญชีใหม่ได้ "
	else
		ithw_exception.text	= "ไม่สามารถบันทึกรายละเอียด การปรับปรุงรหัสบัญชีได้ "
	end if
	
	ithw_exception.text	+= lds_accdetail.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
end if

commit using itr_sqlca ;
return 1
end function

public function integer of_save_contuseprofit (string as_conuse_xml) throws Exception;/***********************************************
<description>
ทำรายการบันทึกรายการแยก กิจกรรมของรหัสบัญชี

FXREF: AC-ACCSERVICE-of_save_contuseprofit-0000001
</description>

<arguments>
as_conuse_xml				ข้อมูลรายการ การจัดสรรกำไร
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/
integer	li_rc, li_acc_year, li_acc_period
integer	li_index, li_row
string		ls_acc_code,ls_coop_id
n_ds	lds_data

lds_data	= create n_ds
lds_data.dataobject = "d_acc_contuseprofit"
lds_data.settransobject( itr_sqlca )

if not  isnull( as_conuse_xml ) and trim( as_conuse_xml ) <> ""  then
	li_rc	= lds_data.importstring( XML!, as_conuse_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

// ตรวจสอบ การป้อนรายการ
for li_index = 1 to lds_data.rowcount()
	li_acc_year		= lds_data.GetitemNumber( 1, "acc_year" )
	li_acc_period	= lds_data.GetitemNumber( 1, "acc_period" )
	ls_acc_code		= lds_data.GetitemString( 1, "acc_code" )
	ls_coop_id		= lds_data.GetitemString( 1, "coop_id" )
	
	if isnull( li_acc_year ) then li_acc_year = 0
	if isnull( li_acc_period ) then li_acc_period = 0
	if isnull( ls_acc_code ) then ls_acc_code = ""
	if isnull(ls_coop_id) then ls_coop_id=""
	
	if ( li_acc_year = 0 or li_acc_period = 0 or ls_acc_code = ""  or ls_coop_id = "" ) then
		ithw_exception.text	= "ไม่สามารถบันทึกรายการ การจัดสรรกำไรได้ กรุณาระบุ  รหัสสหกรณ์/สาขา หรือ  ปีบัญชี หรือ งวดบัญชี หรือ รหัสบัญชี  "
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
next


delete from acc_contuseprofit
where	acc_year		= :li_acc_year
and coop_id  			=:ls_coop_id
using itr_sqlca;

li_rc	= lds_data.update( )
if ( li_rc = -1 ) then
	ithw_exception.text	= "ไม่สามารถบันทึกรายการ การจัดสรรกำไรได้ "
	ithw_exception.text	+= lds_data.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
end if

commit using itr_sqlca;

return 1
end function

public function integer of_update_cashpaper_detail (string as_cash_detail_xml, integer ai_sheet, string as_type_activity) throws Exception;/***********************************************
<description>
ทำรายการยกเลิก voucher เลขที่ต้องการ

FXREF: AC-ACCSERVICE-of_update_cashpaper_detail-0000005
</description>

<arguments>
as_cash_detail_xml		ข้อมูล XML ของรายการ บันทึกกระดาษทำการงบกระแสเงินสด
ai_sheet						รหัสข้อมูล ประเภท งบ
as_type_activity			รหัสกิจกรรม เครดิต เดบิต
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/

n_ds	lds_cash_paper
string		ls_account_name, ls_account_activity, ls_coopid
integer	li_seq_no, li_rc, li_row, li_index

lds_cash_paper		= create n_ds
lds_cash_paper.dataobject = "d_acc_cashflow_list_save"
lds_cash_paper.Settransobject( itr_sqlca )

if not  isnull( as_cash_detail_xml ) and trim( as_cash_detail_xml ) <> ""  then
	li_rc	= lds_cash_paper.importstring( XML!, as_cash_detail_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

li_row		= lds_cash_paper.rowcount( )

for li_index = 1 to li_row
	li_seq_no				= lds_cash_paper.GetitemNumber( 1, "seq_no" )
	ls_account_name		= trim( lds_cash_paper.GetitemString( 1, "account_name" ) )
	ls_account_activity		= trim( lds_cash_paper.GetitemString( 1, "account_activity" ) )
	ls_coopid					= lds_cash_paper.GetitemString( 1, "coop_id" )
	
	if isnull( li_seq_no ) then li_seq_no = 0
	if isnull( ls_account_name ) then ls_account_name = ""
	if isnull( ls_account_activity ) then ls_account_activity = ""
	
	if ( li_seq_no = 0 ) or ( ls_account_name = "" ) or ( ls_account_activity = "" )  then
		ithw_exception.text	= "ไม่สามารถบันทึกรายการ ได้ กรุณาตรวจสอบรายการ ก่อนบันทึก มีบางรายการ ข้อมูลเบื้องต้นไม่สมบูรณ์"
		ithw_exception.text	= ithw_exception.text + "~r~ลำดับ หรือ ชื่อรายการ"
		rollback using itr_sqlca;
		throw ithw_exception
	end if
next


delete from accucfstmcashflow
where	sheet_type			= :ai_sheet and
			account_activity	= :as_type_activity and
			coop_id				= :ls_coopid
using itr_sqlca;

li_rc	= lds_cash_paper.update( )
if ( li_rc = -1 ) then
	ithw_exception.text	= "ไม่สามารถบันทึกรายการ ได้ "
	ithw_exception.text	+= lds_cash_paper.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
end if

commit using itr_sqlca ;
return 1
end function

private function integer of_add_newyear (integer ai_account_year, string as_coop_id, datetime adtm_start_year, datetime adtm_end_year) throws Exception;/***********************************************
<description>
ทำรายการเพิ่มปีบัญชีใหม่ และ งวดบัญชีของปีนั้น

FXREF: AC-ACCSERVICE-of_add_newyear-0000006
</description>

<arguments>
ai_account_year		ปีบัญชี
as_coop_id				สหกรณ์/สาขาที่ทำรายการ
adtm_start_year		วันที่เริ่มปีบัญชี
adtm_end_year			วันที่สิ้นสุดปิฃีบัญชี
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน coop_id เป็น coop_id
</history>
************************************************/

integer	ll_rowfind  ,ll_row , ll_old,ll_row_detail,ll_c ,index, li_year, li_month, li_day
integer	li_period, li_account_yprev, li_period_prev, li_yearnext
String		ls_date,ls_prev
datetime	ldtm_prev, ldtm_new_begin, ldtm_new_end

n_ds	lds_year_period

lds_year_period = create n_ds
lds_year_period.dataobject = 'd_acc_start_period'
lds_year_period.settransobject( itr_sqlca )

li_yearnext				= ai_account_year + 1

ldtm_new_begin		= datetime( inv_datetime.of_relativeyear( date( adtm_start_year ) , 1 ) )
ldtm_new_end			= datetime( inv_datetime.of_relativeyear( date( adtm_end_year ) , 1 ) )

INSERT INTO ACCACCOUNTYEAR  
(	ACCOUNT_YEAR,				BEGINNING_OF_ACCOU,				ENDING_OF_ACCOUNT,   			CLOSE_ACCOUNT_STAT,
	coop_id
)  
VALUES
( 	:li_yearnext,						:ldtm_new_begin,						:ldtm_new_end,						0,
	:as_coop_id
)  
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถเพิ่มปีบัญชีใหม่ได้ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

ll_c	= lds_year_period.retrieve( ai_account_year , as_coop_id)

for index = 1 to ll_c
	ldtm_prev		= lds_year_period.object.period_end[index]		
	// เพิ่มปี 1 ปี
	ldtm_prev		= datetime( inv_datetime.of_relativeyear( date( ldtm_prev ) , 1 ) )
	
	//เช็คเดือนกุมภาพันธ์ ที่มี 29 วัน
	li_year = Year(date(ldtm_prev)) 
	li_month = Month(date(ldtm_prev))
	li_day = Day(date(ldtm_prev))
	
	if( li_month =  2 ) then
	if( Mod(li_year,4) = 0 ) then 
		if(li_day <> 29) then
			li_day = 29
		end if
	end if

	ldtm_prev = DateTime(Date(li_year, li_month, li_day))
	end if
	
	li_period				= lds_year_period.object.period[index]
	li_account_yprev	= lds_year_period.object.account_year_prev[index]
	li_period_prev		= lds_year_period.object.period_prev[index]
	
	DELETE FROM ACCPERIOD
	WHERE	ACCOUNT_YEAR	= :li_yearnext AND
				PERIOD				= :li_period and
				coop_id			= :as_coop_id using itr_sqlca ;
			
	INSERT INTO ACCPERIOD
	(	ACCOUNT_YEAR,			PERIOD,				PERIOD_END_DATE,
		ACCOUNT_YEAR_PREV,	PERIOD_PREV,		coop_id,
		close_flag
	)  
	VALUES
	(	:li_yearnext,					:li_period,			:ldtm_prev,
		:li_account_yprev+1,		:li_period_prev,	:as_coop_id,
		0
	)  using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มงวดบัญชี ปีบัญชีใหม่ได้ " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
next	

return 1
end function

public function integer of_cancel_post_to_gl (string as_postlist_xml, string as_entry_id, string as_coop_id, datetime adtm_date) throws Exception;/***********************************************
<description>
	 ยกเลิกผ่านรายการไปแยกประเภท

</description>

<arguments>
as_postlist_xml			xml_datawindow รายการ voucher ที่จะทำการผ่านรายการ
as_entry_id				ผู้ทำรายการ
as_coop_id				รหัสสหกรณ์+สาขา
adtm_date				วันที่ผ่านรายการ
 
</arguments>

<return>
        integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน coop_id เป็น coop_id
</history>
*******************************************************/

n_ds	lds_vc_postlist
datetime		ldtm_date
string			ls_vcno
integer		li_index, li_row, li_rc,li_year, li_period, li_close_flag

lds_vc_postlist		= create n_ds
lds_vc_postlist.dataobject = "d_acc_select_topost_service"

// หากเป็นการปิดงวด ไปแล้ว ห้ามทำการยกเลิก
this.of_get_year_period( adtm_date, as_coop_id, li_year, li_period )
 
li_close_flag	= this.of_is_closemonth( li_year ,li_period ,as_coop_id )

if ( li_close_flag = 1 ) then
	ithw_exception.text	= "ไม่อนุญาต ให้ทำการยกเลิกรายการในงวดที่ได้ปิดไปแล้ว " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

if not  isnull( as_postlist_xml ) and trim( as_postlist_xml ) <> ""  then
	li_rc	= lds_vc_postlist.importstring( XML!, as_postlist_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

li_row		= lds_vc_postlist.rowcount()

for li_index = 1 to li_row
	
	ls_vcno		= lds_vc_postlist.GetitemString( li_index, "voucher_no" )
	
	update 	vcvoucher
	set			posttoacc_flag	= 0
	where	voucher_no		= :ls_vcno  and
				coop_id		= :as_coop_id using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถปรับปรุงการยกเลิกผ่านรายการไปแยกประเภทได้ " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
next

commit using itr_sqlca;

return 1
end function

public function integer of_cancel_voucher (datetime adtm_vc_date, string as_voucher, string as_coop_id) throws Exception;/***********************************************
<description>
	 ทำรายการยกเลิก voucher เลขที่ต้องการ 
</description>


<arguments>

	adtm_vc_date			ข้อมูลวันที่ ทำรายการยกเลิก
	as_voucher				ข้อมูลเลขที่ voucher เป็น list ต่อๆ กัน ตัวอย่าง '000001','000002','000003','000004','000005'
     as_coop_id				รหัสสหกรณ์+สาขา
 
</arguments>

<return>
        integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>
*************************************************/

integer	li_year, li_period, li_rc
string		ls_vc[], ls_voucher

this.of_get_year_period( adtm_vc_date, as_coop_id , li_year, li_period )

// ตรวจสอบการผ่านแยกประเภท
li_rc	= this.of_is_postall_voucher( as_voucher, 1, as_coop_id )
if li_rc > 0 then
	ithw_exception.text	= "ไม่สามารถยกเลิก voucher ได้ ต้องเป็นรายการที่ยังไม่ผ่านแยกประเภทเท่านั้น " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ตรวจสอบการปิดงวดบัญชี
li_rc	= this.of_is_closemonth( li_year, li_period, as_coop_id )
if li_rc = 1 then
	ithw_exception.text	= "ไม่สามารถยกเลิก voucher ได้ จากงวดที่ได้ปิดงานแล้ว " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

inv_string.of_parsetoarray( as_voucher  ,",", ls_vc)

li_period	= upperbound( ls_vc )

for li_rc = 1 to li_period
	ls_voucher	= ls_vc[li_rc]
	update	vcvoucher
	set			voucher_status		= -9
	where	( voucher_no		= :ls_voucher )  and
				( coop_id				= :as_coop_id) using itr_sqlca ;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถทำการยกเลิก voucher ที่ต้องการได้ กรุณาตรวจสอบ "   + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
next

commit using itr_sqlca;

return 1
end function

public function integer of_delete_accountid (string as_accountid, string as_coop_id) throws Exception;/***********************************************
<description>
ทำรายการลบรหัสบัญชี

FXREF: AC-ACCSERVICE-of_delete_accountid-0000001
</description>

<arguments>
as_accountid		รหัสบัญชีที่ต้องการลบ
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>
************************************************/
integer	li_found

// ลงรายวัน
li_found	= 0
select		count( account_id )
into		:li_found
from		vcvoucherdet
where	account_id	= :as_accountid and 
              coop_id     = :as_coop_id
using itr_sqlca;
if isnull( li_found ) then li_found = 0

if ( li_found > 0 ) then
	ithw_exception.text	= "ไม่สามารถลบรหัสบัญชีดังกล่าวได้ เนื่องจากมีการบันทึกรหัสดังกล่าวในรายการลงรายวันแล้ว"
	rollback using itr_sqlca;
	throw ithw_exception
end if

// ปิดเดือน
li_found	= 0
select		count( account_id )
into		:li_found
from		accsumledgerperiod
where	account_id	= :as_accountid and 
              coop_id     = :as_coop_id

using itr_sqlca;
if isnull( li_found ) then li_found = 0

if ( li_found > 0 ) then
	ithw_exception.text	= "ไม่สามารถลบรหัสบัญชีดังกล่าวได้ เนื่องจากมีการใช้ในรายการปิดสิ้นเดือนไปแล้ว"
	rollback using itr_sqlca;
	throw ithw_exception
end if

// มีการอ้างอิงจาก ผังบัญชี เนื่องจากเป้นบัญชีคุท
li_found	= 0
select		count( account_id )
into		:li_found
from		accmaster
where	account_id				<> :as_accountid and
			account_control_id		= :as_accountid   and 
              coop_id     = :as_coop_id
using itr_sqlca;
if isnull( li_found ) then li_found = 0

if ( li_found > 0 ) then
	ithw_exception.text	= "ไม่สามารถลบรหัสบัญชีดังกล่าวได้ เนื่องจากมีรหัสบัญชีอื่น อ้างเป็นบัญชีคุม "
	rollback using itr_sqlca;
	throw ithw_exception
end if

delete from accmaster
where account_id = :as_accountid and 
          coop_id     = :as_coop_id
using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถทำรายการลบรหัสบัญชีได้ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if
	
commit using itr_sqlca ;
return 1
end function

private function decimal of_find_sumlastyear (string as_account_id, string as_account_id_end, datetime adtm_start, datetime adtm_end, string as_coop_id, integer ai_bf_fw);dec{2}	ldc_begin_dr, ldc_begin_cr, ldc_dr,	ldc_cr, ldc_current_value_OLD_temp
string		ls_accnuture, ls_account_group_id
integer	li_year, li_period

this.of_get_year_period( adtm_start,as_coop_id, li_year, li_period )

select		account_group_id, account_nature
into		:ls_account_group_id, :ls_accnuture
from		accmaster
where	account_id	= :as_account_id and
			 coop_id		= :as_coop_id 
using itr_sqlca ;

ls_account_group_id	= trim( ls_account_group_id )

if isnull( ai_bf_fw ) then ai_bf_fw = 1
//หายอดยกมาปีที่แล้ว
choose case ai_bf_fw
	case 1 // ยกมา
		select		sum( begin_dr_amount ) , sum( begin_cr_amount )
		into		:ldc_begin_dr,:ldc_begin_cr	 
		from		accsumledgerperiod  
		where	( account_year	= :li_year ) and 
					( period			= :li_period) and 
					( account_id		between :as_account_id and :as_account_id_end )  and
					( coop_id		= :as_coop_id)
		using itr_sqlca ;
	case 2 // ยกไป
		select		sum( forward_dr_amount ) , sum( forward_cr_amount )
		into		:ldc_begin_dr,:ldc_begin_cr	 
		from		accsumledgerperiod  
		where	( account_year	= :li_year ) and 
					( period			= :li_period) and 
					( account_id		between :as_account_id and :as_account_id_end )  and
					( coop_id		= :as_coop_id) 
		using itr_sqlca ;
end choose
		

if isnull( ldc_begin_dr ) then ldc_begin_dr = 0.00
if isnull( ldc_begin_cr ) then ldc_begin_cr = 0.00

if ( trim( ls_accnuture ) = 'DR' ) then
	ldc_current_value_OLD_temp = ldc_begin_dr - ldc_begin_cr
else
	ldc_current_value_OLD_temp = ldc_begin_cr - ldc_begin_dr
end if

return ldc_current_value_OLD_temp
end function

private function decimal of_find_sumlastyear (string as_account_id, string as_account_id_end, datetime adtm_start, datetime adtm_end, string as_coop_id, integer ai_bf_fw, integer ai_dr_cr);dec{2}	ldc_begin_dr, ldc_begin_cr, ldc_dr,	ldc_cr, ldc_current_value_OLD_temp
string		ls_accnuture, ls_account_group_id
integer	li_year, li_period

this.of_get_year_period( adtm_start,as_coop_id, li_year, li_period )

select		account_group_id, account_nature
into		:ls_account_group_id, :ls_accnuture
from		accmaster
where	account_id	= :as_account_id and 
              coop_id       =:as_coop_id
using itr_sqlca ;

ls_account_group_id	= trim( ls_account_group_id )

if isnull( ai_bf_fw ) then ai_bf_fw = 1
//หายอดยกมาปีที่แล้ว
choose case ai_bf_fw
	case 1 // ยกมา
		select		sum( begin_dr_amount ) , sum( begin_cr_amount )
		into		:ldc_begin_dr,:ldc_begin_cr	 
		from		accsumledgerperiod  
		where	( account_year	= :li_year ) and 
					( period			= :li_period) and 
					( account_id		between :as_account_id and :as_account_id_end )  and
					( coop_id		= :as_coop_id)
		using itr_sqlca ;
	case 2 // ยกไป
		select		sum( forward_dr_amount ) , sum( forward_cr_amount )
		into		:ldc_begin_dr,:ldc_begin_cr	 
		from		accsumledgerperiod  
		where	( account_year	= :li_year ) and 
					( period			= :li_period) and 
					( account_id		between :as_account_id and :as_account_id_end )  and
					( coop_id		= :as_coop_id) 
		using itr_sqlca ;
end choose
		

if isnull( ldc_begin_dr ) then ldc_begin_dr = 0.00
if isnull( ldc_begin_cr ) then ldc_begin_cr = 0.00

if ( trim( ls_accnuture ) = 'DR' ) then
	ldc_current_value_OLD_temp = ldc_begin_dr - ldc_begin_cr
else
	ldc_current_value_OLD_temp = ldc_begin_cr - ldc_begin_dr
end if

// ต้องการ ยอด ฝั่งไหน
if isnull( ai_dr_cr ) then ai_dr_cr = 1
choose case ai_dr_cr
	case 1 // DR
		ldc_current_value_OLD_temp = ldc_begin_dr - ldc_begin_cr
	case 2 // CR
		ldc_current_value_OLD_temp = ldc_begin_cr - ldc_begin_dr
end choose

return ldc_current_value_OLD_temp
end function

public function integer of_gen_balance_sheet (string as_acc_bs_head_xml, string as_moneysheet_code, string as_coop_id, ref string as_acc_bs_ret_xml) throws Exception;integer	ll_month,ll_period,ll_year,ll_year_period,i , ll_count, li_remark
string		ls_month1, ls_month2, ls_moneysheet_code
integer	li_month1, li_month2, li_datagen_1, li_datagen_2
integer	li_index, li_page, li_show_all, li_percent_status
integer	li_rowshow, li_com_b1_b3,li_rc
datetime	ldtm_startdate, ldtm_enddate

n_ds	lds_acc_bs_sheet

lds_acc_bs_sheet		= create n_ds
lds_acc_bs_sheet.dataobject = "d_acc_design_master_service"

if not  isnull( as_acc_bs_head_xml ) and trim( as_acc_bs_head_xml ) <> ""  then
	li_rc	= lds_acc_bs_sheet.importstring( XML!, as_acc_bs_head_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

li_com_b1_b3		= lds_acc_bs_sheet.GetitemNumber( 1, "compare_b1_b3" )
if isnull( li_com_b1_b3 ) then li_com_b1_b3 = 0

li_percent_status		= lds_acc_bs_sheet.GetitemNumber( 1, "percent_status" )
if isnull( li_percent_status ) then li_percent_status = 0

ls_moneysheet_code		= trim( lds_acc_bs_sheet.Getitemstring( 1, "moneysheet_code" ) )
if isnull( ls_moneysheet_code ) then ls_moneysheet_code = ""

//*****  setup Initial  ***** // by ra ย้ายมาจาก of_show

ls_month1		= string(lds_acc_bs_sheet.object.month_1_1[1])
li_month1		= integer(ls_month1)
ls_month2		= string(lds_acc_bs_sheet.object.month_2_1[1])
li_month2		= integer(ls_month2)
li_show_all		= integer(lds_acc_bs_sheet.object.show_all[1])
li_datagen_1	= integer(lds_acc_bs_sheet.object.data_1[1])
li_datagen_2	= integer(lds_acc_bs_sheet.object.data_2[1])
li_remark		= integer(lds_acc_bs_sheet.object.show_remark[1])

if isnull( li_remark ) then li_remark = 0
if isnull( li_show_all ) then li_show_all = 1
li_page			= 1

if not isvalid( ids_finance_bs_show ) then
	ids_finance_bs_show	= create n_ds
	ids_finance_bs_show.dataobject = "d_acc_pl_service"
	ids_finance_bs_show.settransobject( itr_sqlca )
end if

ids_finance_bs_show.reset( )
li_rowshow		= ids_finance_bs_show.retrieve( as_moneysheet_code )

For li_index = 1 to li_rowshow
	if upper( trim( ids_finance_bs_show.object.description[li_index] ) ) = 'NEWPAGE' then
		li_page ++
		ids_finance_bs_show.object.show_status[li_index]	= 0
	end if
	//************  setup Initial  **************** //
	ids_finance_bs_show.object.percent_status[li_index]	= lds_acc_bs_sheet.object.percent_status[1] 	
	ids_finance_bs_show.object.sign_status[li_index]		= lds_acc_bs_sheet.object.sign_status[1] 	
	ids_finance_bs_show.object.show_header.text			= lds_acc_bs_sheet.object.report_heading[1] 	
	ids_finance_bs_show.object.total_show_1[li_index]	= lds_acc_bs_sheet.object.total_show[1]
	
	ids_finance_bs_show.object.page_group[li_index]		= li_page
	
next

ll_year	= lds_acc_bs_sheet.object.year_1[1] ; if isnull( ll_year ) then ll_year = 0
ll_year	= ll_year - 543
ll_month	= lds_acc_bs_sheet.object.month_1[1] ; if isnull( ll_month ) then ll_month = 0

if ( ll_year > 0 ) and ( ll_month > 0 ) then
	
	setnull( ldtm_enddate )
	
	this.of_get_year_period( ll_year, ll_month, as_coop_id, ll_year_period, ll_period ) 
	this.of_get_period_date( ll_year_period, ll_period, as_coop_id, ldtm_startdate, ldtm_enddate)
	
	// test by rah
	if ( li_datagen_1 = 1 ) then
		this.of_start_gen_finances_stm( as_moneysheet_code , ldtm_startdate , ldtm_enddate, as_coop_id,  0  )
	else
		this.of_start_gen_finances_stm( as_moneysheet_code , ldtm_startdate , ldtm_enddate,as_coop_id,  1  )
	end if
	
	this.of_show_bs( as_moneysheet_code, ll_year_period, ll_period ,  "balance_1", "balance_2", li_datagen_1 ,  as_coop_id)  //**
	

else
	ithw_exception.text	= "ยังไม่ระบุปีในการแสดงข้อมูล 1 "
	throw ithw_exception
end if

if  lds_acc_bs_sheet.object.total_show[1] > 1 then
	ll_year	= lds_acc_bs_sheet.object.year_2[1] ; if isnull( ll_year ) then ll_year = 0
	ll_year	= ll_year - 543
	ll_month	= lds_acc_bs_sheet.object.month_2[1] ; if isnull( ll_month ) then ll_month = 0

	if ( ll_year > 0 ) and ( ll_month > 0 ) then
		setnull( ldtm_enddate )
		this.of_get_year_period( ll_year, ll_month, as_coop_id, ll_year_period ,ll_period )	
		this.of_get_period_date( ll_year_period, ll_period, as_coop_id , ldtm_startdate, ldtm_enddate)
		
		// test by rah
		if ( li_datagen_2 = 1 ) then
			this.of_start_gen_finances_stm( as_moneysheet_code , ldtm_startdate , ldtm_enddate, as_coop_id , 0  )
		else
			this.of_start_gen_finances_stm( as_moneysheet_code , ldtm_startdate , ldtm_enddate, as_coop_id , 1  )
		end if
		
	
		this.of_show_bs( as_moneysheet_code, ll_year_period, ll_period ,  "balance_3", "balance_4", li_datagen_2,  as_coop_id)
	else
		ithw_exception.text	= "ยังไม่ระบุปีในการแสดงข้อมูล 2 "
		throw ithw_exception
	end if
end if

// by ra
if ( li_show_all = 1 ) then
	ids_finance_bs_show.SetFilter( "( show_status = 1 ) " )
else
	choose case lds_acc_bs_sheet.object.total_show[1]
		case 1
			ids_finance_bs_show.SetFilter( "( show_status = 1 ) and ( ( data_type  = 'TX' ) or ( ( data_type  <> 'TX' ) and ( abs( balance_1 ) > 0 ) ) )" )  //ทำให้จำนวนหน้ามีตามจริง
			
		case 2
			ids_finance_bs_show.SetFilter( "( show_status = 1 ) and ( ( data_type  = 'TX' ) or ( ( data_type  <> 'TX' ) and ( ( abs( balance_1 ) > 0 ) or ( abs( balance_3 ) > 0 ) ) ) )" )  //ทำให้จำนวนหน้ามีตามจริง
	end choose
end if

ids_finance_bs_show.Filter( )
ids_finance_bs_show.groupcalc( )

as_acc_bs_ret_xml	= ids_finance_bs_show.describe( "Datawindow.data.XML" )
return 1
end function

public function integer of_gen_cashflow_sheet (string as_acc_bs_head_xml, string as_moneysheet_code, string as_coop_id, ref string as_acc_bs_ret_xml) throws Exception;/***********************************************
<description>
ทำรายการจัดทำงบ กระแสเงินสด

FXREF: AC-ACCSERVICE-of_gen_cashflow_sheet-0000001
</description>

<arguments>
as_acc_bs_head_xml		เงื่อนไข การจัดทำงบ
as_moneysheet_code		รหัสงบการเงิน
as_coop_id				สาขา
as_acc_bs_ret_xml		งบการเงิน ที่ได้
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/

integer	ll_month,ll_period,ll_year,ll_year_period,i , ll_count, li_remark
string		ls_month1, ls_month2, ls_moneysheet_code
integer	li_month1, li_month2, li_datagen_1, li_datagen_2
integer	li_index, li_page, li_show_all, li_percent_status
integer	li_rowshow, li_com_b1_b3,li_rc, li_lastperiod, li_total_show
datetime	ldtm_startdate, ldtm_enddate

n_ds	lds_acc_bs_sheet

lds_acc_bs_sheet		= create n_ds
lds_acc_bs_sheet.dataobject = "d_acc_design_master_service"

if not  isnull( as_acc_bs_head_xml ) and trim( as_acc_bs_head_xml ) <> ""  then
	li_rc	= lds_acc_bs_sheet.importstring( XML!, as_acc_bs_head_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

li_com_b1_b3		= lds_acc_bs_sheet.GetitemNumber( 1, "compare_b1_b3" )
if isnull( li_com_b1_b3 ) then li_com_b1_b3 = 0

li_percent_status		= lds_acc_bs_sheet.GetitemNumber( 1, "percent_status" )
if isnull( li_percent_status ) then li_percent_status = 0

ls_moneysheet_code		= trim( lds_acc_bs_sheet.Getitemstring( 1, "moneysheet_code" ) )
if isnull( ls_moneysheet_code ) then ls_moneysheet_code = ""

//=================  setup Initial ============== // by ra ย้ายมาจาก of_show

ls_month1		= string(lds_acc_bs_sheet.object.month_1_1[1])
li_month1		= integer(ls_month1)
ls_month2		= string(lds_acc_bs_sheet.object.month_2_1[1])
li_month2		= integer(ls_month2)
li_show_all		= integer(lds_acc_bs_sheet.object.show_all[1])
li_datagen_1	= integer(lds_acc_bs_sheet.object.data_1[1])
li_datagen_2	= integer(lds_acc_bs_sheet.object.data_2[1])
li_remark		= integer(lds_acc_bs_sheet.object.show_remark[1])
li_total_show	= integer(lds_acc_bs_sheet.object.total_show[1])

if isnull( li_total_show ) then li_total_show = 1
if isnull( li_remark ) then li_remark = 0
if isnull( li_show_all ) then li_show_all = 1
li_page			= 1

if not isvalid( ids_finance_bs_show ) then
	ids_finance_bs_show	= create n_ds
	ids_finance_bs_show.dataobject = "d_acc_pl_service"
	ids_finance_bs_show.settransobject( itr_sqlca )
end if

ids_finance_bs_show.reset( )
li_rowshow		= ids_finance_bs_show.retrieve( as_moneysheet_code )

For li_index = 1 to li_rowshow
	if upper( trim( ids_finance_bs_show.object.description[li_index] ) ) = 'NEWPAGE' then
		li_page ++
		ids_finance_bs_show.object.show_status[li_index]	= 0
	end if
	// ================= setup Initial  ======================
	ids_finance_bs_show.object.percent_status[li_index]	= lds_acc_bs_sheet.object.percent_status[1] 	
	ids_finance_bs_show.object.sign_status[li_index]		= lds_acc_bs_sheet.object.sign_status[1] 	
	ids_finance_bs_show.object.show_header.text			= lds_acc_bs_sheet.object.report_heading[1] 	
	ids_finance_bs_show.object.total_show_1[li_index]	= lds_acc_bs_sheet.object.total_show[1]
	
	ids_finance_bs_show.object.page_group[li_index]		= li_page
	
next

// ปีที่ 1
ll_year	= lds_acc_bs_sheet.object.year_1[1] ; if isnull( ll_year ) then ll_year = 0
ll_year	= ll_year - 543

if ( ll_year > 0 ) and ( li_month1 > 0 ) then
	
	setnull( ldtm_enddate )
	
	this.of_get_year_period( ll_year, li_month1, as_coop_id, ll_year_period, ll_period ) 
	this.of_get_period_date( ll_year_period, ll_period, as_coop_id, ldtm_startdate, ldtm_enddate)
	
	this.of_gen_data_cashflow( ids_finance_bs_show, ll_year_period, ll_period ,  "balance_1", as_coop_id )
	
else
	ithw_exception.text	= "ยังไม่ระบุปีในการแสดงข้อมูล 1 "
	throw ithw_exception
end if

// ปีที่ 2
ll_year	= lds_acc_bs_sheet.object.year_2[1] ; if isnull( ll_year ) then ll_year = 0
ll_year	= ll_year - 543

if ( ll_year > 0 ) and ( li_month2 > 0 ) and ( li_total_show > 1 ) then
	
	setnull( ldtm_enddate )
	
	this.of_get_year_period( ll_year, li_month2, as_coop_id, ll_year_period, ll_period ) 
	this.of_get_period_date( ll_year_period, ll_period, as_coop_id, ldtm_startdate, ldtm_enddate)
	
	this.of_gen_data_cashflow( ids_finance_bs_show, ll_year_period, ll_period ,  "balance_3", as_coop_id )
	
//else
//	ithw_exception.text	= "ยังไม่ระบุปีในการแสดงข้อมูล 2 "
//	throw ithw_exception
end if

// by ra
if ( li_show_all = 1 ) then
	ids_finance_bs_show.SetFilter( "( show_status = 1 ) " )
else
	choose case li_total_show
		case 1
			ids_finance_bs_show.SetFilter( "( show_status = 1 ) and ( ( data_type  = 'TX' ) or ( ( data_type  <> 'TX' ) and ( abs( balance_1 ) > 0 ) ) )" )  //ทำให้จำนวนหน้ามีตามจริง
			
		case 2
			ids_finance_bs_show.SetFilter( "( show_status = 1 ) and ( ( data_type  = 'TX' ) or ( ( data_type  <> 'TX' ) and ( ( abs( balance_1 ) > 0 ) or ( abs( balance_3 ) > 0 ) ) ) )" )  //ทำให้จำนวนหน้ามีตามจริง
	end choose
end if

ids_finance_bs_show.Filter( )
ids_finance_bs_show.groupcalc( )

as_acc_bs_ret_xml	= ids_finance_bs_show.describe( "Datawindow.data.XML" )
return 1
end function

public function string of_gen_cashpaper_activities (datetime adtm_start, datetime adtm_end, integer ai_sum_period, string as_coop_id);/***********************************************
<description>
ทำรายการจัดทำกระดาษทำการงบกระแสเงินสด DR CR

FXREF: AC-ACCSERVICE-of_gen_cashpaper_drcr-0000001
</description>

<arguments>
adtm_start			วันที่เริ่มต้น
adtm_end			วันที่สิ้นสุด
ai_sum_period		รายเดือน หรือ สะสม
as_coop_id		สาขา
</arguments>

<return>
string		ข้อมูล กระดาษทำการ
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน coop_id เป็น coop_id
</history>
************************************************/

integer	li_year, li_period , li_index, li_last, li_insert
dec{2}	ldc_forward, ldc_begin, ldc_dramt, ldc_cramt, ldc_begin_pf,  ldc_dramt_pf  , ldc_cramt_pf 
string		ls_account_id_accmas, ls_account_name, ls_account_activity
string		ls_account_id
datetime	ldtm_start
n_ds		lds_report, lds_acc_listgen


lds_report	= create n_ds
lds_report.dataobject = "r_mth40_mth_cashflow_activities"

lds_acc_listgen	= create n_ds
lds_acc_listgen.dataobject = "d_acc_list_gen_cashflow_activity"
lds_acc_listgen.settransobject( itr_sqlca )


this.of_get_year_period( adtm_start , as_coop_id, li_year, li_period )

li_last = lds_acc_listgen.retrieve(as_coop_id )

// วันเริ่มต้นงวด
ldtm_start		= datetime( date( year( date( adtm_start ) ), month( date( adtm_start ) ), 1  ) )

if ( ai_sum_period = 1 ) then
	SELECT	PERIOD_END_DATE
	INTO		:ldtm_start
	FROM		ACCPERIOD
	WHERE	( ACCOUNT_YEAR	= :li_year ) AND  
				( PERIOD				= 1 )  and
				( coop_id			= :as_coop_id )
	using itr_sqlca ;

	ldtm_start		= datetime( date( year( date( ldtm_start ) ), month( date( ldtm_start ) ), 1  ) )
end if


//วนรอบทุก ๆบัญชี
For li_index = 1 to li_last
	// Display DR or CR
	ls_account_activity			= trim( lds_acc_listgen.object.account_activity[li_index] )
	ls_account_name			= trim( lds_acc_listgen.object.account_name[li_index] )
	ls_account_id				= trim( lds_acc_listgen.object.bg_fw_acclist[li_index] )
	
	// กรณี เป็น กำไร
	ldc_begin_pf	= 0.00
	ldc_dramt_pf	= 0.00
	ldc_cramt_pf	= 0.00
	
	if ( ls_account_id = is_account_pl_pf ) then
		this.of_get_profit(  li_year, li_period , ai_sum_period, ldc_begin_pf ,  ldc_dramt_pf  , ldc_cramt_pf , as_coop_id )
	end if
	
	// Begin
	ldc_begin		= 0.00
//	ls_account_id_accmas	= ""
//	ls_account_id_accmas	= trim( lds_acc_listgen.object.bg_fw_acclist[li_index] )
//	if isnull( ls_account_id_accmas ) then  ls_account_id_accmas = ""
//	ldc_begin	= this.of_get_result_gencash_begin( ls_account_id_accmas, ldtm_start, as_coop_id  )

	// DR
	ldc_dramt 		= 0.00
	ls_account_id_accmas	= ""
	ls_account_id_accmas	= trim( lds_acc_listgen.object.dr_acclist[li_index] )
	if isnull( ls_account_id_accmas ) then  ls_account_id_accmas = ""
	if ( ls_account_id_accmas <> "" ) then
		if ( ls_account_id = is_account_pl_pf ) then
			ldc_dramt	= this.of_get_result_gencash( ls_account_id_accmas,adtm_start, adtm_end ,ai_sum_period ,ldtm_start,as_coop_id, 0  )
		else
			ldc_dramt	= this.of_get_result_gencash( ls_account_id_accmas,adtm_start, adtm_end ,ai_sum_period ,ldtm_start,as_coop_id , 1 )
		end if
		
	end if
	
	// CR
	ldc_cramt		= 0.00
	ls_account_id_accmas	= ""
	ls_account_id_accmas	= trim( lds_acc_listgen.object.cr_acclist[li_index] )
	if isnull( ls_account_id_accmas ) then  ls_account_id_accmas = ""
	if ( ls_account_id_accmas <> "" ) then
		ldc_cramt	= this.of_get_result_gencash( ls_account_id_accmas,adtm_start, adtm_end ,ai_sum_period ,ldtm_start,as_coop_id , 1 )
	end if
	
	// รวมยอด
	ldc_begin	= 0.00 // ldc_begin + ldc_begin_pf
	ldc_forward	= 0.00
	ldc_dramt	= ldc_dramt + ldc_dramt_pf
	ldc_cramt	= ldc_cramt + ldc_cramt_pf
	
//	if ( ls_account_nature = 'CR' ) then
//		ldc_forward		= ldc_begin + ( ldc_cramt - ldc_dramt  )
//	else
//		ldc_forward		= ldc_begin + ( ldc_dramt - ldc_cramt )
//	end if
	
	if  ( ( ldc_begin > 0 ) or ( ldc_forward > 0 ) or ( ldc_dramt > 0 ) or ( ldc_cramt > 0 ) ) then
		li_insert		= 0
		li_insert		= lds_report.insertrow( 0 )
		lds_report.Setitem( li_insert, "account_id", string( li_insert ) )
		lds_report.Setitem( li_insert, "account_name", ls_account_name )
		lds_report.Setitem( li_insert, "account_activity", ls_account_activity )
		
		lds_report.Setitem( li_insert, "dr_effect", ldc_cramt )
		lds_report.Setitem( li_insert, "cr_effect", ldc_dramt )
		
		lds_report.Setitem( li_insert, "begin_amt",ldc_begin )
		lds_report.Setitem( li_insert, "forward_amt", ldc_forward )
	end if
	
next

lds_report.setfilter( " ( dr_effect > 0 ) or ( cr_effect > 0 ) or ( begin_amt > 0 ) or ( forward_amt > 0 ) " )
lds_report.Filter()

lds_report.Groupcalc( )

return lds_report.describe( "Datawindow.Data.XML" )
end function

public function string of_gen_cashpaper_drcr (datetime adtm_start, datetime adtm_end, integer ai_sum_period, string as_coop_id);/***********************************************
<description>
ทำรายการจัดทำกระดาษทำการงบกระแสเงินสด DR CR

FXREF: AC-ACCSERVICE-of_gen_cashpaper_drcr-0000001
</description>

<arguments>
adtm_start			วันที่เริ่มต้น
adtm_end			วันที่สิ้นสุด
ai_sum_period		รายเดือน หรือ สะสม
as_coop_id		สาขา
</arguments>

<return>
string		ข้อมูล กระดาษทำการ
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>

************************************************/

integer	li_year, li_period , li_index, li_last, li_insert, li_count, li_pos1, li_pos2
dec{2}	ldc_forward, ldc_begin, ldc_dramt, ldc_cramt
dec{2}	ldc_use_pf, ldc_begin_pf,  ldc_dramt_pf  , ldc_cramt_pf 
string		ls_account_id_accmas, ls_account_nature, ls_account_name, ls_account_activity
string		ls_account_id
datetime	ldtm_start
n_ds		lds_report, lds_acc_listgen


lds_report	= create n_ds
lds_report.dataobject = "r_mth40_mth_cashflow_drcr"

lds_acc_listgen	= create n_ds
lds_acc_listgen.dataobject = "d_acc_list_gen_cashflow_drcr"
lds_acc_listgen.settransobject( itr_sqlca )


this.of_get_year_period( adtm_start , as_coop_id, li_year, li_period )

li_last = lds_acc_listgen.retrieve( as_coop_id )

// วันเริ่มต้นงวด
ldtm_start		= datetime( date( year( date( adtm_start ) ), month( date( adtm_start ) ), 1  ) )

if ( ai_sum_period = 1 ) then
	SELECT	PERIOD_END_DATE
	INTO		:ldtm_start
	FROM		ACCPERIOD
	WHERE	( ACCOUNT_YEAR	= :li_year ) AND  
				( PERIOD				= 1 )  and
				( coop_id			= :as_coop_id )
	using itr_sqlca ;

	ldtm_start		= datetime( date( year( date( ldtm_start ) ), month( date( ldtm_start ) ), 1  ) )
end if


//วนรอบทุก ๆบัญชี
For li_index = 1 to li_last
	// Display DR or CR
	ls_account_nature			= trim( lds_acc_listgen.object.account_activity[li_index] )
	ls_account_nature			= upper( ls_account_nature )
	ls_account_name			= trim( lds_acc_listgen.object.account_name[li_index] )
	ls_account_id				= trim( lds_acc_listgen.object.bg_fw_acclist[li_index] )
	
	// กรณี เป็น กำไร
	ldc_begin_pf	= 0.00
	ldc_dramt_pf	= 0.00
	ldc_cramt_pf	= 0.00
	
	if ( ls_account_id = is_account_pl_pf ) then
		this.of_get_profit(  li_year, li_period , ai_sum_period, ldc_begin_pf ,  ldc_dramt_pf  , ldc_cramt_pf , as_coop_id )
	end if
	
	// Begin
	ldc_begin		= 0.00
	ls_account_id_accmas	= ""
	ls_account_id_accmas	= trim( lds_acc_listgen.object.bg_fw_acclist[li_index] )
	if isnull( ls_account_id_accmas ) then  ls_account_id_accmas = ""
	ldc_begin	= this.of_get_result_gencash_begin( ls_account_id_accmas, ldtm_start, as_coop_id  )
	
	
	// DR
	ldc_dramt 		= 0.00
	ls_account_id_accmas	= ""
	ls_account_id_accmas	= trim( lds_acc_listgen.object.dr_acclist[li_index] )
	if isnull( ls_account_id_accmas ) then  ls_account_id_accmas = ""
	if ( ls_account_id_accmas <> "" ) then
		if ( ls_account_id = is_account_pl_pf ) then
			ldc_dramt	= this.of_get_result_gencash( ls_account_id_accmas,adtm_start, adtm_end ,ai_sum_period ,ldtm_start,as_coop_id, 0 )
		else
			ldc_dramt	= this.of_get_result_gencash( ls_account_id_accmas,adtm_start, adtm_end ,ai_sum_period ,ldtm_start,as_coop_id , 1 )
		end if
		
	end if
	
	// CR
	ldc_cramt		= 0.00
	ls_account_id_accmas	= ""
	ls_account_id_accmas	= trim( lds_acc_listgen.object.cr_acclist[li_index] )
	if isnull( ls_account_id_accmas ) then  ls_account_id_accmas = ""
	if ( ls_account_id_accmas <> "" ) then
		ldc_cramt	= this.of_get_result_gencash( ls_account_id_accmas,adtm_start, adtm_end ,ai_sum_period ,ldtm_start,as_coop_id, 1  )
	end if
	
	// รวมยอด
	ldc_begin	= ldc_begin + ldc_begin_pf
	ldc_dramt	= ldc_dramt + ldc_dramt_pf
	ldc_cramt	= ldc_cramt + ldc_cramt_pf
	
	if ( ls_account_nature = 'CR' ) then
		ldc_forward		= ldc_begin + ( ldc_cramt - ldc_dramt  )
	else
		ldc_forward		= ldc_begin + ( ldc_dramt - ldc_cramt )
	end if
	
	//+++++++++++++++++++++++++++++++++++++++++
	// หากไม่ใช่รหัสกำไร ตรวจสอบดูว่า มีการจัดสรรกำไร หรือไม่
	li_count		= 0
	li_pos1		= 0
	li_pos2		= 0
	ldc_use_pf	= 0.00
	li_pos1		= pos( ls_account_id_accmas , "(")
	li_pos2		= pos( ls_account_id_accmas , ")")
	
	ls_account_id_accmas	= mid( ls_account_id_accmas , li_pos1 - 1 , li_pos2 - ( li_pos1 + 1 ) )
	if ( ls_account_id_accmas <> is_account_pl_pf  ) then		
		if ( ai_sum_period = 1 ) then
			select		sum( acc_balance ), count( acc_code )
			into		:ldc_use_pf, :li_count
			from		acc_contuseprofit
			where	acc_year		= :li_year and
						acc_code		= :ls_account_id_accmas and 
						coop_id		= :as_coop_id 
			using itr_sqlca ;
		else
			select		acc_balance
			into		:ldc_use_pf
			from		acc_contuseprofit
			where	acc_year		= :li_year and
						acc_period	= :li_period and
						acc_code		= :ls_account_id_accmas and 
						coop_id		= :as_coop_id 
						
			using itr_sqlca ;
			
			if itr_sqlca.sqlcode = 0 then li_count = 1
		end if
		
		if isnull( ldc_use_pf ) then ldc_use_pf = 0.00
		if isnull( li_count ) then li_count =0
		
		// หากมีการจัดสรร
		if ( li_count = 1 ) then
			ldc_cramt	= ldc_cramt - ldc_use_pf
		end if
			
	end if
	//+++++++++++++++++++++++++++++++++++++++++
	
	if  ( ( ldc_begin > 0 ) or ( ldc_forward > 0 ) or ( ldc_dramt > 0 ) or ( ldc_cramt > 0 ) ) then
		li_insert		= 0
		li_insert		= lds_report.insertrow( 0 )
		lds_report.Setitem( li_insert, "account_id", string( li_insert ) )
		lds_report.Setitem( li_insert, "account_name", ls_account_name )
		lds_report.Setitem( li_insert, "account_nature", ls_account_nature )
		
		lds_report.Setitem( li_insert, "dr_effect", ldc_dramt )
		lds_report.Setitem( li_insert, "cr_effect", ldc_cramt )
		lds_report.Setitem( li_index, "coop_id", as_coop_id )
		
		// กรณีไม่ระบุ ที่มาของยอดยกมา ก็ไม่ต้องมี ยก มา ยกไป
		if isnull( ls_account_id ) or trim( ls_account_id ) = "" then
			lds_report.Setitem( li_insert, "begin_amt", 0.00  )
			lds_report.Setitem( li_insert, "forward_amt", 0.00 )
		else
			lds_report.Setitem( li_insert, "begin_amt",ldc_begin )
			lds_report.Setitem( li_insert, "forward_amt", ldc_forward )
		end if
		
			
	end if
	
	// รายการจัดสรร กำไร
	if ( li_count > 0 ) then
		li_insert		= 0
		li_insert		= lds_report.insertrow( 0 )
		
		lds_report.Setitem( li_insert, "account_id", string( li_insert ) )
		lds_report.Setitem( li_insert, "account_name", ls_account_name )
		lds_report.Setitem( li_insert, "account_nature", ls_account_nature )
		
		lds_report.Setitem( li_index, "dr_effect", 0.00 )
		lds_report.Setitem( li_index, "cr_effect", ldc_use_pf )
		
		lds_report.Setitem( li_index, "begin_amt", 0.00 )
		lds_report.Setitem( li_index, "forward_amt", 0.00 )		
		lds_report.Setitem( li_index, "coop_id", as_coop_id )		
		
	end if
	
next

lds_report.setfilter( " ( dr_effect > 0 ) or ( cr_effect > 0 ) or ( begin_amt > 0 ) or ( forward_amt > 0 ) " )
lds_report.Filter()

lds_report.Groupcalc( )

return lds_report.describe( "Datawindow.Data.XML" )
end function

private function integer of_gen_data_cashflow (ref n_ds ads_finance_bs_show, integer arg_year, integer arg_period, string as_balance_data, string as_coop_id);string	ls_tog_desc
integer	ll_tog_status ,ll_togseq ,ll_tog_seq ,li_month1,li_month2
integer	ll_last , li_index  , ll_year , ll_row , ll_r , ll_found  ,ll_togle
string	ls_account_id ,ls_month1 ,ls_month2 
dec{2}	ll_balance , ll_percent, ldc_recv, ldc_pay
integer	ll_find, li_tog_status
dec{2}	ldc_on, ldc_under, ldc_dr, ldc_cr, ldc_total, ldc_sum
string	ls_data_type, ls_acc_nature
integer	ll_seq, li_lastperiod, li_clsyear, li_close_account_stat, li_page, li_found
dec{2}	ldc_begin_cr , ldc_begin_dr , ldc_begin
n_ds	lds_dwaccsum


// งวดบัญชีสุดท้ายของปี
select		max( period  )
into 		:li_lastperiod
from 		accperiod  
where	account_year	= :arg_year and 
 			coop_id =: as_coop_id
using itr_sqlca ;

// สถานะปิดสิ้นปี
SELECT	CLOSE_ACCOUNT_STAT
INTO		:li_clsyear
FROM		ACCACCOUNTYEAR
where	account_year	= :arg_year and 
 			coop_id =: as_coop_id
using itr_sqlca ;

// ดึงค่าที่ต้องการมาใส่ตัวแปรไว้ก่อน
if ( li_lastperiod = arg_period ) and ( li_clsyear = 1 ) then
	datetime	ldtm_start, ldtm_end
	select		period_end_date
	into		:ldtm_end
	from		ACCPERIOD 
	where	ACCOUNT_YEAR	= :arg_year and
				PERIOD				=  :arg_period and 
 				coop_id 				=: as_coop_id
	using itr_sqlca ;
	
	ldtm_start	= datetime( date( year( date( ldtm_end ) ), month(date( ldtm_end ) ), 1 ) )
end if


// by kowit
lds_dwaccsum = create n_ds
lds_dwaccsum.dataobject = 'd_acc_accsumledger_balance'
lds_dwaccsum.settransobject(itr_sqlca)

ll_last				= ads_finance_bs_show.rowcount()
ll_year			= arg_year
ll_row				= lds_dwaccsum.retrieve(  arg_year , arg_period ,as_coop_id)

// by ra ทำ FC ก่อนเพื่อทำการหาค่า
li_index	= 0
li_index	= ads_finance_bs_show.find( "data_type = 'FC'" , 1 ,  ll_last )

do while li_index > 0
	ls_data_type	= ads_finance_bs_show.object.data_type[li_index]
	li_tog_status	= ads_finance_bs_show.object.tog_status[li_index]
	ls_account_id	= trim( ads_finance_bs_show.object.data_desc[li_index] )
	
	// ทำการล้างค่าเดิมออกก่อน
	ldc_sum			= 0
	ldc_total			= 0
	ldc_dr				= 0
	ldc_cr				= 0
	ls_acc_nature	= ""
	
	ll_found			= lds_dwaccsum.find( "trim(account_id) = '" + ls_account_id + "'" , 1,  ll_row  )
	
	// by kowit  หา ยอดคงเหลือ	
	if ( ls_account_id <> is_account_pl_pf ) then
		// หากเป็นงวดสิ้นปีบัญชี และได้ปิดบัญชีแล้ว ให้เอายอดยกมา จากงวดก่อน
		// แล้วบวก ลบ กับยอดเคลื่อนไหว ระหว่างเดือนนั้น
		if ( li_lastperiod = arg_period ) and ( li_clsyear = 1 ) then
			ldc_begin_cr	= 0
			ldc_begin_dr	= 0
			ldc_begin		= 0			
			
			if ( ll_found > 0 ) then
				ldc_begin	= lds_dwaccsum.object.c_begin[ll_found]
				if isnull( ldc_begin ) then ldc_begin  = 0
			else
				ldc_begin	= this.of_get_balance_begin( ls_account_id,  ldtm_start , as_coop_id )
			end if
			
			if ( ldc_begin > 0 ) then
				ldc_begin_dr	= ldc_begin
			else
				ldc_begin_cr	= abs( ldc_begin )
			end if
			
			this.of_get_sum_drcr( ldtm_start , ldtm_end , ls_account_id , as_coop_id,   ldc_dr , ldc_cr  )
						
			if isnull( ldc_dr ) then ldc_dr  = 0
			if isnull( ldc_cr ) then ldc_cr  = 0			
			
			ldc_cr	+= ldc_begin_cr	
			ldc_dr	+= ldc_begin_dr
			
		else
			if ( ll_found > 0 ) then
				ldc_dr	= lds_dwaccsum.object.forward_dr_amount[ll_found]
				if isnull( ldc_dr ) then ldc_dr  = 0
				
				ldc_cr	= lds_dwaccsum.object.forward_cr_amount[ll_found]	
				if isnull( ldc_cr ) then ldc_cr  = 0
			else
				ldc_dr				= 0
				ldc_cr				= 0
				ldc_begin_cr	= 0
				ldc_begin_dr	= 0
				ldc_begin		= 0
				ldc_begin		= this.of_get_balance_begin( ls_account_id,  ldtm_start , as_coop_id )
				
				if ( ldc_begin > 0 ) then
					ldc_begin_dr	= ldc_begin
				else
					ldc_begin_cr	= abs( ldc_begin )
				end if
				
//				this.of_get_sum_drcr( ldtm_start , ldtm_end , ls_account_id , as_coop_id,   ldc_dr , ldc_cr  ,as_coop_id)
				
				ldc_cr	+= ldc_begin_cr	
				ldc_dr	+= ldc_begin_dr
			
			end if
		end if
		
	else
		//หา กำไร	
		// ยังคงต้อง เอา dr cr กำไรมาก่อน
		if ( ll_found > 0 ) then
			ldc_dr = lds_dwaccsum.object.forward_dr_amount[ll_found]
			if isnull( ldc_dr ) then ldc_dr  = 0
			
			ldc_cr = lds_dwaccsum.object.forward_cr_amount[ll_found]	
			if isnull( ldc_cr ) then ldc_cr  = 0
		else
			ldc_dr				= 0
			ldc_cr				= 0
			ldc_begin_cr	= 0
			ldc_begin_dr	= 0
			ldc_begin		= 0
			ldc_begin		= this.of_get_balance_begin( ls_account_id,  ldtm_start , as_coop_id )
			
			if ( ldc_begin > 0 ) then
				ldc_begin_dr	= ldc_begin
			else
				ldc_begin_cr	= abs( ldc_begin )
			end if
			
//			this.of_get_sum_drcr( ldtm_start , ldtm_end , ls_account_id , as_coop_id,   ldc_dr , ldc_cr,as_coop_id  )
			
			ldc_cr	+= ldc_begin_cr	
			ldc_dr	+= ldc_begin_dr
				
		end if
		
		// หากเป็น งวดที่ 12 ของ ปีบัญชีที่ ปิดไปแล้ว ให้ค่า เป็น 0
		if ( arg_period = 12 ) then
			select		close_account_stat
			into		:li_close_account_stat
			from		accaccountyear
			where	account_year	= :arg_year and 
			             coop_id 			=:as_coop_id
			using itr_sqlca ;
			
			if ( li_close_account_stat = 1 ) then
				ldc_cr	= 0
				ldc_dr	= 0
			end if
		end if
		
		// กำไรที่เกิดจาก รายได้ค่าใช้จ่าย
		if ( ll_row > 0 ) then
			ldc_total	= lds_dwaccsum.object.c_profit[1]
			if isnull( ldc_total ) then ldc_total  = 0
		else
			ldc_total	= this.of_profit_year( arg_year, arg_period , as_coop_id)
		end if
		
		// รวมยอดเงิน กำไรยกมา และ กำไรที่มาจากรายได้ - ค่าใช้จ่าย
		if	( ldc_total > 0 ) then
			ldc_cr += ldc_total
		else
			// เดิม คือ ldc_dr = ldc_total
			ldc_dr += abs( ldc_total )
		end if		
	
	end if
	
	// หา ฝั่งบัญชี
	select		account_nature
	into		:ls_acc_nature
	from		accmaster
	where	account_id	= :ls_account_id  and 
			     coop_id 		=:as_coop_id
	using itr_sqlca ;
	
	ls_acc_nature	= trim( ls_acc_nature )
	
	if ( ls_acc_nature  = 'DR' ) then
		ldc_sum = ldc_dr - ldc_cr		
	else	
		ldc_sum = ldc_cr - ldc_dr		
	end if
	
	ads_finance_bs_show.setitem( li_index , as_balance_data, ldc_sum )
	
	li_index ++
	if ( li_index > ll_last ) then exit
	li_index	= ads_finance_bs_show.find( "data_type = 'FC'" , li_index , ll_last )
loop


// by ra ทำ SM เพื่อหาค่าสรุป
li_index	= 0
li_index	= ads_finance_bs_show.find( "data_type = 'SM'" , li_index , ll_last  )
do while li_index > 0
	ls_data_type	= ads_finance_bs_show.object.data_type[li_index]
	li_tog_status	= ads_finance_bs_show.object.tog_status[li_index]
	
	ls_account_id	= trim( ads_finance_bs_show.object.data_desc[li_index] )
	ldc_sum			= 0.00
	ldc_sum			= this.of_gendata_sm_cashflow( ls_account_id, as_balance_data , ads_finance_bs_show, arg_year, arg_period, as_coop_id )
	ads_finance_bs_show.setitem( li_index , as_balance_data , ldc_sum )
	
	li_index ++
	if ( li_index > ll_last ) then exit
	li_index	= ads_finance_bs_show.find( "data_type = 'SM'" , li_index ,  ll_last )
loop
ads_finance_bs_show.accepttext()

return 1
end function

private subroutine of_get_sum_between_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา   
// Use by  Report
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b    
			
where 	( a.voucher_no		= b.voucher_no ) and
			( a.coop_id = b.coop_id) and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( b.account_id		= :as_account_id) and
			( b.posttogl_allflag	= 1) and
			( a.coop_id  =:as_coop_id) and   
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
			(a.coop_id             = b.coop_id ) and 
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	< :adtm_enddate ) and
			( b.account_id		= :as_account_id) and
			( a.coop_id =: as_coop_id) and
			( a.voucher_status	= 1 ) 
using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, integer ai_flag, string as_coop_id);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
              ( a.coop_id = b.coop_id ) and 
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	< :adtm_enddate ) and
			( b.account_id		= :as_account_id) and
			( b.posttogl_allflag	= 1)and
			( a.coop_id  = :as_coop_id ) and 
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

public function integer of_gen_trial_bs (string as_choose_report_xml, string as_coop_id, ref string as_trial_report_xml) throws Exception;integer	li_index ,li_period ,li_year, li_rc
string		ls_account_id ,ls_account_control_id ,ls_check_flag,ls_filter, ls_account_control_2level
string		ls_account_nature,ls_account_rev_group,ls_account_group_id,ls_account_name
dec{2}  	ldc_begin_dr,ldc_begin_cr, ldc_sumall, ldc_sumdr,ldc_sumcr ,ldc_begin_beforedate
integer 	ll_last,li_account_sort , li_insertrow, li_headstatus,li_seq_no, li_report_select
datetime	ldt_journal_date, ldtm_start,ldtm_startdate, ldtm_enddate
dec{2}	ldc_sumalldr,	ldc_sumallcr, ldc_dr, ldc_cr, ldc_sumdr_adj, ldc_sumcr_adj, ldc_profit_month, ldc_profit_year
integer	li_typeaccid, li_onreport, li_found, li_report_sort, li_temp
long		 ll_index   //**

n_ds  lds_accmaster, lds_trial_bs, lds_choose_for_report, lds_bs_report //**

lds_accmaster = create n_ds
lds_accmaster.dataobject = "d_acc_accmaster_for_trail_bs_service"
lds_accmaster.settransobject(itr_sqlca)

lds_trial_bs = create n_ds
lds_trial_bs.dataobject = "d_acc_rpt_trilebalance_detail_14_service"

ll_last = lds_accmaster.retrieve(as_coop_id)

lds_choose_for_report	= create n_ds
lds_choose_for_report.dataobject = "d_ac_cri_for_gen_bs"

if not  isnull( as_choose_report_xml ) and trim( as_choose_report_xml ) <> ""  then
	li_rc	= lds_choose_for_report.importstring( XML!, as_choose_report_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

ldtm_startdate		= lds_choose_for_report.getitemdatetime(1,"start_date")
ldtm_enddate		= lds_choose_for_report.getitemdatetime(1,"end_date")
ls_check_flag		= lds_choose_for_report.getitemstring(1,"check_flag") 
li_seq_no			= lds_choose_for_report.object.seq_no[1]	
li_report_select		= lds_choose_for_report.object.on_report[1]	

this.of_get_year_period( ldtm_startdate, as_coop_id, li_year, li_period  )

// วันเริ่มต้นงวด
ldtm_start		= datetime( date( year( date( ldtm_startdate ) ), month( date( ldtm_startdate ) ), 1  ) )

li_headstatus	= this.of_is_headquater( as_coop_id )

li_report_sort	= ll_last
li_temp			= 0

//วนรอบทุก ๆบัญชี
For li_index  = 1 to ll_last
	lds_trial_bs.accepttext()
	
	ldc_sumall				= 0.0
	ldc_sumdr				= 0.0
	ldc_sumcr				= 0.0
	ldc_begin_dr			= 0.0
	ldc_begin_cr			= 0.0
	ldc_sumalldr			= 0.0
	ldc_sumallcr				= 0.0	
	ls_account_id			= ""
	ls_account_name		= ""

	ls_account_id				= trim( lds_accmaster.object.account_id[ li_index ] )
	ls_account_name			= trim( lds_accmaster.object.account_name[ li_index ] )
	ls_account_group_id		= trim( lds_accmaster.object.account_group_id[ li_index ] )
	ls_account_rev_group		= trim( lds_accmaster.object.account_rev_group[ li_index ] )
	ls_account_nature			= trim( lds_accmaster.object.account_nature[ li_index ] )
	ls_account_control_id		= trim( lds_accmaster.object.account_control_id[ li_index ] )
//	ls_account_control_2level =  trim( lds_accmaster.object.accmaster_account_control_2level[ li_index ] ) 
	li_account_sort				= lds_accmaster.object.account_sort[ li_index ]
	li_typeaccid					= integer( trim(  lds_accmaster.object.account_type_id[ li_index ] ) )
	li_onreport					= lds_accmaster.object.on_report[ li_index ]
	
	if ( li_typeaccid <> 3 ) then
		if ( li_report_select = 3 ) then
			ls_account_name	= "รวม " + ls_account_name
		end if
		
		// ควรจะเป็นเท่าไหร่ ดูมากที่สุดของ ตัวที่ refer แล้ว เพิ่มอีก 1
		li_report_sort		= 0
		
		ldc_begin_cr	= 0.00
		ldc_begin_dr	= 0.00
		ldc_sumdr		= 0.00
		ldc_sumcr		= 0.00
		ldc_sumallcr		= 0.00
		ldc_sumalldr	= 0.00		
		li_found			= 0
		li_found			= lds_trial_bs.find( " trim( control_id ) = trim( ' " + ls_account_id + " ') " , 0 , li_index - 1  )
		
		do while li_found > 0
			ldc_begin_cr	+= lds_trial_bs.object.begin_cr[li_found]
			ldc_begin_dr	+= lds_trial_bs.object.begin_dr[li_found]
			ldc_sumdr		+= lds_trial_bs.object.dr_amt[li_found]
			ldc_sumcr		+= lds_trial_bs.object.cr_amt[li_found]
			ldc_sumdr		+= lds_trial_bs.object.aj_dr[li_found]
			ldc_sumcr		+= lds_trial_bs.object.aj_cr[li_found]
			ldc_sumallcr		+= lds_trial_bs.object.forward_cr[li_found]
			ldc_sumalldr	+= lds_trial_bs.object.forward_dr[li_found]

			if ( li_report_sort < lds_trial_bs.object.report_sort[li_found] ) then
				li_report_sort	= lds_trial_bs.object.report_sort[li_found]
			end if

			li_found ++
			if ( li_found >(  li_index - 1 )  ) then exit
			li_found		= lds_trial_bs.find( " trim( control_id ) = trim( '" + ls_account_id + "' ) " , li_found , li_index - 1  )
		loop

		li_report_sort		= li_report_sort + 1
		li_temp				= 0

		// ไปที่ตำแหน่ง เริ่มการ 
		Goto BeGinInsert
	else
		li_report_sort	= ll_last - li_index
		li_temp ++
	end if

	if ( li_period = 1 ) and ( ( trim( ls_account_group_id ) = '4' ) or ( trim( ls_account_group_id ) = '5' ) ) then
		ldc_begin_beforedate			= 0
	else
		if ( li_period = 1 ) and ( li_headstatus = 0 ) then
			ldc_begin_beforedate		= 0
		else
			ldc_begin_beforedate		= this.of_get_balance_begin( ls_account_id , ldtm_startdate, as_coop_id )
		end if		

	end if

	if ( date( ldtm_startdate ) <> date( ldtm_start ) ) then
		ldc_dr		= 0
		ldc_cr		= 0
		this.of_get_sum_drcr( ldtm_start , ldtm_startdate , ls_account_id , as_coop_id,   ldc_dr , ldc_cr  )		

		if isnull( ldc_dr ) then ldc_dr = 0.00
		if isnull( ldc_cr ) then ldc_cr = 0.00

		ldc_begin_beforedate = ( ldc_dr - ldc_cr ) + ldc_begin_beforedate
	end if

	choose case ldc_begin_beforedate
		case is > 0
			ldc_begin_dr	= ldc_begin_beforedate 

		case is < 0
			ldc_begin_cr	= abs(ldc_begin_beforedate)

		case else
			ldc_begin_cr	= 0
			ldc_begin_dr	= 0 

	end choose

	this.of_get_sum_between_drcr( ldtm_startdate , ldtm_enddate , ls_account_id ,   ldc_sumdr , ldc_sumcr ,as_coop_id  )

	this.of_get_sum_between_drcr_adj( ldtm_startdate , ldtm_enddate , ls_account_id , as_coop_id,   ldc_sumdr_adj , ldc_sumcr_adj  )

	if isnull( ldc_sumdr ) then ldc_sumdr = 0.0
	if isnull( ldc_sumcr ) then ldc_sumcr = 0.0
	if isnull( ldc_sumdr_adj ) then ldc_sumdr_adj = 0.0
	if isnull( ldc_sumcr_adj ) then ldc_sumcr_adj = 0.0

	// ลบยอด ปรับปรุงก่อน
	ldc_sumdr	= ldc_sumdr - ldc_sumdr_adj
	ldc_sumcr	= ldc_sumcr - ldc_sumcr_adj

	// นำยอด รวมฝั่ง DR ตั้งลบด้วย ยอดรวมฝั่ง CR อล้วบวกเพิ่มด้วย ยอดยกมา
	ldc_sumall	= ( ldc_sumdr - ldc_sumcr ) + ldc_begin_beforedate	

	// ตรวจสอบผลลัพธ์ที่ได้
	choose case ldc_sumall
		case is > 0 // หากยอดรวมทั้งหมด มีค่าเป็น +
			ldc_sumalldr	= ldc_sumall

		case is < 0 // หากยอดรวมทั้งหมด มีค่าเป็น -
			ldc_sumallcr		= abs( ldc_sumall )

		case else // หากยอดรวมทั้งหมด มีค่าเป็น 0
			ldc_sumallcr		= 0
			ldc_sumalldr	= 0

	end choose

	if (ls_account_nature= 'DR') and ( ldc_sumall < 0 ) then
		ls_account_group_id	= ls_account_rev_group
	end if	

	////หากำไร(ขาดทุน) ประจำงวด , ประจำปี
	//ldc_profit_month  	= this.of_profit_month( li_year , li_period , as_coop_id)
	//ldc_profit_year		= this.of_profit_year( li_year , li_period , as_coop_id)
	
	if isnull( ldc_profit_month ) then ldc_profit_month = 0.00
	if isnull( ldc_profit_year ) then ldc_profit_year = 0.00

	BeGinInsert:

	//insert ข้อมูลใส่ table 	accsumledgerdate ไว้ก่อนแล้วค่อย show ใน datawindow ทีหลัง

	li_insertrow	= lds_trial_bs.insertrow( 0 )
	lds_trial_bs.Setitem( li_insertrow, "account_id", ls_account_id )
	lds_trial_bs.Setitem( li_insertrow, "jounal_date", ldt_journal_date )
	lds_trial_bs.Setitem( li_insertrow, "account_name", ls_account_name )		
	lds_trial_bs.Setitem( li_insertrow, "group_id", ls_account_group_id )
	lds_trial_bs.Setitem( li_insertrow, "begin_cr", ldc_begin_cr )
	lds_trial_bs.Setitem( li_insertrow, "begin_dr", ldc_begin_dr )
	lds_trial_bs.Setitem( li_insertrow, "dr_amt", ldc_sumdr )
	lds_trial_bs.Setitem( li_insertrow, "cr_amt", ldc_sumcr )
	lds_trial_bs.Setitem( li_insertrow, "aj_dr", ldc_sumdr_adj )
	lds_trial_bs.Setitem( li_insertrow, "aj_cr", ldc_sumcr_adj )
	lds_trial_bs.Setitem( li_insertrow, "forward_cr", ldc_sumallcr )
	lds_trial_bs.Setitem( li_insertrow, "forward_dr", ldc_sumalldr )
	lds_trial_bs.Setitem( li_insertrow, "account_sort", li_account_sort )
	lds_trial_bs.Setitem( li_insertrow, "control_id", ls_account_control_id )
	lds_trial_bs.Setitem( li_insertrow, "coop_id", as_coop_id )
	lds_trial_bs.Setitem( li_insertrow, "acc_typeaccid", li_typeaccid )
	lds_trial_bs.Setitem( li_insertrow, "on_report", li_onreport )
	lds_trial_bs.Setitem( li_insertrow, "report_sort", li_report_sort )
	lds_trial_bs.Setitem( li_insertrow, "profit_month", ldc_profit_month )
	lds_trial_bs.Setitem( li_insertrow, "profit_year", ldc_profit_year )
//	lds_trial_bs.Setitem( li_insertrow, "account_control_2lv", ls_account_control_2level )//เพิ่มเติมเพื่อจัดกลุ่มของรายงานกิจการของสหกรณ์ ให้ สอ.มหิดล by mike
	
next

// รหัสสอ. ออมสิน ไม่มียอดเคลื่อนไหวให้ออกรายงานด้วย
if(as_coop_id = '013001') then
ls_check_flag = "05" 

end if


choose case ls_check_flag
	case "01"
		ls_filter	= "( ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amt > 0 ) or ( cr_amt >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) or ( aj_dr  >0 ) or ( aj_cr >0 ) ) "
//		ls_filter	= " ( ( begin_cr >0 ) or ( begin_dr >0 ) or ( dr_amt >0 ) or (  cr_amt >0 ) or (  forward_dr >0 ) or (  forward_cr >0 ) )"
		
	case "02"
		ls_filter	= "( ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amt > 0 ) or ( cr_amt >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) or ( aj_dr  >0 ) or ( aj_cr >0 ) ) "
//		ls_filter	= "( ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amt >0 ) or ( cr_amt >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) ) "
		
	case "03"
		ls_filter	= "( ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amt > 0 ) or ( cr_amt >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) or ( aj_dr  >0 ) or ( aj_cr >0 ) ) "
		
	case "04"
		ls_filter	= "( ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amt > 0 ) or ( cr_amt >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) or ( aj_dr  >0 ) or ( aj_cr >0 ) ) "
//		ls_filter	= "( ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amt >0 ) or ( cr_amt >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) ) "
	case "05"
		ls_filter	= "( on_report = 1 ) and ( acc_typeaccid = 3 )"
		
		
end choose

choose case li_report_select
	case 1
		ls_filter	= ls_filter + " and ( on_report = 1 ) and ( acc_typeaccid = 3 ) "
	
	case 2
		ls_filter	= ls_filter + " and ( on_report = 1 ) and ( acc_typeaccid <> 3 ) "
		
	case 3, 4
		ls_filter	= ls_filter + " and ( on_report = 1 ) "
		
	case else
		ls_filter	= ls_filter + " and ( on_report = 1 ) and ( acc_typeaccid = 3 ) "
		
end choose

if ( ls_check_flag <>  "04" ) then
	if li_seq_no = 1 then
		lds_trial_bs.setsort( "report_sort A, group_id A, control_id A , account_id A" )
	else
		lds_trial_bs.setsort( "report_sort A, group_id A, control_id A , account_sort A,  account_id A" )
	end if

	lds_trial_bs.sort( )
	
	li_rc	= lds_trial_bs.SetFilter( ls_filter )
	li_rc	= lds_trial_bs.Filter()
	
	
	lds_trial_bs.Groupcalc( )
	elseif( ls_check_flag =  "04" ) then
	if li_seq_no = 1 then
		lds_trial_bs.setsort( "report_sort A, group_id A, control_id A , account_id A" )
	else
		lds_trial_bs.setsort( "report_sort A, group_id A, control_id A , account_sort A,  account_id A" )
	end if

	lds_trial_bs.sort( )
	
	li_rc	= lds_trial_bs.SetFilter( ls_filter )
	li_rc	= lds_trial_bs.Filter()
	
	
	lds_trial_bs.Groupcalc( )
end if

lds_trial_bs.accepttext( )
as_trial_report_xml	= lds_trial_bs.describe( "Datawindow.data.XML" )
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////**** ยิงออก excel
lds_bs_report		= create n_ds
lds_bs_report.dataobject = "d_acc_rpt_trilebalance_detail_14_excel"   

if not  isnull( as_trial_report_xml ) and trim( as_trial_report_xml ) <> ""  then
	li_rc	= lds_bs_report.importstring( XML!, as_trial_report_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if


//ลบข้อมูลเก่าทิ้ง
delete from acc_excel_tribalance
using itr_sqlca ;

//d_acc_pl_service_report

//ll_row		= lds_bs_report.retrieve( as_moneysheet_code )
// ถ้าไม่มีรายการออกไป
if li_rc <= 0 then
	return 1
end if

for ll_index = 1 to li_rc

	ls_account_id	=  lds_bs_report.object.account_id[ ll_index ]
	ls_account_name	=  lds_bs_report.object.account_name[ ll_index ]
	ls_account_group_id	=  lds_bs_report.object.group_id[ ll_index ]
	ldc_begin_dr			=  lds_bs_report.object.begin_dr[ ll_index ]
	ldc_begin_cr			=  lds_bs_report.object.begin_cr[ ll_index ]
	ldc_sumdr				=  lds_bs_report.object.dr_amt[ ll_index ]
	ldc_sumcr				=  lds_bs_report.object.cr_amt[ ll_index ]
	ldc_sumalldr			=  lds_bs_report.object.forward_dr[ ll_index ]
	ldc_sumallcr				=  lds_bs_report.object.forward_cr[ ll_index ]
	ldc_sumdr_adj			=  lds_bs_report.object.aj_dr[ ll_index ]
	ldc_sumcr_adj			=  lds_bs_report.object.aj_cr[ ll_index ]

	if isnull(ldc_begin_dr) then ldc_begin_dr = 0.00
	if isnull(ldc_begin_cr) then ldc_begin_cr = 0.00
	if isnull(ldc_sumdr) then ldc_sumdr = 0.00
	if isnull(ldc_sumcr) then ldc_sumcr = 0.00
	if isnull(ldc_sumalldr) then ldc_sumalldr = 0.00
	if isnull(ldc_sumallcr) then ldc_sumallcr = 0.00
	if isnull(ldc_sumdr_adj) then ldc_sumdr_adj = 0.00
	if isnull(ldc_sumcr_adj) then ldc_sumcr_adj = 0.00
//	
//	ldc_sum1	=	ldc_balance1 + ldc_balance2     //ยอดรวมของรายการที่ 1
//	ldc_sum2	=	ldc_balance3 + ldc_balance4	//ยอดรวมของรายการที่ 2
//	ldc_sumpercent1	=	ldc_percent1 + ldc_percent2
//	ldc_sumpercent2	= 	ldc_percent3 + ldc_percent4
//	
  INSERT INTO ACC_EXCEL_TRIBALANCE  
         ( COOP_ID,              			ACCOUNT_ID,              		ACCOUNT_NAME,   
           BEGIN_DR,   			          	BEGIN_CR,   		        	DR_AMT,   
           CR_AMT,   			           	FORWARD_DR,   					FORWARD_CR,   
           AJ_DR,   				        AJ_CR,   		             	GROUP_ID)  
  VALUES ( 
  		  :as_coop_id,						:ls_account_id,					:ls_account_name,
		  :ldc_begin_dr,					:ldc_begin_cr,					:ldc_sumdr,
		  :ldc_sumcr,						:ldc_sumalldr,					:ldc_sumallcr,
  		  :ldc_sumdr_adj,					:ldc_sumcr_adj,				:ls_account_group_id
		  ) using itr_sqlca ;
  
  if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถออกรายงานได้ กรุณาตรวจสอบ "   + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if

next
//****

return 1
end function

public function integer of_is_headquater (string as_coop_id);integer	li_headstatus

select		head_status
into		:li_headstatus
from		cmucfcoopbranch
where	coop_id		= :as_coop_id 
using itr_sqlca;

if isnull( li_headstatus ) then li_headstatus = 1

return li_headstatus
end function

private subroutine of_get_sum_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_coop_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, integer ai_flag);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
			(a.coop_id = b.coop_id ) and 
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	< :adtm_enddate ) and
			( b.account_id		= :as_account_id)  and 
			( b.posttogl_allflag	= :ai_flag) and
			( a.coop_id  = :as_coop_id   )   and
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_coop_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and      
	         ( a.coop_id  = b.coop_id ) and 
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	< :adtm_enddate ) and
			( b.account_id		= :as_account_id)  and	 
			( a.coop_id =:as_coop_id) and 	 
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_drcr (datetime adtm_begindate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
              ( a.coop_id  = b.coop_id ) and 
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	= :adtm_begindate ) and
			( b.account_id		= :as_account_id)  and
			( a.coop_id = as_coop_id) and 
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_between_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, integer ai_flag, string as_coop_id);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
			( a.coop_id = b.coop_id) and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( b.account_id		= :as_account_id) and
			( b.posttogl_allflag	= 1) and
			( a.coop_id  =:  as_coop_id) and   
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

public function string of_gen_day_journalreport (datetime adtm_start_date, datetime adtm_end_date, integer ai_type_group, string as_coop_id);/***********************************************
<description>
ทำรายการทำรายงาน สรุปประจำวัน

FXREF: AC-ACCSERVICE-of_gen_day_journalreport-0000001
</description>

<arguments>
adtm_start_date		วันที่เริ่มต้น
adtm_end_date			วันที่สิ้นสุด
ai_type_group			ประเภท ที่ต้องการ 1 เงินสด 2 รายการโอน 3 รายการปรับปรุง 4 ทุกรายการ
as_branch_id			สาขา
</arguments>

<return>
string ข้อมูลรายการ ออกรายงาน
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>
************************************************/

datetime	ldtm_temp, ldtm_firstdate, ldtm_startdate
dec{2}	ldc_begin, ldc_forward, ldc_sumdr, ldc_sumcr, ldc_begin_first
long		ll_index, ll_row
n_ds		lds_report

lds_report	= create n_ds
lds_report.dataobject = "r_day10_journal"
lds_report.settransobject( itr_sqlca )

ldtm_firstdate		= datetime( date( year( date( adtm_start_date ) ), month( date( adtm_start_date ) ), 1  ) )

if ( ai_type_group = 4 ) then
	lds_report.retrieve( adtm_start_date, adtm_end_date, is_cash_id, 1 , 4 , as_coop_id )
else
	lds_report.retrieve( adtm_start_date, adtm_end_date, is_cash_id, ai_type_group , ai_type_group , as_coop_id )
end if

ll_row		= lds_report.rowcount()
setnull( ldtm_temp )

// ยกมาต้นงวด
ldc_begin_first		=	this.of_get_balance_begin( is_cash_id,ldtm_firstdate, as_coop_id  )

if isnull( ldc_begin ) then ldc_begin  = 0.00
			
if ( ai_type_group	= 1 ) or ( ai_type_group = 4 ) then
	ldc_forward	= 0.00
	
	for ll_index = 1 to ll_row
		ldtm_startdate	= lds_report.GetitemDatetime( ll_index, "voucher_date" )
		
		if ( date( ldtm_startdate ) = date( ldtm_temp ) ) then
			lds_report.object.balance_begin[ll_index]	= ldc_begin
			lds_report.object.balance_forward[ll_index]	= ldc_forward
		else			
			ldc_forward		= 0.00
			ldc_sumdr		= 0.00
			ldc_sumcr		= 0.00
			
			this.of_get_sum_notpost_drcr( ldtm_firstdate , ldtm_startdate , is_cash_id , as_coop_id,   ldc_sumdr , ldc_sumcr  )			
			ldc_begin	= ldc_begin_first + (ldc_sumdr - ldc_sumcr)
			
			ldc_sumdr	= 0.00
			ldc_sumcr	= 0.00
			
			this.of_get_sum_between_notpost_drcr( ldtm_startdate , ldtm_startdate , is_cash_id , as_coop_id,   ldc_sumdr , ldc_sumcr  )
			
			ldc_forward	= ldc_begin + (ldc_sumdr - ldc_sumcr)
			
			lds_report.object.balance_begin[ll_index]	= ldc_begin
			lds_report.object.balance_forward[ll_index]	= ldc_forward
			
		end if
		
		ldtm_temp	= ldtm_startdate
	next
		
end if

if ( lds_report.rowcount() > 0 ) then
	return lds_report.Describe( "Datawindow.Data.XML" )
end if

return ""
end function

public function string of_gen_ledger_report (datetime adtm_start, datetime adtm_end, string as_account_id1, string as_account_id2, string as_coop_id) throws Exception;/***********************************************
<description>
ทำรายการทำรายงาน แยกประเภท

FXREF: AC-ACCSERVICE-of_gen_day_journalreport-0000001
</description>

<arguments>
adtm_start				วันที่เริ่มต้น
adtm_end				วันที่สิ้นสุด
as_account_id1			รหัสบัญชีเริ่มต้น
as_account_id2			รหัสบัญชีสิ้นสุด
as_coop_id			สาขา
</arguments>

<return>
string ข้อมูลรายการ ออกรายงาน
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน B ranch_id เป็น coop_id
</history>
************************************************/

integer	ll_year,ll_count_ledger,  i ,j ,li_seq_no,ll_last,li_flag, li_year, li_period 
dec{2}	ldc_dramt,ldc_cramt,ldc_sumalldr,ldc_sumallcr , ldc_cr2,ldc_dr2,ldc_dr,ldc_cr,ldc_begin_dr,ldc_begin_cr,ldc_begin,ldc_sumall,ldc_sumdr,ldc_sumcr
string		ls_remark_exe,ls_acc_book_type_id,ls_account_group_id,ls_account_name,ls_account_id_accmas ,ls_accprior
datetime	ldt_journal_date, ldtm_start, ldtm_beforedate, ldtm_endyeardate
integer	li_insertrow, li_cash_type, li_rowremark, li_glno, li_indexremark
string		ls_voucher
dec{2}	ldc_begin_dr_amount, ldc_begin_cr_amount, ldc_begin_first
n_ds  lds_ledger,lds_accsum,lds_accmaster,lds_accsumdate, lds_accremark, lds_report


this.of_get_year_period( adtm_start , as_coop_id, li_year, li_period  )

lds_accmaster = create n_ds
lds_accmaster.dataobject = 'd_acc_accmaster_all_service_byaccid' //แสดงบัญชีทุกตัว
lds_accmaster.settransobject(itr_sqlca)
ll_last = lds_accmaster.retrieve( as_account_id1, as_account_id2,as_coop_id   )

lds_accmaster.setsort( " account_group_id A , account_id A" )
lds_accmaster.sort( )

lds_ledger = create n_ds
lds_ledger.dataobject ='dw_acc_date20_vcvoucher_balance_group1'//แสดงบัญชีในแยกประเภทตามช่วงวันที่
lds_ledger.settransobject(itr_sqlca)

lds_accremark = create n_ds
lds_accremark.dataobject ='d_acc_ledgerdet_remark'
lds_accremark.settransobject(itr_sqlca)

ls_accprior		= ""

lds_report		= create n_ds
lds_report.dataobject ='r_mth30_mth_ledger_thai'

// วันเริ่มต้นงวด
ldtm_start		= datetime( date( year( date( adtm_start ) ), month( date( adtm_start ) ), 1  ) )

// วันเริ่มต้นปีบัญชี
this.of_get_period_date(li_year, 1,as_coop_id, ldtm_beforedate, ldtm_endyeardate  )

//วนรอบทุก ๆบัญชี
For i = 1 to ll_last
	ldc_begin		= 0.0
	ldc_sumall		= 0.0
	ldc_sumdr		= 0.0
	ldc_sumcr		= 0.0
	ldc_begin_dr	= 0.0
	ldc_begin_cr	= 0.0
	li_flag				= 0
	ldc_dramt 		= 0
	ldc_cramt		= 0
	li_seq_no		= 0
		
	ls_acc_book_type_id		= ""
	ls_account_id_accmas	= ""
	ls_account_name			= ""
	ls_remark_exe				= ""
	
	
	ldc_dr			= 0.0
	ldc_cr			= 0.0
	ldc_dr2		= 0.0
	ldc_cr2		= 0.0
	 
	ls_account_id_accmas	= lds_accmaster.object.account_id[i]
	
	if ( ls_account_id_accmas <> ls_accprior ) then
		ls_account_name	= lds_accmaster.object.account_name[i]
		
		ls_account_group_id		= lds_accmaster.object.account_group_id[i]	
	
		if ( li_period = 1 ) and ( ( trim( ls_account_group_id ) = '4' ) or ( trim( ls_account_group_id ) = '5' ) ) then
			ldc_begin		= 0
			ldc_begin_first	= 0
		else
			ldc_begin		= this.of_get_balance_begin( ls_account_id_accmas , adtm_start , as_coop_id )
			
			if ( ( trim( ls_account_group_id ) = '4' ) or ( trim( ls_account_group_id ) = '5' ) ) then
				ldc_begin_first	= 0
			else
				ldc_begin_first	= this.of_get_balance_begin( ls_account_id_accmas ,  li_year, 1, as_coop_id )
			end if
			
		end if
		
		if ( date( adtm_start ) <> date( ldtm_start ) ) then
			ldc_dr			= 0
			ldc_cr			= 0
			
			if ( li_period = 1 ) then
				this.of_get_sum_drcr( ldtm_start , adtm_start  , ls_account_id_accmas ,    ldc_dr , ldc_cr ,as_coop_id)
				
			else
				this.of_get_sum_drcr( ldtm_start , adtm_start  , ls_account_id_accmas ,   ldc_dr , ldc_cr , 1 ,as_coop_id)				
			end if
			
			if	isnull( ldc_dr ) then ldc_dr = 0
			if	isnull( ldc_cr ) then ldc_cr = 0
			
			ldc_begin = ( ldc_dr - ldc_cr ) + ldc_begin
		end if
		
		//หายอดสะสมตั้งแต่ต้นปีถึงเดือนที่ต้องการจะออกรายงาน
		this.of_get_sum_drcr( ldtm_beforedate , adtm_start  , ls_account_id_accmas ,   ldc_begin_dr_amount , ldc_begin_cr_amount ,as_coop_id )
		
		choose case ldc_begin_first
			case is > 0 
				ldc_begin_dr_amount	= ldc_begin_first + ldc_begin_dr_amount
			case is < 0
				ldc_begin_first	= abs(ldc_begin_first)
				ldc_begin_cr_amount	= ldc_begin_first + ldc_begin_cr_amount
		end choose
		 
		
		choose case ldc_begin
			case is > 0
				ldc_begin_dr   = ldc_begin
				
			case is < 0
				ldc_begin_cr	= abs( ldc_begin )
				
			case else
				ldc_begin_dr	= 0
				ldc_begin_cr	= 0
				li_flag				= 2
				
		end choose
		
		ldc_sumall			= ldc_begin
		li_seq_no			= 0
		
		lds_ledger.reset()
		ll_count_ledger	= lds_ledger.retrieve(ls_account_id_accmas,adtm_start, adtm_end ,as_coop_id)
		li_seq_no			= 0
		
		for j = 1 to ll_count_ledger
		//ดึงข้อมูลจาก  เดบิต ยอดรวม เครดิต  จาก  accgeneralledger
			ldc_dramt		= 0
			ldc_cramt		= 0
			ldc_dramt		= lds_ledger.object.dr_amt[j] ; if isnull( ldc_dramt ) then ldc_dramt = 0
			ldc_cramt		= lds_ledger.object.cr_amt[j] ; if isnull( ldc_cramt ) then ldc_cramt = 0
			li_glno			= lds_ledger.object.seq_no[j] ; if isnull( li_glno ) then li_glno = 0
			ls_remark_exe	= lds_ledger.object.item_desc[j] ; if isnull( ls_remark_exe ) then ls_remark_exe = ""
			ls_voucher		= lds_ledger.object.voucher_no[j] 
			
			if isnull( ls_voucher ) then ls_voucher = ""
			li_cash_type = lds_ledger.object.cash_type[j]
			
			choose case li_cash_type
				case 1
					ls_acc_book_type_id	= '10'
					
				case 2
					ls_acc_book_type_id	= '20'
					
				case else
					ls_acc_book_type_id	= '30'
					
			end choose
			
			if ( ldc_dramt > 0 ) then
				ls_account_group_id ='DR'
			else
				ls_account_group_id ='CR'
			end if
			
			ldt_journal_date	= lds_ledger.object.voucher_date[j]
			ldc_sumall			= ldc_sumall + ( ldc_dramt - ldc_cramt )
			li_seq_no ++
			
			choose case ldc_sumall
				case is > 0					
					ldc_sumalldr	= ldc_sumall
					ldc_sumallcr	= 0
				
				case is < 0					
					ldc_sumallcr  = abs( ldc_sumall )
					ldc_sumalldr  =  0
				
				case else					
					ldc_sumalldr	 = 0
					ldc_sumallcr	 = 0
				
			end choose
			
		
			if ( ldc_sumall = 0 ) then
				if ( ldc_begin_dr > 0 ) then	
					if (li_seq_no = 1 ) and (ldc_begin_dr =  ldc_cramt) then
						ldc_sumalldr = -99999
					end if
				end if
				
				if ( ldc_begin_cr > 0 ) then	
					if (li_seq_no = 1)  and (ldc_begin_cr =  ldc_dramt) then
						ldc_sumallcr = -99999
					end if
				end  if
				
				if	( ldc_sumalldr > 0 ) and (ldc_sumalldr = ldc_cramt)  then
					ldc_sumalldr = -99999
				end if
				
				if ( ldc_sumallcr < 0 ) and ( ldc_sumallcr = ldc_dramt ) then
					ldc_sumallcr  = -99999
				end if
				
			end if
			//หาremark
			li_rowremark	= 0
			li_rowremark	= lds_accremark.retrieve( ls_account_id_accmas, ldt_journal_date, ls_account_group_id,  as_coop_id , li_glno,  ls_voucher ,as_coop_id )
			
			if ( li_rowremark > 0 ) then
				for li_indexremark = 1 to li_rowremark
					if ( li_indexremark = 1 ) then
						
						ls_remark_exe	= ls_remark_exe + " " + lds_accremark.object.c_remark[li_indexremark]
					else
						li_seq_no ++
						ls_remark_exe	= lds_accremark.object.c_remark[li_indexremark]
						ldc_dramt		= 0.00
						ldc_cramt		= 0.00
						ldc_sumalldr	= 0.00
						ldc_sumallcr	= 0.00
						ls_acc_book_type_id	= ""
					end if
					
					//insert ข้อมูลใส่ table 	accsumledgerdate ไว้ก่อนแล้วค่อย show ใน datawindow ทีหลัง	
					li_insertrow	= lds_report.insertrow( 0 )
					lds_report.Setitem( li_insertrow, "account_id", ls_account_id_accmas )
					lds_report.Setitem( li_insertrow, "journal_d", ldt_journal_date )
					lds_report.Setitem( li_insertrow, "desc_journal_detai", ls_account_name )
					lds_report.Setitem( li_insertrow, "dr_amount", ldc_dramt )
					lds_report.Setitem( li_insertrow, "cr_amount", ldc_cramt )
					lds_report.Setitem( li_insertrow, "group_id", ls_account_group_id )
					lds_report.Setitem( li_insertrow, "begin_cr", ldc_begin_cr )
					lds_report.Setitem( li_insertrow, "begin_dr", ldc_begin_dr )
					lds_report.Setitem( li_insertrow, "forward_cr", ldc_sumallcr )
					lds_report.Setitem( li_insertrow, "forward_dr", ldc_sumalldr )
					lds_report.Setitem( li_insertrow, "remark_exe", ls_remark_exe )
					lds_report.Setitem( li_insertrow, "seq_no", li_seq_no )
					lds_report.Setitem( li_insertrow, "flag", li_flag )
					lds_report.Setitem( li_insertrow, "acc_book_type_id", ls_acc_book_type_id )
					lds_report.Setitem( li_insertrow, "voucher_no", ls_voucher )
					lds_report.Setitem( li_insertrow, "begin_dr_amount", ldc_begin_dr_amount )
					lds_report.Setitem( li_insertrow, "begin_cr_amount", ldc_begin_cr_amount )
					lds_report.Setitem( li_insertrow, "coop_id",as_coop_id )
					
				next
			else
				//insert ข้อมูลใส่ table 	accsumledgerdate ไว้ก่อนแล้วค่อย show ใน datawindow ทีหลัง	
				li_insertrow	= lds_report.insertrow( 0 )
				lds_report.Setitem( li_insertrow, "account_id", ls_account_id_accmas )
				lds_report.Setitem( li_insertrow, "journal_d", ldt_journal_date )
				lds_report.Setitem( li_insertrow, "desc_journal_detai", ls_account_name )
				lds_report.Setitem( li_insertrow, "dr_amount", ldc_dramt )
				lds_report.Setitem( li_insertrow, "cr_amount", ldc_cramt )
				lds_report.Setitem( li_insertrow, "group_id", ls_account_group_id )
				lds_report.Setitem( li_insertrow, "begin_cr", ldc_begin_cr )
				lds_report.Setitem( li_insertrow, "begin_dr", ldc_begin_dr )
				lds_report.Setitem( li_insertrow, "forward_cr", ldc_sumallcr )
				lds_report.Setitem( li_insertrow, "forward_dr", ldc_sumalldr )
				lds_report.Setitem( li_insertrow, "remark_exe", ls_remark_exe )
				lds_report.Setitem( li_insertrow, "seq_no", li_seq_no )
				lds_report.Setitem( li_insertrow, "flag", li_flag )
				lds_report.Setitem( li_insertrow, "acc_book_type_id", ls_acc_book_type_id )
				lds_report.Setitem( li_insertrow, "voucher_no", ls_voucher )
				lds_report.Setitem( li_insertrow, "begin_dr_amount", ldc_begin_dr_amount )
				lds_report.Setitem( li_insertrow, "begin_cr_amount", ldc_begin_cr_amount )
				lds_report.Setitem( li_insertrow, "coop_id",as_coop_id )
		end if	
			ls_accprior	= ls_account_id_accmas
			
		next
	
	end if

	if	( ll_count_ledger = 0 ) and ( ( ldc_begin_cr > 0 ) or ( ldc_begin_dr > 0 ) ) then
		ldt_journal_date	= adtm_start		
		li_flag					= 1
		li_insertrow			= lds_report.insertrow( 0 )

		
		lds_report.Setitem( li_insertrow, "account_id", ls_account_id_accmas )
		lds_report.Setitem( li_insertrow, "journal_d", ldt_journal_date )
		lds_report.Setitem( li_insertrow, "desc_journal_detai", ls_account_name )
		lds_report.Setitem( li_insertrow, "dr_amount", ldc_dramt )
		lds_report.Setitem( li_insertrow, "cr_amount", ldc_cramt )
		lds_report.Setitem( li_insertrow, "group_id", ls_account_group_id )
		lds_report.Setitem( li_insertrow, "begin_cr", ldc_begin_cr )
		lds_report.Setitem( li_insertrow, "begin_dr", ldc_begin_dr )
		lds_report.Setitem( li_insertrow, "forward_cr", ldc_sumallcr )
		lds_report.Setitem( li_insertrow, "forward_dr", ldc_sumalldr )
		lds_report.Setitem( li_insertrow, "remark_exe", ls_remark_exe )
		lds_report.Setitem( li_insertrow, "seq_no", li_seq_no )
		lds_report.Setitem( li_insertrow, "flag", li_flag )
		lds_report.Setitem( li_insertrow, "acc_book_type_id", ls_acc_book_type_id )
		lds_report.Setitem( li_insertrow, "voucher_no", ls_voucher )
		lds_report.Setitem( li_insertrow, "begin_dr", ldc_begin_dr_amount )
		lds_report.Setitem( li_insertrow, "begin_cr", ldc_begin_cr_amount )
		lds_report.Setitem( li_insertrow, "coop_id",as_coop_id )
		
	end if
next


if isvalid( lds_accmaster ) then
	destroy( lds_accmaster )
end if

if isvalid( lds_ledger ) then
	destroy( lds_ledger )
end if

if isvalid( lds_accsum ) then
	destroy( lds_accsum )
end if

lds_report.Groupcalc( )

if ( lds_report.rowcount() > 0 ) then
	return lds_report.Describe( "Datawindow.Data.XML" )	
end if

return ""
end function

private function decimal of_gendata_sm_cashflow (string arg_data, string arg_balance_data, ref n_ds ads_help_show, integer arg_year, integer arg_period, string as_coop_id);integer	li_len , count ,ll_map ,ll_mark = 1 , ll_row,ll_period, li_month, li_year
integer	ll_start,ll_end , ll_showcount , i ,ll_old_year,ll_period_old
dec{2}	ldc_current_value_OLW_temp, ldc_old_value_OLW_temp
string		ls_text,ls_data_desc, ls_argexe[], ls_temp
DEC{2}	ldc_add,ldc_sub,ldc_sum,ldc_old_value,ldc_current_value ,ldc_adc,ldc_adb
dec{2}	ldc_old_value_CSH, ldc_old_value_CSH_temp
dec{2}	ldc_sum_CON,ldc_OLD, ldc_OLW, ldc_ODD
dec{2}	ldc_current_value_ODD_temp, ldc_old_value_ODD_temp
dec{2}	ldc_current_value_OLD_temp, ldc_old_value_OLD_temp
datetime	ldtm_startdate, ldtm_enddate, ldtm_startdate_bf, ldtm_enddate_bf, ldtm_begin_first_period, ldtm_end_first_period
integer	li_year_old, li_periodyear , li_periodmonth, li_mulflag, li_pos_between
string		ls_operate, ls_acc_end
dec{2}	ldc_cr_rcv, ldc_dr_rcv, ldc_current_value_PAC , ldc_current_value_PAD , ldc_current_value_RPD, ldc_current_value_RPC
dec{2}	ldc_current_value_CD,ldc_current_value_CC,ldc_current_value_CDC,ldc_current_value_CCD

li_len				= len( arg_data )
ll_showcount	= ads_help_show.rowcount( )
ll_map			= 1
ldc_sum			= 0
ldc_add			= 0
ldc_sub			= 0
ldc_adb			= 0
ldc_adc			= 0
ldc_OLD			= 0
ldc_OLW			= 0
ldc_ODD			= 0

ldc_old_value_CSH		= 0
ldc_sum_CON				= 0
ldc_current_value_CD		= 0
ldc_current_value_CC		= 0
ldc_current_value_CDC	= 0
ldc_current_value_CCD	= 0

ldc_current_value_OLD_temp	= 0
ldc_old_value_OLD_temp			= 0
ldc_current_value_ODD_temp	= 0
ldc_old_value_ODD_temp		= 0
ldc_current_value_OLW_temp	= 0
ldc_old_value_OLW_temp		= 0

 li_periodyear				= arg_year
 li_periodmonth				= arg_period

this.of_get_period_date( arg_year,arg_period, as_coop_id, ldtm_startdate, ldtm_enddate )

// แปลงเป็นวันที่ ปีที่แล้ว
ldtm_startdate_bf	= datetime( inv_datetime.of_relativeyear( date( ldtm_startdate ) , -1 ) )
ldtm_enddate_bf	= datetime( inv_datetime.of_relativeyear( date( ldtm_enddate ) , -1 ) )

// หาวันที่ ต้นปีบัญชี
SELECT	ACCPERIOD.PERIOD_END_DATE  
INTO		:ldtm_end_first_period
FROM		ACCPERIOD  
WHERE	( ACCPERIOD.ACCOUNT_YEAR	= :li_periodyear) AND  
			( ACCPERIOD.PERIOD				= 1 ) and
			( ACCPERIOD.COOP_ID		= :as_coop_id )
using itr_sqlca;

ldtm_begin_first_period	= datetime( inv_datetime.of_firstdayofmonth( date( ldtm_end_first_period ) ) )

// *** จบ ระ เพิ่ม ******************

inv_string.of_parsetoarray( arg_data, ",",  ls_argexe )

for ll_row = 1 to upperbound( ls_argexe )
	ls_text		= trim( ls_argexe[ll_row] )
	ll_map		= pos( ls_text ,'(' )
	ls_operate	= left( ls_text, 1 )
	li_mulflag	= 1
	
	if ( ls_operate = "-" ) then
		li_mulflag	= -1
	end if
	
	if ll_map > 0 then
		ls_temp	= left( ls_text , ll_map - 1 )
	else
		continue
	end if
	
	ls_text	= trim( mid( ls_text , ll_map + 1 ) ) // ส่วนที่เหลือ
	ll_map	= pos( ls_text , ')' )	
	ls_text	= trim( left( ls_text , ll_map - 1 ) )
	
	li_pos_between	= 0
	li_pos_between	= pos( ls_text, "-" )
	
	if ( li_pos_between > 0 ) then
		ls_acc_end	= mid( ls_text, li_pos_between + 1 )
		ls_text		= left( ls_text,  li_pos_between - 1 )
	else
		ls_acc_end	= ls_text
	end if
	
			
	choose case ls_temp
		case "ADD"
			ldc_add	+= dec( ads_help_show.describe( "Evaluate('sum( if( ( data_group >= " + ls_text + " and data_group <= " +  ls_acc_end + " ) , " + arg_balance_data + " , 0  ) for all )',0)" ) )
			
		case "SUB"
			ldc_sub	+= dec( ads_help_show.describe( "Evaluate('sum( if( (  data_group  >= " + ls_text +" and data_group <=" +  ls_acc_end + " ) , " + arg_balance_data + " , 0  ) for all )',0)" ) )
			
		case "ADC"
			ldc_adc	+= dec( ads_help_show.describe( "Evaluate('sum( if(  (  data_group >= " + ls_text + " and data_group <=" +  ls_acc_end + " ) and  (  " + arg_balance_data + " < 0  ) ,  " + arg_balance_data + "  , 0  )  for all )',0)" ) )
			
		case "ADB"
			ldc_adb	+= dec( ads_help_show.describe( "Evaluate('sum( if(  (  data_group  >= " + ls_text + " and data_group <=" +  ls_acc_end + " ) and  (  " + arg_balance_data + " > 0  ) ,  " + arg_balance_data + "  , 0  )  for all )',0)" ) )
		
		case "CD","CC","CDC","CCD"
			ldc_dr_rcv = 0.00
			ldc_cr_rcv = 0.00
			
			this.of_get_sum_between_drcr_acc_cash( ldtm_begin_first_period, ldtm_enddate, ls_text, ls_acc_end, ldc_dr_rcv, ldc_cr_rcv ,as_coop_id)
			
		choose case ls_temp
			case "CD"
				ldc_current_value_CD		+= ( ldc_dr_rcv * li_mulflag )
				
			case "CC"
				ldc_current_value_CC		+= ( ldc_cr_rcv * li_mulflag )
				
			case "CDC"
				ldc_current_value_CDC	+= ( ( ldc_dr_rcv - ldc_cr_rcv ) * li_mulflag )
				
			case "CCD"
				ldc_current_value_CCD	+= ( ( ldc_cr_rcv - ldc_dr_rcv ) * li_mulflag )
				
		end choose
	
		case "PAC", "PAD", "RPD", "RPC"
			
			ldc_dr_rcv = 0.00
			ldc_cr_rcv = 0.00
		
			SELECT	sum(accsumledgerperiod.dr_amount ), 
						sum(accsumledgerperiod.cr_amount  )
			INTO		:ldc_dr_rcv ,
						:ldc_cr_rcv
			FROM		accmaster,   
						accsumledgerperiod  
			WHERE	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
						( accsumledgerperiod.account_year	= :li_periodyear ) AND  
						( accsumledgerperiod.period			<= :li_periodmonth ) AND
						( accsumledgerperiod.account_id		between :ls_text and  :ls_acc_end ) and
						( accsumledgerperiod.posttogl_allflag	= 1 ) and 
						( accsumledgerperiod.coop_id	=: as_coop_id) 
			using itr_sqlca;
			
			if isnull( ldc_dr_rcv ) then ldc_dr_rcv = 0.00
			if isnull( ldc_cr_rcv ) then ldc_cr_rcv = 0.00
			
			choose case ls_temp
				case "PAD" // หารายการจ่าย DR
					ldc_current_value_PAD		+= ( ldc_dr_rcv * li_mulflag )
					
				case "PAC" // หารายการจ่าย CR
					ldc_current_value_PAC		+= ( ldc_cr_rcv * li_mulflag )
				
				case "RPD"
					ldc_current_value_RPD		+= ( ( ldc_dr_rcv - ldc_cr_rcv ) * li_mulflag )
					
				case "RPC"
					ldc_current_value_RPC		+= ( ( ldc_cr_rcv - ldc_dr_rcv ) * li_mulflag )
					
			end choose
	
		case "OLD"			
			// เอายอดยกไป ของปีปัจจุบัน - ยกไป ของปีที่แล้ว
			
			// ยกไป ปีบัญชีปัจจุบัน
			ldc_current_value_OLD_temp	= this.of_find_sumlastyear( ls_text, ls_acc_end , ldtm_startdate, ldtm_enddate, as_coop_id, 2 )
			
			if isnull( ldc_current_value_OLD_temp )then
				ldc_current_value_OLD_temp  = 0
			end if
			
			
			//ยกมาต้นงวด
			ldc_old_value_OLD_temp	= this.of_find_sumlastyear( ls_text,ls_acc_end, ldtm_begin_first_period, ldtm_begin_first_period , as_coop_id,  1 )
			
			if isnull( ldc_old_value_OLD_temp )then
				ldc_old_value_OLD_temp  = 0
			end if

			ldc_OLD	+= ( ( ldc_current_value_OLD_temp - ldc_old_value_OLD_temp ) * li_mulflag )
			
			 
		case "OLW"
			// เอายอดยกไป ของปีปัจจุบัน - ยกไป ของปีที่แล้ว
			
			// ยกไป ปีบัญชีปัจจุบัน
			ldc_current_value_OLW_temp	= this.of_find_sumlastyear( ls_text, ls_acc_end,  ldtm_startdate, ldtm_enddate, as_coop_id, 2 )
			
			if isnull( ldc_current_value_OLW_temp ) then
				ldc_current_value_OLW_temp  = 0
			end if
			
			//ยกมาต้นงวด
			ldc_old_value_OLW_temp	= this.of_find_sumlastyear( ls_text, ls_acc_end, ldtm_begin_first_period, ldtm_begin_first_period , as_coop_id, 1  )
			
			if isnull( ldc_old_value_OLW_temp )then
				ldc_old_value_OLW_temp  = 0
			end if
			
			ldc_OLW		+= ( ( ldc_old_value_OLW_temp - ldc_current_value_OLW_temp ) * li_mulflag )
			
		case "CSH"			
			//ยกมาต้นงวด ด้าน DR
			ldc_old_value_CSH_temp	= this.of_find_sumlastyear( ls_text, ls_acc_end, ldtm_begin_first_period, ldtm_end_first_period, as_coop_id,  1, 1 )
		
			if isnull( ldc_old_value_CSH_temp ) then
				ldc_old_value_CSH_temp  = 0
			end if
			
			if ( ldc_old_value_CSH_temp > 0 ) then
				ldc_old_value_CSH	+= ldc_old_value_CSH_temp
			end if
			
		case "CON"			
			ldc_sum_CON	= this.of_get_bal_cont( li_periodyear , li_periodmonth, ls_text ,as_coop_id)
			ldc_sum_CON	= ldc_sum_CON * li_mulflag
		case "ODD"
			
			//ปีบัญชีปัจจุบัน
			ldc_current_value_ODD_temp	= this.of_find_sumlastyear( ls_text, ls_acc_end, ldtm_startdate, ldtm_enddate,as_coop_id,  2 )
			
			
			if isnull( ldc_current_value_ODD_temp )then
				ldc_current_value_ODD_temp  = 0
			else
				//ยกมาต้นงวด
				ldc_old_value_ODD_temp	= this.of_find_sumlastyear( ls_text, ls_acc_end ,ldtm_begin_first_period, ldtm_begin_first_period , as_coop_id,  1  )
			
				if isnull( ldc_old_value_ODD_temp )	then
					ldc_old_value_ODD_temp  = 0
				end if
				
				if ldc_old_value_ODD_temp > 0 then ldc_old_value_ODD_temp = 0
				if ldc_current_value_ODD_temp > 0 then ldc_current_value_ODD_temp = 0
			end if
			
			ldc_ODD	+= ( ( ldc_old_value_ODD_temp -ldc_current_value_ODD_temp  ) * li_mulflag )
			
		case else
	end choose
	
next

// หายอดรวม
// แบบใหม่โดยระ อาจจะยังไม่ดีเท่าไหร่
ldc_sum	= ( ldc_add - ldc_sub ) + ldc_adb + ABS( ldc_adc )
ldc_sum	= ldc_sum + ldc_current_value_PAC
ldc_sum	= ldc_sum + ldc_current_value_PAD
ldc_sum	= ldc_sum + ldc_current_value_RPD
ldc_sum	= ldc_sum + ldc_current_value_RPC
ldc_sum	= ldc_sum + ldc_OLD
ldc_sum	= ldc_sum + ldc_OLW
ldc_sum	= ldc_sum + ldc_old_value_CSH
ldc_sum	= ldc_sum + ldc_sum_CON
ldc_sum	= ldc_sum + ldc_current_value_CD
ldc_sum	= ldc_sum + ldc_current_value_CC
ldc_sum	= ldc_sum + ldc_current_value_CDC
ldc_sum	= ldc_sum + ldc_current_value_CCD
ldc_sum	= ldc_sum + ldc_ODD

return ldc_sum
end function

private subroutine of_get_sum_between_drcr_acc_cash (datetime adtm_begindate, datetime adtm_enddate, string as_account_id1, string as_account_id2, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
			( a.coop_id		= b.coop_id ) and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( b.account_id		between :as_account_id1  and  :as_account_id2 )  and
			( a.voucher_status	= 1 ) and	
			( a.coop_id =: as_coop_id  ) and 
			( b.non_cashpaper	= 0 ) using itr_sqlca ;
//( a.cash_type		= 1 ) and
if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

public function decimal of_get_result_gencash (string as_acclist, datetime adtm_start, datetime adtm_end, integer ai_choose, datetime adtm_year_begin, string as_coop_id, integer ai_cash_only);string		ls_account_array[]
integer	li_maxloop, li_index, li_pos, li_posr_end
integer	li_mul_flag, li_year, li_period
string		ls_arithmatic, ls_find, ls_account_id
string		ls_temp, ls_acc_temp
dec{2}	ldc_dramt  , ldc_cramt, ldc_result, ldc_return

inv_string.of_parsetoarray( as_acclist, "," , ls_account_array )

li_maxloop	= upperbound( ls_account_array )
ldc_return	= 0.00

this.of_get_year_period( adtm_start , as_coop_id, li_year, li_period )

for li_index = 1 to li_maxloop
	ls_temp			= ls_account_array[li_index]
	
	// หาก ไม่ใช่รายการ ที่ถูกต้อง ซึ่งค่าแรก ต้องเป็น + หรือ -
	ls_arithmatic	= trim( left( ls_temp , 1) )
	if isnull( ls_arithmatic ) or ls_arithmatic = "" or ( ls_arithmatic <> "+" and ls_arithmatic <> "-"  ) then 
		continue
	end if	
	
	li_mul_flag	= 1
	if ( ls_arithmatic = "-" ) then
		li_mul_flag	= -1
	end if
	
	// ไม่เอา + หรือ -
	ls_temp		= trim( mid( ls_temp , 2 ) )
	// หากไม่มีรายการเลขที่บัญชี
	if ( isnull( ls_temp ) or ls_temp = "" ) then
		continue
	end if
	
	li_pos			= 0
	li_posr_end	= 0
	
	// หาตำแหน่ง (
	li_pos			= pos( ls_temp, "(" )
	
	// หาตำแหน่ง )
	li_posr_end	= pos( ls_temp, ")" )
	
	// ไม่เจอ "(" และ/หรือ  ")"
	if ( li_posr_end < 1 or li_pos < 1 ) then
		continue
	end if
	
	// เลขที่ รหัส บัญชี
	ls_acc_temp		= mid( ls_temp, li_pos + 1 , li_posr_end - (  li_pos + 1 ) )
	// หากไม่มีรายการเลขที่บัญชี
	if ( isnull( ls_acc_temp ) or ls_acc_temp = "" ) then
		continue
	end if
	
	// สัญลัษณ์ บอกว่า เอายอด อะไร dr cr drcr crdr
	ls_find		= trim( left( ls_temp , li_pos - 1 ) )
	// หากไม่เจอ รหัสการคำนวณ
	if ( isnull( ls_find ) or ls_find = "" ) then
		continue
	end if
	
	li_pos		= 0
	li_pos		= pos( ls_acc_temp, "-" )
	if ( li_pos > 0 ) then
		ls_account_id	= left( ls_acc_temp, li_pos - 1 )
		if ( isnull( ls_account_id ) or ls_account_id = "" ) then
			ls_account_id		= ""
		end if
		
		ls_acc_temp		= mid( ls_acc_temp , li_pos + 1 )
		
		if ( isnull( ls_acc_temp ) or ls_acc_temp = "" ) then
			ls_acc_temp		= ls_account_id
		end if
	else
		ls_account_id	= ls_acc_temp
	end if
	
	// ไม่เจอ รหัส คำนวณ
	if (  ls_account_id = "" ) or ( ls_acc_temp = "" )  then
		continue
	end if
	
	ldc_dramt		= 0.00
	ldc_cramt		= 0.00
	ldc_result		= 0.00
	
	if ( ai_cash_only = 1 ) then
		if ( ai_choose = 1 ) then
			this.of_get_sum_between_drcr_acc_cash( adtm_year_begin , adtm_end, ls_account_id, ls_acc_temp,   ldc_dramt  , ldc_cramt ,as_coop_id )
		else
			this.of_get_sum_between_drcr_acc_cash( adtm_start , adtm_end, ls_account_id, ls_acc_temp,   ldc_dramt  , ldc_cramt,as_coop_id  )
		end if
	else
		if ( ai_choose = 1 ) then
			this.of_get_sum_between_drcr_acc_range( adtm_year_begin , adtm_end, ls_account_id, ls_acc_temp,   ldc_dramt  , ldc_cramt  ,as_coop_id)
		else
			this.of_get_sum_between_drcr_acc_range( adtm_start , adtm_end, ls_account_id, ls_acc_temp,   ldc_dramt  , ldc_cramt  ,as_coop_id)
		end if
	end if
	
	choose case lower( ls_find )
		case "dr"
			ldc_result	= ldc_dramt
			
		case "cr"
			ldc_result	= ldc_cramt
			
		case "drcr"
			ldc_result	= ldc_dramt - ldc_cramt
			
		case "crdr"
			ldc_result	= ldc_cramt - ldc_dramt
			
		case else
			ldc_result	= 0.00
			
	end choose
		
	ldc_result	= ldc_result * li_mul_flag
	
	ldc_return	= ldc_return + ldc_result
next

if ( ldc_return < 0 ) then ldc_return = 0.00

return ldc_return
end function

private function decimal of_get_bal_cont (integer ai_acc_year, integer ai_acc_period, string as_acc_type, string as_coop_id);
dec{2}	ldc_return

SELECT	acccntmoneysheet.cnt_short_amt + acccntmoneysheet.cnt_long_amt
INTO		:ldc_return
FROM		acccntmoneysheet  
WHERE	( acccntmoneysheet.account_year	= :ai_acc_year  ) AND  
			( acccntmoneysheet.cnt_code		= :as_acc_type  ) and
			( acccntmoneysheet.period			= :ai_acc_period ) and 
			( acccntmoneysheet.coop_id		= :as_coop_id ) and 
using itr_sqlca;			
			
if isnull( ldc_return ) then ldc_return = 0.00


return ldc_return
end function

public function decimal of_get_balance_begin (string as_account_id, datetime adtm_date_find, string as_coop_id);dec{2}	ldc_begin_befydr,ldc_begin_befycr, ldc_begin
integer	ll_year ,li_period ,li_current_year, li_current_period
datetime	ldtm_datebf

ldtm_datebf	= datetime( inv_datetime.of_relativemonth( date( adtm_date_find ), -1 ) )
this.of_get_year_period( ldtm_datebf     , as_coop_id, ll_year            , li_period )
this.of_get_year_period( adtm_date_find, as_coop_id, li_current_year, li_current_period )

choose case  li_current_period
	case 1
		//หายอดยกมาปีที่แล้ว 
		select		sum(begin_dr_amount ) , sum(begin_cr_amount )
		into		:ldc_begin_befydr,:ldc_begin_befycr	 
		from		accsumledgerperiod  
		where	( account_year	= :li_current_year ) and 
					( period			= :li_current_period ) and 
					( account_id		= :as_account_id ) and
					( coop_id		= :as_coop_id )using itr_sqlca;
	case 12
		//หายอดยกมาปีที่แล้ว 
		select		sum( forward_dr_amount ) , sum( forward_cr_amount )
		into		:ldc_begin_befydr,:ldc_begin_befycr	 
		from		accsumledgerperiod  
		where	( account_year		= :ll_year ) and 
					( period				= :li_period ) and 
					( account_id			= :as_account_id )  and
					( posttogl_allflag	= 1 ) and
					( coop_id			= :as_coop_id )using itr_sqlca;
	case else
		//หายอดยกมาปีที่แล้ว 
		select		sum( forward_dr_amount ) , sum( forward_cr_amount )
		into		:ldc_begin_befydr,:ldc_begin_befycr	 
		from		accsumledgerperiod  
		where	( account_year	= :ll_year ) and 
					( period			= :li_period ) and 
					( account_id		= :as_account_id ) and
					( coop_id			= :as_coop_id )using itr_sqlca;
end choose

		

if isnull( ldc_begin_befydr ) then ldc_begin_befydr = 0.00
if isnull( ldc_begin_befycr ) then ldc_begin_befycr = 0.00

ldc_begin = ldc_begin_befydr - ldc_begin_befycr

return ldc_begin
end function

public function decimal of_get_balance_begin (string as_account_id, integer ai_account_year, integer ai_period, string as_coop_id) throws Exception;dec{2}	ldc_begin_befydr,ldc_begin_befycr, ldc_begin
integer	ll_year ,li_period ,li_current_year, li_current_period


// ยอดยกมาของเดือนที่แล้ว
li_current_year		= ai_account_year
li_current_period	= ai_period

ll_year		= ai_account_year
li_period		= ai_period

li_period	= li_period - 1
if ( li_period < 1 ) then
	li_period	= 12
	ll_year	= ll_year - 1
end if


choose case  li_current_period
	case 1
		//หายอดยกมาปีที่แล้ว 
		select		sum(begin_dr_amount ) , sum(begin_cr_amount )
		into		:ldc_begin_befydr,:ldc_begin_befycr	 
		from		accsumledgerperiod  
		where	( account_year	= :li_current_year ) and 
					( period			= :li_current_period ) and 
					( account_id		= :as_account_id ) and
					( coop_id		= :as_coop_id )using itr_sqlca;
	case 12
		//หายอดยกมาปีที่แล้ว 
		select		sum( forward_dr_amount ) , sum( forward_cr_amount )
		into		:ldc_begin_befydr,:ldc_begin_befycr	 
		from		accsumledgerperiod  
		where	( account_year		= :ll_year ) and 
					( period				= :li_period ) and 
					( account_id			= :as_account_id )  and
					( posttogl_allflag	= 1 ) and
					( coop_id			= :as_coop_id )using itr_sqlca;
	case else
		//หายอดยกมาปีที่แล้ว 
		select		sum( forward_dr_amount ) , sum( forward_cr_amount )
		into		:ldc_begin_befydr,:ldc_begin_befycr	 
		from		accsumledgerperiod  
		where	( account_year	= :ll_year ) and 
					( period			= :li_period ) and 
					( account_id		= :as_account_id ) and
					( coop_id		= :as_coop_id )using itr_sqlca;
end choose

if isnull( ldc_begin_befydr ) then ldc_begin_befydr = 0.00
if isnull( ldc_begin_befycr ) then ldc_begin_befycr = 0.00

ldc_begin = ldc_begin_befydr - ldc_begin_befycr

return ldc_begin
end function

public function decimal of_get_balance_begin (string as_account_id1, string as_account_id2, datetime adtm_date_find, string as_coop_id);dec{2}	ldc_begin_befydr,ldc_begin_befycr, ldc_begin
integer	ll_year ,li_period ,li_current_year, li_current_period
datetime	ldtm_datebf

ldtm_datebf	= datetime( inv_datetime.of_relativemonth( date( adtm_date_find ), -1 ) )
this.of_get_year_period( ldtm_datebf, as_coop_id,  ll_year, li_period )
this.of_get_year_period( adtm_date_find, as_coop_id, li_current_year, li_current_period )

choose case  li_current_period
	case 1
		//หายอดยกมาปีที่แล้ว 
		select		sum(begin_dr_amount ) , sum(begin_cr_amount )
		into		:ldc_begin_befydr,:ldc_begin_befycr	 
		from		accsumledgerperiod  
		where	( account_year	= :li_current_year ) and 
					( period			= :li_current_period ) and 
					( account_id		between :as_account_id1 and :as_account_id2 ) and
					( coop_id		= :as_coop_id )using itr_sqlca;
	case 12
		//หายอดยกมาปีที่แล้ว 
		select		sum( forward_dr_amount ) , sum( forward_cr_amount )
		into		:ldc_begin_befydr,:ldc_begin_befycr	 
		from		accsumledgerperiod  
		where	( account_year		= :ll_year ) and 
					( period				= :li_period ) and 
					( account_id			between :as_account_id1 and :as_account_id2 )  and
					( posttogl_allflag	= 1 ) and
					( coop_id			= :as_coop_id )using itr_sqlca;
	case else
		//หายอดยกมาปีที่แล้ว 
		select		sum( forward_dr_amount ) , sum( forward_cr_amount )
		into		:ldc_begin_befydr,:ldc_begin_befycr	 
		from		accsumledgerperiod  
		where	( account_year	= :ll_year ) and 
					( period			= :li_period ) and 
					( account_id		between :as_account_id1 and :as_account_id2 ) and
					( coop_id		= :as_coop_id )using itr_sqlca;
end choose

		

if isnull( ldc_begin_befydr ) then ldc_begin_befydr = 0.00
if isnull( ldc_begin_befycr ) then ldc_begin_befycr = 0.00

ldc_begin = ldc_begin_befydr - ldc_begin_befycr

return ldc_begin
end function

private function decimal of_get_bs_det (integer ai_sheet_seq, string as_sheetcode, string as_coop_id);dec{2}	ldc_sumalldr, ldc_sumallcr, ldc_mul_sumalldr, ldc_mul_sumallcr, ldc_div_sumalldr, ldc_div_sumallcr
string		ls_modify

as_sheetcode	= trim( as_sheetcode )
ids_finance_statement.Setfilter( "moneysheet_seq = " +  string( ai_sheet_seq ) + " and  trim( moneysheet_code ) = '" + as_sheetcode +  "' " )
ids_finance_statement.Filter( )
			
ldc_sumalldr	= 0.00
ldc_sumallcr		= 0.00

ldc_sumalldr	= ids_finance_statement.object.compute_dr[ 1 ]
ldc_sumallcr	= ids_finance_statement.object.compute_cr[ 1 ]

if isnull( ldc_sumalldr ) then ldc_sumalldr = 0.00
if isnull( ldc_sumallcr ) then ldc_sumallcr = 0.00

ldc_mul_sumalldr	= ids_finance_statement.object.compute_mul_dr[ 1 ]
ldc_mul_sumallcr	= ids_finance_statement.object.compute_mul_cr[ 1 ]
if isnull( ldc_mul_sumalldr ) then ldc_mul_sumalldr = 0.00
if isnull( ldc_mul_sumallcr ) then ldc_mul_sumallcr = 0.00
if ( ldc_mul_sumalldr = 0 ) and ( ( ldc_mul_sumallcr = 0 )  ) then ldc_mul_sumalldr = 1


ldc_div_sumalldr	= ids_finance_statement.object.compute_div_dr[ 1 ]
ldc_div_sumallcr	= ids_finance_statement.object.compute_div_cr[ 1 ]
if isnull( ldc_div_sumalldr ) then ldc_div_sumalldr = 0.00
if isnull( ldc_div_sumallcr ) then ldc_div_sumallcr = 0.00
if ( ldc_div_sumalldr = 0 ) and ( ( ldc_div_sumallcr = 0 )  ) then ldc_div_sumallcr = 1

ids_finance_statement.Setfilter( "" )   //rp 12.5
//ids_finance_statement.Setfilter("coop_id = '" + as_coop_id + "' " )
ids_finance_statement.Filter( )

ldc_sumallcr		= ldc_sumallcr + ldc_sumalldr
ldc_sumallcr		= ldc_sumallcr * ( ldc_mul_sumalldr + ldc_mul_sumallcr ) / ( ldc_div_sumalldr + ldc_div_sumallcr )


return ldc_sumallcr
end function

public function integer of_show_bs (string as_bs_code, integer ai_year, integer ai_period, string as_balance_data, string as_balance_percent, integer ai_mas, string as_coop_id);integer	ll_last ,  li_index   ,  ll_found  , ll_percent
string		ls_op_nature
integer	ll_find, li_money_seq, li_mas
dec{2}	ldc_total, ldc_on, ldc_under
string		ls_data_type, ls_accnuture, ls_return

ll_last		= ids_finance_bs_show.rowcount(  )

for li_index = 1 to ll_last
	ls_data_type	= trim( ids_finance_bs_show.GetitemString( li_index, "data_type" ) )
	ls_op_nature	= trim( ids_finance_bs_show.GetitemString( li_index, "operate_nature" ) )
	li_money_seq	= ids_finance_bs_show.GetitemNumber( li_index, "moneysheet_seq" )
	li_mas			= ids_finance_bs_show.GetitemNumber( li_index, "finance_massts" )
	ldc_total			= 0.00
	
	choose case li_mas
		case 1
			if ( ls_data_type <> "TX" ) then
				ldc_total		= this.of_get_bs_sum( li_money_seq, as_bs_code,as_coop_id  )  //** arg เพิ่ม coop
			end if
			
		case 0
			if ( ls_data_type <> "TX" ) then
				ldc_total		= this.of_get_bs_det( li_money_seq, as_bs_code ,as_coop_id  ) //** arg เพิ่ม coop
			end if
				
	end choose
	
	ids_finance_bs_show.Setitem( li_index, as_balance_data , ldc_total   )
	
next

//Set pecent
for li_index = 1 to ll_last	 
	ll_percent  		= ids_finance_bs_show.object.show_det_percent[li_index]
	ls_data_type	= trim( ids_finance_bs_show.GetitemString( li_index, "data_type" ) )
	// หากไม่เท่ากับ 0 แสดงว่า ต้องแสดงเปอร์เซ็นด้วย
	if ( ll_percent <> 0 ) and ( ls_data_type <> "TX" ) then
		ldc_on	= ids_finance_bs_show.GetItemDecimal( li_index , as_balance_data )
		ll_find		= ids_finance_bs_show.find(" string( data_group , '0' ) = '"+string( ll_percent, "0" ) + "' " , 1, ll_last )
		
		if ( ll_find > 0 ) then		
			ldc_under = ids_finance_bs_show.GetItemDecimal( ll_find , as_balance_data )
			if ( ldc_under > 0 ) then
				ldc_on	= ldc_on * 100 / ldc_under 
				ids_finance_bs_show.setitem( li_index , as_balance_percent, ldc_on )
			end if
		end if
	end if
next


ids_finance_bs_show.accepttext( )

return 1
end function

private function decimal of_get_bs_sum (integer ai_sheet_seq, string as_sheetcode, string as_coop_id);dec{2}	ldc_sumalldr, ldc_sumallcr, ldc_mul_sumalldr, ldc_mul_sumallcr, ldc_div_sumalldr, ldc_div_sumallcr
string		ls_modify

as_sheetcode	= trim( as_sheetcode )
ids_finance_statement.Setfilter( "data_group = " +  string( ai_sheet_seq ) + " and  trim( moneysheet_code ) = '" + as_sheetcode +  "'")
ids_finance_statement.Filter( )
			
ldc_sumalldr	= 0.00
ldc_sumallcr		= 0.00

ldc_sumalldr	= ids_finance_statement.object.compute_dr[ 1 ]
ldc_sumallcr		= ids_finance_statement.object.compute_cr[ 1 ]

if isnull( ldc_sumalldr ) then ldc_sumalldr = 0.00
if isnull( ldc_sumallcr ) then ldc_sumallcr = 0.00

ldc_mul_sumalldr	= ids_finance_statement.object.compute_mul_dr[ 1 ]
ldc_mul_sumallcr	= ids_finance_statement.object.compute_mul_cr[ 1 ]
if isnull( ldc_mul_sumalldr ) then ldc_mul_sumalldr = 0.00
if isnull( ldc_mul_sumallcr ) then ldc_mul_sumallcr = 0.00
if ( ldc_mul_sumalldr = 0 ) and ( ( ldc_mul_sumallcr = 0 )  ) then ldc_mul_sumalldr = 1


ldc_div_sumalldr	= ids_finance_statement.object.compute_div_dr[ 1 ]
ldc_div_sumallcr	= ids_finance_statement.object.compute_div_cr[ 1 ]
if isnull( ldc_div_sumalldr ) then ldc_div_sumalldr = 0.00
if isnull( ldc_div_sumallcr ) then ldc_div_sumallcr = 0.00
if ( ldc_div_sumalldr = 0 ) and ( ( ldc_div_sumallcr = 0 )  ) then ldc_div_sumallcr = 1
			
ids_finance_statement.Setfilter( "" )
ids_finance_statement.Filter( )

ldc_sumallcr		= ldc_sumallcr + ldc_sumalldr
ldc_sumallcr		= ldc_sumallcr * ( ldc_mul_sumalldr + ldc_mul_sumallcr ) / ( ldc_div_sumalldr + ldc_div_sumallcr )

return ldc_sumallcr
end function

public function integer of_get_cash_bg_fw (datetime adtm_startdate, string as_coop_id, ref decimal adc_begin, ref decimal adc_forward);datetime	ldtm_enddate, ldtm_start
dec{2}	ldc_dr, ldc_cr,   ldc_begin_forward

ldtm_enddate 	= adtm_startdate
ldtm_start		= datetime( date( year( date( adtm_startdate ) ), month( date( adtm_startdate ) ), 1  ) )

// ยกมาต้นงวด
ldc_begin_forward	=	this.of_get_balance_begin( is_cash_id  , adtm_startdate  , as_coop_id  )
ldc_dr	= 0.00
ldc_cr	= 0.00

if ( date( adtm_startdate ) <> date( ldtm_start ) ) then	
	// รายการที่ยังไม่ผ่านรายการ และผ่านแล้ว
	this.of_get_sum_notpost_drcr( ldtm_start , adtm_startdate , is_cash_id , as_coop_id,   ldc_dr , ldc_cr  )  // Edit for balance by pom  

	if isnull( ldc_dr ) then ldc_dr = 0.00
	if isnull( ldc_cr ) then ldc_cr = 0.00
	
	adc_begin	= ldc_begin_forward + ( ldc_dr - ldc_cr )
	
else
	adc_begin	= ldc_begin_forward
end if

ldc_dr		= 0.00
ldc_cr		= 0.00

this.of_get_sum_between_notpost_drcr( adtm_startdate , ldtm_enddate , is_cash_id , as_coop_id,   ldc_dr , ldc_cr ) 

adc_forward	= adc_begin + (  ldc_dr - ldc_cr )

return 1
end function

public function string of_get_cashpaper_detail (integer ai_sheet, string as_type_activity, string as_coop_id) throws Exception;/***********************************************
<description>
ทำรายการดึงข้อมูล รายการกระดาษทำการ งบกระแส

FXREF: AC-ACCSERVICE-of_get_cashpaper_detail-0000005
</description>

<arguments>
ai_sheet						รหัสข้อมูล ประเภท งบ
as_type_activity			รหัสกิจกรรม เครดิต เดบิต
</arguments>

<return>
string  ข้อมูลรายการ ในรูปแบบ XML
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
    30/1/2012  : เพิ่ม coop_id  by pom
</history>

************************************************/

n_ds	lds_cash_paper
string		ls_return
integer	li_row

lds_cash_paper		= create n_ds
lds_cash_paper.dataobject = "d_acc_cashflow_list_save"
lds_cash_paper.Settransobject( itr_sqlca )

li_row		= lds_cash_paper.retrieve( ai_sheet, as_type_activity ,as_coop_id)
ls_return	= ""

if li_row > 0 then
	ls_return		= lds_cash_paper.Describe( "Datawindow.data.XML" )
end if

return ls_return
end function

public function integer of_get_max_period (integer ai_account_year, string as_coop_id);integer	li_period
SELECT	max( accperiod.period  )
into		:li_period
FROM		accperiod
WHERE	account_year	= :ai_account_year and
			coop_id		= :as_coop_id
using itr_sqlca ;

if isnull( li_period ) then li_period = 0
return li_period
end function

public function integer of_get_period_date (integer ai_year, integer ai_period, string as_coop_id, ref datetime adtm_begin_date, ref datetime adtm_end_date);
select accperiod.period_end_date
into     :adtm_end_date
from    accperiod
where ( accperiod.account_year	=:ai_year) and 
		 ( accperiod.period			=:ai_period) and
		 ( accperiod.coop_id		= :as_coop_id )
using itr_sqlca;


adtm_begin_date	= datetime( date( year( date( adtm_end_date ) ), month( date( adtm_end_date ) ) , 1 ) )
return  1
end function

private function integer of_get_profit (integer ai_year, integer ai_period, integer ai_choose, ref decimal adc_pl_begin, ref decimal adc_pl_dr, ref decimal adc_pl_cr, string as_coop_id);integer	ll_count , i ,ll_year  , ll_return , ll_prv_year,ll_period
datetime	ldtm_period_date
dec{2}	ldc_dr,ldc_cr
dec{2}	ldc_fw_dr_rec,ldc_fw_cr_rec,ldc_fw_dr_pay,ldc_fw_cr_pay ,ldc_total_rec,ldc_total_pay ,ldc_total

ll_year	= ai_year

if ( ai_choose = 0 ) then
	ll_period	= ai_period
else
	ll_period	= 1
end if


SELECT	sum(accsumledgerperiod.begin_dr_amount),   
			sum(accsumledgerperiod.begin_cr_amount)
INTO		:ldc_fw_dr_rec,   
			:ldc_fw_cr_rec
FROM		accmaster, accsumledgerperiod  
WHERE  	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
			( accsumledgerperiod.account_year	= :ll_year ) AND  
			( accsumledgerperiod.period			= :ll_period ) AND  
			( accmaster.account_group_id			= '4 ' ) and
			( accsumledgerperiod.coop_id		= :as_coop_id )
using itr_sqlca ;			

if isnull( ldc_fw_dr_rec ) then ldc_fw_dr_rec = 0.00
if isnull( ldc_fw_cr_rec ) then ldc_fw_cr_rec = 0.00

ldc_total_rec	= ldc_fw_cr_rec - ldc_fw_dr_rec

//ค่าใช้จ่าย
SELECT	sum(accsumledgerperiod.begin_dr_amount),   
			sum(accsumledgerperiod.begin_cr_amount)
INTO		:ldc_fw_dr_pay,   
			:ldc_fw_cr_pay
FROM		accmaster,   
			accsumledgerperiod  
WHERE	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
			( accsumledgerperiod.account_year	= :ll_year ) AND  
			( accsumledgerperiod.period			= :ll_period ) AND  
			( accmaster.account_group_id			= '5 ' )and
			( accsumledgerperiod.coop_id		= :as_coop_id )
using itr_sqlca ;			

if isnull( ldc_fw_dr_pay ) then ldc_fw_dr_pay = 0.00
if isnull( ldc_fw_cr_pay ) then ldc_fw_cr_pay = 0.00

ldc_total_pay	= ldc_fw_dr_pay - ldc_fw_cr_pay

// ยกมา
adc_pl_begin		= ldc_total_rec - ldc_total_pay

//===============================================
ldc_fw_dr_rec	= 0.00
ldc_fw_cr_rec	= 0.00
ldc_fw_dr_pay	= 0.00
ldc_fw_cr_pay	= 0.00
ldc_total_rec	= 0.00
ldc_total_pay	= 0.00

if ( ai_choose = 0 ) then
	SELECT	sum(accsumledgerperiod.dr_amount),   
				sum(accsumledgerperiod.cr_amount)
	INTO		:ldc_fw_dr_rec,   
				:ldc_fw_cr_rec
	FROM		accmaster, accsumledgerperiod  
	WHERE  	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
				( ( accsumledgerperiod.account_year	= :ll_year ) AND  
				( accsumledgerperiod.period			= :ll_period ) AND  
				( accmaster.account_group_id			= '4 ' ) )  and
				( accsumledgerperiod.coop_id		= :as_coop_id )
	using itr_sqlca ;
	
	SELECT	sum(accsumledgerperiod.dr_amount),   
			sum(accsumledgerperiod.cr_amount)
	INTO		:ldc_fw_dr_pay,   
				:ldc_fw_cr_pay
	FROM		accmaster,   
				accsumledgerperiod  
	WHERE	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
				( ( accsumledgerperiod.account_year	= :ll_year ) AND  
				( accsumledgerperiod.period			= :ll_period ) AND  
				( accmaster.account_group_id			= '5 ' ) ) and
				( accsumledgerperiod.coop_id		= :as_coop_id )
	using itr_sqlca ;
			
else
	SELECT	sum(accsumledgerperiod.dr_amount),   
				sum(accsumledgerperiod.cr_amount)
	INTO		:ldc_fw_dr_rec,   
				:ldc_fw_cr_rec
	FROM		accmaster, accsumledgerperiod  
	WHERE  	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
				( ( accsumledgerperiod.account_year	= :ll_year ) AND  
				( accsumledgerperiod.period			<= :ai_period ) AND  
				( accmaster.account_group_id			= '4 ' ) )  and
				( accsumledgerperiod.coop_id		= :as_coop_id )
	using itr_sqlca ;
				
	SELECT	sum(accsumledgerperiod.dr_amount),   
				sum(accsumledgerperiod.cr_amount)
	INTO		:ldc_fw_dr_pay,   
				:ldc_fw_cr_pay
	FROM		accmaster,   
				accsumledgerperiod  
	WHERE	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
				( ( accsumledgerperiod.account_year	= :ll_year ) AND  
				( accsumledgerperiod.period			<= :ai_period ) AND  
				( accmaster.account_group_id			= '5 ' ) ) and
				( accsumledgerperiod.coop_id		= :as_coop_id )
	using itr_sqlca ;
				
end if

if isnull( ldc_fw_dr_rec ) then ldc_fw_dr_rec = 0.00
if isnull( ldc_fw_cr_rec ) then ldc_fw_cr_rec = 0.00
if isnull( ldc_fw_dr_pay ) then ldc_fw_dr_pay = 0.00
if isnull( ldc_fw_cr_pay ) then ldc_fw_cr_pay = 0.00

ldc_total_rec	= ldc_fw_cr_rec - ldc_fw_dr_rec
ldc_total_pay	= ldc_fw_dr_pay - ldc_fw_cr_pay

// กำไรระหว่างงวด
adc_pl_cr		= ldc_total_rec - ldc_total_pay

if ( adc_pl_cr < 0 ) then
	adc_pl_dr		= abs( adc_pl_cr )
	adc_pl_cr		= 0.00
end if

return 1
end function

private subroutine of_get_sum_between_drcr_acc_range (datetime adtm_begindate, datetime adtm_enddate, string as_account_id1, string as_account_id2, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
			( a.coop_id = b.coop_id)  and  
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( b.account_id		between :as_account_id1  and  :as_account_id2 )  and			
			( a.coop_id =:as_coop_id)  and   and 
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

public function decimal of_get_result_gencash_begin (string as_acclist, datetime adtm_start, string as_coop_id);string		ls_account_array[]
integer	li_maxloop, li_index, li_pos, li_posr_end
integer	li_mul_flag, li_year, li_period
string		ls_arithmatic, ls_find, ls_account_id
string		ls_acc_temp
dec{2}	ldc_begin ,  ldc_dramt  , ldc_cramt, ldc_result, ldc_return

inv_string.of_parsetoarray( as_acclist, "," , ls_account_array )

li_maxloop	= upperbound( ls_account_array )
ldc_return	= 0.00

this.of_get_year_period( adtm_start , as_coop_id, li_year, li_period )

for li_index = 1 to li_maxloop
	ls_acc_temp			= ls_account_array[li_index]
	
	li_pos		= 0
	li_pos		= pos( ls_acc_temp, "-" )
	if ( li_pos > 0 ) then
		ls_account_id	= left( ls_acc_temp, li_pos - 1 )
		if ( isnull( ls_account_id ) or ls_account_id = "" ) then
			ls_account_id		= ""
		end if
		
		ls_acc_temp		= mid( ls_acc_temp , li_pos + 1 )
		
		if ( isnull( ls_acc_temp ) or ls_acc_temp = "" ) then
			ls_acc_temp		= ls_account_id
		end if
	else
		ls_account_id	= ls_acc_temp
	end if
	
	// ไม่เจอ รหัส คำนวณ
	if (  ls_account_id = "" ) or ( ls_acc_temp = "" )  then
		continue
	end if
	
	ldc_result	= 0.00
	ldc_result	= this.of_get_balance_begin( ls_account_id ,ls_acc_temp,  adtm_start, as_coop_id )
	ldc_result	= abs( ldc_result )
	
	ldc_return	= ldc_return + ldc_result
next

if ( ldc_return < 0 ) then ldc_return = 0.00

return ldc_return
end function

private subroutine of_get_sum_between_cr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_cr_amount, string as_coop_id);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.cr_amt)
into		:adc_cr_amount
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
              (a.coop_id = b.coop_id)  and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( a.coop_id.coop_id = :as_coop_id )
			( b.account_id		= :as_account_id)  using itr_sqlca ;
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_between_dr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, string as_coop_id);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt)
into		:adc_dr_amount
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
             (a.coop_id = b.coop_id)  and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( a.coop_id = :as_coop_id)
			( b.account_id		= :as_account_id)  using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_between_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_coop_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
                (a.coop_id = b.coop_id)  and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( b.account_id		= :as_account_id)  and
			( a.coop_id		= :as_coop_id )	and
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_between_drcr_adj (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_coop_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
              (a.coop_id = b.coop_id)  and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( b.account_id		= :as_account_id)  and
			( a.coop_id		= :as_coop_id ) and
			( a.cash_type		= 3 ) and
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_between_notpost_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_coop_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
			(a.coop_id 			= b.coop_id) and 
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( b.account_id		= :as_account_id)  and
			( a.coop_id		= :as_coop_id )	and
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_drcr_booktype (datetime adtm_begindate, integer ai_cashtype, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
	
if ( ai_cashtype = 1 ) then
	select		sum(b.dr_amt),   
				sum(b.cr_amt)  
	into		:adc_dr_amount,:adc_cr_amount		
	from 		vcvoucher a, vcvoucherdet b  
	where 	( a.voucher_no		= 	b.voucher_no ) and
	              ( a.coop_id 			=	b.coop_id) and 
				( a.posttoacc_flag	= 	1 ) and
				( a.voucher_date	= :adtm_begindate ) and
				( a.cash_type		= :ai_cashtype ) and
				( a.coop_id 			= :as_coop_id )
				; 
			 
else
	select		sum(b.dr_amt),   
				sum(b.cr_amt)  
	into		:adc_dr_amount,:adc_cr_amount		
	from 		vcvoucher a, vcvoucherdet b  
	where 	( a.voucher_no		= b.voucher_no ) and
 	              ( a.coop_id 			=	b.coop_id)
				( a.posttoacc_flag	= 1 ) and
				( a.voucher_date	= :adtm_begindate ) and
				(  a.coop_id 			= :as_coop_id  ) and
				( a.cash_type		= :ai_cashtype ) using itr_sqlca ;
end if

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_notpost_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, string as_coop_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
			( a.coop_id   		=b.coop_id	) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	< :adtm_enddate ) and
			( b.account_id		= :as_account_id)  and
			( a.coop_id			= :as_coop_id )   and 
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private function integer of_get_year_period (integer ai_year, integer ai_month, string as_coop_id, ref integer ai_periodyear, ref integer ai_period);integer ll_period

SELECT	period   , account_year
INTO		:ai_period,:ai_periodyear
FROM		accperiod  
WHERE	( to_char(period_end_date,'yyyy')	= :ai_year )AND  
			( to_char(period_end_date,'mm')	= :ai_month  ) and
			( coop_id	= :as_coop_id )using itr_sqlca ;
			
return 1
end function

private function integer of_get_yearange_date (integer ai_year, string as_coop_id, ref datetime adtm_date_start, ref datetime adtm_date_end) throws Exception;
select		beginning_of_accou,	ending_of_account
into		:adtm_date_start,		:adtm_date_end
from		accaccountyear
where	account_year	= :ai_year and
			coop_id		= :as_coop_id using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถตรวจสอบช่วงวันที่ของปีบัญชีได้ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

public function integer of_is_closemonth (integer ai_year, integer ai_period, string as_coop_id) throws Exception;integer	li_close

select		close_flag
into		:li_close
from		accperiod
where	( account_year 	= :ai_year )  and
			( period			= :ai_period ) and
			( coop_id		= :as_coop_id )using itr_sqlca;
			
if isnull( li_close ) then li_close = 0

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถตรวจสอบสถานะ ปิดสิ้นเดือนได้ (ไม่พบงวดบัญชี)" + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return li_close
end function

public function integer of_is_closeyear (integer ai_year, string as_coop_id) throws Exception;integer	li_close

select		close_account_stat
into		:li_close
from		accaccountyear
where	( account_year 	= :ai_year )  and
			( coop_id		= :as_coop_id ) using itr_sqlca;

if isnull( li_close ) then li_close = 0

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถตรวจสอบสถานะ ปิดสิ้นปีได้ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return li_close
end function

public function integer of_is_postall_voucher (datetime adtm_begin, datetime adtm_end, integer ai_post_status, string as_coop_id) throws Exception;//////////////////////////////////////////////////////////////////////////////
//  
//	Function Name:  		of_is_postall_voucher
//
//	Arguments:
//	adtm_begin			วันที่เริ่มต้นที่ต้องการตรวจสอบ
//	adtm_end			วันที่สุดท้ายที่ต้องการตรวจสอบ
//	ai_post_status		ข้อมูลสถานะที่ต้องการ ตรวจสอบ 1 ผ่านรายการ 0 รอผ่านรายการ
//	as_branch_id		สาขาที่ทำรายการ
//
//	Returns:  		integer
//						ค่าที่ส่งกลับ 0 คือ มีรายการที่ต้องการตรวจสอบอยู่  ในทางกลับกันส่ง 0
//
//	Description: 	ทำรายตรวจสอบสถานะใบ voucher เลขที่ต้องการ
//
//////////////////////////////////////////////////////////////////////////////
//
//	ประวัติการแก้ไข
//  Function Code :AC-ACCOUNTSERVICE-of_is_postall_voucher-0000004
//	Version 1.0   Initial version
//	Modified Date 25/08/2010
//  Modified By  Rah-Weerachit  Srinook
//////////////////////////////////////////////////////////////////////////////

integer	li_count

//เช็ครายการว่าในช่วงเดือนนี้มีการผ่านรายการแล้วหรือยัง
select count( voucher_no )
into	:li_count
from 	vcvoucher
where ( voucher_date	between :adtm_begin and :adtm_end )  and
		( posttoacc_flag	= :ai_post_status ) and
		( voucher_status	= 1) and
		( coop_id			= :as_coop_id) using itr_sqlca ;

if isnull( li_count ) then li_count = 0
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถตรวจสอบรายการที่ยังไม่ผ่านสู่แยกประเภทได้ กรุณาตรวจสอบ "   + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

return li_count
end function

public function integer of_is_postall_voucher (string as_voucher, integer ai_post_status, string as_coop_id) throws Exception;//////////////////////////////////////////////////////////////////////////////
//  
//	Function Name:  		of_is_postall_voucher
//
//	Arguments:
//	as_voucher			ข้อมูลเลขที่ voucher เป็น list ต่อๆ กัน ตัวอย่าง '000001','000002','000003','000004','000005'
//	ai_post_status		ข้อมูลสถานะที่ต้องการ ตรวจสอบ 1 ผ่านรายการ 0 รอผ่านรายการ
//	as_branch_id		สาขาที่ทำรายการ
//
//	Returns:  		integer
//						ค่าที่ส่งกลับ 0 คือ มีรายการที่ต้องการตรวจสอบอยู่  ในทางกลับกันส่ง 0
//
//	Description: 	ทำรายตรวจสอบสถานะใบ voucher เลขที่ต้องการ
//
//////////////////////////////////////////////////////////////////////////////
//
//	ประวัติการแก้ไข
//  Function Code :AC-ACCOUNTSERVICE-of_is_postall_voucher-0000003
//	Version 1.0   Initial version
//	Modified Date 25/08/2010
//  Modified By  Rah-Weerachit  Srinook
//////////////////////////////////////////////////////////////////////////////

integer	li_count

//เช็ครายการว่าในช่วงเดือนนี้มีการผ่านรายการแล้วหรือยัง
select count( voucher_no )
into	:li_count
from 	vcvoucher
where ( voucher_no		in ( :as_voucher ) )  and
		( posttoacc_flag	= :ai_post_status ) and
		( voucher_status	= 1) and
		( coop_id				= :as_coop_id) using itr_sqlca ;

if isnull( li_count ) then li_count = 0
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถตรวจสอบรายการที่ยังไม่ผ่านสู่แยกประเภทได้ กรุณาตรวจสอบ "   + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

return li_count
end function

public function integer of_isexits_sumledger (string as_account_id, integer ai_account_year, integer ai_period, string as_coop_id);integer	li_found

select		count( account_id )
into		:li_found
from		accsumledgerperiod
where	( account_year			= :ai_account_year ) and
			( period					= :ai_period) and
			( account_id				= :as_account_id)  and
			( coop_id				= :as_coop_id ) 
using itr_sqlca ;

if isnull( li_found ) then li_found = 0

return li_found
end function

private function integer of_post_to_sumledger (string as_account_id, integer ai_account_year, integer ai_period, integer ai_posttoallgl, decimal adc_sumdr, decimal adc_sumcr, string as_coop_id) throws Exception;/***********************************************
<description>
ทำรายการบันทึกข้อมุล ลงรายการสรุปประจำงวดบัญชี

FXREF: AC-ACCSERVICE-of_post_to_sumledger-0000001
</description>

<arguments>
as_account_id		รหัสบัญชี
ai_account_year	ปีบัญชี
ai_period				งวดบัญชี
ai_posttoallgl		สถานะการผ่านรายการ
adc_sumdr			ยอดผ่านรายการ ด้าน DR
adc_sumcr			ยอดผ่านรายการ ด้าน CR
as_coop_id			สาขา
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
    30/1/2012  : เพิ่ม coop_id  by pom
</history>
************************************************/
datetime		ldtm_date_start, ldtm_date_end

integer	li_count , li_index ,li_period ,li_account_year,  li_posttoallgl
dec{2}	ldc_for_dr,ldc_for_cr,ldc_be_dr,ldc_be_cr
dec{2}	ldc_temp_dr, ldc_temp_cr

//+++++++++++++++++++++++++++++++++++++++++++++++++++++
// 1. retrieve ข้อมูลจาก accgeneralledger ได้รหัสบัญชี งวด ปี เดบิต เครดิต 
//+++++++++++++++++++++++++++++++++++++++++++++++++++++
li_period  			= ai_period
li_account_year 	= ai_account_year
li_posttoallgl			= ai_posttoallgl

if isnull(li_posttoallgl) then li_posttoallgl = 1

//+++++++++++++++++++++++++++++++++++++++++++++++++++++
// 2. ดึงข้อมูลยอดยกมา จาก accsumledgerperiod 
//+++++++++++++++++++++++++++++++++++++++++++++++++++++
ldc_be_dr	= 0
ldc_be_cr	= 0
ldc_for_dr	= 0
ldc_for_cr	= 0

//ไปหายอดยกมา โดยดูทีละบัญชี  acc_no  จาก accsumledgerperiod  ของงวดก่อนหน้าที่ส่งไป ( ปี - งวดบัญชี  )
// ส่งกลับมาเป็น  ค่าด้าน Dr  ถ้าได้มาติดลบ จะหมายถึงค่าด้าน  Cr
ldc_be_dr	= this.of_get_balance_begin( as_account_id , ai_account_year , ai_period ,as_coop_id )  // Read for balance begin by pom

if isnull( ldc_be_dr ) then ldc_be_dr = 0.00
if isnull( ldc_be_cr ) then ldc_be_cr = 0.00

choose case ldc_be_dr
	case is > 0
		ldc_be_cr	= 0.00
		
	case is < 0
		ldc_be_cr	= abs( ldc_be_dr )
		ldc_be_dr	= 0.00
		
	case else
		ldc_be_dr	= 0.00
		ldc_be_cr	= 0.00
		
end choose

ldc_for_dr	= ldc_be_dr + adc_sumdr
ldc_for_cr	= ldc_be_cr + adc_sumcr

choose case ldc_for_dr - ldc_for_cr
	case is > 0
		ldc_for_dr	= ldc_for_dr - ldc_for_cr
		ldc_for_cr	= 0.00
		
	case is < 0
		ldc_for_cr	= ldc_for_cr - ldc_for_dr
		ldc_for_dr	= 0.00
		
	case else
		ldc_for_dr	= 0
		ldc_for_cr	= 0.00
		
end choose

//+++++++++++++++++++++++++++++++++++++++++++++++++++++
// 3. กรณีไม่เคยมียอดยกมาเลย  set ค่ายอดยกมาเป็น 0
//+++++++++++++++++++++++++++++++++++++++++++++++++++++
if this.of_isexits_sumledger( as_account_id ,ai_account_year, ai_period, as_coop_id ) = 0  then  //Read for ตรวจสอบมีในหรือยัง
	
	insert  into	accsumledgerperiod  
	(	account_year,       		period,				account_id,				dr_amount,				cr_amount,   
		begin_dr_amount,			begin_cr_amount,	forward_dr_amount,	forward_cr_amount,	coop_id,
		posttogl_allflag
	)  

	values
	(	:li_account_year,			:li_period,			:as_account_id,		:adc_sumdr,			:adc_sumcr,	
		:ldc_be_dr,					:ldc_be_cr,	 		:ldc_for_dr,				:ldc_for_cr,				:as_coop_id,
		:li_posttoallgl
	)   using itr_sqlca ;	  	
			
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มรายการ สรุปการเคลื่อนไหวได้ " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if	
	
//+++++++++++++++++++++++++++++++++++++++++++++++++++++
// 4. กรณีมีแล้วก็ update ค่า
//+++++++++++++++++++++++++++++++++++++++++++++++++++++
else
	
	update	accsumledgerperiod  
	set			dr_amount				= :adc_sumdr,
				cr_amount				= :adc_sumcr,
				forward_dr_amount	= :ldc_for_dr,
				forward_cr_amount	= :ldc_for_cr,
				begin_cr_amount		= :ldc_be_cr ,
				begin_dr_amount		= :ldc_be_dr
	where	( account_year			= :li_account_year ) and
				( period					= :li_period) and
				( account_id				= :as_account_id)  and
				( coop_id				= :as_coop_id) and
				( posttogl_allflag		= :li_posttoallgl ) using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถปรับปรุงรายการ สรุปการเคลื่อนไหวได้ " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
end if

return 1
end function

public function integer of_profit_year (integer ai_year, integer ai_period, string as_coop_id);dec{2}	ldc_dr_rcv,ldc_cr_rcv ,ldc_return,ldc_dr_pay,ldc_cr_pay ,ldc_rcv,ldc_pay
datetime	ldtm_begin, ldtm_end

select		period_end_date
into		:ldtm_end
from		accperiod
where	account_year		= :ai_year and
			period				= :ai_period and
			coop_id				= :as_coop_id
using itr_sqlca ;
	
			
select		period_end_date
into		:ldtm_begin
from		accperiod
where	account_year		= :ai_year and
			period				= 1 and
			coop_id				= :as_coop_id
using itr_sqlca ;
	
ldtm_begin	= datetime( date( year( date( ldtm_begin ) )  , month(  date( ldtm_begin ) ) , 1 ) )


select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:ldc_dr_rcv,:ldc_cr_rcv		
from 		vcvoucher a, vcvoucherdet b  , accmaster c
where 	( a.voucher_no		= b.voucher_no ) and
			( a.coop_id			= b.coop_id ) and
			( c.account_id		= b.account_id ) and
			( c.coop_id			= b.coop_id) and
			( a.posttoacc_flag	= 1 ) and 
			( a.voucher_date	>= :ldtm_begin ) and
			( a.voucher_date	<= :ldtm_end ) and
			( a.coop_id		= :as_coop_id )	and
			( c.account_group_id			= '4 ' )  and
			( a.voucher_status	= 1 )
using itr_sqlca ;

if isnull(ldc_dr_rcv) then ldc_dr_rcv =0
if isnull(ldc_cr_rcv) then ldc_cr_rcv =0

ldc_rcv	= ldc_dr_rcv - ldc_cr_rcv

select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:ldc_dr_pay,:ldc_cr_pay		
from 		vcvoucher a, vcvoucherdet b  , accmaster c
where 	( a.voucher_no		= b.voucher_no ) and
			( a.coop_id 			= b.coop_id	) and
			( c.account_id		= b.account_id ) and
			( c.coop_id			= b.coop_id	)
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :ldtm_begin ) and
			( a.voucher_date	<= :ldtm_end ) and
			( a.coop_id		= :as_coop_id )	and
			( c.account_group_id			= '5 ' )  and
			( a.voucher_status	= 1 )
using itr_sqlca ;


if isnull(ldc_dr_pay) then ldc_dr_pay =0
if isnull(ldc_cr_pay) then ldc_cr_pay =0

ldc_pay		= ldc_cr_pay - ldc_dr_pay
ldc_return	= abs(ldc_rcv - ldc_pay)

return ldc_return
end function

public function integer of_save_account_splitactivity (string as_splitactivity_xml) throws Exception;/***********************************************
<description>
ทำรายการบันทึกรายการแยก กิจกรรมของรหัสบัญชี

FXREF: AC-ACCSERVICE-of_save_account_splitactivity-0000001
</description>

<arguments>
as_conuse_xml				ข้อมูลรายการแยกกิจกรรม
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>

<history>
    30/1/2012  : เพิ่ม coop_id  by pom
</history>
************************************************/
integer	li_rc, li_acc_year, li_acc_period
integer	li_index, li_row
string		ls_acc_code, ls_coop_id
n_ds	lds_data

lds_data	= create n_ds
lds_data.dataobject = "d_acc_split_activity"
lds_data.settransobject( itr_sqlca )

if not  isnull( as_splitactivity_xml ) and trim( as_splitactivity_xml ) <> ""  then
	li_rc	= lds_data.importstring( XML!, as_splitactivity_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

// ตรวจสอบ การป้อนรายการ
for li_index = 1 to lds_data.rowcount()
	li_acc_year		= lds_data.GetitemNumber( li_index, "acc_year" )
	li_acc_period	= lds_data.GetitemNumber( li_index, "acc_period" )
	ls_acc_code		= lds_data.GetitemString( li_index, "account_id" )
	ls_coop_id		= lds_data.GetitemString( li_index, "coop_id" ) 
	
	if isnull( li_acc_year ) then li_acc_year = 0
	if isnull( li_acc_period ) then li_acc_period = 0
	if isnull( ls_acc_code ) then ls_acc_code = ""
	if isnull(ls_coop_id)   then  
		 lds_data.setitem(li_index,"coop_id",is_coop_id) 
	end if 	
	
	if ( li_acc_year = 0 or li_acc_period = 0 or ls_acc_code = ""  ) then
		ithw_exception.text	= "ไม่สามารถบันทึกรายการ การแยกกิจกรรมได้ กรุณาระบุ ปีบัญชี หรือ งวดบัญชี หรือ รหัสบัญชี"
		rollback using itr_sqlca;
		throw ithw_exception
	end if	
next

delete from acc_splitmoreactivity
where	acc_year		= :li_acc_year and
			acc_period	= :li_acc_period and
			coop_id	= :is_coop_id
using itr_sqlca;

li_rc	= lds_data.update( )
if ( li_rc = -1 ) then
	ithw_exception.text	= "ไม่สามารถบันทึกรายการ การแยกกิจกรรมได้ "
	ithw_exception.text	+= lds_data.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
end if

commit using itr_sqlca;
return 1
end function

private function integer of_set_contmoney (string as_string, integer an_year, integer an_month, ref decimal adc_result, string as_coop_id);string		ls_desc, ls_result, ls_bus[], ls_goods[], ls_temp, ls_temp_g, ls_temp_b
char		lc_product[]
integer	li_pos, li_index, li_row, li_select, li_index_b, li_index_g
integer	li_select_1, li_select_2, li_select_3, li_select_4, li_select_5, li_select_6
dec{2}	ldc_raw_meth_bf , ldc_goods_bf , ldc_goods_fw_norm , ldc_goods_fw_des , ldc_raw_meth_fw , ldc_goods_in_manufact

ls_desc		= trim( as_string )
if isnull( ls_desc ) then ls_desc = ""
adc_result	= 0.00

if trim( ls_desc ) <> "" then
	// ธุรกิจ
	li_pos		= pos( ls_desc	,  "$"  )
	if ( li_pos  > 0 ) then
		ls_result	= left( ls_desc, li_pos - 1 )
		ls_desc	= mid( ls_desc , li_pos + 1  )
		
		if left( ls_result , 1 ) = ","  then ls_result = mid( ls_result , 2 )
		inv_string.of_parsetoarray( ls_result ,"," , ls_bus )
	end if
	
	// ประเภทสินค้า
	li_pos		= 0
	li_pos		= pos( ls_desc	,  "@"  )
	if ( li_pos  > 0 ) then
		ls_result	= left( ls_desc, li_pos - 1 )
		ls_desc	= mid( ls_desc , li_pos + 1  )
		
		if left( ls_result , 1 ) = ","  then ls_result = mid( ls_result , 2 )
		inv_string.of_parsetoarray( ls_result ,"," , ls_goods )
	end if
	
	// ยอดคงเหลือ ที่ตรวจสอบ
	if left( ls_desc , 1 ) = ","  then ls_desc = mid( ls_desc , 2 )
	
	lc_product	= ls_desc
	li_index		= 0
	li_index		= upperbound( lc_product )
	
	for li_index_b = 1 to upperbound( ls_bus )
		li_row			= 0
		ls_temp_b	= ls_bus[li_index_b]
		ls_temp_b	= mid( ls_temp_b , 2 )
		
		ldc_raw_meth_bf			= 0.00
		ldc_goods_bf				= 0.00
		ldc_goods_fw_norm		= 0.00
		ldc_goods_fw_des			= 0.00
		ldc_raw_meth_fw			= 0.00
		ldc_goods_in_manufact	= 0.00
		
		// ยอด ระยะสั้น
		if li_index > 0 then
			li_select_1	= integer( lc_product[1]  )
			if isnull( li_select ) then li_select = 0
			if ( li_select_1 = 1 ) then
				
				select cnt_short_amt
				into	:ldc_raw_meth_bf
				from	acccntmoneysheet
				where	( account_year = :an_year )  and
							( period			= :an_month ) and
							(cnt_code		= :ls_temp_b)  and
							(coop_id 			= :as_coop_id)
				using itr_sqlca;
					
				if isnull( ldc_raw_meth_bf ) then ldc_raw_meth_bf = 0.00
				
			else
				ldc_raw_meth_bf	= 0.00
			end if
		end if
		
		// ยอดระยะยาว
		if li_index > 1 then
			li_select_2	= integer( lc_product[2]  )
			if isnull( li_select ) then li_select = 0
			if ( li_select_2 = 1 ) then
				
				select cnt_long_amt
				into	:ldc_goods_bf
				from	acccntmoneysheet
				where	( account_year = :an_year )  and
							( period			= :an_month ) and
							(cnt_code		= :ls_temp_b)  and							
							(coop_id 			= :as_coop_id)
							using itr_sqlca;

				if isnull( ldc_goods_bf ) then ldc_goods_bf = 0.00
				
			else
				ldc_goods_bf	= 0.00
			end if
			
		end if

		// ยอดรายการ รวม
		adc_result	+= ldc_raw_meth_bf + ldc_goods_bf 
	
	next
	
end if

return 1
end function

private function integer of_start_gen_finances_stm (string as_fs_code, datetime adtm_start_date, datetime adtm_end_date, string as_coop_id, integer ai_det);long		ll_index, ll_row
string		ls_data_type, ls_account_id, ls_biz, ls_account, ls_op_nature, ls_acclist[], ls_temp
string		ls_modify, ls_sheetcode_ref, ls_description, ls_result
integer	li_pos, li_found, li_year, li_period, li_amount1,li_seqno
dec{2}	ldc_begin_beforedate, ldc_begin_dr, ldc_begin_cr, ldc_sum_dr, ldc_sum_cr, ldc_short, ldc_long
dec{2}	ldc_sumall, ldc_sumalldr, ldc_sumallcr, ldc_mul_sumalldr, ldc_mul_sumallcr, ldc_div_sumalldr, ldc_div_sumallcr

if not isvalid( ids_finance_statement ) then
	ids_finance_statement	= create n_ds
	ids_finance_statement.dataobject = "d_acc_gen_bs_service"
	ids_finance_statement.settransobject( itr_sqlca )
end if

ids_finance_statement.reset( )

this.of_get_year_period( adtm_end_date, as_coop_id, li_year, li_period  )

select		sort_compute
into		:li_seqno
from		accsheetmoneyhead
where	moneysheet_code	= :as_fs_code using itr_sqlca;



ll_row		= ids_finance_statement.retrieve( li_seqno,as_coop_id )

for ll_index = 1 to ll_row
	ls_data_type		= trim( ids_finance_statement.GetitemString( ll_index , "data_type"  ) )
	ls_account_id		= trim( ids_finance_statement.GetitemString( ll_index , "data_desc"  ) )
	ls_op_nature		= trim( ids_finance_statement.GetitemString( ll_index , "operate_nature"  ) )
	ls_sheetcode_ref	= trim( ids_finance_statement.GetitemString( ll_index , "sheetcode_ref"  ) )
	ls_description		= trim( ids_finance_statement.GetitemString( ll_index , "description"  ) )
	li_amount1			= integer( ids_finance_statement.GetitemNumber( ll_index , "cnt_moneydet"  ) )
	
	if isnull( li_amount1 ) then li_amount1 = 0
	
	// หากมีสินค้า
	if ( li_amount1 = 1 ) then
		ls_data_type	= "FC"
	end if
	
	li_pos				= 0
	li_pos				= pos( ls_account_id, "," )
	if ( li_pos > 0 ) then
		ls_biz				= left( ls_account_id, li_pos - 1   )
		ls_account_id	= mid( ls_account_id , li_pos + 1  )
	else
		ls_biz				= ""
	end if
	
	// ยอดยกมา
	ldc_begin_beforedate	= 0.00
	ldc_begin_dr			= 0.00
	ldc_begin_cr			= 0.00
	
	// ยอดทำรายการ
	ldc_sum_dr				= 0.00
	ldc_sum_cr				= 0.00
	
	// ยอดรวม
	ldc_sumall				= 0.00
	ldc_sumalldr			= 0.00
	ldc_sumallcr				= 0.00
	
	ldc_mul_sumalldr		= 0.00
	ldc_mul_sumallcr		= 0.00
	
	ldc_div_sumalldr		= 0.00
	ldc_div_sumallcr		= 0.00
	
	ldc_short					= 0.00
	ldc_long					= 0.00
	
	choose case ls_data_type
		case "FC"
			if ( li_amount1 = 1 ) then
//				this.of_set_contmoney( ls_description  , li_year ,  li_period , ldc_begin_beforedate )				
								//แก้ไขกรณีออกรายงานงบการเงินยอดค่าคงที่ไม่ได้  by mike
				if(ldc_begin_beforedate = 0.00) then
				
					if trim( ls_description ) <> "" then
					// ธุรกิจ
					li_pos		= pos( ls_description	,  "$"  )
						if ( li_pos  > 0 ) then
						ls_result	= left( ls_description, li_pos - 1 ) // หารหัสค่าคงที่กระทบยอด
						ls_result 	= mid( ls_result, 2)
						ls_description	= mid( ls_description , li_pos + 1  ) //แยกสั้น -ยาว        สั้น = 10  ยาว = 01  สั้นยาว = 11
						end if
					end if
						if(ls_description = '10') then
							select cnt_short_amt
							into	:ldc_short
							from	acccntmoneysheet
							where	( account_year = :li_year )  and
										( period			= :li_period ) and
										(cnt_code		= :ls_result) using itr_sqlca;
							
						end if
						if(ls_description = '01') then
						select cnt_long_amt
						into	:ldc_long
						from	acccntmoneysheet
						where	( account_year = :li_year )  and
									( period			= :li_period ) and
									(cnt_code		= :ls_result) using itr_sqlca;
						end if
					end if
					if(ls_description = '11') then
							select cnt_short_amt , cnt_long_amt
							into	:ldc_short, :ldc_long
							from	acccntmoneysheet
							where	( account_year = :li_year )  and
										( period			= :li_period ) and
										(cnt_code		= :ls_result) using itr_sqlca;
						end if
					
						ldc_begin_beforedate = ldc_short + ldc_long
			end if
			
			if(trim(as_fs_code) = '07') and as_coop_id = '008001' then
				if(ls_sheetcode_ref = '08') then
				ai_det = 1
			else
				ai_det = 0
			end if
			end if
			
			// หากยอดที่ได้ มีค่าเป็น 0 ให้ทำการหาจาก งบแทน
			if ( ldc_begin_beforedate = 0.00 )  then
				// ยอดยกมาต้นปีบัญชี
				if ( ai_det = 0 ) then
					ldc_begin_beforedate		= this.of_get_balance_begin(  ls_account_id  , adtm_start_date, as_coop_id  )
				else
					ldc_begin_beforedate		= 0.00
				end if
				
				choose case ldc_begin_beforedate
					case is > 0 
						ldc_begin_dr	= ldc_begin_beforedate 
						
					case is < 0 
						ldc_begin_cr	= abs( ldc_begin_beforedate )
						
					case else 
						ldc_begin_cr	= 0
						ldc_begin_dr	= 0 
						
				end choose
				
				this.of_get_sum_between_drcr( adtm_start_date , adtm_end_date , ls_account_id ,  ldc_sum_dr , ldc_sum_cr  ,as_coop_id )
				
			
				if isnull( ldc_sum_dr ) then ldc_sum_dr = 0.00
				if isnull( ldc_sum_cr ) then ldc_sum_cr = 0.00
				
				// นำยอด รวมฝั่ง DR ตั้งลบด้วย ยอดรวมฝั่ง CR อล้วบวกเพิ่มด้วย ยอดยกมา
				ldc_sumall		= ( ldc_sum_dr - ldc_sum_cr )  + ldc_begin_beforedate
				
				// ตรวจสอบผลลัพธ์ที่ได้
				choose case ldc_sumall
					case is > 0 // หากยอดรวมทั้งหมด มีค่าเป็น +
						ldc_sumalldr	= ldc_sumall
						
					case is < 0 // หากยอดรวมทั้งหมด มีค่าเป็น -
						ldc_sumallcr		= abs( ldc_sumall )
						
					case else // หากยอดรวมทั้งหมด มีค่าเป็น 0
						ldc_sumallcr		= 0.00
						ldc_sumalldr	= 0.00
						
				end choose
			else
				if ( ls_op_nature = "DR" ) then
					ldc_sumalldr	= ldc_begin_beforedate
					ldc_sumallcr		= 0.00
				else
					ldc_sumallcr		= ldc_begin_beforedate
					ldc_sumalldr	= 0.00
				end if
			
			end if
			
			// Set ค่ากลับ ไปยัง n_ds เพื่อที่ต้องใช้ในการคำนวณ
			ids_finance_statement.SetItem( ll_index, "amount1", ldc_sumalldr  )
			ids_finance_statement.SetItem( ll_index, "amount2", ldc_sumallcr  )
			
		case "SM"			
			if(ls_account_id = 'ADD(960)' or ls_account_id = '570')  then
			ls_account_id = ls_account_id
		end if
			
			ids_finance_statement.Setfilter( "data_group = " +  ls_account_id + " and moneysheet_code = '" + ls_sheetcode_ref + "' " )
			ids_finance_statement.Filter( )

			ldc_sumalldr	= ids_finance_statement.object.compute_dr[ 1 ]
			ldc_sumallcr		= ids_finance_statement.object.compute_cr[ 1 ]			
			if isnull( ldc_sumalldr ) then ldc_sumalldr = 0.00
			if isnull( ldc_sumallcr ) then ldc_sumallcr = 0.00
			
			ldc_mul_sumalldr	= ids_finance_statement.object.compute_mul_dr[ 1 ]
			ldc_mul_sumallcr	= ids_finance_statement.object.compute_mul_cr[ 1 ]
			if isnull( ldc_mul_sumalldr ) then ldc_mul_sumalldr = 0.00
			if isnull( ldc_mul_sumallcr ) then ldc_mul_sumallcr = 0.00
			if ( ldc_mul_sumalldr = 0 ) and ( ( ldc_mul_sumallcr = 0 )  ) then ldc_mul_sumalldr = 1
			
			
			ldc_div_sumalldr	= ids_finance_statement.object.compute_div_dr[ 1 ]
			ldc_div_sumallcr	= ids_finance_statement.object.compute_div_cr[ 1 ]
			if isnull( ldc_div_sumalldr ) then ldc_div_sumalldr = 0.00
			if isnull( ldc_div_sumallcr ) then ldc_div_sumallcr = 0.00
			if ( ldc_div_sumalldr = 0 ) and ( ( ldc_div_sumallcr = 0 )  ) then ldc_div_sumallcr = 1
			
			
			ids_finance_statement.Setfilter( ""  )
			ids_finance_statement.Filter( )
			
			// Set ค่ากลับ ไปยัง n_ds เพื่อที่ต้องใช้ในการคำนวณ
			if ( ls_op_nature = "DR" ) then
				ldc_sumalldr	= ldc_sumalldr + ldc_sumallcr
				ldc_sumallcr		= 0.00
				
				ldc_sumalldr	= ldc_sumalldr * ( ldc_mul_sumalldr + ldc_mul_sumallcr ) / ( ldc_div_sumalldr + ldc_div_sumallcr )
			else
				ldc_sumallcr		= ldc_sumalldr + ldc_sumallcr
				ldc_sumalldr	= 0.00
				
				ldc_sumallcr		= ldc_sumallcr * ( ldc_mul_sumalldr + ldc_mul_sumallcr ) / ( ldc_div_sumalldr + ldc_div_sumallcr )
			end if
			
			ids_finance_statement.SetItem( ll_index, "amount1", ldc_sumalldr  )
			ids_finance_statement.SetItem( ll_index, "amount2", ldc_sumallcr  )
			
	end choose
	
next

return 1
end function

public function integer of_sum_foradd_profit (integer ai_account_year, string as_coop_id) throws Exception;integer	li_exits  , li_period
datetime	ldtm_period_enddate, ldtm_period_startdate
dec{2}	ldc_pl_sumall
dec{2}	ldc_dr,ldc_cr

n_ds lds_sumledgerperiod

//โอน บัญชีกำไรสุทธิ to บัญชีกำไรขาดทุน ในงบทดลองเดือนสุดท้าย
li_period		= this.of_get_max_period( ai_account_year , as_coop_id)

this.of_get_period_date( ai_account_year, li_period, as_coop_id, ldtm_period_enddate, ldtm_period_startdate )

// ยอดคงเหลือจริง
ldc_pl_sumall	= this.of_get_profit_period( ai_account_year, li_period , as_coop_id )

ldc_dr	= 0.00
ldc_cr	= 0.00

if ( ldc_pl_sumall > 0 ) then 
	ldc_cr	= ldc_pl_sumall
else	
	ldc_dr	= abs( ldc_pl_sumall )
end if

li_exits	= this.of_isexits_sumledger( is_benifit_total_acc, ai_account_year, li_period,as_coop_id )

if ( li_exits = 0 ) then
	INSERT INTO accsumledgerperiod  
	(	account_year,			period,				account_id,				dr_amount,				cr_amount,   
		begin_dr_amount,		begin_cr_amount,	forward_dr_amount,	forward_cr_amount,	coop_id,
		posttogl_allflag
	)  
	VALUES
	(	:ai_account_year,		:li_period,			:is_benifit_total_acc,	:ldc_dr,					:ldc_cr,   
		0,							0,               			:ldc_dr,					:ldc_cr,					:as_coop_id,
		1
	) using itr_sqlca;
else
	UPDATE	accsumledgerperiod  
	SET		dr_amount				= :ldc_dr,   
				cr_amount				= :ldc_cr,   
				forward_dr_amount	= :ldc_dr,   
				forward_cr_amount	= :ldc_cr  
	WHERE	( account_year			= :ai_account_year) AND  
				( period					= :li_period ) AND  
				( account_id				= :is_benifit_total_acc ) and
				( coop_id					= :as_coop_id ) and
				( posttogl_allflag		= 1 ) using itr_sqlca;
end if
	
if ( itr_sqlca.sqlcode = 0 ) then
	return 1
else
	ithw_exception.text	= " ไม่สามารถปรับปรุง ค่ายอด DR CR ได้ UPDATE accsumledgerperiod" + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

return 1
end function

private function integer zof_new_voucher_no (string as_voucher_type, string as_coop_id, datetime adtm_date, ref string as_voucher_no) throws Exception;//string		ls_column, ls_year, ls_date, ls_month, ls_docno
//integer	li_year, li_found
//datetime	ldtm_operate
//
//if isnull( as_voucher_type ) or trim( as_voucher_type ) = "" then as_voucher_type = "JV"
//
//ls_column	= "CMVOUCHERNO_" + as_voucher_type
//ls_docno		= inv_docservice.of_getnewdocno( ls_column )
//
//ldtm_operate		= adtm_date
//ls_date				= string(date(ldtm_operate),'dd')
//ls_month				= string(date(ldtm_operate),'mm')
//ls_year				= string(date(ldtm_operate),'yyyy')
//li_year				= integer(ls_year)+543
//ls_year				= RightA(string(li_year),2)
//as_voucher_no		= as_voucher_type + ls_year+ ls_month + rightA( ls_docno, 4 )
//li_found				= 0
//
//// ตรวจสอบดูว่ามีข้อมูลใน DB หรือยัง
//select		count( * )
//into		:li_found
//from		vcvoucher
//where	voucher_no		= :as_voucher_no and
//			coop_id		= :as_coop_id using itr_sqlca;
//
//if isnull( li_found ) then li_found = 0
//
//if ( li_found > 0 ) then
//	this.of_new_voucher_no( as_voucher_type , as_coop_id, adtm_date, as_voucher_no )
//end if
//
return 1
end function

public function string of_err_generate_import_xml (integer ai_error);choose case ai_error
	case	-1   
		return "No rows or startrow value supplied is greater than the number of rows in the string"
	case	-3
		return "Invalid argument"
	case	-4
		return "Invalid input"
	case	-11
		return "XML Parsing Error; XML parser libraries not found or XML not well formed"
	case	-12
		return "XML Template does not exist or does not match the DataWindow"
	case	-13
		return "Unsupported DataWindow style for import"
	case	-14
		return "Error resolving DataWindow nesting"
	case else
		return "No Error Message"
end choose
end function

public function integer of_get_year_period (datetime adtm_date, string as_coop_id, ref integer ai_year, ref integer ai_period);select	accperiod.account_year,accperiod.period  
into		:ai_year,:ai_period
from		accperiod  
where	accperiod.period_end_date in 
				(	select		min( accperiod.period_end_date)
					from 		accperiod  
					where	accperiod.period_end_date >= :adtm_date and
								coop_id	= :as_coop_id
				)  and
			coop_id	= :as_coop_id  using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ai_year		= 0
	ai_period		= 0
end if

return 1
end function

private function integer zof_add_new_updatevoucher (string as_vcmas_xml, string as_vcdet_xml, string as_coop_id) throws Exception;///***********************************************
//<description>
//ทำรายการยกเลิก voucher เลขที่ต้องการ
//
//FXREF: AC-ACCSERVICE-of_add_new_updatevoucher-0000005
//</description>
//
//<arguments>
//as_vcmas_xml		 ข้อมูล XML ของรายการหลักการลงรายวัน
//as_vcdet_xml		 ข้อมูล XML ของรายการย่อยการลงรายวัน
//as_coop_id		      สาขาที่ทำรายการ
//</arguments>
//
//<return>
//integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
//</return>
//
//<usage>
//ยังไม่มีตัวอย่างการใช้งาน
//</usage>
//<history>
// 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
//</history>
//
//************************************************/
//
//n_ds	lds_vc_head, lds_vc_det
//integer		li_rc, li_row, li_index, li_cashtype, li_new_update, li_year, li_period, li_close
//integer		li_vcstatus, li_posttoacc_flag
//string			ls_voucher_no, ls_voucher_type
//datetime		ldtm_date
//dec{2}		ldc_sum, ldc_sum_dr, ldc_sum_cr
//
//lds_vc_head		= create n_ds
//lds_vc_head.dataobject = "d_vc_vcupdate_main_service"
//lds_vc_head.Settransobject( itr_sqlca )
//
//lds_vc_det		= create n_ds
//lds_vc_det.dataobject = "d_vc_vcupdate_detail_service"
//lds_vc_det.Settransobject( itr_sqlca )
//
//if not  isnull( as_vcmas_xml ) and trim( as_vcmas_xml ) <> ""  then
//	li_rc	= lds_vc_head.importstring( XML!, as_vcmas_xml )
//	if ( li_rc < 0 ) then
//		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
//		throw ithw_exception
//	end if
//end if
//
//if not  isnull( as_vcdet_xml ) and trim( as_vcdet_xml ) <> ""  then
//	li_rc	= lds_vc_det.importstring( XML!, as_vcdet_xml )
//	if ( li_rc < 0 ) then
//		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
//		throw ithw_exception
//	end if
//end if
//
//li_row		= lds_vc_head.rowcount( )
//
//if ( li_row > 0 ) then
//	ls_voucher_no		= trim( lds_vc_head.GetitemString( 1, "voucher_no" ) )
//	ls_voucher_no		= trim( ls_voucher_no )
//	ls_voucher_type	= trim( lds_vc_head.GetitemString( 1, "voucher_type" ) )
//	li_cashtype			= lds_vc_head.GetitemNumber( 1, "cash_type" )
//	ldtm_date			= lds_vc_head.GetitemDatetime( 1, "voucher_date" )
//	li_vcstatus			= lds_vc_head.GetitemNumber( 1, "voucher_status" )
//	li_posttoacc_flag	= lds_vc_head.GetitemNumber( 1, "posttoacc_flag" )
//	 	
//	if isnull( li_vcstatus ) then li_vcstatus = 1
//	if isnull( li_posttoacc_flag ) then li_posttoacc_flag = 0
//	
//	// ตรวจสอบการปิดงวดงานแล้วหรือไม่
//	this.of_get_year_period( ldtm_date, as_coop_id, li_year, li_period )
//	li_close	= this.of_is_closemonth( li_year, li_period, as_coop_id )
//	
//	if ( li_close = 1 ) then
//		ithw_exception.text	= "ไม่สามารถบันทึกรายการได้ เนื่องจากปิดสิ้นเดือนแล้ว "
//		rollback using itr_sqlca;
//		throw ithw_exception
//	end if
//	
//	// ตรวจสอบสถานะใบรายการ
//	if ( li_vcstatus <> 1 ) then
//		ithw_exception.text	= "ไม่สามารถบันทึกรายการได้ เนื่องจากสถานะใบรายการถูกยกเลิกไปแล้ว "
//		rollback using itr_sqlca;
//		throw ithw_exception
//	end if
//	
//	// ตรวจสอบสถานะการผ่านรายการ
//	if ( li_posttoacc_flag = 1 ) then
//		ithw_exception.text	= "ไม่สามารถบันทึกรายการได้ เนื่องจากมีการผ่านรายการแล้ว "
//		rollback using itr_sqlca;
//		throw ithw_exception
//	end if
//	
//	if ( ls_voucher_no = "" ) or ( ls_voucher_no = "Auto" ) then
//		this.of_new_voucher_no( ls_voucher_type , as_coop_id, ldtm_date, ls_voucher_no )		
//		lds_vc_head.Setitem( 1, "voucher_no", ls_voucher_no )
//		
//		li_new_update		= 1
//	else
//		li_new_update		= 0
//	end if
//	
//	li_row		= lds_vc_det.rowcount( )
//	for li_index = 1 to li_row
//		lds_vc_det.Setitem( li_index, "voucher_no", ls_voucher_no )
//		lds_vc_det.Setitem( li_index, "seq_no", li_index )
//	next
//	
//	if ( ( ls_voucher_type = 'PV' ) or ( ls_voucher_type = 'RV' ) ) and ( li_cashtype = 1 ) then
//		li_row		= 0
//		li_row		= lds_vc_det.find( "account_id = '" + is_cash_id  + "'" , 0 , lds_vc_det.rowcount( ) )
//		
//		if ( li_row < 1 ) then
//			li_row		= lds_vc_det.insertrow( 0 )
//		end if
//		
//		lds_vc_det.Setitem( li_row, "voucher_no", ls_voucher_no )
//		lds_vc_det.Setitem( li_row, "seq_no", li_row )
//		lds_vc_det.Setitem( li_row, "system_code", "VCR" )
//		lds_vc_det.Setitem( li_row, "vcgrp_no", "MNL" )
//		lds_vc_det.Setitem( li_row, "account_id", is_cash_id )		
//		lds_vc_det.Setitem( li_row, "sort_order", 0 )
//		lds_vc_det.Setitem( li_row, "posttoacc_flag", 0 )
//		lds_vc_det.Setitem( li_row, "posttogl_flag", 1 )
//		lds_vc_det.Setitem( li_row, "posttogl_allflag", 1 )
//		
//		if ( ls_voucher_type = 'RV' ) then
//			ldc_sum		= lds_vc_det.object.compute_3[1]
//			
//			lds_vc_det.Setitem( li_row, "account_side", 'DR' )
//			lds_vc_det.Setitem( li_row, "dr_amt", ldc_sum )
//			lds_vc_det.Setitem( li_row, "cr_amt", 0 )
//		else
//			ldc_sum		= lds_vc_det.object.compute_2[1]
//			
//			lds_vc_det.Setitem( li_row, "account_side", 'CR' )
//			lds_vc_det.Setitem( li_row, "dr_amt", 0 )
//			lds_vc_det.Setitem( li_row, "cr_amt", ldc_sum )
//		end if
//	else
//		ldc_sum_cr	= lds_vc_det.object.compute_3[1]
//		ldc_sum_dr	= lds_vc_det.object.compute_2[1]
//		
//		if isnull( ldc_sum_dr ) then ldc_sum_dr = 0.00
//		if isnull( ldc_sum_cr ) then ldc_sum_cr = 0.00
//		
//		if ( ldc_sum_dr <> ldc_sum_cr ) then
//			ithw_exception.text	= "ไม่สามารถบันทึกรายการได้ ยอดรวม DR และ CR ไม่เท่ากัน กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
//			rollback using itr_sqlca;
//			throw ithw_exception
//		end if
//	end if
//	
//	lds_vc_head.Accepttext( )
//	lds_vc_det.Accepttext( )
//	
//end if
//
//// set itemstatus ของทั้ง main และ detail
//if ( li_new_update = 0 ) then	
//	delete from vcvoucherdet
//	where		voucher_no		= :ls_voucher_no 
//	and             coop_id 			= :as_coop_id	 		
//	using itr_sqlca;
//	
//	delete from vcvoucher
//	where	voucher_no		= :ls_voucher_no 
//	and        coop_id 			= :as_coop_id
//	using itr_sqlca;
//	
//end if
//
//li_rc	= lds_vc_head.update( )
//if ( li_rc = -1 ) then
//	ithw_exception.text	= "ไม่สามารถบันทึกรายการประเภทรายการหลัก ได้ "
//	ithw_exception.text	+= lds_vc_head.of_geterrormassage()
//	rollback using itr_sqlca;
//	throw ithw_exception
//end if
//
//li_rc	= lds_vc_det.update( )
//if ( li_rc = -1 ) then
//	ithw_exception.text	= "ไม่สามารถบันทึกรายละเอียด รายการ ได้ "
//	ithw_exception.text	+= lds_vc_det.of_geterrormassage()
//	rollback using itr_sqlca;
//	throw ithw_exception
//else
//	update	vcvoucherdet
//	set			non_cashpaper	= 0
//	where	voucher_no		= :ls_voucher_no and
//	and        coop_id 			= :as_coop_id
//				non_cashpaper	is null
//	using itr_sqlca;
//end if
//
//commit using itr_sqlca ;
return 1
end function

private function integer zof_get_list_vcmas_det (string as_vcno, ref string as_vcmas_xml, ref string as_vcdet_xml, string as_coop_id);n_ds	lds_vc_head, lds_vc_det

lds_vc_head		= create n_ds
lds_vc_head.dataobject = "d_vc_vcedit_vchead_service"
lds_vc_head.Settransobject( itr_sqlca )

lds_vc_det		= create n_ds
lds_vc_det.dataobject = "d_vc_vcedit_vcdetail_service"
lds_vc_det.Settransobject( itr_sqlca )

lds_vc_head.retrieve( as_vcno ,as_coop_id)
lds_vc_det.retrieve( as_vcno ,as_coop_id )

if lds_vc_head.rowcount() > 0 then
	as_vcmas_xml	= lds_vc_head.describe( "Datawindow.data.XML" )
else
	as_vcmas_xml	= ""
end if

if lds_vc_det.rowcount() > 0 then
	as_vcdet_xml	= lds_vc_det.describe( "Datawindow.data.XML" )
else
	as_vcdet_xml	= ""
end if

return 1
end function

private function integer zof_get_vclist_day (datetime adtm_date, string as_coop_id, ref string as_vclist_xml);//ย้ายไปที่  n_cst_voucher->of_init_vclistdat

n_ds	lds_vc_list

lds_vc_list		= create n_ds
lds_vc_list.dataobject = "d_vc_vcedit_vclist_service"
lds_vc_list.Settransobject( itr_sqlca )

lds_vc_list.retrieve(adtm_date,  as_coop_id )

if lds_vc_list.rowcount() > 0 then
	as_vclist_xml	= lds_vc_list.describe( "Datawindow.data.XML" )
else
	as_vclist_xml	= ""
end if

return 1
end function

public function integer of_set_default_accountid (string as_coop_id);//////////////////////////////////////////////////////////////////////////////
//  
//	Function Name:	of_set_default_accountid
//
//	Arguments:
//	as_branch_id	สาขา ที่ทำรายการ
//
//	Returns:  		integer
//						ค่าที่ส่งออกไป บอกผลลัพท์ว่า function นี้ถูกเรียกใช้แล้ว
//
//	Description: 	เพื่อทำการดึงค่าเริ่มต้น ที่สำคัญ ของระบบงานบัญชี มาเก็บในค่าตัวแปร instant
//						สำหรับ การเรียกใช้ ใน function ส่วนอื่นๆ ของ service
//////////////////////////////////////////////////////////////////////////////
//
//	ประวัติการแก้ไข
//  Function Code :AC-ACCSERVICE-of_set_default_accountid-0000002
//	Version 1.0   Initial version
//	Modified Date 17/08/2010
//  Modified By  Rah-Weerachit Srimook
//////////////////////////////////////////////////////////////////////////////

select		cash_account_code,
			present_account_ye,
			benifit_total_acco,   //เลขที่บัญชีกำไรสะสม
			benifit_account_id  ,//กำไรสุทธิ 
			begin_year ,
			begin_period,
			beginning_of_accou,
			ending_of_account, 
			account_pl_pf, //เลขที่บัญชีกำไรขาดทุน
			finstatus_code
into		:is_cash_id,
			:ii_present_year,
			:is_benifit_total_acc,   //เลขที่บัญชีกำไรสะสม
			:is_benifit_account_id  ,//กำไรสุทธิ 
			:ii_begin_year ,
			:ii_begin_period,
			:idtm_beginning_of_accou,
			:idtm_ending_of_account, 
			:is_account_pl_pf, //เลขที่บัญชีกำไรขาดทุน
			:is_finstatus_code
from		accconstant
where	coop_registered_no		= :as_coop_id 
using itr_sqlca ;

is_cash_id				= trim( is_cash_id )
is_benifit_total_acc	= trim( is_benifit_total_acc )
is_benifit_account_id	= trim( is_benifit_account_id )
is_account_pl_pf		= trim( is_account_pl_pf )
is_finstatus_code		= trim( is_finstatus_code )

return 1
end function

public function integer of_initservice (n_cst_dbconnectservice anv_db);//////////////////////////////////////////////////////////////////////////////
//  
//	Function Name:	of_init
//
//	Arguments:
//	anv_db			object ที่ใช้สำหรับการเชื่อมต่อฐานข้อมูล
//	as_branch_id	สาขาที่ทำรายการ
//
//	Returns:  		integer
//						ค่าที่ส่งออกไป บอกผลลัพท์ว่า function นี้ถูกเรียกใช้แล้ว
//
//	Description: 	เพื่อทำการกำหนดค่าการเชื่อมต่อฐานข้อมูลให้กับ ตัวแปร instant itr_sqlca
//////////////////////////////////////////////////////////////////////////////
//
//	ประวัติการแก้ไข
//  Function Code :AC-ACCSERVICE-of_init-0000001
//	Version 1.0   Initial version
//	Modified Date 17/08/2010
//  Modified By  Rah-Weerachit Srimook
//////////////////////////////////////////////////////////////////////////////

itr_sqlca	= anv_db.itr_dbconnection 
inv_docservice	= create n_cst_doccontrolservice
inv_string		= create n_cst_stringservice
inv_datetime	= create n_cst_datetimeservice
inv_prepare		= create n_cst_account_prepare_vc_service	


inv_docservice.of_settrans( anv_db )
inv_prepare.of_settrans( anv_db )
is_coop_id =  anv_db.is_coopid
is_coop_control =  anv_db.is_coopcontrol
this.of_set_default_accountid(is_coop_id ) 
 
 
 
return 1
end function

public function integer of_close_month (integer ai_year, integer ai_period) throws Exception;/***********************************************
<description>
	   ปิดสิ้นเดือน
</description>


<arguments>

	ai_year			ปี  (ค.ศ.)
	ai_period		    งวดบัญชี 
 
</arguments>

<return>
        integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
	ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>
*************************************************/


integer	li_count, li_index, li_row, li_rc, li_close
datetime	ldtm_begin, ldtm_end
string		ls_accid
dec{2}	ldc_dr, ldc_cr 
n_ds	lds_check

// ใช่งวดล่าสุดที่ยังไม่ได้ปิดหรือไม่
select count(period)
into	:li_count
from	accperiod
where ( account_year 	= :ai_year ) and
		( period				< :ai_period ) and
		( close_flag			= 0) and
		( coop_id			= :is_coop_id ) using itr_sqlca;
if isnull( li_count ) then li_count = 0		
if li_count > 0 then
	ithw_exception.text	= "1. ปิดได้เฉพาะงวดล่าสุดที่ยังไม่ปิดสิ้นเดือนเท่านั้น กรุณาตรวจสอบ "
	rollback using itr_sqlca;
	throw ithw_exception
end if

// กรณีปิดสิ้นเดือนแล้ว ไม่สามารถปิดได้อีก
li_close	= 0
li_close	= this.of_is_closemonth( ai_year, ai_period, is_coop_id )
if ( li_close = 1 ) then
	ithw_exception.text	= "2. ปิดได้เฉพาะงวดล่าสุดที่ยังไม่ปิดสิ้นเดือนเท่านั้น กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if


this.of_get_period_date( ai_year , ai_period , is_coop_id, ldtm_begin, ldtm_end )

//เช็ครายการว่าในช่วงเดือนนี้มีการผ่านรายการแล้วหรือยัง
li_count	= 0
li_count	= this.of_is_postall_voucher( ldtm_begin, ldtm_end, 0, is_coop_id )
if isnull( li_count ) then li_count = 0
if li_count > 0 then
	ithw_exception.text	= "ยังไม่ได้ผ่านรายการไปแยกประเภททุกรายการ กรุณาตรวจสอบ"
	rollback using itr_sqlca;
	throw ithw_exception
end if
//*** ถ้าผ่านรายการแล้ว update ยอดรวมของแต่ละบัญชีในเดือนที่จะปิด เข้า accsumledgerperiod

lds_check = create n_ds
lds_check.dataobject = 'd_acc_accmaster_all_service'
lds_check.settransobject(itr_sqlca)

li_row	= lds_check.retrieve(is_coop_id )

lds_check.setsort( "account_rev_group A, account_group_id A , account_id A" )
lds_check.sort()


for	li_index	= 1 to li_row
	ls_accid	= lds_check.object.account_id[li_index]
	
	//หายอดสะสมระหว่าง วันที่่่ส่งเข้าไป  ได้ผลรวม  DR และ  CR
	this.of_get_sum_between_drcr( ldtm_begin , ldtm_end  , ls_accid , is_coop_id,  ldc_dr , ldc_cr  )
	
	this.of_post_to_sumledger( ls_accid, ai_year, ai_period, 1,  ldc_dr, ldc_cr, is_coop_id )
next

//*****************************update status_close
update	accperiod
set			close_flag	= 1
where	( account_year 	= :ai_year )  and
			( period			= :ai_period ) and
			( coop_id		= :is_coop_id ) using itr_sqlca;

if itr_sqlca.sqlcode <>  0 then
	ithw_exception.text	= "ไม่สามารถปิดสิ้นเดือนได้ กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
else
	commit using itr_sqlca;	
end if

return 1
end function

public function integer of_cancel_closemonth (integer ai_year, integer ai_period) throws Exception;/***********************************************
<description>
	 ยกเลิกปิดสิ้นเดือน


</description>

<arguments>
ai_year			ปีบัญชี
ai_period			งวดที่ทำรายการ 
 
</arguments>

<return>
        integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom   เพิ่มการใช้ coop_id
</history>
*******************************************************/

integer	li_row, li_count, li_index, li_close
dec{2}	ldc_begin, ldc_begin_dr, ldc_begin_cr
datetime	ldtm_begin, ldtm_end

// ปิดสิ้นปีหรือยัง
li_close	= 0
li_close	= this.of_is_closeyear( ai_year,  is_coop_id )
if ( li_close = 1 ) then
	ithw_exception.text	= "ยกเลิกได้เฉพาะปีบัญชีที่ยังไม่มีการปิดสิ้นปีเท่านั้น กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ปิดสิ้นเดือนหรือยัง
li_close	= 0
li_close	= this.of_is_closemonth( ai_year, ai_period, is_coop_id )
if ( li_close = 0 ) then
	ithw_exception.text	= "ยกเลิกได้เฉพาะงวดล่าที่ปิดสิ้นเดือนแล้วเท่านั้น กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// มีงวดอื่นที่ มากกว่างวดนี้หรือไม่ ที่ได้ปิดไปแล้ว
select count(period)
into	:li_row
from	accperiod
where ( account_year 	= :ai_year ) and
		( period				> :ai_period ) and
		( close_flag			= 1) and
		( coop_id			= :is_coop_id ) using itr_sqlca;
		
if li_row > 0 then
	ithw_exception.text	= "ยกเลิกได้เฉพาะงวดล่าสุดเท่านั้น กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

if ai_period = 1 then 	
	update	accsumledgerperiod
	set			dr_amount		= 0 ,
				cr_amount		= 0,
				forward_dr_amount	= begin_dr_amount,
				forward_cr_amount	= begin_cr_amount
	where	account_year		= :ai_year and
				period				= 1 and
				coop_id				= :is_coop_id using itr_sqlca;
			
else
	delete accsumledgerperiod 
	where account_year	= :ai_year and
			period 		  	= :ai_period  and
			coop_id			= :is_coop_id using itr_sqlca;
end if

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปิดสิ้นเดือนได้ กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

//**************update สถานะเป็นยังไม่ปิดงวด
update	accperiod
set			close_flag	= 0
where	( account_year 	= :ai_year )  and
			( period			= :ai_period ) and
			( coop_id		= :is_coop_id ) using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงสถานะ ปิดสิ้นเดือนได้ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

commit using itr_sqlca;

return 1
end function

public function integer of_init_consstant_bs (string as_data_desc, ref string as_buzz_display_xml, ref string as_usr_type_xml);/***********************************************
<description>
ทำรายการแสดงข้อมูลการบันทึกสูตร ค่าคงที่

FXREF: AC-ACCSERVICE-of_gen_display_consstant_bs-0000005
</description>

<arguments>
as_data_desc				ข้อมูลรายการ คำอธิบาย ที่มีการอ้างอิง
as_buzz_display_xml		ข้อมูล XML ของรายการหลักการบันทึกสูตรค่าคงที่
as_usr_type_xml			ข้อมูล XML ของรายการย่อยการบันทึกสูตรค่าคงที่
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>
************************************************/

string		ls_result, ls_bus[], ls_goods[], ls_temp
char		lc_product[]
integer	li_pos, li_index, li_row, li_select
n_ds		lds_main, lds_detail

lds_main		= create n_ds
lds_main.dataobject = "dw_acc_const_code"
lds_main.settransobject( itr_sqlca )

lds_detail		= create n_ds
lds_detail.dataobject = "dw_acc_cont_typemoney"

lds_main.retrieve( is_coop_id)
lds_detail.insertrow( 0 )

if trim( as_data_desc ) <> "" then
	// ธุรกิจ
	li_pos		= pos( as_data_desc	,  "$"  )
	if ( li_pos  > 0 ) then
		ls_result			= left( as_data_desc, li_pos - 1 )
		as_data_desc	= mid( as_data_desc , li_pos + 1  )
		
		if left( ls_result , 1 ) = ","  then ls_result = mid( ls_result , 2 )
		inv_string.of_parsetoarray( ls_result ,"," , ls_bus )
		
		for li_index = 1 to upperbound( ls_bus )
			li_row		= 0
			ls_temp	= ls_bus[li_index]
			ls_temp	= mid( ls_temp, 2 )
			li_row		= lds_main.find( " trim( cnt_code ) = '" + ls_temp + "' "  , 0 , lds_main.rowcount() )
			
			if ( li_row > 0 ) then
				lds_main.Setitem( li_row , "flag" , 1 )
			end if
		next
		
	end if
	
	// ยอดคงเหลือ ที่ตรวจสอบ
	if left( as_data_desc , 1 ) = ","  then as_data_desc = mid( as_data_desc , 2 )
	
	lc_product	= as_data_desc
	li_index		= 0
	
	li_index		= upperbound( lc_product )
	if li_index > 0 then
		li_select	= integer( lc_product[1]  )
		if isnull( li_select ) then li_select = 0		
		lds_detail.Setitem( 1 , "cnt_short" , li_select )
	end if
	
	if li_index > 1 then
		li_select	= integer( lc_product[2]  )
		if isnull( li_select ) then li_select = 0		
		lds_detail.Setitem( 1 , "cnt_long" , li_select )
	end if

end if

lds_main.accepttext( )
lds_detail.accepttext( )

if ( lds_main.rowcount() > 0 ) then
	as_buzz_display_xml	= lds_main.Describe( "Datawindow.Data.XML" )
end if

if ( lds_detail.rowcount() > 0 ) then
	as_usr_type_xml		= lds_detail.Describe( "Datawindow.Data.XML" )
end if

return 1
end function

public function integer of_save_constant_bs (string as_main_xml, string as_detail_xml, string as_money_code, integer an_sheet_seq) throws Exception;/***********************************************
<description>
ทำรายการบันทึกสูตร ค่าคงที่

FXREF: AC-ACCSERVICE-of_update_bs_constant_exp-0000005
</description>

<arguments>
as_main_xml		ข้อมูล XML ของรายการหลักการบันทึกสูตรค่าคงที่
as_detail_xml		ข้อมูล XML ของรายการย่อยการบันทึกสูตรค่าคงที่
as_money_code	รหัสงบการเงิน
as_data_group		กลุ่มงบการเงิน ที่ใช้อ้างอิง
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/

long		ll_index, ll_row, ll_rowmax, ll_sheetseq
string		ls_account, ls_desc, ls_accupdate, ls_operate_nature, ls_sheetcode_ref
integer	li_operate, li_rc
integer	li_loop, li_select

n_ds	lds_main, lds_detail

lds_main		= create n_ds
lds_main.dataobject = "dw_acc_const_code"

lds_detail		= create n_ds
lds_detail.dataobject = "dw_acc_cont_typemoney"

if not  isnull( as_main_xml ) and trim( as_main_xml ) <> ""  then
	li_rc	= lds_main.importstring( XML!, as_main_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

if not  isnull( as_detail_xml ) and trim( as_detail_xml ) <> ""  then
	li_rc	= lds_detail.importstring( XML!, as_detail_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if


// delete ก่อน
delete from accsheetmoneydet
where	moneysheet_code		= :as_money_code  and
			data_group				= :an_sheet_seq
using itr_sqlca ;

select		max( MONEYSHEET_SEQ )
into		:ll_rowmax
from 		accsheetmoneydet
where	moneysheet_code		= :as_money_code and
			FINANCE_MASSTS		= 0 and
			coop_id =:is_coop_id 
using itr_sqlca ;

if isnull( ll_rowmax ) or ll_rowmax = 0 then ll_rowmax = 2000

ll_rowmax ++
li_operate	= 1

// ค่าที่ต้องเอาไป ทำการประมวลหายอด
// Bus#Group
// เอา ธุรกิจ
for li_loop = 1 to lds_main.rowcount( )
	li_select	= lds_main.object.flag[li_loop]
	if isnull( li_select ) then li_select = 0
	
	if li_select = 0 then continue
	
	if ( trim( ls_desc ) = "" ) then
		ls_desc	= "B" + trim( lds_main.object.cnt_code[li_loop] )
	else
		ls_desc	+= ",B" + trim( lds_main.object.cnt_code[li_loop] )
	end if
	
next

ls_desc	= ls_desc + "$" 

// เอารายการอะไรบ้าง
// ระยะสั้น
li_select	= lds_detail.object.cnt_short[1]
if isnull( li_select ) then li_select = 0
ls_desc	= ls_desc + string( li_select )
	
// ระยะยาว
li_select	= lds_detail.object.cnt_long[1]
if isnull( li_select ) then li_select = 0
ls_desc	= ls_desc + string( li_select )

INSERT INTO ACCSHEETMONEYDET  
(	MONEYSHEET_CODE,   
	MONEYSHEET_SEQ,   
	DATA_TYPE,   
	DATA_DESC,   
	DESCRIPTION,   
	AMOUNT1,   
	AMOUNT2,   
	AMOUNT3,   
	AMOUNT4,   
	SHOW_STATUS,   
	SHOW_DET_STATUS1,   
	SHOW_DET_STATUS2,   
	SHOW_DET_STATUS3,   
	SHOW_DET_STATUS4,   
	SHOW_DET_PERCENT,   
	TOG_STATUS,   
	TOG_SEQ,   
	TOG_DESC,   
	TOG_DATA_GROUP,   
	TOG_SHOW_STATUS,   
	DATA_GROUP,   
	REMARK,   
	DOWN_LINE,   
	UP_LINE,   
	FINANCE_MASSTS,   
	OPERATION_TYPE,
	operate_nature,
	sheetcode_ref,
	sort_order,
	cnt_moneydet ,
	coop_id )  
VALUES
(	:as_money_code,   
	:ll_rowmax,   
	'SM',   
	to_char(:an_sheet_seq ),   
	:ls_desc ,   
	0,   
	0,   
	0,   
	0,   
	0,   
	0,   
	0,   
	0,
	0,   
	0,   
	0,
	0,
	null,   
	null,
	0,   
	to_char( :an_sheet_seq ),   
	null,   
	0,   
	0,   
	0,   
	:li_operate, 
	'DR',
	:as_money_code,
	:ll_index,
	1,
	:is_coop_id
) using itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	= "ไม่สามารถทำรายการได้ " + sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

update	ACCSHEETMONEYDET
set			data_desc	= :ls_desc
where	MONEYSHEET_CODE		= :as_money_code and
			MONEYSHEET_SEQ		= :an_sheet_seq and 
			coop_id  						= :is_coop_id
using itr_sqlca ;			

commit using itr_sqlca ;

return 1
end function

public function integer of_init_formular_fc (string as_money_sheetcode, integer an_data_group, ref string as_formular_fc_xml, ref string as_formular_fc_choose_xml) throws Exception;/* EDIT  by pom  เปลี่ยนชื่อ  function จาก  of_get_set_formular_fc  เป็น  of_init_set_formular_fc  */
n_ds	lds_formular_fc, lds_formular_fc_choose

lds_formular_fc				= create n_ds
lds_formular_fc.dataobject	= "d_acc_set_formula_det"
lds_formular_fc.settransobject( itr_sqlca )

lds_formular_fc_choose		= create n_ds
lds_formular_fc_choose.dataobject	= "d_acc_set_formula_det_accmaster"
lds_formular_fc_choose.settransobject( itr_sqlca )

lds_formular_fc.retrieve( as_money_sheetcode, an_data_group,is_coop_id )
lds_formular_fc_choose.retrieve(is_coop_id )

as_formular_fc_xml		= ""
as_formular_fc_choose_xml	= ""

if ( lds_formular_fc.rowcount( ) > 0 ) then
	as_formular_fc_xml	= lds_formular_fc.Describe( "Datawindow.Data.XML" )
end if

if ( lds_formular_fc_choose.rowcount() > 0 ) then
	as_formular_fc_choose_xml	= lds_formular_fc_choose.Describe( "Datawindow.Data.XML" )
end if

return 1
end function

public function integer of_save_formula_fc (string as_main_xml, string as_money_code, string as_data_group) throws Exception;/***********************************************

<description>
ทำรายการบันทึกสูตรงบการเงิน การคำนวณ

FXREF: AC-ACCSERVICE-of_save_exp_bs_sheet_fc-0000005
</description>

<arguments>
as_main_xml		ข้อมูล XML ของรายการหลักการบันทึกสูตร
as_money_code	รหัสงบการเงิน
as_data_group		กลุ่มงบการเงิน ที่ใช้อ้างอิง
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
      ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
    30/1/2012  : เพิ่ม coop_id  by pom	 
	 
	เปลี่ยนชื่อ function 	of_save_exp_bs_sheet_fc เป็น  of_save_formula_fc
 
</history>
************************************************/

long		ll_index, ll_row, ll_rowmax, ll_sheetseq
string		ls_account, ls_desc, ls_operate[], ls_accupdate, ls_operate_nature
integer	li_operate, li_show, li_rc

n_ds	lds_main

lds_main		= create n_ds
lds_main.dataobject = "d_acc_set_formula_det"

if not  isnull( as_main_xml ) and trim( as_main_xml ) <> ""  then
	li_rc	= lds_main.importstring( XML!, as_main_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if


select		max( MONEYSHEET_SEQ )
into		:ll_rowmax
from 		accsheetmoneydet
where	moneysheet_code		= :as_money_code and
			coop_id					= :is_coop_id and
			FINANCE_MASSTS		= 0
using itr_sqlca ;			

if isnull( ll_rowmax ) or ll_rowmax = 0 then ll_rowmax = 2000

// delete ก่อน
delete from accsheetmoneydet
where	moneysheet_code		= :as_money_code  and
			data_group				= :as_data_group and
			coop_id					= :is_coop_id and
			FINANCE_MASSTS		= 0
using itr_sqlca ;

ll_row		= lds_main.rowcount( )

for ll_index = 1 to ll_row
	ls_account			= lds_main.object.c_account[ ll_index ]
	ls_desc				= lds_main.object.c_desc[ ll_index ]
	li_operate			= lds_main.object.operation_type[ ll_index ]
	li_show				= lds_main.object.show_status[ ll_index ]
	ll_sheetseq			= lds_main.object.moneysheet_seq[ ll_index ]
	ls_operate_nature	= lds_main.object.operate_nature[ ll_index ]
	
	if isnull( li_show ) then li_show = 0
	
	if isnull( ll_sheetseq ) or ll_sheetseq = 0 then
		ll_rowmax ++
		ll_sheetseq		= ll_rowmax
	end if
	
	INSERT INTO ACCSHEETMONEYDET  
	(	MONEYSHEET_CODE,   
		MONEYSHEET_SEQ,   
		DATA_TYPE,   
		DATA_DESC,   
		DESCRIPTION,   
		AMOUNT1,   
		AMOUNT2,   
		AMOUNT3,   
		AMOUNT4,   
		SHOW_STATUS,   
		SHOW_DET_STATUS1,   
		SHOW_DET_STATUS2,   
		SHOW_DET_STATUS3,   
		SHOW_DET_STATUS4,   
		SHOW_DET_PERCENT,   
		TOG_STATUS,   
		TOG_SEQ,   
		TOG_DESC,   
		TOG_DATA_GROUP,   
		TOG_SHOW_STATUS,   
		DATA_GROUP,   
		REMARK,   
		DOWN_LINE,   
		UP_LINE,   
		FINANCE_MASSTS,   
		OPERATION_TYPE,
		operate_nature,
		sheetcode_ref,
		sort_order,
		coop_id
		 )  
	VALUES
	(	:as_money_code,   
		:ll_sheetseq,   
		'FC',   
		:ls_account ,   
		:ls_desc ,   
		0,   
		0,   
		0,   
		0,   
		:li_show,   
		0,   
		0,   
		0,
		0,   
		0,   
		0,
		0,
		null,   
		null,
		0,   
		:as_data_group,   
		null,   
		0,   
		0,   
		0,   
		:li_operate,
		:ls_operate_nature ,
		:as_money_code,
		:ll_index,
		:is_coop_id
		
	) using itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text	= "ไม่สามารถทำรายการได้ " + sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
next

// ปรับปรุงไปยัง ลำดับที่ได้มา
ls_accupdate	= "ADD(" + string( as_data_group ) + ")"

update	ACCSHEETMONEYDET
set			data_desc					= :ls_accupdate
where	MONEYSHEET_CODE		= :as_money_code and
			MONEYSHEET_SEQ		= :as_data_group and
			coop_id						= :is_coop_id
using itr_sqlca ;

commit using itr_sqlca ;

return 1
end function

public function integer of_init_formula_sm (string as_money_sheetcode, integer an_data_group, ref string as_formular_sm_xml, ref string as_formular_sm_choose_xml);/*edit by pom   เปลี่ยนชื่อ function   
        of_get_set_formula_sm        เป็น  		  Of_init_formula_sm
 */
n_ds	lds_formular_sm, lds_formular_sm_choose

lds_formular_sm				= create n_ds
lds_formular_sm.dataobject	= "d_acc_set_formula_det_sm"
lds_formular_sm.settransobject( itr_sqlca )

lds_formular_sm_choose		= create n_ds
lds_formular_sm_choose.dataobject	= "d_acc_set_formula_det_sm_choose"
lds_formular_sm_choose.settransobject( itr_sqlca )

lds_formular_sm.retrieve( as_money_sheetcode, an_data_group ,is_coop_id)
lds_formular_sm_choose.retrieve(is_coop_id )

as_formular_sm_xml		= ""
as_formular_sm_choose_xml	= ""

if ( lds_formular_sm.rowcount() > 0 ) then
	as_formular_sm_xml	= lds_formular_sm.Describe( "Datawindow.Data.XML" )
end if

if ( lds_formular_sm_choose.rowcount() > 0 ) then
	as_formular_sm_choose_xml	= lds_formular_sm_choose.Describe( "Datawindow.Data.XML" )
end if

return 1
end function

public function integer of_save_formula_sm (string as_main_xml, string as_money_code, string as_data_group) throws Exception;/***********************************************
<description>
ทำรายการบันทึกสูตรงบการเงิน ผลรวม อ้างงบอื่น

FXREF: AC-ACCSERVICE-of_save_exp_bs_sheet_sm-0000005
</description>

<arguments>
as_main_xml		ข้อมูล XML ของรายการหลักการบันทึกสูตร
as_money_code	รหัสงบการเงิน
as_data_group		กลุ่มงบการเงิน ที่ใช้อ้างอิง
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
    30/1/2012  : เพิ่ม coop_id  by pom
	edit  
	จาก  of_save_exp_bs_sheet_sm เป็น   Of_save_formula_sm
</history>
************************************************/

long		ll_index, ll_row, ll_rowmax, ll_sheetseq
string		ls_account, ls_desc, ls_operate[], ls_accupdate, ls_operate_nature
string		ls_sheetcode_ref
integer	li_operate, li_show, li_rc

n_ds	lds_main

lds_main		= create n_ds
lds_main.dataobject = "d_acc_set_formula_det_sm"

if not  isnull( as_main_xml ) and trim( as_main_xml ) <> ""  then
	li_rc	= lds_main.importstring( XML!, as_main_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if


select		max( MONEYSHEET_SEQ )
into		:ll_rowmax
from 		accsheetmoneydet
where	moneysheet_code		= :as_money_code and
			FINANCE_MASSTS		= 0 and
			coop_id = :is_coop_id
			
using itr_sqlca ;			

if isnull( ll_rowmax ) or ll_rowmax = 0 then ll_rowmax = 2000

// delete ก่อน
delete from accsheetmoneydet
where	moneysheet_code		= :as_money_code  and
			data_group				= :as_data_group and
			FINANCE_MASSTS		= 0 and
			coop_id = :is_coop_id
using itr_sqlca ;			

ll_row		= lds_main.rowcount( )

for ll_index = 1 to ll_row
	ll_rowmax ++
	
	ls_account			= trim( lds_main.object.c_account[ ll_index ] )
	ls_desc				= trim( lds_main.object.description[ ll_index ] )
	li_operate			= lds_main.object.operation_type[ ll_index ]
	li_show				= lds_main.object.show_status[ ll_index ]
	ll_sheetseq			= lds_main.object.moneysheet_seq[ ll_index ]
	ls_operate_nature	= trim( lds_main.object.operate_nature[ ll_index ] )
	ls_sheetcode_ref	= trim( lds_main.object.sheetcode_ref[ ll_index ] )
	
	if isnull( li_show ) then li_show = 0
		
	if isnull( ll_sheetseq ) or ll_sheetseq = 0 then
		ll_rowmax ++
		ll_sheetseq		= ll_rowmax
	end if
	
	ls_operate[ll_index]	= "ADD(" +trim( ls_account ) + ")"
	
	INSERT INTO ACCSHEETMONEYDET  
	(	MONEYSHEET_CODE,   
		MONEYSHEET_SEQ,   
		DATA_TYPE,   
		DATA_DESC,   
		DESCRIPTION,   
		AMOUNT1,   
		AMOUNT2,   
		AMOUNT3,   
		AMOUNT4,   
		SHOW_STATUS,   
		SHOW_DET_STATUS1,   
		SHOW_DET_STATUS2,   
		SHOW_DET_STATUS3,   
		SHOW_DET_STATUS4,   
		SHOW_DET_PERCENT,   
		TOG_STATUS,   
		TOG_SEQ,   
		TOG_DESC,   
		TOG_DATA_GROUP,   
		TOG_SHOW_STATUS,   
		DATA_GROUP,   
		REMARK,   
		DOWN_LINE,   
		UP_LINE,   
		FINANCE_MASSTS,   
		OPERATION_TYPE,
		operate_nature,
		sheetcode_ref,
		sort_order,
		coop_id
 )  
	VALUES
	(	:as_money_code,   
		:ll_sheetseq,   
		'SM',   
		:ls_account ,   
		:ls_desc ,   
		0,   
		0,   
		0,   
		0,   
		:li_show,   
		0,   
		0,   
		0,
		0,   
		0,   
		0,
		0,
		null,   
		null,
		0,   
		:as_data_group,   
		null,   
		0,   
		0,   
		0,   
		:li_operate, 
		:ls_operate_nature,
		:ls_sheetcode_ref,
		:ll_index,
		:is_coop_id
		
	) using itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text	= "ไม่สามารถทำรายการได้ " + sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
next

// ปรับปรุงไปยัง ลำดับที่ได้มา
ls_accupdate	= "ADD(" + string( as_data_group ) + ")"

update	ACCSHEETMONEYDET
set		data_desc	= :ls_accupdate
where	MONEYSHEET_CODE		= :as_money_code and
			MONEYSHEET_SEQ		= :as_data_group and
			coop_id = :is_coop_id
using itr_sqlca ;

commit using itr_sqlca ;

return 1
end function

public function integer of_close_year (integer ai_year) throws Exception;integer	li_close, li_period, li_postvc, li_vc
datetime	ldtm_start_year, ldtm_end_year
string ls_year, ls_status, ls_flag
//ตรวจสอบสถานะข้อมูลปิดสิ้นปี  จาก  table accaccountyear
li_close	= this.of_is_closeyear( ai_year, is_coop_id ) 

if ( li_close = 1 ) then
	ithw_exception.text	= "ไม่สามารถทำการปิดสิ้นปีที่ได้ปิดไปแล้ว ได้ " 
	throw ithw_exception
end if

// หาช่วงวันที่ของปีบัญชี
this.of_get_yearange_date( ai_year , is_coop_id, ldtm_start_year, ldtm_end_year )

// ปิดงวดงานสุดท้ายรึยัง
li_period		= this.of_get_max_period( ai_year , is_coop_id )
li_close		= 0
li_close		= this.of_is_closemonth( ai_year, li_period, is_coop_id )
if ( li_close = 0 ) then
	ithw_exception.text	= "ไม่สามารถทำการปิดสิ้นปีได้ เนื่องจากยังไม่ปิดงวด สุดท้ายของปีบัญชี" 
	throw ithw_exception
end if

// ตรวจสอบว่าผ่านรายการหมดรึยัง
li_postvc	= this.of_is_postall_voucher(  ldtm_start_year, ldtm_end_year , 0, is_coop_id )
if ( li_postvc > 0 ) then
	ithw_exception.text	= "ไม่สามารถทำการปิดสิ้นปีที่ได้เนื่องจาก ยังมีรายการที่ยังไม่ผ่านไปบัญชีแยกประเภท" 
	throw ithw_exception
end if

//เช็คสถานะว่าปิดปีแบบ Gen Voucher ปิดปีรึปล่าว   0 = ไม่ GEN , 1= GEN
select  trim(accid_ignorebf)
into	:ls_flag
from accconstant
where coop_id = :is_coop_id
using itr_sqlca;

if isnull( ls_flag ) or ls_flag = "" then ls_flag = '0'

choose case ls_flag
	case '1'

////////////////////////////////เพิ่มเติมท่อนยิงรายการ voucher โอนปิดบัญชีเข้ากำไรขาดทุน ///////////////////////////////////

// สร้างใบ Voucher รายการโอนปิดบัญชี
li_vc = inv_prepare.of_gen_vc_close_year(ai_year, li_period, is_coop_id)

//ยกเลิกปิดเดือน
this.of_cancel_closemonth(ai_year, li_period)

choose case li_vc
	case -1
		this.of_close_month(ai_year, li_period)
		ithw_exception.text	= "ไม่สามารถสร้างรายการ voucher โอนปิดบัญชีเข้ากำไรขาดทุนได้" 
		throw ithw_exception
	case 1
		//ปิดเดือนใหม่เพื่อคำนวณยอดอีกครั้ง
		this.of_close_month(ai_year, li_period)
	case else
	
	//ปิดเดือนใหม่เพื่อคำนวณยอดอีกครั้ง
	this.of_close_month(ai_year, li_period)
end choose

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

case else
// ทำรายการ กำไรลงงวดบัญชีสุดท้าย
this.of_sum_foradd_profit( ai_year, is_coop_id )

end choose

// เพิ่มปีบัญชีใหม่
this.of_add_newyear( ai_year, is_coop_id, ldtm_start_year, ldtm_end_year )

// เพิ่มรายการงวดแรก ของปีบัญชีใหม่
this.of_add_first_sumleger_period( ai_year + 1, is_coop_id )

// ปรับปรุงช่วงวันที่ของปีบัญชีใหม่
this.of_add_contnext_year( ai_year, is_coop_id, 1  )

// update สถานะปิดปีบัญชี
update	accaccountyear
set			close_account_stat	= 1
where	( account_year 	= :ai_year )  and
			( coop_id		= :is_coop_id ) 
using itr_sqlca;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถบันทึกสถานะ ปิดสิ้นปีได้ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// select สถานะของการขึ้นเลขที่เอกสาร Voucher

select finstatus_code
into :ls_status
from accconstant
where coop_id = :is_coop_id
using itr_sqlca;

if( ls_status = '02' ) then  //กรณีขึ้นเลขที่เอกสารทุกสิ้นปี

ls_year = string(ai_year + 544)

//update เลขที่เอกสาร Voucher
update 	cmdocumentcontrol
set			last_documentno	= 0, 
			document_year = :ls_year
where 	( document_code like 'CMVOUCHERNO%' ) and
			( coop_id = :is_coop_id  )
using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถเคลียร์เลขที่เอกสาร Voucher ได้  " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

end if


commit using itr_sqlca ;
return 1
end function

private function decimal of_get_profit_period (integer ai_account_year, integer ai_account_period, string as_coop_id);/***********************************************
<description>
	   คำนวณกำไรสุทธิ  
</description>

    
<arguments>

	ai_year			ปี  (ค.ศ.)
	ai_period		    งวดบัญชี 
	as_coop_id      รหัสสาขาสหกรณ์ 
	
</arguments>

<return>
        decimal   ยอดกำไร(ขาดทุน)สุทธิ  
		             ค่าติดลบ  =  ขาดทุน   ต้องไปอยู่ด้าน  CR 
</return>

<usage>
	ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>
*************************************************/

dec{2}		ldc_fw_dr_rec, ldc_fw_cr_rec, ldc_fw_dr_pay, ldc_fw_cr_pay
dec{2}		ldc_pl_sumall, ldc_total_rec, ldc_total_pay

SELECT	sum(accsumledgerperiod.forward_dr_amount),   
			sum(accsumledgerperiod.forward_cr_amount)
INTO		:ldc_fw_dr_rec,   
			:ldc_fw_cr_rec
FROM		accmaster, accsumledgerperiod  
WHERE  	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
			( ( accsumledgerperiod.account_year	= :ai_account_year ) AND  
			( accsumledgerperiod.period			= :ai_account_period ) AND  
			( accmaster.account_group_id			= '4 ' ) )  and
			( accsumledgerperiod.coop_id		= :as_coop_id )  
			using itr_sqlca;

if isnull( ldc_fw_dr_rec ) then ldc_fw_dr_rec = 0.00
if isnull( ldc_fw_cr_rec ) then ldc_fw_cr_rec = 0.00

ldc_total_rec	= ldc_fw_cr_rec - ldc_fw_dr_rec

//ค่าใช้จ่าย
SELECT	sum(accsumledgerperiod.forward_dr_amount),   
			sum(accsumledgerperiod.forward_cr_amount)
INTO		:ldc_fw_dr_pay,   
			:ldc_fw_cr_pay
FROM		accmaster,   
			accsumledgerperiod  
WHERE		( accsumledgerperiod.account_id		= accmaster.account_id ) and  
			( ( accsumledgerperiod.account_year	= :ai_account_year ) AND  
			( accsumledgerperiod.period			= :ai_account_period ) AND  
			( accmaster.account_group_id			= '5 ' ) ) and
			( accsumledgerperiod.coop_id		= :as_coop_id ) using itr_sqlca;

if isnull( ldc_fw_dr_pay ) then ldc_fw_dr_pay = 0.00
if isnull( ldc_fw_cr_pay ) then ldc_fw_cr_pay = 0.00

ldc_total_pay	= ldc_fw_dr_pay - ldc_fw_cr_pay

// ยอดคงเหลือจริง
ldc_pl_sumall	= ldc_total_rec - ldc_total_pay

return ldc_pl_sumall
end function

private function string of_get_account_group (string as_account_id, string as_coop_id);string		ls_account_group_id

select		account_group_id
into		:ls_account_group_id
from		accmaster
where	account_id		= :as_account_id  and
             coop_id 			= :as_coop_id

using itr_sqlca;


ls_account_group_id	= trim( ls_account_group_id )

return ls_account_group_id
end function

public function integer of_save_money_sheet (string as_main_xml, string as_money_code, string as_coop_id) throws Exception;/***********************************************
<description>
ทำรายการบันทึกรูปแบบ ของงบการเงิน

FXREF: AC-ACCSERVICE-of_save_money_sheet-0000006
</description>

<arguments>
as_main_xml		ข้อมูล XML ของรายการหลักการบันทึกสูตร
as_money_code	รหัสงบการเงิน
as_coop_id           รหัสสหกรณ์/สาขา
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/

integer	li_rc, li_index, li_count, li_temp
integer	li_rowindex, li_rowall,li_moneysheet_seq

n_ds	lds_main

lds_main		= create n_ds
lds_main.dataobject = "d_acc_report_design_detail_set"
lds_main.settransobject( itr_sqlca )

if not  isnull( as_main_xml ) and trim( as_main_xml ) <> ""  then
	li_rc	= lds_main.importstring( XML!, as_main_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

delete from accsheetmoneydet
WHERE	( moneysheet_code = :as_money_code ) AND  
			(FINANCE_MASSTS = 1 ) and
			coop_id  = :as_coop_id
using itr_sqlca;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	= "ไม่สามารถลบข้อมูลเพื่อ บันทึกรายการรูปแบบงบการเงิน ได้ " 
	rollback using itr_sqlca;
	throw ithw_exception
end if

li_moneysheet_seq	= integer( lds_main.describe( "evaluate( 'max(  moneysheet_seq  )',0 )" ) )
if isnull( li_moneysheet_seq ) then li_moneysheet_seq = 0

li_rowall	= lds_main.rowcount( )
for li_index = 1 to li_rowall
	lds_main.Setitem( li_index, "moneysheet_code",  as_money_code )
	lds_main.Setitem( li_index, "sort_order",  li_index )
	lds_main.Setitem( li_index, "coop_id",  as_coop_id )
	
	li_temp	= 0
	li_temp	= lds_main.GetitemNumber( li_index , "moneysheet_seq" )
	if isnull( li_temp ) then li_temp = 0
	if ( li_temp = 0 ) then
		li_moneysheet_seq ++
		lds_main.Setitem( li_index, "moneysheet_seq",  li_moneysheet_seq )
	end if
next

lds_main.accepttext( )

li_rc	= lds_main.update( )
if ( li_rc = -1 ) then
	ithw_exception.text	= "ไม่สามารถบันทึกรายการรูปแบบงบการเงิน ได้ "
	ithw_exception.text	+= lds_main.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function integer of_sersrvdwxml (boolean ab_switch) throws Exception;//n_cst_dwxmlieservice

// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_dwxml ) or not isvalid( inv_dwxml ) then
		inv_dwxml	= create n_cst_dwxmlieservice	 
		return 1
	end if
else
	if isvalid( inv_dwxml ) then
		destroy inv_dwxml
		return 1
	end if
end if

return 0
end function

public function integer of_cancel_closeyear (integer ai_year) throws Exception;/***********************************************
<description>
	 ยกเลิกปิดสิ้นปีบัญชี 

</description>

<arguments>
ai_year			ปีบัญชี
ai_period			งวดที่ทำรายการ
is_coop_id		รหัสสหกรณ์+สาขา
 
</arguments>

<return>
        integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>
*******************************************************/

integer	li_year_next, li_postall, li_close, li_pvno, li_jvno, li_rvno, li_avno, li_tvno
datetime	ldtm_begin , ldtm_end, ldtm_endperiod, ldtm_start_endperiod
String		vc_pv , vc_rv, vc_av, vc_jv, vc_tv

// ตรวจสอบว่า ปีบัญชีที่ต้องการยกเลิก ต้องปิดไปแล้วเท่านั้น
li_close	= this.of_is_closeyear( ai_year, is_coop_id )
if ( li_close = 0 ) then
	ithw_exception.text	= "ไม่สามารถทำการยกเลิกการปิดสิ้นปีได้ เนื่องจากยังไม่มีการปิดสิ้นปีที่ต้องการยกเลิก" 
	throw ithw_exception
end if

li_year_next		= ai_year + 1

// ตรวจสอบว่า ปีบัญชีหลังจากนี้ ต้องยังไม่ปิดบัญชี
li_close	= this.of_is_closeyear( li_year_next, is_coop_id )
if ( li_close = 1 ) then
	ithw_exception.text	= "ไม่สามารถทำการยกเลิกการปิดสิ้นปีได้ เนื่องจากปีหลังจากนี้ได้ปิดสิ้นปีบัญชีแล้ว" 
	throw ithw_exception
end if


// วันที่ของปีบัญชีหลังจากนี้ 1 ปี
this.of_get_yearange_date( li_year_next , is_coop_id, ldtm_begin , ldtm_end )

// ตรวจสอบว่ายังมีรายการที่ยังไม่ยกเลิกแยกประเภทอยู่หรือไม่ของหลังจากนี้
li_postall		= this.of_is_postall_voucher( ldtm_begin , ldtm_end , 1, is_coop_id  )

if ( li_postall > 0 ) then
	ithw_exception.text	= "ไม่สามารถทำการยกเลิกการปิดสิ้นปีได้ ต้องยกเลิกรายการแยกประเภทของปีปัจจุบัน ก่อน" 
	throw ithw_exception
end if

DELETE FROM accsumledgerperiod	where account_year	= :li_year_next and coop_id	= :is_coop_id 
using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถทำการยกเลิกได้ can not DELETE FROM accsumledgerperiod " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

//ลบ งวดปีที่ยกเลิก
delete from accperiod where account_year	= :li_year_next and coop_id	= :is_coop_id 
using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถทำการยกเลิกได้ can not delete from accperiod " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ปรับปรุงค่าคงที่ปีบัญชี
this.of_add_contnext_year( li_year_next , is_coop_id , -1 )

//ลบ ปีบัญชีหลังจากปีที่ยกเลิก
delete from accaccountyear where account_year	= :li_year_next and coop_id	= :is_coop_id
using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถทำการยกเลิกได้ can not delete from accaccountyear " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ปรับปรุงสถานะการปิดปี
update	accaccountyear
set			close_account_stat	= 0
where 	account_year	= :ai_year and 
			coop_id		= :is_coop_id
using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถทำการยกเลิกได้ can not update	accaccountyear  " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

//update เลขที่เอกสาร
	select max(period_end_date)
	into	:ldtm_endperiod
	from	accperiod
	where	account_year = :ai_year	and
				coop_id	= :is_coop_id	
	using itr_sqlca;
	
	//วันเริ่มต้นงวดสุดท้าย
	ldtm_start_endperiod = datetime( date( year( date( ldtm_endperiod ) ), month( date( ldtm_endperiod ) ), 1  ) )
	
	//////////หาเลขที่เอกสารของปีเก่า//////////////////
	select substr(max(voucher_no),7,4)
	into	:vc_pv
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'PV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:vc_rv
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'RV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:vc_jv
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'JV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:vc_av
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'AV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:vc_tv
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'TV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	
	if isnull(vc_pv) or vc_pv = "" then vc_pv = '0'
	if isnull(vc_rv) or vc_rv = "" then vc_rv = '0'
	if isnull(vc_jv) or vc_jv = "" then vc_jv = '0'
	if isnull(vc_av) or vc_av = "" then vc_av = '0'
	if isnull(vc_tv) or vc_tv = "" then vc_tv = '0'
	
	li_pvno	= integer(vc_pv)
	li_rvno	= integer(vc_rv)
	li_jvno	= integer(vc_jv)
	li_avno	= integer(vc_av)
	li_tvno	= integer(vc_tv)
	
	
	//update เลขที่เอกสาร Voucher
update 	cmdocumentcontrol
set			last_documentno	= :li_pvno
where 	( document_code = 'CMVOUCHERNO_PV' ) and
			( coop_id = :is_coop_id  )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_rvno
where 	( document_code = 'CMVOUCHERNO_RV' ) and
			( coop_id = :is_coop_id  )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_jvno
where 	( document_code = 'CMVOUCHERNO_JV' ) and
			( coop_id = :is_coop_id  )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_avno
where 	( document_code = 'CMVOUCHERNO_AV' ) and
			( coop_id = :is_coop_id  )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_tvno
where 	( document_code = 'CMVOUCHERNO_TV' ) and
			( coop_id = :is_coop_id  )
using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถคืนเลขที่เอกสาร Voucher ได้  " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if
	
	/////////////////////////////////////////////////////////////////////////////////////
	
	
	

commit using itr_sqlca ;
return 1
end function

private function string zof_get_contuseprofit (integer ai_year, integer ai_period);n_ds	lds_data

lds_data	= create n_ds
lds_data.dataobject = "d_acc_contuseprofit"
lds_data.settransobject( itr_sqlca )

lds_data.retrieve( ai_year, ai_period  ,is_coop_id)

if ( lds_data.rowcount() > 0 ) then
	return  lds_data.Describe( "Datawindow.Data.XML" )
end if

return ""
end function

public function string of_init_contuseprofit (integer ai_year, integer ai_period);n_ds	lds_data

lds_data	= create n_ds
lds_data.dataobject = "d_acc_contuseprofit"
lds_data.settransobject( itr_sqlca )

lds_data.retrieve( ai_year, ai_period  ,is_coop_id)

if ( lds_data.rowcount() > 0 ) then
	return  lds_data.Describe( "Datawindow.Data.XML" )
end if

return ""
end function

public function string of_init_account_splitactivity (integer ai_year, integer ai_period);n_ds	lds_data

lds_data	= create n_ds
lds_data.dataobject = "d_acc_split_activity"
lds_data.settransobject( itr_sqlca )

lds_data.retrieve( ai_year, ai_period, is_coop_id  )

if ( lds_data.rowcount() > 0 ) then
	return  lds_data.Describe( "Datawindow.Data.XML" )
end if

return ""
end function

private function string zof_get_vcdetail_forset_noncash (datetime adtm_datebegin, datetime adtm_dateend, string as_account_id) throws Exception;/***********************************************
<description>
ทำรายการดึงข้อมูล รายการบัญชีรายวัน ที่ต้องการแก้ไข การนำเข้า งบกระแส

FXREF: AC-ACCSERVICE-of_get_vcdetail_forset_noncash-0000005
</description>

<arguments>
adtm_datebegin	วันที่เริ่มต้น
adtm_dateend		วันที่สิ้นสุด
as_account_id		รหัสบัญชี
</arguments>

<return>
string  ข้อมูลรายการ ในรูปแบบ XML
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/

n_ds	lds_cash_paper
string		ls_return
integer	li_row

lds_cash_paper		= create n_ds
lds_cash_paper.dataobject = "d_vc_vcedit_vcdetail_non_cahpaper"
lds_cash_paper.Settransobject( itr_sqlca )

li_row		= lds_cash_paper.retrieve( adtm_datebegin, adtm_dateend, as_account_id ,is_coop_id)
ls_return	= ""

if li_row > 0 then
	ls_return		= lds_cash_paper.Describe( "Datawindow.data.XML" )
end if

return ls_return
end function

public function integer of_save_vcset_noncash (string as_cash_detail_xml, datetime adtm_date_begin, datetime adtm_date_end, string as_account_id) throws Exception;/***********************************************
<description>
ทำรายการบันทึก การบันทึกข้อมูล ที่ไม่ต้องนำไปเข้างบกระสแเงินสด

FXREF: AC-ACCSERVICE-of_update_setnoncash_paper-0000005
</description>

<arguments>
as_cash_detail_xml		ข้อมูล XML ของรายการ บันทึก
adtm_date_begin			วันที่เริ่มต้น ข้อมูล
adtm_date_end				วันที่สิ้นสุด ข้อมูล
as_account_id				รหัสบัญชี
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/

n_ds	lds_cash_paper
string		ls_account_name, ls_account_activity
integer	li_seq_no, li_rc, li_row, li_index

lds_cash_paper		= create n_ds
lds_cash_paper.dataobject = "d_vc_vcedit_vcdetail_non_cahpaper"
lds_cash_paper.Settransobject( itr_sqlca )

if not  isnull( as_cash_detail_xml ) and trim( as_cash_detail_xml ) <> ""  then
	li_rc	= lds_cash_paper.importstring( XML!, as_cash_detail_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

delete from vcvoucherdet
where	voucher_no	in (	select voucher_no 
									from vcvoucher
									where ( voucher_date between :adtm_date_begin and :adtm_date_end  ) and
									voucher_status	= 1
								) and
			account_id			= :as_account_id 
using itr_sqlca;
			
li_rc	= lds_cash_paper.update( )
if ( li_rc = -1 ) then
	ithw_exception.text	= "ไม่สามารถบันทึกรายการ ได้ "
	ithw_exception.text	+= lds_cash_paper.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
end if

commit using itr_sqlca ;
return 1
end function

public function integer of_candel_year (integer ai_year) throws Exception;/***********************************************
<description>
	   ตรวจสอบว่า  สามารถลบงวดปีบัญชีได้หรือไม่
</description>


<arguments>

	ai_year			ปี  (คศ.) 

 
</arguments>

<return>
        integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>
*************************************************/

integer	li_count

li_count	= 0
select		count( period )
into		:li_count
from		accperiod
where	account_year	= :ai_year  and 
             coop_id 			= :is_coop_id  

using itr_sqlca ;

if isnull( li_count ) then li_count = 0

if ( li_count > 0 ) then
	ithw_exception.text	= "ไม่สามารถลบปีบัญชี ดังกล่าวได้ มีงวดบัญชี ของปีดังกล่าวอยู่"
	throw ithw_exception
end if

return 1
end function

public function integer of_candel_period (integer ai_year, integer ai_period) throws Exception;/***********************************************
<description>
	   ตรวจสอบว่า  สามารถลบงวดบัญชีได้หรือไม่
</description>


<arguments>

	ai_year			ปี  (คศ.)
	ai_period		    งวดบัญชี
 
</arguments>

<return>
        integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>
*************************************************/
integer	li_count

li_count	= 0
select		count( period )
into		:li_count
from		accsumledgerperiod
where	account_year	= :ai_year and
			period			= :ai_period and 
			coop_id			= :is_coop_id
			
using itr_sqlca ;

if isnull( li_count ) then li_count = 0

if ( li_count > 0 ) then
	ithw_exception.text	= "ไม่สามารถลบงวดบัญชี ดังกล่าวได้ มีข้อมูลสรุปประจำเดือน ของงวดดังกล่าวอยู่"
	throw ithw_exception
end if

return 1
end function

public function string of_init_vcset_noncash (datetime adtm_datebegin, datetime adtm_dateend, string as_account_id);/***********************************************
<description>
ทำรายการดึงข้อมูล รายการบัญชีรายวัน ที่ต้องการแก้ไข การนำเข้า งบกระแส

FXREF: AC-ACCSERVICE-of_get_vcdetail_forset_noncash-0000005
</description>

<arguments>
adtm_datebegin	วันที่เริ่มต้น
adtm_dateend		วันที่สิ้นสุด
as_account_id		รหัสบัญชี
</arguments>

<return>
string  ข้อมูลรายการ ในรูปแบบ XML
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/

n_ds	lds_cash_paper
string		ls_return
integer	li_row

lds_cash_paper		= create n_ds
lds_cash_paper.dataobject = "d_vc_vcedit_vcdetail_non_cahpaper"
lds_cash_paper.Settransobject( itr_sqlca )

li_row		= lds_cash_paper.retrieve( adtm_datebegin, adtm_dateend, as_account_id ,is_coop_id)
ls_return	= ""

if li_row > 0 then
	ls_return		= lds_cash_paper.Describe( "Datawindow.data.XML" )
end if

return ls_return
end function

private function string zof_get_account_splitactivity (integer ai_year, integer ai_period);n_ds	lds_data

lds_data	= create n_ds
lds_data.dataobject = "d_acc_split_activity"
lds_data.settransobject( itr_sqlca )

lds_data.retrieve( ai_year, ai_period, is_coop_id  )

if ( lds_data.rowcount() > 0 ) then
	return  lds_data.Describe( "Datawindow.Data.XML" )
end if

return ""
end function

private function integer zof_get_vc_listcancel (datetime adtm_date, string as_coop_id, ref string as_vclist_xml);/***********************************************
<description>
ทำรายการดึงข้อมูล voucher เพื่อจะทำการยกเลิก

FXREF: AC-ACCSERVICE-of_get_vc_listcancel-0000001
</description>

<arguments>
adtm_date			วันที่ที่ต้องการ ดึงข้อมูล
as_branch_id		สาขา
as_vclist_xml		รายการ ขอ้มูล ที่ส่งกลับในรูปของ XML
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/

n_ds	lds_vc_list

lds_vc_list		= create n_ds
lds_vc_list.dataobject = "d_vc_vcedit_vclist_cancel"
lds_vc_list.Settransobject( itr_sqlca )

lds_vc_list.retrieve(adtm_date,  as_coop_id )

if lds_vc_list.rowcount() > 0 then
	as_vclist_xml	= lds_vc_list.describe( "Datawindow.data.XML" )
else
	as_vclist_xml	= ""
end if

return 1
end function

private function integer zof_get_vclist_nopost (datetime adtm_begin, datetime adtm_end, integer ai_poststatus, string as_coop_id, ref string as_vclist_xml);//** Move to n_csh_voucher
  // +  of_get_vclist_nopost
n_ds	lds_vc_postlist

lds_vc_postlist		= create n_ds
lds_vc_postlist.dataobject = "d_acc_select_vc_nopost_service"
lds_vc_postlist.Settransobject( itr_sqlca )

lds_vc_postlist.retrieve(adtm_begin, adtm_end , ai_poststatus, as_coop_id )

if lds_vc_postlist.rowcount() > 0 then
	as_vclist_xml	= lds_vc_postlist.describe( "Datawindow.data.XML" )
else
	as_vclist_xml	= ""
end if


return 1
end function

private function integer zof_post_to_gl (string as_postlist_xml, string as_entry_id, string as_coop_id) throws Exception;/**************************
 Read   ผ่านรายการแยกประเภท
**************************/

n_ds	lds_vc_postlist
datetime		ldtm_date
string			ls_vcno
integer		li_index, li_row, li_rc,li_year, li_period

lds_vc_postlist		= create n_ds
lds_vc_postlist.dataobject = "d_acc_select_topost_service"

if not  isnull( as_postlist_xml ) and trim( as_postlist_xml ) <> ""  then
	li_rc	= lds_vc_postlist.importstring( XML!, as_postlist_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

li_row		= lds_vc_postlist.rowcount()

// ตรวจสอบการปิดงวดงานแล้วหรือไม่
if ( li_row > 0 ) then
	ldtm_date	= lds_vc_postlist.GetitemDatetime( 1, "voucher_date" )
	
	this.of_get_year_period( ldtm_date, as_coop_id, li_year, li_period ) // หาเพื่อ ปีและงวด บัญชี จากวันที่
	li_rc	= this.of_is_closemonth( li_year, li_period, as_coop_id )			// ตรวจสอบปิดสิ้นเดือนหรือยัง จาก   ปีและงวดบัญชี

	if ( li_rc = 1 ) then
		ithw_exception.text	= "ไม่สามารถผ่านรายการได้ เนื่องจากปิดสิ้นเดือนแล้ว "
		rollback using itr_sqlca;
		throw ithw_exception
	end if
end if
	
for li_index = 1 to li_row
	
	ls_vcno		= lds_vc_postlist.GetitemString( li_index, "voucher_no" )
	
	update 	vcvoucher
	set			posttoacc_flag	= 1,
				entry_id			= :as_entry_id
	where	voucher_no		= :ls_vcno  and
				coop_id		= :as_coop_id using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถปรับปรุงการผ่านรายการไปแยกประเภทได้ " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
next

commit using itr_sqlca;

return 1
end function

private function integer zof_update_setnoncash_paper (string as_cash_detail_xml, datetime adtm_date_begin, datetime adtm_date_end, string as_account_id) throws Exception;/***********************************************
<description>
ทำรายการบันทึก การบันทึกข้อมูล ที่ไม่ต้องนำไปเข้างบกระสแเงินสด

FXREF: AC-ACCSERVICE-of_update_setnoncash_paper-0000005
</description>

<arguments>
as_cash_detail_xml		ข้อมูล XML ของรายการ บันทึก
adtm_date_begin			วันที่เริ่มต้น ข้อมูล
adtm_date_end				วันที่สิ้นสุด ข้อมูล
as_account_id				รหัสบัญชี
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/

n_ds	lds_cash_paper
string		ls_account_name, ls_account_activity
integer	li_seq_no, li_rc, li_row, li_index

lds_cash_paper		= create n_ds
lds_cash_paper.dataobject = "d_vc_vcedit_vcdetail_non_cahpaper"
lds_cash_paper.Settransobject( itr_sqlca )

if not  isnull( as_cash_detail_xml ) and trim( as_cash_detail_xml ) <> ""  then
	li_rc	= lds_cash_paper.importstring( XML!, as_cash_detail_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

delete from vcvoucherdet
where	voucher_no	in (	select voucher_no 
									from vcvoucher
									where ( voucher_date between :adtm_date_begin and :adtm_date_end  ) and
									voucher_status	= 1
								) and
			account_id			= :as_account_id 
using itr_sqlca;
			
li_rc	= lds_cash_paper.update( )
if ( li_rc = -1 ) then
	ithw_exception.text	= "ไม่สามารถบันทึกรายการ ได้ "
	ithw_exception.text	+= lds_cash_paper.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
end if

commit using itr_sqlca ;
return 1
end function

public function integer of_save_accbegin (string as_begindata_xml, string as_coop_id) throws Exception;/***********************************************
<description>
ทำรายการบันทึกยอดยกมาประจำปี แล้วพันยอดไปยังงวดบัญชีอื่นๆ 

FXREF: AC-ACCSERVICE-of_update_accbegin-0000006
</description>

<arguments>
as_begindata_xml		ข้อมูล XML ของรายการแก้ไขยอดยกมา
as_branch_id			สาขาที่ทำรายการ
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
    30/1/2012  : เพิ่ม coop_id  by pom
</history>
************************************************/

integer	li_maxperiod, li_period
integer	li_beginyear, li_rc
n_ds		lds_data

lds_data		= create n_ds
lds_data.dataobject = "d_acc_editacc_begin"
lds_data.Settransobject( itr_sqlca )

if not  isnull( as_begindata_xml ) and trim( as_begindata_xml ) <> ""  then
	li_rc	= lds_data.importstring( XML!, as_begindata_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if


li_beginyear		= lds_data.GetitemNumber( 1 , "account_year" )
li_maxperiod	= lds_data.rowcount( )

// ทำการ บันทึก ข้อมูลที่รับมาก่อน
for li_period	= 1 to li_maxperiod
	lds_data.SetItemStatus( li_period , 0,  Primary!, DataModified!)
	lds_data.SetItemStatus( li_period , "begin_dr_amount" ,  Primary!, DataModified!)
	lds_data.SetItemStatus( li_period , "begin_cr_amount" ,  Primary!, DataModified!)
next

li_rc	= lds_data.update( )
if ( li_rc = -1 ) then
	ithw_exception.text	= "ไม่สามารถบันทึกรายการยอดยกมา ได้ "
	ithw_exception.text	+= lds_data.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

li_maxperiod	= 0

select		max( PERIOD )
into		:li_maxperiod
from		ACCSUMLEDGERPERIOD
where	ACCOUNT_YEAR	= :li_beginyear  and
			COOP_ID			= :as_coop_id 
using itr_sqlca ;			
if isnull( li_maxperiod ) then li_maxperiod = 1

for li_period	= 1 to li_maxperiod
	// update ยกไป ของงวดนี้
	update	ACCSUMLEDGERPERIOD
	set			forward_cr_amount = begin_cr_amount + cr_amount,
				forward_dr_amount = begin_dr_amount + dr_amount
	where	ACCOUNT_YEAR	= :li_beginyear  and
				PERIOD				= :li_period and
				coop_id			= :as_coop_id
	using itr_sqlca ;				
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "1. ไม่สามารถปรับปรุง ยอดยกไปได้ งวดบัญชี " + string ( li_period ) + " "+ itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	// update ยกมา ของงวดถัดไป
	if ( ( li_period + 1 ) <= li_maxperiod ) then
		// 	CR
		update	ACCSUMLEDGERPERIOD a
		set			begin_cr_amount = (	select	b.forward_cr_amount from  ACCSUMLEDGERPERIOD b
												where	a.account_id 		= b.account_id and
															a.coop_id 			= b.coop_id and
															a.posttogl_allflag	= b.posttogl_allflag and
															b.account_year		= :li_beginyear and
															b.period				= :li_period and
															b.coop_id			= :as_coop_id								
								)
		where	account_year	= :li_beginyear and
					period			= :li_period + 1 and
					coop_id		= :as_coop_id 
		using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "2. ไม่สามารถปรับปรุง ยอดยกไปได้ งวดบัญชี " + string ( li_period ) + " CR "+  itr_sqlca.sqlerrtext
			rollback using itr_sqlca ;
			throw ithw_exception
		end if
	
		// DR
		update ACCSUMLEDGERPERIOD a
		set begin_dr_amount = (	select		b.forward_dr_amount from  ACCSUMLEDGERPERIOD b
										where	a.account_id		= b.account_id and
													a.coop_id			= b.coop_id and
													a.posttogl_allflag	= b.posttogl_allflag and
													b.account_year		= :li_beginyear and
													b.period				= :li_period and
													b.coop_id			= :as_coop_id								
								)
		where	account_year	= :li_beginyear and
					period			= :li_period + 1 and
					coop_id		= :as_coop_id 
		using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "3. ไม่สามารถปรับปรุง ยอดยกไปได้ งวดบัญชี " + string ( li_period ) + " DR "+ itr_sqlca.sqlerrtext
			rollback using itr_sqlca ;
			throw ithw_exception
		end if
		
	end if

next

commit using itr_sqlca ;
return 1
end function

public function integer of_add_first_sumleger_period (integer ai_year, string as_coop_id) throws Exception;/***********************************************
<description>
ทำรายการสรุปรายการ ของงวดปีบัญชีแรก

FXREF: AC-ACCSERVICE-of_add_first_sumleger_period-0000006

</description>

<arguments>
ai_year							ปีบัญชี
as_coop_id					สาขาที่ทำรายการ
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน

</usage> 
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>
************************************************/

integer	ll_c_year,li_period,li_period_new, li_posttogl_allflag,li_count
string		ls_account_id,ls_account_group_id
dec{2}	ldc_dr_amount,ldc_cr_amount,ldc_begin_dr_amount,ldc_begin_cr_amount,ldc_forward_dr_amount,ldc_forward_cr_amount ,ldc_total


// ลบออกไป 1 เพราะได้มีการเพิ่มปีบัญชีไปแล้วก่อนหน้านี้
ll_c_year			= ai_year -1
li_period_new	= 1

li_period	= this.of_get_max_period( ll_c_year ,as_coop_id )

// ทำการเพิ่มรายการโดยอ้างจาก ผังบัญชีก่อน
declare coll_cur cursor for
select		account_id
from		accmaster
where	( trim(account_type_id)	= '3'  or
			trim(account_id) = '03'  ) and  
             (coop_id =: as_coop_id  )
using itr_sqlca; 
			
open coll_cur ;

fetch coll_cur into :ls_account_id ;

do while itr_sqlca.sqlcode = 0
	

	
	// ตรวจสอบว่า มีข้อมูลเดิมอยู่หรือไม่
	insert  into accsumledgerperiod
	(	account_year,					period,							account_id,						coop_id,						dr_amount,						
		cr_amount,						begin_dr_amount,				begin_cr_amount,				forward_dr_amount,		forward_cr_amount,			
		posttogl_allflag
	)	
	values
	(	:ai_year,							:li_period_new ,				:ls_account_id,					:as_coop_id,				0.00,								
		0.00,								0.00,								0.00,								0.00,							0.00,								
		1
	) using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถทำรายการ ยอดยกมาปีบัญชีใหม่ได้ จากผังบัญชี" + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		close coll_cur ;
		throw ithw_exception
	end if
	
	fetch coll_cur into :ls_account_id ;
loop

close coll_cur  ;

commit using itr_sqlca ;


// ดึงข้อมูล จาก รายการ ของปีที่แล้ว
declare coll_cur_add cursor for
select		account_id,			forward_dr_amount,		forward_cr_amount,
			posttogl_allflag
from		accsumledgerperiod
where	( account_year	= :ll_c_year ) and
			( period			= :li_period ) AND
			( coop_id		     = :as_coop_id )
using itr_sqlca; 
			
open coll_cur_add ;

fetch coll_cur_add into :ls_account_id, :ldc_forward_dr_amount, :ldc_forward_cr_amount, :li_posttogl_allflag ;

do while itr_sqlca.sqlcode = 0
	
	ls_account_group_id	= this.of_get_account_group( ls_account_id ,as_coop_id)
	
	if ( ls_account_group_id = '4' ) or ( ls_account_group_id = '5' ) then
		ldc_forward_cr_amount	= 0.00
		ldc_forward_dr_amount	= 0.00
	end if
	
	li_count	= 0
	li_count	= this.of_isexits_sumledger( ls_account_id , ai_year , li_period_new, as_coop_id )
	if isnull( li_count ) then li_count = 0
	
	if ( li_count = 0 ) then
		// ตรวจสอบว่า มีข้อมูลเดิมอยู่หรือไม่
		insert  into accsumledgerperiod
		(	account_year,					period,							account_id,						coop_id,								dr_amount,
			cr_amount,						begin_dr_amount,				begin_cr_amount,				forward_dr_amount,				forward_cr_amount,			
			posttogl_allflag
		)	
		values
		(	:ai_year,							:li_period_new ,				:ls_account_id,					:as_coop_id,						0.00,		
			0.00,								:ldc_forward_dr_amount,	:ldc_forward_cr_amount,	:ldc_forward_dr_amount,		:ldc_forward_cr_amount,	
			:li_posttogl_allflag
		) using itr_sqlca;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถทำรายการ เพิ่มยอดยกมาปีบัญชีใหม่ได้ " + itr_sqlca.sqlerrtext
			rollback using itr_sqlca;
			close coll_cur_add ;
			throw ithw_exception
		end if
	else
		update	accsumledgerperiod
		set			begin_dr_amount			= :ldc_forward_dr_amount,
					begin_cr_amount			= :ldc_forward_cr_amount,
					forward_dr_amount		= :ldc_forward_dr_amount,
					forward_cr_amount		= :ldc_forward_cr_amount
		where	( account_id		= :ls_account_id ) and
					( account_year	= :ai_year ) and
					( period			= :li_period_new ) AND
					( coop_id		= :as_coop_id )
		using itr_sqlca; 
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถทำรายการ ปรับปรุงยอดยกมาปีบัญชีใหม่ได้ " + itr_sqlca.sqlerrtext
			rollback using itr_sqlca;
			close coll_cur_add ;
			throw ithw_exception
		end if
		
	end if
	
	fetch coll_cur_add into :ls_account_id, :ldc_forward_dr_amount, :ldc_forward_cr_amount, :li_posttogl_allflag ;
loop

close coll_cur_add  ;

commit using itr_sqlca ;
return 1
end function

public function integer of_get_cash_bg_fw_notpost (datetime adtm_startdate, string as_coop_id, ref decimal adc_begin, ref decimal adc_forward);datetime	ldtm_enddate, ldtm_start
dec{2}	ldc_dr, ldc_cr,   ldc_begin_forward

ldtm_enddate 	= adtm_startdate
ldtm_start		= datetime( date( year( date( adtm_startdate ) ), 1, 1  ) )

// ยกมาต้นงวด
ldc_begin_forward	=	this.of_get_balance_begin( is_cash_id  , adtm_startdate  , as_coop_id  )
ldc_dr	= 0.00
ldc_cr	= 0.00

if ( date( adtm_startdate ) <> date( ldtm_start ) ) then	
	// รายการที่ยังไม่ผ่านรายการ และผ่านแล้ว
	this.of_get_sum_notpost_drcr( ldtm_start , adtm_startdate , is_cash_id , as_coop_id,   ldc_dr , ldc_cr  )  // Edit for balance by pom  

	if isnull( ldc_dr ) then ldc_dr = 0.00
	if isnull( ldc_cr ) then ldc_cr = 0.00
	
	adc_begin	= ldc_begin_forward + ( ldc_dr - ldc_cr )
	
else
	adc_begin	= ldc_begin_forward
end if

ldc_dr		= 0.00
ldc_cr		= 0.00

this.of_get_sum_between_notpost_drcr( adtm_startdate , ldtm_enddate , is_cash_id , as_coop_id,   ldc_dr , ldc_cr ) 

adc_forward	= adc_begin + (  ldc_dr - ldc_cr )

return 1
end function

public function integer of_add_contnext_year (integer ai_year, string as_coop_id, integer ai_yearadd) throws Exception;/***********************************************
<description>
ทำรายการปรับปรุงข้อมูลให้เป็นปีบัญชีถัดไป

FXREF: AC-ACCSERVICE-of_add_contnext_year-0000001
</description> 

<arguments>
ai_year				ปีบัญชี
as_coop_id			รหัสสหกรณ์+สาขา
ai_yearadd			จำนวนปีต้องการการเพิ่ม
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>
************************************************/
datetime		ldtm_date_start, ldtm_date_end

this.of_get_yearange_date( ai_year, as_coop_id, ldtm_date_start, ldtm_date_end )

ldtm_date_start	= datetime( inv_datetime.of_relativeyear( date( ldtm_date_start ) , ai_yearadd ) )
ldtm_date_end		= datetime( inv_datetime.of_relativeyear( date( ldtm_date_end ) , ai_yearadd ) )

update	accconstant  
set			beginning_of_accou	= :ldtm_date_start ,
			ending_of_account		= :ldtm_date_end,
			begin_year				= begin_year + :ai_yearadd ,
			present_account_ye	= present_account_ye + :ai_yearadd
where	coop_registered_no	= :as_coop_id 
using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับช่วงวันที่ปีบัญชี เพิ่มขึ้นได้ " + itr_sqlca.sqlerrtext 
	rollback using itr_sqlca;
	throw ithw_exception
end if

return 1
end function

public function integer of_get_budgetpay (integer ai_year, integer ai_period, string as_coop, string as_account_desc, ref decimal adc_account_real, ref decimal adc_account_period, decimal adc_budget);dec{2}	ldc_dr,ldc_cr, ldc_sumdr, ldc_sumcr, ldc_dr_period,ldc_cr_period
dec{2}	ldc_sumdr_period, ldc_sumcr_period, ldc_budget_mth
string	ls_account[], ls_accid                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
integer	li_index, li_row
datetime	ldtm_start, ldtm_end, ldtm_start_period

inv_string.of_parsetoarray( as_account_desc, ",",  ls_account )

li_row		= upperbound( ls_account )
ldc_sumdr	= 0.00
ldc_sumcr	= 0.00

ldc_sumdr_period	= 0.00
ldc_sumcr_period	= 0.00

SELECT	PERIOD_END_DATE
INTO		:ldtm_start
FROM		ACCPERIOD  
WHERE	(  ACCOUNT_YEAR	= :ai_year )
AND		(  PERIOD			= 1 )
AND		(  COOP_ID = :as_coop )
USING itr_SQLCA ;

ldtm_start	=  datetime( date( year( date( ldtm_start ) ), month( date( ldtm_start ) ), 1 ) )

SELECT	PERIOD_END_DATE
INTO		:ldtm_end
FROM		ACCPERIOD  
WHERE	(  ACCOUNT_YEAR	= :ai_year )
AND		(  PERIOD			= :ai_period ) 
AND		(  COOP_ID 			= :as_coop )
USING itr_SQLCA ;

ldtm_start_period	=  datetime( date( year( date( ldtm_end ) ), month( date( ldtm_end ) ), 1 ) )

for li_index = 1 to li_row
	ldc_dr = 0.00
	ldc_cr = 0.00
	
	 ldc_dr_period = 0.00
	 ldc_cr_period = 0.00
	 
	ls_accid	= trim( ls_account[li_index] )
	
	if ( left( ls_accid , 1 ) = '1' ) then		
		this.of_get_budget_between_dr(ldtm_start_period, ldtm_end, ls_accid, ldc_dr, as_coop)
		this.of_get_budget_between_dr(ldtm_start, ldtm_end, ls_accid, ldc_dr_period, as_coop)
	else		
		this.of_get_budget_between_drcr(ldtm_start_period, ldtm_end, ls_accid, ldc_dr, ldc_cr, 1, as_coop)
		this.of_get_budget_between_drcr(ldtm_start, ldtm_end, ls_accid, ldc_dr_period, ldc_cr_period, 1, as_coop)
	end if
	
	if isnull( ldc_dr ) then ldc_dr = 0.00
	if isnull( ldc_cr ) then ldc_cr = 0.00
	
	if isnull( ldc_dr_period ) then ldc_dr_period = 0.00
	if isnull( ldc_cr_period ) then ldc_cr_period = 0.00
	
		
	// สะสม
	ldc_sumdr	+= ldc_dr
	ldc_sumcr	+= ldc_cr
	
	ldc_sumdr_period	+= ldc_dr_period
	ldc_sumcr_period	+= ldc_cr_period
next

if itr_SQLCA.sqlcode <> 0 then
	ldc_sumdr = 0.00
	ldc_sumcr = 0.00
end if

//หาเงินงบประมาณของแต่ละงวด
ldc_budget_mth		= (adc_budget *ai_period) / 12
adc_account_real		= abs( ldc_sumdr - ldc_sumcr )
adc_account_period	= abs( ldc_sumdr_period - ldc_sumcr_period )

return 1
end function

private subroutine of_get_budget_between_dr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, string as_coopid);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt)
into		:adc_dr_amount
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
             (a.coop_id = b.coop_id)  and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( a.coop_id 	= :as_coopid) and
			( a.voucher_status  = 1 ) and
			( b.account_id		= :as_account_id)  using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00

return
end subroutine

private subroutine of_get_budget_between_drcr (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, integer ai_flag, string as_coopid);//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
			( a.coop_id = b.coop_id) and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	<= :adtm_enddate ) and
			( b.account_id		= :as_account_id) and
			( b.posttogl_flag	= 1) and
			( a.coop_id  =:  as_coopid) and   
			( a.voucher_status	= 1 )  using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

public function integer of_process_budget (string as_coopid, integer ai_year, integer ai_period) throws Exception;integer 	li_seq_no 
string		ls_grouptyp , ls_account_desc, ls_account_name, ls_accrcvpay, ls_branch
dec{2}	ldc_budget , ldc_account_real, ldc_account_period, ldc_estimate
Long		ll_ID, ll_BudgetId

// ลบข้อมูลเดิมออกก่อน ครับ
delete from accperiodsumbudget
where	account_year	= :ai_year 
and		period		= :ai_period
and		coop_id		= :as_coopid
using itr_sqlca ;
			
if itr_SQLCA.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถล้างข้อมูลเดิมได้ " + itr_sqlca.sqlerrtext
	rollback USING itr_SQLCA ;
	throw ithw_exception
end if

declare coll_cur cursor for
select	accbudget.account_budget,
		accbudget.accbudgetgroup_typ,
		accbudget.account_id_list,
		accbudget.budget_detail,
//		accbudget.budget_id,
		accbudget.accrcvpay
from 	accbudget
where	( accbudget.account_year	= :ai_year)
and		( accbudget.coop_id		= :as_coopid) 
USING itr_SQLCA ;

open coll_cur ;
fetch coll_cur into :ldc_budget, :ls_grouptyp,:ls_account_desc , :ls_account_name, :ls_accrcvpay ;

li_seq_no	= 0

do while itr_sqlca.sqlcode = 0
	ls_grouptyp	= trim( ls_grouptyp )
	ls_account_desc = trim(ls_account_desc)
	
	this.of_get_budgetpay( ai_year , ai_period , as_coopid ,  ls_account_desc, ldc_account_real, ldc_account_period, ldc_budget )
	
	ls_account_name	= trim(ls_account_name)
	ls_accrcvpay		= trim( ls_accrcvpay )
	ldc_estimate		= (ldc_budget /12) * ai_period
	
//	ll_ID	= 0
//	ll_ID	= THIS.of_get_sequence_pk( "ACCPERIODSUMBUDGET_SEQ" )
//	
	li_seq_no ++
	
	INSERT INTO ACCPERIODSUMBUDGET  
	(	COOP_ID,						ACCOUNT_YEAR,						PERIOD,
		ACCRCVPAY,   					SEQ_NO,									ACCOUNT_BUDGET,
		ACCBUDGETGROUP_TYP,   	ACCOUNT_DESC,						ACCOUNT_REAL,
		BUDGET_PERIODAMT,		REMARK,									ACCOUNT_ESTIMATE
	)  
	VALUES
	( 	:as_coopid,   					:ai_year,									:ai_period,
		:ls_accrcvpay,					:li_seq_no,								:ldc_budget,							
		:ls_grouptyp,					:ls_account_name,					:ldc_account_period,
		:ldc_account_real,				null,										:ldc_estimate					
	) USING itr_SQLCA ;


	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลการประมวลงบประมาณได้  " + itr_sqlca.sqlerrtext
		rollback USING itr_SQLCA ;
		close coll_cur ;
		throw ithw_exception
	end if

	 fetch coll_cur into :ldc_budget, :ls_grouptyp,:ls_account_desc , :ls_account_name, :ls_accrcvpay ;
loop

close coll_cur ;

if itr_SQLCA.sqlcode = 0 then
	commit USING itr_SQLCA ;
end if


return 1
end function

public function integer of_set_budget (string as_xml, string as_coopid, integer an_year, string as_budget_type) throws Exception;n_ds		lds_data
Integer	li_rc
Long		ll_index, ll_row, ll_ID
String		ls_Group, ls_AccList, ls_Detail, ls_accrcvpay
Dec		ldc_BudgetAmt	
	
lds_data		= create n_ds
lds_data.dataobject = "d_acc_set_budget"

//if not  isnull( as_xml ) and trim( as_xml ) <> ""  then
//	li_rc	= inv_dwxml.of_xmlimport(lds_data, as_xml )
//else
//	ithw_exception.text		= "ไม่มีข้อมูลการตั้งงบประมาณ กรุณาตรวจสอบ"
//	throw ithw_exception
//end if
if not  isnull( as_xml ) and trim( as_xml ) <> ""  then
	li_rc	= lds_data.importstring(XML!,  as_xml )
		if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if


ll_row		= lds_data.rowcount( )

IF IsNull( ll_row ) or ( ll_row < 1 ) THEN 
	ithw_exception.text		= "ไม่มีแถวข้อมูล กรุณาตรวจสอบ"
	throw ithw_exception
END IF

// delete ก่อน
delete from ACCBUDGET a
where	ACCOUNT_YEAR			= :an_year  and
			COOP_ID						= :as_coopid and
			ACCRCVPAY					= :as_budget_type
using itr_sqlca ;

String		ls_SuperGrp, ls_BudgetType
Integer	li_BudgetLevel, li_SortSeq

for ll_index = 1 to ll_row
//	ll_ID		= 0
//	ll_ID		= lds_data.object.budget_id[ ll_index ]
	
//	IF IsNull( ll_ID ) THEN ll_ID = 0
//	
//	IF ( ll_ID = 0 ) THEN
//		ll_ID	= THIS.of_get_sequence_pk( "ACCBUDGET_SEQ" )
//	END IF
	
	ls_Group				= lds_data.object.ACCBUDGETGROUP_TYP[ll_index]
	ldc_BudgetAmt		= lds_data.object.ACCOUNT_BUDGET[ ll_index ]
	ls_AccList			= lds_data.object.ACCOUNT_ID_LIST[ ll_index ]
	ls_Detail				= lds_data.object.BUDGET_DETAIL[ ll_index ]
	
	ls_SuperGrp			= lds_data.object.BUDGET_SUPERGRP[ ll_index ]
	ls_BudgetType		= lds_data.object.BUDGET_TYPE[ ll_index ]
	li_BudgetLevel		= lds_data.object.BUDGET_LEVEL[ ll_index ]
	ls_accrcvpay		= lds_data.object.ACCRCVPAY[ ll_index ]
	li_SortSeq			= ll_index  * 10

	INSERT INTO ACCBUDGET  
	(	  
		  COOP_ID,   
           ACCOUNT_YEAR,   
           ACCOUNT_BUDGET,   
           ACCOUNT_ID_LIST,   
           BUDGET_DETAIL,   
           BUDGET_SUPERGRP,   
           BUDGET_TYPE,   
           BUDGET_LEVEL,   
           ACCBUDGETGROUP_TYP,   
           SORT_SEQ,   
           ACCRCVPAY
	)  
	VALUES
	(	  
		:as_coopid,
		:an_year,
		:ldc_BudgetAmt,
		:ls_AccList,
		:ls_Detail,   
		:ls_SuperGrp,
		:ls_BudgetType,
		:li_BudgetLevel,
		:ls_Group,
		:li_SortSeq,
		:ls_accrcvpay

	)  using itr_sqlca ;
	
	IF ( itr_sqlca.SQLCode <> 0 ) THEN
		ithw_Exception.text	= 'มีปัญหาในการบันทึกรายการตั้งงบประมาณ ' + itr_sqlca.SqlErrText
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
next

commit USING itr_SQLCA ;

return 1
end function

private function string of_get_acctrnpay_no (datetime adtm_date, ref string as_paytrn_no, string as_coopid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการโอนรับชำระ  สร้างเลขที่เอกสาร
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  throwable = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 04/02/2014 by Mike
</usage> 
***********************************************************/

string				ls_column, ls_year, ls_date, ls_month, ls_docno
integer			li_year, li_fount
datetime			ldtm_operate

ls_column		= "ACCTRNPAY"
ls_docno			= inv_docservice.of_getnewdocno( as_coopid ,ls_column )

ldtm_operate		= adtm_date
ls_date				= string(date(ldtm_operate),'dd')
ls_month				= string(date(ldtm_operate),'mm')
ls_year				= string(date(ldtm_operate),'yyyy')
li_year				= integer(ls_year)+543
ls_year				= RightA(string(li_year),2)
as_paytrn_no		= "AC" + ls_year+ ls_month + rightA( ls_docno, 4 )
li_fount				= 0

// ตรวจสอบดูว่ามีข้อมูลใน DB หรือยัง
select		count( * )
into		:li_fount
from		accpaytrnbank
where	coop_id			= :as_coopid  and  
			paytrnbank_docno		= :as_paytrn_no 
using itr_sqlca ;

if isnull( li_fount ) then li_fount = 0

if ( li_fount > 0 ) then
	this.of_get_acctrnpay_no( adtm_date  , as_paytrn_no ,as_coopid   )
end if


return as_paytrn_no
end function

public function integer of_gen_data_paytrnbank (string as_head_xml, string as_share_xml, string as_loan_xml, string as_etc_xml) throws Exception;integer  	li_rc, li_status, li_seq, li_seqno, li_operate_flag, li_shrlontype, li_paytrn_flag, li_color
string 	ls_coopid, ls_paytrnbank_no, ls_paytype_code, ls_memno, ls_memgroup, ls_bankbranch
string		ls_payitemtype, ls_shrlontype, ls_loancontract, ls_paydesc
datetime ldtm_trndate , ldtm_docdate
dec{2}  	ldc_paytrn, ldc_period_amt, ldc_moneytrn
long		ll_share_index, ll_rowshare, ll_rowloan, ll_loan_index, ll_rowetc, ll_etc_index

n_ds	lds_acc_paytrnbank, lds_share, lds_loan, lds_etc

li_seq = 0

lds_acc_paytrnbank		= create n_ds
lds_acc_paytrnbank.dataobject = "d_ac_bktrnpayedit_new"

if not  isnull( as_head_xml ) and trim( as_head_xml ) <> ""  then
	li_rc	= lds_acc_paytrnbank.importstring( XML!, as_head_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

ldtm_docdate 			= lds_acc_paytrnbank.object.doc_date[ 1 ];  //วันที่บันทึก
ls_coopid 				= lds_acc_paytrnbank.object.coop_id[ 1 ];
ldtm_trndate 			= lds_acc_paytrnbank.object.trn_date[ 1 ];  //วันที่โอนรับชำระ
ls_paytype_code 		= lds_acc_paytrnbank.object.paytrntype_code[ 1 ]; //ประเภทการชำระ
ls_memno				= lds_acc_paytrnbank.object.member_no[ 1 ]; 
ls_memgroup			= lds_acc_paytrnbank.object.membgroup_code[ 1 ]; 
ldc_paytrn				= lds_acc_paytrnbank.object.paytrnbank_amt[ 1 ]; //ยอดรับชำระ
li_status					= 8   //สถานะรอรับชำระ
ls_paytrnbank_no		= lds_acc_paytrnbank.object.paytrnbank_docno[ 1 ]; //เลขเอกสาร

if isnull(ls_paytrnbank_no) or ls_paytrnbank_no = 'Auto' or ls_paytrnbank_no = ""  then //กรณีสร้างใหม่
	ls_paytrnbank_no  = this.of_get_acctrnpay_no( ldtm_docdate , ls_paytrnbank_no, ls_coopid) // หาเลขที่เอกสาร
else //กรณีแก้ไข
	// ลบข้อมูลเดิมออกก่อน ครับ
		delete from accpaytrnbankdet
		where	paytrnbank_docno	= :ls_paytrnbank_no 
		using itr_sqlca ;
		
		delete from accpaytrnbank
		where	paytrnbank_docno	= :ls_paytrnbank_no 
		using itr_sqlca ;
end if

  INSERT INTO ACCPAYTRNBANK
     ( 	  COOP_ID,   		           	PAYTRNBANK_DOCNO,              	PAYTRNTYPE_CODE,   
           MEMBER_NO,   	         	MEMBGROUP_CODE,   		        	TRN_DATE,   
           DOC_DATE,   		           	PAYTRNBANK_AMT,   		        		PAYTRNBANK_STATUS
	)  
  VALUES
	( 	:ls_coopid,   					:ls_paytrnbank_no,					:ls_paytype_code,
		:ls_memno,						:ls_memgroup,							:ldtm_trndate,							
		:ldtm_docdate,					:ldc_paytrn,								:li_status
	) USING itr_SQLCA ;
	
	if itr_SQLCA.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลการโอนรับชำระหนี้ได้  " + itr_SQLCA.sqlerrtext
		rollback USING itr_SQLCA ;
		throw ithw_exception
	end if
	
	////////////////////////////////////////////////////ท่อน Insert Detail////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////ท่อน รับชำระค่าหุ้น////////////////////////////////////////////////////////////
	lds_share		= create n_ds
	lds_share.dataobject = "d_ac_bktrnpayedit_detshare"     //รับชำระค่าหุ้น

	if not  isnull( as_share_xml ) and trim( as_share_xml ) <> ""  then
		li_rc	= lds_share.importstring( XML!, as_share_xml )
		if ( li_rc < 0 ) then
			ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
			throw ithw_exception
		end if
	end if
	
	ll_rowshare				= lds_share.rowcount()
				
	if(ll_rowshare > 0) then	
	for ll_share_index = 1 to ll_rowshare 
			
	ls_payitemtype		= lds_share.object.paytrnitemtype_code[ ll_share_index ];
	li_operate_flag		= lds_share.object.operate_flag[ ll_share_index ];
	ls_shrlontype		= lds_share.object.shrlontype_code[ ll_share_index ];
	ls_loancontract		= ""
	ls_paydesc			= "ซื้อหุ้น"
	ldc_period_amt		= 0
	ldc_moneytrn		= lds_share.object.moneytrn_amt[ ll_share_index ];
	li_shrlontype		= 1
	li_paytrn_flag		= 8
	ls_bankbranch		= lds_share.object.bank_branch[ ll_share_index ];
	li_color				= lds_share.object.color_status[ ll_share_index ];
	
	if isnull(ls_shrlontype) then ls_shrlontype = ""
	
	if(li_operate_flag = 1) then
		li_seq++
		
		  INSERT INTO ACCPAYTRNBANKDET
         ( COOP_ID,   	           		PAYTRNBANK_DOCNO,             PAYTRNITEMTYPE_CODE,   
           SEQ_NO,   	           		OPERATE_FLAG,   			        	SHRLONTYPE_CODE,   
           LOANCONTRACT_NO,       PAYTRNBANK_DESC,   	         PERIOD_AMT,   
           MONEYTRN_AMT,            SHRLON_TYPE,   			         PAYTRNOPERATE_FLAG ,
		  BANK_BRANCH,				COLOR_STATUS
		)  
		VALUES 
  		( :ls_coopid,   					:ls_paytrnbank_no,				:ls_payitemtype,
		  :li_seq,							:li_operate_flag,					:ls_shrlontype,
		  :ls_loancontract,				:ls_paydesc,							:ldc_period_amt,
		  :ldc_moneytrn,				:li_shrlontype,						:li_paytrn_flag,
  		  :ls_bankbranch,				:li_color
  		)  USING itr_SQLCA ;
		  
	if itr_SQLCA.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลการโอนรับชำระค่าหุ้นได้  " + itr_SQLCA.sqlerrtext
		rollback USING itr_SQLCA ;
		throw ithw_exception
	end if
end if
	next
end if

	////////////////////////////////////////////////////ท่อนรับชำระค่าหนี้///////////////////////////////////////////////////////////
	lds_loan		= create n_ds
	lds_loan.dataobject = "d_ac_bktrnpayedit_detloan"     //รับชำระหนี้

	if not  isnull( as_loan_xml ) and trim( as_loan_xml ) <> ""  then
		li_rc	= lds_loan.importstring( XML!, as_loan_xml )
		if ( li_rc < 0 ) then
			ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
			throw ithw_exception
		end if
	end if
	
	ll_rowloan				= lds_loan.rowcount()
	
	if( ll_rowloan > 0) then
	for ll_loan_index = 1 to ll_rowloan 
		
		
	ls_payitemtype		= lds_loan.object.paytrnitemtype_code[ ll_loan_index ];
	li_operate_flag		= lds_loan.object.operate_flag[ ll_loan_index ];
	ls_shrlontype		= lds_loan.object.shrlontype_code[ ll_loan_index ];
	ls_loancontract		= lds_loan.object.loancontract_no[ ll_loan_index ];   
	ls_paydesc			= ls_loancontract
	ldc_period_amt		= 0
	ldc_moneytrn		= lds_loan.object.moneytrn_amt[ ll_loan_index ];
	li_shrlontype		= 1
	li_paytrn_flag		= 8
	ls_bankbranch		= lds_loan.object.bank_branch[ ll_loan_index ];
	li_color				= lds_loan.object.color_status[ ll_loan_index ];
	
	if isnull(ls_shrlontype) then ls_shrlontype = ""
	
	if(li_operate_flag = 1) then
		li_seq++
		
		  INSERT INTO ACCPAYTRNBANKDET
         ( COOP_ID,   	           		PAYTRNBANK_DOCNO,             PAYTRNITEMTYPE_CODE,   
           SEQ_NO,   	           		OPERATE_FLAG,   			        	SHRLONTYPE_CODE,   
           LOANCONTRACT_NO,       PAYTRNBANK_DESC,   	         PERIOD_AMT,   
           MONEYTRN_AMT,            SHRLON_TYPE,   			         PAYTRNOPERATE_FLAG,
		  BANK_BRANCH,				COLOR_STATUS
		)  
  		VALUES 
  		( :ls_coopid,   					:ls_paytrnbank_no,				:ls_payitemtype,
		  :li_seq,							:li_operate_flag,					:ls_shrlontype,
		  :ls_loancontract,				:ls_paydesc,							:ldc_period_amt,
		  :ldc_moneytrn,				:li_shrlontype,						:li_paytrn_flag,
  		  :ls_bankbranch,				:li_color
  
  		)  USING itr_SQLCA ;
		  
	if itr_SQLCA.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลการโอนรับชำระค่าหนี้ได้  " + itr_SQLCA.sqlerrtext
		rollback USING itr_SQLCA ;
		throw ithw_exception
	end if
end if
		
	next
end if
	
	////////////////////////////////////////////////////ท่อนรับชำระค่าอื่นๆ////////////////////////////////////////////////////////////
	lds_etc		= create n_ds
	lds_etc.dataobject = "d_ac_bktrnpayedit_detetc"     //รับชำระอื่นๆ

	if not  isnull( as_etc_xml ) and trim( as_etc_xml ) <> ""  then
		li_rc	= lds_etc.importstring( XML!, as_etc_xml )
		if ( li_rc < 0 ) then
			ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
			throw ithw_exception
		end if
	end if
	
	ll_rowetc				= lds_etc.rowcount()
	
	if( ll_rowetc > 0) then
	for ll_etc_index = 1 to ll_rowetc 
	
		
	ls_payitemtype		= lds_etc.object.paytrnitemtype_code[ ll_etc_index ];
	li_operate_flag		= lds_etc.object.operate_flag[ ll_etc_index ];
	ls_shrlontype		= lds_etc.object.shrlontype_code[ ll_etc_index ];
	ls_loancontract		= ""
	ls_paydesc			= lds_etc.object.paytrnbank_desc[ ll_etc_index ];
	ldc_period_amt		= 0
	ldc_moneytrn		= lds_etc.object.moneytrn_amt[ ll_etc_index ];
	li_shrlontype		= 1
	li_paytrn_flag		= 8
	ls_bankbranch		= lds_etc.object.bank_branch[ ll_etc_index ];
	li_color				= lds_etc.object.color_status[ ll_etc_index ];
	
	if isnull(ls_shrlontype) then ls_shrlontype = ""
	
	if(li_operate_flag = 1) then
		li_seq++
		
		  INSERT INTO ACCPAYTRNBANKDET
         ( COOP_ID,   	           		PAYTRNBANK_DOCNO,             PAYTRNITEMTYPE_CODE,   
           SEQ_NO,   	           		OPERATE_FLAG,   			        	SHRLONTYPE_CODE,   
           LOANCONTRACT_NO,       PAYTRNBANK_DESC,   	         PERIOD_AMT,   
           MONEYTRN_AMT,            SHRLON_TYPE,   			         PAYTRNOPERATE_FLAG,
		  BANK_BRANCH,				COLOR_STATUS
		)  
  		VALUES 
  		( :ls_coopid,   					:ls_paytrnbank_no,				:ls_payitemtype,
		  :li_seq,							:li_operate_flag,					:ls_shrlontype,
		  :ls_loancontract,				:ls_paydesc,							:ldc_period_amt,
		  :ldc_moneytrn,				:li_shrlontype,						:li_paytrn_flag,
  		  :ls_bankbranch,				:li_color
  
  		)  USING itr_SQLCA ;
		  
	if itr_SQLCA.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลการโอนรับชำระรายการต่างๆได้  " + itr_SQLCA.sqlerrtext
		rollback USING itr_SQLCA ;
		throw ithw_exception
	end if
end if
		
	next
end if
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	if itr_SQLCA.sqlcode = 0 then
		commit USING itr_SQLCA ;
	end if



return 1
end function

public function integer of_add_accyear (string as_year_xml) throws Exception;integer	li_rc , li_year, li_index, li_close_status, li_accyear
long		ll_row
datetime		ldtm_begin_date , ldmt_end_date
string		ls_coopid

n_ds ldc_acc_year

ldc_acc_year		= create n_ds
ldc_acc_year.dataobject = "d_acc_start_accyear"

if not  isnull( as_year_xml ) and trim( as_year_xml ) <> ""  then
	li_rc	= ldc_acc_year.importstring( XML!, as_year_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

ll_row		=  ldc_acc_year.rowcount()

for	li_index = 1 to ll_row 

li_year		= ldc_acc_year.object.account_year[ li_index ];
ldtm_begin_date	=	ldc_acc_year.object.begin[ li_index ];
ldmt_end_date		=	ldc_acc_year.object.end_y[ li_index ];
li_close_status		=	ldc_acc_year.object.close_account_stat[ li_index ];
ls_coopid				=  ldc_acc_year.object.coop_id[ li_index ];

li_accyear = 0

select account_year
into	:li_accyear
from accaccountyear
where account_year = :li_year
using itr_sqlca;

if ( li_accyear <= 0 ) then   //เช็คว่ามีข้อมูลในเบสแล้วรึยัง
	
	INSERT INTO ACCACCOUNTYEAR
         ( COOP_ID,   	           		ACCOUNT_YEAR,             		BEGINNING_OF_ACCOU,   
		  ENDING_OF_ACCOUNT,		CLOSE_ACCOUNT_STAT
		)  
  		VALUES 
  		( :ls_coopid,   					:li_year,				:ldtm_begin_date,
		  :ldmt_end_date,				:li_close_status
  		)  USING itr_SQLCA ;
		  
	if itr_SQLCA.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลปีบัญชีได้  " + itr_SQLCA.sqlerrtext
		rollback USING itr_SQLCA ;
		throw ithw_exception
	end if
	
else
  	UPDATE ACCACCOUNTYEAR  
     SET COOP_ID = :ls_coopid,   
         ACCOUNT_YEAR = :li_year,   
         BEGINNING_OF_ACCOU = :ldtm_begin_date,   
         ENDING_OF_ACCOUNT = :ldmt_end_date,   
         CLOSE_ACCOUNT_STAT = :li_close_status 
	WHERE	ACCOUNT_YEAR	= :li_year
	 USING itr_SQLCA ;
	 
	 if itr_SQLCA.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถอัพเดทข้อมูลปีบัญชีได้  " + itr_SQLCA.sqlerrtext
		rollback USING itr_SQLCA ;
		throw ithw_exception
	end if
end if

next
return 1
end function

public function integer of_add_accperiod (integer ai_year, string as_accperiod_xml) throws Exception;integer	li_rc , li_row, li_period, li_index, li_year_prev, li_period_prev, li_flag, li_accperiod
string		ls_coopid
datetime	ldtm_end

n_ds ldc_acc_period

ldc_acc_period		= create n_ds
ldc_acc_period.dataobject = "d_acc_period"

if not  isnull( as_accperiod_xml ) and trim( as_accperiod_xml ) <> ""  then
	li_rc	= ldc_acc_period.importstring( XML!, as_accperiod_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

li_row		=  ldc_acc_period.rowcount()

for	li_index = 1 to li_row 
	
	ls_coopid				= ldc_acc_period.object.coop_id[ li_index ];
	li_period				= ldc_acc_period.object.period[ li_index ];
	ldtm_end				= ldc_acc_period.object.period_end[ li_index ];
	li_year_prev			= ldc_acc_period.object.account_year_prev[ li_index ];
	li_period_prev		= ldc_acc_period.object.period_prev[ li_index ];
	li_flag					= ldc_acc_period.object.close_flag[ li_index ];
	
	li_accperiod = 0
	
select period
into	:li_accperiod
from accperiod
where account_year = :ai_year  and
		period		= :li_period and
		coop_id		= :ls_coopid
using itr_sqlca;
	
	if ( li_accperiod <= 0 ) then   //เช็คว่ามีข้อมูลในเบสแล้วรึยัง
	
	  INSERT INTO ACCPERIOD  
         ( COOP_ID,              					ACCOUNT_YEAR,             			PERIOD,   
           PERIOD_END_DATE,              		ACCOUNT_YEAR_PREV,             	PERIOD_PREV,   
           CLOSE_FLAG,              				BRANCH_ID
		)  
  VALUES 
  		( :ls_coopid,   				           	:ai_year,   						         :li_period,   
           :ldtm_end,   					         :li_year_prev,   				         :li_period_prev,   
           :li_flag,   						          null )  USING itr_SQLCA;
	
		  
	if itr_SQLCA.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลงวดบัญชีได้  " + itr_SQLCA.sqlerrtext
		rollback USING itr_SQLCA ;
		throw ithw_exception
	end if
	
else
	
  UPDATE ACCPERIOD  
     SET COOP_ID = :ls_coopid,   
         ACCOUNT_YEAR = :ai_year,   
         PERIOD = :li_period,   
         PERIOD_END_DATE = :ldtm_end,   
         ACCOUNT_YEAR_PREV = :li_year_prev,   
         PERIOD_PREV = :li_period_prev,   
         CLOSE_FLAG = :li_flag,   
         BRANCH_ID = null  
	WHERE	COOP_ID = :ls_coopid  and
				ACCOUNT_YEAR	=	:ai_year	and
				PERIOD			=	:li_period

	 USING itr_SQLCA ;
	 
	 if itr_SQLCA.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถอัพเดทข้อมูลปีบัญชีได้  " + itr_SQLCA.sqlerrtext
		rollback USING itr_SQLCA ;
		throw ithw_exception
	end if
end if

	
	
next

return 1
end function

public function integer of_cancel_closemonth_clear_vcno (integer ai_year, integer ai_period) throws Exception;/***********************************************
<description>
	 ยกเลิกปิดสิ้นเดือน


</description>

<arguments>
ai_year			ปีบัญชี
ai_period			งวดที่ทำรายการ 
 
</arguments>

<return>
        integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom   เพิ่มการใช้ coop_id
</history>
*******************************************************/

integer	li_row, li_count, li_index, li_close, li_pvno, li_rvno, li_jvno, li_avno, li_tvno
dec{2}	ldc_begin, ldc_begin_dr, ldc_begin_cr
datetime	ldtm_begin, ldtm_end, ldtm_endperiod, ldtm_start_endperiod
string		ls_pvno, ls_rvno, ls_jvno, ls_avno, ls_tvno

// ปิดสิ้นปีหรือยัง
li_close	= 0
li_close	= this.of_is_closeyear( ai_year,  is_coop_id )
if ( li_close = 1 ) then
	ithw_exception.text	= "ยกเลิกได้เฉพาะปีบัญชีที่ยังไม่มีการปิดสิ้นปีเท่านั้น กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ปิดสิ้นเดือนหรือยัง
li_close	= 0
li_close	= this.of_is_closemonth( ai_year, ai_period, is_coop_id )
if ( li_close = 0 ) then
	ithw_exception.text	= "ยกเลิกได้เฉพาะงวดล่าที่ปิดสิ้นเดือนแล้วเท่านั้น กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// มีงวดอื่นที่ มากกว่างวดนี้หรือไม่ ที่ได้ปิดไปแล้ว
select count(period)
into	:li_row
from	accperiod
where ( account_year 	= :ai_year ) and
		( period				> :ai_period ) and
		( close_flag			= 1) and
		( coop_id			= :is_coop_id ) using itr_sqlca;
		
if li_row > 0 then
	ithw_exception.text	= "ยกเลิกได้เฉพาะงวดล่าสุดเท่านั้น กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

if ai_period = 1 then 	
	update	accsumledgerperiod
	set			dr_amount		= 0 ,
				cr_amount		= 0,
				forward_dr_amount	= begin_dr_amount,
				forward_cr_amount	= begin_cr_amount
	where	account_year		= :ai_year and
				period				= 1 and
				coop_id				= :is_coop_id using itr_sqlca;
			
else
	delete accsumledgerperiod 
	where account_year	= :ai_year and
			period 		  	= :ai_period  and
			coop_id			= :is_coop_id using itr_sqlca;
end if

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปิดสิ้นเดือนได้ กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

//**************update สถานะเป็นยังไม่ปิดงวด
update	accperiod
set			close_flag	= 0
where	( account_year 	= :ai_year )  and
			( period			= :ai_period ) and
			( coop_id		= :is_coop_id ) using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงสถานะ ปิดสิ้นเดือนได้ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
end if

//update เลขที่เอกสาร
	select max(period_end_date)
	into	:ldtm_endperiod
	from	accperiod
	where	account_year = :ai_year	and
				period	       = :ai_period	and
				coop_id	= :is_coop_id	
	using itr_sqlca;
	
	//วันเริ่มต้นงวดสุดท้าย
	ldtm_start_endperiod = datetime( date( year( date( ldtm_endperiod ) ), month( date( ldtm_endperiod ) ), 1  ) )
	
	//////////หาเลขที่เอกสารของปีเก่า//////////////////
	select substr(max(voucher_no),7,4)
	into	:ls_pvno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'PV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:ls_rvno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'RV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:ls_jvno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'JV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:ls_avno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'AV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:ls_tvno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'TV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	

	
	if isnull(ls_pvno) or ls_pvno = "" then ls_pvno = '0'
	if isnull(ls_rvno) or ls_rvno = "" then ls_rvno = '0'
	if isnull(ls_jvno) or ls_jvno = "" then ls_jvno = '0'
	if isnull(ls_avno) or ls_avno = "" then ls_avno = '0'
	if isnull(ls_tvno) or ls_tvno = "" then ls_tvno = '0'

	
	li_pvno	= integer(ls_pvno)
	li_rvno	= integer(ls_rvno)
	li_jvno	= integer(ls_jvno)
	li_avno	= integer(ls_avno)
	li_tvno	= integer(ls_tvno)
	
	
	//update เลขที่เอกสาร Voucher
update 	cmdocumentcontrol
set			last_documentno	= :li_pvno
where 	( document_code = 'CMVOUCHERNO_PV' ) and
			( coop_id			= :is_coop_id	  )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_rvno
where 	( document_code = 'CMVOUCHERNO_RV' ) and
			( coop_id			= :is_coop_id	  )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_jvno
where 	( document_code = 'CMVOUCHERNO_JV' ) and
			( coop_id			= :is_coop_id	 )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_avno
where 	( document_code = 'CMVOUCHERNO_AV' ) and
			( coop_id			= :is_coop_id	 )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_tvno
where 	( document_code = 'CMVOUCHERNO_TV' ) and
			( coop_id			= :is_coop_id	 )
using itr_sqlca;


if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถคืนเลขที่เอกสาร Voucher ได้  " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if
	
	/////////////////////////////////////////////////////////////////////////////////////


commit using itr_sqlca;

return 1
end function

public function integer of_close_month_clear_vcno (integer ai_year, integer ai_period) throws Exception;/***********************************************
<description>
	   ปิดสิ้นเดือน
</description>


<arguments>

	ai_year			ปี  (ค.ศ.)
	ai_period		    งวดบัญชี 
 
</arguments>

<return>
        integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
	ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>
*************************************************/


integer	li_count, li_index, li_row, li_rc, li_close
integer li_pvno, li_rvno, li_jvno, li_year, li_period, li_avno, li_tvno
datetime	ldtm_begin, ldtm_end, ldtm_endperiod, ldtm_start_endperiod
string		ls_accid
dec{2}	ldc_dr, ldc_cr 
string		ls_pvno, ls_rvno, ls_jvno, ls_avno, ls_tvno
n_ds	lds_check

// ใช่งวดล่าสุดที่ยังไม่ได้ปิดหรือไม่
select count(period)
into	:li_count
from	accperiod
where ( account_year 	= :ai_year ) and
		( period				< :ai_period ) and
		( close_flag			= 0) and
		( coop_id			= :is_coop_id ) using itr_sqlca;
if isnull( li_count ) then li_count = 0		
if li_count > 0 then
	ithw_exception.text	= "1. ปิดได้เฉพาะงวดล่าสุดที่ยังไม่ปิดสิ้นเดือนเท่านั้น กรุณาตรวจสอบ "
	rollback using itr_sqlca;
	throw ithw_exception
end if

// กรณีปิดสิ้นเดือนแล้ว ไม่สามารถปิดได้อีก
li_close	= 0
li_close	= this.of_is_closemonth( ai_year, ai_period, is_coop_id )
if ( li_close = 1 ) then
	ithw_exception.text	= "2. ปิดได้เฉพาะงวดล่าสุดที่ยังไม่ปิดสิ้นเดือนเท่านั้น กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if


this.of_get_period_date( ai_year , ai_period , is_coop_id, ldtm_begin, ldtm_end )

//เช็ครายการว่าในช่วงเดือนนี้มีการผ่านรายการแล้วหรือยัง
li_count	= 0
li_count	= this.of_is_postall_voucher( ldtm_begin, ldtm_end, 0, is_coop_id )
if isnull( li_count ) then li_count = 0
if li_count > 0 then
	ithw_exception.text	= "ยังไม่ได้ผ่านรายการไปแยกประเภททุกรายการ กรุณาตรวจสอบ"
	rollback using itr_sqlca;
	throw ithw_exception
end if
//*** ถ้าผ่านรายการแล้ว update ยอดรวมของแต่ละบัญชีในเดือนที่จะปิด เข้า accsumledgerperiod

lds_check = create n_ds
lds_check.dataobject = 'd_acc_accmaster_all_service'
lds_check.settransobject(itr_sqlca)

li_row	= lds_check.retrieve(is_coop_id )

lds_check.setsort( "account_rev_group A, account_group_id A , account_id A" )
lds_check.sort()


for	li_index	= 1 to li_row
	ls_accid	= lds_check.object.account_id[li_index]
	
	//หายอดสะสมระหว่าง วันที่่่ส่งเข้าไป  ได้ผลรวม  DR และ  CR
	this.of_get_sum_between_drcr( ldtm_begin , ldtm_end  , ls_accid , is_coop_id,  ldc_dr , ldc_cr  )
	
	this.of_post_to_sumledger( ls_accid, ai_year, ai_period, 1,  ldc_dr, ldc_cr, is_coop_id )
next

//////////////////////////////////////////////////////////////////////////////
//update เลขที่เอกสาร
	if (ai_period = 12) then 
		li_period = 1
		li_year = ai_year
		
	select max(period_end_date)
	into	:ldtm_endperiod
	from	accperiod
	where	account_year = :li_year	and
				period	       = :li_period	and
				coop_id		  = :is_coop_id	
	using itr_sqlca;
	
	//วันเริ่มต้นงวดสุดท้าย
	ldtm_start_endperiod = datetime( date( year( date( ldtm_endperiod ) ) + 1, month( date( ldtm_endperiod ) ), 1  ) )
	ldtm_endperiod			= datetime( date( year( date( ldtm_endperiod ) ) + 1 , month( date( ldtm_endperiod ) ),  day(date(ldtm_endperiod))  ) )
		
	else
		li_year = ai_year
		li_period = ai_period + 1
		
	select max(period_end_date)
	into	:ldtm_endperiod
	from	accperiod
	where	account_year = :li_year	and
				period	       = :li_period	and
				coop_id		= :is_coop_id	
	using itr_sqlca;
	
	//วันเริ่มต้นงวดสุดท้าย
	ldtm_start_endperiod = datetime( date( year( date( ldtm_endperiod ) ), month( date( ldtm_endperiod ) ), 1  ) )
		
	end if
	

	
	//////////หาเลขที่เอกสารของปีเก่า//////////////////
	select substr(max(voucher_no),7,4)
	into	:ls_pvno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'PV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:ls_rvno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'RV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:ls_jvno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'JV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:ls_avno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'AV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:ls_tvno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'TV%'		and
			coop_id			= :is_coop_id	
	using itr_sqlca;
	

	
	if isnull(ls_pvno) or ls_pvno = "" then ls_pvno = '0'
	if isnull(ls_rvno) or ls_rvno = "" then ls_rvno = '0'
	if isnull(ls_jvno) or ls_jvno = "" then ls_jvno = '0'
	if isnull(ls_avno) or ls_avno = "" then ls_avno = '0'
	if isnull(ls_tvno) or ls_tvno = "" then ls_tvno = '0'

	
	li_pvno	= integer(ls_pvno)
	li_rvno	= integer(ls_rvno)
	li_jvno	= integer(ls_jvno)
	li_avno	= integer(ls_avno)
	li_tvno	= integer(ls_tvno)
	
	
	//update เลขที่เอกสาร Voucher
update 	cmdocumentcontrol
set			last_documentno	= :li_pvno
where 	( document_code = 'CMVOUCHERNO_PV' ) and
			( coop_id			= :is_coop_id	  )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_rvno
where 	( document_code = 'CMVOUCHERNO_RV' ) and
			( coop_id				= :is_coop_id	  )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_jvno
where 	( document_code = 'CMVOUCHERNO_JV' ) and
			( coop_id			= :is_coop_id	 )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_avno
where 	( document_code = 'CMVOUCHERNO_AV' ) and
			( coop_id			= :is_coop_id	 )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_tvno
where 	( document_code = 'CMVOUCHERNO_TV' ) and
			( coop_id			= :is_coop_id	 )
using itr_sqlca;


if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถอัพเดทเลขที่เอกสาร Voucher ได้  " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if
	
	/////////////////////////////////////////////////////////////////////////////////////

//*****************************update status_close
update	accperiod
set			close_flag	= 1
where	( account_year 	= :ai_year )  and
			( period			= :ai_period ) and
			( coop_id		= :is_coop_id ) using itr_sqlca;

if itr_sqlca.sqlcode <>  0 then
	ithw_exception.text	= "ไม่สามารถปิดสิ้นเดือนได้ กรุณาตรวจสอบ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca;
	throw ithw_exception
else
	commit using itr_sqlca;	
end if

return 1
end function

public function integer of_gen_delseries (datetime adtm_cal_delseries);//#####################	หน้าจอการทำค่าเสื่อมราคา มี  3  กรณี  ##################
//#####################	ยกมา 		=	ldc_balance
//#####################	เพิ่มลด		=	add_delete
//#####################	ราคาทุน		=	before_amount
//#####################	ค่าเสื่อม		=	balance_del
//#####################	รวม			=	total_amount		
//#####################	คงเหลือไป	=	balance_old
//#####################	จำนวน 		= 	before_amt
//#####################	%ค่าเสื่อม	=	percen_del
//#####################	1. กรณีปกติ
//#####################		- ค่า เสื่อม (balance_del)  = (ราคาทุน(before_amount)  *  %ค่าเสื่อม(percen_del) ) * (จำนวนวัน(before_amt) /จำนวนวันใน 1 ปี)
//#####################		- รวม   = ยกมา(ldc_balance) - เพิ่มลด
//#####################		- คงเหลือ ยกไป   = รวม - ค่าเสื่อม
//#####################	2.  กรณีที่ยอดค่า เสื่อม(balance_del) มากกว่า รวม (total_amount)
//#####################		- คงเหลือยกไป(balance_old)   = รวม(total_amount) - 1*จำนวน(before_amt)

integer	li_count , li_percent  , li_countdate,li_alldate,li_status,li_before_amt ,li_current_year ,li_year, li_index
dec{2} 	ldc_balance,	ldc_begin,ldc_del,ldc_before,ldc_balance_receive,ldc_amount,ldc_add_delete ,ldc_total ,ldc_balance_old
datetime ldtm_recrieve_date ,ldtm_curdate,gdc_beforedate
string		ls_today

datastore	dw_main

ls_today = string(adtm_cal_delseries,"dd/mm/yyyy")
ls_today = left(ls_today,6) + string(integer(right(ls_today,4))+543)

ldtm_curdate	= datetime(date( integer( right( ls_today , 4 ) ) , integer( mid( ls_today, 4, 2 ) ), integer( left( ls_today , 2 ) ) ))

dw_main	= create datastore
dw_main.dataobject	= "d_vc_slip_data_cashfnrcv"
dw_main.settransobject( itr_sqlca )

li_count			= dw_main.rowcount()

for li_index = 1 to li_count
	li_year			= dw_main.object.year[li_index]
	li_year			= li_year -543
	ldc_balance		= 0
	ldc_del			= 0
	ldc_begin		= 0
	
	li_before_amt			= dw_main.object.before_amt[ li_index ]  // จำนวน
	ldc_before				= dw_main.object.before_amount[ li_index ] // ราคาทุน
	ldtm_recrieve_date	= dw_main.object.recrieve_date[ li_index ] //วันที่รับ
	li_status					= dw_main.object.status[ li_index ] //สถานะ 1,0,2,-1 คือ เพิ่ม , ลด ,ไม่ประมวลผล ,ประมวผล ตามลำดับ
	

next
return 1
end function

public function integer of_add_newemployee (string as_employee_detail_xml, integer ai_update_add) throws Exception;/***********************************************
<description>
ทำรายการเพิ่มรหัสบัญชีใหม่

FXREF: AC-ACCSERVICE-of_add_newaccount_id-0000001
</description>

<arguments>
as_account_iddetail_xml		ข้อมูลเขที่บัญชีทึีต้องการเพิ่มหรือปรับปรุง ในรูปแบบ XML
ai_update_add					สถานะบอกว่า update หรือ เพิ่มใหม่
									1 = > Update
									2 => Add
</arguments>	

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/
n_ds		lds_accdetail
integer	li_rc, li_count, li_index

lds_accdetail		= create n_ds
lds_accdetail.dataobject = "d_acc_add_employee"
lds_accdetail.Settransobject( itr_sqlca )

if not  isnull( as_employee_detail_xml ) and trim( as_employee_detail_xml ) <> ""  then
	li_rc	= lds_accdetail.importstring( XML!, as_employee_detail_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

if ( ai_update_add = 2 ) then
	//DataModified!	
	li_count	= integer( lds_accdetail.describe( "Datawindow.Column.Count" ) )
	lds_accdetail.SetItemStatus( 1, 0, Primary!, DataModified!)
	for li_index = 1 to li_count
		lds_accdetail.SetItemStatus( 1, li_index, Primary!, DataModified!)
	next
	
	lds_accdetail.SetItemStatus( 1, "member_no,coop_id", Primary!, NotModified!)   /* กำหนดให้รู้ว่าเป็น  Primary key  */
	
end if

  
 
li_rc	= lds_accdetail.update( ) 
if ( li_rc = -1 ) then
	if ( ai_update_add = 1 ) then
		ithw_exception.text	= "ไม่สามารถบันทึกรายละเอียด การเพิ่มพนักงานใหม่ได้ "
	else
		ithw_exception.text	= "ไม่สามารถบันทึกรายละเอียด การปรับปรุงข้อมูลพนักงานได้ "
	end if
	
	ithw_exception.text	+= lds_accdetail.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
end if

commit using itr_sqlca ;
return 1
end function

public function integer of_set_employee_salary (string as_xml, string as_coopid, integer an_year) throws Exception;n_ds		lds_data
Integer	li_rc, li_salaryflag
Long		ll_index, ll_row, ll_ID
String		ls_memno
Dec		ldc_salary	
	
lds_data		= create n_ds
lds_data.dataobject = "d_acc_emp_salary"

if not  isnull( as_xml ) and trim( as_xml ) <> ""  then
	li_rc	= lds_data.importstring(XML!,  as_xml )
		if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if


ll_row		= lds_data.rowcount( )

IF IsNull( ll_row ) or ( ll_row < 1 ) THEN 
	ithw_exception.text		= "ไม่มีแถวข้อมูล กรุณาตรวจสอบ"
	throw ithw_exception
END IF

// delete ก่อน
delete from ACCEMPSALARY 
where	ACCOUNT_YEAR			= :an_year  and
			COOP_ID						= :as_coopid 
using itr_sqlca ;

for ll_index = 1 to ll_row
	
	ls_memno		= lds_data.object.member_no[ll_index]
	ldc_salary		= lds_data.object.salary_amt[ ll_index ]
	li_salaryflag		= lds_data.object.salary_flag[ ll_index ]
	
	if isnull( li_salaryflag) then li_salaryflag = 0
	if isnull( ldc_salary ) then ldc_salary = 0.00

	INSERT INTO ACCEMPSALARY  
	(	  
		  COOP_ID,   
           MEMBER_NO,   
           ACCOUNT_YEAR,   
           SALARY_AMT,
		  SALARY_FLAG
	)  
	VALUES
	(	  
		:as_coopid,
		:ls_memno,
		:an_year,
		:ldc_salary,
		:li_salaryflag

	)  using itr_sqlca ;
	
	IF ( itr_sqlca.SQLCode <> 0 ) THEN
		ithw_Exception.text	= 'มีปัญหาในการบันทึกรายการเงินเดือน ' + itr_sqlca.SqlErrText
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
next

commit USING itr_SQLCA ;

return 1
end function

public function integer of_process_pension (string as_coopid, integer ai_year) throws Exception;integer 	li_seq_no , li_workyear, li_salaryflag
string		ls_memno , ls_account_desc, ls_account_name, ls_accrcvpay, ls_branch
dec{2}	ldc_salary , ldc_pension, ldc_calpension
Long		ll_ID, ll_BudgetId, ll_count, ll_index, ll_count2, ll_index2
datetime ldtm_start_prvyear

datastore	lds_slipdata ,lds_resigndata

// ds สำหรับดึงข้อมูลเงินเดือนเเจ้าหน้าที่สหกรณ์
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_acc_emp_salary"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( ai_year , as_coopid   )


// ลบข้อมูลเดิมออกก่อน ครับ
delete from accempcalpension
where	account_year	= :ai_year 
and		coop_id		= :as_coopid
using itr_sqlca ;
			
if itr_SQLCA.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถล้างข้อมูลเดิมได้ " + itr_sqlca.sqlerrtext
	rollback USING itr_SQLCA ;
	throw ithw_exception
end if

for ll_index = 1 to ll_count

	ldc_salary				= lds_slipdata.object.salary_amt[ ll_index ]
	ls_memno				= lds_slipdata.object.member_no[ ll_index ]
	li_salaryflag				= lds_slipdata.object.salary_flag[ ll_index ]  // 1 = สถานะเงินเดือนเต็มขั้น   0 = ปกติ 
	
	if isnull( ldc_salary) then ldc_salary = 0.00
	if isnull( li_salaryflag ) then li_salaryflag = 0
	
	//เคลียร์ข้อมูลก่อน
	ldc_pension = 0
	li_workyear = 0

select	accempcalpension.pension_amt,
		accempcalpension.work_year
into	:ldc_pension, :li_workyear
from 	accempcalpension
where	( accempcalpension.account_year	= :ai_year - 1)
and		( accempcalpension.coop_id		= :as_coopid )
and 		( accempcalpension.member_no = :ls_memno )
USING itr_SQLCA ;

if IsNull( ldc_pension ) then ldc_pension = 0
if IsNull( li_workyear ) then li_workyear = 0



///////////////////////////////////////////////ท่อนคำนวณสำรองบำเหน็จ//////////////////////////////////////////////////////////
///เงินเดือน *  จน.ปีที่ทำงาน  = สำรองบำเหน็จปีปัจจุบัน

if( li_salaryflag  = 0 ) then
	ldc_calpension = ldc_salary * ( li_workyear + 1 )
else
	ldc_calpension = ldc_pension + ldc_salary
end if

if isnull(ldc_calpension) then ldc_calpension = 0


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	INSERT INTO ACCEMPCALPENSION  
	(	COOP_ID,						MEMBER_NO,							ACCOUNT_YEAR,
		BFPENSION_AMT,   			PENSION_AMT,							WORK_YEAR							
	)  
	VALUES
	( 	:as_coopid,   					:ls_memno,								:ai_year,
		:ldc_pension,					:ldc_calpension,						:li_workyear + 	1					
	) USING itr_SQLCA ;


	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลการประมวลสำรองบำเหน็จได้  " + itr_sqlca.sqlerrtext
		rollback USING itr_SQLCA ;
		throw ithw_exception
	end if

next


if itr_SQLCA.sqlcode = 0 then
	commit USING itr_SQLCA ;
end if


////////////////////////////////////////////////////ยิงข้อมูลเจ้าหน้าที่ ที่ลาออกปีก่อน//////////////////////////////////////////////////////

//หาวันที่ต้นปีของปีก่อน
select beginning_of_accou
into :ldtm_start_prvyear
from accaccountyear
where account_year = :ai_year - 1  and
		coop_id = :as_coopid
using itr_sqlca ;
		

// ds สำหรับดึงข้อมูลเจ้าหน้าที่สหกรณ์ที่ลาออกปีก่อน
lds_resigndata	= create datastore
lds_resigndata.dataobject	= "d_acc_employee_resign"
lds_resigndata.settransobject( itr_sqlca )

ll_count2			= lds_resigndata.retrieve( ai_year , as_coopid , ldtm_start_prvyear   )

for ll_index2 = 1 to ll_count2

	ldc_pension				= lds_resigndata.object.pension_amt[ ll_index2 ]
	ls_memno				= lds_resigndata.object.member_no[ ll_index2 ]
	li_workyear				= lds_resigndata.object.work_year[ ll_index2 ]  //จน.ปีที่ทำงาน
	
		INSERT INTO ACCEMPCALPENSION  
	(	COOP_ID,						MEMBER_NO,							ACCOUNT_YEAR,
		BFPENSION_AMT,   			PENSION_AMT,							WORK_YEAR							
	)  
	VALUES
	( 	:as_coopid,   					:ls_memno,								:ai_year,
		:ldc_pension,					0,											:li_workyear					
	) USING itr_SQLCA ;


	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถเพิ่มข้อมูลการประมวลสำรองบำเหน็จได้  " + itr_sqlca.sqlerrtext
		rollback USING itr_SQLCA ;
		throw ithw_exception
	end if
	
next


return 1
end function

public function integer of_save_asset (string as_xml, string as_ratexml, string as_coop) throws Exception;n_ds		lds_data, lds_RateDp
integer	li_rc, li_count, li_index, li_Period, li_found
Long		ll_ID
String		ls_AssetDoc, ls_AssetControlNo

lds_data		= create n_ds
lds_data.dataobject = "d_acc_add_newasset"
lds_data.Settransobject( itr_sqlca )

if not  isnull( as_xml ) and trim( as_xml ) <> ""  then
	li_count	= lds_data.importstring(XML!,  as_xml )
		if ( li_count < 0 ) then
		ithw_exception.text		+= "ไม่มีข้อมูลรายการทรัพย์สิน กรุณาตรวจสอบ"
		throw ithw_exception
	end if
end if

lds_RateDp		= create n_ds
lds_RateDp.dataobject = "d_acc_dp_rate"
lds_RateDp.Settransobject( itr_sqlca )

if not  isnull( as_RateXml ) and trim( as_RateXml ) <> ""  then
	li_count	= lds_RateDp.importstring(XML!,  as_RateXml )
		if ( li_count < 0 ) then
		ithw_exception.text		+= "ไม่มีข้อมูลอัตราค่าเสื่อม/ตัดจ่าย กรุณาตรวจสอบ"
		throw ithw_exception
	end if
end if

String			ls_DescText, ls_TypeSeries, ls_DescWhy, ls_AccountID
DateTime	ldtm_ReceiveDate
Integer		li_BeforeAmt, li_TypeofCalDp, li_Accyear
Decimal		ldc_AddAmount

// ตรวจสอบ การป้อนข้อมูล
ls_AssetDoc			= lds_data.GetItemString( 1, "asset_doc" )
ls_DescText			= lds_data.GetItemString( 1, "desc_text" )
ls_TypeSeries		= lds_data.GetItemString( 1, "type_series" )
ldtm_ReceiveDate	= lds_data.GetItemDateTime( 1, "receive_date" )
ls_DescWhy			= lds_data.GetItemString( 1, "desc_why" )
li_BeforeAmt		= lds_data.GetItemNumber( 1, "before_amt" )
ldc_AddAmount		= lds_data.GetItemDecimal( 1, "add_amount" )
li_TypeofCalDp		= lds_data.GetItemNumber( 1, "type_of_caldp" )
ls_AccountID		= lds_data.GetItemString( 1, "account_id" )
//ls_AssetControlNo	= lds_data.GetItemString( 1, "asset_doc_grp" )

IF ( Isnull( ldtm_ReceiveDate )  or String( ldtm_ReceiveDate , 'YYYYMMDD' ) = '19000101' ) THEN
	ithw_Exception.text	= 'ต้องระบุ วันที่ได้มาของสินทรัพย์  ' 
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF ( Isnull( li_TypeofCalDp ) ) THEN
	ithw_Exception.text	= 'ต้องระบุ กลุ่มการคำนวณ  ' 
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF ( Isnull( ls_AssetDoc )  or Trim ( ls_AssetDoc ) = "" ) THEN
	ithw_Exception.text	= 'เลขที่ สินทรัพย์ ไม่สามารถเว้นว่างได้  ' 
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF ( Isnull( ls_DescText )  or Trim ( ls_DescText ) = "" ) THEN
	ithw_Exception.text	= 'รายละเอียดสินทรัพย์ ไม่สามารถเว้นว่างได้  ' 
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF ( Isnull( ls_DescWhy )  or Trim ( ls_DescWhy ) = "" ) THEN
	ithw_Exception.text	= 'สาเหตุการได้มา ไม่สามารถเว้นว่างได้  ' 
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF ( Isnull( li_BeforeAmt )  or li_BeforeAmt <= 0 ) THEN
	ithw_Exception.text	= 'ต้องระบุจำนวนสินทรัพย์  ' 
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF ( Isnull( ldc_AddAmount )  or ldc_AddAmount <= 0 ) THEN
	ithw_Exception.text	= 'ต้องระบุราคาสินทรัพย์  ' 
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

IF IsNull( ls_AssetControlNo ) THEN ls_AssetControlNo = ""

// แก้ไขหรือ เพิ่มใหม่
// 1 = แก้ไข 0 = เพิ่มใหม่
li_found = 0
li_found	= lds_data.GetItemNumber( 1, "flag" )
IF IsNull( li_found ) THEN li_found = 0

lds_data.SetItem( 1, "total_amount" , ldc_AddAmount )
lds_data.SetItem( 1, "master_branch_id" , as_coop )
lds_data.SetItem( 1, "coop_id" , as_coop )
lds_data.SetItem( 1, "begin_asset" , 0 )
lds_data.SetItem( 1, "standing_balance" , ldc_AddAmount )
lds_data.SetItem( 1, "before_amount" , ldc_AddAmount )
lds_data.SetItem( 1, "status" , 1 )
 
lds_data.Accepttext()

IF (  li_found = 0 ) THEN
//	ls_AssetControlNo	= inv_docservice.of_getnewdocno( as_coop ,"ASSETCONTROL_NO" )
//	
//	lds_data.SetItem( 1, "asset_doc_grp" , ls_AssetControlNo )
	
	// เพิ่มรายการใหม่
//	lds_data.SetItemStatus( 1, 0 ,  Primary!, NewModified! )
	lds_data.Accepttext()
	
	IF (lds_data.UPDATE() <> 1 ) THEN
		ithw_Exception.text	= 'มีปัญหาในการบันทึกรายการ  ' + lds_data.of_GetErrorMessage()
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
ELSE
	UPDATE ACC_DELSERIES  
	     SET DESC_TEXT = :ls_DescText ,   
                BEFORE_AMOUNT = :ldc_AddAmount,   
                TOTAL_AMOUNT = :ldc_AddAmount,   
			   BEFORE_AMT = :li_BeforeAmt,
			   ADD_AMOUNT = :ldc_AddAmount,
                ACCOUNT_ID = :ls_AccountID ,   
                TYPE_SERIES = :ls_TypeSeries,   
                TYPE_OF_CALDP = :li_TypeofCalDp,   
                DESC_WHY = :ls_DescWhy,
                RECEIVE_DATE = :ldtm_ReceiveDate
    WHERE ( ASSET_DOC =  :ls_AssetDoc ) AND  
                ( COOP_ID = :as_coop )
     USING itr_SQLCA ;
	
	IF ( itr_SQLCA.SqlCode <> 0 ) THEN
		ithw_Exception.text	= 'มีปัญหาในการบันทึกรายการ  ข้อผิดพลาด ' + itr_SQLCA.SqlErrText
		ROLLBACK USING itr_SQLCA ;
		THROW ithw_Exception
	END IF
	
	// แก้ไขรายการ
//	lds_data.SetItemStatus( 1, 0 ,  Primary!, DataModified! )
END IF

	

THIS.of_get_year_period( ldtm_ReceiveDate , as_coop, li_Accyear , li_Period )

IF ( li_found = 0 ) THEN
	ll_ID	= 0
//	ll_ID	= THIS.of_get_sequence_pk( "ACC_ASSET_YEAR_SEQ" )
	
	INSERT INTO ACC_ASSET_YEAR  
	(	COOP_ID,								ASSET_DOC,   				ACCOUNT_YEAR,
		BEGIN_ASSET,   						BEFORE_AMT,				BEFORE_AMOUNT,
		TOTAL_AMOUNT,   					BALANCE_DEL,   			BALANCE_MONTH,
		DELETE_AMOUNT,						ADD_AMOUNT,   			SALE_AMOUNT,   			
		STANDING_BALANCE   
	)  
	VALUES
	( 	:as_coop,   								:ls_AssetDoc,				:li_Accyear,
		0.00,										:li_BeforeAmt,				:ldc_AddAmount,			
		:ldc_AddAmount,						0.00,							:ldc_AddAmount,			
		0.00,										:ldc_AddAmount,			0.00,
		:ldc_AddAmount										
	)  USING itr_SQLCA ;
ELSE
	DECLARE c_FindAssetYearID CURSOR FOR
	  SELECT count( ASSET_DOC ) 
         FROM ACC_ASSET_YEAR
       WHERE ASSET_DOC = :ls_AssetDoc
           AND COOP_ID = :as_coop
           AND ACCOUNT_YEAR = :li_Accyear
        USING itr_SQLCA ;
	
	ll_ID	= 0
	
	OPEN c_FindAssetYearID ;
	FETCH c_FindAssetYearID INTO :ll_ID ;
	CLOSE c_FindAssetYearID ;
	
	IF IsNull( ll_ID ) THEN ll_ID = 0
	
	IF ( ll_ID > 0 ) THEN
		UPDATE ACC_ASSET_YEAR
              SET BEFORE_AMT = :li_BeforeAmt ,
                     BEFORE_AMOUNT = :ldc_AddAmount ,
                     TOTAL_AMOUNT = :ldc_AddAmount,
				   BALANCE_MONTH = :ldc_AddAmount,
				   ADD_AMOUNT = :ldc_AddAmount
          WHERE ASSET_DOC = :ls_AssetDoc
           USING itr_SQLCA ;
	ELSE
		ll_ID	= 0
//		ll_ID	= THIS.of_get_sequence_pk( "ACC_ASSET_YEAR_SEQ" )
		
		INSERT INTO ACC_ASSET_YEAR  
		(	COOP_ID,								ASSET_DOC,   				ACCOUNT_YEAR,
			BEGIN_ASSET,   						BEFORE_AMT,				BEFORE_AMOUNT,
			TOTAL_AMOUNT,   					BALANCE_DEL,   			BALANCE_MONTH,
			DELETE_AMOUNT,						ADD_AMOUNT,   			SALE_AMOUNT,   			
			STANDING_BALANCE
		)  
		VALUES
		( 	:as_coop,   								:ls_AssetDoc,				:li_Accyear,
			0.00,										:li_BeforeAmt,				:ldc_AddAmount,			
			:ldc_AddAmount,						0.00,							:ldc_AddAmount,			
			0.00,										:ldc_AddAmount,			0.00,
			:ldc_AddAmount
		)  USING itr_SQLCA ;
	END IF
	
END IF


if itr_sqlca.sqlcode <> 0 then
	ithw_Exception.text	= "ไม่สามารถตรวจเพิ่ม ข้อมูลการคำนวณค่าเสื่อมปีปัจจุบันได้ " + itr_sqlca.sqlerrtext
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
end if

// Rate DP
DELETE FROM ACC_DP_RATE
WHERE ASSET_DOC = :ls_AssetDoc
AND COOP_ID = :as_coop
USING itr_SQLCA ;

li_count	= lds_RateDp.RowCount()

FOR li_index = 1 TO li_count
	ll_ID	= 0
	ll_ID	= lds_RateDp.object.seq_no[ li_index ]
	
	IF IsNull( ll_ID ) THEN ll_ID = 0
		
	IF ( ll_ID = 0 ) THEN
//		ll_ID	= THIS.of_get_sequence_pk( "ACC_DP_RATE_SEQ" )
		lds_RateDp.object.seq_no[ li_index ]	= 1
	END IF
	
	lds_RateDp.SetItem( li_index, "asset_doc", ls_AssetDoc )
	lds_RateDp.SetItem( li_index , "coop_id", as_coop )
	
NEXT

lds_RateDp.Accepttext()

IF (lds_RateDp.UPDATE() <> 1 ) THEN
	ithw_Exception.text	= 'มีปัญหาในการบันทึกรายการ  ' + lds_RateDp.of_GetErrorMessage()
	ROLLBACK USING itr_SQLCA ;
	THROW ithw_Exception
END IF

commit USING itr_SQLCA ;

return 1
end function

public function decimal of_calculate_dp (string as_assetdoc, string as_coop, decimal adc_assetprice, datetime adtm_calfrom, datetime adtm_calto, ref string as_calrate) throws Exception;
Integer		li_DayInYear
Integer		li_DayCounted
Dec{7}		ldc_DpRate
Dec{2}		ldc_DpReturn, ldc_DpStep
DateTime	ldtm_CalFrom, ldtm_CalTo

ldtm_CalFrom 		= adtm_CalFrom
ldtm_CalTo			= adtm_CalFrom

// ตรวจสอบ วันที่ต้องมีค่า
IF IsNull(adtm_CalFrom) THEN RETURN 0.00
IF IsNull(adtm_CalTo) THEN RETURN 0.00
IF IsNull(adc_AssetPrice) or ( adc_AssetPrice <= 0.00 ) THEN RETURN 0.00

// ตรวจสอบความถูกต้องของวันที่
IF ( adtm_CalTo < adtm_CalFrom ) THEN RETURN 0.00

ldc_DpReturn	= 0.00
li_DayInYear		= 365


//DO WHILE ( ldtm_CalFrom <= adtm_CalTo)
if ( ldtm_CalFrom <= adtm_CalTo) then
	
	// สำหรับดึงค่าดอกเบี้ย
	DECLARE C_DpRate CURSOR FOR
	   SELECT DP_RATE, EXPIRE_DATE
		FROM ACC_DP_RATE
	  WHERE ASSET_DOC = :as_assetdoc
	       AND COOP_ID = :as_coop
	       AND EXPIRE_DATE >= :ldtm_CalFrom
   ORDER BY EFECTIVE_DATE, EXPIRE_DATE
	   USING itr_SQLCA;
	
	ldc_DpStep		= 0.00
	ldC_DpRate		= 0.00
	
	OPEN C_DpRate ;
	FETCH C_DpRate INTO :ldC_DpRate, :ldtm_CalTo ;
	CLOSE C_DpRate ;
	
	// หากวันตามปี
	IF ( li_DayInYear = 0 ) THEN
		// ตรวจสอบว่า 29.02.ปีนี้ เป็นวันที่หรือเปล่า
		IF ( inv_DateTime.of_IsLeapYear( Date(ldtm_CalFrom) ) ) THEN
			li_DayInYear		= 366
		ELSE
			li_DayInYear		= 365
		END IF
		
		// ตรวจว่าคิดดอกเบี้ยข้อมปีหรือไม่
		IF ( Date( ldtm_CalTo ) > Date( Year(Date(ldtm_CalTo)), 12, 31 )  ) THEN
			ldtm_CalTo	= DateTime( Date(Year(Date(ldtm_CalTo)), 12, 31) )
		END IF
		
		// หากวันที่ที่หามาได้ มากกว่า วันที่ส่งมา ให้คิดถึงแค่วันที่ส่งมา
		IF ( ldtm_CalTo > adtm_CalTo ) THEN ldtm_CalTo = adtm_CalTo
	
		// หากเป็นการข้ามปี ให้กำหนดวันที่คิดดอกเบี้ยล่าสุด เป็นวันที่ 1 มกราคา ปีถัดไป
		IF ( Year(Date(adtm_CalTo)) <> Year(Date(ldtm_CalTo))) THEN
			ldtm_CalTo	= DateTime( RelativeDate( Date(ldtm_CalTo) , 1 ) )
		END IF
	ELSE
		// หากวันที่ที่หามาได้ มากกว่า วันที่ส่งมา ให้คิดถึงแค่วันที่ส่งมา
		IF ( ldtm_CalTo > adtm_CalTo ) THEN ldtm_CalTo = adtm_CalTo
	END IF // ตรวจสอบข้อมปี
	
	li_DayCounted	= 0
	li_DayCounted	= DaysAfter( Date(ldtm_CalFrom), Date(ldtm_CalTo) )
	li_DayCounted ++
	
		if(li_DayInYear = 366) then li_DayInYear = 365  //** จำนวนวันทั้งปีใช้ 365 วันเป็นตัวหาร
	if(li_DayCounted = 366) then li_DayCounted = 365  //** จำนวนวัน
	
	ldc_DpStep	= 0.00
	ldc_DpStep	= ( adc_AssetPrice * li_DayCounted * ldc_DpRate ) / ( li_DayInYear * 100 )
	ldc_DpStep	= Round( ldc_DpStep ,2)
	
	ldc_DpReturn	= ldc_DpReturn + ldc_DpStep
	
	// ขยับวันที่ เริ่มคิดสำหรับรอบต่อไป
	ldtm_CalFrom	= DateTime( RelativeDate( Date( ldtm_CalTo ) , 1 ) )
	
	//test ปรับวันที่ตอนคำนวณเสร็จให้เท่ากับวันที่คำนวณถึง ไม่งั้นจะวน loop จนตาย
	//ยังไม่เอา code เก่าออก เพราะยังไม่รู้สาเหตุที่เขียนวน loop แบบนี้
	//ldtm_CalFrom = adtm_CalTo
	
	IF ( Trim( as_CalRate ) = "" ) THEN
		as_CalRate = String( ldc_DpRate , "#,##0.00") + "%"+String(li_DayCounted,"#,##0") + "วัน"
	ELSE
		as_CalRate += "," + String( ldc_DpRate , "#,##0.00") + "%"+String(li_DayCounted,"#,##0") + "วัน"
	END IF
	
end if
//LOOP

RETURN ldc_DpReturn
end function

public function integer of_cal_dp (datetime adtm_caltodate, string as_coop) throws Exception;//#####################    หน้าจอการทำค่าเสื่อมราคา มี  3  กรณ ี     ##################
//####################       ยกมา 		=	ldc_balance
//####################       เพิ่มลด		=	add_delete
//####################       ราคาทุน		=	before_amount
//####################       ค่าเสื่อม		=	balance_del
//####################       รวม			=	total_amount		
//####################       คงเหลือไป	=	balance_old
//####################       จำนวน 		= 	before_amt
//####################     %ค่าเสื่อม	=	percen_del
//####################       1. กรณีปกติ
//###################             - ค่า เสื่อม (balance_del)  = (ราคาทุน(before_amount)  *  %ค่าเสื่อม(percen_del) ) * (จำนวนวัน(before_amt) /จำนวนวันใน 1 ปี)
//##################                - รวม   = ยกมา(ldc_balance) - เพิ่มลด
//##################                - คงเหลือ ยกไป   = รวม - ค่าเสื่อม
//###############   			    2.  กรณีที่ยอดค่า เสื่อม(balance_del) มากกว่า รวม (total_amount)
//#############              			 - คงเหลือยกไป(balance_old)   = รวม(total_amount) - 1*จำนวน(before_amt)


integer 		ll_countdate,ll_alldate,li_status
dec{2} 		ldc_balance,	 ldc_BfAmount ,ldc_del,   ldc_Total ,ldc_balance_old, ldc_BeginAsset, ldc_BalDelAll
DateTime	ldtm_RcvDate ,ldt_CurDate, ldtm_BeginMonth, ldtm_StartYear, ldtm_EndYear, ldtm_expire
dec{2}		ldc_del_month, ldc_SaleAmt, ldc_StandingBal, ldc_DelAmount, ldc_AddAmount, ldc_MasterDelAmount
integer		li_period, li_year_month, li_CalType, li_countmonth
Long			ll_ID, ll_BfAmt, ll_AssetID
Dec			ldc_PercenDel
String			ls_AssetDoc, ls_CalRate
DateTime	ldtm_SaleDate, ldtm_YearCalFrom, ldtm_MonthCalFrom

ldt_CurDate			= adtm_caltodate

//วันเริ่มต้นงวด
ldtm_BeginMonth		= datetime( date( year( date( ldt_CurDate ) ), month( date( ldt_CurDate ) ), 1  ) )

THIS.of_get_year_period( ldtm_BeginMonth, as_coop , li_year_month, li_period  )

THIS.of_get_yearange_date( li_year_month, as_coop, ldtm_StartYear, ldtm_EndYear )

DELETE FROM ACC_CAL_DP
         WHERE COOP_ID = :as_coop
             AND ACCOUNT_YEAR = :li_year_month
             AND PERIOD  >= :li_period
          USING itr_SQLCA ;

DECLARE c_CalDP CURSOR FOR
SELECT	A.ASSET_DOC,									A.BEGIN_ASSET,
			A.BEFORE_AMT,   								A.BEFORE_AMOUNT,   				A.TOTAL_AMOUNT,
			A.DELETE_AMOUNT,							A.ADD_AMOUNT,   					A.SALE_AMOUNT,
			A.STANDING_BALANCE,						B.STATUS,								B.TYPE_OF_CALDP,
			B.RECEIVE_DATE,								B.SALE_DATE,							B.DELETE_AMOUNT,
			A.BALANCE_DEL
    FROM ACC_ASSET_YEAR A,   ACC_DELSERIES  B
 WHERE ( B.ASSET_DOC = A.ASSET_DOC )   
     AND ( B.COOP_ID = A.COOP_ID )   
     AND ( B.STATUS <> 2 )
     AND ( A.ACCOUNT_YEAR = :li_year_month )
     AND ( A.COOP_ID = :as_coop )
     AND ( B.RECEIVE_DATE <= :ldt_CurDate )
ORDER BY A.ASSET_DOC ASC
USING itr_SQLCA ;

OPEN c_CalDP;
FETCH c_CalDP INTO	 :ls_AssetDoc, :ldc_BeginAsset, :ll_BfAmt, :ldc_BfAmount, :ldc_Total,
							:ldc_DelAmount, :ldc_AddAmount, :ldc_SaleAmt, :ldc_StandingBal, :li_status,
							:li_CalType, :ldtm_RcvDate, :ldtm_SaleDate, :ldc_MasterDelAmount, :ldc_BalDelAll  ;
							
ll_alldate		= DaysAfter( Date( ldtm_StartYear ), Date( ldtm_EndYear ) )
ll_alldate ++
		
DO WHILE itr_SQLCA.SqlCode = 0
	
	ldtm_YearCalFrom		= ldtm_RcvDate
	ldtm_MonthCalFrom	= ldtm_BeginMonth
	
		// วันสุดท้ายของการคิดค่าเสื่อมของแต่ละทะเบียนสินทรัพย์
	 SELECT  EXPIRE_DATE
	 INTO		:ldtm_expire
	 FROM ACC_DP_RATE
	 WHERE ASSET_DOC = :ls_AssetDoc
	       AND COOP_ID = :as_coop
	USING itr_SQLCA ;
	
//	ldc_PercenDel	// เปอร์เซนต์ค่าเสื่อม
//	ldc_DelAmount // ราคาลด ระหว่างปี
//	ldc_AddAmount // ราคาเพิ่ม ระหว่างปี
//	ll_BfAmt // จำนวน
//	ldc_BfAmount  // ราคาทุน
//	ldtm_RcvDate //วันที่รับ
//	li_Status //สถานะ 1,0,2,-1 คือ เพิ่ม , ลด ,ไม่ประมวลผล ,ประมวผล ตามลำดับ
//	ldc_BeginAsset //ราคาสินทรัพย์สุทธิยกมา

	IF ( date( ldtm_YearCalFrom ) < date( ldtm_StartYear ) ) THEN ldtm_YearCalFrom = ldtm_StartYear
	
	IF isnull( ldc_balance ) THEN ldc_balance = 0.00
	IF isnull( ldc_PercenDel ) THEN ldc_PercenDel = 0.00
	IF isnull( ldc_DelAmount ) THEN ldc_DelAmount = 0.00
	IF isnull( ldc_BfAmount ) THEN ldc_BfAmount = 0.00
	IF isnull( ldc_BeginAsset ) THEN ldc_BeginAsset = 0.00
	IF isnull( ldc_MasterDelAmount ) THEN ldc_MasterDelAmount = 0.00
	IF isnull( ldc_BalDelAll ) THEN ldc_BalDelAll = 0.00
	
	// หากสถานะ ไม่ใช่ ไม่ประมวล ก็ทำรายการดังนี้
	IF ( li_status  <>  2 ) THEN
	
		ll_countdate	= 0
		ll_countdate	= DaysAfter( Date( ldtm_YearCalFrom ), Date( adtm_caltodate ) )
		ll_countdate ++
			
		//ให้เอาราคาทุน * %ค่าเสื่อมแล้วหาร 100  แล้วคูณ กับ  จำนวนวัน หาร วันทั้งปี แล้วจะได้ค่าลดระหว่างปี	
		ldc_del	= 0.00
		
		IF (  String( ldtm_SaleDate , "ddmmyyyy") = "01011900")  or IsNull( ldtm_SaleDate ) THEN
//			if( ldc_BeginAsset > 0 ) then  //กรณีที่มียอดยกมาให้ใช้ยอดยกมาคำนวณ ถ้าไม่มีใช้ราคาทุน
//				ldc_del	= THIS.of_calculate_dp( ls_AssetDoc, as_coop, ldc_BeginAsset, ldtm_YearCalFrom , ldt_CurDate, ls_CalRate )
//			else
				ldc_del	= THIS.of_calculate_dp( ls_AssetDoc, as_coop, ldc_BfAmount, ldtm_YearCalFrom , ldt_CurDate, ls_CalRate )
//			end if
		ELSE
			// หากอยู่ในช่วงเดือนที่ คำนวณค่าเสื่อม
			IF ( Date( ldtm_SaleDate ) >= Date( ldtm_BeginMonth ) and Date( ldtm_SaleDate ) <= Date( ldt_CurDate ) ) THEN
				IF ( li_period = 1 ) THEN
					ldc_BalDelAll	= 0.00
				ELSE
					ldc_BalDelAll	= 0.00
					// หาค่าของงวดบัญชีที่แล้วมา
					DECLARE c_GetOldDel CURSOR FOR
					SELECT BALANCE_DEL
					FROM ACC_CAL_DP
					WHERE ASSET_DOC = :ls_AssetDoc
					AND ACCOUNT_YEAR = :li_year_month
					AND PERIOD = :li_period - 1
					USING itr_SQLCA ;
					
					OPEN c_GetOldDel;
					FETCH c_GetOldDel INTO :ldc_BalDelAll ;
					CLOSE  c_GetOldDel ;
					
					IF IsNull( ldc_BalDelAll ) THEN ldc_BalDelAll = 0.00
				END IF
					
				ldc_del	= ldc_BalDelAll + ldc_MasterDelAmount
			ELSE
				ldc_del	= ldc_BalDelAll
			END IF
		END IF
		
		//เช็ควันเริ่มต้นงวด กับ วันที่ได้รับของเป็นวันที่เดียวกันหรือไม่
		IF ( Date( ldtm_RcvDate ) > Date( ldtm_BeginMonth ) ) THEN
			ldtm_MonthCalFrom	= ldtm_RcvDate
		END IF
			
		//จำนวนวันของแต่ละเดือน
		li_countmonth = daysafter( date ( ldtm_MonthCalFrom ), date( ldt_CurDate ) ) 
		li_countmonth = li_countmonth + 1

		//ค่าเสื่อมเฉพาะเดือน = ให้เอาราคาทุน * %ค่าเสื่อมแล้วหาร 100  แล้วคูณ กับ  จำนวนวัน หาร วันทั้งปี
		ls_CalRate		= ""
		
		IF (  String( ldtm_SaleDate , "ddmmyyyy") = "01011900")  or IsNull( ldtm_SaleDate ) THEN
//			if( ldc_BeginAsset > 0 ) then  //กรณีที่มียอดยกมาให้ใช้ยอดยกมาคำนวณ ถ้าไม่มีใช้ราคาทุน
//				ldc_del_month	=  THIS.of_calculate_dp( ls_AssetDoc, as_coop, ldc_BeginAsset, ldtm_MonthCalFrom , ldt_CurDate, ls_CalRate )
//			else
				ldc_del_month	=  THIS.of_calculate_dp( ls_AssetDoc, as_coop, ldc_BfAmount, ldtm_MonthCalFrom , ldt_CurDate, ls_CalRate )
//			end if
		ELSE
			// หากอยู่ในช่วงเดือนที่ คำนวณค่าเสื่อม
			IF ( Date( ldtm_SaleDate ) >= Date( ldtm_BeginMonth ) and Date( ldtm_SaleDate ) <= Date( ldt_CurDate ) ) THEN
				// หาค่าของงวดบัญชีที่แล้วมา
				ldc_del_month	= ldc_MasterDelAmount
			ELSE
				ldc_del_month	= 0.00
			END IF
		END IF
		
		ldc_Total	= 0.00
		ldc_Total	= ldc_BeginAsset +  ldc_AddAmount - ldc_MasterDelAmount //เอายอดยกมา+ค่าเพิ่มลดระหว่างปี
	
		//ค่าเสื่อมของปี = ยกมา - ยอดค่าเสื่อม
		// 2.  กรณีที่ยอดค่า เสื่อม มากกว่า รวม
		IF (  String( ldtm_SaleDate , "ddmmyyyy") = "01011900")  or IsNull( ldtm_SaleDate ) THEN
			IF ( ldc_del >= ldc_Total ) THEN
				
				CHOOSE CASE li_CalType
					CASE 1 // ค่าเสื่อม
						ldc_del = ldc_Total  - ll_BfAmt
						
						//กรณียอดรวมเป็น 0 ยกไป ต้องเป็น 0
						IF ( ldc_Total = 0 ) THEN
							ldc_balance_old = 0.00
						ELSE
							IF ( ( li_status = 0   or  li_status = 1 ) and  ldtm_expire >= adtm_caltodate) THEN
								ldc_balance_old = ldc_Total
							ELSE
								ldc_balance_old = ll_BfAmt
							END IF
						END IF
								
						IF ( ldc_del < 1 ) THEN 
							ldc_del = 0.00
						END IF
						
					CASE 2, 3 // ตัดจ่าย
						ldc_del	= ldc_Total
						ldc_balance_old	= 0.00
				END CHOOSE
				
				// หาก รายเดือน มากกว่า รวม
				IF ( ldc_del_month > ldc_del ) THEN
					ldc_del_month	= ldc_del
				END IF
				
			ELSE
				ldc_balance_old =  ldc_Total - ldc_del	
			END IF
		ELSE
			ldc_Total	= 0.00
			ldc_balance_old	= ll_BfAmt - ldc_MasterDelAmount   //ให้มีค่าเท่ากับยอดทั้งหมด - จน.ยอดที่ตัดจำหน่ายแล้ว
			
			if( ldtm_expire <= adtm_caltodate ) then
				ldc_del = 0.00  //ปรับยอดค่าเสื่อมให้เป็น 0 กรณีสินทรัพย์หมดอายุการคำนวณค่าเสื่อมแล้ว
			end if
		END IF
		
		ll_ID	= 0
//		ll_ID	= THIS.of_get_sequence_pk( "ACC_CAL_DP_SEQ" )
		
		INSERT INTO ACC_CAL_DP
		(	COOP_ID,						ASSET_DOC,						ACCOUNT_YEAR,
			PERIOD ,							BALANCE_DEL,				BALANCE_MONTH,				
			MONTH_COUNT,				YEAR_COUNT,							STANDING_BALANCE,			
			CALFROM_DATE,				CALTO_DATE,							CAL_RATE
		)
		VALUES
		(	:as_coop,						:ls_AssetDoc,					:li_year_month,
			:li_period,						:ldc_del,						:ldc_del_month,
			:li_countmonth,					:ll_countdate,					:ldc_balance_old,				
			:ldtm_MonthCalFrom,				:adtm_CalToDate,				:ls_CalRate
		) USING itr_SQLCA ;
		
		IF ( itr_SQLCA.SQLCode <> 0 ) THEN
			ithw_exception.text	= "ไม่สามารถ เพิ่มรายละเอียดการคิดค่าเสื่อมได้ " + itr_SQLCA.SqlErrText 
			ROLLBACK USING itr_SQLCA ;
			CLOSE c_CalDP ;
			throw ithw_exception
		END IF
		
		// ค่าเสื่อมของทั้งปี ปีนี้
		UPDATE	ACC_ASSET_YEAR  
		      SET BALANCE_DEL = :ldc_del ,
                      STANDING_BALANCE = :ldc_balance_old
           WHERE ASSET_DOC = :ls_AssetDoc
           USING itr_SQLCA ;
			  
		IF ( itr_SQLCA.SQLCode <> 0 ) THEN
			ithw_exception.text	= "ไม่สามารถ ปรับปรุงการคิดค่าเสื่อมได้ " + itr_SQLCA.SqlErrText 
			ROLLBACK USING itr_SQLCA ;
			CLOSE c_CalDP ;
			throw ithw_exception
		END IF
		
		// Update กลับไปยัง  ACC_DELSERIES
		// ค่าเสื่อมทั้งหมด
		UPDATE ACC_DELSERIES  A
		      SET A.BALANCE_DEL = (	SELECT sum( B.BALANCE_DEL )
				                    FROM ACC_ASSET_YEAR B
									WHERE A.ASSET_DOC = B.ASSET_DOC
									AND A.COOP_ID = B.COOP_ID
								)  ,
                      A.STANDING_BALANCE = :ldc_balance_old
          WHERE A.ASSET_DOC = :ls_AssetDoc
               AND A.COOP_ID = :as_coop
            USING itr_SQLCA ;
			  
		IF ( itr_SQLCA.SQLCode <> 0 ) THEN
			ithw_exception.text	= "ไม่สามารถ ปรับปรุงการคิดค่าเสื่อมได้ " + itr_SQLCA.SqlErrText 
			ROLLBACK USING itr_SQLCA ;
			CLOSE c_CalDP ;
			throw ithw_exception
		END IF
		
	END IF

	
	FETCH c_CalDP INTO	 :ls_AssetDoc, :ldc_BeginAsset, :ll_BfAmt, :ldc_BfAmount, :ldc_Total,
							:ldc_DelAmount, :ldc_AddAmount, :ldc_SaleAmt, :ldc_StandingBal, :li_status,
							:li_CalType, :ldtm_RcvDate , :ldtm_SaleDate, :ldc_MasterDelAmount, :ldc_BalDelAll ;
							
LOOP

CLOSE c_CalDP ;

commit USING itr_SQLCA ;

RETURN 1
end function

private function integer of_add_new_dpyear (integer ai_account_year, string as_coop_id, datetime adtm_start_year, datetime adtm_end_year) throws Exception;/***********************************************
<description>
ทำรายการเพิ่มปีบัญชีใหม่ และ งวดบัญชีของปีนั้น

FXREF: AC-ACCSERVICE-of_add_newyear-0000006
</description>

<arguments>
ai_account_year		ปีบัญชี
as_coop_id				สหกรณ์/สาขาที่ทำรายการ
adtm_start_year		วันที่เริ่มปีบัญชี
adtm_end_year			วันที่สิ้นสุดปิฃีบัญชี
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน coop_id เป็น coop_id
</history>
************************************************/

integer	ll_rowfind  ,ll_row , ll_old,ll_row_detail,ll_c ,index, li_year, li_month, li_day
integer	li_period, li_account_yprev, li_period_prev, li_yearnext
String		ls_date,ls_prev
datetime	ldtm_prev, ldtm_new_begin, ldtm_new_end

li_yearnext				= ai_account_year + 1

ldtm_new_begin		= datetime( inv_datetime.of_relativeyear( date( adtm_start_year ) , 1 ) )
ldtm_new_end			= datetime( inv_datetime.of_relativeyear( date( adtm_end_year ) , 1 ) )

INSERT INTO ACC_DP_YEAR  
(	COOP_ID,				DP_YEAR,				BEGINNING_OF_DP,
	ENDING_OF_DP,     	DP_STATUS
)  
VALUES
( 	:as_coop_id,			:li_yearnext,				:ldtm_new_begin,	
	:ldtm_new_end	,		0
)  
using itr_sqlca ;



return 1
end function

private function integer of_add_first_dp (string as_coopid, integer ai_year) throws Exception;/////////////// function ยกยอดค่าเสื่อมเข้าปีถัดไป  Create By Sakuraii  03/02/2558

String ls_assetdoc
Decimal	ldc_begin, ldc_amount
Integer	li_amt, li_nextyear
long		ll_index, ll_count

datastore	lds_listdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_listdata	= create datastore
lds_listdata.dataobject	= "d_acc_list_asset"
lds_listdata.settransobject( itr_sqlca )

ll_count			= lds_listdata.retrieve(  as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

li_nextyear = ai_year + 1
	 
for ll_index = 1 to ll_count 
		
	ls_assetdoc				= lds_listdata.object.asset_doc[ ll_index ]   //รหัสทะเบียนสินทรัพย์
	ldc_begin				= lds_listdata.object.standing_balance[ ll_index ] //ยอดยกไป  = ยอดยกมาของปีถัดไป
	li_amt						= lds_listdata.object.before_amt[ ll_index ] //จำนวนสินทรัพย์
	ldc_amount				= lds_listdata.object.before_amount[ ll_index ] //ราคาทุน

	if isnull(ldc_begin) then ldc_begin = 0.00
	if isnull(li_amt) then li_amt = 0
	if isnull(ldc_amount) then ldc_amount = 0.00
	
	  INSERT INTO ACC_ASSET_YEAR
         ( COOP_ID,   	           				ASSET_DOC, 			           	ACCOUNT_YEAR,   
           BEGIN_ASSET,   			           	BEFORE_AMT,			           	BEFORE_AMOUNT,   
           TOTAL_AMOUNT,   	           		BALANCE_DEL,              			BALANCE_MONTH,   
           DELETE_AMOUNT,              		ADD_AMOUNT,              			SALE_AMOUNT,   
           STANDING_BALANCE 
		)  
  VALUES ( 
  		  :as_coopid,				           	:ls_assetdoc,              			:li_nextyear,   
           :ldc_begin,           					:li_amt,           						:ldc_amount,   
           :ldc_begin,		           				0,           							0,   
           0,           								0,              							0,   
           :ldc_begin 
		)	  using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถทำรายการ 	ยกยอดค่าเสื่อมได้ " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if


next


return 1
end function

public function integer of_close_depreciation (integer ai_year, datetime adtm_caltodate, string as_coopid) throws Exception;////////////////function การยกยอดค่าเสื่อมเข้าสู่ปีถัดไป  Edit By Sakuraii  03/02/2015

integer	li_close, li_period, li_postvc
datetime	ldtm_start_year, ldtm_end_year
string ls_year, ls_status
//ตรวจสอบสถานะข้อมูลปิดสิ้นปีค่าเสื่อม  จาก  table acc_dp_year
select		dp_status
into		:li_close
from		acc_dp_year
where	( dp_year 	= :ai_year )  and
			( coop_id		= :as_coopid ) using itr_sqlca;

if isnull( li_close ) then li_close = 0

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถตรวจสอบสถานะ ปิดสิ้นปีค่าเสื่อมได้ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

if ( li_close = 1 ) then
	ithw_exception.text	= "ไม่สามารถทำการปิดสิ้นปีค่าเสื่อมที่ได้ปิดไปแล้ว ได้ " 
	throw ithw_exception
end if

// หาวันที่สุดท้ายของการคำนวณค่าเสื่อม
this.of_get_dpyear_last_date( ai_year , is_coop_id,ldtm_start_year, ldtm_end_year )

if ( ldtm_end_year <> adtm_caltodate ) then
	ithw_exception.text	= "วันที่สุดท้ายของการคำนวณค่าเสื่อม ยังไม่ถูกประมวลผล กรุณาประมวลผลค่าเสื่อม ณ วันสิ้นปีบัญชี" 
	throw ithw_exception
end if

// เพิ่มปีบัญชีค่าเสื่อมใหม่
this.of_add_new_dpyear( ai_year, as_coopid, ldtm_start_year, ldtm_end_year )

// ยกยอดค่าเสื่อม
this.of_add_first_dp( as_coopid, ai_year )

// update สถานะยกยอดค่าเสื่อม
update	acc_dp_year
set			dp_status	= 1
where	( dp_year 	= :ai_year )  and
			( coop_id		= :as_coopid ) 
using itr_sqlca;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถอัพเดทสถานะการยกยอดค่าเสื่อมได้ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if



commit using itr_sqlca ;
return 1
end function

private function integer of_get_dpyear_last_date (integer ai_year, string as_coop_id, ref datetime adtm_date_start, ref datetime adtm_date_end) throws Exception;
select		beginning_of_dp , ending_of_dp
into		:adtm_date_start, :adtm_date_end
from		acc_dp_year
where	dp_year	= :ai_year and
			coop_id		= :as_coop_id using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถตรวจสอบวันสุดท้ายของการคำนวณค่าเสื่อมได้ " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

public function integer of_cancel_dpyear (integer ai_year, string as_coopid) throws Exception;/////////////// function ยกเลิกการปิดค่าเสื่อม  Create By Sakuraii  03/02/2558

integer	li_count

delete from acc_cal_dp
where account_year >= :ai_year
and 	 coop_id		   = :as_coopid
using itr_sqlca;

if itr_SQLCA.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถล้างข้อมูลตารางประมวลค่าเสื่อมได้ " + itr_sqlca.sqlerrtext
	rollback USING itr_SQLCA ;
	throw ithw_exception
end if

delete from acc_asset_year
where account_year >= :ai_year
and 	 coop_id		   = :as_coopid
using itr_sqlca;

if itr_SQLCA.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถล้างข้อมูลตารางบันทึกค่าเสื่อมได้ " + itr_sqlca.sqlerrtext
	rollback USING itr_SQLCA ;
	throw ithw_exception
end if

delete from acc_dp_year
where dp_year		 >= :ai_year
and 	 coop_id		   = :as_coopid
using itr_sqlca;

if itr_SQLCA.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถล้างข้อมูลตารางปีของค่าเสื่อม" + itr_sqlca.sqlerrtext
	rollback USING itr_SQLCA ;
	throw ithw_exception
end if

// update สถานะยกยอดค่าเสื่อม
update	acc_dp_year
set			dp_status	= 0
where	( dp_year 	= :ai_year - 1  )  and
			( coop_id		= :as_coopid ) 
using itr_sqlca;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถอัพเดทสถานะการปีของค่าเสื่อมได้ " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

return 1
end function

public function integer of_process_member_balance (integer ai_year, integer ai_period, string as_coopid);integer	li_year, li_period,li_found, li_mem_out_n , li_mem_out_s
integer	 li_member_n, li_member_nt , li_member_s, li_member_out_n, li_member_out_s, li_member_die_n, li_member_die_s
integer	li_mem_loan, li_mem_loan_s, li_mem_loan_n, li_mem_loan_e, li_year_1, li_month_1
long		ll_membergin, ll_smembegin, ll_memall_n, ll_memall_s, li_mem_sloan
datetime	ldtm_start, ldtm_end
string 	ls_clsmth

li_year	= ai_year
li_period	= ai_period


SELECT	PERIOD_END_DATE
INTO		:ldtm_end
FROM		ACCPERIOD
WHERE	( ACCOUNT_YEAR	= :ai_year ) AND  
			( PERIOD	= :ai_period )   using itr_sqlca;

ldtm_start	= datetime( date( year( date( ldtm_end ) ), month( date( ldtm_end ) ), 1  ) )
li_year_1	= year( date( ldtm_start ) ) + 543
li_month_1	= month( date( ldtm_start ) )

ls_clsmth 	= string(li_year_1) + right( '00'+ string(li_month_1),2 )

if ( ai_period = 1 ) then
	li_period		= 12
	li_year		= li_year - 1
else
	li_period		= li_period - 1
end if

//// ยอดยกมาเดือนที่แล้ว
//SELECT	MEMBER_BEGIN,  	MEMBER_SOMTOB
//INTO		:ll_membergin,		:ll_smembegin
//FROM		ACC_TRILEBALANCE
//WHERE	(	ACCOUNT_YEAR	= :li_year ) AND  
			//(	PERIOD				= :li_period )   using itr_sqlca;
//
//if isnull( ll_membergin ) then ll_membergin = 0
//if isnull( ll_smembegin ) then ll_smembegin = 0

// ลบแถวก่อน Insert
delete from acc_trilebalance
where 	(	ACCOUNT_YEAR	= :ai_year ) AND  
		(	PERIOD			= :ai_period )    
using itr_sqlca;



	// หายอดสมาชิกเข้าใหม่ สามัญ
	SELECT	count(  MEMBER_NO )
	INTO		:li_member_n
	FROM		MBMEMBMASTER
	WHERE	( MEMBER_DATE	between :ldtm_start and :ldtm_end ) AND  
				(  MEMBER_TYPE	= 1 )    using itr_sqlca;
	
	
	//สมาชิกเข้าใหม่โดยการโอนย้านสถานะ สามัญ 
	
	select count(memnew_no) 
	INTO :li_member_nt
	from mbreqtranmb 
	where apv_date between :ldtm_start and :ldtm_end  using itr_sqlca;
	
	//หายอดเข้าใหม่สามัญ ทั้งหมด
	if isnull(li_member_nt) then li_member_nt = 0
	li_member_n = li_member_n + li_member_nt
	
	
	// หายอดสมาชิกเข้าใหม่ สมทบ
	SELECT	count(  MEMBER_NO )
	INTO		:li_member_s
	FROM		MBMEMBMASTER
	WHERE	( MEMBER_DATE	between :ldtm_start and :ldtm_end ) AND  
				(  MEMBER_TYPE	= 2  )    using itr_sqlca;
				
		
				
	// หายอดสมาชิกลาออก สามัญ
	//SELECT	count( RESIGNREQ_DOCNO )  
	//INTO		:li_member_out_n
	//FROM		MBREQRESIGN,		MBMEMBMASTER  
	//WHERE	( MBREQRESIGN.MEMBER_NO				= MBMEMBMASTER.MEMBER_NO ) and  
				//( MBREQRESIGN.APV_DATE					between :ldtm_start and :ldtm_end  ) AND  
				//( MBREQRESIGN.RESIGNREQ_STATUS	= 1 ) AND  
				//( MBREQRESIGN.resigncause_code		<> '03') and
				//( MBMEMBMASTER.MEMBER_TYPE		= 1 )   using itr_sqlca;
	SELECT		count(  MEMBER_NO )
	INTO		:li_member_out_n
	FROM		MBMEMBMASTER
	WHERE		( RESIGN_DATE	between :ldtm_start and :ldtm_end ) AND  
				( RESIGNCAUSE_CODE	<> '03' ) AND
				( RESIGN_STATUS = 1 ) AND
				(  MEMBER_TYPE	= 1  )    using itr_sqlca;
				
	
	// หายอดสมาชิกลาออก สมทบ
	//SELECT	count( RESIGNREQ_DOCNO )  
	//INTO		:li_member_out_s
	//FROM		MBREQRESIGN,		MBMEMBMASTER  
	//WHERE	( MBREQRESIGN.MEMBER_NO				= MBMEMBMASTER.MEMBER_NO ) and  
				//( ( MBREQRESIGN.APV_DATE				between :ldtm_start and :ldtm_end  ) AND  
				//( MBREQRESIGN.RESIGNREQ_STATUS	= 1 ) AND  
				//(MBREQRESIGN.resigncause_code			<> '03') and
				//( MBMEMBMASTER.MEMBER_TYPE		= 2 )   )    using itr_sqlca;
	SELECT		count(  MEMBER_NO )
	INTO		:li_member_out_s
	FROM		MBMEMBMASTER
	WHERE		( RESIGN_DATE	between :ldtm_start and :ldtm_end ) AND  
				( RESIGNCAUSE_CODE	<> '03' ) AND
				( RESIGN_STATUS = 1 ) AND
				(  MEMBER_TYPE	= 2  )    using itr_sqlca;
				
	// หายอดสมาชิกลาออก สามัญ(ตาย)
	//SELECT	count( RESIGNREQ_DOCNO )  
	//INTO		:li_member_die_n
	//FROM		MBREQRESIGN,		MBMEMBMASTER  
	//WHERE	( MBREQRESIGN.MEMBER_NO				= MBMEMBMASTER.MEMBER_NO ) and  
				//( ( MBREQRESIGN.APV_DATE				between :ldtm_start and :ldtm_end  ) AND  
				//( MBREQRESIGN.RESIGNREQ_STATUS	= 1 ) AND  
				//(MBREQRESIGN.resigncause_code			= '03') and
				//( MBMEMBMASTER.MEMBER_TYPE		= 1 )	)    using itr_sqlca;
	SELECT		count(  MEMBER_NO )
	INTO		:li_member_die_n
	FROM		MBMEMBMASTER
	WHERE		( RESIGN_DATE	between :ldtm_start and :ldtm_end ) AND  
				( RESIGNCAUSE_CODE	= '03' ) AND
				( RESIGN_STATUS = 1 ) AND
				( MEMBER_TYPE	= 1  )    using itr_sqlca;
				
	// หายอดสมาชิกลาออก สมทบ(ตาย)
	//SELECT	count( RESIGNREQ_DOCNO )  
	//INTO		:li_member_die_s
	//FROM		MBREQRESIGN,		MBMEMBMASTER  
	//WHERE	( MBREQRESIGN.MEMBER_NO				= MBMEMBMASTER.MEMBER_NO ) and  
				//( ( MBREQRESIGN.APV_DATE				between :ldtm_start and :ldtm_end   ) AND  
				//( MBREQRESIGN.RESIGNREQ_STATUS	= 1 ) AND  
				//(MBREQRESIGN.resigncause_code			= '03') and
				//( MBMEMBMASTER.MEMBER_TYPE		= 2 )   )    using itr_sqlca;
	SELECT		count(  MEMBER_NO )
	INTO		:li_member_die_s
	FROM		MBMEMBMASTER
	WHERE		( RESIGN_DATE	between :ldtm_start and :ldtm_end ) AND  
				( RESIGNCAUSE_CODE	= '03' ) AND
				( RESIGN_STATUS = 1 ) AND
				(  MEMBER_TYPE	= 2  )    using itr_sqlca;
				
	//// หายอดสมาชิกเป็นหนี้ รวม
	//SELECT	count( DISTINCT  MEMBER_NO   )
	//into		:li_mem_loan
	//FROM		slclsmthbalance   
	//where	( bizz_system		 = 'LON' )  and
				//( balance_value	 > 0 ) and
				//( clsmth_period		= :ls_clsmth )     using itr_sqlca;
	
	// หายอดสมาชิกเป็นหนี้ พิเศษ
	SELECT	count( distinct  sl.member_no   )
	into		:li_mem_loan_s
	FROM		slclsmthbalance sl , lnloantype ln  
	where	( sl.coop_id	= 	ln.coop_id ) and
				( sl.bizztype_code	= ln.loantype_code ) and
				( ln.loangroup_code = '03' ) and
				( sl.bizz_system		 = 'LON' )  and
				( sl.balance_value	 > 0 ) and
				( sl.clsmth_period		= :ls_clsmth )     using itr_sqlca;
	
	// หายอดสมาชิกเป็นหนี้ สามัญ
	SELECT	count( distinct  sl.member_no   )
	into		:li_mem_loan_n
	FROM		slclsmthbalance sl , lnloantype ln  
	where	( sl.coop_id	= 	ln.coop_id ) and
				( sl.bizztype_code	= ln.loantype_code ) and
				( ln.loangroup_code = '02' ) and
				( sl.bizz_system		 = 'LON' )  and
				( sl.balance_value	 > 0 ) and
				( sl.clsmth_period		= :ls_clsmth )     using itr_sqlca;
	
	// หายอดสมาชิกเป็นหนี้ ฉุกเฉิน
	SELECT	count( distinct  sl.member_no   )
	into		:li_mem_loan_e
	FROM		slclsmthbalance sl , lnloantype ln  
	where	( sl.coop_id	= 	ln.coop_id ) and
				( sl.bizztype_code	= ln.loantype_code ) and
				( ln.loangroup_code = '01' ) and
				( sl.bizz_system		 = 'LON' )  and
				( sl.balance_value	 > 0 ) and
				( sl.clsmth_period		= :ls_clsmth )     using itr_sqlca;
	
	// สมาชิกทั้งหมด สามัญ
	
	SELECT	count( DISTINCT member_no )
	into	:ll_memall_n
	from	mbmembmaster  
	where	coop_id = :as_coopid and
			resign_status = 0 and
			member_date <= :ldtm_end and
			member_type = 1 using itr_sqlca;
			
			
	//กรณีคำนวณเดือนย้อนหลัง ต้องเอายอดลาออกของเดือนก่อนหน้ามารวมกับจำนวน สมาชิกเดือนนี้ด้วย
	SELECT		count(  MEMBER_NO )
	INTO		:li_mem_out_n
	FROM		MBMEMBMASTER
	WHERE		( RESIGN_DATE	> :ldtm_end ) AND  
				( RESIGN_STATUS = 1 ) AND
				(  MEMBER_TYPE	= 1  )    using itr_sqlca;
				
	if isnull(ll_memall_n) then ll_memall_n = 0
	if isnull(li_mem_out_n) then li_mem_out_n = 0
	
	//ยอดสุทธิ
	ll_memall_n = ll_memall_n + long(li_mem_out_n) - long(li_member_nt)
	
	
	// สมาชิกทั้งหมด สมทบ
	SELECT	count( DISTINCT member_no )
	into	:ll_memall_s
	from	mbmembmaster  
	where	coop_id = :as_coopid and
			resign_status = 0 and
			member_date <= :ldtm_end and
			member_type = 2 using itr_sqlca;
	//กรณีคำนวณเดือนย้อนหลัง ต้องเอายอดลาออกของเดือนก่อนหน้ามารวมกับจำนวน สมาชิกเดือนนี้ด้วย
	SELECT		count(  MEMBER_NO )
	INTO		:li_mem_out_s
	FROM		MBMEMBMASTER
	WHERE		( RESIGN_DATE	> :ldtm_end ) AND  
				( RESIGN_STATUS = 1 ) AND
				(  MEMBER_TYPE	= 2  )    using itr_sqlca;
				
	if isnull(ll_memall_s) then ll_memall_s = 0
	if isnull(li_mem_out_s) then li_mem_out_s = 0
	
	//ยอดสุทธิ
	ll_memall_s = ll_memall_s + long(li_mem_out_s)
				
	// หายอดสมาชิกเป็นหนี้ สมทบ
	SELECT	count( DISTINCT  slclsmthbalance.member_no   )
	into	:li_mem_sloan
	FROM	slclsmthbalance, mbmembmaster   
	where	( slclsmthbalance.member_no			= mbmembmaster.member_no) and
			( mbmembmaster.member_type			= 2 ) and
			( slclsmthbalance.bizz_system		 = 'LON' )  and
			( slclsmthbalance.balance_value		> 0 ) and
			( slclsmthbalance.clsmth_period		= :ls_clsmth )     using itr_sqlca;
			
	// หายอดสมาชิกเป็นหนี้ สามัญ
	SELECT	count( DISTINCT  slclsmthbalance.member_no   )
	into	:li_mem_loan
	FROM	slclsmthbalance, mbmembmaster   
	where	( slclsmthbalance.member_no			= mbmembmaster.member_no) and
			( mbmembmaster.member_type			= 1 ) and
			( slclsmthbalance.bizz_system		 = 'LON' )  and
			( slclsmthbalance.balance_value		> 0 ) and
			( slclsmthbalance.clsmth_period		= :ls_clsmth )     using itr_sqlca;


	INSERT INTO ACC_TRILEBALANCE  
	(		COOP_ID,						ACCOUNT_YEAR,			PERIOD,						MEMBER_BEGIN,   
			MEMBER_IN,						MEMBER_GETOUT,			LOAN_MEMBER,				MEMBER_SOMTOB,   
			IN_SOMTOB,						OUT_SOMTOB,				MEMBER_DIE,					DIE_SOMTOB,   
			LOAN_SMEMBER,					LOAN_NMEMBER,			LOAN_EMEMBER,				LOAN_SOMTOB
	)  
	VALUES
	( 		:as_coopid,						:ai_year,				:ai_period,					:ll_memall_n,
			:li_member_n,					:li_member_out_n,		:li_mem_loan,				:ll_memall_s,
			:li_member_s,					:li_member_out_s,		:li_member_die_n,			:li_member_die_s,
			:li_mem_loan_s,					:li_mem_loan_n,			:li_mem_loan_e,				:li_mem_sloan
	 )  using itr_sqlca;
	 
	 commit using itr_sqlca;

return 1
end function

public function integer of_gen_trial_bs_coop (string as_choose_report_xml, string as_coop_id, ref string as_trial_report_xml) throws Exception;integer	li_index ,li_period ,li_year, li_rc, li_sum_flag,li_period_end ,li_year_end, ll_index
string		ls_account_id ,ls_account_control_id ,ls_check_flag,ls_filter, ls_acc_ctrl_name
string		ls_account_nature,ls_account_rev_group,ls_account_group_id,ls_account_name, ls_section_id
dec{2}  	ldc_begin_dr,ldc_begin_cr, ldc_sumall, ldc_sumdr,ldc_sumcr ,ldc_begin_beforedate
integer 	ll_last,li_account_sort , li_insertrow, li_headstatus,li_seq_no, li_report_select
datetime	ldt_journal_date, ldtm_start,ldtm_startdate, ldtm_enddate
dec{2}	ldc_sumalldr,	ldc_sumallcr, ldc_dr, ldc_cr, ldc_sumdr_adj, ldc_sumcr_adj, ldc_forward_dr, ldc_forward_cr
integer	li_typeaccid, li_onreport, li_found, li_report_sort, li_temp
dec{2}	ldc_begin_pf, ldc_dramt_pf, ldc_cramt_pf

n_ds  lds_accmaster, lds_trial_bs, lds_choose_for_report , lds_bs_report

lds_accmaster = create n_ds
lds_accmaster.dataobject = "dw_acc_mth20_accmaster_for_estimatesum"
lds_accmaster.settransobject(itr_sqlca)

lds_trial_bs = create n_ds
lds_trial_bs.dataobject = "r_mth20_trilebalance_detail_a4land_coop_f5"

ll_last = lds_accmaster.retrieve(as_coop_id)

lds_choose_for_report	= create n_ds
lds_choose_for_report.dataobject = "d_ac_cri_for_gen_bs_coop"

if not  isnull( as_choose_report_xml ) and trim( as_choose_report_xml ) <> ""  then
	li_rc	= lds_choose_for_report.importstring( XML!, as_choose_report_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

ldtm_startdate		= lds_choose_for_report.getitemdatetime(1,"start_date")
ldtm_enddate		= lds_choose_for_report.getitemdatetime(1,"end_date")
ls_check_flag		= lds_choose_for_report.getitemstring(1,"check_flag") 
li_seq_no			= lds_choose_for_report.object.seq_no[1]	
li_report_select		= lds_choose_for_report.object.on_report[1]	

this.of_get_year_period( ldtm_startdate, as_coop_id, li_year, li_period  )
this.of_get_year_period( ldtm_enddate, as_coop_id, li_year_end, li_period_end  )

// วันเริ่มต้นงวด
ldtm_start		= datetime( date( year( date( ldtm_startdate ) ), month( date( ldtm_startdate ) ), 1  ) )

li_headstatus	= this.of_is_headquater( as_coop_id )

li_report_sort	= ll_last
li_temp			= 0

//วนรอบทุก ๆบัญชี
For li_index  = 1 to ll_last
	lds_trial_bs.accepttext()
	
	ldc_sumall				= 0.0
	ldc_sumdr				= 0.0
	ldc_sumcr				= 0.0 ;
	ldc_begin_dr			= 0.0 ;	ldc_begin_cr			= 0.0
	ldc_begin_beforedate = 0.0 ;	ldc_sumalldr			= 0.0
	ldc_sumallcr				= 0.0
	
	ls_account_id	= ""
	ls_account_name			= ""
	
	ls_account_id				= trim( lds_accmaster.object.account_id[ li_index ] )
	ls_account_name			= trim( lds_accmaster.object.account_name[ li_index ] )
	ls_account_group_id		= trim( lds_accmaster.object.account_group_id[ li_index ] )
	ls_account_rev_group		= trim( lds_accmaster.object.account_rev_group[ li_index ] )
	ls_account_nature			= trim( lds_accmaster.object.account_nature[ li_index ] )
	li_account_sort				= lds_accmaster.object.account_sort[ li_index ]
	ls_account_control_id		= trim( lds_accmaster.object.account_control_id[ li_index ] )
	ls_section_id				= trim( lds_accmaster.object.section_id[ li_index ] )
	li_typeaccid					= integer( trim(  lds_accmaster.object.account_type_id[ li_index ] ) )
	li_onreport					= lds_accmaster.object.on_report[ li_index ]
	ls_acc_ctrl_name			= trim( lds_accmaster.object.group_account_name[ li_index ] )
	
	
	if isnull( ls_account_control_id ) then ls_account_control_id = ls_account_id
	if isnull( ls_acc_ctrl_name ) then ls_acc_ctrl_name = ls_account_name
			
//	lnv_progress.of_stepit( "จัดทำงบรหัสบัญชีที่ " + trim( ls_account_id ) , li_index )
	
//	li_report_sort	= ll_last - li_index
	
	// หายกมาต้นงวดปีบัญชี
if ( li_period = 1 ) and ( ( trim( ls_account_group_id ) = '4' ) or ( trim( ls_account_group_id ) = '5' ) ) then
		ldc_begin_beforedate			= 0
	else
		if ( li_period = 1 ) and ( li_headstatus = 0 ) then
			ldc_begin_beforedate		= 0
		else
			ldc_begin_beforedate		= this.of_get_balance_begin( ls_account_id , ldtm_startdate, as_coop_id )
		end if		

	end if
	
	ldc_dr	= 0.00
	ldc_cr	= 0.00

	// ยอดสะสมก่อนงวดเดือนปัจจุบัน
	if ( date( ldtm_startdate ) <> date( ldtm_start ) ) then
		
		if ( li_period = 1 ) then
			this.of_get_sum_drcr( ldtm_start , ldtm_startdate , ls_account_id , as_coop_id,   ldc_dr , ldc_cr  )			
		else
			this.of_get_sum_drcr( ldtm_start , ldtm_startdate , ls_account_id, as_coop_id,   ldc_dr , ldc_cr  ,1 )			
		end if
		
		if isnull( ldc_dr ) then ldc_dr = 0.00
		if isnull( ldc_cr ) then ldc_cr = 0.00
		
	end if

	// ยอดสะสมงวดเดือนปัจจุบัน
//	if ( li_sum_flag = 1 ) then
//		inv_acc_get_sum.of_get_sum_between_drcr( ldtm_start , ldtm_enddate , ls_account_id , as_coop_id,   ldc_sumdr , ldc_sumcr,1 )
//	else
		if ( li_period = 1 ) then
			this.of_get_sum_between_drcr( ldtm_startdate , ldtm_enddate , ls_account_id ,    ldc_sumdr , ldc_sumcr, as_coop_id )				
		else
			this.of_get_sum_between_drcr( ldtm_startdate , ldtm_enddate , ls_account_id , as_coop_id,   ldc_sumdr , ldc_sumcr,1 )
		end if
//	end if

	if isnull( ldc_sumdr ) then ldc_sumdr = 0.0
	if isnull( ldc_sumcr ) then ldc_sumcr = 0.0
	
	ldc_begin_beforedate		= ldc_begin_beforedate + ( ldc_dr - ldc_cr  )
	ldc_begin_pf				= 0.00
	ldc_dramt_pf				= 0.00
	ldc_cramt_pf				= 0.00
	
	if ( ls_account_id = is_account_pl_pf ) then
		if ( li_sum_flag = 1 ) then
			this.of_pf(   li_year_end, li_period_end , 1 , as_coop_id, ldc_begin_pf ,  ldc_dramt_pf  , ldc_cramt_pf  )
		else
			this.of_pf(  li_year, li_period , 0 ,as_coop_id,ldc_begin_pf ,  ldc_dramt_pf  , ldc_cramt_pf  )
		end if
		
		
	end if
	
	ldc_begin_beforedate		= ldc_begin_beforedate + ( -ldc_begin_pf  )
	ldc_sumdr					= ldc_sumdr + ldc_dramt_pf
	ldc_sumcr					= ldc_sumcr + ldc_cramt_pf
	
	// นำยอด รวมฝั่ง DR ตั้งลบด้วย ยอดรวมฝั่ง CR อล้วบวกเพิ่มด้วย ยอดยกมา
	ldc_sumall		= ( ldc_sumdr - ldc_sumcr ) + ldc_begin_beforedate	
	
	// ตรวจสอบผลลัพธ์ที่ได้
	choose case ldc_sumall
		case is > 0 // หากยอดรวมทั้งหมด มีค่าเป็น +
			ldc_sumalldr	= ldc_sumall
			
		case is < 0 // หากยอดรวมทั้งหมด มีค่าเป็น -
			ldc_sumallcr		= abs( ldc_sumall )
			
		case else // หากยอดรวมทั้งหมด มีค่าเป็น 0
			ldc_sumallcr		= 0
			ldc_sumalldr	= 0
			
	end choose

	// หากฝั่งบัญชีปกติ อยู่ฝั่ง DR แต่มีค่าติดลบ
	if ( ls_account_nature = 'DR' ) and ( ldc_sumall < 0 )  then
		ls_account_group_id = ls_account_rev_group
	end if
	
	choose case ldc_begin_beforedate
		case is > 0 
			ldc_begin_dr	= ldc_begin_beforedate 
			
		case is < 0 
			ldc_begin_cr	= abs( ldc_begin_beforedate )
			
		case else 
			ldc_begin_cr	= 0
			ldc_begin_dr	= 0 
			
	end choose

	if (ls_account_nature= 'DR') and ( ldc_sumall < 0 ) then
		ls_account_group_id	= ls_account_rev_group
	end if	

//	BeGinInsert:

	//insert ข้อมูลใส่ table 	accsumledgerdate ไว้ก่อนแล้วค่อย show ใน datawindow ทีหลัง

	li_insertrow	= lds_trial_bs.insertrow( 0 )
	lds_trial_bs.Setitem( li_insertrow, "account_id", ls_account_id )
	lds_trial_bs.Setitem( li_insertrow, "journal_d", ldt_journal_date )
	lds_trial_bs.Setitem( li_insertrow, "desc_journal_detai", ls_account_name )
	lds_trial_bs.Setitem( li_insertrow, "dr_amount", ldc_sumdr )
	lds_trial_bs.Setitem( li_insertrow, "cr_amount", ldc_sumcr )
	lds_trial_bs.Setitem( li_insertrow, "group_id", ls_account_group_id )
	lds_trial_bs.Setitem( li_insertrow, "begin_cr", ldc_begin_cr )
	lds_trial_bs.Setitem( li_insertrow, "begin_dr", ldc_begin_dr )
	lds_trial_bs.Setitem( li_insertrow, "forward_cr", ldc_sumallcr )
	lds_trial_bs.Setitem( li_insertrow, "forward_dr", ldc_sumalldr )
	lds_trial_bs.Setitem( li_insertrow, "account_sort", li_account_sort )
	lds_trial_bs.Setitem( li_insertrow, "control_id", ls_account_control_id )
	
	lds_trial_bs.Setitem( li_insertrow, "sumbf_cr", 0 )
	lds_trial_bs.Setitem( li_insertrow, "sumbf_dr", 0 )
	lds_trial_bs.Setitem( li_insertrow, "section_id", ls_section_id )
	
	lds_trial_bs.Setitem( li_insertrow, "acc_typeaccid", li_typeaccid )
	lds_trial_bs.Setitem( li_insertrow, "on_report", li_onreport )
	lds_trial_bs.Setitem( li_insertrow, "report_sort", li_report_sort )
	lds_trial_bs.Setitem( li_insertrow, "acc_ctrl_name", ls_acc_ctrl_name )
next

li_seq_no		= lds_choose_for_report.object.seq_no[1]	
li_onreport		= lds_choose_for_report.object.on_report[1]	

ls_filter	= "(  ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amount >0 ) or ( cr_amount >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) or ( sumbf_dr  >0 ) or ( sumbf_cr >0 ) ) "

choose case li_onreport
	case 1
		ls_filter	= ls_filter + " and ( on_report = 1 ) and ( acc_typeaccid = 3 ) "
	
	case 2
		ls_filter	= ls_filter + " and ( on_report = 1 ) and ( acc_typeaccid < 3 ) "
		
	case 3, 4
		ls_filter	= ls_filter + " and ( on_report = 1 ) "
		
	case else
		ls_filter	= ls_filter + " and ( on_report = 1 ) and ( acc_typeaccid = 3 ) "
		
end choose

if li_seq_no = 1 then
	lds_trial_bs.setsort( "report_sort A, group_id A, control_id A , account_id A" )
else
	lds_trial_bs.setsort( "report_sort A, group_id A, control_id A , account_sort A,  account_id A" )
end if

lds_trial_bs.sort( )

lds_trial_bs.SetFilter( ls_filter )
lds_trial_bs.Filter()

lds_trial_bs.Groupcalc( )

lds_trial_bs.accepttext( )

///////////////////////////////////////////////////////////////////////////////////////////ยิงข้อมูลลงเบส////////////////////////////////////////////////
as_trial_report_xml	= lds_trial_bs.describe( "Datawindow.data.XML" )

lds_bs_report		= create n_ds
lds_bs_report.dataobject = "r_mth20_trilebalance_detail_report"

if not  isnull( as_trial_report_xml ) and trim( as_trial_report_xml ) <> ""  then
	li_rc	= lds_bs_report.importstring( XML!, as_trial_report_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

// ถ้าไม่มีรายการออกไป
if li_rc <= 0 then
	return 1
end if

//ลบข้อมูลเก่าทิ้ง
delete from accreporttrilecoop
where coop_id = :as_coop_id
using itr_sqlca;
commit using itr_sqlca;

for ll_index = 1 to li_rc
	ldc_begin_dr		= lds_bs_report.object.begin_dr[ ll_index ]
	ldc_begin_cr		= lds_bs_report.object.begin_cr[ ll_index ]
	ldc_dr					= lds_bs_report.object.dr_amount[ ll_index ]
	ldc_cr					= lds_bs_report.object.cr_amount[ ll_index ]
	ldc_forward_dr		= lds_bs_report.object.forward_dr[ ll_index ]
	ldc_forward_cr		= lds_bs_report.object.forward_cr[ ll_index ]
	ls_account_id		= lds_bs_report.object.account_id[ ll_index ] 
	
	if isnull( ldc_begin_dr ) then ldc_begin_dr = 0.00
	if isnull( ldc_begin_cr ) then ldc_begin_cr = 0.00
	if isnull( ldc_dr ) then ldc_dr = 0.00
	if isnull( ldc_cr ) then ldc_cr = 0.00
	if isnull( ldc_forward_dr ) then ldc_forward_dr = 0.00
	if isnull( ldc_forward_cr ) then ldc_forward_cr = 0.00
	

	
	INSERT INTO ACCREPORTTRILECOOP
         ( 
		  ACCOUNT_YEAR,              				PERIOD,              				ACCOUNT_ID,   
           COOP_ID,   							         DR_AMOUNT,   		         CR_AMOUNT,   
           BEGIN_DR_AMOUNT,   				         BEGIN_CR_AMOUNT,           FORWARD_DR_AMOUNT,   
           FORWARD_CR_AMOUNT 
		)  
  VALUES ( 
  		:li_year,   								         :li_period,   						:ls_account_id,
         :as_coop_id,   									:ldc_dr,							:ldc_cr,
         :ldc_begin_dr,									:ldc_begin_cr,					:ldc_forward_dr,
		:ldc_forward_cr
		 )  using itr_sqlca ;
		 
 if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลได้ กรุณาตรวจสอบ "   + itr_sqlca.sqlerrtext
			rollback using itr_sqlca;
			throw ithw_exception
	end if
	
next

return 1
end function

private function integer of_pf (integer ai_year, integer ai_period, integer ai_choose, string as_coopid, ref decimal adc_pl_begin, ref decimal adc_pl_dr, ref decimal adc_pl_cr);integer	ll_count , i ,ll_year  , ll_return , ll_prv_year,ll_period
datetime	ldtm_period_date
dec{2}	ldc_dr,ldc_cr
dec{2}	ldc_fw_dr_rec,ldc_fw_cr_rec,ldc_fw_dr_pay,ldc_fw_cr_pay ,ldc_total_rec,ldc_total_pay ,ldc_total
//โอน บัญชีกำไรสุทธิ to บัญชีกำไรขาดทุน ในงบทดลองเดือนสุดท้าย

ll_year	= ai_year

if ( ai_choose = 0 ) then
	ll_period	= ai_period
else
	ll_period	= 1
end if


SELECT	sum(accsumledgerperiod.begin_dr_amount),   
			sum(accsumledgerperiod.begin_cr_amount)
INTO		:ldc_fw_dr_rec,   
			:ldc_fw_cr_rec
FROM		accmaster, accsumledgerperiod  
WHERE  	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
			( ( accsumledgerperiod.account_year	= :ll_year ) AND  
			( accsumledgerperiod.period			= :ll_period ) AND  
			( accmaster.account_group_id			= '4 ' ) )  and
			( accsumledgerperiod.coop_id		= :as_coopid ) 
using itr_sqlca;

if isnull( ldc_fw_dr_rec ) then ldc_fw_dr_rec = 0.00
if isnull( ldc_fw_cr_rec ) then ldc_fw_cr_rec = 0.00

ldc_total_rec	= ldc_fw_cr_rec - ldc_fw_dr_rec

//ค่าใช้จ่าย
SELECT	sum(accsumledgerperiod.begin_dr_amount),   
			sum(accsumledgerperiod.begin_cr_amount)
INTO		:ldc_fw_dr_pay,   
			:ldc_fw_cr_pay
FROM		accmaster,   
			accsumledgerperiod  
WHERE		( accsumledgerperiod.account_id		= accmaster.account_id ) and  
			( ( accsumledgerperiod.account_year	= :ll_year ) AND  
			( accsumledgerperiod.period			= :ll_period ) AND  
			( accmaster.account_group_id			= '5 ' ) ) and
			( accsumledgerperiod.coop_id		= :as_coopid ) 
using itr_sqlca;

if isnull( ldc_fw_dr_pay ) then ldc_fw_dr_pay = 0.00
if isnull( ldc_fw_cr_pay ) then ldc_fw_cr_pay = 0.00

ldc_total_pay	= ldc_fw_dr_pay - ldc_fw_cr_pay

// ยกมา
adc_pl_begin		= ldc_total_rec - ldc_total_pay

//===============================================
ldc_fw_dr_rec	= 0.00
ldc_fw_cr_rec	= 0.00
ldc_fw_dr_pay	= 0.00
ldc_fw_cr_pay	= 0.00
ldc_total_rec	= 0.00
ldc_total_pay	= 0.00

if ( ai_choose = 0 ) then
	SELECT	sum(accsumledgerperiod.dr_amount),   
				sum(accsumledgerperiod.cr_amount)
	INTO		:ldc_fw_dr_rec,   
				:ldc_fw_cr_rec
	FROM		accmaster, accsumledgerperiod  
	WHERE  	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
				( ( accsumledgerperiod.account_year	= :ll_year ) AND  
				( accsumledgerperiod.period			= :ll_period ) AND  
				( accmaster.account_group_id			= '4 ' ) )  and
				( accsumledgerperiod.coop_id		= :as_coopid ) 
	using itr_sqlca;
	
	SELECT	sum(accsumledgerperiod.dr_amount),   
			sum(accsumledgerperiod.cr_amount)
	INTO		:ldc_fw_dr_pay,   
				:ldc_fw_cr_pay
	FROM		accmaster,   
				accsumledgerperiod  
	WHERE	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
				( ( accsumledgerperiod.account_year	= :ll_year ) AND  
				( accsumledgerperiod.period			= :ll_period ) AND  
				( accmaster.account_group_id			= '5 ' ) ) and
				( accsumledgerperiod.coop_id		= :as_coopid )
	using itr_sqlca;
			
else
	SELECT	sum(accsumledgerperiod.dr_amount),   
				sum(accsumledgerperiod.cr_amount)
	INTO		:ldc_fw_dr_rec,   
				:ldc_fw_cr_rec
	FROM		accmaster, accsumledgerperiod  
	WHERE  	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
				( ( accsumledgerperiod.account_year	= :ll_year ) AND  
				( accsumledgerperiod.period			<= :ai_period ) AND  
				( accmaster.account_group_id			= '4 ' ) )  and
				( accsumledgerperiod.coop_id		= :as_coopid )
	using itr_sqlca;
				
	SELECT	sum(accsumledgerperiod.dr_amount),   
				sum(accsumledgerperiod.cr_amount)
	INTO		:ldc_fw_dr_pay,   
				:ldc_fw_cr_pay
	FROM		accmaster,   
				accsumledgerperiod  
	WHERE	( accsumledgerperiod.account_id		= accmaster.account_id ) and  
				( ( accsumledgerperiod.account_year	= :ll_year ) AND  
				( accsumledgerperiod.period			<= :ai_period ) AND  
				( accmaster.account_group_id			= '5 ' ) ) and
				( accsumledgerperiod.coop_id		= :as_coopid ) 
	using itr_sqlca;
				
end if

if isnull( ldc_fw_dr_rec ) then ldc_fw_dr_rec = 0.00
if isnull( ldc_fw_cr_rec ) then ldc_fw_cr_rec = 0.00
if isnull( ldc_fw_dr_pay ) then ldc_fw_dr_pay = 0.00
if isnull( ldc_fw_cr_pay ) then ldc_fw_cr_pay = 0.00

ldc_total_rec	= ldc_fw_cr_rec - ldc_fw_dr_rec
ldc_total_pay	= ldc_fw_dr_pay - ldc_fw_cr_pay

// กำไรระหว่างงวด
adc_pl_cr		= ldc_total_rec - ldc_total_pay

if ( adc_pl_cr < 0 ) then
	adc_pl_dr		= abs( adc_pl_cr )
	adc_pl_cr		= 0.00
end if

return 1
end function

public function integer of_gen_trial_bs2 (datetime adtm_start_date, datetime adtm_end_date, string as_check_flag, string as_coop_id) throws Exception;integer	li_index ,li_period ,li_year, li_rc
string		ls_account_id ,ls_account_control_id ,ls_check_flag,ls_filter, ls_account_control_2level
string		ls_account_nature,ls_account_rev_group,ls_account_group_id,ls_account_name,as_trial_report_xml
dec{2}  	ldc_begin_dr,ldc_begin_cr, ldc_sumall, ldc_sumdr,ldc_sumcr ,ldc_begin_beforedate
integer 	ll_last,li_account_sort , li_insertrow, li_headstatus,li_seq_no, li_report_select
datetime	ldt_journal_date, ldtm_start,ldtm_startdate, ldtm_enddate
dec{2}	ldc_sumalldr,	ldc_sumallcr, ldc_dr, ldc_cr, ldc_sumdr_adj, ldc_sumcr_adj, ldc_profit_month, ldc_profit_year
integer	li_typeaccid, li_onreport, li_found, li_report_sort, li_temp
long		 ll_index   //**

n_ds  lds_accmaster, lds_trial_bs, lds_choose_for_report, lds_bs_report //**

lds_accmaster = create n_ds
lds_accmaster.dataobject = "d_acc_accmaster_for_trail_bs_service"
lds_accmaster.settransobject(itr_sqlca)

lds_trial_bs = create n_ds
lds_trial_bs.dataobject = "d_acc_rpt_trilebalance_detail_14_service"

ll_last = lds_accmaster.retrieve(as_coop_id)

//lds_choose_for_report	= create n_ds
//lds_choose_for_report.dataobject = "d_ac_cri_for_gen_bs"

//if not  isnull( as_choose_report_xml ) and trim( as_choose_report_xml ) <> ""  then
	//li_rc	= lds_choose_for_report.importstring( XML!, as_choose_report_xml )
	//if ( li_rc < 0 ) then
		//ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		//throw ithw_exception
	//end if
//end if

ldtm_startdate		= adtm_start_date
ldtm_enddate		= adtm_end_date
ls_check_flag		= as_check_flag
//li_seq_no			= lds_choose_for_report.object.seq_no[1]	
//li_report_select		= lds_choose_for_report.object.on_report[1]	

this.of_get_year_period( ldtm_startdate, as_coop_id, li_year, li_period  )

// วันเริ่มต้นงวด
ldtm_start		= datetime( date( year( date( ldtm_startdate ) ), month( date( ldtm_startdate ) ), 1  ) )

li_headstatus	= this.of_is_headquater( as_coop_id )

li_report_sort	= ll_last
li_temp			= 0

//วนรอบทุก ๆบัญชี
For li_index  = 1 to ll_last
	lds_trial_bs.accepttext()
	
	ldc_sumall				= 0.0
	ldc_sumdr				= 0.0
	ldc_sumcr				= 0.0
	ldc_begin_dr			= 0.0
	ldc_begin_cr			= 0.0
	ldc_sumalldr			= 0.0
	ldc_sumallcr				= 0.0	
	ls_account_id			= ""
	ls_account_name		= ""

	ls_account_id				= trim( lds_accmaster.object.account_id[ li_index ] )
	ls_account_name			= trim( lds_accmaster.object.account_name[ li_index ] )
	ls_account_group_id		= trim( lds_accmaster.object.account_group_id[ li_index ] )
	ls_account_rev_group		= trim( lds_accmaster.object.account_rev_group[ li_index ] )
	ls_account_nature			= trim( lds_accmaster.object.account_nature[ li_index ] )
	ls_account_control_id		= trim( lds_accmaster.object.account_control_id[ li_index ] )
//	ls_account_control_2level =  trim( lds_accmaster.object.accmaster_account_control_2level[ li_index ] ) 
	li_account_sort				= lds_accmaster.object.account_sort[ li_index ]
	li_typeaccid					= integer( trim(  lds_accmaster.object.account_type_id[ li_index ] ) )
	li_onreport					= lds_accmaster.object.on_report[ li_index ]
	
	if ( li_typeaccid <> 3 ) then
		if ( li_report_select = 3 ) then
			ls_account_name	= "รวม " + ls_account_name
		end if
		
		// ควรจะเป็นเท่าไหร่ ดูมากที่สุดของ ตัวที่ refer แล้ว เพิ่มอีก 1
		li_report_sort		= 0
		
		ldc_begin_cr	= 0.00
		ldc_begin_dr	= 0.00
		ldc_sumdr		= 0.00
		ldc_sumcr		= 0.00
		ldc_sumallcr		= 0.00
		ldc_sumalldr	= 0.00		
		li_found			= 0
		li_found			= lds_trial_bs.find( " trim( control_id ) = trim( ' " + ls_account_id + " ') " , 0 , li_index - 1  )
		
		do while li_found > 0
			ldc_begin_cr	+= lds_trial_bs.object.begin_cr[li_found]
			ldc_begin_dr	+= lds_trial_bs.object.begin_dr[li_found]
			ldc_sumdr		+= lds_trial_bs.object.dr_amt[li_found]
			ldc_sumcr		+= lds_trial_bs.object.cr_amt[li_found]
			ldc_sumdr		+= lds_trial_bs.object.aj_dr[li_found]
			ldc_sumcr		+= lds_trial_bs.object.aj_cr[li_found]
			ldc_sumallcr		+= lds_trial_bs.object.forward_cr[li_found]
			ldc_sumalldr	+= lds_trial_bs.object.forward_dr[li_found]

			if ( li_report_sort < lds_trial_bs.object.report_sort[li_found] ) then
				li_report_sort	= lds_trial_bs.object.report_sort[li_found]
			end if

			li_found ++
			if ( li_found >(  li_index - 1 )  ) then exit
			li_found		= lds_trial_bs.find( " trim( control_id ) = trim( '" + ls_account_id + "' ) " , li_found , li_index - 1  )
		loop

		li_report_sort		= li_report_sort + 1
		li_temp				= 0

		// ไปที่ตำแหน่ง เริ่มการ 
		Goto BeGinInsert
	else
		li_report_sort	= ll_last - li_index
		li_temp ++
	end if

	if ( li_period = 1 ) and ( ( trim( ls_account_group_id ) = '4' ) or ( trim( ls_account_group_id ) = '5' ) ) then
		ldc_begin_beforedate			= 0
	else
		if ( li_period = 1 ) and ( li_headstatus = 0 ) then
			ldc_begin_beforedate		= 0
		else
			ldc_begin_beforedate		= this.of_get_balance_begin( ls_account_id , ldtm_startdate, as_coop_id )
		end if		

	end if

	if ( date( ldtm_startdate ) <> date( ldtm_start ) ) then
		ldc_dr		= 0
		ldc_cr		= 0
		this.of_get_sum_drcr( ldtm_start , ldtm_startdate , ls_account_id , as_coop_id,   ldc_dr , ldc_cr  )		

		if isnull( ldc_dr ) then ldc_dr = 0.00
		if isnull( ldc_cr ) then ldc_cr = 0.00

		ldc_begin_beforedate = ( ldc_dr - ldc_cr ) + ldc_begin_beforedate
	end if

	choose case ldc_begin_beforedate
		case is > 0
			ldc_begin_dr	= ldc_begin_beforedate 

		case is < 0
			ldc_begin_cr	= abs(ldc_begin_beforedate)

		case else
			ldc_begin_cr	= 0
			ldc_begin_dr	= 0 

	end choose

	this.of_get_sum_between_drcr( ldtm_startdate , ldtm_enddate , ls_account_id ,   ldc_sumdr , ldc_sumcr ,as_coop_id  )

	this.of_get_sum_between_drcr_adj( ldtm_startdate , ldtm_enddate , ls_account_id , as_coop_id,   ldc_sumdr_adj , ldc_sumcr_adj  )

	if isnull( ldc_sumdr ) then ldc_sumdr = 0.0
	if isnull( ldc_sumcr ) then ldc_sumcr = 0.0
	if isnull( ldc_sumdr_adj ) then ldc_sumdr_adj = 0.0
	if isnull( ldc_sumcr_adj ) then ldc_sumcr_adj = 0.0

	// ลบยอด ปรับปรุงก่อน
	ldc_sumdr	= ldc_sumdr - ldc_sumdr_adj
	ldc_sumcr	= ldc_sumcr - ldc_sumcr_adj

	// นำยอด รวมฝั่ง DR ตั้งลบด้วย ยอดรวมฝั่ง CR อล้วบวกเพิ่มด้วย ยอดยกมา
	ldc_sumall	= ( ldc_sumdr - ldc_sumcr ) + ldc_begin_beforedate	

	// ตรวจสอบผลลัพธ์ที่ได้
	choose case ldc_sumall
		case is > 0 // หากยอดรวมทั้งหมด มีค่าเป็น +
			ldc_sumalldr	= ldc_sumall

		case is < 0 // หากยอดรวมทั้งหมด มีค่าเป็น -
			ldc_sumallcr		= abs( ldc_sumall )

		case else // หากยอดรวมทั้งหมด มีค่าเป็น 0
			ldc_sumallcr		= 0
			ldc_sumalldr	= 0

	end choose

	if (ls_account_nature= 'DR') and ( ldc_sumall < 0 ) then
		ls_account_group_id	= ls_account_rev_group
	end if	

	////หากำไร(ขาดทุน) ประจำงวด , ประจำปี
	//ldc_profit_month  	= this.of_profit_month( li_year , li_period , as_coop_id)
	//ldc_profit_year		= this.of_profit_year( li_year , li_period , as_coop_id)
	
	if isnull( ldc_profit_month ) then ldc_profit_month = 0.00
	if isnull( ldc_profit_year ) then ldc_profit_year = 0.00

	BeGinInsert:

	//insert ข้อมูลใส่ table 	accsumledgerdate ไว้ก่อนแล้วค่อย show ใน datawindow ทีหลัง

	li_insertrow	= lds_trial_bs.insertrow( 0 )
	lds_trial_bs.Setitem( li_insertrow, "account_id", ls_account_id )
	lds_trial_bs.Setitem( li_insertrow, "jounal_date", ldt_journal_date )
	lds_trial_bs.Setitem( li_insertrow, "account_name", ls_account_name )		
	lds_trial_bs.Setitem( li_insertrow, "group_id", ls_account_group_id )
	lds_trial_bs.Setitem( li_insertrow, "begin_cr", ldc_begin_cr )
	lds_trial_bs.Setitem( li_insertrow, "begin_dr", ldc_begin_dr )
	lds_trial_bs.Setitem( li_insertrow, "dr_amt", ldc_sumdr )
	lds_trial_bs.Setitem( li_insertrow, "cr_amt", ldc_sumcr )
	lds_trial_bs.Setitem( li_insertrow, "aj_dr", ldc_sumdr_adj )
	lds_trial_bs.Setitem( li_insertrow, "aj_cr", ldc_sumcr_adj )
	lds_trial_bs.Setitem( li_insertrow, "forward_cr", ldc_sumallcr )
	lds_trial_bs.Setitem( li_insertrow, "forward_dr", ldc_sumalldr )
	lds_trial_bs.Setitem( li_insertrow, "account_sort", li_account_sort )
	lds_trial_bs.Setitem( li_insertrow, "control_id", ls_account_control_id )
	lds_trial_bs.Setitem( li_insertrow, "coop_id", as_coop_id )
	lds_trial_bs.Setitem( li_insertrow, "acc_typeaccid", li_typeaccid )
	lds_trial_bs.Setitem( li_insertrow, "on_report", li_onreport )
	lds_trial_bs.Setitem( li_insertrow, "report_sort", li_report_sort )
	lds_trial_bs.Setitem( li_insertrow, "profit_month", ldc_profit_month )
	lds_trial_bs.Setitem( li_insertrow, "profit_year", ldc_profit_year )
//	lds_trial_bs.Setitem( li_insertrow, "account_control_2lv", ls_account_control_2level )//เพิ่มเติมเพื่อจัดกลุ่มของรายงานกิจการของสหกรณ์ ให้ สอ.มหิดล by mike
	
next

// รหัสสอ. ออมสิน ไม่มียอดเคลื่อนไหวให้ออกรายงานด้วย
//if(as_coop_id = '013001') then
//ls_check_flag = "05" 

//end if


choose case ls_check_flag
	case "01"
		ls_filter	= "( ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amt > 0 ) or ( cr_amt >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) or ( aj_dr  >0 ) or ( aj_cr >0 ) ) "
//		ls_filter	= " ( ( begin_cr >0 ) or ( begin_dr >0 ) or ( dr_amt >0 ) or (  cr_amt >0 ) or (  forward_dr >0 ) or (  forward_cr >0 ) )"
		
	case "02"
		ls_filter	= "( ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amt > 0 ) or ( cr_amt >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) or ( aj_dr  >0 ) or ( aj_cr >0 ) ) "
//		ls_filter	= "( ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amt >0 ) or ( cr_amt >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) ) "
		
	case "03"
		ls_filter	= "( ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amt > 0 ) or ( cr_amt >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) or ( aj_dr  >0 ) or ( aj_cr >0 ) ) "
		
	//case "04"
		//ls_filter	= "( ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amt > 0 ) or ( cr_amt >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) or ( aj_dr  >0 ) or ( aj_cr >0 ) ) "
////		ls_filter	= "( ( begin_cr > 0 ) or ( begin_dr >0 ) or ( dr_amt >0 ) or ( cr_amt >0 ) or (  forward_dr >0 ) or ( forward_cr >0 ) ) "
	//case "05"
		//ls_filter	= "( on_report = 1 ) and ( acc_typeaccid = 3 )"
		
		
end choose
//
//choose case li_report_select
	//case 1
		ls_filter	= ls_filter + " and ( on_report = 1 ) and ( acc_typeaccid = 3 ) "
	//
	//case 2
		//ls_filter	= ls_filter + " and ( on_report = 1 ) and ( acc_typeaccid <> 3 ) "
		//
	//case 3, 4
		//ls_filter	= ls_filter + " and ( on_report = 1 ) "
		//
	//case else
		//ls_filter	= ls_filter + " and ( on_report = 1 ) and ( acc_typeaccid = 3 ) "
		//
//end choose

//if ( ls_check_flag <>  "04" ) then
	//if li_seq_no = 1 then
		lds_trial_bs.setsort( "report_sort A, group_id A, control_id A , account_id A" )
	//else
		//lds_trial_bs.setsort( "report_sort A, group_id A, control_id A , account_sort A,  account_id A" )
	//end if

	lds_trial_bs.sort( )
	
	li_rc	= lds_trial_bs.SetFilter( ls_filter )
	li_rc	= lds_trial_bs.Filter()
	
	
	lds_trial_bs.Groupcalc( )
	//elseif( ls_check_flag =  "04" ) then
	//if li_seq_no = 1 then
		//lds_trial_bs.setsort( "report_sort A, group_id A, control_id A , account_id A" )
	//else
		//lds_trial_bs.setsort( "report_sort A, group_id A, control_id A , account_sort A,  account_id A" )
	//end if
//
	//lds_trial_bs.sort( )
	//
	//li_rc	= lds_trial_bs.SetFilter( ls_filter )
	//li_rc	= lds_trial_bs.Filter()
	//
	//
	//lds_trial_bs.Groupcalc( )
//end if

lds_trial_bs.accepttext( )
as_trial_report_xml	= lds_trial_bs.describe( "Datawindow.data.XML" )
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////**** ยิงออก excel
lds_bs_report		= create n_ds
lds_bs_report.dataobject = "d_acc_rpt_trilebalance_detail_14_excel"   

if not  isnull( as_trial_report_xml ) and trim( as_trial_report_xml ) <> ""  then
	li_rc	= lds_bs_report.importstring( XML!, as_trial_report_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if


//ลบข้อมูลเก่าทิ้ง
delete from acc_excel_tribalance
commit using itr_sqlca ;

//d_acc_pl_service_report

//ll_row		= lds_bs_report.retrieve( as_moneysheet_code )
// ถ้าไม่มีรายการออกไป
if li_rc <= 0 then
	return 1
end if

for ll_index = 1 to li_rc

	ls_account_id	=  lds_bs_report.object.account_id[ ll_index ]
	ls_account_name	=  lds_bs_report.object.account_name[ ll_index ]
	ls_account_group_id	=  lds_bs_report.object.group_id[ ll_index ]
	ldc_begin_dr			=  lds_bs_report.object.begin_dr[ ll_index ]
	ldc_begin_cr			=  lds_bs_report.object.begin_cr[ ll_index ]
	ldc_sumdr				=  lds_bs_report.object.dr_amt[ ll_index ]
	ldc_sumcr				=  lds_bs_report.object.cr_amt[ ll_index ]
	//ldc_sumalldr			=  lds_bs_report.object.forward_dr[ ll_index ]
	//ldc_sumallcr			=  lds_bs_report.object.forward_cr[ ll_index ]
	ldc_sumalldr			=  lds_bs_report.object.compute_3[ ll_index ]   //ใช้ยอดหลัง ปป. จากรายงาน
	ldc_sumallcr			=  lds_bs_report.object.compute_4[ ll_index ]  //ใช้ยอดหลัง ปป. จากรายงาน
	ldc_sumdr_adj			=  lds_bs_report.object.aj_dr[ ll_index ]
	ldc_sumcr_adj			=  lds_bs_report.object.aj_cr[ ll_index ]

	if isnull(ldc_begin_dr) then ldc_begin_dr = 0.00
	if isnull(ldc_begin_cr) then ldc_begin_cr = 0.00
	if isnull(ldc_sumdr) then ldc_sumdr = 0.00
	if isnull(ldc_sumcr) then ldc_sumcr = 0.00
	if isnull(ldc_sumalldr) then ldc_sumalldr = 0.00
	if isnull(ldc_sumallcr) then ldc_sumallcr = 0.00
	if isnull(ldc_sumdr_adj) then ldc_sumdr_adj = 0.00
	if isnull(ldc_sumcr_adj) then ldc_sumcr_adj = 0.00
//	
//	ldc_sum1	=	ldc_balance1 + ldc_balance2     //ยอดรวมของรายการที่ 1
//	ldc_sum2	=	ldc_balance3 + ldc_balance4	//ยอดรวมของรายการที่ 2
//	ldc_sumpercent1	=	ldc_percent1 + ldc_percent2
//	ldc_sumpercent2	= 	ldc_percent3 + ldc_percent4
//	
  INSERT INTO ACC_EXCEL_TRIBALANCE  
         ( COOP_ID,              			ACCOUNT_ID,              		ACCOUNT_NAME,   
           BEGIN_DR,   			          	BEGIN_CR,   		        	DR_AMT,   
           CR_AMT,   			           	FORWARD_DR,   					FORWARD_CR,   
           AJ_DR,   				        AJ_CR,   		             	GROUP_ID)  
  VALUES ( 
  		  :as_coop_id,						:ls_account_id,					:ls_account_name,
		  :ldc_begin_dr,					:ldc_begin_cr,					:ldc_sumdr,
		  :ldc_sumcr,						:ldc_sumalldr,					:ldc_sumallcr,
  		  :ldc_sumdr_adj,					:ldc_sumcr_adj,				:ls_account_group_id
		  ) using itr_sqlca ;
  
  if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถออกรายงานได้ กรุณาตรวจสอบ "   + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if

next
//****
commit using itr_sqlca ;
return 1
end function

public function string of_gen_ledger_report_day (datetime adtm_start, datetime adtm_end, string as_account_id1, string as_account_id2, string as_coop_id) throws Exception;/***********************************************
// Use by  Report
<description> 
ทำรายการทำรายงาน แยกประเภท

FXREF: AC-ACCSERVICE-of_gen_day_journalreport-0000001
</description>

<arguments>
adtm_start				วันที่เริ่มต้น
adtm_end				วันที่สิ้นสุด
as_account_id1			รหัสบัญชีเริ่มต้น
as_account_id2			รหัสบัญชีสิ้นสุด
as_branch_id			สาขา
</arguments>

<return>
string ข้อมูลรายการ ออกรายงาน
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/

integer	ll_year,ll_count_ledger,  i ,j ,li_seq_no,ll_last,li_flag, li_year, li_period , li_rc   //**
dec{2}	ldc_dramt,ldc_cramt,ldc_sumalldr,ldc_sumallcr , ldc_cr2,ldc_dr2,ldc_dr,ldc_cr,ldc_begin_dr,ldc_begin_cr,ldc_begin,ldc_sumall,ldc_sumdr,ldc_sumcr
string		ls_remark_exe,ls_acc_book_type_id,ls_account_group_id,ls_account_name,ls_account_id_accmas ,ls_accprior,as_trial_report_xml//**
datetime	ldt_journal_date, ldtm_start, ldtm_beforedate, ldtm_endyeardate, ldtm_startyeardate
integer	li_insertrow, li_cash_type, li_rowremark, li_glno, li_indexremark
string		ls_voucher,  ls_voucher_num, ls_vc_type,ls_group_accid   //**
dec{2}	ldc_begin_dr_amount, ldc_begin_cr_amount, ldc_begin_first
long		 ll_index   //**

n_ds  lds_ledger,lds_accsum,lds_accmaster,lds_accsumdate, lds_accremark, lds_report,lds_bs_report  //**


this.of_get_year_period( adtm_start , as_coop_id, li_year, li_period  )

lds_accmaster = create n_ds
lds_accmaster.dataobject = 'd_acc_accmaster_all_service_byaccid' //แสดงบัญชีทุกตัว  //**เพิ่ม account_group_id_1
lds_accmaster.settransobject(itr_sqlca)
ll_last = lds_accmaster.retrieve( as_account_id1, as_account_id2  ,as_coop_id)

lds_accmaster.setsort( " account_group_id A , account_id A" )
lds_accmaster.sort( )

lds_ledger = create n_ds
lds_ledger.dataobject ='dw_acc_date20_vcvoucher_balance_group1_d'//แสดงบัญชีในแยกประเภทตามช่วงวันที่   //**เปลี่ยนชื่อ dw จาก _day เป็น _d
lds_ledger.settransobject(itr_sqlca)

lds_accremark = create n_ds
lds_accremark.dataobject ='d_acc_ledgerdet_remark'
lds_accremark.settransobject(itr_sqlca)

ls_accprior		= ""

lds_report		= create n_ds
lds_report.dataobject ='r_mth30_mth_ledger_thai_excel'   //** เพิ่ม group_accid + เปลี่ยนชื่อรายงาน

// วันเริ่มต้นงวด
ldtm_start		= datetime( date( year( date( adtm_start ) ), month( date( adtm_start ) ), 1  ) )

// วันเริ่มต้นปีบัญชี
this.of_get_period_date(li_year, 1,as_coop_id, ldtm_beforedate, ldtm_endyeardate  )

//select beginning_of_accou
//into	:ldtm_startyeardate
//from  accconstant
//using itr_sqlca;

//วนรอบทุก ๆบัญชี
For i = 1 to ll_last
	ldc_begin		= 0.0
	ldc_sumall		= 0.0
	ldc_sumdr		= 0.0
	ldc_sumcr		= 0.0
	ldc_begin_dr	= 0.0
	ldc_begin_cr	= 0.0
	li_flag				= 0
	ldc_dramt 		= 0
	ldc_cramt		= 0
	li_seq_no		= 0
		
	ls_acc_book_type_id		= ""
	ls_account_id_accmas	= ""
	ls_account_name			= ""
	ls_remark_exe				= ""
	
	
	ldc_dr			= 0.0
	ldc_cr			= 0.0
	ldc_dr2		= 0.0
	ldc_cr2		= 0.0
	 
	 
	ls_account_id_accmas	= lds_accmaster.object.account_id[i]
	
	
	if ( ls_account_id_accmas <> ls_accprior ) then
		ls_account_name	= lds_accmaster.object.account_name[i]
		
		ls_account_group_id		= lds_accmaster.object.account_group_id[i]	
		ls_group_accid 				= lds_accmaster.object.account_group_id_1[i]    //**	
		if ( li_period = 1 ) and ( ( trim( ls_account_group_id ) = '4' ) or ( trim( ls_account_group_id ) = '5' ) ) then
			ldc_begin		= 0
			ldc_begin_first	= 0
		else
			ldc_begin		= this.of_get_balance_begin_day( ls_account_id_accmas , ldtm_beforedate , as_coop_id )
			
			if ( ( trim( ls_account_group_id ) = '4' ) or ( trim( ls_account_group_id ) = '5' ) ) then
				ldc_begin_first	= 0
			else
				ldc_begin_first	= this.of_get_balance_begin( ls_account_id_accmas ,  li_year, 1, as_coop_id )
			end if
			
		end if
		//วันที่เริ่มต้นออกงบ เป็นระหว่างเดือน  ไม่ใช่วันเริ่มงวด (วันที่ 1 ของเดือน)
//		if ( date( adtm_start ) <> date( ldtm_start ) ) then   //******
			ldc_dr			= 0
			ldc_cr			= 0
			
			if ( li_period = 1 ) then
				//สำหรับงวด 1
				this.of_get_sum_drcr_day( ldtm_beforedate , adtm_start  , ls_account_id_accmas ,    ldc_dr , ldc_cr ,as_coop_id)
				
			else
				this.of_get_sum_drcr_day( ldtm_beforedate , adtm_start  , ls_account_id_accmas ,   ldc_dr , ldc_cr , 1 ,as_coop_id)				
			end if
			
			if	isnull( ldc_dr ) then ldc_dr = 0
			if	isnull( ldc_cr ) then ldc_cr = 0
			
			ldc_begin = ( ldc_dr - ldc_cr ) + ldc_begin
			
//		end if
		
		//หายอดสะสมตั้งแต่ต้นปีถึงเดือนที่ต้องการจะออกรายงาน
		this.of_get_sum_drcr_day( ldtm_beforedate , adtm_start  , ls_account_id_accmas ,   ldc_begin_dr_amount , ldc_begin_cr_amount,as_coop_id  )
		
		choose case ldc_begin_first
			case is > 0 
				ldc_begin_dr_amount	= ldc_begin_first + ldc_begin_dr_amount
			case is < 0
				ldc_begin_first	= abs(ldc_begin_first)
				ldc_begin_cr_amount	= ldc_begin_first + ldc_begin_cr_amount
		end choose
		 
		
		choose case ldc_begin
			case is > 0
				ldc_begin_dr   = ldc_begin
				
			case is < 0
				ldc_begin_cr	= abs( ldc_begin )
				
			case else
				ldc_begin_dr	= 0
				ldc_begin_cr	= 0
				li_flag				= 2
				
		end choose
		
		ldc_sumall			= ldc_begin
		li_seq_no			= 0
		
		lds_ledger.reset()
		ll_count_ledger	= lds_ledger.retrieve(ls_account_id_accmas,adtm_start, adtm_end,as_coop_id)
		li_seq_no			= 0
		
		for j = 1 to ll_count_ledger
		//ดึงข้อมูลจาก  เดบิต ยอดรวม เครดิต  จาก  accgeneralledger
			ldc_dramt		= 0
			ldc_cramt		= 0
			ldc_dramt		= lds_ledger.object.dr_amt[j] ; if isnull( ldc_dramt ) then ldc_dramt = 0
			ldc_cramt		= lds_ledger.object.cr_amt[j] ; if isnull( ldc_cramt ) then ldc_cramt = 0
			li_glno			= lds_ledger.object.seq_no[j] ; if isnull( li_glno ) then li_glno = 0
//			li_seq_no		= lds_ledger.object.seq_no[j] ; if isnull( li_seq_no ) then li_seq_no = 0   //**//**  12.5 pbreport 12.0 ไม่มี
			//เพิ่มเงื่อนไขให้ pea  รายละเอียดเอามาจากชื่อ voucher
			if( as_coop_id = '008001') then
				ls_remark_exe	= lds_ledger.object.voucher_desc[j] ;
			else
				ls_remark_exe	= lds_ledger.object.item_desc[j] ;
			end if
			if isnull( ls_remark_exe ) then ls_remark_exe = ""
			
			ls_voucher		= lds_ledger.object.voucher_no[j] 
			ls_voucher_num = trim(lds_ledger.object.compute_1[j]) ; if isnull( ls_voucher_num ) then ls_voucher_num = ""
			ls_vc_type		= trim(lds_ledger.object.voucher_type[j]) ; if isnull( ls_vc_type ) then ls_vc_type = ""
			
			if isnull( ls_voucher ) then ls_voucher = ""
			li_cash_type = lds_ledger.object.cash_type[j]
			
			choose case li_cash_type
				case 1
					ls_acc_book_type_id	= '10'
					
				case 2
					ls_acc_book_type_id	= '20'
					
				case else
					ls_acc_book_type_id	= '30'
					
			end choose
			
			if ( ldc_dramt > 0 ) then
				ls_account_group_id ='DR'
			else
				ls_account_group_id ='CR'
			end if
			
			ldt_journal_date	= lds_ledger.object.voucher_date[j]
			ldc_sumall			= ldc_sumall + ( ldc_dramt - ldc_cramt )
			li_seq_no ++
			
			choose case ldc_sumall
				case is > 0					
					ldc_sumalldr	= ldc_sumall
					ldc_sumallcr	= 0
				
				case is < 0					
					ldc_sumallcr  = abs( ldc_sumall )
					ldc_sumalldr  =  0
				
				case else					
					ldc_sumalldr	 = 0
					ldc_sumallcr	 = 0
				
			end choose
			
		
			if ( ldc_sumall = 0 ) then
				if ( ldc_begin_dr > 0 ) then	
					if (li_seq_no = 1 ) and (ldc_begin_dr =  ldc_cramt) then
						ldc_sumalldr = -99999
					end if
				end if
				
				if ( ldc_begin_cr > 0 ) then	
					if (li_seq_no = 1)  and (ldc_begin_cr =  ldc_dramt) then
						ldc_sumallcr = -99999
					end if
				end  if
				
				if	( ldc_sumalldr > 0 ) and (ldc_sumalldr = ldc_cramt)  then
					ldc_sumalldr = -99999
				end if
				
				if ( ldc_sumallcr < 0 ) and ( ldc_sumallcr = ldc_dramt ) then
					ldc_sumallcr  = -99999
				end if
				
			end if
			//หาremark
			li_rowremark	= 0
			li_rowremark	= lds_accremark.retrieve( ls_account_id_accmas, ldt_journal_date, ls_account_group_id,  as_coop_id , li_glno,  ls_voucher  )
			
			if ( li_rowremark > 0 ) then
				for li_indexremark = 1 to li_rowremark
					if ( li_indexremark = 1 ) then
						
						ls_remark_exe	= ls_remark_exe + " " + lds_accremark.object.c_remark[li_indexremark]
					else
						li_seq_no ++
						ls_remark_exe	= lds_accremark.object.c_remark[li_indexremark]
						ldc_dramt		= 0.00
						ldc_cramt		= 0.00
						ldc_sumalldr	= 0.00
						ldc_sumallcr	= 0.00
						ls_acc_book_type_id	= ""
					end if
					
					//insert ข้อมูลใส่ table 	accsumledgerdate ไว้ก่อนแล้วค่อย show ใน datawindow ทีหลัง	
					li_insertrow	= lds_report.insertrow( 0 )
					lds_report.Setitem( li_insertrow, "account_id", ls_account_id_accmas )
					lds_report.Setitem( li_insertrow, "journal_d", ldt_journal_date )
					lds_report.Setitem( li_insertrow, "desc_journal_detai", ls_account_name )
					lds_report.Setitem( li_insertrow, "dr_amount", ldc_dramt )
					lds_report.Setitem( li_insertrow, "cr_amount", ldc_cramt )
					lds_report.Setitem( li_insertrow, "group_id", ls_account_group_id )
					lds_report.Setitem( li_insertrow, "begin_cr", ldc_begin_cr )
					lds_report.Setitem( li_insertrow, "begin_dr", ldc_begin_dr )
					lds_report.Setitem( li_insertrow, "forward_cr", ldc_sumallcr )
					lds_report.Setitem( li_insertrow, "forward_dr", ldc_sumalldr )
					lds_report.Setitem( li_insertrow, "remark_exe", ls_remark_exe )
					lds_report.Setitem( li_insertrow, "seq_no", li_seq_no )
					lds_report.Setitem( li_insertrow, "flag", li_flag )
					lds_report.Setitem( li_insertrow, "acc_book_type_id", ls_acc_book_type_id )
					lds_report.Setitem( li_insertrow, "voucher_no", ls_voucher )
					lds_report.Setitem( li_insertrow, "begin_dr_amount", ldc_begin_dr_amount )
					lds_report.Setitem( li_insertrow, "begin_cr_amount", ldc_begin_cr_amount )
					lds_report.Setitem( li_insertrow, "voucher_number", ls_voucher_num )
					lds_report.Setitem( li_insertrow, "vc_type", ls_vc_type )					
					lds_report.Setitem( li_insertrow, "group_accid", ls_group_accid )   //**
					
				next
			else
				//insert ข้อมูลใส่ table 	accsumledgerdate ไว้ก่อนแล้วค่อย show ใน datawindow ทีหลัง	
				li_insertrow	= lds_report.insertrow( 0 )
				lds_report.Setitem( li_insertrow, "account_id", ls_account_id_accmas )
				lds_report.Setitem( li_insertrow, "journal_d", ldt_journal_date )
				lds_report.Setitem( li_insertrow, "desc_journal_detai", ls_account_name )
				lds_report.Setitem( li_insertrow, "dr_amount", ldc_dramt )
				lds_report.Setitem( li_insertrow, "cr_amount", ldc_cramt )
				lds_report.Setitem( li_insertrow, "group_id", ls_account_group_id )
				lds_report.Setitem( li_insertrow, "begin_cr", ldc_begin_cr )
				lds_report.Setitem( li_insertrow, "begin_dr", ldc_begin_dr )
				lds_report.Setitem( li_insertrow, "forward_cr", ldc_sumallcr )
				lds_report.Setitem( li_insertrow, "forward_dr", ldc_sumalldr )
				lds_report.Setitem( li_insertrow, "remark_exe", ls_remark_exe )
				lds_report.Setitem( li_insertrow, "seq_no", li_seq_no )
				lds_report.Setitem( li_insertrow, "flag", li_flag )
				lds_report.Setitem( li_insertrow, "acc_book_type_id", ls_acc_book_type_id )
				lds_report.Setitem( li_insertrow, "voucher_no", ls_voucher )
				lds_report.Setitem( li_insertrow, "begin_dr_amount", ldc_begin_dr_amount )
				lds_report.Setitem( li_insertrow, "begin_cr_amount", ldc_begin_cr_amount )
				lds_report.Setitem( li_insertrow, "voucher_number", ls_voucher_num )
				lds_report.Setitem( li_insertrow, "vc_type", ls_vc_type ) 
				lds_report.Setitem( li_insertrow, "group_accid", ls_group_accid )   //**
	end if	
			ls_accprior	= ls_account_id_accmas
			
		next
	
	end if

	if	( ll_count_ledger = 0 ) and ( ( ldc_begin_cr > 0 ) or ( ldc_begin_dr > 0 ) ) then   //**มียอดยกมา แต่ไม่มียอดเคลื่อนไหว
		ldt_journal_date	= adtm_start		
		li_flag					= 1
		ls_voucher 			=""   //**
		li_seq_no 			= 1  //**
		ls_account_group_id = ""   //**
		ldc_sumalldr		= ldc_begin_dr  //**
		ldc_sumallcr			= ldc_begin_cr  //**
		li_insertrow			= lds_report.insertrow( 0 )

		
		lds_report.Setitem( li_insertrow, "account_id", ls_account_id_accmas )
		lds_report.Setitem( li_insertrow, "journal_d", ldt_journal_date )
		lds_report.Setitem( li_insertrow, "desc_journal_detai", ls_account_name )
		lds_report.Setitem( li_insertrow, "dr_amount", ldc_dramt )
		lds_report.Setitem( li_insertrow, "cr_amount", ldc_cramt )
		lds_report.Setitem( li_insertrow, "group_id", ls_account_group_id )
		lds_report.Setitem( li_insertrow, "begin_cr", ldc_begin_cr )
		lds_report.Setitem( li_insertrow, "begin_dr", ldc_begin_dr )
		lds_report.Setitem( li_insertrow, "forward_cr", ldc_sumallcr )
		lds_report.Setitem( li_insertrow, "forward_dr", ldc_sumalldr )
		lds_report.Setitem( li_insertrow, "remark_exe", ls_remark_exe )
		lds_report.Setitem( li_insertrow, "seq_no", li_seq_no )
		lds_report.Setitem( li_insertrow, "flag", li_flag )
		lds_report.Setitem( li_insertrow, "acc_book_type_id", ls_acc_book_type_id )
		lds_report.Setitem( li_insertrow, "voucher_no", ls_voucher )
		lds_report.Setitem( li_insertrow, "begin_dr_amount", ldc_begin_dr_amount )   //****
		lds_report.Setitem( li_insertrow, "begin_cr_amount", ldc_begin_cr_amount )    //****
		lds_report.Setitem( li_insertrow, "voucher_number", ls_voucher_num )
		lds_report.Setitem( li_insertrow, "vc_type", ls_vc_type )
		lds_report.Setitem( li_insertrow, "group_accid", ls_group_accid )   //**
	end if
next


if isvalid( lds_accmaster ) then
	destroy( lds_accmaster )
end if

if isvalid( lds_ledger ) then
	destroy( lds_ledger )
end if

if isvalid( lds_accsum ) then
	destroy( lds_accsum )
end if

lds_report.Groupcalc( )


//if ( lds_report.rowcount() > 0 ) then      //**
//	return lds_report.Describe( "Datawindow.Data.XML" )	//**
//end if   //**

lds_report.accepttext( )
//as_trial_report_xml	= lds_report.describe( "Datawindow.data.XML" )   //**
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////**** ยิงออก excel

//lds_bs_report		= create n_ds   //**
//lds_bs_report.dataobject = "r_mth30_mth_ledger_thai_excel"     //**เพิ่ม group_accid + เอาฟิว account_id มาแสดง + compute_10

//if not  isnull( as_trial_report_xml ) and trim( as_trial_report_xml ) <> ""  then
	//li_rc	= lds_bs_report.importstring( XML!, as_trial_report_xml )
	//if ( li_rc < 0 ) then
		//ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		//throw ithw_exception
	//end if
//end if

li_rc = lds_report.RowCount()

//ลบข้อมูลเก่าทิ้ง
delete from acc_excel_ledger
commit using itr_sqlca ;



// ถ้าไม่มีรายการออกไป
//if li_rc <= 0 then
//	return 1
//end if

for ll_index = 1 to li_rc

	ls_account_id_accmas			=  lds_report.object.account_id[ ll_index ]
	ls_account_name					=  lds_report.object.compute_10[ ll_index ]
	ls_voucher						=  lds_report.object.voucher_no[ ll_index ] 
	ldt_journal_date				= 	lds_report.object.journal_d[ ll_index ]
	ls_remark_exe					= 	lds_report.object.compute_9[ ll_index ]
	ls_account_group_id				=  lds_report.object.group_id[ ll_index ]
	ldc_begin_dr					=  lds_report.object.begin_dr[ ll_index ] 
	ldc_begin_cr					=  lds_report.object.begin_cr[ ll_index ]  
	ldc_sumdr						=  lds_report.object.dr_amount[ ll_index ]
	ldc_sumcr						=  lds_report.object.cr_amount[ ll_index ]
	ldc_sumalldr					=  lds_report.object.forward_dr[ ll_index ]
	ldc_sumallcr					=  lds_report.object.forward_cr[ ll_index ]
	li_seq_no						=  lds_report.object.seq_no[ ll_index ]
	ls_group_accid					=  lds_report.object.group_accid[ ll_index ]		


	if isnull(ldc_begin_dr) then ldc_begin_dr = 0.00
	if isnull(ldc_begin_cr) then ldc_begin_cr = 0.00
	if isnull(ldc_sumdr) then ldc_sumdr = 0.00
	if isnull(ldc_sumcr) then ldc_sumcr = 0.00
	if isnull(ldc_sumalldr) then ldc_sumalldr = 0.00
	if isnull(ldc_sumallcr) then ldc_sumallcr = 0.00

//	
//	ldc_sum1	=	ldc_balance1 + ldc_balance2     //ยอดรวมของรายการที่ 1
//	ldc_sum2	=	ldc_balance3 + ldc_balance4	//ยอดรวมของรายการที่ 2
//	ldc_sumpercent1	=	ldc_percent1 + ldc_percent2
//	ldc_sumpercent2	= 	ldc_percent3 + ldc_percent4
//	

INSERT INTO   ACC_EXCEL_LEDGER
         ( COOP_ID,              				ACCOUNT_ID,              		ACCOUNT_NAME,   
		  VOUCHER_NO,					VOUCHER_DATE,				VOUCHER_DASC,
           BEGIN_DR,   			          	BEGIN_CR,   		        		DR_AMT,   
           CR_AMT,   			           	FORWARD_DR,   				FORWARD_CR,   
           SEQ_NO,   				        	GROUP_ID,						GROUP_ACCID)  
  VALUES ( 
  		  :as_coop_id,						:ls_account_id_accmas,		:ls_account_name,
  		  :ls_voucher,						:ldt_journal_date,				:ls_remark_exe,
		  :ldc_begin_dr,					:ldc_begin_cr,					:ldc_sumdr,
		  :ldc_sumcr,						:ldc_sumalldr,					:ldc_sumallcr,
  		  :li_seq_no,							:ls_account_group_id,		:ls_group_accid
		  ) using itr_sqlca ;
  
  if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถออกรายงานได้ กรุณาตรวจสอบ "   + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
end if

next
//****
commit using itr_sqlca ;

return ""
end function

private subroutine of_get_sum_drcr_day (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, integer ai_flag, string as_coop_id);////Use by Report
//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)   
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
			( a.coop_id = b.coop_id) and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	< :adtm_enddate ) and
			( b.account_id		= :as_account_id) and
			( b.posttogl_allflag	= 1)and
			( a.coop_id  		=:as_coop_id) and   
			( a.voucher_status	= 1 ) using itr_sqlca ;

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

private subroutine of_get_sum_drcr_day (datetime adtm_begindate, datetime adtm_enddate, string as_account_id, ref decimal adc_dr_amount, ref decimal adc_cr_amount, string as_coop_id);//// Use by Report
//หายอดรวม   เดบิต เครดิต วันที่แล้วมา
select		sum(b.dr_amt),   
			sum(b.cr_amt)  
into		:adc_dr_amount,:adc_cr_amount		
from 		vcvoucher a, vcvoucherdet b  
where 	( a.voucher_no		= b.voucher_no ) and
			( a.coop_id = b.coop_id) and
			( a.posttoacc_flag	= 1 ) and
			( a.voucher_date	>= :adtm_begindate ) and
			( a.voucher_date	< :adtm_enddate ) and
			( b.account_id		= :as_account_id) and
			( a.coop_id  =:  as_coop_id) and   
			( a.voucher_status	= 1 ) 	using itr_sqlca ;  

if isnull( adc_dr_amount ) then adc_dr_amount = 0.00
if isnull( adc_cr_amount ) then adc_cr_amount = 0.00

return
end subroutine

public function decimal of_get_balance_begin_day (string as_account_id, datetime adtm_date_find, string as_coop_id);//// Use by  Report
dec{2}	ldc_begin_befydr,ldc_begin_befycr, ldc_begin
integer	ll_year ,li_period ,li_current_year, li_current_period
datetime	ldtm_datebf

ldtm_datebf	= datetime( inv_datetime.of_relativemonth( date( adtm_date_find ), -1 ) )
this.of_get_year_period( ldtm_datebf, as_coop_id,  ll_year, li_period )
this.of_get_year_period( adtm_date_find, as_coop_id, li_current_year, li_current_period )

// หายอดยกมาในกรณียังไม่ได้ปิดสิ้นปี   by mike
//if( ll_year <> li_current_year ) then
//	li_current_period = li_period
//end if

choose case  li_current_period
	case 12
		//หายอดยกมาปีที่แล้ว 
		select		sum( forward_dr_amount ) , sum( forward_cr_amount )
		into		:ldc_begin_befydr,:ldc_begin_befycr	 
		from		accsumledgerperiod  
		where	( account_year		= :ll_year ) and 
					( period				= :li_period ) and 
					( account_id			= :as_account_id )  and
					( posttogl_allflag	= 1 ) and
					( coop_id			= :as_coop_id )using itr_sqlca;
	case else
		//หายอดยกมา 
		select		sum(begin_dr_amount ) , sum(begin_cr_amount )
		into		:ldc_begin_befydr,:ldc_begin_befycr	 
		from		accsumledgerperiod  
		where	( account_year	= :li_current_year ) and 
					( period			= :li_current_period ) and 
					( account_id		= :as_account_id ) and
					( coop_id		= :as_coop_id )using itr_sqlca;
end choose

		

if isnull( ldc_begin_befydr ) then ldc_begin_befydr = 0.00
if isnull( ldc_begin_befycr ) then ldc_begin_befycr = 0.00

ldc_begin = ldc_begin_befydr - ldc_begin_befycr

return ldc_begin
end function

public function integer of_set_voucher_no (datetime adtm_date, string as_coopid, string as_type) throws Exception;integer		li_pvno, li_rvno, li_jvno, li_year, li_period, li_avno, li_tvno
string		ls_pvno, ls_rvno, ls_jvno, ls_avno, ls_tvno
datetime	ldtm_endperiod, ldtm_start_endperiod, ldtm_start_year

	select min(period_end_date)
	into	:ldtm_endperiod
	from	accperiod
	where	period_end_date >= :adtm_date and 
				coop_id		  = :as_coopid	
	using itr_sqlca;
	
	if IsNull(ldtm_endperiod) then 
		ldtm_start_endperiod	= datetime( date( year( date( adtm_date ) ) , month( date( adtm_date ) ), 1  ) )
		ldtm_endperiod			= datetime( date( year( date( adtm_date ) )  , month( date( adtm_date ) ), 30 ) )
	else
	
	//วันเริ่มต้นงวด
	if (as_type = '01') then  //ขึ้นเลขใหม่ทุกสิ้นเดือน
		ldtm_start_endperiod	= datetime( date( year( date( ldtm_endperiod ) ) , month( date( ldtm_endperiod ) ), 1  ) )
	else
		//หาวันที่เริ่มต้นปีบัญชี
		select beginning_of_accu
		into	:ldtm_start_year
		from accconstant
		where coop_id = :as_coopid
		using itr_sqlca;
		
		ldtm_start_endperiod	= datetime( date( year( date( ldtm_start_year ) ) , month( date( ldtm_start_year ) ), 1  ) )
	end if
		ldtm_endperiod			= datetime( date( year( date( ldtm_endperiod ) )  , month( date( ldtm_endperiod ) ),  day( date( ldtm_endperiod ) ) ) )
	end if
		
		
	//////////หาเลขที่เอกสารของปีเก่า//////////////////
	select substr(max(voucher_no),7,4)
	into	:ls_pvno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'PV%'		and
			coop_id			= :as_coopid	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:ls_rvno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'RV%'		and
			coop_id			= :as_coopid	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:ls_jvno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'JV%'		and
			coop_id			= :as_coopid	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:ls_avno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'AV%'		and
			coop_id			= :as_coopid	
	using itr_sqlca;
	
	select substr(max(voucher_no),7,4)
	into	:ls_tvno
	from	vcvoucher
	where voucher_date between :ldtm_start_endperiod and :ldtm_endperiod   and
			voucher_no	like 'TV%'		and
			coop_id			= :as_coopid	
	using itr_sqlca;
	

	
	if isnull(ls_pvno) or ls_pvno = "" then ls_pvno = '0'
	if isnull(ls_rvno) or ls_rvno = "" then ls_rvno = '0'
	if isnull(ls_jvno) or ls_jvno = "" then ls_jvno = '0'
	if isnull(ls_avno) or ls_avno = "" then ls_avno = '0'
	if isnull(ls_tvno) or ls_tvno = "" then ls_tvno = '0'

	
	li_pvno	= integer(ls_pvno)
	li_rvno	= integer(ls_rvno)
	li_jvno	= integer(ls_jvno)
	li_avno	= integer(ls_avno)
	li_tvno	= integer(ls_tvno)
	
	
	//update เลขที่เอกสาร Voucher
update 	cmdocumentcontrol
set			last_documentno	= :li_pvno
where 	( document_code = 'CMVOUCHERNO_PV' ) and
			( coop_id			= :as_coopid	  )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_rvno
where 	( document_code = 'CMVOUCHERNO_RV' ) and
			( coop_id				= :as_coopid	  )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_jvno
where 	( document_code = 'CMVOUCHERNO_JV' ) and
			( coop_id			= :as_coopid	 )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_avno
where 	( document_code = 'CMVOUCHERNO_AV' ) and
			( coop_id			= :as_coopid	 )
using itr_sqlca;

update 	cmdocumentcontrol
set			last_documentno	= :li_tvno
where 	( document_code = 'CMVOUCHERNO_TV' ) and
			( coop_id			= :as_coopid	 )
using itr_sqlca;


if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถอัพเดทเลขที่เอกสาร Voucher ได้  " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

return 1
	
	/////////////////////////////////////////////////////////////////////////////////////
end function

public function integer of_get_cash_bg_fw_first_period (datetime adtm_startdate, string as_coop_id, ref decimal adc_begin, ref decimal adc_forward);//ฟังก์ชั่น คิดยอดเงินสดยกมา ยกไป จากต้นปีบัญชี แก้ไขกรณียังไม่ปิดเดือน หน้าจอไม่แสดงยอดยกมา ยกไป
// create by Sakuraii 03/08/2559

datetime	ldtm_enddate, ldtm_start
dec{2}	ldc_dr, ldc_cr,   ldc_begin_forward

ldtm_enddate 	= adtm_startdate
ldtm_start		= datetime( date( year( date( adtm_startdate ) ), 1 , 1  ) )

// ยกมาต้นงวด
ldc_begin_forward	=	this.of_get_balance_begin( is_cash_id  , ldtm_start  , as_coop_id  )
ldc_dr	= 0.00
ldc_cr	= 0.00

if ( date( adtm_startdate ) <> date( ldtm_start ) ) then	
	// รายการที่ยังไม่ผ่านรายการ และผ่านแล้ว
	this.of_get_sum_notpost_drcr( ldtm_start , adtm_startdate , is_cash_id , as_coop_id,   ldc_dr , ldc_cr  )  // Edit for balance by pom  

	if isnull( ldc_dr ) then ldc_dr = 0.00
	if isnull( ldc_cr ) then ldc_cr = 0.00
	
	adc_begin	= ldc_begin_forward + ( ldc_dr - ldc_cr )
	
else
	adc_begin	= ldc_begin_forward
end if

ldc_dr		= 0.00
ldc_cr		= 0.00

this.of_get_sum_between_notpost_drcr( adtm_startdate , ldtm_enddate , is_cash_id , as_coop_id,   ldc_dr , ldc_cr ) 

adc_forward	= adc_begin + (  ldc_dr - ldc_cr )

return 1
end function

public function integer of_gen_balance_sheet_excel (string as_moneysheet_code, integer ai_year_1, integer ai_year_2, integer ai_month_1, integer ai_month_2, integer ai_show_all, integer ai_data_1, integer ai_data_2, integer ai_compere_b1_b3, integer ai_show_remark, string as_coop_id, integer ai_total_show, integer ai_percent_status) throws Exception;integer	ll_month,ll_period,ll_year,ll_year_period,i , ll_count, li_remark, ll_index, li_year1 ,li_year2  //**
string		ls_month1, ls_month2, ls_moneysheet_code, ls_datatype, ls_datadesc, ls_remark, ls_nature,as_acc_bs_ret_xml  //**
integer	li_month1, li_month2, li_datagen_1, li_datagen_2, li_totalshow, li_show_status //**
integer	li_index, li_page, li_show_all, li_percent_status, li_bold, li_line, li_upline, li_downline, li_moneysheet_seq//**
integer	li_rowshow, li_com_b1_b3,li_rc
datetime	ldtm_startdate, ldtm_enddate
decimal	ldc_balance1, ldc_balance2, ldc_balance3, ldc_balance4, ldc_sum1, ldc_sum2, ldc_percent1, ldc_percent2,	ldc_percent3, ldc_percent4   //**
decimal	ldc_sumpercent1 , ldc_sumpercent2   //**
 
n_ds	lds_acc_bs_sheet, lds_bs_report //**

 
li_com_b1_b3		= ai_compere_b1_b3 
li_percent_status	= ai_percent_status
ls_moneysheet_code		= trim(as_moneysheet_code)

//ls_month1		= string(lds_acc_bs_sheet.object.month_1_1[1])
li_month1		= ai_month_1
//ls_month2		= string(lds_acc_bs_sheet.object.month_2_1[1])
li_month2		= ai_month_2
li_show_all		= ai_total_show
li_datagen_1	= ai_data_1
li_datagen_2	= ai_data_2
li_remark		= ai_show_remark

if isnull( li_remark ) then li_remark = 0
if isnull( li_show_all ) then li_show_all = 1
li_page			= 1

if not isvalid( ids_finance_bs_show ) then
	ids_finance_bs_show	= create n_ds
	ids_finance_bs_show.dataobject = "d_acc_pl_service"
	ids_finance_bs_show.settransobject( itr_sqlca )
end if

ids_finance_bs_show.reset( )
li_rowshow		= ids_finance_bs_show.retrieve( as_moneysheet_code )

For li_index = 1 to li_rowshow
	if upper( trim( ids_finance_bs_show.object.description[li_index] ) ) = 'NEWPAGE' then
		li_page ++
		ids_finance_bs_show.object.show_status[li_index]	= 0
	end if
	//************  setup Initial  **************** //
	ids_finance_bs_show.object.percent_status[li_index]	= li_percent_status
	ids_finance_bs_show.object.sign_status[li_index]		= 0	
	ids_finance_bs_show.object.show_header.text			= ""	
	ids_finance_bs_show.object.total_show_1[li_index]	= li_show_all
	
	ids_finance_bs_show.object.page_group[li_index]		= li_page
	
next

//ll_year	= lds_acc_bs_sheet.object.year_1[1] ; if isnull( ll_year ) then ll_year = 0
//ll_year	= ll_year - 543
//ll_month	= lds_acc_bs_sheet.object.month_1[1] ; if isnull( ll_month ) then ll_month = 0

//***
li_year1	= ai_year_1 ; if isnull( li_year1 ) then li_year1 = 0
li_year2	= ai_year_2 ; if isnull( li_year2 ) then li_year2 = 0
ll_year	= ai_year_1 ; if isnull( ll_year ) then ll_year = 0
ll_year	= ll_year - 543
ll_month	= ai_month_1 ; if isnull( ll_month ) then ll_month = 0

//***

if ( ll_year > 0 ) and ( ll_month > 0 ) then
	
	setnull( ldtm_enddate )
	
	this.of_get_year_period( ll_year, ll_month, as_coop_id, ll_year_period, ll_period ) 
	this.of_get_period_date( ll_year_period, ll_period, as_coop_id, ldtm_startdate, ldtm_enddate)
	
	// test by rah
	if ( li_datagen_1 = 1 ) then
		this.of_start_gen_finances_stm( as_moneysheet_code , ldtm_startdate , ldtm_enddate, as_coop_id,  0  )
	else
		this.of_start_gen_finances_stm( as_moneysheet_code , ldtm_startdate , ldtm_enddate,as_coop_id,  1  )
	end if
	
	this.of_show_bs( as_moneysheet_code, ll_year_period, ll_period ,  "balance_1", "balance_2", li_datagen_1,as_coop_id )
	

else
	ithw_exception.text	= "ยังไม่ระบุปีในการแสดงข้อมูล 1 "
	throw ithw_exception
end if

//if  lds_acc_bs_sheet.object.total_show[1] > 1 then
if  ai_total_show > 1 then
	ll_year	= ai_year_2 ; if isnull( ll_year ) then ll_year = 0
	ll_year	= ll_year - 543
	ll_month	= ai_month_2 ; if isnull( ll_month ) then ll_month = 0

	if ( ll_year > 0 ) and ( ll_month > 0 ) then
		setnull( ldtm_enddate )
		this.of_get_year_period( ll_year, ll_month, as_coop_id, ll_year_period ,ll_period )	
		this.of_get_period_date( ll_year_period, ll_period, as_coop_id , ldtm_startdate, ldtm_enddate)
		
		// test by rah
		if ( li_datagen_2 = 1 ) then
			this.of_start_gen_finances_stm( as_moneysheet_code , ldtm_startdate , ldtm_enddate, as_coop_id , 0  )
		else
			this.of_start_gen_finances_stm( as_moneysheet_code , ldtm_startdate , ldtm_enddate, as_coop_id , 1  )
		end if
		
	
		this.of_show_bs( as_moneysheet_code, ll_year_period, ll_period ,  "balance_3", "balance_4", li_datagen_2 ,as_coop_id )  
	else
		ithw_exception.text	= "ยังไม่ระบุปีในการแสดงข้อมูล 2 "
		throw ithw_exception
	end if
end if

// by ra
if ( li_show_all = 1 ) then
	ids_finance_bs_show.SetFilter( "( show_status = 1 ) " )
else
	choose case ai_total_show
		case 1
			ids_finance_bs_show.SetFilter( "( show_status = 1 ) and ( ( data_type  = 'TX' ) or ( ( data_type  <> 'TX' ) and ( abs( balance_1 ) > 0 ) or ( abs( balance_3 ) > 0 ) ) )" )  //ทำให้จำนวนหน้ามีตามจริง
			
		case 2
			ids_finance_bs_show.SetFilter( "( show_status = 1 ) and ( ( data_type  = 'TX' ) or ( ( data_type  <> 'TX' ) and ( ( abs( balance_1 ) > 0 ) or ( abs( balance_3 ) > 0 ) ) ) )" )  //ทำให้จำนวนหน้ามีตามจริง
	end choose
end if

ids_finance_bs_show.Filter( )
ids_finance_bs_show.groupcalc( )


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////**** ยิงออก excel

as_acc_bs_ret_xml	= ids_finance_bs_show.describe( "Datawindow.data.XML" )

lds_bs_report		= create n_ds
lds_bs_report.dataobject = "d_acc_pl_service_report"   

if not  isnull( as_acc_bs_ret_xml ) and trim( as_acc_bs_ret_xml ) <> ""  then
	li_rc	= lds_bs_report.importstring( XML!, as_acc_bs_ret_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if


//ลบข้อมูลเก่าทิ้ง
delete from accsheetmoneyreport
commit using itr_sqlca ;

//d_acc_pl_service_report

//ll_row		= lds_bs_report.retrieve( as_moneysheet_code )
// ถ้าไม่มีรายการออกไป
if li_rc <= 0 then
	return 1
end if

for ll_index = 1 to li_rc

	ls_datatype		=	lds_bs_report.object.data_type[ ll_index ]
	ls_datadesc		=  lds_bs_report.object.description[ ll_index ]
	li_show_status	=  lds_bs_report.object.show_status[ ll_index ]
	li_bold			=  lds_bs_report.object.show_det_status1[ ll_index ]
	li_line				=  lds_bs_report.object.show_det_status3[ ll_index ]
	li_upline			=  lds_bs_report.object.up_line[ ll_index ]
	ls_remark		=  lds_bs_report.object.remark[ ll_index ]
	li_downline		=  lds_bs_report.object.down_line[ ll_index ]
	ldc_balance1	=  lds_bs_report.object.balance_1[ ll_index ]
	ldc_balance2	=  lds_bs_report.object.balance_2[ ll_index ]
	ldc_balance3	=  lds_bs_report.object.balance_3[ ll_index ]
	ldc_balance4	=  lds_bs_report.object.balance_4[ ll_index ]
	ls_nature			=  lds_bs_report.object.operate_nature[ ll_index ]
	li_percent_status	= lds_bs_report.object.percent_status[ ll_index ]
	ldc_percent1	=  lds_bs_report.object.percent_1[ ll_index ]
	ldc_percent2	=  lds_bs_report.object.percent_2[ ll_index ]
	ldc_percent3	=  lds_bs_report.object.percent_3[ ll_index ]
	ldc_percent4	=  lds_bs_report.object.percent_4[ ll_index ]
	li_moneysheet_seq	= lds_bs_report.object.moneysheet_seq[ ll_index ]
	li_totalshow		= lds_bs_report.object.total_show_1[ ll_index ]
	
	if isnull(ldc_balance1) then ldc_balance1 = 0
	if isnull(ldc_balance2) then ldc_balance2 = 0
	if isnull(ldc_balance3) then ldc_balance3 = 0
	if isnull(ldc_balance4) then ldc_balance4 = 0
	if isnull(ldc_percent1) then ldc_percent1 = 0.00
	if isnull(ldc_percent2) then ldc_percent2 = 0.00
	if isnull(ldc_percent3) then ldc_percent3 = 0.00
	if isnull(ldc_percent4) then ldc_percent4 = 0.00
	if isnull(li_moneysheet_seq) then li_moneysheet_seq = 0
	if isnull(li_totalshow) then li_totalshow = 1
	
	ldc_sum1	=	ldc_balance1    //ยอดรวมของรายการที่ 1   //**
	ldc_sum2	=	ldc_balance3 	//ยอดรวมของรายการที่ 2 //**
	ldc_sumpercent1	=	ldc_balance2    //**
	ldc_sumpercent2	= 	ldc_balance4    //**
	
	as_moneysheet_code = trim(as_moneysheet_code)

  INSERT INTO ACCSHEETMONEYREPORT  
         ( 	MONEYSHEET_CODE,			MONEYSHEET_SEQ, 				DATA_TYPE,   			         
			DATA_DESC,   		        SHOW_STATUS,   					BOLD_STATUS,   			     
			LINE_STATUS,				UP_LINES, 						DOWN_LINE,   					
			REMARK,						BALANCE_1,						BALANCE_2,   			     	
		  	PERCENT_1,   				PERCENT_2,						PERCENT_STATUS,   			
		  	OPERATE_NATURE,   			YEAR_1,							YEAR_2,   							
		  	MONTH_1, 					MONTH_2,						TOTAL_SHOW)  
  VALUES ( 
  		  :as_moneysheet_code,			:ll_index,						:ls_datatype,						
		  :ls_datadesc,					:li_show_status,				:li_bold,							
		  :li_line,						:li_upline,						:li_downline,						
		  :ls_remark,					:ldc_sum1,						:ldc_sum2,							
		  :ldc_sumpercent1,				:ldc_sumpercent2,				:li_percent_status,				
		  :ls_nature,					:li_year1,						:li_year2,							
		  :li_month1,					:li_month2,						:li_totalshow
		  ) using itr_sqlca ;
  
 
  if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถออกรายงานได้ กรุณาตรวจสอบ "   + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if

next
//****

commit using itr_sqlca ;
return 1
end function

on n_cst_account_service.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_account_service.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ithw_exception		= create Exception
end event
