using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;
using DataLibrary;

namespace Saving.Applications.deposit.ws_dep_reprintslip_ctrl
{
    public partial class ws_dep_reprintslip : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public String PostPrintSlip { get; set; }

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
        }

        public void WebSheetLoadBegin()
        {
            System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("th-TH");
            if (!IsPostBack)
            {
                LoadBegin();
            }
        }
        private void LoadBegin()
        {
            DateTime work_date = state.SsWorkDate;
            dsMain.DATA[0].START_DATE = work_date;
            dsMain.DATA[0].END_DATE = work_date;
            dsMain.DD_Depttype();
            dsMain.DATA[0].COOP_ID = state.SsCoopId;
            dsMain.DD_Coopbranch();
        }
        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == "PostPrintSlip")
            {
                try
                {
                    string ls_deptslipno = HdDPslip.Value.Trim();
                    string sql = "", ls_receiptno="";
                    string ls_recpay = HdRecpay.Value;
                    decimal ld_flag = 0;
                    string ls_coopid = state.SsCoopControl;
                    string sqlrec = @"select recppaytype_flag from dpucfrecppaytype where recppaytype_code = {0}";
                    sqlrec = WebUtil.SQLFormat(sqlrec, ls_recpay);
                    Sdt sdt = WebUtil.QuerySdt(sqlrec);
                    if (sdt.Next())
                    {
                        ld_flag = sdt.GetDecimal("recppaytype_flag");
                    }                              
                  
                    if (ld_flag == 1)
                    {
                        try
                        {
                            ls_receiptno = "";// wcf.NCommon.of_getnewdocno(state.SsWsPass, ls_coopid, "FNRECEIPTNO");
                            sql = @"update dpdeptslip set remark = {2} 
                                    where coop_id = {0} and deptslip_no = {1}";
                            sql = WebUtil.SQLFormat(sql, ls_coopid, ls_deptslipno, ls_receiptno);
                            WebUtil.ExeSQL(sql);

                            String ReportName = "ir_printdep_receipt";
                            iReportArgument args = new iReportArgument();
                            args.Add("as_coopid", iReportArgumentType.String, ls_coopid);
                            args.Add("as_slipno", iReportArgumentType.String, ls_deptslipno);
                            iReportBuider report = new iReportBuider(this, "กำลังสร้างใบเสร็จรับเงิน");
                            report.AddCriteria(ReportName, "ใบเสร็จรับเงิน", ReportType.pdf, args);
                            report.AutoOpenPDF = true;
                            report.Retrieve();
                            //return true;
                        }
                        catch (Exception ex)
                        {
                            LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถสร้างใบเสร็จรับเงินได้");
                            //return false;
                        }
                    }
                    else
                    {
                        try
                        {
                            ls_receiptno = "";// wcf.NCommon.of_getnewdocno(state.SsWsPass, ls_coopid, "FNPAYSLIPNO");
                            sql = @"update dpdeptslip set remark = {2} 
                                    where coop_id = {0} and deptslip_no = {1}";
                            sql = WebUtil.SQLFormat(sql, ls_coopid, ls_deptslipno, ls_receiptno);
                            WebUtil.ExeSQL(sql);

                            String ReportName = "ir_printdep_payslip";
                            iReportArgument args = new iReportArgument();
                            args.Add("as_coopid", iReportArgumentType.String, ls_coopid);
                            args.Add("as_slipno", iReportArgumentType.String, ls_deptslipno);
                            iReportBuider report = new iReportBuider(this, "กำลังสร้างใบสำคัญจ่าย");
                            report.AddCriteria(ReportName, "ใบสำคัญจ่าย", ReportType.pdf, args);
                            report.AutoOpenPDF = true;
                            report.Retrieve();
                            //return true;
                        }
                        catch (Exception ex)
                        {
                            LtServerMessage.Text = WebUtil.ErrorMessage("ไม่สามารถสร้างใบสำคัญจ่ายได้");
                            //return false;
                        }
                    }
                }
                catch (Exception ex)
                {
                    LtServerMessage.Text = WebUtil.ErrorMessage(ex.Message);
                }
            }
        }
        public void SaveWebSheet()
        {
        }
        protected void BtSearch_Click(object sender, EventArgs e)
        {
            string ls_deptno = "", ls_deptname = "", ls_memname = "", ls_memsurname = "";
            string ls_depttype = "", ls_memno = "";
            string ls_sqlext = "";
            string coop_id = state.SsCoopId;
            ls_deptno = dsMain.DATA[0].DEPTACCOUNT_NO.Trim();
            if (ls_deptno.Length > 0)
            {
                ls_deptno = wcf.NDeposit.of_analizeaccno(state.SsWsPass, ls_deptno.Replace("-", "").Trim());
                dsMain.DATA[0].DEPTACCOUNT_NO = WebUtil.ViewAccountNoFormat(ls_deptno);
            }
            ls_deptname = dsMain.DATA[0].DEPTACCOUNT_NAME.Trim();
            ls_depttype = dsMain.DATA[0].DEPTTYPE_CODE.Trim();
            ls_memno = dsMain.DATA[0].MEMBER_NO.Trim();
            ls_memname = dsMain.DATA[0].MEMB_NAME.Trim();
            ls_memsurname = dsMain.DATA[0].MEMB_SURNAME.Trim();
            DateTime start_date = dsMain.DATA[0].START_DATE;
            DateTime end_date = dsMain.DATA[0].END_DATE;

            if (ls_deptno.Length > 0)
            {
                ls_sqlext += " and (  DPDEPTMASTER.DEPTACCOUNT_NO like '%" + ls_deptno + "%') ";
            }
            if (ls_deptname.Length > 0)
            {
                ls_sqlext += " and (  DPDEPTMASTER.DEPTACCOUNT_NAME like '%" + ls_deptname + "%') ";
            }
            if (ls_depttype.Length > 0)
            {
                ls_sqlext += " and ( DPDEPTMASTER.DEPTTYPE_CODE = '" + ls_depttype + "') ";
            }
            if (ls_memno.Length > 0)
            {
                ls_sqlext += " and ( DPDEPTMASTER.MEMBER_NO like '%" + ls_memno + "%') ";
            }
            if (ls_memname.Length > 0)
            {
                ls_sqlext += " and ( mbmembmaster.memb_name like '%" + ls_memname + "%')";
            }
            if (ls_memsurname.Length > 0)
            {
                ls_sqlext += " and ( mbmembmaster.memb_surname  like '%" + ls_memsurname + "%')";
            }
            string sql = @"SELECT  
            DPDEPTSLIP.DEPTSLIP_NO ,      	DPDEPTSLIP.DEPTSLIP_DATE ,              DPDEPTSLIP.RECPPAYTYPE_CODE ,       
            DPDEPTSLIP.ENTRY_ID ,           DPDEPTMASTER.DEPTACCOUNT_NO ,           DPDEPTSLIP.ENTRY_DATE ,
            DPDEPTMASTER.MEMBER_NO ,        DPDEPTMASTER.DEPTACCOUNT_NAME ,         DPDEPTMASTER.DEPTTYPE_CODE ,          
            MBMEMBMASTER.MEMB_NAME ,        MBMEMBMASTER.MEMB_SURNAME ,           	MBMEMBMASTER.MEMBGROUP_CODE ,        
            DPDEPTMASTER.DEPT_OBJECTIVE ,   DPDEPTSLIP.DEPTSLIP_NETAMT      
            FROM DPDEPTSLIP ,           DPDEPTMASTER ,           MBMEMBMASTER ,           DPUCFRECPPAYTYPE     
            WHERE ( DPDEPTMASTER.MEMBER_NO = MBMEMBMASTER.MEMBER_NO) and         
            ( DPDEPTMASTER.COOP_ID = MBMEMBMASTER.COOP_ID) and          
            ( DPDEPTSLIP.DEPTACCOUNT_NO = DPDEPTMASTER.DEPTACCOUNT_NO ) and          
            ( DPDEPTSLIP.RECPPAYTYPE_CODE = DPUCFRECPPAYTYPE.RECPPAYTYPE_CODE ) and          
            ( DPDEPTSLIP.DEPTCOOP_ID = DPDEPTMASTER.COOP_ID ) and          
            ( DPDEPTSLIP.DEPTCOOP_ID = DPUCFRECPPAYTYPE.COOP_ID ) and          
            ( DPUCFRECPPAYTYPE.group_itemtpe  in ( 'INT' ) )  AND
            ( DPDEPTMASTER.DEPTTYPE_CODE IN('71','72') ) AND 
            ( DPDEPTSLIP.COOP_ID = {0}) AND 
            ( DPDEPTSLIP.DEPTSLIP_DATE BETWEEN {1} AND {2} " + ls_sqlext + ") ORDER BY DPDEPTSLIP.DEPTSLIP_DATE DESC,DPDEPTSLIP.DEPTSLIP_NO DESC ";
            sql = WebUtil.SQLFormat(sql, coop_id, start_date, end_date);
            DataTable dt  = WebUtil.Query(sql);            
            GridView1.DataSource = dt;
            GridView1.DataBind();           
        }
        public void WebSheetLoadEnd()
        {

        }
    }
}