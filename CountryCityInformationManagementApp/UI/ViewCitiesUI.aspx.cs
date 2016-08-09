using System;
using System.Collections.Generic;
using System.Drawing;
using System.Web.UI.WebControls;
using CountryCityInformationManagementApp.BLL;
using CountryCityInformationManagementApp.Models;

namespace CountryCityInformationManagementApp.UI
{
    public partial class ViewCitiesUI : System.Web.UI.Page
    {   
        CityManager cityManager=new CityManager();
        CountryManager countryManager=new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllCountryName();
                LoadAllCityInformation();
            }
            messageLabel.Text = String.Empty;
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
            countryDropDownList.Items.Insert(0, "Select Country");
        }

        private void LoadAllCityInformation()
        {
            if (cityNameRadioButton.Checked)
            {
                viewCityGridView.DataSource = cityManager.GetsearchCityList(cityNameTextBox.Text);
                viewCityGridView.DataBind();
            }
            if (countryRadioButton.Checked)
            {
                int selectedcountryId;
                int.TryParse(countryDropDownList.SelectedValue, out selectedcountryId);
                if (selectedcountryId == 0)
                {
                    messageLabel.Text = "Please Select A Country To Complete The Search.";
                    messageLabel.ForeColor = Color.Red;
                    return;
                }
                viewCityGridView.DataSource = cityManager.GetsearchCountryList(selectedcountryId);
                viewCityGridView.DataBind();
            }
            if (!cityNameRadioButton.Checked && !countryRadioButton.Checked)
            {
                List<City> cities = new List<City>();
                cities = cityManager.GetAllCityCountryInformation();
                viewCityGridView.DataSource = cities;
                viewCityGridView.DataBind();
            }
        }
        protected void searchButton_Click(object sender, EventArgs e)
        {
            viewCityGridView.PageIndex = 0;
            LoadAllCityInformation();
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            messageLabel.Text =String.Empty;
            viewCityGridView.PageIndex = e.NewPageIndex;
            LoadAllCityInformation();
        }
    }
}