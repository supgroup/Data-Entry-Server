﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Models
{
    public class setValuesModel
    {
        public int valId { get; set; }
        public string value { get; set; }
        public int isDefault { get; set; }
        public int isSystem { get; set; }
        public string notes { get; set; }
        public Nullable<int> settingId { get; set; }


  
        //setting
        public string name { get; set; }
    }
}