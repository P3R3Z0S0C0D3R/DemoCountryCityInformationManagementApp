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
    public class CityGateway
    {   
        private  SqlConnection connection = new SqlConnection();

        private  string connectionstring =
            WebConfigurationManager.ConnectionStrings["ContryDbConnectionstring"].ConnectionString;
        public int Save(City city)
        {
            connection.ConnectionString = connectionstring;
            string query = "INSERT INTO City(Name,About,NoOfCityDwellers,Location,Weather,CountryId) VALUES(@Name, @About,'" + city.NoOfCityDwellers + "', @Location, @Weather,'" + city.CountryId + "')";
            SqlCommand command = new SqlCommand(query, connection);


            command.Parameters.Clear();
            command.Parameters.Add("Name", SqlDbType.VarChar);
            command.Parameters["Name"].Value = city.Name;
            command.Parameters.Add("About", SqlDbType.VarChar);
            command.Parameters["About"].Value = city.About;
            command.Parameters.Add("Location", SqlDbType.VarChar);
            command.Parameters["Location"].Value = city.Location;
            command.Parameters.Add("Weather", SqlDbType.VarChar);
            command.Parameters["Weather"].Value = city.Weather;

            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        public bool IsCityExist(string name, int countryId)
        {
            string query;
            if (name.Contains("'"))
            {
                string[] nameParts = Regex.Split(name, "'");
                query = "SELECT * FROM City Where Name LIKE'" + nameParts[0] + "%[^0-9a-zA-Z ]%" + nameParts[1] + "' AND CountryId=" + countryId + "";
            }
            else
            {
                query = "SELECT * FROM City Where Name ='" + name + "' AND CountryId=" + countryId + "";
            }
            connection.ConnectionString = connectionstring;
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            bool isCityExist = false;
            if (reader.HasRows)
            {
                isCityExist = true;
            }
            connection.Close();
            return isCityExist;
        }

        public List<City> GetAllCityList()
        {
            connection.ConnectionString = connectionstring;
            string query = "SELECT ci.name,ci.noOfCityDwellers,co.name as Country FROM City ci LEFT OUTER JOIN Country co ON ci.countryId=co.id ORDER BY name ASC";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<City> cities = new List<City>();
            while (reader.Read())
            {
                City city = new City();
                city.Name = reader["Name"].ToString();
                city.NoOfCityDwellers = Convert.ToInt32(reader["NoOfCityDwellers"]);
                city.Country = reader["Country"].ToString();
                cities.Add(city);
            }
            reader.Close();
            connection.Close();
            return cities;
        }

        public List<City> GetAllCityCountryInformation()
        {
            connection.ConnectionString = connectionstring;
            string query = "SELECT ci.name as Name,ci.about as AboutCity,ci.noOfCityDwellers,ci.location as Location,ci.weather as Weather,co.name as Country,co.about as AboutCountry FROM City ci LEFT OUTER JOIN Country co ON ci.countryId=co.id ORDER BY ci.name ASC";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<City> cities = new List<City>();
            while (reader.Read())
            {
                City city = new City();
                city.Name = reader["Name"].ToString();
                city.About = WebUtility.HtmlDecode(reader["AboutCity"].ToString());
                city.NoOfCityDwellers = Convert.ToInt32(reader["NoOfCityDwellers"]);
                city.Location = reader["Location"].ToString();
                city.Weather = reader["Weather"].ToString();
                city.Country = reader["Country"].ToString();
                city.AboutCountry = WebUtility.HtmlDecode(reader["AboutCountry"].ToString());
                cities.Add(city);
            }
            reader.Close();
            connection.Close();
            return cities;
        }

        public List<City> GetsearchCityList(string search)
        {
            string query;
            if (search.Contains("'"))
            {
                string[] searchParts = Regex.Split(search, "'");
                query = "SELECT ci.name as Name,ci.about as AboutCity,ci.noOfCityDwellers,ci.location as Location,ci.weather as Weather,co.name as Country,co.about as AboutCountry FROM City ci LEFT OUTER JOIN Country co ON ci.countryId=co.id WHERE ci.name LIKE '%" + searchParts[0] + "%[^0-9a-zA-Z ]%" + searchParts[1] + "%' ORDER BY ci.name ASC";
            }
            else
            {
                query = "SELECT ci.name as Name,ci.about as AboutCity,ci.noOfCityDwellers,ci.location as Location,ci.weather as Weather,co.name as Country,co.about as AboutCountry FROM City ci LEFT OUTER JOIN Country co ON ci.countryId=co.id WHERE ci.name LIKE '%" + search + "%' ORDER BY ci.name ASC";
            }
            connection.ConnectionString = connectionstring;
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<City> cities = new List<City>();
            while (reader.Read())
            {
                City city = new City();
                city.Name = reader["Name"].ToString();
                city.About = WebUtility.HtmlDecode(reader["AboutCity"].ToString());
                city.NoOfCityDwellers = Convert.ToInt32(reader["NoOfCityDwellers"]);
                city.Location = reader["Location"].ToString();
                city.Weather = reader["Weather"].ToString();
                city.Country = reader["Country"].ToString();
                city.AboutCountry = WebUtility.HtmlDecode(reader["AboutCountry"].ToString());
                cities.Add(city);
            }
            reader.Close();
            connection.Close();
            return cities;
        }

        public List<City> GetsearchCountryList(int selectedcountryId)
        {
            connection.ConnectionString = connectionstring;
            string query = "SELECT ci.name as Name,ci.about as AboutCity,ci.noOfCityDwellers,ci.location as Location,ci.weather as Weather,co.name as Country,co.about as AboutCountry FROM City ci LEFT OUTER JOIN Country co ON ci.countryId=co.id WHERE ci.CountryId=" + selectedcountryId + " ORDER BY ci.name ASC";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<City> cities = new List<City>();
            while (reader.Read())
            {
                City city = new City();
                city.Name = reader["Name"].ToString();
                city.About = WebUtility.HtmlDecode(reader["AboutCity"].ToString());
                city.NoOfCityDwellers = int.Parse(reader["NoOfCityDwellers"].ToString());
                city.Location = reader["Location"].ToString();
                city.Weather = reader["Weather"].ToString();
                city.Country = reader["Country"].ToString();
                city.AboutCountry = WebUtility.HtmlDecode(reader["AboutCountry"].ToString());
                cities.Add(city);
            }
            reader.Close();
            connection.Close();
            return cities;
        }
    }
}