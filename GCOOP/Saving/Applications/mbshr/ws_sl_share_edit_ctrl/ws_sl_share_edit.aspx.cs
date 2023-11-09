using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLibrary;

namespace Saving.Applications.mbshr.ws_sl_share_edit_ctrl
{
    public partial class ws_sl_share_edit : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public string PostMemberNo { get; set; }
        [JsPostBack]
        public string PostList { get; set; }
        [JsPostBack]
        public string PostInsertRow { get; set; }
        [JsPostBack]
        public String PostDeleteRow { get; set; }
        public void InitJsPostBack()
        {
            wd_main.InitMain(this);
            //wd_list.InitList(this);
            wd_detail.InitDetail(this);
            wd_statement.InitStatement(this);
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                wd_statement.DdShritemtype();
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostMemberNo)
            {

                string ls_member_no = WebUtil.MemberNoFormat(wd_main.DATA[0].MEMBER_NO);
                wd_main.RetrieveMain(ls_member_no);
                //wd_list.RetrieveList(ls_member_no);
                string ls_sharetype_code = wd_main.DATA[0].SHARETYPE_CODE;
                wd_detail.RetrieveDetail(ls_member_no, ls_sharetype_code);
                wd_statement.RetrieveStatement(ls_member_no, ls_sharetype_code);
                wd_statement.DdShritemtype();
                for (int i = 0; i < wd_statement.RowCount; i++)
                {
                    wd_statement.DATA[i].shramt_value = wd_statement.DATA[i].SHARE_AMOUNT * 10;
                    wd_statement.DATA[i].shrstk_value = wd_statement.DATA[i].SHARESTK_AMT * 10;
                }
            }
            else if (eventArg == PostList)
            {
                //int li_row = wd_list.GetRowFocus();
                string ls_member_no = wd_main.DATA[0].MEMBER_NO;
                string ls_sharetype_code = wd_main.DATA[0].SHARETYPE_CODE;
                wd_detail.RetrieveDetail(ls_member_no, ls_sharetype_code);
                wd_statement.RetrieveStatement(ls_member_no, ls_sharetype_code);
            }
            else if (eventArg == PostInsertRow)
            {
                wd_statement.InsertLastRow();
                int ls_row = wd_statement.RowCount - 1;
                try
                {
                    wd_statement.DATA[ls_row].SEQ_NO = wd_statement.GetMaxValueDecimal("SEQ_NO") + 1;
                }
                catch
                {
                    if (wd_statement.RowCount < 1)
                    {
                        wd_statement.DATA[ls_row].SEQ_NO = 1;
                    }
                }
                wd_statement.DdShritemtype();

            }
            else if (eventArg == PostDeleteRow)
            {
                int ls_row = wd_statement.GetRowFocus();
                wd_statement.DeleteRow(ls_row);
            }
        }

        public void SaveWebSheet()
        {
            try
            {
                ExecuteDataSource exed1 = new ExecuteDataSource(this);
                int ls_row = wd_statement.RowCount;
                for (int i = 0; i < ls_row; i++)
                {
                    string ls_sharetype_code = wd_statement.DATA[i].SHARETYPE_CODE;
                    string ls_member_no = wd_main.DATA[0].MEMBER_NO;
                    decimal li_seq_no = wd_statement.DATA[i].SEQ_NO;
                    DateTime ls_operate_date = wd_statement.DATA[i].OPERATE_DATE;
                    DateTime ls_slip_date = wd_statement.DATA[i].SLIP_DATE;
                    string ls_operate_d = String.Format("{0:dd/MM/yyyy}", ls_operate_date);
                    string ls_slip_d = String.Format("{0:dd/MM/yyyy}", ls_slip_date);
                    string ls_ref_docno = wd_statement.DATA[i].REF_DOCNO;
                    string ls_shritemtype_code = wd_statement.DATA[i].SHRITEMTYPE_CODE;
                    decimal li_period = wd_statement.DATA[i].PERIOD;
                    decimal ldc_shramt_value = wd_statement.DATA[i].shramt_value / 10;
                    decimal ldc_shrstk_value = wd_statement.DATA[i].shrstk_value / 10;


                    string sqlStr = @"select * from shsharestatement where coop_id = {0} and seq_no = {1}";
                    sqlStr = WebUtil.SQLFormat(sqlStr, state.SsCoopId, li_seq_no);
                    Sdt dt1 = WebUtil.QuerySdt(sqlStr);
                    if (dt1.GetRowCount() > 0)
                    {
                        sqlStr = @"insert into shsharestatement
                               (coop_id                     , member_no                 , sharetype_code            , seq_no            , slip_date         
                                , operate_date              , share_date                , account_date              , shritemtype_code  , period
                                , share_amount              , sharestk_amt              , item_status               , entry_id          , entry_date
                                , entry_bycoopid            , remark                    , caldiv_status)
                                values
                                ( {0}                       , {1}                       , '01'                      , {2}               , to_date({3}, 'dd/mm/yyyy')
                                , to_date({4}, 'dd/mm/yyyy'), to_date({5}, 'dd/mm/yyyy'), to_date({6}, 'dd/mm/yyyy'), 'EPM'             , {7}
                                , {8}                       , {9}                       , 1                         , {10}              , to_date(to_char(sysdate,'dd/mon/yyyy hh24:mi:ss'), 'dd/mm/yyyy hh24:mi:ss' )	
                                , {0}                       , 'ยกเลิก ของยกเลิกตัดยอด'        , 0
                                )";
                        sqlStr = WebUtil.SQLFormat(sqlStr
                            , state.SsCoopControl, ls_member_no, li_seq_no, ls_slip_d
                            , ls_operate_d, ls_operate_d, ls_operate_d, li_period
                            , ldc_shramt_value, ldc_shrstk_value, state.SsUsername);
                        WebUtil.ExeSQL(sqlStr);

                        sqlStr = @"update shsharemaster  
                            set sharestk_amt = {0}, 
                            last_period = {1}, 
                            last_stm_no = {2}
                            where coop_id= {3} and member_no= {4}" ;
                        sqlStr = WebUtil.SQLFormat(sqlStr, ldc_shrstk_value, li_period, li_seq_no, state.SsCoopId, ls_member_no);
                        WebUtil.ExeSQL(sqlStr);
                    }
                    else
                    {
                        sqlStr = @"update shsharestatement 
                            set seq_no= {0},
                            operate_date=to_date({1},'dd/mm/yyyy'),
                            slip_date=to_date({2},'dd/mm/yyyy'),
                            ref_docno= {3},
                            shritemtype_code= {4},
                            period= {5},
                            share_amount= {6},
                            sharestk_amt= {7}
                            where coop_id= {8} and 
                            member_no= {9} and 
                            sharetype_code= {10} and 
                            seq_no= {0} ";
                        sqlStr = WebUtil.SQLFormat(sqlStr, li_seq_no, ls_operate_d, ls_slip_d, ls_ref_docno, ls_shritemtype_code, li_period, ldc_shramt_value, ldc_shrstk_value, state.SsCoopId, ls_member_no, ls_sharetype_code);
                        WebUtil.ExeSQL(sqlStr);
                    }

                    //string sqlup = "update shsharestatement set seq_no=" + li_seq_no + ",operate_date=to_date('" + ls_operate_d + "','dd/mm/yyyy'),slip_date=to_date('" + ls_slip_d + "','dd/mm/yyyy'),ref_docno='" + ls_ref_docno + "',shritemtype_code='" + ls_shritemtype_code + "',period='" + li_period + "',share_amount='" + ldc_shramt_value + "',sharestk_amt='" + ldc_shrstk_value + "' where coop_id='" + state.SsCoopId + "' and member_no='" + ls_member_no + "' and sharetype_code='" + ls_sharetype_code + "' and seq_no='" + li_seq_no + "'";
                    //exed1.SQL.Add(sqlup);
                    //exed1.AddFormView(wd_detail, ExecuteType.Update);
                    //exed1.Execute();
                    LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกสำเร็จ");
                }



            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }
        }

        public void WebSheetLoadEnd()
        {

        }
    }
}