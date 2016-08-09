<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CityEntryUI.aspx.cs" Inherits="CountryCityInformationManagementApp.UI.CityEntryUI" validateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="../Contents/Images/favicon.gif" />
    <title>City Entry</title>

    <link href="../Contents/css/style.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Contents/css/froala_style.min.css" rel="stylesheet" />
    <link href="../Contents/css/froala_editor.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/char_counter.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/code_view.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/colors.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/draggable.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/emoticons.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/file.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/fullscreen.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/image.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/image_manager.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/line_breaker.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/quick_insert.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/table.min.css" rel="stylesheet" />
    <link href="../Contents/css/plugins/video.min.css" rel="stylesheet" />
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
    <form id="CityEntryForm" runat="server">
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
                        <a class="active" href="CityEntryUI.aspx">
                            <span>City Entry</span>
                        </a>
                    </li>
                    <li>
                        <a href="ViewCitiesUI.aspx">
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
             <legend> City Entry</legend>
        <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
         <table>
             <tr>
                 <td  class="column1"><asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>
                 <td><asp:TextBox ID="nameTextBox" placeholder="Name Of The City" runat="server" Height="25px" Width="180px"></asp:TextBox></td>
             </tr>
               <tr>
                 <td  class="column1"><asp:Label ID="Label2" runat="server" Text="About"></asp:Label></td>
                 
                 <td><textarea id="aboutCityTextArea" runat="server"  ></textarea></td>
             </tr>
             <tr>
                 <td  class="column1"><asp:Label ID="Label3" runat="server" Text="No. of Dwellers"></asp:Label></td>
                 
                 <td><asp:TextBox ID="noOfDwellersTextBox" placeholder="Population Of The City" runat="server" Height="25px" Width="180px"></asp:TextBox></td>
             </tr>
             <tr>
                 <td  class="column1"><asp:Label ID="Label4" runat="server" Text="Location"></asp:Label></td>
                 
                 <td><asp:TextBox ID="locationTextBox" placeholder="Location Of The City" runat="server" Height="25px" Width="180px"></asp:TextBox></td>
             </tr>
             <tr>
                 <td  class="column1"><asp:Label ID="Label5" runat="server" Text="Weather"></asp:Label></td>
                 
                 <td><asp:TextBox ID="weatherTextBox" placeholder="Weather Of The City" runat="server" Height="25px" Width="180px"></asp:TextBox></td>
             </tr>
             <tr>
                 <td  class="column1"><asp:Label ID="Label6" runat="server" Text="Country"></asp:Label></td>
                 
                 <td><asp:DropDownList runat="server" ID="countryDropDownList" name="countryDropDownList" Height="30px" Width="186px"/></td>
             </tr>      
         </table>
        <table>
            <tr>
                 <td>
                     <asp:Label ID="Label7" Width="165px" runat="server" Text=""></asp:Label></td>
                 <td>
                     <asp:Button CssClass="myButton" ID="saveCityButton" runat="server" Text="Save" OnClick="saveCityButton_Click"/>
                 </td>
                 <td>
                     <asp:Button CssClass="myButton" ID="cancelCityButton" runat="server" Text="Cancel" OnClick="cancelCityButton_Click" />
                 </td>
             </tr>   
        </table>
         </fieldset>
        

         <fieldset>
             <legend>City List</legend>
       
                 
            <asp:GridView ID="cityGridView" runat="server" AutoGenerateColumns="False" PageSize="5" AllowPaging="True" OnPageIndexChanging="OnPageIndexChanging" CellPadding="4" Width="100%" ShowHeaderWhenEmpty="True" EmptyDataText="No Record(s) Found In Our Database." BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" ForeColor="Black">
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
                <asp:TemplateField HeaderText="No. Of City Dwellers">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("NoOfCityDwellers") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Country") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
            </Columns>
                          <FooterStyle BackColor="#CCCCCC" />
                          <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                          <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                          <RowStyle BackColor="White" />
                          <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                          <sortedascendingcellstyle backcolor="#F1F1F1" />
                          <sortedascendingheaderstyle backcolor="#808080" />
                          <sorteddescendingcellstyle backcolor="#CAC9C9" />
                          <sorteddescendingheaderstyle backcolor="#383838" />
        </asp:GridView>
                    
         </fieldset>
    </form>
    <footer>
        <p>Copyright &copy; 2016 Code Craker's. All rights reserved.</p>
    </footer>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.min.js"></script>
    <script src="../Contents/js/froala_editor.min.js"></script>
    <script src="../Contents/js/plugins/align.min.js"></script>
    <script src="../Contents/js/plugins/char_counter.min.js"></script>
    <script src="../Contents/js/plugins/code_beautifier.min.js"></script>
    <script src="../Contents/js/plugins/code_view.min.js"></script>
    <script src="../Contents/js/plugins/colors.min.js"></script>
    <script src="../Contents/js/plugins/draggable.min.js"></script>
    <script src="../Contents/js/plugins/emoticons.min.js"></script>
    <script src="../Contents/js/plugins/entities.min.js"></script>
    <script src="../Contents/js/plugins/file.min.js"></script>
    <script src="../Contents/js/plugins/font_family.min.js"></script>
    <script src="../Contents/js/plugins/font_size.min.js"></script>
    <script src="../Contents/js/plugins/forms.min.js"></script>
    <script src="../Contents/js/plugins/fullscreen.min.js"></script>
    <script src="../Contents/js/plugins/image.min.js"></script>
    <script src="../Contents/js/plugins/image_manager.min.js"></script>
    <script src="../Contents/js/plugins/inline_style.min.js"></script>
    <script src="../Contents/js/plugins/line_breaker.min.js"></script>
    <script src="../Contents/js/plugins/link.min.js"></script>
    <script src="../Contents/js/plugins/lists.min.js"></script>
    <script src="../Contents/js/plugins/paragraph_format.min.js"></script>
    <script src="../Contents/js/plugins/paragraph_style.min.js"></script>
    <script src="../Contents/js/plugins/quick_insert.min.js"></script>
    <script src="../Contents/js/plugins/quote.min.js"></script>
    <script src="../Contents/js/plugins/save.min.js"></script>
    <script src="../Contents/js/plugins/table.min.js"></script>
    <script src="../Contents/js/plugins/url.min.js"></script>
    <script src="../Contents/js/plugins/video.min.js"></script>
  <script>
      $.validator.addMethod('selectNone',
          function(value, element) {
              return this.optional(element) ||(value.indexOf("Select Country") == -1);
          }, "Please Select A Country.");

      $(function() {
          $('#aboutCityTextArea').froalaEditor({
              toolbarButtons: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', '|', 'color', 'emoticons', 'inlineStyle', 'paragraphStyle', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', '-', 'insertLink', 'insertImage', 'insertVideo', 'insertFile', 'insertTable', '|', 'quote', 'insertHR', 'undo', 'redo', 'clearFormatting', 'selectAll', 'html'],
              toolbarButtonsMD: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', '|', 'color', 'emoticons', 'inlineStyle', 'paragraphStyle', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', '-', 'insertLink', 'insertImage', 'insertVideo', 'insertFile', 'insertTable', '|', 'quote', 'insertHR', 'undo', 'redo', 'clearFormatting', 'selectAll', 'html'],
              toolbarButtonsSM: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', '|', 'color', 'emoticons', 'inlineStyle', 'paragraphStyle', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', '-', 'insertLink', 'insertImage', 'insertVideo', 'insertFile', 'insertTable', '|', 'quote', 'insertHR', 'undo', 'redo', 'clearFormatting', 'selectAll', 'html'],
              toolbarButtonsXS: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', '|', 'color', 'emoticons', 'inlineStyle', 'paragraphStyle', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', '-', 'insertLink', 'insertImage', 'insertVideo', 'insertFile', 'insertTable', '|', 'quote', 'insertHR', 'undo', 'redo', 'clearFormatting', 'selectAll', 'html'],
              height: 100
          });
          $('#messageLabel').delay(5000).fadeOut(1000);
          $('#saveCityButton').click(function () {
              $("#CityEntryForm").validate({
                  rules: {
                      nameTextBox: "required",
                      noOfDwellersTextBox: {
                          required: true,
                          digits: true
                      },
                      locationTextBox: "required",
                      weatherTextBox: "required",
                      '<%=countryDropDownList.ClientID %>': {
                          selectNone: true
                      }
                  },
                  messages: {
                      nameTextBox: "Provide City Name.",
                      noOfDwellersTextBox: {
                          required: "Provide No Of Dwellers.",
                          digits: "Digits Only."
                      },
                      locationTextBox: "Provide City Location.",
                      weatherTextBox: "Provide City Weather.",

                  }
              });
          });
          $('#cancelCityButton').click(function () {
              window.location.href = 'Index.aspx';
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
