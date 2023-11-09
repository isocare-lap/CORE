using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataLibrary;

namespace Saving.Applications.app_finance.dlg.wd_fin_search_extmember_ctrl
{
    public partial class DsList : DataSourceRepeater
    {
        public DataSet1.DataTable1DataTable DATA { get; set; }

        public void InitDsList(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.DataTable1;
            this.InitDataSource(pw, Repeater1, this.DATA, "dsList");
            this.EventClicked = "OnDsListClicked";
            this.EventItemChanged = "OnDsListItemChanged";
            this.Register();

        }
        public void RetrieveDetail(string ls_coopid)
        {
            string sql = "";
            sql = @"SELECT fincontactmaster.CONTACK_NO,   
                MBUCFPRENAME.PRENAME_DESC ||fincontactmaster.FIRST_NAME||' '||fincontactmaster.LAST_NAME as fullname,  
                fincontactmaster.LAST_NAME,   
                ( case when  LENGTH(fincontactmaster.TAX_ID) > 0 then fincontactmaster.TAX_ID else 'ไม่ระบุ' end )TAX_ID,      
                MBUCFPRENAME.PRENAME_DESC,   
                fincontactmaster.COOP_ID
                FROM fincontactmaster,   
                MBUCFPRENAME  
                WHERE ( fincontactmaster.PRENAME_CODE = MBUCFPRENAME.PRENAME_CODE ) and                      
                ( fincontactmaster.COOP_ID = {0})  
                order by fincontactmaster.CONTACK_NO ";
            sql = WebUtil.SQLFormat(sql, ls_coopid);
            DataTable dt = WebUtil.Query(sql);
            //dt.Columns.Add("fullname", typeof(System.String));
            //foreach (DataRow row in dt.Rows)
            //{
            //    string ls_display = row["PRENAME_DESC"].ToString().Trim() + row["FIRST_NAME"].ToString().Trim() + "  " + row["LAST_NAME"].ToString().Trim();
            //    row["fullname"] = ls_display;
            //}
            this.ImportData(dt);
        }   
    }
}