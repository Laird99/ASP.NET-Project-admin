using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Browse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ViewButton_Click(object sender, EventArgs e)
    {
        CDview.Visible = true;
        search.Visible = false;
    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {
        search.Visible = true;
        CDview.Visible = false;
    }


    protected void LoadView(object sender, EventArgs e)
    {
        if (ArtistName.Text != "" && AlbumName.Text != "")
        {
            SingleRecord.Visible = true;
            ArtistView.Visible = false;
            AlbumView.Visible = false;

        }
        else if (ArtistName.Text != "")
        {
            ArtistView.Visible = true;
            SingleRecord.Visible = false;
            AlbumView.Visible = false;
        }
        else if (AlbumName.Text != "")
        {
            AlbumView.Visible = true;
            SingleRecord.Visible = false;
            ArtistView.Visible = false;
        }
        else { }
    }
}