<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsList.ascx.cs" Inherits="Saving.Applications.app_finance.dlg.wd_fin_search_extmember_ctrl.DsList" %>
<link id="css1" runat="server" href="../../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<div align="left">
    <asp:Panel ID="Panel1" runat="server" Width="500px" HorizontalAlign="Left">
        <table class="DataSourceRepeater" style="width: 500px;">
            <tr>
                <th width="25%">
                    เลขที่
                </th>
                <th width="50%">
                    ชื่อ - นามสกุล
                </th>
                <th width="25%">
                    เลขภาษี
                </th>
            </tr>
        </table>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td width="25%">
                            <asp:TextBox ID="contack_no" runat="server" ReadOnly="true" Style="cursor: pointer"></asp:TextBox>
                        </td>
                        <td width="50%">
                            <asp:TextBox ID="fullname" runat="server" ReadOnly="true" Style="cursor: pointer"></asp:TextBox>
                        </td>
                        <td width="25%">
                            <asp:TextBox ID="tax_id" runat="server" ReadOnly="true" Style="cursor: pointer"></asp:TextBox>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </asp:Panel>
</div>
<div style="margin-top: 20px; background-color:#DCF4FB;" >
    <table style="width: 400px;" class="tbPage">
        <tr>
            <td style="width: 20px">
                <asp:LinkButton ID="lbFirst" runat="server"  OnClick="lbFirst_Click"><<</asp:LinkButton>
            </td>
            <td style="width: 20px">
                <asp:LinkButton ID="lbPrevious" runat="server"  OnClick="lbPrevious_Click"><</asp:LinkButton>
            </td>
            <td align="center" style="width: 320px">
                <asp:DataList ID="rptPaging" runat="server"  OnItemCommand="rptPaging_ItemCommand"
                    OnItemDataBound="rptPaging_ItemDataBound" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
                            CommandName="newPage" Text='<%# Eval("PageText") %> ' Width="30px">
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td style="width: 20px">
                <asp:LinkButton ID="lbNext" runat="server"  OnClick="lbNext_Click">></asp:LinkButton>
            </td>
            <td style="width: 20px">
                <asp:LinkButton ID="lbLast" runat="server"  OnClick="lbLast_Click">>></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="5">
                <asp:Label ID="lblpage" runat="server" Text="" style="color:Blue;font-weight:bolder"></asp:Label>
            </td>
        </tr>
    </table>
</div>
