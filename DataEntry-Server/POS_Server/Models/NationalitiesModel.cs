using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class NationalitiesModel
    {
        public long nationalityId { get; set; }
        public string name { get; set; }
        public string notes { get; set; }
        public Nullable<bool> isActive { get; set; }
        public Nullable<long> createUserId { get; set; }
        public Nullable<long> updateUserId { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }

        public bool canDelete { get; set; }

    }
}