<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numbers.aspx.cs" Inherits="number.numbers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>随机数字验证码</title>
    <script type="text/javascript">
        function getnumbers(n) {          
            var s="";    
            var num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];                   
            for(var i=0;i<n;i++)
            {
                var t = parseInt(10 * Math.random()); //Math.random()只能生成0~1的小数             
                s += num[t];
            }            
            document.getElementById("Label1").innerHTML = s;//这里不能是.Text,label在客户端会变成<span>,如果不用innerHTML改变不了值          
            
            Session["numbers"] = s;
           
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
         <div id="lab" onclick="getnumbers(4)" onmousemove="changestyle()"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>          
        <%--<a href="javascript:void(0)" onclick="getnumbers(4)" >看不清，换一张</a> --%>
        <%--  <!-- -->， html comment会包含在最终生成的html文件中
           现在使用的注释，aspx comment 不会包含在最终生成的html文件中 --%>
        <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" />
    </form>
</body>
</html>
