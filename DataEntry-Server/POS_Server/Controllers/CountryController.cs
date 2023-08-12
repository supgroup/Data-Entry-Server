using Newtonsoft.Json;
using Programs_Server.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using Programs_Server.Models.VM;
using System.Security.Claims;
using System.Web;

namespace Programs_Server.Controllers
{
    [RoutePrefix("api/Country")]
    public class CountryController : ApiController
    {
        // GET api/<controller>
        [HttpPost]
        [Route("GetAll")]
        public string GetAll(string token)
        {

            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                try
                {
                    List<countriesCodes> list = new List<countriesCodes>();
                    list = GetAll();
                    return TokenManager.GenerateToken(list);
                    
                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }

        }


        [HttpPost]
        [Route("GetAllCities")]
        public string GetAllCities(string token)
        {
            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                try
                {

                    using (dedbEntities entity = new dedbEntities())
                    {
                        var countrylist = entity.countriesCodes.ToList()
                             .Select(c => new
                             {
                                 c.countryId,
                                 c.code,
                                 c.isDefault,
                             }).ToList();


                        return TokenManager.GenerateToken(countrylist);

                    }


                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }
        }


        [HttpPost]
        [Route("GetAllRegion")]
        public string GetAllRegion(string token)
        {
            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                try
                {
                    List<countriesCodes> list = new List<countriesCodes>();
                    list = GetAllRegion();
                    return TokenManager.GenerateToken(list);
                 

                }

                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }
        }

