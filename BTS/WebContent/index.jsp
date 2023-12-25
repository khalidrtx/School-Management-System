<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="fr">
<head>
	<meta charset="utf-8" />
	<title>Lycée Technique Ibn Sian -Kénitra-</title>
	 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/publicPages.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.css">
	<style type="text/css">
	 	.counter {
		    background-color: #fff;
		    text-align: center;
		}
		.diplome,.professeur,.branche,.experience
		{
		    margin-top: 70px;
		    margin-bottom: 70px;
		    background-color: #E0E9FF;
		    padding:20px;
		    
		}
		.counter-count
		{
		    font-size: 30px;
		    font-weight:bolder;
		    background:#65A5C3;
		    border-radius: 50%;
		    position: relative;
		    color: #ffffff;
		    text-align: center;
		    line-height: 92px;
		    width: 92px;
		    height: 92px;
		    -webkit-border-radius: 50%;
		    -moz-border-radius: 50%;
		    -ms-border-radius: 50%;
		    -o-border-radius: 50%;
		    display: inline-block;
		}
		
		.laureat-p,.professeur-p,.experience-p,.brawnche-p
		{
		    font-size: 24px;
		    color: #000000;
		    line-height: 34px;
		}
	 </style> 

</head>
<body>
  <!-- navbar -->

  <nav class="navbar navbar-expand-lg fixed-top ">
	  <a class="navbar-brand" href="index.jsp"><span class="fa fa-home"></span></a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>

	  <div class="collapse navbar-collapse " id="navbarSupportedContent">
	    <ul class="navbar-nav mr-4">
	      
	      <li class="nav-item">
	        <a class="nav-link" data-value="about" href="#">Présentation</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link " data-value="filieres" href="#">Filières</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link " data-value="team" href="#">Atouts</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link " data-value="contact" href="#">Contact</a>
	      </li>
		  <li class="nav-item">
	        <a class="nav-link " data-toggle="modal" data-target="#modalLoginForm" href="#">Connexion</a>
	      </li>
	</ul>
	    
	  </div>
</nav>
<!-- header -->
<header>
   <div class="container">
   		<!-- Carousel Wrapper-->
		<div id="carousel-annonce" class="carousel slide " data-ride="carousel">
		  <!--Indicators-->
		  <ol class="carousel-indicators">
			<li data-target="#carousel-annonce" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-annonce" data-slide-to="1"></li>
			<li data-target="#carousel-annonce" data-slide-to="2"></li>
		  </ol>
		  <!--/.Indicators-->
		  <!--Slides-->
		  <div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
			  <div class="view">
				<img class="d-block w-100" src="${pageContext.request.contextPath}/images/filieres/dsi1.jpg"
				  alt="First slide">
				<div class="mask rgba-black-light"></div>
			  </div>
			  <!-- /caption --> 
			  <div class="description ">
				<div class="carousel-caption">
					<h2>
						Journées Portes ouvertes
						<div class="annonce-date">Mardi 16 Mars 2020</div>
						<p>
						Le lycée technique Ibn Sina organise les journées portes ouvertes. Venez découvrire ...
						</p>
						<button class="btn btn-outline-secondary btn-sm">Consulter</button>
					</h2>
				</div>
			  </div>
			  <!-- /caption --> 
			</div>
			<div class="carousel-item">
			  <!--Mask color-->
				<div class="view">
					<img class="d-block w-100" src="${pageContext.request.contextPath}/images/filieres/cpi1.jpg"
					  alt="Second slide">
					<div class="mask rgba-black-strong"></div>
				</div>
				<div class="description ">
				<div class="carousel-caption">
					<h2>
						Début des inscriptions
						<div class="annonce-date">Vendredi 20 Avril 2020</div>
						<p>
							Le portail E-BTS est ouvert aux bachelier pour les inscriptions ...
						</p>
						<button class="btn btn-outline-secondary btn-sm">Consulter</button>
					</h2>
				</div>
				</div>
			</div>
			<div class="carousel-item">
			  <!--Mask color-->
			  <div class="view">
				<img class="d-block w-100" src="${pageContext.request.contextPath}/images/filieres/se1.jpg"
				  alt="Third slide">
				<div class="mask rgba-black-slight"></div>
			  </div>
			  <div class="description ">
			  <div class="carousel-caption">
					<h2>
						Concours des jeunes Inventeurs
						<div class="annonce-date">Lnndi 05 Avril 2020</div>
						<p class="d-none d-md-block">
							Le département Systèmes Eléctriques lance un concours pour les jeunes inventeurs ...
						</p>
						<button class="btn btn-outline-secondary btn-sm">Consulter</button>
					</h2>
				</div>
				</div>
			</div>
		  </div>
		  <!--/.Slides-->
		  <!--Controls-->
		  <a class="carousel-control-prev" href="#carousel-annonce" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carousel-annonce" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		  </a>
		  <!--/.Controls-->
		</div>
		<!--/.Carousel Wrapper-->
   </div>
  
