using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using naya.Models;

namespace naya
{
	public partial class StudentViewer : System.Web.UI.Page
{

		private void InsertStudent(int rollNo, string firstName, string lastName, string ClassName, String section)
		{
			StudentMarkRepository student = new StudentMarkRepository();
			student.AddStudent(rollNo, firstName, lastName, ClassName, section);

		}

	
		public void btnAddStudent_Click(object sender, EventArgs args)
		{
			InsertStudent(Int32.Parse(tbRollNo.Text),
						  tbFirstName.Text,
						  tbLastName.Text,
						  tbClass.Text,
						  tbSection.Text);

			Response.Redirect("StudentViewer.aspx");

		}

		public void btnAddMarks_Click(object sender, EventArgs args)
		{

			InsertMarks(Int32.Parse(tbHiddenId.Value),
						float.Parse(tbPhysics.Text),
						float.Parse(tbChemistry.Text),
						float.Parse(tbMathematics.Text),
						float.Parse(tbComputing.Text),
						float.Parse(tbEnglish.Text));
			Response.Redirect("MarksViewer.aspx?roll="+ Int32.Parse(tbDisabledRoll.Text));
		}

		public void InsertMarks(int Id, float physics, float chemistry, float mathematics, float computing, float english) {
			StudentMarkRepository marks = new StudentMarkRepository();
			marks.AddMark(Id, physics, chemistry, mathematics, computing, english);
			
			}

	}
}
