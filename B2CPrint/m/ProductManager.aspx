<%@ Page Title="" Language="C#" MasterPageFile="~/m/m.Master" AutoEventWireup="true" CodeBehind="ProductManager.aspx.cs" Inherits="B2CPrint.m.ProductManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="/jscss/admin/design/">首页</a><span class="crumb-step">&gt;</span><span>商品管理</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <div class="result-list">
                    <a id="AddProduct" href="InsertProduct.aspx"><i class="icon-font"></i>添加商品</a>
                    <a id="AddParameters" href="InsertParameters.aspx"><i class="icon-font"></i>添加参数</a>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
