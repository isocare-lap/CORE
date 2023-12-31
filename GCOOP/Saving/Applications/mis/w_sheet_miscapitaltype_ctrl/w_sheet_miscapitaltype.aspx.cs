﻿using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Saving.Applications.mis.w_sheet_miscapitaltype_ctrl
{
    public partial class w_sheet_miscapitaltype : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public string PostInsertRow { get; set; } //สำสั่ง JS postback
        [JsPostBack]
        public string PostDeleteRow { get; set; } //สำสั่ง JS postback

        public void InitJsPostBack()
        {
            dsList.InitDsList(this);
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                dsList.retrieve();
                dsList.retrieveddp();
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostInsertRow)
            {
                dsList.InsertLastRow();
                int row = dsList.RowCount -1 ;
                dsList.DATA[row].COOP_ID = state.SsCoopControl;
                dsList.DATA[row].SEQ_NO = dsList.GetMaxValueDecimal("seq_no") + 1;
                dsList.retrieveddp();
            }
            else if (eventArg == PostDeleteRow)
            {
                int Rowdelete = dsList.GetRowFocus();
                dsList.DeleteRow(Rowdelete);
                dsList.retrieveddp();
            }
        }

        public void SaveWebSheet()
        {
            try
            {
                //for (int i = 0; i < dsList.RowCount; i++)
                //{
                //    dsList.DATA[i].SEQ_NO = i + 1;
                //}
                ExecuteDataSource exed = new ExecuteDataSource(this);
                exed.AddRepeater(dsList);

                int result = exed.Execute();

                LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกสำเร็จ"); //หากบันทึกให้ขึ้น บันทึกแล้ว
                dsList.retrieve();
                dsList.retrieveddp();
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex.Message); // กรณีไม่สำเร็จ
            }

        }

        public void WebSheetLoadEnd()
        {
            for (int i = 0; i < dsList.RowCount; i++)
            {
                if (dsList.GetRowStatus(i) == "insert")
                {

                    dsList.FindDropDownList(i, "CAPTYPE_CODE").Enabled = true;
                    dsList.FindTextBox(i, "system_code").ReadOnly = false;
                }
                else
                {
                    dsList.FindDropDownList(i, "CAPTYPE_CODE").Enabled = false;
                    dsList.FindTextBox(i, "system_code").ReadOnly = true;
                }
                
            }
        }
    }
}