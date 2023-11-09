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
using DataLibrary;
using System.Globalization;
using System.Data.OracleClient;
using Sybase.DataWindow;
using CoreSavingLibrary.WcfNCommon;

namespace Saving.Applications.cmd
{
    public partial class w_sheet_cmd_ptdealermaster : PageWebSheet,WebSheet
    {
        public void InitJsPostBack()
        {
            
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                DwMain.InsertRow(0);
                DwMain.SetItemString(1, "dealer_no", "AUTO");
            }
            else
            {
                this.RestoreContextDw(DwMain);
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            
        }

        public void SaveWebSheet()
        {
            string dealer_no = "", dealer_name = "", dealer_addr = "";
            string dealer_taxid = "", dealer_phone = "", status_sql = "";
            Sdt dt = new Sdt();
            try
            {
                dealer_no = DwMain.GetItemString(1, "dealer_no");
                try { dealer_name = DwMain.GetItemString(1, "dealer_name"); }
                catch { dealer_name = string.Empty; }
                try { dealer_addr = DwMain.GetItemString(1, "dealer_addr"); }
                catch { dealer_addr = string.Empty; }
                try { dealer_taxid = DwMain.GetItemString(1, "dealer_taxid"); }
                catch { dealer_taxid = string.Empty; }
                try { dealer_phone = DwMain.GetItemString(1, "dealer_phone"); }
                catch { dealer_phone = string.Empty; }

                if (dealer_no == "AUTO") //new dealer for insert data
                {
                    n_commonClient com = wcf.NCommon;
                    dealer_no = com.of_getnewdocno(state.SsWsPass, state.SsCoopControl, "CMDDEALER");
                    DwMain.SetItemString(1, "dealer_no", dealer_no);
                    string sqlindealer = @"insert into ptucfdealer values ({0}, {1}, {2}, {3}, {4})";
                    sqlindealer = WebUtil.SQLFormat(sqlindealer, dealer_no, dealer_name, dealer_addr, dealer_taxid, dealer_phone);
                    dt = WebUtil.QuerySdt(sqlindealer);
                    status_sql = "I";
                }
                else //older dealer for update data
                {
                    string sqlupdealer = @"update ptucfdealer set dealer_name = {1}, dealer_addr = {2}, 
                            dealer_taxid = {3}, dealer_phone = {4} where dealer_no = {0}";
                    sqlupdealer = WebUtil.SQLFormat(sqlupdealer, dealer_no, dealer_name, dealer_addr, dealer_taxid, dealer_phone);
                    dt = WebUtil.QuerySdt(sqlupdealer);
                    status_sql = "U";
                }
                if (status_sql == "I")
                {
                    LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกทะเบียนคู่ค้าเลขที่ " + dealer_no + " สำเร็จ");
                }
                else
                {
                    LtServerMessage.Text = WebUtil.CompleteMessage("ปรับปรุงทะเบียนคู่ค้าเลขที่ " + dealer_no + " สำเร็จ");
                }
            }
            catch (Exception ex)
            { LtServerMessage.Text = WebUtil.ErrorMessage(ex.Message); }
        }

        public void WebSheetLoadEnd()
        {
            DwMain.SaveDataCache();
        }
    }
}