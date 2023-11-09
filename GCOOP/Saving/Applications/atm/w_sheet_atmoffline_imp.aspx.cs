using System;
using CoreSavingLibrary;
using System.Collections;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using CoreSavingLibrary.WcfNCommon;
using DataLibrary;
using System.Collections.Generic;
using System.IO;
using System.Data;

namespace Saving
{

    public partial class w_sheet_atmoffline_imp : PageWebSheet, WebSheet
    {
        String FORMAT_CODE = "ATM_BAY_IMP";
        Dictionary<string, object> data = null;
        String[] keys = { "HEADER", "FOOTER", "DETAIL" };
        protected String jsUploadFile, jsDownloadFile, jsPreviewFile, jsCancelFile, jsSaveData;
        public String output = "";

        #region Data members

        #endregion

        #region Events Handlers

        public void InitJsPostBack()
        {
            jsUploadFile = WebUtil.JsPostBack(this, "jsUploadFile");
            jsDownloadFile = WebUtil.JsPostBack(this, "jsDownloadFile");
            jsPreviewFile = WebUtil.JsPostBack(this, "jsPreviewFile");
            jsCancelFile = WebUtil.JsPostBack(this, "jsCancelFile");
            jsSaveData = WebUtil.JsPostBack(this, "jsSaveData");
            this.IgnoreReadable = true;
        }

