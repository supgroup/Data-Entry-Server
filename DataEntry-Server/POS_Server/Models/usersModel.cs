using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class usersModel
    {
        public long userId { get; set; }
        public string name { get; set; }
        public string AccountName { get; set; }
        public string lastName { get; set; }
        public string company { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string mobile { get; set; }
        public string fax { get; set; }
        public string address { get; set; }
        public string agentLevel { get; set; }
        public Nullable<System.DateTime> createDate { get; set; }
        public Nullable<System.DateTime> updateDate { get; set; }
        public string password { get; set; }
        public string type { get; set; }
        public string image { get; set; }
        public string notes { get; set; }
        public decimal balance { get; set; }
        public Nullable<long> createUserId { get; set; }
        public Nullable<long> updateUserId { get; set; }
        public Nullable<int> isActive { get; set; }
        public string code { get; set; }
    
        public Nullable<bool> isAdmin { get; set; }
        public Nullable<int> groupId { get; set; }
        public Nullable<byte> balanceType { get; set; }
        public string job { get; set; }
        public Nullable<byte> isOnline { get; set; }
        public bool canDelete { get; set; }
        public Nullable<int> countryId { get; set; }

    }
}