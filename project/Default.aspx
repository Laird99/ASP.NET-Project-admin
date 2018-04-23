<%@ Page Title="" Language="C#" MasterPageFile="~/Project.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:Panel ID="AuthenticatedMessagePanel" runat="server">
        <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <asp:Label ID="WelcomeMessage" runat="server"  Font-Size="24px" Font-Italic="True" Font-Names="Segoe UI" ></asp:Label>
        </div>
    </asp:Panel>

    <asp:Panel ID="AnonMessagePanel" runat="server">
        <p> Welcome!</p>
    </asp:Panel>
        <p>Feel free to browse through our collection of CDs</p>
    
</asp:Content>

