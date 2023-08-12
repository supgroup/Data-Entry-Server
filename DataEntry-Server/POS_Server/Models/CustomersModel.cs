using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class CustomersModel
    {
        public long custId { get; set; }
        public string custname { get; set; }
        public string lastName { get; set; }
        public string mobile { get; set; }
        public string department { get; set; }
        public string barcode { get; set; }
        public Nullable<System.DateTime> printDate { get; set; }
        public string image { get; set; }
        public string notes { get; set; }
        public Nullable<long> createUserId { get; set; }
        public Nullable<long> updateUserId { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public Nullable<bool> isActive { get; set; }
        public Nullable<long> nationalityId { get; set; }
        public string Nationality { get; set; }
        public Nullable<long> departmentId { get; set; }
        public bool canDelete { get; set; }

    }
}