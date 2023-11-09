﻿using System;
using CoreSavingLibrary;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
//using CoreSavingLibrary.WcfNCommon;
//using CoreSavingLibrary.WcfNDeposit;
using CoreSavingLibrary.WcfNCommon; // new common
using CoreSavingLibrary.WcfNDeposit;// new deposit
using Sybase.DataWindow;
using System.Web.Services.Protocols;
using DataLibrary;

namespace Saving.Applications.ap_deposit
{
    public partial class w_sheet_dp_reprint_slip : PageWebSheet, WebSheet
    {
        protected string postAccount;
        protected string PrintSlip;
        //private DepositClient depService;
        private n_depositClient ndept;

        public void InitJsPostBack()
        {
            postAccount = WebUtil.JsPostBack(this, "postAccount");
            PrintSlip = WebUtil.JsPostBack(this, "PrintSlip");
        }

        public void WebSheetLoadBegin()
        {
            this.ConnectSQLCA();
            DwData.SetTransaction(sqlca);
            DwDetail.SetTransaction(sqlca);
            try
            {
                //depService = wcf.Deposit;
                ndept = wcf.NDeposit;
            }
            catch
            { }
            if (!IsPostBack)
            {
                DwData.InsertRow(0);
            }
            else
            {
                this.RestoreContextDw(DwData);
                this.RestoreContextDw(DwDetail);
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == "postAccount")
            {
                JspostAccount();
            }
            else if (eventArg == "PrintSlip")
            {
                JsPrintSlip();
            }
        }

        public void SaveWebSheet()
        {
        }

        public void WebSheetLoadEnd()
        {
            DwData.SaveDataCache();
            DwDetail.SaveDataCache();
        }

