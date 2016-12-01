using System;
using System.Data.Entity;
using System.Linq;
using System.Web;
namespace naya.Models
{
	public class nayaDbContext : DbContext
	{
		public DbSet<Student> Students { get; set; }
		public DbSet<Mark> Marks { get; set; }
	}
}
