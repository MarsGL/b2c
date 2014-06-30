<%@ Page Title="" Language="C#" MasterPageFile="~/m/m.Master" AutoEventWireup="true" CodeBehind="SortManager.aspx.cs" Inherits="B2CPrint.m.AddSortList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-wrap">
        
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="/jscss/admin/design/">首页</a><span class="crumb-step">&gt;</span><span>分类管理</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="/jscss/admin/design/add" method="post" id="myform" name="myform" enctype="multipart/form-data">
                    <table class="insert-tab" width="100%">
                        <tbody><tr>
                            <th width="120"><i class="require-red">*</i>分类：</th>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" name="colId" CssClass="required" AutoPostBack="True" DataSourceID="DataSourceSort1" DataTextField="TypeName" DataValueField="Id" ></asp:DropDownList>
                                <asp:DropDownList ID="DropDownList2" runat="server" name="colId" CssClass="required" AutoPostBack="True" DataSourceID="DataSourceSort2" DataTextField="TypeName" DataValueField="Id" ></asp:DropDownList>
                                <asp:DropDownList ID="DropDownList3" runat="server" name="colId" CssClass="required" AutoPostBack="True" DataSourceID="DataSourceSort3" DataTextField="TypeName" DataValueField="Id" ></asp:DropDownList>
                            </td>
                                
                        </tr>
                            <tr>
                                <th><i class="require-red">*</i>标题：</th>
                                <td>
                                    <input class="common-text required" id="title" name="title" size="50" value="" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th>作者：</th>
                                <td><input class="common-text" name="author" size="50" value="admin" type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>缩略图：</th>
                                <td><input name="smallimg" id="" type="file"><!--<input type="submit" onclick="submitForm('/jscss/admin/design/upload')" value="上传图片"/>--></td>
                            </tr>
                            <tr>
                                <th>内容：</th>
                                <td><textarea name="content" class="common-textarea" id="content" cols="30" style="width: 98%;" rows="10"></textarea></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>
</ContentTemplate></asp:UpdatePanel>
    </div>
    <asp:ObjectDataSource ID="DataSourceSort1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="B2CPrint.DAL.ProductTypeTableAdapters.ProductTypeTableAdapter">
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="DataSourceSort2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySort2" TypeName="B2CPrint.DAL.ProductTypeTableAdapters.ProductTypeTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="---" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="DataSourceSort3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySort2" TypeName="B2CPrint.DAL.ProductTypeTableAdapters.ProductTypeTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="---" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>





</asp:Content>
