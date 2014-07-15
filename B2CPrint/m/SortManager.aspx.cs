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
        int sort_count,flag_del;
        protected void Page_Load(object sender, EventArgs e)
        {
            string s;
        }

        protected void LinkButton_AddType_Click(object sender, EventArgs e)
        {
            AddType.Visible = true;
            ListType.Visible = false;
        }

        protected void save_Click(object sender, EventArgs e)
        {
            string pid;
            pid = "NULL";
            if(DropDownList_AddType.SelectedValue!="0")
            {
                pid =DropDownList_AddType.SelectedValue;
            }
            string sql = "insert into ProductType (TypeName,ParentId) values('" + textbox_addtype.Text + "'," + pid+ ") ";
            int rows = DBHelper.ExecuteNonQuery(sql);
            if(rows>0)
            {
                if(rows==1)
                {
                    AddType.Visible = false;
                    ListType.Visible = true;
                    ListView1.DataSourceID = "TypeListSortSource1";
                    ListView1.DataBind();
                    textbox_addtype.Text = "";
                    DropDownList_AddType.SelectedValue = "0";
                    ScriptManager.RegisterStartupScript(AddType, this.GetType(), "warning", "alert('添加成功！')", true);
                    return;
                }
                ScriptManager.RegisterStartupScript(AddType, this.GetType(), "warning", "alert('添加失败！')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(AddType, this.GetType(), "warning", "alert('添加失败！')", true);
            }
        }

        protected void DropDownList_TypeList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DropDownList_TypeList.SelectedValue=="1")
            {
                ListView1.DataSourceID = "TypeListSortSource1";
            }
            else if(DropDownList_TypeList.SelectedValue=="2")
            {
                ListView1.DataSourceID = "TypeListSortSource2";
            }
            else if(DropDownList_TypeList.SelectedValue=="3")
            {
                ListView1.DataSourceID = "TypeListSortSource3";
            }
        }

        protected void ListView1_ItemCreated(object sender, ListViewItemEventArgs e)
        {
            if(e.Item.ItemType==ListViewItemType.DataItem)
            {
                DropDownList TypeNameEdit = (DropDownList)e.Item.FindControl("TypeNameEdit");
                if(TypeNameEdit!=null)
                {
                    ListViewDataItem lvDataItem = (ListViewDataItem)e.Item;
                    DataRowView rowView = (DataRowView)lvDataItem.DataItem;
                    if(rowView!=null)
                    {
                        var userRow = (B2CPrint.DAL.ProductType.ProductTypeRow)rowView.Row;
                        DataSet ds = DBHelper.DataSet("select id from dbo.ProductType where id=(SELECT parentid FROM dbo.ProductType where id=" + userRow.Id.ToString() + ")");
                        if (ds.Tables[0].Rows.Count==0)
                        {
                            TypeNameEdit.SelectedValue = "0";
                        }
                        else
                        {
                            TypeNameEdit.SelectedValue = ds.Tables[0].Rows[0][0].ToString();
                        }
                        
                    }
                    
                }
                
            }
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            DropDownList TypeNameEdit = (DropDownList)ListView1.Items[e.ItemIndex].FindControl("TypeNameEdit");
            //e.NewValues["Expr1"] = TypeNameEdit.SelectedValue;
            if (TypeNameEdit.SelectedValue == "0")
            {
                e.NewValues["ParentId"] = null;
            }
            else
            {
                e.NewValues["ParentId"] = TypeNameEdit.SelectedValue;
            }
            
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            sort_count = ListView1.Items.Count;
            flag_del = 1;

        }

        protected void ListView1_DataBound(object sender, EventArgs e)
        {
            if (ListView1.Items.Count==sort_count&&flag_del==1)
            {
                ScriptManager.RegisterStartupScript(ListView1, this.GetType(), "warning", "alert('请先删除其子项！')", true);
            }
            else if(ListView1.Items.Count!=sort_count&&flag_del==1)
            {
                ScriptManager.RegisterStartupScript(ListView1, this.GetType(), "warning", "alert('删除成功！')", true);
            }
        }

        

    }
}