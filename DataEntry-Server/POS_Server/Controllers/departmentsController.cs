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


    [RoutePrefix("api/departments")]

    public class departmentsController : ApiController
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
                    List<DepartmentsModel> List = new List<DepartmentsModel>();
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
                    DepartmentsModel row =GetByID(Id);
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
                departments newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<departments>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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

        public  List<DepartmentsModel>  GetAll()
        {

            List<DepartmentsModel> List = new List<DepartmentsModel>();
            bool canDelete = false;
            try
            {
                using (dedbEntities entity = new dedbEntities())
                {
                    List = (from S in entity.departments
                            select new DepartmentsModel()
                            {
                                departmentId = S.departmentId,
                                name = S.name,



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

        public  decimal  Save(departments newitem)
        {
            departments newObject = new departments();
            newObject = JsonConvert.DeserializeObject<departments>(JsonConvert.SerializeObject(newitem));

            decimal message = 0;
            if (newObject != null)
            {



                try
                {
                    using (dedbEntities entity = new dedbEntities())
                    {
                        var locationEntity = entity.Set<departments>();
                        if (newObject.departmentId == 0)
                        {

                            locationEntity.Add(newObject);
                            entity.SaveChanges();
                            message = newObject.departmentId;
                        }
                        else
                        {
                            var tmpObject = entity.departments.Where(p => p.departmentId == newObject.departmentId).FirstOrDefault();
                            // tmpObject.departmentId = newObject.departmentId;
                            tmpObject.name = newObject.name;



                            entity.SaveChanges();

                            message = tmpObject.departmentId;
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
        public  DepartmentsModel  GetByID(long itemId)
        {


            DepartmentsModel item = new DepartmentsModel();


            DepartmentsModel row = new DepartmentsModel();
            try
            {
                using (dedbEntities entity = new dedbEntities())
                {
                    var list = entity.departments.ToList();
                    row = list.Where(u => u.departmentId == itemId)
                     .Select(S => new DepartmentsModel()
                     {
                         departmentId = S.departmentId,
                         name = S.name,


                     }).FirstOrDefault();
                    return row;
                }

            }
            catch (Exception ex)
            {
                row = new DepartmentsModel();
                //userrow.name = ex.ToString();
                return row;
            }
        }
        public   long  FindorSave(DepartmentsModel newitem)
        {
            departments newObject = new departments();
            newObject = JsonConvert.DeserializeObject<departments>(JsonConvert.SerializeObject(newitem));
            long message = 0;
            if (newObject != null)
            {

                try
                {
                    using (dedbEntities entity = new dedbEntities())
                    {
                        var locationEntity = entity.Set<departments>();
                        string serchval = newitem.name == null ? "" : newitem.name.Trim();
                        var tmpObject = entity.departments.Where(p => p.name == serchval).FirstOrDefault();
                        if (tmpObject == null)
                        {
                            //add

                            newObject.name = newitem.name.Trim();
                            //  newObject.isActive = true;
                            locationEntity.Add(newObject);
                            entity.SaveChanges();
                            message = newObject.departmentId;
                        }
                        else
                        {
                            message = tmpObject.departmentId;
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
        public  decimal  Delete(int id, int signuserId, bool final)
        {

            decimal message = 0;
            if (final)
            {
                try
                {
                    using (dedbEntities entity = new dedbEntities())
                    {
                        departments objectDelete = entity.departments.Find(id);

                        entity.departments.Remove(objectDelete);
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
            //            departments objectDelete = entity.departments.Find(userId);

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