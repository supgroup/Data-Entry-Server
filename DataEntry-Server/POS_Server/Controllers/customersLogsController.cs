using Newtonsoft.Json;
using Programs_Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Programs_Server.Models;
using System.IO;
using System.Net.Http.Headers;
using System.Web;


using Programs_Server.Models.VM;
using System.Security.Claims;
using Newtonsoft.Json.Converters;


namespace Programs_Server.Controllers
{


    [RoutePrefix("api/customersLogs")]

    public class customersLogsController : ApiController
    {
        CountryController cntryctrlr = new CountryController();
        // GET api/<controller>
        [HttpPost]
        [Route("GetAll")]
        public string GetAll(string token)
        {

            bool canDelete = false;
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
                    List<CustomersLogsModel> List = new List<CustomersLogsModel>();
                    List = GetAll();
                    return TokenManager.GenerateToken(List);

                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }

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
                long  Id = 0;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "itemId")
                    {
                         Id = long.Parse(c.Value);
                    }
                }
                try
                {
                    CustomersLogsModel row =GetByID(Id);
                    return TokenManager.GenerateToken(row);

                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }
        }

        [HttpPost]
        [Route("savelog")]
        public string savelog(string token)
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
                string type = "";
                string barcode = "";
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "type")
                    {
                        type =  c.Value;
                    }else if (c.Type == "barcode")
                    {
                        barcode = c.Value;
                    }
                }
                try
                {
                    long res = 0;
                    res = savelog(barcode, type);
                decimal msg=  decimal.Parse(res.ToString());
                    return TokenManager.GenerateToken(msg.ToString());

                }
                catch(Exception ex)
                {
                //    return TokenManager.GenerateToken("0");
                    return TokenManager.GenerateToken(ex.ToString());
                }
            }
        }

        // GET api/<controller>



        // add or update location
        [HttpPost]
        [Route("Save")]
        public string Save(string token)
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
                customersLogs newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<customersLogs>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                        break;
                    }
                }

              
                if (newObject != null)
                {
                    long res = Save(newObject);
                    return TokenManager.GenerateToken(res.ToString());                 
                }
                else
                {
                    return TokenManager.GenerateToken("0");
                }


            }


        }

      
        [HttpPost]
        [Route("Delete")]
        public string Delete(string token)//int userId, int signuserId, bool final
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
                int userId = 0;
                int signuserId = 0;
                bool final = false;

                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "userId")
                    {
                        userId = int.Parse(c.Value);
                    }
                    else if (c.Type == "signuserId")
                    {
                        signuserId = int.Parse(c.Value);
                    }
                    else if (c.Type == "final")
                    {
                        final = bool.Parse(c.Value);
                    }

                }
         decimal res=       Delete(userId, signuserId, final);
                return TokenManager.GenerateToken(res.ToString());
               
            }
            }

        public  List<CustomersLogsModel>  GetAll()
        {

            List<CustomersLogsModel> List = new List<CustomersLogsModel>();
            bool canDelete = false;
            try
            {
                using (dedbEntities entity = new dedbEntities())
                {
                    List = (from S in entity.customersLogs
                            join C in entity.customers on S.custId equals C.custId
                            join N in entity.nationalities on C.nationalityId equals N.nationalityId into JN
                            join D in entity.departments on C.departmentId equals D.departmentId into JD
                            from NAT in JN.DefaultIfEmpty()
                            from DEP in JD.DefaultIfEmpty()
                            select new CustomersLogsModel()
                            {
                                logId = S.logId,
                                sInDate = S.sInDate,
                                sOutDate = S.sOutDate,
                                custId = S.custId,
                                custname=C.custname,
                                department = DEP.name,
                                Nationality = NAT.name,
                                nationalityId = C.nationalityId,
                                departmentId = C.departmentId,
                                isActive=C.isActive,
                            }).ToList();

                    //if (List.Count > 0)
                    //{
                    //    for (int i = 0; i < List.Count; i++)
                    //    {
                    //        if (List[i].isActive == 1)
                    //        {
                    //            int userId = (int)List[i].userId;
                    //            var itemsI = entity.packageUser.Where(x => x.userId == userId).Select(b => new { b.userId }).FirstOrDefault();

                    //            if ((itemsI is null))
                    //                canDelete = true;
                    //        }
                    //        List[i].canDelete = canDelete;
                    //    }
                    //}
                    return List;
                }

            }
            catch
            {
                return List;
            }
        }

        public  long  Save(customersLogs newitem)
        {
            customersLogs newObject = new customersLogs();
            newObject = JsonConvert.DeserializeObject<customersLogs>(JsonConvert.SerializeObject(newitem));

            long message = 0;
            if (newObject != null)
            {
                try
                {
                    using (dedbEntities entity = new dedbEntities())
                    {
                        var locationEntity = entity.Set<customersLogs>();
                        if (newObject.logId == 0)
                        {

                            locationEntity.Add(newObject);
                            entity.SaveChanges();
                            message = newObject.logId;
                        }
                        else
                        {
                            var tmpObject = entity.customersLogs.Where(p => p.logId == newObject.logId).FirstOrDefault();
                            // tmpObject.logId = newObject.logId;
                           // tmpObject.logId = newObject.logId;
                            tmpObject.sInDate = newObject.sInDate;
                            tmpObject.sOutDate = newObject.sOutDate;
                            tmpObject.custId = newObject.custId;


                            entity.SaveChanges();

                            message = tmpObject.logId;
                        }
                    }
                    return message;
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
        public  CustomersLogsModel  GetByID(long itemId)
        {
            CustomersLogsModel row = new CustomersLogsModel();
            try
            {
                using (dedbEntities entity = new dedbEntities())
                {
                    var list = entity.customersLogs.ToList();
                    row = list.Where(u => u.logId == itemId)
                     .Select(S => new CustomersLogsModel()
                     {
                         logId = S.logId,
                         sInDate = S.sInDate,
                         sOutDate = S.sOutDate,
                         custId = S.custId,


                     }).FirstOrDefault();
                    return row;
                }

            }
            catch (Exception ex)
            {
                row = new CustomersLogsModel();
                //userrow.name = ex.ToString();
                return row;
            }
        }
     
        public  decimal  Delete(int id, int signuserId, bool final)
        {

            decimal message = 0;
            if (final)
            {
                try
                {
                    using (dedbEntities entity = new dedbEntities())
                    {
                        customersLogs objectDelete = entity.customersLogs.Find(id);

                        entity.customersLogs.Remove(objectDelete);
                        message = entity.SaveChanges();
                        return message;

                    }
                }
                catch
                {
                    return 0;

                }
            }
            return message;
            //else
            //{
            //    try
            //    {
            //        using (dedbEntities entity = new dedbEntities())
            //        {
            //            customersLogs objectDelete = entity.customersLogs.Find(userId);

            //            objectDelete.isActive = 0;
            //            objectDelete.updateUserId = signuserId;
            //        objectDelete.updateDate = DateTime.Now;
            //            message = entity.SaveChanges() ;

            //            return message;
            //        }
            //    }
            //    catch
            //    {
            //        return 0;
            //    }
            //}

        }
        public long savelog(string barcode,string type)
        {
            long res = 0;
            CustomersModel customerModel = new CustomersModel();
            CustomersLogsModel row = new CustomersLogsModel();
            customersController custcntrlr = new customersController();
            customerModel = custcntrlr.GetByBarcode(barcode);

            if (customerModel is null) {
                return -4;
            } else {

                if (type == "in")
                {
                    //signin
                    customersLogs customersLogs = new customersLogs();
                    customersLogs.custId = customerModel.custId;

                    customersLogs.sInDate = DateTime.Now;
                    res = Save(customersLogs);
                }
                else
                {
                    //out
                    DateTime now = DateTime.Now;
                    using (dedbEntities entity = new dedbEntities())
                    {
                        List<customersLogs> List = entity.customersLogs.Where(S => (long)S.custId == customerModel.custId && S.sOutDate == null).ToList();
                        if (List != null && List.Count>0)
                        {
                            //  customersLogs logrow = new customersLogs();
                            var logrow = List.LastOrDefault();

                            if (((DateTime)logrow.sInDate).Date == now.Date)
                            {
                                List<customersLogs> Listin = entity.customersLogs.Where(S => (long)S.custId == customerModel.custId && S.sOutDate != null).ToList();
                                bool canout = true;
                                if (Listin != null && Listin.Count > 0)
                                {
                                    var lastoutrow = Listin.LastOrDefault();
                                    if (lastoutrow.sInDate > logrow.sInDate)
                                    {
                                        canout = false;
                                    }

                                }
                                if (canout)
                                {
      //can logout
                                    logrow.sOutDate = now;
                                res = entity.SaveChanges();
                                }
                                else
                                {
                                    //last login is closed
                                    res = -2;
                                }
                              
                                //  res=  Save(logrow);
                                return res;
                            }
                            else
                            {
                                //return no login today
                                return -3;

                            }

                        }
                        else
                        {
                            //لم يسجل دخول
                            return -2;
                        }

                    }
                }
            }
         
            return res;
            
        }


    }
}