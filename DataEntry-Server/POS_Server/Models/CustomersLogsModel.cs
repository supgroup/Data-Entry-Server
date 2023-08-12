using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class CustomersLogsModel
    {

        public long logId { get; set; }
        public Nullable<System.DateTime> sInDate { get; set; }
        public Nullable<System.DateTime> sOutDate { get; set; }
        public Nullable<long> posId { get; set; }
        public Nullable<long> custId { get; set; }
        public bool canDelete { get; set; }
  

}
}