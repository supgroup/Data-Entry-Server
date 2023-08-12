using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class errorModel
    {
        public int errorId { get; set; }
        public string num { get; set; }
        public string msg { get; set; }
        public string stackTrace { get; set; }
        public string targetSite { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<long> createUserId { get; set; }



    }
}