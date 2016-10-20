<%
 dim dbconnect 
 set dbconnect=Server.createObject("ADODB.connection")

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
	<div id="top">
		<div id="menu">
			<item><a href="index.asp">Browse Livre</a></item>
			<item>
				<% if Session.contents("nom") <> "" then %>
					<a href="profile.asp"><%=Session.contents("nom") & " " & Session.contents("prenom") %></a>
					| <a href="logout.asp">Déconnecter</a>
				<% else %>
				<span id="btn-login"> Se connecter</span> | <span id="btn-signup">S'inscrire</span>
				<% end if %>
				 </item>
		</div>
		<div class="center">
			<div id="logo">
				<img src="img/logo.png">
			</div>
			<div>
                <input autofocus="" name="q" id="inputField" type="text" class="query" autocomplete="off"><button id="searchbutton" type="submit">Search</button>
            </div>
		</div>
	</div> 
	</div> 