</header>
<!-- /header -->
<!-- Présentation Filières -->
<div class="about" id="about">
	<div class="container">
	  <h1 class="text-center">Présentation</h1>
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-12">
				<img src="${pageContext.request.contextPath}/images/gallerie/ibnsina.jpg" class="img-fluid">
				<span class="text-justify">Lycée Technique Ibn Sina</span>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-12 desc">
			  
				<h3>Lycée Technique Ibn Sina</h3>
				<p>
				   Présentation de l'établissement ....
				</p>
			</div>
		</div>
	</div>
</div>
<!-- Section Filières -->
<div class="blog" id="filieres">
	<div class="container">
		<h1 class="text-center">Nos filières</h1>
		<div class="container">
	
	    <!--Carousel Wrapper-->
	    <div id="carousel-filieres" class="carousel slide carousel-multi-item" data-ride="carousel">
	
	      <!--Controls-->
	      <div class="row controls-top justify-content-center">
	        <a class="btn-floating" href="#carousel-filieres" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
	        <a class="btn-floating" href="#carousel-filieres" data-slide="next"><i class="fa fa-chevron-right"></i></a>
	      </div>
	      <!--/.Controls-->
	
	      <!--Indicators-->
	      <ol class="carousel-indicators">
	        <li data-target="#carousel-filieres" data-slide-to="0" class="active"></li>
	        <li data-target="#carousel-filieres" data-slide-to="1"></li>
	        <li data-target="#carousel-filieres" data-slide-to="2"></li>
	      </ol>
	      <!--/.Indicators-->
	
	      <!--Slides-->
	      <div class="carousel-inner" role="listbox">
	
	        <!--First slide-->
	        <div class="carousel-item active">
	
	          <div class="row justify-content-center">
	            <div class="col-md-4">
	              <div class="card mb-2">
	                <img class="card-img-top" src="${pageContext.request.contextPath}/images/filieres/dsi1.jpg"
	                  alt="Card image cap">
	                <div class="card-body">
	                  <h4 class="card-title">DSI</h4>
	                  <p class="card-text">Developpement des Systèmes d'Informations</p>
	                  <a class="btn btn-outline-primary">Découvrir</a>
	                </div>
	              </div>
	            </div>
	
	            <div class="col-md-4 clearfix d-none d-md-block">
	              <div class="card mb-2">
	                <img class="card-img-top" src="${pageContext.request.contextPath}/images/filieres/cpi1.jpg"
	                  alt="CPI">
	                <div class="card-body">
	                  <h4 class="card-title">CPI</h4>
	                  <p class="card-text">Conception de Produit Industriel</p>
	                  <a class="btn btn-outline-primary">Découvrir</a>
	                </div>
	              </div>
	            </div>
	          </div>
	
	        </div>
	        <!--/.First slide-->
	
	        <!--Second slide-->
	        <div class="carousel-item">
	
	          <div class="row justify-content-center">
	            <div class="col-md-4">
	              <div class="card mb-2">
	                <img class="card-img-top" src="${pageContext.request.contextPath}/images/filieres/se1.jpg"
	                  alt="SE">
	                <div class="card-body">
	                  <h4 class="card-title">SE</h4>
	                  <p class="card-text">Systèmes Electriques</p>
	                  <a class="btn btn-outline-primary">Découvrir</a>
	                </div>
	              </div>
	            </div>
	
	            <div class="col-md-4 clearfix d-none d-md-block">
	              <div class="card mb-2">
	                <img class="card-img-top" src="${pageContext.request.contextPath}/images/filieres/mi2.jpg"
	                  alt="MI">
	                <div class="card-body">
	                  <h4 class="card-title">MI</h4>
	                  <p class="card-text">Maintenance Industrielle</p>
	                  <a class="btn btn-outline-primary">Découvrir</a>
	                </div>
	              </div>
	            </div>
	          </div>
	
	        </div>
	        <!--/.Second slide-->
	
	        <!--Third slide-->
	        <div class="carousel-item">
	
	          <div class="row justify-content-center">
	            <div class="col-md-4">
	              <div class="card mb-2">
	                <img class="card-img-top" src="${pageContext.request.contextPath}/images/filieres/pme-pmi2.jpg"
	                  alt="PME/PMI">
	                <div class="card-body">
	                  <h4 class="card-title">PME/PMI</h4>
	                  <p class="card-text">Gestion des Petites et Moyennes Entreprises</p>
	                  <a class="btn btn-outline-primary">Découvrir</a>
	                </div>
	              </div>
	            </div>
	          </div>
	
	        </div>
	        <!--/.Third slide-->
	
	      </div>
	      <!--/.Slides-->
	
	    </div>
	    <!--/.Carousel Wrapper-->
	  </div>
  </div>
</div>

