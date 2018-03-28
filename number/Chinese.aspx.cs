using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace number
{
    public partial class Chinese : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label1.Text = display();
            }
          
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (TextBox1.Text.ToString() == Session["chinese"].ToString())
            {
                Response.Write("成功！");
                TextBox1.Text = "";
            }
            else
            {
                Response.Write("失败!");
                TextBox1.Text = "";              
                Label1.Text = display();//重新产生随机数字
            }
        }
        private static object[] getchinesecode(int n)
        {
            String[] rBase = new String[16] { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };
            object[] bytes = new object[n];
            Random rnd = new Random();
            for (int i = 0; i < n; i++)
            {
                int r1 = rnd.Next(11, 14);//B0-F7,汉字都从第16区B0开始，并且从区位D7开始以后的汉字都是和很难见到的繁杂汉字
                string str_r1 = rBase[r1].Trim();
                int r2;
                if(r1==13)//如果第1位是D的话，第2位区位码就不能是7以后的十六进制数
                {
                    r2 = rnd.Next(0, 8);
                }
                else
                {
                     r2 = rnd.Next(0, 16);
                }
                string str_r2 = rBase[r2].Trim();
                int r3 = rnd.Next(10, 16);//A1-FE
                string str_r3 = rBase[r3].Trim();
                int r4;
                if(r3==10)
                {
                     r4 = rnd.Next(1, 16);//每区的第一个位置，没有汉字，因此随机生成的区位码第3位如果是A的话，第4位就不能是0
                }
                else if(r3==15)
                {
                     r4 = rnd.Next(0, 15);//最后一个位置都是空的,没有汉字,第3位如果是F的话，第4位就不能是F
                }
                else
                {
                     r4 = rnd.Next(0, 16);
                }
                string str_r4 = rBase[r4].Trim();
                //定义两个字节变量存储产生的随机汉字区位码
                byte byte1 = Convert.ToByte(str_r1 + str_r2, 16);
                byte byte2 = Convert.ToByte(str_r3 + str_r4, 16);
                //将两个字节变量存储在字节数组中
                byte[] str_r = new byte[] { byte1, byte2 };
                bytes.SetValue(str_r, i);
            }
            return bytes;
        }
        public String display()
        {
            Encoding gb = Encoding.GetEncoding("gb2312");//引用System.Text这个命名空间，获取GB2编码表
            object[] bytes = getchinesecode(4);
            string s = String.Empty;
            foreach (object byt in bytes)
            {
                String str1 = gb.GetString((byte[])Convert.ChangeType(byt, typeof(byte[])));
                s = s + str1;
            }
            Session["chinese"] = s;
            return s;
        }

    }
}