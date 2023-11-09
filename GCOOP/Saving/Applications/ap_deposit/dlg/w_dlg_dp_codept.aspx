<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="w_dlg_dp_codept.aspx.cs"
    Inherits="Saving.Applications.ap_deposit.dlg.w_dlg_dp_codept" %>

<%@ Register Assembly="WebDataWindow" Namespace="Sybase.DataWindow.Web" TagPrefix="dw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ผู้ฝากร่วม</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dw:WebDataWindowControl ID="DwList" runat="server" DataWindowObject="d_dp_dept_edit_codept"
            LibraryList="~/DataWindow/ap_deposit/dp_deptedit.pbl" ClientScriptable="True"
            ClientEventClicked="selectRow" AutoRestoreContext="False" 
            AutoRestoreDataCache="True" AutoSaveDataCacheAfterRetrieve="True">
        </dw:WebDataWindowControl>
    </div>
    </form>
</body>
</html>
