using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace BookStoreEvent
{
    public partial class BookInventry : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BookRecord"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["pp"] !=null)
            {
                if (!IsPostBack)
                {
                    Edit();
                }

            }
            
        }
        public void Clear()
        {
            title.Text = "";
            author.Text = "";
            date.Text = "";
            price.Text = "";
            Submit.Text = "Save";
        }
        public void Edit()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ProcBookEdit", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", Request.QueryString["pp"]);
            SqlDataAdapter dd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dd.Fill(dt);
            con.Close();

            title.Text = dt.Rows[0][1].ToString();
            author.Text = dt.Rows[0][2].ToString();
            if (DateTime.TryParse(dt.Rows[0]["PublishDate"].ToString(), out DateTime publishDate))
            {
                date.Text = publishDate.ToString("yyyy-MM-dd");
            }
            else
            {
                // Handle the case where the date cannot be parsed
                date.Text = string.Empty;
            }

            price.Text = dt.Rows[0][4].ToString();
            Submit.Text = "Update";

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (Submit.Text == "Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ProcBookAdd", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Title", title.Text);
                cmd.Parameters.AddWithValue("@Author", author.Text);
                cmd.Parameters.AddWithValue("@PublishDate", date.Text);
                cmd.Parameters.AddWithValue("@price", price.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                Clear();

            }
            else if (Submit.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ProcBookUpdate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Title", title.Text);
                cmd.Parameters.AddWithValue("@Author", author.Text);
                cmd.Parameters.AddWithValue("@PublishDate", date.Text);
                cmd.Parameters.AddWithValue("@price", price.Text);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["pp"]);
                cmd.ExecuteNonQuery();
                con.Close();
                Clear();
            }
            Response.Redirect("BookInventryRecord");
        }

    }

}