        public void initConfig()
        {
            String sql = "";

            sql="CREATE TABLE CMTXTFORMATUCFTYPE (TXTFORMATTYPE_CODE VARCHAR2(20) NOT NULL, TXTFORMATTYPE_DESC VARCHAR2(50) NOT NULL, TXTFILED_VALUE VARCHAR2(2), TXTREPLACE_VALUE VARCHAR2(2), TXTFORMAT VARCHAR2(50)) "; try { WebUtil.ExeSQL(sql); }catch { }
            sql="ALTER TABLE CMTXTFORMATUCFTYPE ADD ( CONSTRAINT CMTXTFORMATUCFTYPE_PK PRIMARY KEY ( TXTFORMATTYPE_CODE )) "; try { WebUtil.ExeSQL(sql); }catch { }

            sql="CREATE TABLE CMTXTFORMATMAS (TXTFORMAT_CODE VARCHAR2(20) NOT NULL, TXTFORMAT_DESC VARCHAR2(50) NOT NULL, TXTFORMAT_FILENAME VARCHAR2(50), BANK_CODE CHAR(3) DEFAULT '006' NOT NULL, LOANTYPE_CODE CHAR(2) DEFAULT '88' NOT NULL, DEPTTYPE_CODE CHAR(2) DEFAULT '88' NOT NULL) "; try { WebUtil.ExeSQL(sql); }catch { }
            sql="ALTER TABLE CMTXTFORMATMAS ADD ( CONSTRAINT CMTXTFORMATMAS_PK PRIMARY KEY ( TXTFORMAT_CODE )) "; try { WebUtil.ExeSQL(sql); }catch { }

            sql="CREATE TABLE CMTXTFORMATHEADER (TXTFORMAT_CODE VARCHAR2(20) NOT NULL, TXTFORMATHD_NM VARCHAR2(150) NOT NULL, SEQ_NO NUMBER(2,0) NOT NULL, TXTFORMATTYPE_CODE VARCHAR2(20) NOT NULL, TXTFORMAT_DESC VARCHAR2(150) NOT NULL, TXTLENG NUMBER(3,0) NOT NULL, FILLVALUE_FLAG NUMBER(1,0) DEFAULT 1 NOT NULL, FILLVALUE_DATA VARCHAR2(5), FORMATE_EXAMPLE VARCHAR2(150), TXTFILED_VALUE VARCHAR2(1), TXTDEFAULT_VALUE VARCHAR2(150), FORMATE_VALUE VARCHAR2(1000), TXTSTARTPOS NUMBER(3,0) DEFAULT 0 NOT NULL, TXTGROUP NUMBER(3,0) DEFAULT 1 NOT NULL) "; try { WebUtil.ExeSQL(sql); }catch { }
            sql="ALTER TABLE CMTXTFORMATHEADER ADD ( CONSTRAINT CMTXTFORMATHEADER_PK PRIMARY KEY ( TXTFORMAT_CODE, TXTFORMATHD_NM, SEQ_NO )) "; try { WebUtil.ExeSQL(sql); }catch { }

            sql="CREATE TABLE CMTXTFORMATFOOTER (TXTFORMAT_CODE VARCHAR2(20) NOT NULL, TXTFORMATFT_NM VARCHAR2(150) NOT NULL, SEQ_NO NUMBER(2,0) NOT NULL, TXTFORMATTYPE_CODE VARCHAR2(20) NOT NULL, TXTFORMAT_DESC VARCHAR2(150) NOT NULL, TXTLENG NUMBER(3,0) NOT NULL, FILLVALUE_FLAG NUMBER(1,0) DEFAULT 1 NOT NULL, FILLVALUE_DATA VARCHAR2(5), FORMATE_EXAMPLE VARCHAR2(150), TXTFILED_VALUE VARCHAR2(1), TXTDEFAULT_VALUE VARCHAR2(150), FORMATE_VALUE VARCHAR2(1000), TXTSTARTPOS NUMBER(3,0) DEFAULT 0 NOT NULL, TXTGROUP NUMBER(3,0) DEFAULT 1 NOT NULL) "; try { WebUtil.ExeSQL(sql); }catch { }
            sql="ALTER TABLE CMTXTFORMATFOOTER ADD ( CONSTRAINT CMTXTFORMATFOOTER_PK PRIMARY KEY ( TXTFORMAT_CODE, TXTFORMATFT_NM, SEQ_NO )) "; try { WebUtil.ExeSQL(sql); }catch { }

            sql="CREATE TABLE CMTXTFORMATDETAIL (TXTFORMAT_CODE VARCHAR2(20) NOT NULL, TXTFORMATDT_NM VARCHAR2(150) NOT NULL, SEQ_NO NUMBER(2,0) NOT NULL, TXTFORMATTYPE_CODE VARCHAR2(20) NOT NULL, TXTFORMAT_DESC VARCHAR2(150) NOT NULL, TXTLENG NUMBER(3,0) NOT NULL, FILLVALUE_FLAG NUMBER(1,0) DEFAULT 1 NOT NULL, FILLVALUE_DATA VARCHAR2(5), FORMATE_EXAMPLE VARCHAR2(150), TXTFILED_VALUE VARCHAR2(1), TXTDEFAULT_VALUE VARCHAR2(150), FORMATE_VALUE VARCHAR2(1000), TXTSTARTPOS NUMBER(3,0) DEFAULT 0 NOT NULL, TXTGROUP NUMBER(3,0) DEFAULT 1 NOT NULL) "; try { WebUtil.ExeSQL(sql); }catch { }
            sql="ALTER TABLE CMTXTFORMATDETAIL ADD ( CONSTRAINT CMTXTFORMATDETAIL_PK PRIMARY KEY ( TXTFORMAT_CODE, TXTFORMATDT_NM, SEQ_NO )) "; try { WebUtil.ExeSQL(sql); }catch { }

        }

