using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using CountryCityInformationManagementApp.BLL;
using CountryCityInformationManagementApp.Models;

namespace CountryCityInformationManagementApp.UI
{
    public partial class ViewCountries : System.Web.UI.Page
    {   
        CountryManager countryManager=new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            ViewCountryInformation();
        }

        private void ViewCountryInformation()
        {
            if (searchTextBox.Text.Length > 0)
            {
                viewCountryGridView.DataSource = countryManager.GetsearchCountryInformation(searchTextBox.Text);
                viewCountryGridView.DataBind();
            }
            if (searchTextBox.Text.Length == 0)
            {
                List<Country> countries = new List<Country>();
                countries = countryManager.GetAllCountryInformation();
                viewCountryGridView.DataSource = countries;
                viewCountryGridView.DataBind();
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            viewCountryGridView.PageIndex = 0;
            ViewCountryInformation();
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            viewCountryGridView.PageIndex = e.NewPageIndex;
            ViewCountryInformation();
        }
    }
}