<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsMain.ascx.cs" Inherits="Saving.Applications.app_finance.ws_fin_ucf_addcontact_ctrl.DsMain" %>
<link id="css1" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit" Style="width: 100%;">
    <EditItemTemplate>
        <table class="DataSourceFormView">
            <tr>
                <td width="15%">
                    <div>
                        <span>เลขที่บุคคล:</span>
                    </div>
                </td>
                <td width="20%">
                    <asp:TextBox ID="CONTACK_NO" runat="server" Style="text-align: center; width: 98%;
                        background-color: #DDDDDD" ReadOnly="true"></asp:TextBox>
                </td>
                <td width="15%">
                    <div>
                        <span>ประเภทบุคคล:<span>
                    </div>
                </td>
                <td width="15%">
                    <asp:DropDownList ID="PERSONTYPE_CODE" runat="server">
                        <asp:ListItem Value="01">บุคคลธรรมดา</asp:ListItem>
                        <asp:ListItem Value="02">นิติบุคคล</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="15%">
                    <div>
                        <span>คำนำหน้า:</span>
                    </div>
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="PRENAME_CODE" Style="width: 100%" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>ชื่อ/ ชื่อบริษัท:</span>
                    </div>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="FIRST_NAME" runat="server" Style="text-align: left; width: 98%"></asp:TextBox>
                </td>
                <td>
                    <div>
                        <span>นามสกุล:<span>
                    </div>
                </td>
                <td colspan="3">
                    <asp:TextBox ID="LAST_NAME" runat="server" Style="text-align: left; width: 99%"></asp:TextBox>
                </td>
            </tr>            
            <tr>
                <td>
                    <div>
                        <span>ที่อยู่:</span>
                    </div>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="ADDRESS_NO" runat="server" Style="text-align: center; width: 98%"></asp:TextBox>
                </td>
                <td>
                    <div>
                        <span>ซอย:<span>
                    </div>
                </td>
                <td colspan="3">
                    <asp:TextBox ID="SOI_NO" runat="server" Style="text-align: center; width: 99%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>ถนน:</span>
                    </div>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="ROAD_NAME" runat="server" Style="text-align: center; width: 98%"></asp:TextBox>
                </td>
                <td>
                    <div>
                        <span>จังหวัด:<span>
                    </div>
                </td>
                <td colspan="3">
                    <asp:DropDownList ID="PROVINCE" Style="text-align: center; width: 100%" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>อำเภอ/เขต:</span>
                    </div>
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="DISTRICT" Style="text-align: center; width: 99%" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <div>
                        <span>ตำบล/แขวง:<span>
                    </div>
                </td>
                <td>
                    <asp:DropDownList ID="SUBDISTRICT" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <div>
                        <span>ไปรษณีย์:<span>
                    </div>
                </td>
                <td>
                    <asp:TextBox ID="POSTCODE" runat="server" Style="text-align: center; width: 98%"
                        MaxLength="5"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>เลขผู้เสียภาษี:</span>
                    </div>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TAX_ID" runat="server" Style="text-align: center; width: 98%" MaxLength="13"></asp:TextBox>
                </td>
                <td>
                    <div>
                        <span>โทรสาร:<span>
                    </div>
                </td>
                <td colspan="3">
                    <asp:TextBox ID="FAX_NO" runat="server" Style="text-align: center; width: 99%" MaxLength="20"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <span style="height: 70px;">โทรศัพท์พื้นฐาน:</span>
                </td>
                <td>
                    <asp:TextBox ID="PHENE_NO" runat="server" Style="width: 98%; height: 70px;" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>
                    <span style="height: 70px;">โทรศัพท์เคลื่อนที่:</span>
                </td>
                <td>
                    <asp:TextBox ID="MOBILE_NO" runat="server" Style="height: 70px;" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>
                    <span style="height: 70px;">E-mail:</span>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="EMAIL_ADDR" runat="server" Style="width: 98%; height: 70px;" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>                
                <td>
                    <div>
                        <span>ธนาคาร:<span>
                    </div>
                </td>
                <td>
                    <asp:DropDownList ID="BANK_CODE" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <div>
                        <span>สาขา:</span>
                    </div>
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="BANK_BRANCH" Style="text-align: center; width: 99%" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <div>
                        <span>เลขบัญชี:</span>
                    </div>
                </td>
                <td>
                    <asp:TextBox ID="ACC_ID" runat="server" Style="text-align: center; width: 98%"></asp:TextBox>
                </td>
            </tr>
        </table>
    </EditItemTemplate>
</asp:FormView>
