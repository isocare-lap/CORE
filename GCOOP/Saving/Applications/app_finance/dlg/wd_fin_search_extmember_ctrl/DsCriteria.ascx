<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsCriteria.ascx.cs" Inherits="Saving.Applications.app_finance.dlg.wd_fin_search_extmember_ctrl.DsCriteria" %>
<link id="css1" runat="server" href="../../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit" Width="100%">
    <EditItemTemplate>
        <table class="DataSourceFormView">
            <tr>
                <td width="12%">
                    <div>
                        <span>เลขที่บุคคล:</span>
                    </div>
                </td>
                <td width="18%">
                    <div>
                        <asp:TextBox ID="contack_no" runat="server"></asp:TextBox>
                    </div>
                </td>   
                 <td width="15%">
                    <div>
                        <span>เลขภาษี:</span>
                    </div>
                </td>
                <td width="18%">
                    <div>
                        <asp:TextBox ID="TAX_ID" runat="server"></asp:TextBox>
                    </div>
                </td>
             </tr>
             <tr>                          
                <td>
                    <div>
                        <span>ชื่อ:</span>
                    </div>
                </td>
                <td>
                    <div>
                        <asp:TextBox ID="FIRST_NAME" runat="server"></asp:TextBox>
                    </div>
                </td>
                <td>
                    <div>
                        <span>นามสกุล:</span>
                    </div>
                </td>
                <td>
                    <div>
                        <asp:TextBox ID="LAST_NAME" runat="server"></asp:TextBox>
                    </div>
                </td>                
            </tr>        
        </table>
    </EditItemTemplate>
</asp:FormView>