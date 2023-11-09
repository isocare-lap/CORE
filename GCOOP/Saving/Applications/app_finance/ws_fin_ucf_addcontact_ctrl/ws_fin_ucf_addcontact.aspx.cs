using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;

namespace Saving.Applications.app_finance.ws_fin_ucf_addcontact_ctrl
{
    public partial class ws_fin_ucf_addcontact : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public string JsPostGetDistrict { get; set; }
        [JsPostBack]
        public string JsPostProvince { get; set; }
        [JsPostBack]
        public string JsPostGetBank { get; set; }
        [JsPostBack]
        public string JsPostRrieveContack { get; set; }
        [JsPostBack]
        public string JsPostDelete { get; set; }
        [JsPostBack]
        public string JsPostTaxid { get; set; }

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
        }
        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                LoadBegin();
            }
        }
        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == JsPostProvince)
            {
                string province = dsMain.DATA[0].PROVINCE;
                dsMain.Ddprovince();
                dsMain.Dddistrict(province);
            }
            else if (eventArg == JsPostGetDistrict)
            {
                string district = dsMain.DATA[0].DISTRICT;
                string postcode = "";
                string sql = @"select postcode from MBUCFDISTRICT where district_code ={0}";
                sql = WebUtil.SQLFormat(sql, district);
                Sdt dt = WebUtil.QuerySdt(sql);
                if (dt.Next())
                {
                    postcode = dt.GetString("postcode");
                }
                dsMain.DATA[0].POSTCODE = postcode;
                dsMain.Ddtambol(district);
            }
            else if (eventArg == JsPostGetBank)
            {
                string bank_code = dsMain.DATA[0].BANK_CODE;
                dsMain.Ddbank();
                dsMain.Ddbankbranch(bank_code);
            }
            else if (eventArg == JsPostRrieveContack)
            {
                string ls_contackno = dsMain.DATA[0].CONTACK_NO;
                PostRrieveContack(ls_contackno);
            }
            else if (eventArg == JsPostDelete)
            {
                PostDeleterow();
            }
            else if (eventArg == "JsPostTaxid")
            {
                string ls_err = PostTaxid(dsMain.DATA[0].PERSONTYPE_CODE, dsMain.DATA[0].CONTACK_NO);
            }
        }
        private void PostRrieveContack(string ls_contackno)
        {
            dsMain.RetrieveMain(ls_contackno);
            string province = dsMain.DATA[0].PROVINCE;
            string bank = dsMain.DATA[0].BANK_CODE;
            dsMain.Ddprename();
            dsMain.Ddprovince();
            dsMain.Dddistrict(province);
            dsMain.Ddtambol(dsMain.DATA[0].DISTRICT);
            dsMain.Ddbank();
            dsMain.Ddbankbranch(bank);
        }
        private string PostTaxid(string person_type, string contack_no)
        {
            string ls_taxid = dsMain.DATA[0].TAX_ID;
            Int32 pidchk = 0;
            Int32 dig = 0;
            Int32 fdig = 0;
            String lasttext = "", ls_result = "",ls_sqltext="";
            int ln_chkdata = 0;
            try
            {
                if (contack_no != "AUTO") { 
                    ls_sqltext = "and CONTACK_NO <>'"+contack_no+"' ";
                }
                if (person_type == "01")
                {
                    pidchk = (Convert.ToInt32(ls_taxid.Substring(0, 1)) * 13) + (Convert.ToInt32(ls_taxid.Substring(1, 1)) * 12) + (Convert.ToInt32(ls_taxid.Substring(2, 1)) * 11) + (Convert.ToInt32(ls_taxid.Substring(3, 1)) * 10) + (Convert.ToInt32(ls_taxid.Substring(4, 1)) * 9) + (Convert.ToInt32(ls_taxid.Substring(5, 1)) * 8) + (Convert.ToInt32(ls_taxid.Substring(6, 1)) * 7) + (Convert.ToInt32(ls_taxid.Substring(7, 1)) * 6) + (Convert.ToInt32(ls_taxid.Substring(8, 1)) * 5) + (Convert.ToInt32(ls_taxid.Substring(9, 1)) * 4) + (Convert.ToInt32(ls_taxid.Substring(10, 1)) * 3) + (Convert.ToInt32(ls_taxid.Substring(11, 1)) * 2);
                    dig = pidchk % 11;
                    fdig = 11 - dig;
                    lasttext = fdig.ToString();
                    if (ls_taxid.Substring(12, 1) == WebUtil.Right(lasttext, 1))
                    {
                        string sql = @"SELECT COUNT(1) CHKDATA from FINCONTACKMASTER WHERE COOP_ID = {0} AND TAX_ID={1} "+ls_sqltext ;
                        sql = WebUtil.SQLFormat(sql, state.SsCoopControl, ls_taxid);
                        WebUtil.ExeSQL(sql);
                        Sdt dt = WebUtil.QuerySdt(sql);
                        if (dt.Next())
                        {
                            ln_chkdata = dt.GetInt32("chkdata");
                        }
                        if (ln_chkdata > 0)
                        {
                            ls_result = "เลขผู้เสียภาษีดังกล่าวมีอยู่แล้ว";
                            this.SetOnLoadedScript("alert('เลขผู้เสียภาษีดังกล่าวมีอยู่แล้ว')");
                        }
                    }
                    else
                    {
                        ls_result = "เลขบัตรประชาชนไม่ถูกต้อง";
                        this.SetOnLoadedScript("alert('เลขบัตรประชาชนไม่ถูกต้อง')");
                    }
                }
                else
                {
                    string sql = @"SELECT COUNT(1) CHKDATA from FINCONTACKMASTER WHERE COOP_ID = {0} AND TAX_ID={1} " + ls_sqltext;
                    sql = WebUtil.SQLFormat(sql, state.SsCoopControl, ls_taxid);
                    WebUtil.ExeSQL(sql);
                    Sdt dt = WebUtil.QuerySdt(sql);
                    if (dt.Next())
                    {
                        ln_chkdata = dt.GetInt32("chkdata");
                    }
                    if (ln_chkdata > 0)
                    {
                        ls_result = "เลขผู้เสียภาษีดังกล่าวมีอยู่แล้ว";
                        this.SetOnLoadedScript("alert('เลขผู้เสียภาษีดังกล่าวมีอยู่แล้ว')");
                    }
                }
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex.Message);
            }
            return ls_result;
        }
        public void SaveWebSheet()
        {
            try
            {
                String contack_no = dsMain.DATA[0].CONTACK_NO;
                String first_name = dsMain.DATA[0].FIRST_NAME;
                String persontype_code = dsMain.DATA[0].PERSONTYPE_CODE;
                String last_name = dsMain.DATA[0].LAST_NAME;
                String prename_code = dsMain.DATA[0].PRENAME_CODE.Trim();
                String tax_id = dsMain.DATA[0].TAX_ID;
                String province = dsMain.DATA[0].PROVINCE;
                String address_no = dsMain.DATA[0].ADDRESS_NO;
                String road_name = dsMain.DATA[0].ROAD_NAME;
                String district = dsMain.DATA[0].DISTRICT;
                String soi_no = dsMain.DATA[0].SOI_NO;
                String email_addr = dsMain.DATA[0].EMAIL_ADDR;
                String phene_no = dsMain.DATA[0].PHENE_NO;
                String mobile_no = dsMain.DATA[0].MOBILE_NO;
                String fax_no = dsMain.DATA[0].FAX_NO;
                String subdistrict = dsMain.DATA[0].SUBDISTRICT;
                String postcode = dsMain.DATA[0].POSTCODE;
                String coop_id = state.SsCoopControl;
                String bank_code = dsMain.DATA[0].BANK_CODE;
                String bank_branch = dsMain.DATA[0].BANK_BRANCH;
                String acc_id = dsMain.DATA[0].ACC_ID;
                String sqlStr = "";
                //if (tax_id.Length < 13)
                //{
                //    LtServerMessage.Text = WebUtil.ErrorMessage("เลขผู้เสียภาษีไม่ครบ 13 หลัก"); return;
                //}
                string ls_err = PostTaxid(dsMain.DATA[0].PERSONTYPE_CODE, contack_no);
                if (ls_err.Length > 0)
                {
                    LtServerMessage.Text = WebUtil.ErrorMessage(ls_err); return;
                }
                if (contack_no == null || contack_no == "AUTO")
                {
                    string sql = "";
                        sql = @"select nvl(max(contack_no),0) as contack_no from FINCONTACKMASTER where coop_id ={0}";
                    sql = WebUtil.SQLFormat(sql, state.SsCoopId);
                    Sdt dt = WebUtil.QuerySdt(sql);
                    if (dt.Next())
                    {
                        contack_no = dt.GetString("CONTACK_NO");
                        contack_no = Convert.ToString(Convert.ToDecimal(contack_no) + 1);
                        while (contack_no.Length < 8)
                        {
                            contack_no = "0" + contack_no;
                        }
                    }
                    sqlStr = @"INSERT INTO FINCONTACKMASTER  
            (COOP_ID,CONTACK_NO,PERSONTYPE_CODE,PRENAME_CODE,FIRST_NAME,LAST_NAME, TAX_ID,ADDRESS_NO,SOI_NO,ROAD_NAME,EMAIL_ADDR,PHENE_NO,   
           	MOBILE_NO,FAX_NO,DISTRICT,SUBDISTRICT,POSTCODE,PROVINCE,ACC_ID,BANK_CODE,BANK_BRANCH)  
            VALUES({0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},	{12},{13},{14},{15},{16},{17},{18},{19},{20})";
                    sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopId, contack_no, persontype_code, prename_code, first_name, last_name, tax_id, address_no,
                        soi_no, road_name, email_addr, phene_no, mobile_no, fax_no, district, subdistrict, postcode, province, acc_id, bank_code, bank_branch);
                    WebUtil.ExeSQL(sqlStr);
                }

                else
                {
                    sqlStr = @" update FINCONTACKMASTER
	                        set		PERSONTYPE_CODE	= {2},   	
			                        PRENAME_CODE		= {3},   	
			                        FIRST_NAME			= {4},   		
			                        LAST_NAME				= {5},   
           	                        TAX_ID					= {6},   		
			                        ADDRESS_NO			= {7},   	
			                        SOI_NO					= {8},   					
			                        ROAD_NAME			= {9},   			
			                        EMAIL_ADDR			= {10},   		
			                        PHENE_NO				= {11},   
           	                        MOBILE_NO				= {12},   	
			                        FAX_NO					= {13},   			
			                        DISTRICT				= {14},   	           	
			                        SUBDISTRICT			= {15},   		
			                        POSTCODE				= {16},   			
			                        PROVINCE				= {17},
			                        acc_id					= {18},
			                        bank_code				= {19},
			                        bank_branch			= {20}
	                        where coop_id 					= {0}
	                        and	CONTACK_NO			= {1}";
                    sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopControl, contack_no, persontype_code, prename_code, first_name, last_name, tax_id, address_no,
                        soi_no, road_name, email_addr, phene_no, mobile_no, fax_no, district, subdistrict, postcode, province, acc_id, bank_code, bank_branch);
                    WebUtil.ExeSQL(sqlStr);
                }

                dsMain.ResetRow();
                LoadBegin();
                PostRrieveContack(contack_no);
                LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกข้อมูล " + contack_no + " " + first_name + " " + last_name + " เรียบร้อย");
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("บันทึกไม่สำเสร็จ" + ex);
            }
        }

        public void WebSheetLoadEnd()
        {

        }
        public void LoadBegin()
        {
            dsMain.DATA[0].CONTACK_NO = "AUTO";
            dsMain.Ddprename();
            dsMain.DATA[0].PROVINCE = "0";
            dsMain.Ddprovince();
            dsMain.Ddbank();
        }
        public void PostDeleterow()
        {
            string ls_contack = dsMain.DATA[0].CONTACK_NO;
            string check_sql = @"select member_no as contack_no from finslip where member_no ={0} and member_flag = 0 and payment_status=1";
            check_sql = WebUtil.SQLFormat(check_sql, ls_contack);
            Sdt dt = WebUtil.QuerySdt(check_sql);
            if (dt.Next())
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถลบข้อมูลรหัส " + ls_contack + " ได้ เนื่องจากมีการใช้งานรหัสดังกล่าวแล้ว"); return;
            }
            else
            {
                string delete = @"DELETE from FINCONTACKMASTER where contack_no = {0}";
                delete = WebUtil.SQLFormat(delete, ls_contack);
                WebUtil.ExeSQL(delete);
                LtServerMessage.Text = WebUtil.CompleteMessage("ลบข้อมูล " + ls_contack + " " + dsMain.DATA[0].FIRST_NAME + " " + dsMain.DATA[0].LAST_NAME + " เรียบร้อย");
                dsMain.ResetRow();
                LoadBegin();

            }
        }
    }
}