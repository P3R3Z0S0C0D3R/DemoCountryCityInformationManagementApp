<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CountryCityInformationManagementApp.UI.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="../Contents/Images/favicon.gif" />
    <title>Home Page</title>
    <link href="../Contents/css/style.css" rel="stylesheet" />
    <link href="../Contents/css/nivo-slider.css" rel="stylesheet" />
    <link href="../Contents/slidertheme/theme.css" rel="stylesheet" />
    <link href="../Contents/css/menu.css" rel="stylesheet" />
    <script src="../Contents/js/modernizr.custom.js"></script>
</head>
<body>
    <form id="HomeForm" runat="server">
        <div class="header">
            <nav id="menu" class="nav">					
                <ul>
                    <li>
                        <a class="active" href="Index.aspx">
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
                        <a href="ViewCountriesUI.aspx">
                            <span>View Countries</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <fieldset>
        <div class="homePageContent">
            <h1>Welcome To Country And City Information Management System</h1>
            <p>It's a demo app. You can add Countries and Cities as many as you want. You can also search Cities from database. Search with Country you find all information about the country such as number of Cities, total Population etc.</p>
        </div>
        </fieldset>
        
    </form>
    <div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
                <img src="../Contents/Images/slider-1.jpg" alt=""/>
                <img src="../Contents/Images/slider-2.jpg" alt=""/>
                <img src="../Contents/Images/slider-3.jpg" alt=""/>
                <img src="../Contents/Images/slider-4.jpg" alt=""/>
            </div>
    </div>
    <footer>
        <p>Copyright &copy; 2016 Code Craker's. All rights reserved.</p>
    </footer>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
    <script src="../Contents/js/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();

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
