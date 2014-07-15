<%@ Page Title="" Language="C#" MasterPageFile="~/m/m.Master" AutoEventWireup="true" CodeBehind="InsertParameters.aspx.cs" Inherits="B2CPrint.m.InsertParameters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="/jscss/admin/design/">首页</a><span class="crumb-step">&gt;</span><a href="#">商品管理</a><span class="crumb-step">&gt;</span><span>添加商品</span></div>
        </div>
        <div class="result-wrap">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th width="120"><i class="require-red">*</i>分类：</th>
                                <td>
                                    <asp:DropDownList ID="DropdownList_ParametersType" runat="server" DataSourceID="ObjectDataSource_ParametersType" DataTextField="ParameterName" DataValueField="Id" AutoPostBack="true"></asp:DropDownList>
                                </td>

                            </tr>
                        </tbody>
                    </table>
                    <asp:ListView ID="ListView_ProductParameters" runat="server" DataKeyNames="Id" DataSourceID="ObjectDataSource_ProductParameters" EnableModelValidation="True" InsertItemPosition="LastItem">
                                    <EditItemTemplate>
                                        <tr style="">
                                            <td>
                                                <asp:TextBox ID="ParameterIdTextBox" runat="server" Text='<%# Bind("ParameterId") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ParameterNameTextBox" runat="server" Text='<%# Bind("ParameterName") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="SpecificationsTextBox" runat="server" Text='<%# Bind("Specifications") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ImgTextBox" runat="server" Text='<%# Bind("Img") %>' />
                                            </td>
                                            
                                            <td>
                                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                                            </td>
                                        </tr>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <table runat="server" style="">
                                            <tr>
                                                <td>未返回数据。</td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                        <tr style="">
                                            <td>&nbsp;</td>
                                            <td>
                                                <asp:TextBox ID="ParameterNameTextBox" runat="server" Text='<%# Bind("ParameterName") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="SpecificationsTextBox" runat="server" Text='<%# Bind("Specifications") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ImgTextBox" runat="server" Text='<%# Bind("Img") %>' />
                                            </td>
                                            <%--<td>&nbsp;</td>--%>
                                            <td>
                                                <asp:Repeater ID="TypeNameRepeater" runat="server" DataSourceID="ObjectDataSource_ParametersType2"><ItemTemplate><%#Eval("ParameterName") %></ItemTemplate></asp:Repeater>
                                            </td>
                                            <td>
                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                                            </td>
                                        </tr>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <tr style="">
                                            <td>
                                                <asp:Label ID="ParameterIdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="ParameterNameLabel" runat="server" Text='<%# Eval("ParameterName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="SpecificationsLabel" runat="server" Text='<%# Eval("Specifications") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="ImgLabel" runat="server" Text='<%# Eval("Img") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="ParameterType" runat="server" Text='<%# Eval("TypeName") %>' />
                                            </td>
                                            <td>
                                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table runat="server">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                                        <tr runat="server" style="">
                                                            <th runat="server">编号</th>
                                                            <th runat="server">参数名称</th>
                                                            <th runat="server">参数规格</th>
                                                            <th runat="server">参数图片</th>
                                                            <th runat="server">参数类型</th>
                                                            <th runat="server">操作</th>
                                                        </tr>
                                                        <tr id="itemPlaceholder" runat="server">
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr runat="server">
                                                <td runat="server" style=""></td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                </asp:ListView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>


    </div>
    <asp:ObjectDataSource ID="ObjectDataSource_ParametersType2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByRepeater" TypeName="B2CPrint.DAL.TypeParametersTableAdapters.TypeParametersTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropdownList_ParametersType" DefaultValue="0" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource_ParametersType" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="B2CPrint.DAL.TypeParametersTableAdapters.TypeParametersTableAdapter"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource_ProductParameters" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByProductParameters" TypeName="B2CPrint.DAL.ProductParametersTableAdapters.ProductParametersTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ParameterId" Type="Int32" />
            <asp:Parameter Name="ParameterName" Type="String" />
            <asp:Parameter Name="Specifications" Type="String" />
            <asp:Parameter Name="ParentId" Type="String" />
            <asp:Parameter Name="Img" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropdownList_ParametersType" DefaultValue="0" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ParameterId" Type="Int32" />
            <asp:Parameter Name="ParameterName" Type="String" />
            <asp:Parameter Name="Specifications" Type="String" />
            <asp:Parameter Name="ParentId" Type="String" />
            <asp:Parameter Name="Img" Type="String" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
