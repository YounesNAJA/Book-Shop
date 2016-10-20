<!--#INCLUDE FILE = "include\top.asp"-->
<%
	dim objRecordset
	set objRecordset = Server.CreateObject("ADODB.Recordset")
	objRecordset.open"SELECT * FROM membres WHERE id=27", dbconnect
	do	while not objRecordset.EOF
			%>
				<div id="body">
					<div class="container">
						<div class="body3">
							<table align="center"  width="100%">
	
								<tr>
									<td colspan="2"  width="50%"><h1><%=objRecordset("nom") &" "& objRecordset("prenom")%></h1></td>
								</tr>
								<tr>
									<td><span class="pro">prenom : </span></td>
									<td><i><span class="value"><%=objRecordset("prenom")%></span></i></td>
								</tr>	
								<tr>
									<td><span class="pro">nom : </span></td>
									<td><i><span class="value"><%=objRecordset("nom")%></span></i></td>
								</tr>								
								<tr>
									<td><span class="pro">Date de naissance : </span></td>
									<td><i><span class="value"><%=objRecordset("date_n")%></span></i></td>
								</tr>
								<tr>
									<td><span class="pro">E-mail : </span> </td>
									<td><i><span class="value"><%=objRecordset("email")%></span></i></td>
								</tr>
								<tr>
									<td><span class="pro">Date de creation : </span></td>
									<td><i><span class="value"><%=objRecordset("created")%></span></i></td>
								</tr>
							</table>
							<% objRecordset.moveNext
							loop
							 %>
						</div>
						<div class='body4'>
							<!--#include file="menu.asp"-->
						</div>
 		</div>
	</div>
	<!--#include file="include\footer.asp"-->