        public void init()
        {
            this.initConfig();
            try
            {
                string sql = @" CREATE TABLE ATMTMPTRANSDATA (
                                    COOP_ID CHAR(8) NOT NULL, 
                                    ATM_COOP_ID CHAR(4) NOT NULL, 
                                    MEMBER_NO CHAR(8) NOT NULL, 
                                    REF_ACCNO VARCHAR2(15), 
                                    SAVING_ACC VARCHAR2(15) NOT NULL, 
                                    COOP_SAVING_ACC VARCHAR2(15) NOT NULL, 
                                    OPERATE_DATE DATE NOT NULL, 
                                    SYSTEM_CODE CHAR(2) NOT NULL, 
                                    OPERATE_CODE CHAR(3) NOT NULL, 
                                    ITEM_AMT NUMBER(15,2) NOT NULL, 
                                    FREE_AMT NUMBER(15,2) NOT NULL, 
                                    DISCOUNT_AMT NUMBER(15,2) NOT NULL, 
                                    CREDIT_AMT NUMBER(15,2) DEFAULT 0 NOT NULL, 
                                    BALANCE_AMT NUMBER(15,2) DEFAULT 0 NOT NULL, 
                                    BANK_CODE CHAR(3) NOT NULL, 
                                    BRANCH_CODE CHAR(3) NOT NULL, 
                                    CCS_OPERATE_DATE DATE NOT NULL, 
                                    ATM_NO VARCHAR2(12) NOT NULL, 
                                    ATM_SEQNO VARCHAR2(8) NOT NULL, 
                                    TRANS_CODE VARCHAR2(25), 
                                    APPROVE_CODE VARCHAR2(25), 
                                    CARD_NO VARCHAR2(20) NOT NULL, 
                                    ITEM_STATUS NUMBER(1,0) DEFAULT 0 NOT NULL, 
                                    POST_STATUS NUMBER(1,0) DEFAULT 0 NOT NULL, 
                                    POST_DATE DATE, 
                                    EXPORT_STATUS NUMBER(1,0) DEFAULT 0 NOT NULL, 
                                    EXPORT_DATE DATE, 
                                    RECONCILE_DATE DATE, 
                                    MEMBER_NAME VARCHAR2(50) NOT NULL, 
                                    ATM_LOCATION VARCHAR2(50) NOT NULL, 
                                    REF_DOCNO VARCHAR2(50), 
                                    FORMAT_CODE VARCHAR2(50)) ";
                WebUtil.ExeSQL(sql);
                sql = @"
                                    ALTER TABLE ATMTMPTRANSDATA ADD ( CONSTRAINT ATMTMPTRANSDATA_PK 
                                    PRIMARY KEY ( COOP_ID, ATM_COOP_ID, MEMBER_NO, OPERATE_DATE, BANK_CODE, ATM_NO, ATM_SEQNO, SAVING_ACC ,REF_DOCNO)) ";
                WebUtil.ExeSQL(sql);
                WebUtil.ExeSQL("alter table cmtxtformatmas add  (BANK_CODE CHAR(3) DEFAULT '025'  NOT NULL)");
                WebUtil.ExeSQL("alter table cmtxtformatmas add  (LOANTYPE_CODE CHAR(2)  DEFAULT '88'  NOT NULL)");
                WebUtil.ExeSQL("alter table cmtxtformatmas add  (DEPTTYPE_CODE CHAR(2)  DEFAULT '88'  NOT NULL)");
            }
            catch { }

            try
            {
                string sql = "select txtformat_code,concat(concat(txtformat_code,' - '),txtformat_desc ) as txtformat_desc from cmtxtformatmas where txtformat_code like '%IMP%' order by txtformat_code asc";
                DataTable DpFileFormat = WebUtil.Query(sql);
                DpFileFormatCode.DataTextField = "txtformat_desc";
                DpFileFormatCode.DataValueField = "txtformat_code";
                DpFileFormatCode.DataSource = DpFileFormat;
                DpFileFormatCode.DataBind();
                // ตั้งค่า default ให้ dropdown database
                if (DpFileFormat.Rows.Count > 0)
                {
                    DpFileFormatCode.SelectedIndex = 0;
                }
            }
            catch { }

            this.initDpFileLists();
        }

