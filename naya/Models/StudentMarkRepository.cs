using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace naya.Models
{
	public class StudentMarkRepository
	{
		nayaDbContext _Context = new nayaDbContext();

		public List<Student> GetStudents()
		{

			return (from e in _Context.Students.Include("Marks")
			        orderby (e.Marks.English >=50)
					orderby (e.Marks.Chemistry >= 50)
					orderby (e.Marks.Physics >= 50)
					orderby (e.Marks.Computing >= 50)
					orderby (e.Marks.Mathematics >= 50)
					orderby (e.Marks.Chemistry + e.Marks.Computing + e.Marks.Mathematics + e.Marks.Physics + e.Marks.English)
			        descending select e).ToList();
	
		}

		public List<Mark> GetStudentMarks(int id)
		{
	
			return (from e in _Context.Students where e.ID == id select e.Marks).ToList();
		}

		public List<Mark> GetStudentsMarks()
		{
			return (from e in _Context.Marks.Include("Students")
			        orderby e.English>50 descending, e.Chemistry>50 descending, e.Physics>50 descending, e.Computing>50 descending, e.Mathematics>50 descending
			         select e ).ToList();

		}

		public void AddStudent(int RollNo, string FirstName, string LastName, string Class, string Section)
		{
			
			Student student = new Student();
			student.RollNo = RollNo;
			student.FirstName = FirstName;
			student.LastName = LastName;
			student.Class = Class;
			student.Section = Section;
			_Context.Students.Add(student);
			_Context.SaveChanges();

		}

		public void DeleteStudent(int id)
		{
			Student student = _Context.Students.SingleOrDefault(s => s.ID == id);
			if (student != null)
			{
				_Context.Students.Remove(student);
				_Context.SaveChanges();
			}
			else {
				throw new ApplicationException("Cannot find the student.");
			}
		}

		public void EditStudent(int RollNo, string FirstName, string LastName, string Class, string Section, int ID)
		{
			Student student = _Context.Students.SingleOrDefault(s => s.ID == ID);
			if (student != null)
			{
				student.RollNo = RollNo;
				student.FirstName = FirstName;
				student.LastName = LastName;
					student.Class = Class;
				student.Section = Section;
				_Context.SaveChanges();
			}else
			{
				throw new ApplicationException("Cannot find the student.");
			}
		}

		public void AddMark(int Id, float physics, float chemistry, float mathematics, float computing, float english)
		{
	
			Mark mark = new Mark();
			mark.ID = Id;
			mark.Physics = physics;
			mark.Chemistry = chemistry;
			mark.Mathematics = mathematics;
			mark.Computing = computing;
			mark.English = english;
			_Context.Marks.Add(mark);
			_Context.SaveChanges();

		}

		public void DeleteMark(int id)
		{
			Mark mark = _Context.Marks.SingleOrDefault(s => s.ID == id);
			if (mark != null)
			{
				_Context.Marks.Remove(mark);
				_Context.SaveChanges();
			}
			else {
				throw new ApplicationException("Cannot find the marks.");
			}
		}

		public void EditMark(float physics,float chemistry, float mathematics, float computing, float english, int ID)
		{

			
			Mark mark = _Context.Marks.SingleOrDefault(s => s.ID == ID);
			if (mark != null)
			{
				mark.Physics = physics;
				mark.Chemistry = chemistry;
				mark.Mathematics = mathematics;
				mark.Computing = computing;
				mark.English = english;
				_Context.SaveChanges();
			}
			else
			{
				throw new ApplicationException("Cannot find the marks.");
			}
		}
			
	}
}
