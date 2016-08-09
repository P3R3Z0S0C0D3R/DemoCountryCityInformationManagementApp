namespace CountryCityInformationManagementApp.Models
{
    public class City
    {   
        public int Id { get; set; }
        public string Name { get; set; }
        public string About { get; set; }
        public int NoOfCityDwellers { get; set; }
        public string Location { get; set; }
        public string Weather { get; set; }
        public int CountryId { get; set; }
        public string Country { get; set; }
        public string AboutCountry { get; set; }
    }
}