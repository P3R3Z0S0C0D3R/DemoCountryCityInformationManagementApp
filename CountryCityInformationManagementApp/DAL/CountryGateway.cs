using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Text.RegularExpressions;
using System.Web.Configuration;
using CountryCityInformationManagementApp.Models;

namespace CountryCityInformationManagementApp.DAL
{
    public class CountryGateway
    {
        private SqlConnection connection = new SqlConnection();

        private string connectionstring = WebConfigurationManager.ConnectionStrings["ContryDbConnectionstring"].ConnectionString;
        public int Save(Country country)
        {
            connection.ConnectionString = connectionstring;
            string query = "INSERT INTO Country VALUES(@Name, @About)";
            SqlCommand command = new SqlCommand(query, connection);


            command.Parameters.Clear();
            command.Parameters.Add("Name", SqlDbType.VarChar);
            command.Parameters["Name"].Value = country.Name;
            command.Parameters.Add("About", SqlDbType.VarChar);
            command.Parameters["About"].Value = country.About;

            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        public bool IsCountryExist(string name)
        {
            string query;
            if (name.Contains("'"))
            {
                string[] nameParts = Regex.Split(name, "'");
                query = "SELECT * FROM Country Where Name LIKE'" + nameParts[0] + "%[^0-9a-zA-Z ]%" + nameParts[1] + "'";
            }
            else
            {
                query = "SELECT * FROM Country Where Name ='" + name + "'";
            }
            connection.ConnectionString = connectionstring;
            
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            bool IsCountryExist = false;
            if (reader.HasRows)
            {
                IsCountryExist = true;
            }
            connection.Close();
            return IsCountryExist;
        }

        public List<Country> GetAllCountryList()
        {
            connection.ConnectionString = connectionstring;
            string query = "Select * from Country ORDER BY name ASC";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Country> countries = new List<Country>();
            while (reader.Read())
            {
                Country country = new Country();
                country.Name = reader["Name"].ToString();
                country.About = WebUtility.HtmlDecode(reader["About"].ToString());
                countries.Add(country);
            }
            reader.Close();
            connection.Close();
            return countries;
        }

        

        public List<Country> GetAllCountryName()
        {
            connection.ConnectionString = connectionstring;
            string query = "Select Id,Name from Country";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Country> countries = new List<Country>();
            while (reader.Read())
            {
                Country country = new Country();
                country.Id = (int)reader["Id"];
                country.Name = reader["Name"].ToString();
                countries.Add(country);
            }
            reader.Close();
            connection.Close();
            return countries;
        }

        public List<Country> GetAllCountryInformation()
        {

            connection.ConnectionString = connectionstring;
            string query = "SELECT co.name,co.about as about,COUNT(ci.name) as NoOfCities,SUM(ci.noOfCityDwellers) as NoOfDwellers FROM Country co LEFT OUTER JOIN City ci ON ci.countryId=co.id GROUP BY co.name,co.about ORDER BY co.name ASC";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Country> countries = new List<Country>();
            while (reader.Read())
            {
                Country country = new Country();
                country.Name = reader["Name"].ToString();
                country.About = WebUtility.HtmlDecode(reader["About"].ToString());
                country.NoOfCities = int.Parse(reader["NoOfCities"].ToString());
                country.NoOfDwellers = (reader["NoOfDwellers"].ToString() == ""? (int?)null: int.Parse(reader["NoOfDwellers"].ToString())) ?? 0;
                countries.Add(country);
            }
            reader.Close();
            connection.Close();
            return countries;

        }

        public List<Country> GetsearchCountryInformation(string search)
        {
            string query;
            if (search.Contains("'"))
            {
                string[] searchParts = Regex.Split(search, "'");
                query = "SELECT co.name,co.about as about,COUNT(ci.name) as NoOfCities,SUM(ci.noOfCityDwellers) as NoOfDwellers FROM Country co LEFT OUTER JOIN City ci ON ci.countryId=co.id WHERE co.name LIKE '%" + searchParts[0] + "%[^0-9a-zA-Z ]%" + searchParts[1] + "%' GROUP BY co.name,co.about ORDER BY co.name ASC";
            }
            else
            {
                query = "SELECT co.name,co.about as about,COUNT(ci.name) as NoOfCities,SUM(ci.noOfCityDwellers) as NoOfDwellers FROM Country co LEFT OUTER JOIN City ci ON ci.countryId=co.id WHERE co.name LIKE '%" + search + "%' GROUP BY co.name,co.about ORDER BY co.name ASC";
            }
            connection.ConnectionString = connectionstring;
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Country> countries = new List<Country>();
            while (reader.Read())
            {
                Country country = new Country();
                country.Name = reader["Name"].ToString();
                country.About = WebUtility.HtmlDecode(reader["About"].ToString());
                country.NoOfCities = int.Parse(reader["NoOfCities"].ToString());
                country.NoOfDwellers = (reader["NoOfDwellers"].ToString() == ""? (int?)null: int.Parse(reader["NoOfDwellers"].ToString())) ?? 0;
                countries.Add(country);
            }
            reader.Close();
            connection.Close();
            return countries;
        }
    }
}