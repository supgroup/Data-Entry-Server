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


    [RoutePrefix("api/nationalities")]

    public class nationalitiesController : ApiController
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
                    List<NationalitiesModel> List = new List<NationalitiesModel>();
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
                    NationalitiesModel row =GetByID(Id);
                    return TokenManager.GenerateToken(row);

                }
                catch
                {
                    return TokenManager.GenerateToken("0");
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
                NationalitiesModel newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<NationalitiesModel>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
                        break;
                    }
                }

              
                if (newObject != null)
                {
                    decimal res = Save(newObject);
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

        public  List<NationalitiesModel>  GetAll()
        {

            List<NationalitiesModel> List = new List<NationalitiesModel>();
            bool canDelete = false;
            try
            {
                using (dedbEntities entity = new dedbEntities())
                {
                    List = (from S in entity.nationalities
                            select new NationalitiesModel()
                            {
                                nationalityId = S.nationalityId,
                                name = S.name,
                                notes = S.notes,
                                isActive = S.isActive,
                                createUserId = S.createUserId,
                                updateUserId = S.updateUserId,
                                createDate = S.createDate,
                                updateDate = S.updateDate,


                                canDelete = true,

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

        public  decimal Save(NationalitiesModel newitem)
        {
            nationalities newObject = new nationalities();
            newObject = JsonConvert.DeserializeObject<nationalities>(JsonConvert.SerializeObject(newitem));

            decimal message = 0;
            if (newObject != null)
            {
                if (newObject.updateUserId == 0 || newObject.updateUserId == null)
                {
                    Nullable<int> id = null;
                    newObject.updateUserId = id;
                }
                if (newObject.createUserId == 0 || newObject.createUserId == null)
                {
                    Nullable<int> id = null;
                    newObject.createUserId = id;
                }



                try
                {
                    using (dedbEntities entity = new dedbEntities())
                    {
                        var locationEntity = entity.Set<nationalities>();
                        if (newObject.nationalityId == 0)
                        {
                            newObject.createDate = DateTime.Now;
                            newObject.updateDate = newObject.createDate;
                            newObject.updateUserId = newObject.createUserId;


                            locationEntity.Add(newObject);
                            entity.SaveChanges();
                            message = newObject.nationalityId;
                        }
                        else
                        {
                            var tmpObject = entity.nationalities.Where(p => p.nationalityId == newObject.nationalityId).FirstOrDefault();
                            newObject.updateDate = DateTime.Now;
                            //  tmpObject.nationalityId = newObject.nationalityId;
                            tmpObject.nationalityId = newObject.nationalityId;
                            tmpObject.name = newObject.name;
                            tmpObject.notes = newObject.notes;
                            tmpObject.isActive = newObject.isActive;
                            // tmpObject.createUserId = newObject.createUserId;
                            tmpObject.updateUserId = newObject.updateUserId;
                            //tmpObject.createDate = newObject.createDate;
                            //tmpObject.updateDate = newObject.updateDate;


                            entity.SaveChanges();

                            message = tmpObject.nationalityId;
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
        public  long  FindorSave(NationalitiesModel newitem)
        {
            nationalities newObject = new nationalities();
            newObject = JsonConvert.DeserializeObject<nationalities>(JsonConvert.SerializeObject(newitem));
            long message = 0;
            if (newObject != null)
            {
                if (newObject.updateUserId == 0 || newObject.updateUserId == null)
                {
                    Nullable<int> id = null;
                    newObject.updateUserId = id;
                }
                if (newObject.createUserId == 0 || newObject.createUserId == null)
                {
                    Nullable<int> id = null;
                    newObject.createUserId = id;
                }
                try
                {
                    using (dedbEntities entity = new dedbEntities())
                    {
                        var locationEntity = entity.Set<nationalities>();
                        string serchval = newitem.name == null ? "" : newitem.name.Trim();
                        var tmpObject = entity.nationalities.Where(p => p.name == serchval).FirstOrDefault();
                        if (tmpObject == null)
                        {
                            //add
                            newObject.createDate = DateTime.Now;
                            newObject.updateDate = newObject.createDate;
                            newObject.updateUserId = newObject.createUserId;
                            newObject.name = newitem.name.Trim();
                            newObject.isActive = true;
                            locationEntity.Add(newObject);
                            entity.SaveChanges();
                            message = newObject.nationalityId;
                        }
                        else
                        {
                            message = tmpObject.nationalityId;
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
        public NationalitiesModel  GetByID(long itemId)
        {


            NationalitiesModel item = new NationalitiesModel();


            NationalitiesModel row = new NationalitiesModel();
            try
            {
                using (dedbEntities entity = new dedbEntities())
                {
                    var list = entity.nationalities.ToList();
                    row = list.Where(u => u.nationalityId == itemId)
                     .Select(S => new NationalitiesModel()
                     {
                         nationalityId = S.nationalityId,
                         name = S.name,
                         notes = S.notes,
                         isActive = S.isActive,
                         createUserId = S.createUserId,
                         updateUserId = S.updateUserId,
                         createDate = S.createDate,
                         updateDate = S.updateDate,


                     }).FirstOrDefault();
                    return row;
                }

            }
            catch (Exception ex)
            {
                row = new NationalitiesModel();
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
                        nationalities objectDelete = entity.nationalities.Find(id);

                        entity.nationalities.Remove(objectDelete);
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
            //            nationalities objectDelete = entity.nationalities.Find(userId);

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

    }
}