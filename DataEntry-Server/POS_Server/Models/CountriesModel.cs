using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class CountriesModel
    {
        public int countryId { get; set; }
        public string code { get; set; }
        public string currency { get; set; }
        public string name { get; set; }
        public byte isDefault { get; set; }

        public int currencyId { get; set; }
        public string timeZoneName { get; set; }
        public string timeZoneOffset { get; set; }
    }
}