        [HttpPost]
        [Route("UpdateIsdefault")]
        public string UpdateIsdefault(string token)
        {

            string message = "";

            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                int countryId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "countryId")
                    {
                        countryId = int.Parse(c.Value);
                    }


                }

                try
                {
                    using (dedbEntities entity = new dedbEntities())
                    {
                        // reset all to 0
                        List<countriesCodes> objectlist = entity.countriesCodes.Where(x => x.isDefault == 1).ToList();
                        if (objectlist.Count > 0)
                        {
                            for (int i = 0; i < objectlist.Count; i++)
                            {
                                objectlist[i].isDefault = 0;

                            }
                            entity.SaveChanges();
                        }
                        // set is selected to isdefault=1
                        countriesCodes objectrow = entity.countriesCodes.Find(countryId);

                        if (objectrow != null)
                        {
                            objectrow.isDefault = 1;

                            message = objectrow.countryId.ToString();
                            entity.SaveChanges();
                        }
                        else
                        {
                            message = "-1";
                        }
                        //  entity.SaveChanges();
                    }
                }
                catch
                {
                    message = "-1";
                }
            }
            return TokenManager.GenerateToken(message);
        }

        [HttpPost]
        [Route("GetByID")]
        public string GetByID(string token)//Id
        {

            string message = "";

            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                int Id = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Id")
                    {
                        Id = int.Parse(c.Value);
                    }


                }

                try
                {


                    using (dedbEntities entity = new dedbEntities())
                    {
                        var list = entity.countriesCodes.ToList()
                       .Where(c => c.countryId == Id)
                       .Select(c => new
                       {
                           c.countryId,
                           c.code,
                           c.currency,
                           c.name,
                           c.isDefault
                       })
                       .FirstOrDefault();
                        return TokenManager.GenerateToken(list);

                    }
                }

                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }
        }


        public string TimeZoneDiff(string tzone1name, string tzone2name)
        {
            //program-servertimez
            var tzone1 = TimeZoneInfo.FindSystemTimeZoneById
                (tzone1name);
            var tzone2 = TimeZoneInfo.FindSystemTimeZoneById
                (tzone2name);
            var now = DateTimeOffset.UtcNow;
            TimeSpan tzone1span = tzone1.GetUtcOffset(now);
            TimeSpan tzone2span = tzone2.GetUtcOffset(now);
            TimeSpan difference = tzone1span - tzone2span;

            return difference.ToString();
        }
        public TimeSpan offsetTime()
        {
            CountriesModel country = new CountriesModel();

            //server timezone
            TimeZone serverTimeZone = TimeZone.CurrentTimeZone;
            string ServerStandardName = serverTimeZone.StandardName;
            //program time zone
            country = GetDefaultCountry();
            string programStandardName = country.timeZoneName;
            string timeoffset = TimeZoneDiff(programStandardName, ServerStandardName);
            TimeSpan offset = TimeSpan.Parse(timeoffset);
            return offset;
        }
        public TimeSpan offsetTimebyCountry(int? countryId)
        {
            CountriesModel country = new CountriesModel();

            //server timezone
            TimeZone serverTimeZone = TimeZone.CurrentTimeZone;
            string ServerStandardName = serverTimeZone.StandardName;
            //customer time zone
            country = GetCountryById((int)countryId);
            string programStandardName = country.timeZoneName;
            string timeoffset = TimeZoneDiff(programStandardName, ServerStandardName);
            TimeSpan offset = TimeSpan.Parse(timeoffset);
            return offset;
        }
        public DateTime AddOffsetTodate(DateTime date)
        {
            TimeSpan ts = new TimeSpan();
            ts = offsetTime();
            date = date.AddHours(ts.TotalHours);
            return date;
        }
        public DateTime AddOffsetTodatebyCountry(DateTime date, int? countryId)
        {
            TimeSpan ts = new TimeSpan();
            ts = offsetTimebyCountry(countryId);
            date = date.AddHours(ts.TotalHours);
            return date;
        }
        public CountriesModel GetDefaultCountry()
        {
            try
            {
                using (dedbEntities entity = new dedbEntities())
                {
                    CountriesModel item = entity.countriesCodes
                   .Where(c => c.isDefault == 1)
                   .Select(c => new CountriesModel
                   {
                       countryId = c.countryId,
                       code = c.code,
                       currency = c.currency,
                       name = c.name,
                       isDefault = c.isDefault,

                       timeZoneName = c.timeZoneName,
                       timeZoneOffset = c.timeZoneOffset,
                   }).FirstOrDefault();

                    return item;
                }
            }
            catch
            {
                CountriesModel cntry = new CountriesModel();
                return cntry;
            }
        }
        public CountriesModel GetCountryById(int countryId)
        {
            try
            {
                using (dedbEntities entity = new dedbEntities())
                {
                    CountriesModel item = entity.countriesCodes
                   .Where(c => c.countryId == countryId)
                   .Select(c => new CountriesModel
                   {
                       countryId = c.countryId,
                       code = c.code,
                       currency = c.currency,
                       name = c.name,
                       isDefault = c.isDefault,

                       timeZoneName = c.timeZoneName,
                       timeZoneOffset = c.timeZoneOffset,
                   }).FirstOrDefault();

                    return item;
                }
            }
            catch
            {
                CountriesModel cntry = new CountriesModel();
                return cntry;
            }
        }

        [HttpPost]
        [Route("GetOffsetTime")]
        public string GetOffsetTime(string token)
        {
            token = TokenManager.readToken(HttpContext.Current.Request);
            var strP = TokenManager.GetPrincipal(token);
            if (strP != "0") //invalid authorization
            {
                return TokenManager.GenerateToken(strP);
            }
            else
            {
                int countryId = 0;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "countryId")
                    {
                        countryId = int.Parse(c.Value);
                    }


                }
                try
                {

                    TimeSpan ts = new TimeSpan();

                    ts = offsetTimebyCountry(countryId);
                    return TokenManager.GenerateToken(ts);
                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }

            }
        }
        public    List<countriesCodes> GetAll()
        {

            List<countriesCodes> list = new List<countriesCodes>();
            try
            {
                using (dedbEntities entity = new dedbEntities())
                {
                    list = entity.countriesCodes.ToList()
                         .Select(c => new countriesCodes
                         {
                             countryId = c.countryId,
                             code = c.code,
                             name = c.name,
                             currency = c.currency,
                             isDefault = c.isDefault,
                         }).ToList();

                    return list;
                }
            }
            catch
            {
                return list;
            }
        }

        public List<countriesCodes> GetAllRegion()
        {
            List<countriesCodes> list = new List<countriesCodes>();
            try
            {
                using (dedbEntities entity = new dedbEntities())
                {
                    list = entity.countriesCodes.ToList()
                         .Select(c => new countriesCodes
                         {
                             countryId = c.countryId,
                             code = c.code,
                             name = c.name,
                             currency = c.currency,
                             isDefault = c.isDefault,
                         }).ToList();
                    return list;

                }

            }

            catch
            {
                return list;
            }

        }


    }
}