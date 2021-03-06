﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mixture.aspx.cs" Inherits="number.mixture" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>数字英文混合验证</title>
    <script type="text/javascript">
        function getmixture(n) {
            var s = "";
            var cal =0;
            var num = new Array(62);
           
            for (var i = 65; i <= 122; i++) {
                if (i > 90 && i < 97)
                    continue;
                num[cal] = String.fromCharCode(i);
                cal += 1;
            }
           
            for (var j = 0; j <= 9; j++)
            {
               num[cal] = j;
               cal++;
            }
            for (var i = 0; i < n; i++) {
                var t = Math.ceil(Math.random() * num.length);//Math.ceil(n); 返回大于等于n的最小整数。
                s += num[t];
            }
            document.getElementById("Label1").innerHTML = s;//这里不能是.Text,label在客户端会变成<span>,如果不用innerHTML改变不了值                    
            document.getElementById("HiddenField1").value = s;
        }
        function changestyle() {
            document.getElementById("lab").style.cursor = 'pointer';
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <p>
            验证码：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</p>
         <div id="lab" onclick="getmixture(4)" onmousemove="changestyle()"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>          
        <%--<a href="javascript:void(0)" onclick="getletters(4)" >看不清，换一张</a> --%>
        <%--  <!-- -->， html comment会包含在最终生成的html文件中
           现在使用的注释，aspx comment 不会包含在最终生成的html文件中 --%>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click1"  />
    </form>
</body>
</html>

