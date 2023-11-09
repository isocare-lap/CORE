using System;
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
using Sybase.DataWindow;
using System.Data.OracleClient;
using System.Globalization;
using CoreSavingLibrary.WcfNDeposit;
using CoreSavingLibrary.WcfNCommon;
using DataLibrary;
using System.Web.Services.Protocols;

namespace Saving.Applications.ap_deposit
{
    public partial class w_dlg_dp_dayproc_wizard_new : PageWebSheet, WebSheet
    {
        // JavaSctipt PostBack
        protected String postCloseDay;
        private DwThDate tdw_closeday;
        public string outputProcess;

        #region WebSheet Members

        public void InitJsPostBack()
        {
            postCloseDay = WebUtil.JsPostBack(this, "postCloseDay");
            tdw_closeday = new DwThDate(Dw_date, this);
            tdw_closeday.Add("proc_date", "proc_tdate");
        }

        public void WebSheetLoadBegin()
        {
            HdCloseday.Value = "false";
            if (!IsPostBack)
            {
                Dw_date.InsertRow(0);
                Dw_date.SetItemDate(1, "proc_date", state.SsWorkDate);
                tdw_closeday.Eng2ThaiAllRow();
                try
                {
                    string sqlStr = @"update dpdeptmaster dm
                    set dm.laststmseq_no = ( select max(ds.seq_no) from dpdeptstatement ds 
                    where dm.deptaccount_no = ds.deptaccount_no )";
                    sqlStr = WebUtil.SQLFormat(sqlStr);
                    WebUtil.ExeSQL(sqlStr);
                }
                catch { }
            }
            else
            {
                this.RestoreContextDw(Dw_date);
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == "postCloseDay")
            {
                JsPostCloseDay();
            }
        }

        public void SaveWebSheet()
        {
        }

        public void WebSheetLoadEnd()
        {
            Dw_date.SaveDataCache();
        }

        #endregion

        private void JsPostCloseDay()
        {
            n_depositClient depService = wcf.NDeposit;
            DateTime closeDate = new DateTime(1370, 1, 1);
            try
            {
                closeDate = Dw_date.GetItemDateTime(1, "proc_date");
                string sqlStr = @"update dpdeptmaster set laststmseq_no =
                (
	                select stm from
	                (
		                select a.deptaccount_no, 
		                a.laststmseq_no mst,b.seq_no stm
		                from dpdeptmaster a
		                inner join
		                (
			                select a.* from dpdeptstatement a
			                inner join (
				                select deptaccount_no, max(seq_no) seq_no from dpdeptstatement group by deptaccount_no
			                )b on a.deptaccount_no = b.deptaccount_no and a.seq_no = b.seq_no
		                )b on a.deptaccount_no = b.deptaccount_no
		                where a.laststmseq_no<>b.seq_no and dpdeptmaster.deptaccount_no = a.deptaccount_no
	                )
                )
                where exists 
                (
	                select stm from
	                (
		                select a.deptaccount_no, 
		                a.laststmseq_no mst,b.seq_no stm
		                from dpdeptmaster a
		                inner join
		                (
			                select a.* from dpdeptstatement a
			                inner join (
				                select deptaccount_no, max(seq_no) seq_no from dpdeptstatement group by deptaccount_no
			                )b on a.deptaccount_no = b.deptaccount_no and a.seq_no = b.seq_no
		                )b on a.deptaccount_no = b.deptaccount_no
		                where a.laststmseq_no<>b.seq_no and dpdeptmaster.deptaccount_no = a.deptaccount_no
	                )
                )";
                WebUtil.ExeSQL(sqlStr);
            }
            catch { }
            try
            {
                //depService.RunCloseDayProcess(state.SsWsPass, state.CurrentPage, closeDate, state.SsWorkDate, state.SsApplication,state.SsCoopControl, state.SsUsername, state.SsClientIp);
                //HdCloseday.Value = "true";
                //ลำปาง 
                if (state.SsCoopId == "027001")
                {
                    if (state.SsWorkDate.Month == 3)
                    {
                        String lastworkdate = "";
                        decimal y_chk = state.SsWorkDate.Year + 543;
                        String sqlck = "select lastworkdate from amworkcalendar where year =" + y_chk + " and month='" + state.SsWorkDate.Month + "'";
                        Sdt ck = WebUtil.QuerySdt(sqlck);
                        if (ck.Next())
                        {
                            lastworkdate = ck.GetString("lastworkdate");
                        }
                        if (lastworkdate == state.SsWorkDate.Day.ToString())
                        {
                            String in_yesr = (Convert.ToInt16(state.SsWorkDate.Year) + 1).ToString();
                            String daydue = "02/01/" + in_yesr;
                            String dayenddue = "03/31/" + in_yesr;
                            DateTime dt_start = Convert.ToDateTime(daydue);
                            DateTime dt_end = Convert.ToDateTime(dayenddue);

                            String updateMasdue = "update dpdeptmasdue set start_date =to_date('" + dt_start.ToString("dd/MM/yyyy") + "','dd/mm/yyyy'),  "
                                                 + " end_date = to_date('" + dt_end.ToString("dd/MM/yyyy") + "','dd/mm/yyyy')    "
                                                 + " where deptaccount_no	like '00117%'  ";
                            Sdt sqlupdate = WebUtil.QuerySdt(updateMasdue);
                        }
                    }
                }
                outputProcess = WebUtil.runProcessing(state, "DPCLSDAY", closeDate.ToString("dd/MM/yyyy"), state.SsClientIp, "");
                string sqlStr = @"delete from dpdeptstatement where deptitemtype_code='WIN' and operate_date={0}";
                sqlStr = WebUtil.SQLFormat(sqlStr, state.SsWorkDate);
                WebUtil.ExeSQL(sqlStr);
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }
        }
    }
}