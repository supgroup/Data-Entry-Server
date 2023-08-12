using Newtonsoft.Json;
using Programs_Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Programs_Server.Models;
using Programs_Server.Models.VM;
using System.Security.Claims;
using Newtonsoft.Json.Converters;
using System.Web;

namespace Programs_Server.Controllers
{


    [RoutePrefix("api/errorController")]

    public class errorController : ApiController

    {
        CountryController cntryctrlr = new CountryController();
        // GET api/<controller>
        [HttpPost]
        [Route("GetAll")]
        public string GetAll(string token)//string token
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
                        var List = (from S in entity.error
                                    select new errorModel()
                                    {

                                        errorId = S.errorId,
                                        num = S.num,
                                        msg = S.msg,
                                        stackTrace = S.stackTrace,
                                        targetSite = S.targetSite,
                                        createDate = S.createDate,
                                        createUserId = S.createUserId,


                                    }).ToList();


                        return TokenManager.GenerateToken(List);

                    }

                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }
            //            var re = Request;
            //            var headers = re.Headers;
            //            string token = "";
            //            bool canDelete = false;

            //            if (headers.Contains("APIKey"))
            //            {
            //                token = headers.GetValues("APIKey").First();
            //            }

            //            Validation validation = new Validation();
            //            bool valid = validation.CheckApiKey(token);

            //            if (valid) // APIKey is valid
            //            {
            //                using (dedbEntities entity = new dedbEntities())
            //                {
            //                    var List = (from S in entity.error
            //                                select new errorModel()
            //                                {

            //                                    errorId = S.errorId,
            //                                    num = S.num,
            //                                    msg = S.msg,
            //                                    stackTrace = S.stackTrace,
            //                                    targetSite = S.targetSite,
            //                                    createDate = S.createDate,
            //                                    createUserId = S.createUserId,


            //                                }).ToList();
            //                    /*
            //                   public int errorId { get; set; }
            //        public string num { get; set; }
            //        public string msg { get; set; }
            //        public string stackTrace { get; set; }
            //        public string targetSite { get; set; }
            //        public Nullable<System.DateTime> createDate { get; set; }
            //        public Nullable<int> createUserId { get; set; }


            //errorId
            //num
            //msg
            //stackTrace
            //targetSite
            //createDate
            //createUserId


            //                     */



            //                    if (List == null)
            //                        return NotFound();
            //                    else
            //                        return Ok(List);
            //                }
            //            }
            //            //else
            //            return NotFound();
        }

        // GET api/<controller>
        [HttpPost]
        [Route("GetByID")]
        public string GetByID(string token)
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
                int errorId = 0;


                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "errorId")
                    {
                        errorId = int.Parse(c.Value);
                    }


                }
                try
                {

                    using (dedbEntities entity = new dedbEntities())
                    {
                        var row = entity.error
                       .Where(u => u.errorId == errorId)
                       .Select(S => new
                       {

                           S.errorId,
                           S.num,
                           S.msg,
                           S.stackTrace,
                           S.targetSite,
                           S.createDate,
                           S.createUserId,


                       })
                                   .FirstOrDefault();
                        return TokenManager.GenerateToken(row);
                    }
                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }

            //var re = Request;
            //var headers = re.Headers;
            //string token = "";
            //if (headers.Contains("APIKey"))
            //{
            //    token = headers.GetValues("APIKey").First();
            //}
            //Validation validation = new Validation();
            //bool valid = validation.CheckApiKey(token);

            //if (valid)
            //{
            //    using (dedbEntities entity = new dedbEntities())
            //    {
            //        var row = entity.error
            //       .Where(u => u.errorId == errorId)
            //       .Select(S => new
            //       {

            //           S.errorId,
            //           S.num,
            //           S.msg,
            //           S.stackTrace,
            //           S.targetSite,
            //           S.createDate,
            //           S.createUserId,


            //       })
            //       .FirstOrDefault();

            //        if (row == null)
            //            return NotFound();
            //        else
            //            return Ok(row);
            //    }
            //}
            //else
            //    return NotFound();
        }

        // add or update location
        [HttpPost]
        [Route("Save")]
        public string Save(string token) //string Object
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
                string Object = "";
                error newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<error>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                        break;
                    }
                }
                if (newObject != null)
                {


                    if (newObject.createUserId == 0 || newObject.createUserId == null)
                    {
                        Nullable<int> id = null;
                        newObject.createUserId = id;
                    }


                    try
                    {
                        decimal res = Save(newObject);
                        return TokenManager.GenerateToken(res.ToString());
                      

                    }
                    catch
                    {
                        return TokenManager.GenerateToken("0");
                    }
                }
                else
                {
                    return TokenManager.GenerateToken("0");
                }


            }


            //var re = Request;
            //var headers = re.Headers;
            //string token = "";
            //string message = "";
            //if (headers.Contains("APIKey"))
            //{
            //    token = headers.GetValues("APIKey").First();
            //}
            //Validation validation = new Validation();
            //bool valid = validation.CheckApiKey(token);

            //if (valid)
            //{
            //    Object = Object.Replace("\\", string.Empty);
            //    Object = Object.Trim('"');
            //    error newObject = JsonConvert.DeserializeObject<error>(Object, new JsonSerializerSettings { DateParseHandling = DateParseHandling.None });

            //    if (newObject.createUserId == 0 || newObject.createUserId == null)
            //    {
            //        Nullable<int> id = null;
            //        newObject.createUserId = id;
            //    }


            //    try
            //    {
            //        using (dedbEntities entity = new dedbEntities())
            //        {
            //            var locationEntity = entity.Set<error>();
            //            if (newObject.errorId == 0)
            //            {
            //                newObject.createDate = DateTime.Now;



            //                locationEntity.Add(newObject);
            //                entity.SaveChanges();
            //                message = newObject.errorId.ToString();
            //            }
            //            else
            //            {
            //                var tmpObject = entity.error.Where(p => p.errorId == newObject.errorId).FirstOrDefault();


            //                tmpObject.errorId = newObject.errorId;
            //                tmpObject.num = newObject.num;
            //                tmpObject.msg = newObject.msg;
            //                tmpObject.stackTrace = newObject.stackTrace;
            //                tmpObject.targetSite = newObject.targetSite;





            //                entity.SaveChanges();

            //                message = tmpObject.errorId.ToString();
            //            }
            //            //  entity.SaveChanges();
            //        }
            //    }
            //    catch
            //    {
            //        message = "-1";
            //    }
            //}
            //return message;
        }
        public decimal Save(error obj)
        {

            error newObject = new error();
            newObject = JsonConvert.DeserializeObject<error>(JsonConvert.SerializeObject(obj));

            decimal message = 0;



            if (newObject != null)
            {


                if (newObject.createUserId == 0 || newObject.createUserId == null)
                {
                    Nullable<int> id = null;
                    newObject.createUserId = id;
                }


                try
                {
                    using (dedbEntities entity = new dedbEntities())
                    {
                        var locationEntity = entity.Set<error>();
                        if (newObject.errorId == 0)
                        {
                            newObject.createDate = DateTime.Now;



                            locationEntity.Add(newObject);
                            entity.SaveChanges();
                            message = newObject.errorId;
                        }
                        else
                        {
                            var tmpObject = entity.error.Where(p => p.errorId == newObject.errorId).FirstOrDefault();


                            tmpObject.errorId = newObject.errorId;
                            tmpObject.num = newObject.num;
                            tmpObject.msg = newObject.msg;
                            tmpObject.stackTrace = newObject.stackTrace;
                            tmpObject.targetSite = newObject.targetSite;

                            entity.SaveChanges();

                            message = tmpObject.errorId;
                        }
                        return message;
                    }


                }
                catch
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }


        }
        [HttpPost]
        [Route("Delete")]
        public string Delete(string token)//int errorId, int userId, bool final
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
                int errorId = 0;
                int userId = 0;
                bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "errorId")
                    {
                        errorId = int.Parse(c.Value);
                    }
                    else if (c.Type == "userId")
                    {
                        userId = int.Parse(c.Value);
                    }
                    else if (c.Type == "final")
                    {
                        final = bool.Parse(c.Value);
                    }

                }
                try
                {
                    using (dedbEntities entity = new dedbEntities())
                    {
                        error objectDelete = entity.error.Find(errorId);

                        entity.error.Remove(objectDelete);
                        message = entity.SaveChanges().ToString();

                      
                        return TokenManager.GenerateToken(message);
                    }
                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }

            }

            //var re = Request;
            //var headers = re.Headers;
            //string token = "";
            //int message = 0;
            //if (headers.Contains("APIKey"))
            //{
            //    token = headers.GetValues("APIKey").First();
            //}

            //Validation validation = new Validation();
            //bool valid = validation.CheckApiKey(token);
            //if (valid)
            //{

            //    try
            //    {
            //        using (dedbEntities entity = new dedbEntities())
            //        {
            //            error objectDelete = entity.error.Find(errorId);

            //            entity.error.Remove(objectDelete);
            //            message = entity.SaveChanges();

            //            return message.ToString();
            //        }
            //    }
            //    catch
            //    {
            //        return "-1";
            //    }

            //}
            //else
            //    return "-3";
        }

    

    }
}