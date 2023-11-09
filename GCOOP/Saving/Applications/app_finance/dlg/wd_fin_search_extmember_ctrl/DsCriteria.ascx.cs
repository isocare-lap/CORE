using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Saving.Applications.app_finance.dlg.wd_fin_search_extmember_ctrl
{
    public partial class DsCriteria : DataSourceFormView
    {
        public DataSet1.CRITERIADataTable DATA { get; set; }

        public void InitDsCriteria(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.CRITERIA;
            this.InitDataSource(pw, FormView1, this.DATA, "dsCriteria");
            this.EventItemChanged = "OnDsCriteriaItemChanged";
            this.EventClicked = "OnDsCriteriaClicked";
            this.Register();
        }
        public void DdMembgroup()
        {
            string sql = @"select membgroup_code , membgroup_desc from mbucfmembgroup where coop_id = {0}";
            sql = WebUtil.SQLFormat(sql, state.SsCoopControl);
            DataTable dt = WebUtil.Query(sql);
            dt.Columns.Add("fullgroup", typeof(System.String));
            dt.Columns.Add("sort", typeof(System.Int32));
            foreach (DataRow row in dt.Rows)
            {
                string rows_data = row["membgroup_code"].ToString().Trim() + " - " + row["membgroup_desc"].ToString();
                row["fullgroup"] = rows_data;
                row["sort"] = 1;
            }
            dt.Rows.Add(new Object[] { "", "", "เลือกสังกัด", 0 });
            dt.DefaultView.Sort = "sort asc, membgroup_code asc";
            dt = dt.DefaultView.ToTable();
            this.DropDownDataBind(dt, "membgroup_nodd", "fullgroup", "membgroup_code");
        }
        public void DD_Membcat()
        {
            string sql = @" select membcat_code,   
                        membcat_desc as  display                        
                        from mbucfcategory  where coop_id={0} ";
            sql = WebUtil.SQLFormat(sql, state.SsCoopControl);
            DataTable dt = WebUtil.Query(sql);
            dt.Columns.Add("sort", typeof(System.Int32));
            dt.Rows.Add(new Object[] { "", "--เลือก--", 0 });
            dt.DefaultView.Sort = "sort asc, membcat_code asc";
            this.DropDownDataBind(dt, "membcat_code", "display", "membcat_code");
        }
    }
}