        public void initDpFileLists()
        {

            try
            {
                string sql = "select distinct ref_docno from atmtmptransdata where format_code = '" + DpFileFormatCode.SelectedValue + "' order by ref_docno desc";
                DataTable DpFileListsData = WebUtil.Query(sql);
                DpFileLists.DataTextField = "ref_docno";
                DpFileLists.DataValueField = "ref_docno";
                DpFileLists.DataSource = DpFileListsData;
                DpFileLists.DataBind();
                // ตั้งค่า default ให้ dropdown database
                if (DpFileListsData.Rows.Count > 0)
                {
                    DpFileLists.SelectedIndex = 0;
                }
            }
            catch { }
        }

        public void initTableData()
        {

            TableGrid.TableQuery = "select * from ATMTMPTRANSDATA where export_status=-9 and post_status=0 and item_status<>-9 and ref_docno='" + this.DpFileLists.SelectedValue + "' and bank_code=(select bank_code from cmtxtformatmas where txtformat_code='"+this.DpFileFormatCode.SelectedValue+"') ";
            TableGrid.retreive();
        }

        public void WebSheetLoadBegin()
        {

            if (!IsPostBack)
            {
                Session["HdFilename"] = "";
                this.init();
                this.initDpFileLists();
            }
            else
            {
            }
            this.FORMAT_CODE = this.DpFileFormatCode.SelectedValue;
            this.initTableData();

            //WebUtil.GenerateGridViewEditable(ref this.TableGridView, (String)Session["TableSelected"]);
            //CreateTemplatedGridView();

        }

        public void CheckJsPostBack(string eventArg)
        {
            switch (eventArg)
            {
                case "jsUploadFile":
                    UploadFile();
                    break;
                case "jsDownloadFile":
                    DownloadFile();
                    break;
                case "jsPreviewFile":
                    PreviewFile();
                    break;
                case "jsCancelFile":
                    CancelFile();
                    break;
                case "jsSaveData":
                    SaveData();
                    break;
            }
        }

        public void SaveWebSheet()
        {
            SaveData();
        }

        public void SaveData(){
            this.output = "SAVE DATA <br/>";
            this.HdFilename.Value = Session["HdFilename"].ToString();
            this.PreviewData(this.HdFilename.Value);
            this.output = "";
            String filename = this.HdFilename.Value.Substring(this.HdFilename.Value.LastIndexOf("\\")+1);
            this.saveToTemp(filename);
            this.initDpFileLists();
            this.DpFileLists.SelectedValue = filename;
            this.initTableData();
            Session["HdFilename"] = "";
            LtServerMessage.Text = WebUtil.CompleteMessage("Save Data from " + filename + " uploaded successfully.");
        }

        public void WebSheetLoadEnd()
        {
        }

        public void CancelFile()
        {
            string filename = this.DpFileLists.SelectedValue;
            try
            {
                String sql = "update ATMTMPTRANSDATA set item_status=-9,post_date=sysdate where export_status=-9 and ref_docno='" + this.DpFileLists.SelectedValue + "'";
                WebUtil.ExeSQL(sql);
                this.initTableData();
                LtServerMessage.Text = WebUtil.CompleteMessage("Cancel successfully." + filename);
            }
            catch { 
            
            }
        }


        public void PreviewFile()
        {
            String root_path = Server.MapPath("fileupload/");
            string filename = root_path+this.DpFileLists.SelectedValue;
            PreviewData(filename);
        }

        public void DownloadFile()
        {
            String root_path = Server.MapPath("fileupload/");
             string filename = root_path+this.DpFileLists.SelectedValue;
             LtServerMessage.Text = WebUtil.CompleteMessage("File exported successfully." + filename);
             CoreSavingLibrary.WebUtil.SetCurrentFileContentDownload(filename);
        }

