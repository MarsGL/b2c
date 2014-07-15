using B2CPrint.DAL.ProductTypeTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace B2CPrint.m
{
    public partial class InsertProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //绑定第一个下拉框
                Dd1DataBind();
                //显示第一个下拉框对应的第二个下拉框的内容
                Dd2DataBind();
                //显示第二个下拉框对应的第三个下拉框的内容
                Dd3DataBind();
            }
        }

        //当下拉框改变时，显示相应的内容
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Dd2DataBind();
            Dd3DataBind();
            dropdownlist_show();
        }
        //当下拉框改变时，显示相应的内容
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Dd3DataBind();
            dropdownlist_show();
        }
        //DropDownList1
        public void Dd1DataBind()
        {
            DropDownList1.DataSourceID = "DataSourceSort1";
        }
        //DropDownList2
        public void Dd2DataBind()
        {
            DropDownList2.DataSourceID = "DataSourceSort2";

        }
        //DropDownList3
        public void Dd3DataBind()
        {
            DropDownList3.DataSourceID = "DataSourceSort3";
        }

        void dropdownlist_show()
        {
            ProductTypeTableAdapter adapter = new ProductTypeTableAdapter();


            if (adapter.GetDataBySort2(Convert.ToInt32(DropDownList1.SelectedValue)).Count == 0)
            {
                DropDownList2.Visible = false;
            }
            else
            {
                DropDownList2.Visible = true;
            }

            if (adapter.GetDataBySort2(Convert.ToInt32(DropDownList2.SelectedValue)).Count == 0)
            {
                DropDownList3.Visible = false;
            }
            else
            {
                DropDownList3.Visible = true;
            }

        }

        protected void DropDownList2_DataBound(object sender, EventArgs e)
        {

            dropdownlist_show();
        }
        

       


    }
}