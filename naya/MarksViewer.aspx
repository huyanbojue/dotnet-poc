<%@ Page Title="" Language="C#" MasterPageFile="~/Print.Master" AutoEventWireup="true" CodeBehind="MarksViewer.aspx.cs" Inherits="naya.MarksViewer" %>
<asp:Content id="head" ContentPlaceHolderID="StyleSection" runat="server">
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/fixedheader/3.1.2/css/fixedHeader.dataTables.min.css">
	<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />

	<style>
		.ui-dialog
{
    z-index: 101;
}
		.fail {
    background-color: #f46e42 !important;
}

		.pass {
    background-color: #a7f442 !important;
}
		.GridViewEditRow input[type=text] {width:70px;} /* size textboxes */
	</style>
</asp:Content>

	<asp:Content id="link" ContentPlaceHolderID="LinkSection" runat="server">
		<ul class="nav navbar-nav">
		<li><a href="StudentViewer.aspx">Students</a></li>
        <li class="active"><a href="MarksViewer.aspx">Marks</a></li>
           
		</ul>

</asp:Content>

<asp:Content id="body" ContentPlaceHolderID="ContentSection" runat="server">

		<form runat="server">
<asp:GridView ID="MarksGridView" runat="server" DataKeyNames="ID" AutoGenerateColumns="false"
         AllowSorting="true"   DataSourceID="ObjectDataSourceMarks" AllowPaging="true" CssClass="gvv" HeaderStyle-BackColor="CornflowerBlue" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" >
              <EditRowStyle CssClass="GridViewEditRow" /> 
			<Columns>

				<asp:TemplateField HeaderText="Roll No">
  <ItemTemplate>
      <asp:Label ID="RollNo" runat="server" Text='<%# Eval("Students.RollNo") %>' ></asp:Label>
  </ItemTemplate>
</asp:TemplateField>
				
					<asp:TemplateField HeaderText="First Name">
  <ItemTemplate>
      <asp:Label ID="FirstName" runat="server" Text='<%# Eval("Students.FirstName") %>' ></asp:Label>
  </ItemTemplate>
</asp:TemplateField>
					<asp:TemplateField HeaderText="LastName">
  <ItemTemplate>
      <asp:Label ID="LastName" runat="server" Text='<%# Eval("Students.LastName") %>' ></asp:Label>
  </ItemTemplate>
</asp:TemplateField>
   <asp:BoundField DataField="Physics" HeaderText="Physics" 
                    SortExpression="Physics" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
			
				<asp:BoundField DataField="Chemistry" HeaderText="Chemistry" 
                    SortExpression="Chemistry" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
			
                <asp:BoundField DataField="Mathematics" HeaderText="Mathematics" 
                    SortExpression="Mathematics" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
						
                <asp:BoundField DataField="Computing" HeaderText="Computing" 
                    SortExpression="Computing" ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top"/>
                <asp:BoundField DataField="English" HeaderText="English" 
                  SortExpression="English"   ItemStyle-Width="10%" ItemStyle-VerticalAlign="Top" />
				
				  <asp:TemplateField ShowHeader="True" HeaderText="Actions"  ItemStyle-Width="15%" >

					<EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update"  CSSClass="btn btn-default"></asp:LinkButton>
                        <asp:LinkButton ID="LnkCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel"  CSSClass="btn btn-default"></asp:LinkButton>
                    </EditItemTemplate>

					
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit"
                            Text='Edit'  CSSClass="btn btn-default"></asp:LinkButton>
						 <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete"
                            Text='Delete'  CSSClass="btn btn-default"></asp:LinkButton>
					</ItemTemplate>

					
                </asp:TemplateField>
               
            </Columns>
				</asp:GridView>
			<asp:ObjectDataSource ID="ObjectDataSourceMarks" runat="server" SelectMethod="GetStudentsMarks" 
     DeleteMethod="DeleteMark" UpdateMethod="EditMark" TypeName="naya.Models.StudentMarkRepository">
			</asp:ObjectDataSource>

	

</form>
	
</asp:Content>
<asp:Content id="script" ContentPlaceHolderID="ScriptSection" runat="server">

	 <script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/fixedheader/3.1.2/js/dataTables.fixedHeader.min.js"></script>
<script>

			$(document).ready( function () {
		
			var searchQuery;
    var oTable = $(".gvv").prepend( $("<thead></thead>").append( $(this).find("tr:first") ) ).dataTable({
		"aaSorting": [],
		fixedHeader: {
            header: true,
            footer: true
        }
		
		});


		$('<button ID="btnShowAll" class="btn btn-default" style="padding: 5px 10px;  display: inline-block; margin:7px; height:30px" >Show All</button>').appendTo('div.dataTables_filter');

		$("#btnShowAll").click(function() {
    oTable.fnFilter('', 0);
		 oTable.fnFilter('');
		window.location.href =  "MarksViewer.aspx";
		return false;
	});

		
		var queryParam = getUrlVars();
			
		if (queryParam.roll){
			searchQuery = queryParam.roll;
			oTable.fnFilter("^"+searchQuery+"$", 0, true, false);
		}else{
			
		}




		console.log(searchQuery);

		function addColorToCells(){
							oTable.api().rows({search: 'applied'}).every( function ( rowIdx, tableLoop, rowLoop ) {
 
										    var rowNode = this.node();
										   var cell;
										                  for (var i=3; i<8; i++){
		
		cell = oTable.api().cell({ row: rowIdx, column: i }).node();
		cell_data = $(cell).text();
		if (cell_data >= 50){
								$(cell).addClass('pass');
		}
		else{
							        $(cell).addClass('fail'); 
		}
		}
									    			
										         
										       
										});

		}

		function removeColorFromCells(){
			oTable.api().rows({search: 'applied'}).every( function ( rowIdx, tableLoop, rowLoop ) {
 
										    var rowNode = this.node();
		var cell;

										                  for (var i=3; i<8; i++){
		
		cell = oTable.api().cell({ row: rowIdx, column: i }).node();
							        $(cell).removeClass('pass'); 
									$(cell).removeClass('fail'); 
		}
									    			
										         
										       
										});  
		
		}

		var visible_rows = oTable.fnSettings().fnRecordsDisplay();
		if (visible_rows == 1){
			addColorToCells();
		}else{
			removeColorFromCells();
		}
		
		oTable.on( 'search.dt', function () {
    	var visible_rows = oTable.fnSettings().fnRecordsDisplay();
	
		if (visible_rows == 1){

			addColorToCells();
				
		
		}else{

			removeColorFromCells();
		 		             
		}
			
		});
		


		
});

	
		function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}
</script>
</asp:Content>