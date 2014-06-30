<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="B2CPrint.m.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>极美图商城后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <%for(int i=0;i<100;i++){ %>
        &nbsp;<i class="icon-font">&#xe<%=String.Format("{0:000}", i)%>;</i>&nbsp;&nbsp;<%=String.Format("{0:000}", i)%>
        <%} %>
        
    </form>
</body>
</html>
