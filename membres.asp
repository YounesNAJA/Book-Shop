<!--#include file = "include/top.asp"-->
<div id="categories">
		<div class="container">
			<%
			dim dbcategorie
   			set dbcategorie=Server.createObject("ADODB.recordset")
    		dbcategorie.open "select * from categories",dbconnect
    		do while not dbcategorie.EOF%>
				<a href="index.asp" rel="<%=dbcategorie("id") %>" class="categorie"><%=dbcategorie("libelle") %></a>
    		<% 
    		dbcategorie.Movenext
    		loop
    		set dbcategorie = nothing
    		%>
		</div>
	</div>
	<div id="body">
		<div class="container">
<%
	if request.querystring("id") <> "" then
		dim objRecordset1
		set objRecordset1 = Server.CreateObject("ADODB.Recordset")
		objRecordset1.open "DELETE FROM membres WHERE id="&request.querystring("id"), dbconnect
	end if
%>
<html>
<head>
<meta charset="utf-8" />
<title>Liste des membres</title>
</head>
<body>
<%
	dim objRecordset
	set objRecordset = Server.CreateObject("ADODB.Recordset")
	objRecordset.open"SELECT * FROM membres", dbconnect
%>
<table border="1" rules="all" width="100%"  align="center">
	<tr>
		<th>Nom</th>
		<th>Prénom</th>
		<th>Sexe</th>
		<th>Date de naissance</th>
		<th>Email</th>
		<th>Rôle</th>
		<th>Date de création</th>
		<th>Modification</th>
		<th>Suppression</th>
	</tr>
	<%do while not objRecordset.EOF%>
		<tr height="50px">
			<td align="center"><%=objRecordset("nom")%></td>
			<td align="center"><%=objRecordset("prenom")%></td>
			<td align="center"><%=objRecordset("sexe")%></td>
			<td align="center"><%=objRecordset("date_n")%></td>
			<td align="center"><%=objRecordset("email")%></td>
			<td align="center"><%=objRecordset("role")%></td>
			<td align="center"><%=objRecordset("created")%></td>
			<td align="center"><a href="modifier.asp?id=<%=objRecordset("id")%>">Modifier</a></td>
			<td align="center"><a class="seletememebre" href="membres.asp?id=<%=objRecordset("id")%>">Supprimer</a></td>
		</tr> 
		<%objRecordset.MoveNext
			loop%>
		</table>
		</div>
	</div>
	<!--#include file="include\footer.asp"-->