        private void JspostAccount()
        {
            string ls_member_no, ls_member_name, ls_member_surname, ls_member_group_no;
            string ls_account_no, ls_account_name, ls_account_type;
            string ls_sqlext, ls_temp, ls_coopid;
            ls_sqlext = "";
            String sqlFirst = @"
	            SELECT 
	                DPDEPTSLIP.DEPTSLIP_NO,   
	                DPDEPTSLIP.DEPTSLIP_DATE,   
	                DPDEPTSLIP.RECPPAYTYPE_CODE,   
	                DPDEPTSLIP.DEPTSLIP_AMT,   
	                DPDEPTSLIP.ENTRY_ID,   
	                DPDEPTMASTER.DEPTACCOUNT_NO,   
	                DPDEPTMASTER.MEMBER_NO,   
	                DPDEPTMASTER.DEPTACCOUNT_NAME,   
	                DPDEPTMASTER.DEPTTYPE_CODE,   
	                MBMEMBMASTER.MEMB_NAME,   
	                MBMEMBMASTER.MEMB_SURNAME,   
	                MBMEMBMASTER.MEMBGROUP_CODE,   
	                DPDEPTMASTER.DEPT_OBJECTIVE,   
	                DPDEPTSLIP.ENTRY_DATE,   
	                DPDEPTSLIP.DPSTM_NO,   
	                DPDEPTSLIP.CASH_TYPE,   
	                DPDEPTSLIP.INT_AMT,   
	                DPDEPTSLIP.ACCUINT_AMT,   
	                DPDEPTSLIP.DEPTGROUP_CODE,   
	                DPDEPTSLIP.DEPTSLIP_NETAMT,   
	                DPDEPTSLIP.REFER_SLIPNO,   
	                DPDEPTSLIP.COOP_ID  
                FROM 
	                DPDEPTSLIP,   
	                DPDEPTMASTER,   
	                MBMEMBMASTER,   
	                DPUCFRECPPAYTYPE  
                WHERE 
	                ( dpdeptmaster.member_no = mbmembmaster.member_no (+)) and  
	                ( dpdeptmaster.coop_id = mbmembmaster.coop_id (+)) and  
	                ( DPDEPTSLIP.DEPTACCOUNT_NO = DPDEPTMASTER.DEPTACCOUNT_NO ) and  
	                ( DPDEPTSLIP.RECPPAYTYPE_CODE = DPUCFRECPPAYTYPE.RECPPAYTYPE_CODE ) and  
	                ( DPDEPTSLIP.DEPTCOOP_ID = DPDEPTMASTER.COOP_ID ) and  
	                ( DPDEPTSLIP.DEPTCOOP_ID = DPUCFRECPPAYTYPE.COOP_ID ) and  
	                ( DPDEPTSLIP.RECPPAYTYPE_CODE not in ( 'WIN','INR','FEE','TAX' ) ) AND  
	                rownum <= 50000               
            ";
            try
            {
                ls_member_no = DwData.GetItemString(1, "member_no");
            }
            catch
            {
                ls_member_no = "";
            }
            try
            {
                ls_member_name = DwData.GetItemString(1, "member_name");
            }
            catch
            {
                ls_member_name = "";
            }
            try
            {
                ls_member_surname = DwData.GetItemString(1, "member_surname");
            }
            catch
            {
                ls_member_surname = "";
            }
            try
            {
                ls_member_group_no = DwData.GetItemString(1, "member_group_no");
            }
            catch
            {
                ls_member_group_no = "";
            }
            try
            {
                ls_account_no = DwData.GetItemString(1, "account_no");
            }
            catch
            {
                ls_account_no = "";
            }
            try
            {
                ls_account_name = DwData.GetItemString(1, "account_name");
            }
            catch
            {
                ls_account_name = "";
            }
            try
            {
                ls_account_type = DwData.GetItemString(1, "account_type");
            }
            catch
            {
                ls_account_type = "";
            }
            try
            {
                ls_coopid = state.SsCoopId.Trim();//DwData.GetItemString(1, "coop_id");
            }
            catch
            {
                ls_coopid = "";
            }
            //--
            if (ls_member_no.Length > 0)
            {
                ls_sqlext = " and ( dpdeptmaster.member_no = '" + ls_member_no + "') ";
            }
            if (ls_member_name.Length > 0)
            {
                ls_sqlext += " and ( mbmembmaster.memb_name like '" + ls_member_name + "%') ";
            }
            if (ls_member_surname.Length > 0)
            {
                ls_sqlext += " and ( mbmembmaster.memb_surname like '" + ls_member_surname + "%') ";
            }
            if (ls_member_group_no.Length > 0)
            {
                ls_sqlext += " and ( mbmembmaster.membgroup_code = '" + ls_member_group_no + "') ";
            }
            if (ls_account_no.Length > 0)
            {
                ls_sqlext += " and ( dpdeptmaster.deptaccount_no Like '%" + ls_account_no + "%' ) ";
            }
            if (ls_account_name.Length > 0)
            {
                ls_sqlext += " and ( dpdeptmaster.deptaccount_name Like '" + ls_account_name + "%') ";
            }
            if (ls_account_type.Length > 0)
            {
                ls_sqlext += " and ( dpdeptmaster.depttype_code = '" + ls_account_type + "') ";
            }
            if (ls_coopid.Length > 0)
            {
                ls_sqlext += " and ( dpdeptslip.coop_id = '" + ls_coopid + "') ";
            }
            if (ls_sqlext == null) ls_sqlext = "";

            ls_sqlext += " ORDER BY DPDEPTSLIP.DEPTSLIP_DATE DESC,DPDEPTSLIP.DEPTSLIP_NO DESC ";

            ls_temp = sqlFirst + ls_sqlext;

            DataTable dt = WebUtil.Query(ls_temp);
            DwUtil.ImportData(dt, DwDetail, null);
        }

