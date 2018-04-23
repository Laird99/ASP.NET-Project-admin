<%@ Page Title="" Language="C#" MasterPageFile="~/Project.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   <div style="text-align: center;">
   <div style="width:653px; margin-left: auto; margin-right:auto;"> 

    <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="420px" RememberMeSet="True" Width="653px" DestinationPageUrl="~/Protected/AdminArea.aspx" MembershipProvider="TestAspNetSqlMembershipProvider" CheckBoxStyle-HorizontalAlign="Left">
<CheckBoxStyle HorizontalAlign="Left"></CheckBoxStyle>

        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <LayoutTemplate>
            <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td style="width: 648px">
                        <table cellpadding="0" style="height:391px; width:676px;">
                            <tr>
                                <td align="center" colspan="2" style="margin: 0px; color:White;background-color:#0066FF; font-size:xx-large; font-weight:bold; height: 65px; font-family: 'Courier New', Courier, monospace; vertical-align: middle; text-align: center; background-repeat: no-repeat; background-attachment: scroll; padding-top: 0px; position: relative; width: 700px; cursor: auto; top: 0px;">Log In</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 207px; height: 87px">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Font-Size="15pt">User Name:</asp:Label>
                                </td>
                                <td style="width: 289px; height: 87px">
                                    <asp:TextBox ID="UserName" runat="server" Font-Size="Medium" Height="21px" Width="242px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1" Display="Dynamic" ForeColor="#CC0000" Text="Enter username">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 207px; height: 70px">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Font-Size="15pt">Password:</asp:Label>
                                </td>
                                <td style="width: 289px; height: 70px">
                                    <asp:TextBox ID="Password" runat="server" Font-Size="Medium" Height="22px" TextMode="Password" Width="238px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1" Display="Dynamic" Text=" * Enter password" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 47px">
                                    <asp:CheckBox ID="RememberMe" runat="server" Checked="True" Font-Size="Medium" Text="Remember me next time." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red; height: 55px;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana" Font-Size="Large" ForeColor="#284E98" Height="54px" Text="Log In" ValidationGroup="Login1" Width="104px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
        <TextBoxStyle Font-Size="0.8em" />
        <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
</asp:Login>

</div>
</div>
    <asp:Label ID="InvalidCredentialsMessage" runat="server" Text="Username/Password Invalid" ForeColor="#CC0000" Visible="False"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="LoginContent">
    <asp:LoginView ID="LoginView1" runat="server">
         <LoggedInTemplate>
            <asp:LoginName ID="LoginName1" runat="server" />.
         </LoggedInTemplate>

    </asp:LoginView>
    <br /> <br /> 
</asp:Content>

