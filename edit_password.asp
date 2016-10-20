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
			id = 23
			dim objrecordset
			set objrecordset = Server.CreateObject("ADODB.Recordset")
			objrecordset.open "SELECT * FROM membres WHERE id='"& id &"'", dbconnect
            if request.form("submit") <> "" then
				etat = false
				if not request.form("password") <> "" then
					etat = true
					msg_password = "<span class='error'>Remplir le champ svp !</span>"
				else
					if request.form("password") <> objrecordset("password") then
						etat = true
						msg_pass = "<span class='error'>Mot de passe invalid !</span>"
					else
						if  len(request.form("npassword")) <= 10 or len(request.form("cpassword")) <= 10  then
							etat = true
							msg_ncpassword = "<span class='error'>Remplir les champs svp !</span>"
						else
							if  request.form("npassword") <> request.form("cpassword") then
								etat = true
								msg_confirm = "<span class='error'>Les deux mots de passe ne correspond pas !</span>"
							end if
						end if
				end if
				end if
				if etat <> true then
					dim objrecordset1
					set objrecordset1 = Server.CreateObject("ADODB.Recordset")
					objrecordset1.open "UPDATE membres set password='"& request.form("npassword") &"' WHERE id='"& id &"' ", dbconnect
					msg_modif = "<p align='center'><font color='blue'>Bien modifier !</font></p>"
				end if
			end if
		%>
		<form method="POST">
			<table width="70%">
				<tr>
					<td>Mot de passe actuel</td>
					<td width="50%"><input class="input" type="password" name="password" value="<%=request.form("password")%>" /></td><td width="30%"><%=msg_password%><%=msg_pass%></td>
				</tr>
				<tr>
					<td>Nouveau mot de passe</td>
					<td><input class="input" type="password" name="npassword" value="<%=request.form("npassword")%>"  /></td><td></td>
				</tr>
				<tr>
					<td>Confirmer</td>
					<td><input class="input" type="password" name="cpassword" value="<%=request.form("cpassword")%>"  /></td><td></td>
				</tr>
				<tr>
					<td></td>
					<td align="center" colspan="2"><input type="submit" class="btn btn-active" name="submit" value="Valider" /><%=msg_ncpassword%><%=msg_confirm%><%=msg_modif%></td>
					<td></td>
				</tr>
			</table>
		</form>
				</div>
	</div>
	<!--#include file="include\footer.asp"-->