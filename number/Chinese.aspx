<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chinese.aspx.cs" Inherits="number.Chinese" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>随机中文验证</title>
    <script type="text/javascript">
        function getchinese(n)
        {
            var s = "";
            for (var i = 0; i < n; i++) {
                eval("var word=" + '"\\u' + (Math.round(Math.random() * 20901) + 19968).toString(16) + '"');
                s += word;
            }
            document.getElementById("Label1").innerHTML = s;//这里不能是.Text,label在客户端会变成<span>,如果不用innerHTML改变不了值                    
            document.getElementById("HiddenField1").value = s;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">   
        <p>
            验证码：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
         <div id="lab" onclick="getchinese(4)" onmousemove="changestyle()"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>          
        <%--<a href="javascript:void(0)" onclick="getletters(4)" >看不清，换一张</a> --%>
        <%--  <!-- -->， html comment会包含在最终生成的html文件中
           现在使用的注释，aspx comment 不会包含在最终生成的html文件中 --%>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click1"  />
    </form>
</body>
</html>
