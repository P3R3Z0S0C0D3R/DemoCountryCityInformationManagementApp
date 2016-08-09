using System.Collections.Generic;
using CountryCityInformationManagementApp.DAL;

using CountryCityInformationManagementApp.Models;

namespace CountryCityInformationManagementApp.BLL
{
    public class CountryManager
    {   
        CountryGateway countryGateway=new CountryGateway();
        public string Save(Country country)
        {
            if (country.Name.Length >= 2)
            {
                if (!countryGateway.IsCountryExist(country.Name))
                {
                    if (countryGateway.Save(country) > 0)
                    {
                        return "Country Save Successfully";
                    }
                    else
                    {
                        return "Country Save Failed";
                    }
                }
                else
                {
                    return "This Country Already Exists!";
                }
            }
            else
            {
                return "Invalid Country Name!";
            }
        }

        public List<Country> GetAllCountryList()
        {
            return countryGateway.GetAllCountryList();
        }

        public List<Country> GetAllCountryName()
        {
            return countryGateway.GetAllCountryName();
        }

        public List<Country> GetAllCountryInformation()
        {
            return countryGateway.GetAllCountryInformation();
        }

        public List<Country> GetsearchCountryInformation(string search)
        {
            return countryGateway.GetsearchCountryInformation(search);
        }
    }
}