        public void UploadFile()
        {
            string filename = string.Empty;
            try
            {
                string[] validFileTypes = { "txt", "ini", "csv" };
                string ext = System.IO.Path.GetExtension(fiUpload.PostedFile.FileName);
                bool isValidFile = false;
                for (int i = 0; i < validFileTypes.Length; i++)
                {
                    if (ext == "." + validFileTypes[i])
                    {
                        isValidFile = true;
                        break;
                    }
                }
                if (!isValidFile)
                {

                    LtServerMessage.Text = WebUtil.ErrorMessage("Invalid File. Please upload a File with extension " + string.Join(",", validFileTypes));
                }
                else
                {
                    if (this.fiUpload.HasFile)
                    {
                        //filename = DateTime.Now.ToString("ddMMyyyy_hhmmss") + "_" + fiUpload.FileName;
                        filename = fiUpload.FileName;
                        try { Directory.CreateDirectory(Server.MapPath("fileupload/")); }
                        catch { }
                        this.HdFilename.Value = Server.MapPath("fileupload/" + filename);
                        Session["HdFilename"] = this.HdFilename.Value;
                        filename = DateTime.Now.ToString("ddMMyyyy_hhmmss") + "_" + fiUpload.FileName;
                        this.fiUpload.SaveAs(this.HdFilename.Value);
                        LtServerMessage.Text = filename + " Uploaded.";
                        LtServerMessage.Text = WebUtil.CompleteMessage("File uploaded successfully." + filename);
                        this.output = "UPLOAD DATA <br/>";
                        this.PreviewData(Session["HdFilename"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex.Message);
            }
        }

        public void PreviewData(string filename)
        {
            //String output = "";
            try
            {

                FileInfo fi = new FileInfo(filename);
                if (fi.Exists)
                {

                    data = WebUtil.getFileFormatDataBy(FORMAT_CODE, filename);
                    output += "<br/>";
                    for (int k = 0; k < keys.Length; k++)
                    {
                        Dictionary<string, string>[] list = (Dictionary<string, string>[])data[keys[k]];
                        output += "" + keys[k] + "<br/>==========<br/>";
                        for (int i = 0; i < list.Length; i++)
                        {
                            Dictionary<string, string> d = (Dictionary<string, string>)list[i];
                            foreach (string key in d.Keys)
                            {
                                output += (i + 1) + ")." + key + "=" + d[key] + "<br/>";
                            }
                        }
                        output += "" + keys[k] + "<br/>==========<br/>";
                    }


                }
            }
            catch { }
        }


        #endregion

        public void getMemberInfo(String saving_acc, String system_code, ref String member_no, ref String memb_name, ref String refcoopacc_no)
        {
            String sql = "";
            String loantype_code = "88", depttype_code = "88";
            member_no = "x";
            refcoopacc_no = "x";
            try
            {
                sql = "select * from cmtxtformatmas where txtformat_code='" + this.DpFileFormatCode.SelectedValue + "'";
                Sdt sdt = WebUtil.QuerySdt(sql);
                if (sdt.Next())
                {
                    loantype_code = sdt.GetString("loantype_code");
                    depttype_code = sdt.GetString("depttype_code");
                }

                if (system_code == "01") //LOAN
                {
                    sql = "select * from lncontmaster where expense_accid='" + saving_acc + "' and loantype_code='" + loantype_code + "' ";
                    sdt = WebUtil.QuerySdt(sql);
                    if (sdt.Next())
                    {
                        member_no = sdt.GetString("member_no");
                        refcoopacc_no = sdt.GetString("loancontract_no");
                    }
                }
                else if (system_code == "02") //DEPT
                {
                    sql = "select * from dpdeptmaster where bank_accid='" + saving_acc + "' and depttype_code='" + depttype_code + "' ";
                    sdt = WebUtil.QuerySdt(sql);
                    if (sdt.Next())
                    {
                        member_no = sdt.GetString("member_no");
                        refcoopacc_no = sdt.GetString("deptaccount_no");
                    }
                }

            }
            catch { }
        }


        public void saveATM_BAY_IMP(String ref_docno,Dictionary<string, string>[] HEADER ,Dictionary<string, string>[] DETAIL ,Dictionary<string, string>[] FOOTER )
        {
                String sql = "delete from ATMTMPTRANSDATA where ref_docno='" + ref_docno + "'";
                WebUtil.ExeSQL(sql);

                for (int i = 0; i < DETAIL.Length;i++ )
                {
                    String SYSTEM_CODE = "x", OPERATE_CODE = "x";
                    try
                    {
                        SYSTEM_CODE = DETAIL[i]["DCSDCOT-D-TRANS-CODE"].Trim();
                        OPERATE_CODE = DETAIL[i]["DCSDCOT-D-TRANS-CODE"].Trim();
                        SYSTEM_CODE = SYSTEM_CODE.Substring(0, 2);
                        OPERATE_CODE = OPERATE_CODE.Substring(4, 2);

                        if (SYSTEM_CODE == "42")
                        {
                            SYSTEM_CODE = "01";

                            if (OPERATE_CODE == "11")
                                OPERATE_CODE = "002";
                            else if (OPERATE_CODE == "10")
                                OPERATE_CODE = "003";

                        }
                        else if (SYSTEM_CODE == "10")
                        {
                            SYSTEM_CODE = "02";
                            if (OPERATE_CODE == "00")
                                OPERATE_CODE = "002";
                            else if (OPERATE_CODE == "10")
                                OPERATE_CODE = "003";

                        }

                    }
                    catch { }
                    String saving_acc=DETAIL[i]["DCSDCOT-D-TO-AC-NUM"].Trim() ;

                    String member_no="",memb_name="",refcoopacc_no="";
                    this.getMemberInfo(saving_acc, SYSTEM_CODE, ref  member_no, ref  memb_name, ref  refcoopacc_no);

                    sql = @" insert into ATMTMPTRANSDATA ( 
                                    COOP_ID , 	
                                    ATM_COOP_ID, 	
	                                MEMBER_NO , 	
	                                REF_ACCNO , 
	                                SAVING_ACC , 
	                                COOP_SAVING_ACC , 
	                                OPERATE_DATE , 
	                                SYSTEM_CODE , 
	                                OPERATE_CODE , 
	                                ITEM_AMT ,
	                                FREE_AMT ,
	                                DISCOUNT_AMT,
	                                CREDIT_AMT ,
	                                BALANCE_AMT ,
	                                BANK_CODE ,
	                                BRANCH_CODE ,
	                                CCS_OPERATE_DATE ,
	                                ATM_NO ,
	                                ATM_SEQNO ,
	                                TRANS_CODE,
                                    APPROVE_CODE,
                                    CARD_NO ,
	                                ITEM_STATUS,
	                                POST_STATUS ,
	                                POST_DATE,
	                                EXPORT_STATUS ,
	                                EXPORT_DATE ,
	                                RECONCILE_DATE ,
	                                MEMBER_NAME ,
	                                ATM_LOCATION,
	                                REF_DOCNO,
                                    FORMAT_CODE    
                                    )values(";
                             sql += "'" + /*COOP_ID*/state.SsCoopId + "' ," +
                                    "'" + /*ATM_COOP_ID*/DETAIL[i]["DCSDCOT-D-TERM-OWNER"].Trim() + "' ," +
                                    "'" + /*MEMBER_NO*/ member_no + "' ," + 
	                                "'" + /*REF_ACCNO*/ refcoopacc_no+ "' ," +
                                    "'" + /*SAVING_ACC*/ DETAIL[i]["DCSDCOT-D-TO-AC-NUM"].Trim() + "' ," +
                                    "'" + /*COOP_SAVING_ACC*/ DETAIL[i]["DCSDCOT-D-FROM-AC-NUM"].Trim() + "' ," +
                                    "" + /*OPERATE_DATE*/ "to_date('"+DETAIL[i]["DCSDCOT-D-TRANS-DATE"].Trim() + DETAIL[i]["DCSDCOT-D-TRANS-TIME"].Trim() + "','yyyyMMddHH24miss') "+" ," +
                                    "'" + /*SYSTEM_CODE*/ SYSTEM_CODE + "' ," +
                                    "'" + /*OPERATE_CODE*/ OPERATE_CODE + "' ," +
                                    "'" + /*ITEM_AMT*/ DETAIL[i]["DCSDCOT-D-TRANS-AMOUNT"].Trim() + "' ," +
                                    "'" + /*FREE_AMT*/ DETAIL[i]["DCSDCOT-D-TRANS-FEE"].Trim() + "' ," +
                                    "'" + /*DISCOUNT_AMT*/ DETAIL[i]["DCSDCOT-D-DISP-AMOUNT"].Trim() + "' ," +
	                                "'" + /*CREDIT_AMT*/ "0.00"+ "' ," +
	                                "'" + /*BALANCE_AMT*/ "0.00"+ "' ," +
                                    "'" + /*BANK_CODE*/ "025"+ "' ," +
	                                "'" + /*BRANCH_CODE*/ "999"+ "' ," +
                                    "" + /*CCS_OPERATE_DATE*/ "to_date('" + DETAIL[i]["DCSDCOT-D-TRANS-DATE"].Trim() + DETAIL[i]["DCSDCOT-D-TRANS-TIME"].Trim() + "','yyyyMMddHH24miss') " + " ," +
                                    "'" + /*ATM_NO*/ DETAIL[i]["DCSDCOT-D-TERM-NUM"].Trim() + "' ," +
                                    "'" + /*ATM_SEQNO*/ DETAIL[i]["DCSDCOT-D-TERM-TXSEQ"].Trim() + "' ," +
                                    "'" + /*TRANS_CODE*/DETAIL[i]["DCSDCOT-D-TRANS-CODE"].Trim() + "' ," +
                                    "'" + /*APPROVE_CODE*/ DETAIL[i]["DCSDCOT-D-APPROVE-CODE"].Trim() + "' ," +
                                    "'" + /*CARD_NO*/ DETAIL[i]["DCSDCOT-D-CARD-NUM"].Trim() + "' ," +
	                                "'" + /*ITEM_STATUS*/ '0'+ "' ," +
	                                "'" + /*POST_STATUS*/ '0'+ "' ," +
	                                "" + /*POST_DATE*/ "NULL"+ " ," +
	                                "" + /*EXPORT_STATUS*/ "-9"+ " ," +
	                                "" + /*EXPORT_DATE*/ "NULL"+ " ," +
	                                "" + /*RECONCILE_DATE*/ "NULL"+ " ," +
	                                "'" + /*MEMBER_NAME*/ '-'+ "' ," +
                                    "'" + /*ATM_LOCATION*/ DETAIL[i]["DCSDCOT-D-TERM-LOCATION"].Trim() + "' ," +
                                    "'" + /*REF_DOCNO*/ ref_docno + "', "+
                                    "'" + /*FORMAT_CODE*/ FORMAT_CODE + "' )";
                    WebUtil.ExeSQL(sql);
                }
        }

        public void saveToTemp(String ref_docno)
        {
            Dictionary<string, string>[] HEADER = (Dictionary<string, string>[])this.data["HEADER"];
            Dictionary<string, string>[] DETAIL = (Dictionary<string, string>[])this.data["DETAIL"];
            Dictionary<string, string>[] FOOTER = (Dictionary<string, string>[])this.data["FOOTER"];

            if (HEADER.Length > 0)
            {
                if (DpFileFormatCode.SelectedValue == "ATM_BAY_IMP")
                {
                    this.saveATM_BAY_IMP(ref_docno,HEADER,DETAIL,FOOTER);
                }
              
            }
        }


    }
}
