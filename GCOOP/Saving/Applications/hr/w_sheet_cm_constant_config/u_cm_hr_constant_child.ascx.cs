﻿using System;
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
using CommonLibrary;

namespace Saving.Applications.hr
{
    public partial class u_cm_hr_constant_child: System.Web.UI.UserControl
    {
        private DwTrans SQLCA;

        protected void Page_Load(object sender, EventArgs e)
        {
            SQLCA = new DwTrans();
            SQLCA.Connect();
            DwMain.SetTransaction(SQLCA);
            DwMain.Retrieve();
        }

        protected void Page_LoadComplete()
        {
            SQLCA.Disconnect();
        }
    }
}