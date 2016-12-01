using System;
using System.Collections.Generic;

using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;

namespace naya.Models
{
	public class Student
	{
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int ID { get; set; }
		public int RollNo { get; set;}
		public string FirstName { get; set;}
		public string LastName { get; set;}
		public string Class { get; set; }
		public string Section { get; set; }
		public Mark Marks { get; set;}
	}

}
