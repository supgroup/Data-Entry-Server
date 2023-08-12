using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Programs_Server.Classes
{
    public class Calculate
    {
        public decimal percentValue(decimal? value, decimal? percent)
        {
          decimal? perval=  (value * percent / 100);
            return (decimal) perval;
        }
    }
}