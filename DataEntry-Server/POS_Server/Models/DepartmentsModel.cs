using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class DepartmentsModel
    {
        public long departmentId { get; set; }
        public string name { get; set; }
        public Nullable<bool> isActive { get; set; }
        public bool canDelete { get; set; }


    }
}