using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using DataLibrary;

namespace Saving.Applications.app_finance.dlg.wd_fin_search_extmember_ctrl
{
    public partial class wd_fin_search_extmember : PageWebDialog, WebDialog
    {

        public void InitJsPostBack()
        {
            dsCriteria.InitDsCriteria(this);
        }

        public void WebDialogLoadBegin()
        {
            if (!IsPostBack)
            {
                LoadBegin();
            }
        }

        public void CheckJsPostBack(string eventArg)
        {

        }

        public void WebDialogLoadEnd()
        {

        }
        protected void BtSearch_Click(object sender, EventArgs e)
        {
            HdChangePage.Value = "false";
            SearchData();
        }
        private void LoadBegin()
        {
            dsCriteria.ResetRow();
            HdRow.Value = "";
            HdChangePage.Value = "false";
        }
        private void SearchData()
        {
            try
            {
                String ls_contackno = "", ls_taxid = "", ls_memname = "", ls_memsurname = "";

                string ls_sqlext = "";

                string coop_control = state.SsCoopControl;
                ls_contackno = dsCriteria.DATA[0].contack_no.Trim();
                ls_memname = dsCriteria.DATA[0].FIRST_NAME.Trim();
                ls_memsurname = dsCriteria.DATA[0].LAST_NAME.Trim();
                ls_taxid = dsCriteria.DATA[0].TAX_ID.Trim();
                //LoadBegin();
                if (ls_contackno.Length > 0)
                {
                    ls_sqlext += " and (  FINCONTACKMASTER.CONTACK_NO like '%" + ls_contackno + "%') ";
                }
                if (ls_taxid.Length > 0)
                {
                    ls_sqlext += " and (  FINCONTACKMASTER.TAX_ID like '%" + ls_taxid + "%') ";
                }
                if (ls_memname.Length > 0)
                {
                    ls_sqlext += " and ( FINCONTACKMASTER.FIRST_NAME like '%" + ls_memname + "%') ";
                }
                if (ls_memsurname.Length > 0)
                {
                    ls_sqlext += " and ( FINCONTACKMASTER.LAST_NAME like '%" + ls_memsurname + "%') ";
                }
                string sqlMain = "";

                sqlMain = @"SELECT FINCONTACKMASTER.CONTACK_NO,   
                MBUCFPRENAME.PRENAME_DESC ,FINCONTACKMASTER.FIRST_NAME,FINCONTACKMASTER.LAST_NAME ,  
                FINCONTACKMASTER.LAST_NAME,   
                ( case when  LENGTH(FINCONTACKMASTER.TAX_ID) > 0 then FINCONTACKMASTER.TAX_ID else 'ไม่ระบุ' end )TAX_ID,      
                MBUCFPRENAME.PRENAME_DESC,   
                FINCONTACKMASTER.COOP_ID
                FROM FINCONTACKMASTER,   
                MBUCFPRENAME  
                WHERE ( FINCONTACKMASTER.PRENAME_CODE = MBUCFPRENAME.PRENAME_CODE ) and                      
                FINCONTACKMASTER.COOP_ID = '" + coop_control + "' " + ls_sqlext + " order by FINCONTACKMASTER.CONTACK_NO";
                sqlMain = WebUtil.SQLFormat(sqlMain);
                DataTable dt = WebUtil.Query(sqlMain);
                dt.Columns.Add("fullname", typeof(System.String));
                foreach (DataRow row in dt.Rows)
                {
                    string rows_data = row["PRENAME_DESC"].ToString().Trim() + row["FIRST_NAME"].ToString().Trim() + "  " + row["LAST_NAME"].ToString();
                    row["fullname"] = rows_data;
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
                HdRow.Value = Convert.ToString(dt.Rows.Count);
                if (dt.Rows.Count < 1)
                {
                    LtServerMessage.Text = WebUtil.ErrorMessage("ไม่พบข้อมูล");
                }
                else {
                    LtServerMessage.Text = "";
                }
                if (HdChangePage.Value != "true")
                {
                    GridView1.PageIndex = 0;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }
        }

        //แบ่งหน้า
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            HdChangePage.Value = "true";
            GridView1.PageIndex = e.NewPageIndex;
            SearchData();
        }
    }
}