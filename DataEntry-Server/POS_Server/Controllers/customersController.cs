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


    [RoutePrefix("api/customers")]

    public class customersController : ApiController
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
                    List<CustomersModel> List = new List<CustomersModel>();
                    List = GetAll();
                    return TokenManager.GenerateToken(List);

                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }

        }
        public  List<CustomersModel> GetAll()
        {

            List<CustomersModel> List = new List<CustomersModel>();
            bool canDelete = false;
            try
            {
                using (dedbEntities entity = new dedbEntities())
                {
                    List = (from S in entity.customers
                            join N in entity.nationalities on S.nationalityId equals N.nationalityId into JN
                            join D in entity.departments on S.departmentId equals D.departmentId into JD
                            from NAT in JN.DefaultIfEmpty()
                            from DEP in JD.DefaultIfEmpty()
                            select new CustomersModel()
                            {
                                custId = S.custId,
                                custname = S.custname,
                                lastName = S.lastName,
                                mobile = S.mobile,
                                department = DEP.name,
                                barcode = S.barcode,
                                printDate = S.printDate,
                                image = S.image,
                                notes = S.notes,
                                createUserId = S.createUserId,
                                updateUserId = S.updateUserId,
                                createDate = S.createDate,
                                updateDate = S.updateDate,
                                isActive = S.isActive,
                                nationalityId = S.nationalityId,
                                Nationality = NAT.name,
                                departmentId = S.departmentId,
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
                    CustomersModel row =GetByID(Id);
                    return TokenManager.GenerateToken(row);

                }
                catch
                {
                    return TokenManager.GenerateToken("0");
                }
            }
        }
     


       
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
                CustomersModel newObject = null;
                IEnumerable<Claim> claims = TokenManager.getTokenClaims(token);
                foreach (Claim c in claims)
                {
                    if (c.Type == "Object")
                    {
                        Object = c.Value.Replace("\\", string.Empty);
                        Object = Object.Trim('"');
                        newObject = JsonConvert.DeserializeObject<CustomersModel>(Object, new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" });
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


        public  decimal  Save(CustomersModel newitem)
        {
            customers newObject = new customers();
            newObject = JsonConvert.DeserializeObject<customers>(JsonConvert.SerializeObject(newitem));

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
                departments depmodel = new departments();
                try
                {
                    using (dedbEntities entity = new dedbEntities())
                    {
                        var locationEntity = entity.Set<customers>();
                        if (newObject.custId == 0)
                        {
                            newObject.createDate = DateTime.Now;
                            newObject.updateDate = newObject.createDate;
                            newObject.updateUserId = newObject.createUserId;
                            //nat
                            newObject.nationalityId =  savenationality(newObject, newitem);
                            newObject.departmentId =   savedepartment(newObject, newitem);
                            //

                            locationEntity.Add(newObject);
                            entity.SaveChanges();
                            message = newObject.custId;
                        }
                        else
                        {
                            var tmpObject = entity.customers.Where(p => p.custId == newObject.custId).FirstOrDefault();
                            tmpObject.updateDate = DateTime.Now;
                            //  tmpObject.custId = newObject.custId;
                            tmpObject.custname = newObject.custname;
                            tmpObject.lastName = newObject.lastName;
                            tmpObject.mobile = newObject.mobile;
                            tmpObject.department = newObject.department;
                            tmpObject.barcode = newObject.barcode;
                            tmpObject.printDate = newObject.printDate;
                            tmpObject.image = newObject.image;
                            tmpObject.notes = newObject.notes;
                            //  tmpObject.createUserId = newObject.createUserId;
                            tmpObject.updateUserId = newObject.updateUserId;
                            //  tmpObject.createDate = newObject.createDate;
                            //   tmpObject.updateDate = newObject.updateDate;
                            tmpObject.isActive = newObject.isActive;
                            //nat
                            //nat
                            tmpObject.nationalityId =   savenationality(newObject, newitem);
                            tmpObject.departmentId =   savedepartment(newObject, newitem);
                            //
                            //


                            entity.SaveChanges();

                            message = tmpObject.custId;
                        }
                    }
                    return message;
                }
                catch (Exception ex)
                {

                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }
        public  long?  savenationality(customers newObject, CustomersModel newitem)
        {
            nationalitiesController natcontroller =new  nationalitiesController();

            NationalitiesModel natmodel = new NationalitiesModel();
            natmodel.createDate = newObject.createDate;
            natmodel.createUserId = newObject.createUserId;
            natmodel.updateUserId = newObject.updateUserId;
            natmodel.name = newitem.Nationality;
            natmodel.nationalityId = newitem.nationalityId == null ? 0 : (long)newitem.nationalityId;
            long nid =  natcontroller.FindorSave(natmodel);
            if (nid > 0)
            {
                newObject.nationalityId = nid;
            }
            else
            {
                newObject.nationalityId = null;
            }

            return newObject.nationalityId;
        }
        public  long?  savedepartment(customers newObject, CustomersModel newitem)
        {

            DepartmentsModel departmentmodel = new DepartmentsModel();
           departmentsController depcontroller = new departmentsController();
            departmentmodel.name = newitem.department;
            departmentmodel.departmentId = newitem.departmentId == null ? 0 : (long)newitem.departmentId;
            long depid =depcontroller.FindorSave(departmentmodel);
            if (depid > 0)
            {
                newObject.departmentId = depid;
            }
            else
            {
                newObject.departmentId = null;
            }

            return newObject.departmentId;
        }
        public  CustomersModel GetByID(long itemId)
        {


            CustomersModel item = new CustomersModel();


            CustomersModel row = new CustomersModel();
            try
            {
                using (dedbEntities entity = new dedbEntities())
                {
                    var list = entity.customers.ToList();
                    row = list.Where(u => u.custId == itemId)
                     .Select(S => new CustomersModel()
                     {
                         custId = S.custId,
                         custname = S.custname,
                         lastName = S.lastName,
                         mobile = S.mobile,
                         department = S.department,
                         barcode = S.barcode,
                         printDate = S.printDate,
                         image = S.image,
                         notes = S.notes,
                         createUserId = S.createUserId,
                         updateUserId = S.updateUserId,
                         createDate = S.createDate,
                         updateDate = S.updateDate,
                         isActive = S.isActive,
                         nationalityId = S.nationalityId,


                     }).FirstOrDefault();
                    return row;
                }

            }
            catch (Exception ex)
            {
                row = new CustomersModel();
                //userrow.name = ex.ToString();
                return row;
            }
        }
        public  decimal Delete(long id, long signuserId, bool final)
        {

            decimal message = 0;
            if (final)
            {
                try
                {
                    using (dedbEntities entity = new dedbEntities())
                    {
                        customers objectDelete = entity.customers.Find(id);

                        entity.customers.Remove(objectDelete);
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
            //            customers objectDelete = entity.customers.Find(userId);

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