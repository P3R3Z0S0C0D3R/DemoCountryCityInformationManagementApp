<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCitiesUI.aspx.cs" Inherits="CountryCityInformationManagementApp.UI.ViewCitiesUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="../Contents/Images/favicon.gif" />
    <title>View Cities</title>
    <link href="../Contents/css/style.css" rel="stylesheet" />
    <link href="../Contents/css/menu.css" rel="stylesheet" />
    <script src="../Contents/js/modernizr.custom.js"></script>
    <style>
        label.error {
            color: red;
            font-family: bookman old style;
            font-size: 20px;
            font-style: italic;
            font-weight: bold;
            margin-left: 5px;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="ViewCitiesForm" runat="server">
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
                        <a class="active" href="ViewCitiesUI.aspx">
                            <span>View Cities</span>
                        </a>
                    </li>
                    <li>
                        <a href="ViewCountriesUI.aspx">
                            <span>View Countries</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <fieldset>
             <legend>Search City</legend>
                 <table>
                     <tr>
                         <td class="column1"><asp:RadioButton ID="cityNameRadioButton" runat="server" Text="City Name" GroupName="cities" name="cities" /></td>
                         <td>
                                <asp:TextBox ID="cityNameTextBox" Height="25px" placeholder="Search With City Name" Width="150px" runat="server"></asp:TextBox>
                         </td>
                     </tr>
                     <tr>
                         <td class="column1"><asp:RadioButton ID="countryRadioButton" runat="server" Text="Country" GroupName="cities" name="cities" /></td>
                         <td>
                                <asp:DropDownList ID="countryDropDownList" runat="server" Height="30px" Width="156px"></asp:DropDownList>
                                <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td class="column1"></td>
                         <td><asp:Button CssClass="myButton" ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" /></td>
                     </tr>
                 </table>  
            </fieldset>
             
        
        <fieldset>
            <legend>City/Cities Details</legend>
            <asp:GridView ID="viewCityGridView" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" Width="100%" PageSize="5" AllowPaging="True" OnPageIndexChanging="OnPageIndexChanging" ShowHeaderWhenEmpty="True" EmptyDataText="No Record(s) Found In Our Database." CellSpacing="2" ForeColor="Black">
            <Columns>
                
                <asp:TemplateField HeaderText="SL#" >
               <ItemTemplate >
                  <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
                 </asp:TemplateField>
                <asp:TemplateField HeaderText="City Name">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Name") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="About">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("About") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="No. Of City Dwellers">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("NoOfCityDwellers") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Location") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Weather">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Weather") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Country") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="About Country">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("AboutCountry") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageText="First" LastPageText="Last" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Left" BorderStyle="None" BackColor="#CCCCCC" />
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
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('input[name="cities"]').on('click', function () {
                if ($(this).attr('id') == 'countryRadioButton') {
                    $('#cityNameTextBox').val('');
                }
                if ($(this).attr('id') == 'cityNameRadioButton') {
                    $("#countryDropDownList option:eq(0)").prop("selected", true);
                    $('#<%= messageLabel.ClientID %>').text("");
                }
            });
        });
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
