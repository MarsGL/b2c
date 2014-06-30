<%@ Page Title="" Language="C#" MasterPageFile="~/m/m.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="B2CPrint.m.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe06b;</i><span>您好：admin，欢迎使用极美图后台管理系统！</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>系统基本信息</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">操作系统</label><span class="res-info" id="OS" runat="server"></span>
                    </li>
                    <li>
                        <label class="res-lab">浏览器</label><span class="res-info" id="browers" runat="server"></span>
                    </li>
                    <li>
                        <label class="res-lab">上传附件限制</label><span class="res-info">2M</span>
                    </li>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                            </asp:Timer>
                            <li>
                                <label class="res-lab">北京时间</label><span class="res-info" id="time" runat="server"></span>
                            </li>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <li>
                        <label class="res-lab">服务器域名/IP</label><span class="res-info">localhost [ 127.0.0.1 ]</span>
                    </li>
                    <li>
                        <label class="res-lab">Host</label><span class="res-info" id="resinfo" runat="server"></span>
                    </li>
                </ul>
            </div>



        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>使用帮助</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">联系电话：</label><span class="res-info">123456</span>
                    </li>
                    <li>
                        <label class="res-lab">联系及反馈：</label><span class="res-info"><a class="qq-link" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=241689086&site=qq&menu=yes"><img border="0" src="http://pub.idqqimg.com/wpa/images/gdt/consult.jpg" alt="JS-前端开发" title="JS-前端开发"></a> </span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
