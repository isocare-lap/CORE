<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="w_sheet_cmd_ptdealermaster.aspx.cs" 
Inherits="Saving.Applications.cmd.w_sheet_cmd_ptdealermaster" %>
<%@ Register Assembly="WebDataWindow" Namespace="Sybase.DataWindow.Web" TagPrefix="dw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Validate() {
            if (confirm("ยืนยันการบันทึกข้อมูล")) {
                return true;
            } else {
                return false;
            }
        }

        function MenubarOpen() {
            Gcoop.OpenDlg(750, 570, "w_dlg_cmd_ptinvtmast.aspx", "");
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
<asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <dw:WebDataWindowControl ID="DwMain" runat="server" DataWindowObject="d_main_dealermaster"
        LibraryList="~/DataWindow/Cmd/cmd_dealermaster.pbl" Width="750px" ClientScriptable="True"
        AutoRestoreContext="False" AutoRestoreDataCache="True" AutoSaveDataCacheAfterRetrieve="True"
        ClientFormatting="True" ClientEventButtonClicked="OnDwMainClicked" ClientEventItemChanged="OnDwMainItemChange">
    </dw:WebDataWindowControl>
</asp:Content>
