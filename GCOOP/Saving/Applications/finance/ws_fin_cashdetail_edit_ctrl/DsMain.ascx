<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsMain.ascx.cs" Inherits="Saving.Applications.finance.ws_fin_cashdetail_edit_ctrl.DsMain" %>
<link id="css1" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet" type="text/css" />
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit">
    <EditItemTemplate>
        <div style="float:left;font-weight:bolder;font-size:17px;text-decoration: underline;color:#000099;">รายละเอียดผู้ใช้</span>
        <table class="DataSourceFormView" style="width:530px">
            <tr>               
                <td width="15%">
                    <span>ชื่อผู้ใช้:</span>
                </td>               
                <td width="20%" >
                    <asp:TextBox ID="FULL_NAME" runat="server" ReadOnly="true" ></asp:TextBox>                   
                </td>
                <td width="15%">
                    <span>seq_no:</span>
                </td>               
                <td width="15%">
                    <asp:TextBox ID="laststm_no" runat="server" style="text-align:center;"></asp:TextBox>                   
                </td>
                 <td width="15%"> <span>สถานะ:</span></td>
                <td width="15%">
                    <asp:TextBox ID="STATUS_DESC" runat="server" ReadOnly="true"> </asp:TextBox>
                </td>                               
            </tr>
            <tr>                
                <td rowspan="1">
                    <span style="height:50px; vertical-align: middle; line-height: 50px;">เงินคงเหลือ:</span>
                </td>
                <td rowspan="2" colspan="6">
                    <asp:TextBox ID="AMOUNT_BALANCE" runat="server" style="width:98.7%;height:50px;text-align:right;font-size:30px" ForeColor="DarkRed" ToolTip="#,##0.00" Font-Bold="True" BackColor="#CCCCCC" ReadOnly="true"></asp:TextBox>
                </td>                          
            </tr>         
        </table>
    </EditItemTemplate>
</asp:FormView>
