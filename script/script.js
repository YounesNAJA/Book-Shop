$(function(){
	$("#btn-login,#x-login").click(function() {
		$('#login').fadeToggle();
	})
	$("#btn-signup,#x-signup").click(function() {
		$('#signup').fadeToggle();
	})
	$("#signup-f").submit(function() {
		var etat=true;
		if ($('#nom').val()=="") {
			$('#nom').css({'border':'1px solid red'});
			var etat=false;
		}else{
			$('#nom').css({'border':'1px solid green'});
		}
		if ($('#prenom').val()=="") {
			var etat=false;
			$('#prenom').css({'border':'1px solid red'});
		}else{
			$('#prenom').css({'border':'1px solid green'});
		}
		if ($('#email').val()=="") {
			var etat=false;
			$('#email').css({'border':'1px solid red'});
		}else{
			$('#email').css({'border':'1px solid green'});
		}	
		if ($('#passwordr').val()!=$('#password').val()) {
			var etat=false;
			$('#passwordr').css({'border':'1px solid red'});
			$('#password').css({'border':'1px solid red'});

		}else{
			if ($('#password').val().length<10) {
				var etat=false;
				$('#password').css({'border':'1px solid red'});
			}else{
				$('#password').css({'border':'1px solid green'});
			}
			if ($('#passwordr').val().length<10) {
				var etat=false;
				$('#passwordr').css({'border':'1px solid red'});
			}else{
				$('#passwordr').css({'border':'1px solid green'});
			}
		}
		if ($('#date').val()=="") {
			var etat=false;
			$('#date').css({'border':'1px solid red'});
		}else{
			$('#date').css({'border':'1px solid green'});
		}
		if (etat==true) {
			var data=$("#signup-f").serialize();
			
			$.ajax({
				'type':"POST",
				'url':'include/adduser.asp',
				'data':data,
				success:function(dr){

					if(dr=="ok"){
						location.reload();
					}else{
						alert("Erreur -- Données inccorect --");
					}
				},
				statusCode:{
					404:function(){
						alert("Erreur -- 404 --");
					}
				}
			});
		};				
		return false;	
	});
	$("#login_f").submit(function() {
		var etat=true;
		if ($('#email_login').val()=="") {
			$('#email_login').css({'border':'1px solid red'});
			var etat=false;
		}else{
			$('#email_login').css({'border':'1px solid green'});
		}
		if ($('#password_login').val()=="") {
			var etat=false;
			$('#password_login').css({'border':'1px solid red'});
		}else{
			$('#password_login').css({'border':'1px solid green'});
		}
		if (etat==true) {
			var data=$("#login_f").serialize();
		
			$.ajax({
				'type':"POST",
				'url':'include/connect.asp',
				'data':data,
				success:function(dr){
					if(dr=="ok"){
						location.reload();
					}else{
						alert("Erreur -- Données inccorect --");
					}
				},
				statusCode:{
					404:function(){
						alert("Erreur -- 404 --");
					}
				}
			});
		};				
		return false;	
	});
	$(".categorie").click(function() {
		$("#body>.container").html("<div id=\"loader\"></div>");
		var data="idcat="+$(this).attr('rel');
		$.ajax({
			'type':'POST',
			'url':"include/getlivrebycat.asp",
			'data':data,
			success:function(dr) {
				$("#body>.container").html(dr);
			}
		});
		return false;
	});
	$('.seletememebre').click(function(){
		var res=confirm("supprimer le membres ?");
		if (res) {

		}else{
			return false;
		}
	});
});
	function showplus(ths) {
		$(ths).html('Chargement...');
		var data="lastid="+$(ths).attr('rel');
		$.ajax({
			'type':'POST',
			'url':"include/pluslivre.asp",
			'data':data,
			success:function(dr) {
				$("#body>.container").append(dr);
			}
		});
		$(ths).fadeOut();
	}
