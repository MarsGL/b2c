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
                <form action="/jscss/admin/design/index" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="120">选择分类:</th>
                            <td>
                                <select name="search-sort" id="">
                                    <option value="19">一级类目</option>
                                    <option value="20">二级类目</option>
                                    <option value="21">三级类目</option>
                                </select>
                            </td>
                            <th width="70">关键字:</th>
                            <td>
                                <input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
                            <td>
                                <input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <div class="result-list">
                    <asp:LinkButton ID="LinkButton_AddType" runat="server" OnClick="LinkButton_AddType_Click"><i class="icon-font"></i>新增类目</asp:LinkButton>
                    <a id="batchDel" href="javascript:void(0)" onclick="alert('删除');"><i class="icon-font"></i>批量删除</a>
                </div>
            </div>

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

    <asp:ObjectDataSource ID="AddTypeSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByAddProductType" TypeName="B2CPrint.DAL.ProductTypeTableAdapters.ProductTypeTableAdapter">
    </asp:ObjectDataSource>
</asp:Content>