        private void JsPrintSlip()
        {
            string deptSlipNo = HdDeptSlip.Value;
            try
            {
                string sql = "";
                int printStatus = xmlconfig.DepositPrintMode;
                string xml_return = "",ls_receiptno = "";
                string ls_coopid = state.SsCoopControl;
                int re = ndept.of_print_slip(state.SsWsPass, deptSlipNo, state.SsCoopId, state.SsPrinterSet, 1, ref xml_return);
                if (xml_return != "")
                {
                    //ผู้ฝากรวม สอ.ครูลำปาง 
                    if (state.SsCoopId == "027001")
                    {
                        String deptAccountNo = "";
                        string sql_deptno = @"select deptaccount_no from dpdeptslip where deptslip_no='" + deptSlipNo + "' ";
                        Sdt dt_depno = WebUtil.QuerySdt(sql_deptno);
                        if (dt_depno != null)
                        {
                            deptAccountNo = dt_depno.Rows[0]["deptaccount_no"].ToString();
                        }
                        string dpcodepsoit = "";
                        sql = @"SELECT trim(DPCODEPOSIT.seq_no) as num_no,mbucfprename.prename_desc,DPCODEPOSIT.NAME,DPCODEPOSIT.SURNAME
                                   FROM DPCODEPOSIT,mbucfprename
                                   WHERE (DPCODEPOSIT.PRENAME_CODE  = mbucfprename.PRENAME_CODE) 
                                   and  ( DPCODEPOSIT.DEPTACCOUNT_NO = '" + deptAccountNo + @"' ) 
                                   AND  ( DPCODEPOSIT.COOP_ID = '" + ls_coopid + @"' )
                                   order by  DPCODEPOSIT.SEQ_NO";
                        Sdt dt = WebUtil.QuerySdt(sql);
                        if (dt != null)
                        {
                            while (dt.Next())
                            {
                                dpcodepsoit += "<dp_" + dt.GetString("num_no") + ">ลำดับที่ " + dt.GetString("num_no") + " : " + dt.GetString("prename_desc") + dt.GetString("NAME") + "  " + dt.GetString("SURNAME") + "</dp_" + dt.GetString("num_no") + ">";
                            }
                            string value_split = "</d_dp_print_slip_new_row></d_dp_print_slip_new>";
                            String[] str = System.Text.RegularExpressions.Regex.Split(xml_return, value_split);
                            xml_return = str[0] + dpcodepsoit + value_split;
                        }
                    }
                    //เฉพาะประเภท   71  72 เป็นอีกฟอร์มนึง
//                    string ls_depttype = DwDetail.GetItemString(1, "depttype_code");
//                    if (ls_depttype == "71" || ls_depttype == "72")
//                    {
//                        String slipNo = DwDetail.GetItemString(1, "deptslip_no").Trim();
//                        String recpaytype_code = DwDetail.GetItemString(1, "recppaytype_code").Trim();
//                        decimal ld_flag = 0;
//                        sql = @"select recppaytype_flag from dpucfrecppaytype where recppaytype_code={0}";
//                        sql = WebUtil.SQLFormat(sql, recpaytype_code);
//                        Sdt dt = WebUtil.QuerySdt(sql);
//                        if (dt.Next())
//                        {
//                            ld_flag = dt.GetDecimal("recppaytype_flag");
//                        }
//                        if (ld_flag == 1)
//                        {
//                            try
//                            {
//                                ls_receiptno = "";// wcf.NCommon.of_getnewdocno(state.SsWsPass, ls_coopid, "FNRECEIPTNO");
//                                sql = @"update dpdeptslip set remark = {0} 
//                                      where coop_id = {0} and deptslip_no = {1}";
//                                sql = WebUtil.SQLFormat(sql, ls_coopid, slipNo);
//                                WebUtil.ExeSQL(sql);

//                                String ReportName = "ir_printdep_receipt";
//                                iReportArgument args = new iReportArgument();
//                                args.Add("as_coopid", iReportArgumentType.String, ls_coopid);
//                                args.Add("as_slipno", iReportArgumentType.String, slipNo);
//                                iReportBuider report = new iReportBuider(this, "กำลังสร้างใบเสร็จรับเงิน");
//                                report.AddCriteria(ReportName, "ใบเสร็จรับเงิน", ReportType.pdf, args);
//                                report.AutoOpenPDF = true;
//                                report.Retrieve();
//                                //return true;
//                            }
//                            catch (Exception ex)
//                            {
//                                LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถสร้างใบเสร็จรับเงินได้");
//                                //return false;
//                            }
//                        }
//                        else
//                        {
//                            try
//                            {
//                                ls_receiptno = "";// wcf.NCommon.of_getnewdocno(state.SsWsPass, ls_coopid, "FNPAYSLIPNO");
//                                sql = @"update dpdeptslip set remark = {0} 
//                                      where coop_id = {0} and deptslip_no = {1}";
//                                sql = WebUtil.SQLFormat(sql, ls_coopid, slipNo);
//                                WebUtil.ExeSQL(sql);

//                                String ReportName = "ir_printdep_payslip";
//                                iReportArgument args = new iReportArgument();
//                                args.Add("as_coopid", iReportArgumentType.String, ls_coopid);
//                                args.Add("as_slipno", iReportArgumentType.String, slipNo);
//                                iReportBuider report = new iReportBuider(this, "กำลังสร้างใบสำคัญจ่าย");
//                                report.AddCriteria(ReportName, "ใบสำคัญจ่าย", ReportType.pdf, args);
//                                report.AutoOpenPDF = true;
//                                report.Retrieve();
//                                //return true;
//                            }
//                            catch (Exception ex)
//                            {
//                                LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถสร้างใบสำคัญจ่ายได้");
//                                //return false;
//                            }
//                        }
//                    }
//                    else
//                    {
//                        //end add lap
//                        Printing.PrintApplet(this, "dept_slip", xml_return);
//                    }
                    //
                    //Printing.PrintAppletPBFinish(this, "dept_slip", xml_return);


                    Printing.PrintApplet(this, "dept_slip", xml_return);
                }
                LtServerMessage.Text = WebUtil.CompleteMessage("เสร็จสมบูรณ์...");
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }
        }
    }
}