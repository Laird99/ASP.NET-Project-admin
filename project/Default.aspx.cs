using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.IsAuthenticated)
        {
            WelcomeMessage.Text = "Welcome to your homepage, " + User.Identity.Name + "!";

            AuthenticatedMessagePanel.Visible = true;
            AnonMessagePanel.Visible = false;
        }
        else
        {
            AuthenticatedMessagePanel.Visible = false;
            AnonMessagePanel.Visible = true;
        }
    }
}