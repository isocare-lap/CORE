using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;

namespace Saving.Applications.deposit.ws_dep_reprintslip_ctrl
{
    public partial class DsMain : DataSourceFormView
    {
        public DataSet1.DataDsMainDataTable DATA { get; set; }

        public void InitDsMain(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.DataDsMain;
            this.EventItemChanged = "OnDsMainItemChanged";
            this.EventClicked = "OnDsMainClicked";
            this.InitDataSource(pw, FormView1, this.DATA, "dsMain");
            this.Register();
        }
        public void DD_Depttype()
        {
            string sql = @"
                SELECT DEPTMAIN_TYPE AS VALUE_CODE,   
                DEPTMAIN_DESC AS VALUE_DESC
                FROM DPUCFDEPTMAINTYPE WHERE COOP_ID = {0}";
            sql = WebUtil.SQLFormat(sql, state.SsCoopControl);
            DataTable dt = WebUtil.Query(sql);
            dt.Columns.Add("display", typeof(System.String));
            dt.Columns.Add("sort", typeof(System.Int32));
            foreach (DataRow row in dt.Rows)
            {
                string ls_display = row["value_code"].ToString().Trim() + " - " + row["value_desc"].ToString().Trim();
                row["display"] = ls_display;
                row["sort"] = 1;
            }
            dt.Rows.Add(new Object[] { "", "", " --กรุณาเลือก-- ", 0 });
            dt.DefaultView.Sort = "sort asc, value_code asc";
            dt = dt.DefaultView.ToTable();
            this.DropDownDataBind(dt, "depttype_code", "display", "value_code");
       }
        public void DD_Coopbranch()
        {
            string sql = @"SELECT  COOP_ID , COOP_NAME  FROM CMCOOPMASTER ";
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "COOP_ID", "COOP_NAME", "COOP_ID");
            
        }
    }
}