﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLibrary;
using CoreSavingLibrary;

namespace Saving.CriteriaIReport.u_cri_coopid_date_rgroup_mhs
{
    public partial class u_cri_coopid_date_rgroup_mhs : PageWebReport, WebReport
    {
        protected String app;
        protected String gid;
        protected String rid;
        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
        }

        public void WebSheetLoadBegin()
        {
            //--- Page Arguments
            try
            {
                app = Request["app"].ToString();
            }
            catch { }
            if (app == null || app == "")
            {
                app = state.SsApplication;
            }
            try
            {
                gid = Request["gid"].ToString();
            }
            catch { }
            try
            {
                rid = Request["rid"].ToString();
            }
            catch { }

            //Report Name.
            try
            {
                Sta ta = new Sta(state.SsConnectionString);
                String sql = "";
                sql = @"SELECT REPORT_NAME  
                    FROM WEBREPORTDETAIL  
                    WHERE ( GROUP_ID = '" + gid + @"' ) AND ( REPORT_ID = '" + rid + @"' )";
                Sdt dt = ta.Query(sql);
                ReportName.Text = dt.Rows[0]["REPORT_NAME"].ToString();
                ta.Close();
            }
            catch
            {
                ReportName.Text = "[" + rid + "]";
            }

            if (!IsPostBack)
            {
                dsMain.DdCoopId();
                dsMain.DdMembgroup();
                dsMain.DATA[0].operate_date = state.SsWorkDate;
            }            
        }

        public void CheckJsPostBack(string eventArg)
        {

        }

        public void RunReport()
        {
            string as_coopid = dsMain.DATA[0].coop_id;
            DateTime adtm_operate = dsMain.DATA[0].operate_date;
            string as_sgroup = dsMain.DATA[0].membgroup_start;
            string as_egroup = dsMain.DATA[0].membgroup_end;

            if (as_sgroup.Length < 1)
            {
                string sql = "select min(membgroup_code) as getminmemgroup from mbucfmembgroup";
                sql = WebUtil.SQLFormat(sql, state.SsCoopId);

                Sdt result = WebUtil.QuerySdt(sql);
                if (result.Next())
                {
                    as_sgroup = result.GetString("getminmemgroup");
                }
            }

            if (as_egroup.Length < 1)
            {
                string sql = "select max(membgroup_code) as getmaxmemgroup from mbucfmembgroup";
                sql = WebUtil.SQLFormat(sql, state.SsCoopId);

                Sdt result = WebUtil.QuerySdt(sql);
                if (result.Next())
                {
                    as_egroup = result.GetString("getmaxmemgroup");
                }
            }            

            try
            {
                iReportArgument arg = new iReportArgument();

                arg.Add("coop_id", iReportArgumentType.String, state.SsCoopControl);
                arg.Add("operate_date", iReportArgumentType.Date, adtm_operate);
                arg.Add("membgroup_start", iReportArgumentType.String, as_sgroup);
                arg.Add("membgroup_end", iReportArgumentType.String, as_egroup);               

                iReportBuider report = new iReportBuider(this, arg);
                report.Retrieve();
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }
        }

        public void WebSheetLoadEnd()
        {

        }
    }
}