<%
 dim dbconnect 
 set dbconnect=Server.createObject("ADODB.connection")
if Session.contents("role") <> "auteur" then
	response.redirect "index.asp"
end if
 'dbconnect.open="Provider= Microsoft.ACE.OLEDB.12.0;data source=C:\inetpub\wwwroot\E-book\db\E-Book.accdb"
 dbconnect.open="DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost;charset=utf8;DATABASE=e-book; UID=root;PASSWORD=;OPTION=3"
 set dbrecordset=Server.createObject("ADODB.recordset")
%>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<style type="text/css">
		@import 'css/style.css';
	</style>
	 <script src="/E-book/script/jquery.min.js"></script>
	 <script src="/E-book/script/script.js"></script>
</head>
<body>
	<div id="login">

		 <header>Se connecter</header>
		 <section>
		<form id="login_f">
		 	<input type="email" name="email" id="email_login" class="input user" placeholder="Entrer votre E-mail">
		 	<input type="password" name="password" id="password_login" class="input lock" placeholder="Entrer votre mot de passe">
		 </section>
		 <footer>
		 	<button class="btn" id="x-login">Anuuler</button>
		 	<input type="submit" class="btn btn-active" value="Se connecter">
		 </footer>
		</form>
	</div>
	<div id="signup">
		 <header>S'inscrire</header>
		 <section>
		 	<form id="signup-f">
		 	<table width="100%">
		 		<tr>
		 			<td><input type="text" id="nom" name="nom" class="input" placeholder="Nom"></td>
		 			<td><input type="text" id="prenom" name="prenom" class="input" placeholder="Prénom"></td>
		 		</tr> 
		 		<tr>
		 			<td colspan="2"><input id="email" type="email" name="email" class="input mail" placeholder="Adresse électronique"></td>
		 		</tr>	
			 	<tr>
		 			<td colspan="2"><input id="password" type="password" name="password" class="input lock" placeholder="Mot de passe"></td>
		 		</tr>
				<tr>
		 			<td colspan="2"><input  id="passwordr" type="password" name="passwordr" class="input lock" placeholder="Retapper mot de passe"></td>
		 		</tr>
				<tr>
		 			<td colspan="2"><input name="date_n" id="date" type="date" class="input" placeholder="Date de naissance"></td>
		 		</tr>		 			 			 			 		
		 	</table>
		 </section>
		 <footer>
		 	<input type="reset" class="btn" id="x-signup">
		 	<input type="submit" id="signup-btn" class="btn btn-active" value="S'inscrire" >
		 </footer>
		 </form>
	</div>	
	<div id="top-mini">
		<div id="menu">
			<div id="logo-mini">
				<img src="img/logo.png" >
			</div>
                <input autofocus="" name="q" id="inputField" type="text" class="query" autocomplete="off"><button id="searchbutton" type="submit">Search</button>
            	<item>
				<% if Session.contents("nom") <> "" then %>
					<a href="profile.asp"><%=Session.contents("nom") & " " & Session.contents("prenom") %></a>
					| <a href="logout.asp">Déconnecter</a>
				<% else %>
				<span id="btn-login"> Se connecter</span> | <span id="btn-signup">S'inscrire</span>
				<% end if %>
				 </item>
		</div>
	</div> 
	</div> 
	<div id="categories">
	<div class="container">
		<% 
		if request.form("ajouter") <> "" then
			etat = true
			if request.form("titre") = "" then
				etat=false
				msg_titre="<span class='error'>ce champ doit être obligatoire</span>"
			end if
			if request.form("ISBN") = "" then
				etat=false

				msg_isbn="<span class='error'>ce champ doit être obligatoire</span>"
			end if		
			if request.form("version") = "" then
				etat=false

				msg_version="<span class='error'>ce champ doit être obligatoire</span>"
			end if		
			if request.form("Desciption") = "" then
				etat=false
				msg_Desciption="<span class='error'>ce champ doit être obligatoire</span>"
			end if	
			if etat=true then
				Response.Cookies("livre")("titre")=request.form("titre")
				Response.Cookies("livre")("titre")=request.form("titre")
				Response.Cookies("livre")("ISBN")=request.form("ISBN")
				Response.Cookies("livre")("version")=request.form("version")
				Response.Cookies("livre")("Desciption")=request.form("Desciption")
				Response.Cookies("livre")("Tags")=request.form("Tags")
				Response.Cookies("livre")("Categorie")=request.form("Categorie")
				Response.redirect "ajouter.asp"
			end if		
		end if
		 %>
	</div>
	</div>
	<div id="body">
		<div class="container">
			<FORM METHOD="POST">
				<table width="100%">
					<tr>
						<td><label for="titre">Le titre</label></td>
						<td><INPUT  value="<%=request.form("titre")%>" class='input' TYPE="text" id="titre" NAME="titre"></td>
						<td align="center"><%=msg_titre %></td>
					</tr>
					<tr>
						<td><label for="ISBN">ISBN</label></td>
						<td><INPUT  value="<%=request.form("ISBN")%>" class='input' TYPE="text" id="ISBN" NAME="ISBN"></td>
						<td align="center"><%=msg_isbn %></td>
					</tr>
					<tr>
						<td><label for="version">version</label></td>
						<td><INPUT  value="<%=request.form("version")%>"class='input' TYPE="text" id="version" NAME="version"></td>
						<td align="center"><%=msg_version %></td>
					</tr>
					<tr>
						<td valign="top"><label for="Desciption">Désciption</label></td>
						<td><textarea rows="15" class='input'  style="height:200px"TYPE="text" id="Desciption" NAME="Desciption"><%=request.form("Desciption")%></textarea></td>
						<td align="center"><%=msg_Desciption %></td>
					</tr>												
					<tr>
						<td><label for="Categorie">Catégorie</label></td>
						<td>
							<select class='input' id="Categorie" name="Categorie">
							<%
							dim dbcategorie
				   			set dbcategorie=Server.createObject("ADODB.recordset")
				    		dbcategorie.open "select * from categories",dbconnect
				    		do while not dbcategorie.EOF%>
							<option value="<%=dbcategorie("id") %>" class="categorie"><%=dbcategorie("libelle")%></option>
				    		<% 
				    		dbcategorie.Movenext
				    		loop
				    		set dbcategorie = nothing
				    		%>
							</select>
						</td>
						<td></td>
					</tr>									
					<tr>
						<td><label for="Tags">Tags</label></td>
						<td><INPUT  value="<%=request.form("Tags")%>" class='input' TYPE="text" id="Tags" NAME="Tags"></td>
						<td align="center">Ex : POO,Programmation,boocle</td>
					</tr>
					<tr>
						<td><label for="Tags">Tags</label></td>
						<td><INPUT  TYPE='reset' class="btn"><INPUT TYPE=SUBMIT class="btn btn-active" VALUE="Ajouter" name="ajouter"></td>>
					</tr>
				</table>
			</FORM>
		</div>
	</div>
	<footer id="footer">
		<div class="container">

		</div>
	</footer>
	</body>
</html>
<% set dbconnect=nothing %>