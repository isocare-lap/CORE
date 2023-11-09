using System;
using CoreSavingLibrary;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using CoreSavingLibrary.WcfNCommon;

namespace Saving.Applications.ap_deposit.dlg
{
    public partial class w_dlg_dp_codept : PageWebDialog, WebDialog
    {
        private String pblFileName = "dp_deptedit.pbl";
        public void InitJsPostBack()
        {
        }
        public void WebDialogLoadBegin()
        {
            this.ConnectSQLCA();
            DwList.SetTransaction(sqlca);

            if (!IsPostBack)
            {
                string deptaccountNoStr = "";

                try
                {
                    deptaccountNoStr = Request["dpdept_no"];
                }
                catch
                { }
                DwUtil.RetrieveDataWindow(DwList, pblFileName, null, state.SsCoopControl, deptaccountNoStr);
            }
            else
            {
                this.RestoreContextDw(DwList);
            }
            
        }
        public void CheckJsPostBack(string eventArg)
        {
            
        }
        public void WebDialogLoadEnd()
        {
            DwList.SaveDataCache();
        }
    }
}
