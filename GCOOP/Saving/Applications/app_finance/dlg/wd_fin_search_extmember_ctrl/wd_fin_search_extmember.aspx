<%@ Page Title="" Language="C#" MasterPageFile="~/FrameDialog.Master" AutoEventWireup="true"  CodeBehind="wd_fin_search_extmember.aspx.cs" Inherits="Saving.Applications.app_finance.dlg.wd_fin_search_extmember_ctrl.wd_fin_search_extmember" %>
<%@ Register Src="DsCriteria.ascx" TagName="DsCriteria" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../../../JsCss/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="../../../../js/Gcoop.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var totalRows = document.getElementById("ctl00_ContentPlace_HdRow").value;
            if (totalRows > 16) {
                $('#ctl00_ContentPlace_GridView1 tbody tr ').not(':last-child').click(function () {
                    var tableData = $(this).children("td").map(function () {
                        return $(this).text();
                    }).get()
                    var contack_no = tableData[0];
                    try {

                        var isConfirm = confirm("ต้องการเลือกเลขที่บุคคล  " + contack_no + "  ใช่หรือไม่");
                        if (isConfirm) {
                            window.opener.GetContackFromDlg(contack_no);
                            window.close();
                        }
                    } catch (err) {
                        parent.GetContackFromDlg(contack_no);
                        window.close()
                    }
                });
            }
            else {
                $('#ctl00_ContentPlace_GridView1 tbody').on('click', 'tr', function () {
                    var tableData = $(this).children("td").map(function () {
                        return $(this).text();
                    }).get()
                    var contack_no = tableData[0];
                    try {
                        var member_no = tableData[0];
                        var isConfirm = confirm("ต้องการเลือกเลขที่บุคคล  " + contack_no + "  ใช่หรือไม่");
                        if (isConfirm) {
                            window.opener.GetContackFromDlg(contack_no);
                            window.close();
                        }
                    } catch (err) {
                        parent.GetContackFromDlg(contack_no);
                        window.close()
                    }
                });
            }
        });
//      var DsCriteria = new DataSourceTool();
//        function OnDsListClicked(s, r, c) {
//            var contack_no = dsList.GetItem(r, "contack_no");
//            try {
//                window.opener.GetContackFromDlg(contack_no);
//                window.close();
//            } catch (err) {
//                parent.GetContackFromDlg(contack_no);
//                parent.RemoveIFrame();
//            }
//        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <table style="width:96%;margin-left: 4%;margin-top:4%">
        <tr>
            <td>
                <uc1:DsCriteria ID="dsCriteria" runat="server" style="width:80%;"/>
            </td>
            <td>
                <asp:Button ID="BtSearch" runat="server" Text="ค้นหา" Width="60px" Height="55px"
                    OnClick="BtSearch_Click" />
            </td>
        </tr>
    </table>
    <div style="margin: 4%">
         <table cellspacing="0" rules="all" class="DataSourceRepeater" border="1" style="border-collapse: collapse;">
            <tr>
                <th align="center" style="width:25%;">
                    เลขที่บุคคล
                </th>
                <th  align="center" style="width:50%;">
                    ชื่อ - นามสกุล
                </th>
                 <th  align="center" style="width:25%;">
                    เลขภาษี
                </th>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true"
            OnPageIndexChanging="OnPageIndexChanging" PageSize="16" class="DataSourceRepeater"
            PagerSettings-Mode="NumericFirstLast" ShowHeader="false" PagerSettings-FirstPageText="<<" PagerSettings-LastPageText=">>"
            PagerSettings-NextPageText=">" PagerSettings-PreviousPageText="<" >
            <Columns>
                <asp:BoundField DataField="contack_no" HeaderText="เลขที่บุคคล">
                    <ItemStyle HorizontalAlign="Center" Width="25%" BorderColor="Black" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="fullname" HeaderText="ชื่อ - นามสกุล">
                    <ItemStyle Width="50%" BorderColor="Black" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="tax_id" HeaderText="เลขภาษี">
                    <ItemStyle Width="25%" BorderColor="Black" BorderWidth="1px" />
                </asp:BoundField>
            </Columns>
            <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" Mode="NumericFirstLast"
                NextPageText="&gt;" PreviousPageText="&lt;" PageButtonCount="10" Position="Bottom">                     
                </PagerSettings>               
        </asp:GridView>
    </div>
    <asp:HiddenField ID="HdRow" Value="" runat="server" />
    <asp:HiddenField ID="HdChangePage"  Value="" runat="server" />
</asp:Content>