<%@ Page Title="" Language="C#" MasterPageFile="~/Project.master" AutoEventWireup="true" CodeFile="AdminArea.aspx.cs" Inherits="Protected_AdminArea" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <!-- Style for the accordion menu-->
    <style type="text/css">
        .accordionHeader
        {
            color: black;
            background-color: #f1f1f1;
            font: "Trebuchet MS", Verdana;
            font-size: 20px;
            font-weight: bold;
            padding: 15px;
            margin-top: 15px;
            width: 85%;
            text-align:center;
        }
        .accordionHeader:hover
        {
            color: royalblue;
            background-color: white;
            font-family:"Trebuchet MS", Verdana;
            font-size: 22px;
            font-weight: bold;
            padding: 15px;
            width: 75%;

        }
        .accordionContent
        {
            background-color: white;
            font: Verdana, Arial;
            font-size: 16px;
            border-style: solid;
            border: 5px blue;               
            padding: 5px;
            padding-top: 10px;
            margin: 15px;
        }
        .Create {
            display: inline;
            height: 40px;
            line-height: 20px;
            background-color:forestgreen;
            padding: 10px;
            font-size: 16px;
            text-align: center;
            border-radius: 5px;
            color:black;
            font-weight: bold;
            width: 150px;
            margin-left: 650px;
            text-decoration: none;
        }
</style>
    <br />
    <p> Administrators can modify the CD collection. </p>
    <p> Click the desired activity's tag to display. </p>
    <ajaxToolkit:Accordion ID="MenuAccordion" runat="server">
        <Panes>

          <ajaxToolkit:AccordionPane ID="AddAP" runat="server" SelectedIndex="0" HeaderCssClass="accordionHeader" ContentCssClass="accordionContent" AutoSize="Limit" FadeTransitions="true">
              <Header> Add Record </Header>
              <Content>
                    <p> To go back to modifying current entries click <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Protected/AddRecord.aspx">here</asp:HyperLink> </p> 
                </Content> 
            </ajaxToolkit:AccordionPane> 

            <ajaxToolkit:AccordionPane ID="ModifyAP" runat="server" EnableViewState="false" SelectedIndex="0" HeaderCssClass="accordionHeader" ContentCssClass="accordionContent" AutoSize="Limit" FadeTransitions="true">
                <Header> Modify Records </Header>
                <Content>
                    <asp:GridView ID="ModifyDB" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" DataKeyNames="DiskID" DataSourceID="ModifyLDS" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="1250px">

                        <Columns>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="False" ShowSelectButton="False"></asp:CommandField>

                            <asp:TemplateField HeaderText="Album Name" SortExpression="AlbumName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="AlbumTB" runat="server" Text='<%# Bind("AlbumName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AlbumRFV" runat="server" ErrorMessage="You have to enter the CD title" ControlToValidate="AlbumTB" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="AlbumLabel" HorizontalAlign="Center" runat="server" Text='<%# Bind("AlbumName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Artist" SortExpression="Artist">
                                <EditItemTemplate>
                                    <asp:TextBox ID="ArtistTB" runat="server" Text='<%# Bind("Artist") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ArtistRFV" runat="server" ErrorMessage="You have to enter the Artist's name" ControlToValidate="ArtistTB" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="ArtistLabel" HorizontalAlign="Center" runat="server" Text='<%# Bind("Artist") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Track Count" SortExpression="TrackCount">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TrackTB" runat="server" Text='<%# Bind("TrackCount") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="TrackCV" runat="server" ErrorMessage="Track Count has to be an integer value" ControlToValidate="TrackTB" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="TrackLabel" HorizontalAlign="Center" runat="server" Text='<%# Bind("TrackCount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Record Label" SortExpression="RecordLabel">
                                <EditItemTemplate>
                                    <asp:TextBox ID="RecordingTB" runat="server" Text='<%# Bind("RecordLabel") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="RecordingLabel" HorizontalAlign="Center" runat="server" Text='<%# Bind("RecordLabel") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Release Date" SortExpression="ReleaseDate">
                                <EditItemTemplate>
                                    <asp:TextBox DataFormatString="{0:y}" ID="DateTB" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="LabelRFV" runat="server" ErrorMessage="You have to enter the release date" ControlToValidate="DateTB" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="DateEV" runat="server" ErrorMessage="Enter the Release Date in dd/mm/yyyy format and delete the time" ControlToValidate="DateTB" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" Display="Dynamic"></asp:RegularExpressionValidator><br />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="RecordingLabel" HorizontalAlign="Center" runat="server" Text='<%# Bind("ReleaseDate", "{0:y}") %>'></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>

                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                    <asp:LinqDataSource ID="ModifyLDS" runat="server" ContextTypeName="CDListDataContext" EnableUpdate="True" EntityTypeName="" TableName="CDs"></asp:LinqDataSource>
                </Content>
            </ajaxToolkit:AccordionPane>

            <ajaxToolkit:AccordionPane ID="DeleteAP" runat="server" EnableViewState="false" SelectedIndex="0" HeaderCssClass="accordionHeader" ContentCssClass="accordionContent" AutoSize="Limit" FadeTransitions="true">
                <Header> Delete Records </Header>
                <Content> 
                    <asp:GridView ID="DeleteRow" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" DataKeyNames="DiskID" DataSourceID="DeleteLDS" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="1250px">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                            <asp:BoundField DataField="AlbumName" HeaderText="Album Name" SortExpression="AlbumName"></asp:BoundField>
                            <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist"></asp:BoundField>
                            <asp:BoundField DataField="TrackCount" HeaderText="Track Count" SortExpression="TrackCount"></asp:BoundField>
                            <asp:BoundField DataField="RecordLabel" HeaderText="Record Label" SortExpression="RecordLabel" NullDisplayText="-"></asp:BoundField>
                            <asp:BoundField DataField="ReleaseDate" HeaderText="Release Date" SortExpression="ReleaseDate" NullDisplayText="-" DataFormatString="{0:y}"></asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>

                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                    <asp:LinqDataSource ID="DeleteLDS" runat="server" ContextTypeName="CDListDataContext" EnableDelete="True" EntityTypeName="" TableName="CDs"></asp:LinqDataSource>
                </Content>
        </ajaxToolkit:AccordionPane>
         
            <ajaxToolkit:AccordionPane ID="ViewAP" runat="server" EnableViewState="false" SelectedIndex="0" HeaderCssClass="accordionHeader" ContentCssClass="accordionContent" AutoSize="Limit" FadeTransitions="true">
                <Header> View Current Database </Header>
                <Content>
                    <asp:GridView ID="ViewAll" runat="server" AutoGenerateColumns="False" DataSourceID="ViewLDS" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center" Width="1250px">
                        <Columns>
                            <asp:BoundField DataField="AlbumName" HeaderText="AlbumName" SortExpression="AlbumName" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="TrackCount" HeaderText="TrackCount" SortExpression="TrackCount" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="RecordLabel" HeaderText="RecordLabel" SortExpression="RecordLabel" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" DataFormatString="{0:y}" ReadOnly="True"></asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>

                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                    <asp:LinqDataSource ID="ViewLDS" runat="server" ContextTypeName="CDListDataContext" EntityTypeName="" Select="new (AlbumName, Artist, TrackCount, RecordLabel, ReleaseDate)" TableName="CDs"></asp:LinqDataSource>
            </Content>
        </ajaxToolkit:AccordionPane>

        </Panes>
    </ajaxToolkit:Accordion>








</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LoginContent" Runat="Server">
</asp:Content>

