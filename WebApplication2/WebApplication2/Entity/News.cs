using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication2.Entity
{
    public class News
    {
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTimeOffset Date { get; set; }
        public string NewsPaper { get; set; }
    }
}
