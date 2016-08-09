using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCityInformationManagementApp.Models
{
    public class Country
    {
        public int Id { get; set; }
        public string Name { set; get; }
        public string About { set; get; }
        public int NoOfCities { set; get; }
        public int? NoOfDwellers { get; set; }
    }

}