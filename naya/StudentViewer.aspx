<%@ Page Title="" Language="C#" MasterPageFile="~/Print.Master" AutoEventWireup="true" CodeBehind="StudentViewer.aspx.cs" Inherits="naya.StudentViewer" %>
<asp:Content id="head" ContentPlaceHolderID="StyleSection" runat="server">
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/fixedheader/3.1.2/css/fixedHeader.dataTables.min.css">
	<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />
	<style>
	.ui-dialog
{
    z-index: 101;
}


		.GridViewEditRow input[type=text] {width:92px;} /* size textboxes */
	</style>
</asp:Content>
		<asp:Content id="link" ContentPlaceHolderID="LinkSection" runat="server">
		<ul class="nav navbar-nav">
	<li class="active"><a href="StudentViewer.aspx">Students</a></li>
              <li><a href="MarksViewer.aspx">Marks</a></li>
        
		</ul>
	 <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="" onclick="return showStudentsDialog()">Add Student<span class="sr-only">(current)</span></a></li>
            </ul>
</asp:Content>
<asp:Content id="body" ContentPlaceHolderID="ContentSection" runat="server">
	<form runat="server">

		
<asp:GridView ID="StudentsGridView" RowStyle-Wrap="true" AutoGenerateColumns="false"  AllowPaging="true" DataSourceID="ObjectDataSource1" 
 CssClass="gvv" runat="server" DataKeyNames="ID" HeaderStyle-BackColor="CornflowerBlue" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
 <EditRowStyle CssClass="GridViewEditRow" /> 
			<Columns>

				<asp:BoundField DataField="RollNo" HeaderText="Roll No" 
                    SortExpression="RollNo" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
			
                <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                    SortExpression="FirstName" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
						
                <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                    SortExpression="LastName" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
                <asp:BoundField DataField="Class" HeaderText="Class" 
                  SortExpression="Class"   ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top" />
					   <asp:BoundField DataField="Section" HeaderText="Section" 
                    SortExpression="Section" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>

				  <asp:TemplateField ShowHeader="True" HeaderText="Actions"  ItemStyle-Width="15%" >
<EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update"  CSSClass="btn btn-default"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel"  CSSClass="btn btn-default"></asp:LinkButton>
                    </EditItemTemplate>

					
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit"
                            Text='Edit'  CSSClass="btn btn-default"></asp:LinkButton>
						 <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete"
                            Text='Delete'  CSSClass="btn btn-default"></asp:LinkButton>
							 <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False"
                            Text='View Marks'  CSSClass="btn btn-default" href='<%# "MarksViewer.aspx?roll=" + Eval("RollNo") %>' Visible='<%# Convert.ToInt32(Eval("Marks.ID")) != 0 %>'></asp:LinkButton>
                             <asp:LinkButton ID="LinkButton6" runat="server" CausesValidation="False"
                            Text="Insert Marks" CSSClass="btn btn-default" OnClientClick='<%# "return showMarksDialog("+ Eval("ID") + "," + Eval("RollNo") + ");" %>' CommandName="AddMarks" Visible='<%# Convert.ToInt32(Eval("Marks.ID")) == 0 %>'></asp:LinkButton>

					</ItemTemplate>

					
                </asp:TemplateField>

            </Columns>
				
			</asp:GridView>
      <asp:ObjectDataSource ID="ObjectDataSource1" TypeName="naya.Models.StudentMarkRepository" SelectMethod="GetStudents" 
     DeleteMethod="DeleteStudent" UpdateMethod="EditStudent" runat="server"></asp:ObjectDataSource>

	
<div id="studentDialog" style="display: none">
			 <h1>Add New</h1>
    <table>
		<tr>
            <td>Roll No</td>
            <td><asp:TextBox ID="tbRollNo" runat="server" /></td>
        </tr>
        <tr>
            <td>First Name</td>
            <td><asp:TextBox ID="tbFirstName" runat="server" /></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><asp:TextBox ID="tbLastName" runat="server" /></td>
        </tr>
        <tr>
            <td>Class</td>
            <td><asp:TextBox ID="tbClass" runat="server" /></td>
        </tr>
        <tr>
				
            <td>Section</td>
            <td><asp:TextBox ID="tbSection" runat="server" /></td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblMessage" runat="server" />
    <br />

  <asp:Button ID="btnAddStudent" runat="server" Text="Add" OnClick="btnAddStudent_Click" />
  </div>
  <div>
		</div>
		<div id="marksDialog" style="display: none">
			 <h1>Insert Marks
			</h1>
    <table>
				<tr>
					 <td>Roll No: </td>
					<td><asp:TextBox id="tbDisabledRoll" runat="server" ReadOnly="true"/></td>
				<td><asp:HiddenField ID="tbHiddenId" runat="server" /></td>
				</tr>
		<tr>
            <td>Physics</td>
            <td><asp:TextBox ID="tbPhysics" runat="server" /></td>
        </tr>
        <tr>
            <td>Chemistry</td>
            <td><asp:TextBox ID="tbChemistry" runat="server" /></td>
        </tr>
        <tr>
            <td>Mathematics</td>
            <td><asp:TextBox ID="tbMathematics" runat="server" /></td>
        </tr>
        <tr>
            <td>Computing</td>
            <td><asp:TextBox ID="tbComputing" runat="server" /></td>
        </tr>
		<tr>
            <td>English</td>
            <td><asp:TextBox ID="tbEnglish" runat="server" /></td>
        </tr>
    </table>
    <asp:Button ID="btnAddMarks" runat="server" Text="Add" OnClick="btnAddMarks_Click"/>
			</div>

			</form>

</asp:Content>

<asp:Content id="script" ContentPlaceHolderID="ScriptSection" runat="server">
	
 <script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/fixedheader/3.1.2/js/dataTables.fixedHeader.min.js"></script>

	<script>
		$(document).ready( function () {

		
    var dtable = $(".gvv").prepend( $("<thead></thead>").append( $(this).find("tr:first") ) ).dataTable({
		"aaSorting": [],
		fixedHeader: {
            header: true,
            footer: true
        }
		});
			$('<button ID="btnShowAllItems" class="btn btn-default" style="padding: 5px 10px;  display: inline-block; margin:7px; height:30px" >Show All</button>').appendTo('div.dataTables_filter');

		$("#btnShowAllItems").click(function() {
    
		 oTable.fnFilter('');
		 return false;
	});


});

	
		
		  function showStudentsDialog() {
            $("#studentDialog").dialog({
                title: "Student Details", 
                modal: true,
				
		   open: function(type, data) { $(this).parent().appendTo("form");  },
                close: function (type, data) { ($(this).parent().replaceWith("")); }
        });
 			return false;
        }

			  function showMarksDialog(id, roll) {
		$("#<%=tbHiddenId.ClientID%>").val(id);
		$("#<%=tbDisabledRoll.ClientID%>").val(roll);
            $("#marksDialog").dialog({
                title: "Marks", 
                modal: true,
				
		   open: function(type, data) { $(this).parent().appendTo("form");  },
                close: function (type, data) { ($(this).parent().replaceWith("")); }
        });
 		 return false;
        }



	</script>
</asp:Content>