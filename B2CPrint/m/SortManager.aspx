<%@ Page Title="" Language="C#" MasterPageFile="~/m/m.Master" AutoEventWireup="true" CodeBehind="SortManager.aspx.cs" Inherits="B2CPrint.m.AddSortList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="/jscss/admin">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">作品管理</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                    <table class="search-tab">
                        <tr>
                            <th width="120">选择分类:</th>
                            <td>
                                <asp:DropDownList ID="DropDownList_TypeList" name="search-sort" runat="server" OnSelectedIndexChanged="DropDownList_TypeList_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Value="1">一级类目</asp:ListItem>
                                    <asp:ListItem Value="2">二级类目</asp:ListItem>
                                    <asp:ListItem Value="3">三级类目</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <th width="70">关键字:</th>
                            <td>
                                <input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text" /></td>
                            <td>
                                <input class="btn btn-primary btn2" name="sub" value="查询" type="submit" /></td>
                        </tr>
                    </table>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <div class="result-list">
                    <asp:LinkButton ID="LinkButton_AddType" runat="server" OnClick="LinkButton_AddType_Click"><i class="icon-font"></i>新增类目</asp:LinkButton>
                    <a id="batchDel" href="javascript:void(0)" onclick="alert('删除');"><i class="icon-font"></i>批量删除</a>
                </div>
            </div>

            <asp:Panel runat="server" ID="ListType">
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="TypeListSortSource1" EnableModelValidation="True" OnItemCreated="ListView1_ItemCreated" OnItemUpdating="ListView1_ItemUpdating" OnItemDeleting="ListView1_ItemDeleting" OnDataBound="ListView1_DataBound">
                    <EditItemTemplate>
                        <tr style="">
                            <td class="tc">
                                <input name="id[]" value="59" type="checkbox">
                            </td>
                            <td>
                                <asp:TextBox ID="TypeNameTextBox" runat="server" Text='<%# Bind("TypeName") %>' />
                            </td>
                            <td>
                                <asp:DropDownList ID="TypeNameEdit" runat="server" DataSourceID="AddTypeSource" DataTextField="TypeName" DataValueField="Id" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">顶级类目</asp:ListItem>
                                </asp:DropDownList>
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
                                <td>暂无数据。</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td class="tc">
                                <input name="id[]" value="59" type="checkbox">
                            </td>
                            <td>
                                <asp:Label ID="TypeNameLabel" runat="server" Text='<%# Eval("TypeName") %>' />
                            </td>
                            <td >
                                <asp:Label ID="TypeName1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                            </td>

                            <td>
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" class="result-tab" width="100%">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <tr runat="server" style="">
                                            <th class="tc" width="5%">
                                                <input class="allChoose" name="" type="checkbox"></th>
                                            <th>标题</th>
                                            <th width="30%">隶属于：</th>
                                            <th>操作</th>
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


            </asp:Panel>
            

            <asp:Panel runat="server" ID="AddType" Visible="false">
                <div>
                    <table class="insert-tab" width="50%">
                        <tr>
                            <td>类目名称：</td>
                            <td>
                                <asp:TextBox runat="server" ID="textbox_addtype"></asp:TextBox></td>
                            <td>隶属于：</td>
                            <td>
                                <asp:DropDownList runat="server" ID="DropDownList_AddType" name="colId" CssClass="required" DataSourceID="AddTypeSource" DataTextField="TypeName" DataValueField="Id" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">顶级类目</asp:ListItem>
                                </asp:DropDownList>


                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button" />
                            </td>
                            <td>
                                <asp:Button runat="server" Text="提交" CssClass="btn btn-primary btn6 mr10" ID="save" OnClick="save_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </div>
    </div>

    <asp:ObjectDataSource ID="AddTypeSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByAddProductType" TypeName="B2CPrint.DAL.ProductTypeTableAdapters.ProductTypeTableAdapter"></asp:ObjectDataSource>
    

    <asp:ObjectDataSource ID="TypeListSortSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByList_sort1" TypeName="B2CPrint.DAL.ProductTypeTableAdapters.ProductTypeTableAdapter" DeleteMethod="Delete" UpdateMethod="UpdateQuery">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TypeName" Type="String" />
            <asp:Parameter Name="ParentId" Type="Int32" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="TypeListSortSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByList_sort2" TypeName="B2CPrint.DAL.ProductTypeTableAdapters.ProductTypeTableAdapter" DeleteMethod="Delete" UpdateMethod="UpdateQuery">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TypeName" Type="String" />
            <asp:Parameter Name="ParentId" Type="Int32" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="TypeListSortSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByList_sort3" TypeName="B2CPrint.DAL.ProductTypeTableAdapters.ProductTypeTableAdapter" DeleteMethod="Delete" UpdateMethod="UpdateQuery">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TypeName" Type="String" />
            <asp:Parameter Name="ParentId" Type="Int32" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
