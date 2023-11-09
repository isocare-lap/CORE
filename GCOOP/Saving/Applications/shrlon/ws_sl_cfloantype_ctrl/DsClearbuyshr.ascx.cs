﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CoreSavingLibrary;

namespace Saving.Applications.shrlon.ws_sl_cfloantype_ctrl
{
    public partial class DsClearbuyshr : DataSourceRepeater
    {
        public DataSet1.LNLOANTYPEBUYSHAREDataTable DATA { get; set; }

        public void InitDsClearbuyshr(PageWeb pw)
        {
            css1.Visible = false;
            css2.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.LNLOANTYPEBUYSHARE;
            this.EventItemChanged = "OnDsClearbuyshrItemChanged";
            this.EventClicked = "OnDsClearbuyshrClicked";
            this.InitDataSource(pw, Repeater1, this.DATA, "dsClearbuyshr");
            this.Button.Add("b_del");
            this.Register();
        }

        public void Retrieve(string loantype_code)
        {
            String sql = @"SELECT *  FROM LNLOANTYPEBUYSHARE  
                           WHERE loantype_code = {0}";
            sql = WebUtil.SQLFormat(sql, loantype_code);
            DataTable dt = WebUtil.Query(sql);
            this.ImportData(dt);
        }
    }
}