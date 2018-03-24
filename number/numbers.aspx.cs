using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace number
{
    public partial class numbers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                 Label1.Text = getnumbers(4);
            }
            if ( !string.IsNullOrEmpty(HiddenField1.Value))
            {
                Session["numbers"] = HiddenField1.Value;
                Label1.Text = HiddenField1.Value;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
            if(TextBox1.Text.ToString()==Session["numbers"].ToString())
            {
                Response.Write("成功！");
                TextBox1.Text = "";
            }
            else
            {
                Response.Write("失败!");
                TextBox1.Text = "";
                HiddenField1.Value = "";//必须要这个，失败了之后不会采用前面的js代码，但是有可能HIddenFild里面有值，一直失败的话HiddenFild里面的值也不会变，一直错误
                Label1.Text = getnumbers(4);//重新产生随机数字
            }
        }

        public String getnumbers(int n)
        {
            String s="";
            String vail = "0,1,2,3,4,5,6,7,8,9";
            String[] num = vail.Split(',');
            //String[] num={"0","1","2","3","4","5","6","7","8","9"};这样写也可以，但是看书上跟别人的代码都用了上面的方法
            Random ran = new Random();
            for(int i=0;i<n;i++)
            {
                int t = ran.Next(num.Length);//产生一个小于num.Length的数字
                s += num[t];
            }
            Session["numbers"] = s;
            return s;
        }
    }
}