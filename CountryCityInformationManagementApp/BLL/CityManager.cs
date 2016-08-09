using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CountryCityInformationManagementApp.DAL;
using CountryCityInformationManagementApp.Models;

namespace CountryCityInformationManagementApp.BLL
{
    public class CityManager
    {   
        CityGateway cityGateway=new CityGateway();
        public string Save(City city)
        {
            if (city.Name.Length >= 2)
            {
                if (!cityGateway.IsCityExist(city.Name, city.CountryId))
                {
                    if (cityGateway.Save(city) > 0)
                    {
                        return "City Save Successfully";
                    }
                    else
                    {
                        return "City Save Failed";
                    }
                }
                else
                {
                    return "This City Already Exists!";
                }
            }
            else
            {
                return "Invalid City Name!";
            }
        }

        public List<City> GetAllCityList()
        {
            return cityGateway.GetAllCityList();
        }

        public List<City> GetAllCityCountryInformation()
        {
            return cityGateway.GetAllCityCountryInformation();
        }

        public List<City> GetsearchCityList(string search)
        {
            return cityGateway.GetsearchCityList(search);
        }

        public List<City> GetsearchCountryList(int selectedcountryId)
        {
            return cityGateway.GetsearchCountryList(selectedcountryId);
        }
    }
}