<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsCriteria.ascx.cs"
    Inherits="Saving.Applications.cmd.dlg.w_dlg_dealer_search_ctrl.DsCriteria" %>
<link id="css1" runat="server" href="../../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit" Width="428px">
    <EditItemTemplate>
        <table class="DataSourceFormView" style="width: 560px;">
           <tr>
                <td width="20%">
                    <div><span> เลขทะเบียนผู้จำหน่าย : </span></div>
                </td>
                <td>
                    <div><asp:TextBox ID="dealer_no" runat="server" Width="150px"></asp:TextBox></div>
                </td>
                <td width="20%">
                    <div> <span> ชื่อผู้จำหน่าย : </span></div>
                </td>
                <td>
                    <div><asp:TextBox ID="dealer_name" runat="server" Width="150px"></asp:TextBox></div>
                </td>
            </tr>
            <tr>
                <td width="20%">
                    <div><span> ที่อยู่ : </span></div>
                </td>
                <td colspan = "3">
                    <div><asp:TextBox ID="dealer_addr" runat="server" ></asp:TextBox></div>
                </td>
            </tr>
            <tr>
                 <td width="20%">
                    <div><span> เลขที่เสียภาษี : </span></div>
                </td>
                <td >
                    <div><asp:TextBox ID="dealer_taxid" runat="server" ></asp:TextBox></div>
                </td>
            </tr>
            <tr>
                <td width="20%">
                    <div><span> โทรศัพท์ : </span></div>
                </td>
                <td>
                    <div><asp:TextBox ID="dealer_phone" runat="server" ></asp:TextBox></div>
                </td>
            </tr>
        </table>
    </EditItemTemplate>
</asp:FormView>
