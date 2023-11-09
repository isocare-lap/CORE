using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;
using DataLibrary;

namespace Saving.Applications.app_finance.ws_fin_ucf_addcontact_ctrl
{
    public partial class DsMain : DataSourceFormView
    {
        public DataSet1.DT_MAINDataTable DATA { get; set; }

        public void InitDsMain(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.DT_MAIN;
            this.EventItemChanged = "OnDsMainItemChanged";
            this.EventClicked = "OnDsMainClicked";
            this.InitDataSource(pw, FormView1, this.DATA, "dsMain");
            this.Register();
        }

        public void RetrieveMain(String ls_contackno)
        {
            String sql = @"  
                   SELECT  FINCONTACKMASTER.CONTACK_NO ,  
                    FINCONTACKMASTER.FIRST_NAME ,   
                    FINCONTACKMASTER.PERSONTYPE_CODE ,   
                    FINCONTACKMASTER.LAST_NAME ,      
                    trim(FINCONTACKMASTER.PRENAME_CODE) as  PRENAME_CODE,   
                    FINCONTACKMASTER.TAX_ID ,        
                    FINCONTACKMASTER.PROVINCE ,        
                    FINCONTACKMASTER.ADDRESS_NO ,   
                    FINCONTACKMASTER.ROAD_NAME ,      
                    FINCONTACKMASTER.DISTRICT ,   
                    FINCONTACKMASTER.SOI_NO ,  
                    FINCONTACKMASTER.EMAIL_ADDR ,    
                    FINCONTACKMASTER.PHENE_NO ,   
                    FINCONTACKMASTER.MOBILE_NO ,  
                    FINCONTACKMASTER.FAX_NO ,        
                    FINCONTACKMASTER.SUBDISTRICT ,     
                    FINCONTACKMASTER.POSTCODE ,      
                    FINCONTACKMASTER.COOP_ID ,       
                    FINCONTACKMASTER.BANK_CODE ,    
                    FINCONTACKMASTER.BANK_BRANCH ,    
                    FINCONTACKMASTER.ACC_ID
                    FROM FINCONTACKMASTER   
                    WHERE ( FINCONTACKMASTER.CONTACK_NO = {1} ) and   
                   ( FINCONTACKMASTER.COOP_ID = {0} )  
                   ORDER BY FINCONTACKMASTER.CONTACK_NO          ASC  ";

            sql = WebUtil.SQLFormat(sql, state.SsCoopControl, ls_contackno);
            DataTable dt = WebUtil.Query(sql);
            this.ImportData(dt);
        }
        public void Ddprename()
        {
            string sql = "";
            sql = @"
                  SELECT  trim(PRENAME_CODE) as PRENAME_CODE ,  PRENAME_DESC,1 as sorter FROM MBUCFPRENAME
                    union
                    select '','--กรุณาเลือก--',0 from dual order by sorter";
            sql = WebUtil.SQLFormat(sql);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "PRENAME_CODE", "PRENAME_DESC", "PRENAME_CODE");
        }
        public void Ddprovince()
        {
            string sql = "";
            sql = @"
                    SELECT  trim(PROVINCE_CODE) as PROVINCE_CODE  ,  PROVINCE_DESC  ,1 as sorter  FROM MBUCFPROVINCE 
                      union
                    select '0','--กรุณาเลือก--',0 from dual order by sorter     ,PROVINCE_DESC          ASC   ";
            sql = WebUtil.SQLFormat(sql);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "PROVINCE", "PROVINCE_DESC", "PROVINCE_CODE");
        }
        public void Dddistrict(String province)
        {
            string sql = "";
            sql = @"
                    SELECT  trim(DISTRICT_CODE) as DISTRICT_CODE   ,   PROVINCE_CODE ,   DISTRICT_DESC, 1 as sorter 
                     FROM MBUCFDISTRICT WHERE  PROVINCE_CODE = {0} 
                    union
                    select '0','','--กรุณาเลือก--',0 from dual order by sorter,DISTRICT_CODE          ASC ";
            sql = WebUtil.SQLFormat(sql, province);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "DISTRICT", "DISTRICT_DESC", "DISTRICT_CODE");
        }
        public void Ddtambol(String district)
        {
            string sql = "";

            sql = @"
                    SELECT  trim(DISTRICT_CODE) as DISTRICT_CODE , TAMBOL_CODE,   TAMBOL_DESC, 1 as sorter 
                     FROM mbucftambol WHERE  DISTRICT_CODE = {0}
                    union
                    select '0','','--กรุณาเลือก--',0 from dual order by sorter,DISTRICT_CODE ASC ,TAMBOL_CODE ASC ";
            sql = WebUtil.SQLFormat(sql, district);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "SUBDISTRICT", "TAMBOL_DESC", "TAMBOL_CODE");
        }
        public void Ddbank()
        {
            string sql = "";

            sql = @"
                     SELECT BANK_CODE,  BANK_CODE||'-'|| BANK_DESC as BANK_DESC,    EDIT_FORMAT  ,1 as sorter  FROM CMUCFBANK
                    union
                    select '','--กรุณาเลือก--','',0 from dual order by sorter,BANK_CODE asc";
            sql = WebUtil.SQLFormat(sql);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "BANK_CODE", "BANK_DESC", "BANK_CODE");
        }
        public void Ddbankbranch(string bank)
        {
            string sql = "";

            sql = @"
                        SELECT BANK_CODE,  BRANCH_ID,   BRANCH_ID||' '||BRANCH_NAME as BRANCH_NAME ,1 as sorter    FROM CMUCFBANKBRANCH  WHERE CMUCFBANKBRANCH.BANK_CODE ={0}
                        union
                        select '','','--กรุณาเลือก--',0 from dual order by sorter, BRANCH_ID asc";
            sql = WebUtil.SQLFormat(sql, bank);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "BANK_BRANCH", "BRANCH_NAME", "BRANCH_ID");
        }
    }
}