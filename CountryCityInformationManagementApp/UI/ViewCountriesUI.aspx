<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCountriesUI.aspx.cs" Inherits="CountryCityInformationManagementApp.UI.ViewCountries" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="../Contents/Images/favicon.gif" />
    <title>View Countries</title>
    <link href="../Contents/css/style.css" rel="stylesheet" />
    <link href="../Contents/css/menu.css" rel="stylesheet" />
    <script src="../Contents/js/modernizr.custom.js"></script>
</head>
<body>
       <form id="ViewCountriesForm" runat="server">
           <div class="header">
                <nav id="menu" class="nav">					
                    <ul>
                        <li>
                            <a href="Index.aspx">
                                <span>Home</span>
                            </a>
                        </li>
                        <li>
                            <a href="CountryEntryUI.aspx">
                                <span>Country Entry</span>
                            </a>
                        </li>
                        <li>
                            <a href="CityEntryUI.aspx">
                                <span>City Entry</span>
                            </a>
                        </li>
                        <li>
                            <a href="ViewCitiesUI.aspx">
                                <span>View Cities</span>
                            </a>
                        </li>
                        <li>
                            <a class="active" href="ViewCountriesUI.aspx">
                                <span>View Countries</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <fieldset>
                 <legend>Search Country</legend>
                     <table>
                         <tr>
                             <td class="column1"><asp:Label Text="Name" runat="server"></asp:Label></td>
                             <td><asp:TextBox ID="searchTextBox" placeholder="Search With Country Name" runat="server" Height="25px" Width="350px"></asp:TextBox></td>
                         </tr>
                         <tr>
                             <td class="column1"></td>
                             <td><asp:Button CssClass="myButton" ID="searchButton" runat="server"  Text="Search" OnClick="searchButton_Click" /></td>
                         </tr>
                     </table>
            </fieldset>
            <fieldset>
                <legend>Country/Countries Details</legend>
                <asp:GridView ID="viewCountryGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" Width="100%" AllowPaging="True" PageSize="5" OnPageIndexChanging="OnPageIndexChanging" ShowHeaderWhenEmpty="True" EmptyDataText="No Record(s) Found In Our Database." BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" ForeColor="Black">
                <Columns>
                
                    <asp:TemplateField HeaderText="SL#" >
                   <ItemTemplate >
                      <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                     </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("Name") %>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="About">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("About") %>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No. Of Cities">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("NoOfCities") %>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No. Of Dwellers">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#Eval("NoOfDwellers") %>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                
                
                
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerSettings FirstPageText="First" LastPageText="Last" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            </fieldset>
    </form>
    <footer>
        <p>Copyright &copy; 2016 Code Craker's. All rights reserved.</p>
    </footer>
    <script>
        var changeClass = function (r, className1, className2) {
            var regex = new RegExp("(?:^|\\s+)" + className1 + "(?:\\s+|$)");
            if (regex.test(r.className)) {
                r.className = r.className.replace(regex, ' ' + className2 + ' ');
            }
            else {
                r.className = r.className.replace(new RegExp("(?:^|\\s+)" + className2 + "(?:\\s+|$)"), ' ' + className1 + ' ');
            }
            return r.className;
        };

        var menuElements = document.getElementById('menu');
        menuElements.insertAdjacentHTML('afterBegin', '<button type="button" id="menutoggle" class="navtoogle" aria-hidden="true">Menu</button>');

        document.getElementById('menutoggle').onclick = function () {
            changeClass(this, 'navtoogle active', 'navtoogle');
        }

        document.onclick = function (e) {
            var mobileButton = document.getElementById('menutoggle'),
                buttonStyle = mobileButton.currentStyle ? mobileButton.currentStyle.display : getComputedStyle(mobileButton, null).display;

            if (buttonStyle === 'block' && e.target !== mobileButton && new RegExp(' ' + 'active' + ' ').test(' ' + mobileButton.className + ' ')) {
                changeClass(mobileButton, 'navtoogle active', 'navtoogle');
            }
        }
    </script>
</body>
</html>
