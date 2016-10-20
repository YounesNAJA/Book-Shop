<%
If  Request.Cookies("livre")("titre")="" Then
	response.redirect "ajouter1.asp"
end if 
if Session("role") <> "auteur" then
	response.redirect "index.asp"
end if
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
<!-- #include file ="upload.asp" -->
<%
Dim Uploader, File
Set Uploader = New FileUploader
Uploader.Upload()



If Uploader.Files.Count = 0 Then
	Response.Write "Aucun fichier uploader !!"
Else
	idImage=0
	i=0
	For Each File In Uploader.Files.Items
	
		if i=0 then
			if File.ContentType="image/jpeg" or File.ContentType="image/png" then
			File.SaveToDisk "C:\inetpub\wwwroot\E-book\files\images"
			dim dbrecordsetimg 
			set dbrecordsetimg=Server.createObject("ADODB.recordset")
			dbrecordsetimg.open "insert into images(url) values('files/images/"& File.FileName &"') ;" ,dbconnect
			set getID = server.CreateObject("adodb.recordset")  
			getID.activeconnection = dbconnect  
			getID.source = "select @@IDENTITY as NewID from images"  
			getID.Open  
			for each x in getID.fields  
				idImage=x.value
			next
			set getID=nothing
			set dbrecordsetimg=nothing
			else
				msg_img="<span class='error'>Image non  JPG , PNG , JPEG )"
			end if
		end if
		if i=1 then
			if File.ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document" or File.ContentType ="application/pdf" then
				File.SaveToDisk "C:\inetpub\wwwroot\E-book\files\fichiers"
				filename="files/fichiers/"&File.FileName 

			else
				msg_fichier="<span class='error'>Type de fichier PDF,DOCX"
			end if
		end if

			titre=Request.Cookies("livre")("titre")
			isbn=Request.Cookies("livre")("isbn")
			Desciption=Request.Cookies("livre")("Desciption")
			categorie=Request.Cookies("livre")("categorie")
			Tags=Request.Cookies("livre")("Tags")
			version=Request.Cookies("livre")("version")

		'Response.Write "File Uploaded: " & File.FileName & "<br>"
		'Response.Write "Size: " & File.FileSize & " bytes<br>"
		'Response.Write "Type: " & File.ContentType & "<br><br>"
		i=i+1
	Next
	if msg_img="" and msg_fichier="" then
				sql = "insert into livres(titre,ISBN,tags,slug,version,membre_id,categorie_id,image_id,description,lien) values('"& titre &"','"& isbn & "','"& Tags &"','"& Replace(titre," ","_") &"','"& version &"','"&  Session.contents("id") &"','"& categorie &"','"& idImage &"','"& Desciption &"','"& filename &"')"

			dim dbrecordsetfile 
			set dbrecordsetfile=Server.createObject("ADODB.recordset")
			dbrecordsetfile.open sql , dbconnect
			set getidfile = server.CreateObject("adodb.recordset")  
			getidfile.activeconnection = dbconnect  
			getidfile.source = "select @@IDENTITY as NewID from livres"  
			getidfile.Open  
			for each x in getidfile.fields  
				idFile=x.value
			next
			set getidfile=nothing
			set dbrecordsetfile=nothing
For Each cookie in Response.Cookies
    Response.Cookies(cookie).Expires = DateAdd("d",-1,now())
Next
			%>
			<div class="msgdiv">
	<img class="Ok" src="img/Ok.png">
	<span class="Okmsg">
		Opération effectuée avec succès !
	</span>
</div>
			<%
	end if
End If
%>
	</div>
	</div>
	<div id="body">
		<div class="container">
			<FORM METHOD="POST" ENCTYPE="multipart/form-data" >
				<table  width=100%>									
					<tr>
						<td><label  for="image">L'image de garde</label></td>
						<td><INPUT class='input' TYPE="FILE" id="image" NAME="image">
						</td>
						<td><%=msg_img%></td>
						<td rowspan="2" align=center>  <INPUT class="btn btn-active"TYPE=SUBMIT VALUE="Upload!"></td>
					</tr>
					<tr>
						<td><label for="fichier">Le fichier</label></td>
						<td><INPUT class='input' TYPE=FILE SIZE=50 id="fichier" NAME="fichier"></td>
						<td><%=msg_fichier%></td>
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