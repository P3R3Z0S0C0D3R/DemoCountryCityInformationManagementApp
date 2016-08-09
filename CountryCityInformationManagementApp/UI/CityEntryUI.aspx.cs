using System;
using System.Collections.Generic;
using System.Drawing;
using System.Net;
using System.Web.UI.WebControls;
using CountryCityInformationManagementApp.BLL;
using CountryCityInformationManagementApp.Models;

namespace CountryCityInformationManagementApp.UI
{
    public partial class CityEntryUI : System.Web.UI.Page
    {
        CityManager cityManager=new CityManager();
        CountryManager countryManager=new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {   
                LoadAllCountryName();          
            }
            CityListGridView(); 
        }

        private void LoadAllCountryName()
        {
            List<Country> countries = countryManager.GetAllCountryName();

            if (countries == null)
            {
                countries = new List<Country>();
            }
            countryDropDownList.DataSource = countries;
            countryDropDownList.DataTextField = "Name";
            countryDropDownList.DataValueField = "Id";
            countryDropDownList.DataBind();
            countryDropDownList.Items.Insert(0,"Select Country");
        }

        private void CityListGridView()
        {
            List<City> cities = new List<City>();
            cities = cityManager.GetAllCityList();
            cityGridView.DataSource = cities;
            cityGridView.DataBind();
        }

        protected void saveCityButton_Click(object sender, EventArgs e)
        {
            int selectedcountryId;
            int.TryParse(countryDropDownList.SelectedValue, out selectedcountryId);

            if (selectedcountryId == 0)
            {
                messageLabel.Text = "Please select Country!";
                messageLabel.ForeColor = Color.Red;
                return;
            }
            City city = new City();
            city.Name = nameTextBox.Text;
            if (aboutCityTextArea.Value.Length <= 10)
            {
                messageLabel.Text = "Please Provide More Details Of The Country.";
                messageLabel.ForeColor = Color.Red;
                return;
            }
            else
            {
                city.About = WebUtility.HtmlEncode(aboutCityTextArea.Value);
            }
            int noOfCItyDwellers;
            int.TryParse(noOfDwellersTextBox.Text, out noOfCItyDwellers);
            city.NoOfCityDwellers = noOfCItyDwellers;
            city.Location = locationTextBox.Text;
            city.Weather = weatherTextBox.Text;
            city.CountryId = selectedcountryId;

            messageLabel.Text = cityManager.Save(city);
            if (messageLabel.Text == "City Save Failed" || messageLabel.Text == "This City Already Exists!" || messageLabel.Text == "Invalid City Name!")
            {
                messageLabel.ForeColor = Color.Red;
            }
            else
            {
                messageLabel.ForeColor = Color.Green;
            }
            cityGridView.PageIndex = 0;
            CityListGridView();
            ClearInput();
        }

        private void ClearInput()
        {
            nameTextBox.Text=string.Empty;
            aboutCityTextArea.Value = string.Empty;
            noOfDwellersTextBox.Text = string.Empty;
            locationTextBox.Text = string.Empty;
            weatherTextBox.Text = string.Empty;
            countryDropDownList.SelectedIndex = 0;
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            messageLabel.Text = string.Empty;
            cityGridView.PageIndex = e.NewPageIndex;
            cityGridView.DataBind();
        }

        protected void cancelCityButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}