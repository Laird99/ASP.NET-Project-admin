<%@ Page Title="" Language="C#" MasterPageFile="~/Project.master" AutoEventWireup="true" CodeFile="Browse.aspx.cs" Inherits="Browse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LoginContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="search1"style="width:750px; margin-top:50px;">
        <h2> All CD Albums </h2>
        <p class="info"> If you just want to view all the CDs available, click below! </p>
        <asp:LinkButton class="LinkButtons" ID="ViewButton" runat="server" OnClick="ViewButton_Click">View All ></asp:LinkButton>
    </div>

    <div id="search2" style="margin-left: 800px; margin-top:-227px;">
        <h2> Specific Album on your Mind?</h2>
        <p class="info"> If you have a specific title in mind, use the search function to find it</p>
        <asp:LinkButton class="LinkButtons" ID="SearchButton" runat="server" OnClick="SearchButton_Click">Go Search ></asp:LinkButton>
    </div>

    <br /> <br /> <br />

    <div id="viewall"> 
        <asp:GridView ID="CDview" runat="server" CellPadding="4" ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center" Width="1250px" Font-Size="20px" PageSize="25" ToolTip="CD List" Visible="False" AutoGenerateColumns="False" DataKeyNames="DiskID" DataSourceID="AllLDS" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">

            <Columns>
                <asp:BoundField DataField="AlbumName" HeaderText="Album Name" SortExpression="AlbumName"></asp:BoundField>
                <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist"></asp:BoundField>
                <asp:BoundField DataField="TrackCount" HeaderText="Track Count" SortExpression="TrackCount"></asp:BoundField>
                <asp:BoundField DataField="RecordLabel" HeaderText="Record Label" SortExpression="RecordLabel"></asp:BoundField>
                <asp:BoundField DataField="ReleaseDate" HeaderText="Release Date" SortExpression="ReleaseDate" DataFormatString="{0:y}"></asp:BoundField>
            </Columns>

            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle"></EditRowStyle>

            <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Font-Size="20px" Height="10px" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>

            <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>

            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>

        </asp:GridView>
        <asp:LinqDataSource runat="server" EntityTypeName="" ID="AllLDS" ContextTypeName="CDListDataContext" TableName="CDs"></asp:LinqDataSource>
    </div>

    <div id="search" runat="server" visible="false">
        <h2> Enter the Search Criteria </h2>

        <asp:Label ID="CDLabel" runat="server" Text="Album Name: "></asp:Label><asp:TextBox ID="AlbumName" runat="server"></asp:TextBox>
        <asp:Label ID="ArtistLabel" runat="server" Text="Artist: "></asp:Label><asp:TextBox ID="ArtistName" runat="server"></asp:TextBox>
        <asp:Button ID="SearchParam" runat="server" Text="Search >" OnClick="LoadView" /> <br /> <br /> 

        <asp:GridView ID="SingleRecord" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" Width="1250px" Font-Size="20px" DataSourceID="AlbumArtistLDS" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" DataKeyNames="DiskID">

            <AlternatingRowStyle BackColor="#F7F7F7"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="AlbumName" HeaderText="Album Name" SortExpression="AlbumName"></asp:BoundField>
                <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist"></asp:BoundField>
                <asp:BoundField DataField="TrackCount" HeaderText="Track Count" SortExpression="TrackCount"></asp:BoundField>
                <asp:BoundField DataField="RecordLabel" HeaderText="Record Label" SortExpression="RecordLabel"></asp:BoundField>
                <asp:BoundField DataField="ReleaseDate" HeaderText="Release Date" SortExpression="ReleaseDate" DataFormatString="{0:y}"></asp:BoundField>
            </Columns>
            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle"></EditRowStyle>

            <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Font-Size="20px" Height="10px" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>

            <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>

            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
        </asp:GridView>
        <asp:LinqDataSource runat="server" EntityTypeName="" ID="AlbumArtistLDS" ContextTypeName="CDListDataContext" TableName="CDs" Where="AlbumName == @AlbumName && Artist == @Artist">
            <WhereParameters>
                <asp:ControlParameter ControlID="AlbumName" PropertyName="Text" Name="AlbumName" Type="String"></asp:ControlParameter>
                <asp:ControlParameter ControlID="ArtistName" PropertyName="Text" Name="Artist" Type="String"></asp:ControlParameter>
            </WhereParameters>
        </asp:LinqDataSource>

        <asp:GridView ID="AlbumView" runat="server" AutoGenerateColumns="False" Visible="false" HorizontalAlign="Center" Width="1250px" Font-Size="20px" DataSourceID="AlbumLDS" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">

            <Columns>
                <asp:BoundField DataField="AlbumName" HeaderText="Album Name" ReadOnly="True" SortExpression="AlbumName"></asp:BoundField>
                <asp:BoundField DataField="Artist" HeaderText="Artist" ReadOnly="True" SortExpression="Artist"></asp:BoundField>
                <asp:BoundField DataField="TrackCount" HeaderText="Track Count" ReadOnly="True" SortExpression="TrackCount"></asp:BoundField>
                <asp:BoundField DataField="RecordLabel" HeaderText="Record Label" ReadOnly="True" SortExpression="RecordLabel"></asp:BoundField>
                <asp:BoundField DataField="ReleaseDate" HeaderText="Release Date" ReadOnly="True" SortExpression="ReleaseDate" DataFormatString="{0:y}"></asp:BoundField>
            </Columns>
            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle"></EditRowStyle>

            <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Font-Size="20px" Height="10px" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>

            <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>

            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
        </asp:GridView>
        <asp:LinqDataSource runat="server" EntityTypeName="" ID="AlbumLDS" ContextTypeName="CDListDataContext" Select="new (AlbumName, Artist, TrackCount, RecordLabel, ReleaseDate)" TableName="CDs" Where="AlbumName == @AlbumName">
            <WhereParameters>
                <asp:ControlParameter ControlID="AlbumName" PropertyName="Text" Name="AlbumName" Type="String"></asp:ControlParameter>
            </WhereParameters>
        </asp:LinqDataSource>
    
        <asp:GridView ID="ArtistView" runat="server" AutoGenerateColumns="False" Visible="false" HorizontalAlign="Center" Width="1250px" Font-Size="20px" DataSourceID="ArtistLDS" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">

            <Columns>
                <asp:BoundField DataField="AlbumName" HeaderText="Album Name" ReadOnly="True" SortExpression="AlbumName"></asp:BoundField>
                <asp:BoundField DataField="Artist" HeaderText="Artist" ReadOnly="True" SortExpression="Artist"></asp:BoundField>
                <asp:BoundField DataField="RecordLabel" HeaderText="Record Label" ReadOnly="True" SortExpression="RecordLabel"></asp:BoundField>
                <asp:BoundField DataField="TrackCount" HeaderText="Track Count" ReadOnly="True" SortExpression="TrackCount"></asp:BoundField>
                <asp:BoundField DataField="ReleaseDate" HeaderText="Release Date" ReadOnly="True" SortExpression="ReleaseDate" DataFormatString="{0:y}"></asp:BoundField>
            </Columns>
            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle"></EditRowStyle>

            <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Font-Size="20px" Height="10px" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>

            <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>

            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
        </asp:GridView>
        <asp:LinqDataSource runat="server" EntityTypeName="" ID="ArtistLDS" ContextTypeName="CDListDataContext" Select="new (AlbumName, Artist, RecordLabel, TrackCount, ReleaseDate)" TableName="CDs" Where="Artist == @Artist">
            <WhereParameters>
                <asp:ControlParameter ControlID="ArtistName" PropertyName="Text" Name="Artist" Type="String"></asp:ControlParameter>
            </WhereParameters>
        </asp:LinqDataSource>

    </div>
    
</asp:Content>

