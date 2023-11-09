<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true"
    CodeBehind="ws_fin_ucf_addcontact.aspx.cs" Inherits="Saving.Applications.app_finance.ws_fin_ucf_addcontact_ctrl.ws_fin_ucf_addcontact" %>

<%@ Register Src="DsMain.ascx" TagName="DsMain" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var dsMain = new DataSourceTool;

        function Validate() {
            var alertstr = "";
            var first_name = dsMain.GetItem(0, "first_name");
            var last_name = dsMain.GetItem(0, "last_name");
            var persontype_code = dsMain.GetItem(0, "persontype_code");
            if (dsMain.GetItem(0, "prename_code") == "" || dsMain.GetItem(0, "prename_code") == null) {
                alertstr = alertstr + " - กรุณาคำนำหน้า!!\n";
            }
            if (dsMain.GetItem(0, "first_name") == "" || dsMain.GetItem(0, "first_name") == null) {
                alertstr = alertstr + "- กรุณากรอกชื่อ!!\n";
            }
            if (persontype_code == "01" && (dsMain.GetItem(0, "last_name") == "" || dsMain.GetItem(0, "last_name") == null)) {
                alertstr = alertstr + " - กรุณากรอกนามสกุล!!\n";
            }
            if (alertstr == "") {
                if (confirm("ยืนยันการบันทึกข้อมูล")) {
                    SaveWebSheet();
                }
            }
            else {
                alert(alertstr);
                return false;
            }
        }
        function MenubarOpen() {
            Gcoop.OpenIFrame2(900, 600, "wd_fin_search_extmember.aspx", "");
        }
        function OnDsMainItemChanged(s, r, c, v) {
            if (c == "province") {
                if (v == "" || v == "0" || v == null) {
                    dsMain.SetItem(0, "district", "");
                    dsMain.SetItem(0, "subdistrict", "");
                    dsMain.SetItem(0, "postcode", "");
                    dsMain.GetElement(0, "district").disabled = true;
                    dsMain.GetElement(0, "subdistrict").disabled = true;
                    dsMain.GetElement(0, "postcode").disabled = true;
                } else {
                    dsMain.SetItem(0, "district", 0);
                    dsMain.SetItem(0, "subdistrict", "");
                    dsMain.SetItem(0, "postcode", "");
                    dsMain.GetElement(0, "subdistrict").disabled = true;
                    dsMain.GetElement(0, "postcode").disabled = true;
                    JsPostProvince();
                }
            }
            else if (c == "district") {
                dsMain.SetItem(0, "subdistrict", "");
                dsMain.SetItem(0, "postcode", "");
                dsMain.GetElement(0, "postcode").disabled = false;
                dsMain.GetElement(0, "subdistrict").disabled = false;
                JsPostGetDistrict();
            }
            else if (c == "bank_code") {
                dsMain.SetItem(0, "bank_branch", "");
                JsPostGetBank();
            } else if (c == "tax_id") {
                if (dsMain.GetItem(0, "persontype_code") == "01") {
                    if (v.length != 13) {
                        alert('เลขผู้เสียภาษีไม่ครบ 13 หลัก!'); return false;
                    }
                }
                JsPostTaxid();
            } else if (c == "persontype_code") {
                if (v == "01") {
                    JsPostTaxid();
                }
            }
        }
        function GetContackFromDlg(contack_no) {
            dsMain.SetItem(0, "contack_no", contack_no);
            JsPostRrieveContack();
        }
        function OnClickdelete(s, r, c) {
            if (confirm("ลบข้อมูล " + (dsMain.GetItem(0, "contack_no")) + " ?") == true) {
                JsPostDelete();
            }
        }
        function SheetLoadComplete() {
            var province = dsMain.GetItem(0, "province");
            if (province == "" || province == "0" || province == null) {
                dsMain.SetItem(0, "district", "");
                dsMain.SetItem(0, "subdistrict", "");
                dsMain.SetItem(0, "postcode", "");
                dsMain.GetElement(0, "district").disabled = true;
                dsMain.GetElement(0, "subdistrict").disabled = true;
                dsMain.GetElement(0, "postcode").disabled = true;
            } else {
                dsMain.GetElement(0, "district").disabled = false;
                var distrinct = dsMain.GetItem(0, "district");
                if (distrinct == "" || distrinct == "0" || distrinct == null) {
                    dsMain.SetItem(0, "subdistrict", "");
                    dsMain.SetItem(0, "postcode", "");
                    dsMain.GetElement(0, "subdistrict").disabled = true;
                    dsMain.GetElement(0, "postcode").disabled = true;
                } else {
                    dsMain.GetElement(0, "subdistrict").disabled = false;
                    dsMain.GetElement(0, "postcode").disabled = false;
                }
            }

            var bank_code = dsMain.GetItem(0, "bank_code");
            if (bank_code == "" || bank_code == "0" || bank_code == null) {
                dsMain.SetItem(0, "bank_branch", "");
                dsMain.GetElement(0, "bank_branch").disabled = true;
            } else {
                dsMain.GetElement(0, "bank_branch").disabled = false;
            }
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <div style="text-align: right;">
        &nbsp;<span class="NewRowLink" onclick="OnClickdelete()" style="padding-left: 30px;">
            <asp:Label ID="LbInsert2" runat="server" Text="ลบข้อมูล" Font-Names="Tahoma" Font-Size="14px"
                Font-Underline="True" ForeColor="#191970" /></span>&nbsp;
    </div>
    <uc1:DsMain ID="dsMain" runat="server" />
</asp:Content>
