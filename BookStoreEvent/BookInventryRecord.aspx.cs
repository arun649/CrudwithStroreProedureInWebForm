using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace BookStoreEvent
{
    public partial class BookInventryRecord : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BookRecord"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowData();
            }
        }
        public void ShowData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ProcAllRecord", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter dd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dd.Fill(dt);
            gridview.DataSource = dt;
            gridview.DataBind();
            con.Close();
        }

        protected void gridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Dele")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ProcDeleteRecord", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                ShowData();
            }
            else if (e.CommandName == "edt")
            {

                Response.Redirect("BookInventry.aspx?pp=" + e.CommandArgument);

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string searchTitle = txtSearch.Text.Trim();
                string searchAuthor = txtSearch.Text.Trim();
                DataTable dt = GetBooksByTitleAndAuthor(searchTitle, searchAuthor);

                if (dt.Rows.Count > 0)
                {
                    gridview.DataSource = dt;
                    gridview.DataBind();
                }
                else
                {
                    // Optionally, display a message indicating that no records were found.
                    // For example: lblMessage.Text = "No records found.";
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error: {ex.Message}");
                // Optionally, log the error or display an error message to the user.
            }
        }
        private DataTable GetBooksByTitleAndAuthor(string title, string author)
        {
            DataTable dt = new DataTable();

            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BookRecord"].ConnectionString))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("ProcSearchBooksByTitleAndAuthor", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Author", author);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error: {ex.Message}");
                // Optionally, log the error or display an error message to the user.
            }

            return dt;
        }
    }
}