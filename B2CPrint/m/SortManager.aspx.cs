using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;

namespace B2CPrint.m
{
    public partial class AddSortList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LinkButton_AddType_Click(object sender, EventArgs e)
        {
            AddType.Visible = true;
        }

        protected void save_Click(object sender, EventArgs e)
        {
            string pid;
            pid = null;
            if(DropDownList_AddType.SelectedValue!="0")
            {
                pid = DropDownList_AddType.SelectedValue;
            }
            string sql = "insert into ProductType values('" + textbox_addtype.Text + "','" + pid + "') ";
            int rows = DBHelper.ExecuteNonQuery(sql);
            if(rows>0)
            {
                if(rows==1)
                {

                }
            }
            else
            {

            }
        }
    }
}