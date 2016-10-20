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
			id = 22
			dim objrecordset
			set objrecordset = Server.CreateObject("ADODB.Recordset")
			objrecordset.open "SELECT * FROM membres WHERE id='"& id &"'", dbconnect
			if request.form("submit") <> "" then
				etat = false
				if not request.form("nom") <> "" then
					etat = true
					msg_nom = "<spam class='error'>Chmp obligatoire</spam>"
				end if
				if not request.form("prenom") <> "" then
					etat = true
					msg_prenom = "<spam class='error'>Chmp obligatoire</spam>"
				end if
				if not request.form("date_n") <> "" then
					etat = true
					msg_date = "<spam class='error'>Chmp obligatoire</spam>"
				end if
				if not request.form("sexe") <> "" then
					etat = true
					msg_sexe = "<spam class='error'>Chmp obligatoire</spam>"
				end if
				if etat <> true then
					dim objrecordset1
					set objrecordset1 = Server.CreateObject("ADODB.Recordset")
					objrecordset1.open "UPDATE membres set nom='"& request.form("nom") &"', prenom='"& request.form("prenom") &"', date_n='"& request.form("date_n") &"', sexe='"& request.form("sexe") &"' WHERE id='"& id &"'", dbconnect
				 	%>
					<div class="msgdiv">
						<img class="Ok" src="img/Ok.png">
						<span class="Okmsg">
							Opération effectuée avec succès !
						</span>
					</div>
				 	<%
				end if
			end if
		%>
		<form method="POST">
			<table width="70%">
				<tr>
					<td width="10%">Nom</td>
					<td width="50%"><input type="text" class="input"  name="nom" value="<%=objrecordset("nom")%>" /></td><td width="30%"><%=msg_nom%></td>
				</tr>
				<tr>
					<td>Prénom</td>
					<td><input type="text"  class="input" name="prenom" value="<%=objrecordset("prenom")%>" /></td><td><%=msg_prenom%></td>
				</tr>
				<tr>
					<td>Sexe</td>
					<td><input type="radio"  name="sexe" value="M" 
						<% if objrecordset("sexe") = "M" then %>
							checked
						<%end if%>
						/>M
						<input type="radio"  name="sexe" value="F" 
						<% if objrecordset("sexe") = "F" then %>
							checked
						<%end if%>
						 />F</td><td><%=msg_sexe%></td>
				</tr>
				<tr>
					<td>Date de naissance</td>
					<td><input type="text" class="input" name="date_n" value="<%=objrecordset("date_n")%>" /></td><td><%=msg_date%></td>
				</tr>
				<tr>
					<td></td>
					<td><input class="btn " type="reset"   />
					<input class="btn btn-active" type="submit" name="submit" value="Valider" /></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<!--#include file="include\footer.asp"-->