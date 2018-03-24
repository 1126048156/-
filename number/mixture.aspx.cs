using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace number
{
    public partial class mixture : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label1.Text = getmixture(4);
            }
            if (!string.IsNullOrEmpty(HiddenField1.Value))
            {
                Session["mixture"] = HiddenField1.Value.ToLower();
                Label1.Text = HiddenField1.Value;
            }
        }

        private String getmixture(int n)
        {
            String s = "";
            int cal = 0;
            String[] num =new String[62];
            
            for (int i = 65; i <= 122; i++)
            {
                if (i > 90 && i < 97)
                    continue;
                System.Text.ASCIIEncoding asciiEncoding = new System.Text.ASCIIEncoding();
                byte[] btNumber = new byte[] { (byte)i };
                num[cal] = asciiEncoding.GetString(btNumber);
                cal += 1;
            }
            for (int j = 0; j <= 9; j++)
            {
                num[cal] = Convert.ToString(j);
                cal++;
            }
            Random ran = new Random();
            for (int i = 0; i < n; i++)
            {
                int t = ran.Next(num.Length);//产生一个小于num.Length的数字
                s += num[t];
            }
            Session["mixture"] = s.ToLower();
            return s;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (TextBox1.Text.ToLower() == Session["mixture"].ToString())
            {
                Response.Write("成功！");
                TextBox1.Text = "";
            }
            else
            {
                Response.Write("失败!");
                TextBox1.Text = "";
                HiddenField1.Value = "";
                Label1.Text = getmixture(4);//重新产生随机数字
            }
        }
    }
}