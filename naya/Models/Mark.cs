using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace naya.Models
{
	public class Mark
	{
		[Key, ForeignKey("Students")]
		public int ID { get; set;}
		public float Physics { get; set;}
		public float Chemistry { get; set; }
		public float Mathematics { get; set; }
		public float Computing { get; set; }
		public float English { get; set; }
		public Student Students { get; set; }
	}
}
