using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Protected_AddRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Create_Click(object sender, EventArgs e)
    {
        string cd = AlbumEntry.Text;
        string artist = NameEntry.Text;
        int songs = Convert.ToInt32(TrackCount.Text);
        string label = LabelEntry.Text;
        DateTime release = Convert.ToDateTime(DateEntry.Text);

        // creates a new listdictionary and initilise it
        ListDictionary insert = new ListDictionary
        {
            { "AlbumName", cd },
            { "Artist", artist },
            { "TrackCount", songs },
            { "RecordLabel", label },
            { "ReleaseDate", release }
        };

        InsertLDS.Insert(insert); // add it to db

        // clearing textboxes
        AlbumEntry.Text = String.Empty;
        NameEntry.Text = String.Empty;
        TrackCount.Text = String.Empty;
        LabelEntry.Text = String.Empty;
        DateEntry.Text = String.Empty;

    }
}