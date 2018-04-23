<%@ Page Title="" Language="C#" MasterPageFile="~/Project.master" AutoEventWireup="true" CodeFile="AddRecord.aspx.cs" Inherits="Protected_AddRecord" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <Header> Create Record </Header> 
    <AjaxToolkit:MaskedEditExtender ID="TrackCheck" runat="server" Mask="99" MaskType="Number" TargetControlID="TrackCount" />
    <AjaxToolkit:MaskedEditExtender ID="DateCheck" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="DateEntry" />

    <asp:Label ID="AlbumLabel" runat="server" Text="Enter Album Name: " CssClass="add" Width="350px"></asp:Label><asp:TextBox ID="AlbumEntry" runat="server" CssClass="tb"></asp:TextBox><asp:RequiredFieldValidator ID="CDRequiredField" runat="server" ErrorMessage="Enter the Album Name" Display="Dynamic" ControlToValidate="AlbumEntry" ForeColor="Red"></asp:RequiredFieldValidator><br />
    <asp:Label ID="ArtistLabel" runat="server" Text="Enter Artist Name: " CssClass="add" Width="350px"></asp:Label><asp:TextBox ID="NameEntry" runat="server" CssClass="tb"></asp:TextBox><asp:RequiredFieldValidator ID="ArtistRequiredField" runat="server" ErrorMessage="Enter the Artist's Name" Display="Dynamic" ControlToValidate="NameEntry" ForeColor="Red"></asp:RequiredFieldValidator><br />
    <asp:Label ID="TrackLabel" runat="server" Text="Enter Number of Tracks: " CssClass="add" Width="350px"></asp:Label><asp:TextBox ID="TrackCount" runat="server" CssClass="tb"></asp:TextBox><ajaxToolkit:MaskedEditValidator ID="TrackMEV" runat="server" ControlExtender="TrackCheck" ControlToValidate="TrackCount" ValidateRequestMode="Inherit" Display="Dynamic" EmptyValueMessage="Integer Required" InvalidValueMessage="Enter an Ingeter value" IsValidEmpty="False" TooltipMessage="Enter Number of Tracks on Album" ForeColor="Red"> </ajaxToolkit:MaskedEditValidator><br />
    <asp:Label ID="RecordLabel" runat="server" Text="Enter Record Label: " CssClass="add" Width="350px"></asp:Label><asp:TextBox ID="LabelEntry" runat="server" CssClass="tb"></asp:TextBox><asp:RequiredFieldValidator ID="RecordRequiredField" runat="server" ErrorMessage="Enter the Record Label Company" Display="Dynamic" ControlToValidate="LabelEntry" ForeColor="Red"></asp:RequiredFieldValidator><br />
    <asp:Label ID="DateLabel" runat="server" Text="Enter Release Date: " CssClass="add" Width="350px"></asp:Label><asp:TextBox ID="DateEntry" runat="server" CssClass="tb"></asp:TextBox><ajaxToolkit:MaskedEditValidator ID="DateMEV" runat="server" ControlExtender="DateCheck" ControlToValidate="DateEntry" ValidateRequestMode="Inherit" Display="Dynamic" EmptyValueMessage="Valid date is required" InvalidValueMessage="Enter valid date" IsValidEmpty="False" TooltipMessage="Enter Release Date" ForeColor="Red"> </ajaxToolkit:MaskedEditValidator>
  <br /><br />
   <asp:Button ID="Create" runat="server" Text="Create Record" OnClick="Create_Click" CssClass="Create" />
   <asp:LinqDataSource ID="InsertLDS" runat="server" ContextTypeName="CDListDataContext" EnableInsert="True" EntityTypeName="" TableName="CDs"></asp:LinqDataSource>

    <p> To go back to modifying current entries click <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Protected/AdminArea.aspx">here</asp:HyperLink> </p> 
</asp:Content>

