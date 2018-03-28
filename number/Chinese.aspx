<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chinese.aspx.cs" Inherits="number.Chinese" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>随机中文验证</title>
  
</head>
<body>
    <form id="form1" runat="server">   
        <p>
            验证码：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
         <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>        
        <%--<a href="javascript:void(0)" onclick="getletters(4)" >看不清，换一张</a> --%>
        <%--  <!-- -->， html comment会包含在最终生成的html文件中
           现在使用的注释，aspx comment 不会包含在最终生成的html文件中 --%>       
        <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click1"  />
    </form>
</body>
</html>
