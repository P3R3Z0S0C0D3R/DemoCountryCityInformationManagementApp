using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Net;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using CountryCityInformationManagementApp.BLL;
using CountryCityInformationManagementApp.Models;

namespace CountryCityInformationManagementApp.UI
{
    public partial class CountryEntryUI : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            CountryGridView();
        }

        private void CountryGridView()
        {
            List<Country> countries = new List<Country>();
            countries = countryManager.GetAllCountryList();
            countryGridView.DataSource = countries;
            countryGridView.DataBind();
        }

        protected void saveButton_OnClick(object sender, EventArgs e)
        {
            Country country = new Country();
            country.Name = nameTextBox.Text;
            if (aboutCountryTextArea.Value.Length <= 10)
            {
                messageLabel.Text = "Please Provide More Details Of The Country.";
                messageLabel.ForeColor = Color.Red;
                return;
            }
            else
            {
                country.About = WebUtility.HtmlEncode(aboutCountryTextArea.Value);
            }
            messageLabel.Text=countryManager.Save(country);
            if (messageLabel.Text == "Country Save Failed" || messageLabel.Text == "This Country Already Exists!" || messageLabel.Text == "Invalid Country Name!")
            {
                messageLabel.ForeColor=Color.Red;
            }
            else
            {
                messageLabel.ForeColor = Color.Green;
            }
            CountryGridView();
            ClearInput();
        }

        private void ClearInput()
        {
            nameTextBox.Text = string.Empty;
            aboutCountryTextArea.Value = string.Empty;
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            messageLabel.Text = string.Empty;
            countryGridView.PageIndex = e.NewPageIndex;
            countryGridView.DataBind();
        }
        protected void cancelButton_OnClick(object sender, EventArgs e)
        {
            ClearInput();
            Response.Redirect("Index.aspx");
        }
    }
}