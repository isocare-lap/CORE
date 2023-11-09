<%@ Page Title="" Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true"
    CodeBehind="ws_dep_reprintslip.aspx.cs" Inherits="Saving.Applications.deposit.ws_dep_reprintslip_ctrl.ws_dep_reprintslip" %>

<%@ Register Src="DsMain.ascx" TagName="DsMain" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style >
        table#ctl00_ContentPlace_GridView1.DataSourceRepeater tbody tr:hover
        {
            color:Red; 
            cursor:pointer;      
        }
    </style>
    <script type="text/javascript" src="../../../JsCss/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        var dsMain = new DataSourceTool;

        function OnDsMainClicked(s, r, c) {

        }

        $(document).ready(function () {
            $('#ctl00_ContentPlace_GridView1.DataSourceRepeater tbody').on('click', 'tr', function () {
                var tableData = $(this).children("td").map(function () {
                    return $(this).text();
                }).get();
                alert(tableData[0]);
                Gcoop.GetEl("HdDPslip").value = tableData[0];
				Gcoop.GetEl("HdRecpay").value = tableData[2];
                PostPrintSlip();
            });
        });
    </script>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <table>
        <tr>
            <td >
                <uc1:DsMain ID="dsMain" runat="server" Width="100%"/>
            </td>
            <td>
                <asp:Button ID="BtSearch" runat="server" Text="ค้นหา" Width="50px" Height="110px"
                    OnClick="BtSearch_Click" />
            </td>
        </tr>
    </table>
    <br />
    <table cellspacing="0" rules="all" class="DataSourceRepeater" border="1" style="width:100%;border-collapse:collapse;">
        <tr>
            <th align="center" style="width:12%;">เลขที่ใบทำรายการ</th>
            <th align="center" style="width:10%;">วันที่ทำรายการ</th>
            <th align="center" style="width:8%;">รายการ</th>
            <th align="center" style="width:12%;">จำนวนเงิน</th>
            <th align="center" style="width:10%;">โดย</th>
            <th align="center" style="width:10%;">เลขที่บัญชี</th>
            <th align="center" style="width:7%;">ประเภท</th>
            <th align="center" >ชื่อบัญชี</th>
            <th align="center" style="width:10%;">ทะเบียนสมาชิก</th>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server" Height="450px" ScrollBars="auto">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="DataSourceRepeater"  Width="100%" ShowHeader="false" >
            <Columns>
                <asp:BoundField DataField="deptslip_no" HeaderText="เลขที่ใบทำรายการ" >
                        <ItemStyle HorizontalAlign="Center" Width="12%" />
                </asp:BoundField>                            
                <asp:BoundField DataField="deptslip_date" HeaderText="วันที่ทำรายการ" DataFormatString="{0:dd/MM/yyyy}">
                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="recppaytype_code" HeaderText="รายการ">
                        <ItemStyle HorizontalAlign="Center" Width="8%" />
                </asp:BoundField>
                <asp:BoundField DataField="deptslip_netamt" HeaderText="จำนวนเงิน" DataFormatString="{0:#,##0.00}">
                        <ItemStyle HorizontalAlign="Right" Width="12%" />
                </asp:BoundField>
                <asp:BoundField DataField="entry_id" HeaderText="โดย">
                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="deptaccount_no" HeaderText="เลขที่บัญชี">
                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="depttype_code" HeaderText="ประเภท">
                        <ItemStyle HorizontalAlign="Center" Width="7%" />
                </asp:BoundField>
                <asp:BoundField DataField="deptaccount_name" HeaderText="ชื่อบัญชี">
                        <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="member_no" HeaderText="ทะเบียนสมาชิก">
                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                </asp:BoundField>                            
                </Columns> 
        </asp:GridView>    
    </asp:Panel>
    <asp:HiddenField ID="HdDPslip" runat="server" />
	<asp:HiddenField ID="HdRecpay" runat="server" />
</asp:Content>
