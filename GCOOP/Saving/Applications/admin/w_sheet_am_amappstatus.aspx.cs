using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CoreSavingLibrary;
using DataLibrary;

namespace Saving.Applications.admin
{
    public partial class w_sheet_am_amappstatus : PageWebSheet, WebSheet
    {
        private String pbl = "am_amappstatus.pbl";
        private String tbName = "amappstatus";
        private DwThDate tDwMain;

        public void InitJsPostBack()
        {
            tDwMain = new DwThDate(dwMain, this);
            tDwMain.Add("workdate", "work_tdate");
            tDwMain.Add("last_workdate", "last_work_tdate");
        }

        public void WebSheetLoadBegin()
        {
            //this.ConnectSQLCA();
            //dwMain.SetTransaction(sqlca);
            if (!IsPostBack)
            {
                DwUtil.RetrieveDataWindow(dwMain, pbl, tDwMain, state.SsCoopId);
            }
            else
            {
                this.RestoreContextDw(dwMain, tDwMain);
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
        }

        public void SaveWebSheet()
        {
            try
            {
                for (int i = 1; i <= dwMain.RowCount; i++)
                {
                    dwMain.SetItemString(i, "coop_id", state.SsCoopId);
                    dwMain.SetItemString(i, "coop_control", state.SsCoopControl);
                }
                //dwMain.UpdateData();
                DwUtil.UpdateDataWindow(dwMain, pbl, tbName);

                //save log
                ExecuteDataSource exe = new ExecuteDataSource(this);

                Int32 seq_no = 0 ;
                string sql_no = @"select max(seq_no) as seq_no from amappstatussavelog where coop_id = {0}";
                    sql_no = WebUtil.SQLFormat(sql_no, state.SsCoopControl);
                    Sdt dt2 = WebUtil.QuerySdt(sql_no);
                    if (dt2.Next())
                    {
                        seq_no = dt2.GetInt32("seq_no") + 1;
                    }

                string sql_contdet = @"select * from amappstatus where coop_id = {0}";
                    sql_contdet = WebUtil.SQLFormat(sql_contdet, state.SsCoopControl);
                    Sdt dt = WebUtil.QuerySdt(sql_contdet);
                    while (dt.Next())
                    { 
                        string sqlInsert = @"insert into amappstatussavelog
                        (coop_id, application, seq_no, user_id, save_date, closeday_status, 
                        closemonth_status, closeday_date, closemonth_date, work_date ) 
                        values ({0} , {1} , {2} , {3} , {4} , {5} , {6} , {7} , {8} , {9})";

                        sqlInsert = WebUtil.SQLFormat(sqlInsert,
                        state.SsCoopControl, dt.GetString("application"), seq_no, state.SsUsername, DateTime.Now, dt.GetInt32("closeday_status"),
                        dt.GetInt32("closemonth_status"), dt.GetDate("closeday_date"), dt.GetDate("closemonth_date"), dt.GetDate("workdate"));
                        exe.SQL.Add(sqlInsert);
                    }
                    exe.Execute();
                    exe.SQL.Clear();

                LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกข้อมูลสำเร็จ");
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }
        }

        public void WebSheetLoadEnd()
        {
            try
            {
                tDwMain.Eng2ThaiAllRow();
            }
            catch { }
            dwMain.SaveDataCache();
        }

        protected void BtChangDate_Click(object sender, EventArgs e)
        {
            for (int i = 1; i <= dwMain.RowCount; i++)
            {
                DateTime dt;
                try
                {
                    dt = dwMain.GetItemDateTime(i, "workdate");
                }
                catch
                {
                    dt = DateTime.Today.AddDays(-1);
                }
                if (dt != DateTime.Today)
                {
                    DateTime workDate = DateTime.Today;
                    dwMain.SetItemDateTime(i, "workdate", DateTime.Today);
                    dwMain.SetItemDateTime(i, "last_workdate", dt);
                }
            }
            tDwMain.Eng2ThaiAllRow();
        }

        protected void BtOpenDate_Click(object sender, EventArgs e)
        {
            //"AMAPPSTATUS"."APPLICATION",   
            //"AMAPPSTATUS"."WORKDATE",   
            //"AMAPPSTATUS"."LAST_WORKDATE",   
            //"AMAPPSTATUS"."CLOSEDAY_STATUS",   
            //"AMAPPSTATUS"."CLOSEDAY_ID",   
            //"AMAPPSTATUS"."CLOSEDAY_DATE",   
            //"AMAPPSTATUS"."CLOSEMONTH_STATUS",   
            //"AMAPPSTATUS"."CLOSEMONTH_ID",   
            //"AMAPPSTATUS"."CLOSEMONTH_DATE",   
            //"AMAPPSTATUS"."CLOSEYEAR_STATUS",   
            //"AMAPPSTATUS"."CLOSEYEAR_ID",   
            //"AMAPPSTATUS"."CLOSEYEAR_DATE",   
            //"AMAPPSTATUS"."DESCRIPTION",   
            //"AMAPPSTATUS"."MENU_ORDER",   
            //"AMAPPSTATUS"."USED_FLAG",   
            //'        ' as work_tdate,   
            //'        ' as last_work_tdate  
            for (int i = 1; i <= dwMain.RowCount; i++)
            {
                dwMain.SetItemDecimal(i, "closeday_status", 0);
                dwMain.SetItemString(i, "CLOSEDAY_ID", state.SsUsername);
                dwMain.SetItemDateTime(i, "CLOSEDAY_DATE", DateTime.Now);
            }
        }

        protected void BtOpenMonth_Click(object sender, EventArgs e)
        {
            for (int i = 1; i <= dwMain.RowCount; i++)
            {
                dwMain.SetItemDecimal(i, "closemonth_status", 0);
                dwMain.SetItemString(i, "CLOSEMONTH_ID".ToLower(), state.SsUsername);
                dwMain.SetItemDateTime(i, "CLOSEMONTH_DATE".ToLower(), DateTime.Now);
            }
        }

        protected void BtOpenYear_Click(object sender, EventArgs e)
        {
            for (int i = 1; i <= dwMain.RowCount; i++)
            {
                dwMain.SetItemDecimal(i, "closeyear_status", 0);
                dwMain.SetItemString(i, "CLOSEYEAR_ID".ToLower(), state.SsUsername);
                dwMain.SetItemDateTime(i, "CLOSEYEAR_DATE".ToLower(), DateTime.Now);
            }
        }

       
    }
}