<!-- Team section -->
<div class="team" id="team">
	<div class="container">
	   <h1 class="text-center">Nos atouts</h1>
		
			<div class="counter">
			    <div class="container">
			        <div class="row">
			            <div class="col-md-3">
			                <div class="diplome">
			                    <p class="counter-count">1000</p>
			                    <p class="laureat-p text-center">
				                    <span class="fa fa-user-graduate mr-2"></span>
				                    Diplômés
			                    </p>
			                </div>
			            </div>
			
			            <div class="col-md-3">
			                <div class="professeur">
			                    <p class="counter-count">40</p>
			                    <p class="professeur-p text-center">
			                    	<span class="fa fa-user-tie"></span>
				                    Professeurs
			                    </p>
			                </div>
			            </div>
			
			            <div class="col-md-3">
			                <div class="branche">
			                    <p class="counter-count">5</p>
			                    <p class="branche-p text-center">
			                    	<span class="fa fa-sitemap"></span>
				                    Branches
			                    </p>
			                </div>
			            </div>
			
			            <div class="col-md-3">
			                <div class="experience">
			                    <div><p class="counter-count">18</p></div>
			                    <p class="experience-p text-center">
			                    	<span class="fa fa-birthday-cake"></span>
				                    Expérience
			                    </p>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
		
	</div>
</div>

<!-- Contact form -->
<div class="contact-form" id="contact">
	<div class="container">
		<form>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12">
				  <h1>Contactez nous</h1>	
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 right">
				   <div class="form-group">
				   	 <input type="text" class="form-control form-control-lg" placeholder="Votre nom" name="">
				   </div>
				   <div class="form-group">
				   	 <input type="email" class="form-control form-control-lg" placeholder="VotreEmail@email.com" name="email">
				   </div>
				   <div class="form-group">
				   	 <textarea class="form-control form-control-lg">
				   	 	
				   	 </textarea>
				   </div>
				   <input type="submit" class="btn btn-secondary btn-block" value="Envoyer" name="">
				</div>
			</div>
		</form>
	</div>
</div>

<!-- Début : Modal login form -->
<div class="modal" id="modalLoginForm" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Connexion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <form id="login_Form" class="form" role="form" method="post" action="${pageContext.request.contextPath}/Authentification" accept-charset="UTF-8" id="loginForm">
      <div class="modal-body">
			<div class="form-group">
			   <label class="sr-only" for="login">Email</label>
			   <input type="text" class="form-control" name="login" id="loginId" placeholder="Email" required>
			</div>
			<div class="form-group">
			   <label class="sr-only" for="password">Mot de passe</label>
			   <input type="password" class="form-control" name="password" id="passwordId" placeholder="Mot de passe" required>
			</div>
			<div id="message">
			</div>
			<div class="checkbox">
			   <label>
			   <input type="checkbox"> Se souvenir de moi
			   </label>
			</div>
		</div>
		<div class="modal-footer">
			<div class="form-group">
			   <button type="submit" class="btn btn-success btn-block">Connexion</button>
			</div>
		</div>
		</form>
    </div>
  </div>
</div>					
<!-- Fin : Modal login form -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/popper.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('.header').height($(window).height());

		$(".navbar a").click(function(){
			$("body,html").animate({
				scrollTop:$("#" + $(this).data('value')).offset().top
			},1000)
		  
		})
	
		$('.carousel-inner.carousel-item').each(function(){
		  var next = $(this).next();
		  alert("suivant");
		  if (!next.length) {
			next = $(this).siblings(':first');
		  }
		  next.children(':first-child').clone().appendTo($(this));

		  for (var i=0;i<3;i++) {
			next=next.next();
			if (!next.length) {
			  next=$(this).siblings(':first');
			}
			next.children(':first-child').clone().appendTo($(this));
		  }
		  
		});
		 $('.dropdown-menu').find('form').click(function (e) {
				e.stopPropagation();
			});
		//Modal login form command
		
		$('#modalLoginForm').on('shown.bs.modal', function () {
			$('#loginForm').trigger('reset')
			
		});
		
		//Compteur des atouts
		$('.counter-count').each(function () {
	        $(this).prop('Counter',0).animate({
	            Counter: $(this).text()
	        }, {
	            duration: 5000,
	            easing: 'swing',
	            step: function (now) {
	                $(this).text(Math.ceil(now));
	            }
	        });
	    });
		/********** Authentification **********************/
			//Effacer dabord le formulaire d'authenrification
			$('#modalLoginForm').on('shown.bs.modal', function(evt){
				$('#login_form').trigger('reset');
			});
			//Envoyer le formulaire d'authenrification via ajax
			$("#login_form").submit(function(event){ 
			var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
			var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
			var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
			$('#modalLoginForm').modal('hide');				//Fermer la fenetre modal apres envoie du formulaire
			$.ajax({
				url : post_url,
				type: request_method,
				data : form_data,
				dataType: 'json',
				contentType: "application/x-www-form-urlencoded;charset=UTF-8",
				success: function(response,textStatus ,jqXHR){
					$("#login_form #message").html("");
					$("#login_form #message").html(response.message);
					$('#modalLoginForm').modal('show');
			    },
			    error: function(response,textStatus ,jqXHR){
			    	$("#login_form #message").html("");
					$("#login_form #message").html(response);
					$('#modalLoginForm').modal('show'); 
			        }
			});
			return false;
		});	
	});

</script>

</body>
</html>