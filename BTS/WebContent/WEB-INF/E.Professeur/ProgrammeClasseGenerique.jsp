<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
 <% int id = Integer.parseInt(request.getParameter("id")); %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<title>Programme de la classe générique</title>
  	
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstap.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css" >
	<style type="text/css">
	body{
			background-color:#fff;
		}
	/***************** Modal confirm **********************/
	.modal-confirm {		
		color: #636363;
		width: 325px;
	}
	.modal-confirm .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
	}
	.modal-confirm .modal-header {
		border-bottom: none;   
        position: relative;
	}
	.modal-confirm h4 {
		width:100%;
		text-align: center;
		font-size: 26px;
		margin: 30px 0 -15px;
	}
	.modal-confirm .form-control, .modal-confirm .btn {
		min-height: 40px;
		border-radius: 3px; 
	}
	.modal-confirm .close {
        position: absolute;
		top: -5px;
		right: -5px;
	}	
	.modal-confirm .modal-footer {
		border: none;
		text-align: center;
		border-radius: 5px;
		font-size: 13px;
	}	
	.modal-confirm .icon-box {
		color: #fff;		
		position: absolute;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: -70px;
		width: 95px;
		height: 95px;
		border-radius: 50%;
		z-index: 9;
		/* background: #82ce34; */
		padding: 15px;
		text-align: center;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.modal-confirm .icon-box i {
		font-size: 58px;
		position: relative;
		top: 3px;
	}
	.modal-confirm.modal-dialog {
		margin-top: 80px;
	}
    .modal-confirm .btn {
        color: #fff;
        border-radius: 4px;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
        border: none;
        width:100%;
    }

/********************************************************************/
		.page-header h3{
		padding:10px;
		}
		.panel-primary{
		border:1px solid #3071a9 !important;
		}
		.panel-body{
			padding:20px;
		}
		.panel.with-nav-tabs .panel-heading{
		    padding: 5px 5px 0 5px;
		    background-color: #3071a9;
		}
		.panel.with-nav-tabs.panel-body{
		    padding: 10px 15px;
		}
		.panel.with-nav-tabs .nav-tabs{
			border-bottom: none;
		}
		.panel.with-nav-tabs .nav-justified{
			margin-bottom: -1px;
		}
		/*** PANEL PRIMARY ***/
		.with-nav-tabs.panel-primary .nav-tabs > a,
		.with-nav-tabs.panel-primary .nav-tabs > a:hover,
		.with-nav-tabs.panel-primary .nav-tabs > a:focus {
		    color: #fff;
		}
		.with-nav-tabs.panel-primary .nav-tabs > .open > a,
		.with-nav-tabs.panel-primary .nav-tabs > .open > a:hover,
		.with-nav-tabs.panel-primary .nav-tabs > .open > a:focus,
		.with-nav-tabs.panel-primary .nav-tabs > a:hover,
		.with-nav-tabs.panel-primary .nav-tabs >  a:focus {
			color: #fff;
			background-color: #3071a9;
			border-color: transparent;
		}
		.with-nav-tabs.panel-primary .nav-tabs > a.active,
		.with-nav-tabs.panel-primary .nav-tabs > a.active > a:hover,
		.with-nav-tabs.panel-primary .nav-tabs > a.active > a:focus {
			color: #428bca;
			background-color: #fff;
			border-color: #428bca;
			border-bottom-color: transparent;
		}
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu {
		    background-color: #428bca;
		    border-color: #3071a9;
		}
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a {
		    color: #fff;   
		}
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
		    background-color: #3071a9;
		}
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a,
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
		    background-color: #4a9fe9;
		}
		/********************************************************************/
			input.error {
		    border-color: #f00 !important;
			}
			small.required {
			    color:#f00;
			}
.modal-backdrop {
   /* display: none; */
}
	/**************** Data Table *******************/
	
		</style>	
  </head>
 <body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar" class="active">
			<h1><a href="index.html" class="logo"><span class="fa fa-cubes"></span></a></h1>
	      	<%@include file="MenuProfesseur.jsp" %>
		</nav>
	<!-- Page Content  -->
      <div id="content" class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><span class="fa fa-home mr-2"></span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-envelope mr-2"></span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-bell mr-2"></span></a>
                </li>
                <li class="nav-item">
                    <div class="dropdown">
					    <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
					     <img src="${pageContext.request.contextPath}/Document/Download?file=${sessionScope.userPhoto}" class="rounded-circle" style="width:20px;height:20px;">
					       
					    </button>
					    <div class="dropdown-menu dropdown-menu-right" role="menu" >
					      <div class="dropdown-item text-center">
					      <img src="${pageContext.request.contextPath}/Document/Download?file=${sessionScope.userPhoto}" class="rounded-circle" style="width:60px;height:60px;">
					       
					      </div>
					      <h5 class="dropdown-header text-primary text-center">${sessionScope.userFirstName_Fr} &nbsp; ${sessionScope.userLastName_Fr}</h5>
					      <h5 class="dropdown-header text-muted text-center">${sessionScope.userRole}</h5>
					      <div class="dropdown-divider"></div>
					      <a class="dropdown-item" href="${pageContext.request.contextPath}/E.Professeur/Profile?userId=${sessionScope.userID}">
					      		<span class="fa fa-id-card mr-2"></span>
					      		Profile
					      </a>
					      <div class="dropdown-divider"></div>
						  <a class="dropdown-item" href="${pageContext.request.contextPath}/Logout"> 
						      	<span class="fa fa-external-link-square-alt mr-2"></span>
						      	Déconnexion
						  </a>
					    </div>
					  </div>
                </li>
     
              </ul>
            </div>
          </div>
        </nav>
<!-- Start content -->
	
	<div class="container"> 
		<div class="row">
		<div class="col-md-9"> <!-- Col 1 -->
		<div class="alert bg-light text-secondary" role="alert">
		   			<i class="fa fa-chalkboard mr-2"></i>
		   			Classe générique : 
		   			<span id="ClasseGeneriqueInfo"></span>
			        
		</div>
		<div class="panel with-nav-tabs panel-primary">
		     <div class="panel-heading">
					<nav class="nav nav-tabs flex-column flex-sm-row"  id="Tab-Content" role="tablist">
					    <a id="tab_Unites" href="#content-tab-Unites" class="nav-item nav-link active" data-toggle="tab" role="tab" aria-controls="content-absence" aria-selected="false">
					        <i class="fa fa-list-ol mr-2"></i> Programme
					    </a>
					    <a id="tab_Examens" href="#content-tab-Examens" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-css" aria-selected="false">
					        <i class="fa fa-file-signature mr-2"></i> Examens
					    </a>
					</nav>
			</div>
		    <div class="panel-body">
		    	<!-- Tab content -->
				<div class="tab-content" id="Tab-Content">
						<!-- Content tab 1	: Programme-->
						<div id="content-tab-Unites" class="tab-pane active" role="tabpanel" aria-labelledby="tab-bootstrap">
					   		<div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-list-ol mr-2"></i>
					   			Unités
						    </div>
							<!-- Début : Table Unités -->
								<table id="data_table_unites" class="table " cellspacing="0" width="100%">
									<thead>
									</thead>
									<tbody>
									</tbody>
								</table>
							<!-- Fin : Table Unités  -->
							 <!-- Début : Modal Details Unite -->
								<div id="unite_Details_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
									<div class="modal-dialog">
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Détails de l'unité
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<ul class="list-group">
													<!-- Affichage dynamique des détails du unite-->
												</ul>
											</div>
											<div class="modal-footer ">
												<button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Fermer</button>
											</div>
								        </div>
									</div>
							    </div>
							 <!-- Fin : Modal Details Unite -->
							<!-- Début : Modal Details Matiere -->
								<div id="matiere_Details_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
									<div class="modal-dialog">
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Détails de la matière
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<ul class="list-group">
													<!-- Affichage dynamique des détails de la matiere-->
												</ul>
											</div>
											<div class="modal-footer ">
												<button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Fermer</button>
											</div>
								        </div>
									</div>
							    </div>
							 <!-- Fin : Modal Details Matiere -->
							
							 <!-- Début : Modal Details Module -->
								<div id="module_Details_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
									<div class="modal-dialog">
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Détails du module
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<ul class="list-group">
													<!-- Affichage dynamique des détails du module-->
												</ul>
											</div>
											<div class="modal-footer ">
												<button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Fermer</button>
											</div>
								        </div>
									</div>
							    </div>
							 <!-- Fin : Modal Details Module -->
						</div>
						<!-- /Content tab 1	: Programme-->
						<!-- Content tab 2 	: Examens-->
						<div id="content-tab-Examens" class="tab-pane"  role="tabpanel" aria-labelledby="content-tab-Examens">
						   
						   
						   Comme pour le programme, il s'agit là de configurer les examens de la classe génériques et les matières qu'il contient. <br>
						   Exemple : Examen de passage 1ere année :<br>
						   				----> Matires :<br>
						   						1- Mathématiques : coefficient=4, durée=2h, forme de l'examen =ecrit, ... etc <br>
						   						2- DAI : coefficient=6, durée=4h, forme de l'examen =ecrit, ... etc <br>
						</div>
						<!-- /Content tab 2	: Examens-->
				</div>
				<!-- /Tab content -->
			 </div>
		  </div>
		</div> <!-- /Col 1 -->
		<div class="col-md-3"> <!-- Col 2 -->
			<div class="panel with-nav-tabs panel-primary">
		     <div class="panel-heading">
					<nav class="nav nav-tabs flex-column flex-sm-row"  id="Tab-Content-2" role="tablist">
					    <a id="tab_Annonces" href="#content-tab-Annonces" class="nav-item nav-link active" data-toggle="tab" role="tab" aria-controls="content-tab-Annonces" aria-selected="false">
					        <span class="fa fa-bullhorn"></span> Annonces
					    </a>
					    <a  id="tab_Actualites" href="#content-tab-Actualites" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-tab-Actualites" aria-selected="false">
					        <span class="fa fa-newspaper"></span> Actualites
					    </a>
					</nav>
			</div>
		    <div class="panel-body">
		    	<!-- Début : Tab content  2-->
				<div class="tab-content" id="Tab-Content-Communication">
						<!-- Content tab 1 	: Annonces-->
					  	<div id="content-tab-Annonces" class="tab-pane active" role="tabpanel" aria-labelledby="content-tab-Annonces">
					     <ul>
							<li>Annonce 1</li>
							<li>Annonce 2</li>
							<li>Annonce 3</li>
						 </ul>
					  	</div>
						<!-- /Content tab 1 : Annonces-->
						<!-- Content tab 2 	: Actualites-->
						<div id="content-tab-Actualites" class="tab-pane" role="tabpanel" aria-labelledby="content-tab-Actualites">
						 <ul>	
							<li>Actualité 1</li>
							<li>Actualité 2</li>
							<li>Actualité 3</li>
							<li>Actualite 4</li>
							<li>Actualité 5</li>
						 </ul>
						</div>
						<!-- /Content tab 2	: Actualites-->
				</div>
				<!-- Fin : Tab content 2 -->
			 </div>
		</div>
		</div> <!-- Col 2 -->
	</div><!-- /row 1 -->
	
	<!-- /Page Content  -->
</div>
</div>
</div>
<!-- Modal Success -->
	<div id="modalSuccess" class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-dialog-centered modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box bg-success">
					<i class="material-icons fa fa-check"></i>
				</div>				
				<h4 class="modal-title text-center">Succès !</h4>	
			</div>
			<div class="modal-body">
				<p class="text-center">
					<!-- On affiche ici le message obtenu du coté serveur -->
				</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-success btn-block" data-dismiss="modal">Fermer</button>
			</div>
		</div>
	  </div>
	</div>
<!-- Fin : Moad Success -->
<!-- Début : Modal error -->
	<div id="modalError" class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-dialog-centered modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box bg-danger">
					<i class="material-icons fa fa-exclamation-triangle"></i>
				</div>				
				<h4 class="modal-title text-center">Echec !</h4>	
			</div>
			<div class="modal-body">
				<p class="text-center">
					<!-- On affiche ici le message obtenu du coté serveur -->
				</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary btn-block" data-dismiss="modal">Fermer</button>
			</div>
		</div>
	  </div>
	</div>
<!-- Fin : Moad Error -->
<!-- Début : Moad Confirmation -->
<div id="modalConfirm" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-confirm " role="document">
		<div class="modal-content">
		  <div class="modal-header">
				<div class="icon-box bg-warning">
					<i class="material-icons fa fa-exclamation-triangle"></i>
				</div>				
				<h4 class="modal-title text-center">Supprimer ?</h4>	
		  </div>
		  <div class="modal-body">
				<p class="text-center">
					Etes vous sûre de vouloir supprimer cet enregistrement ?
				</p>
		  </div>
		  <div class="modal-footer">
		    <button type="button" data-dismiss="modal" class="btn btn-warning  mr-auto" id="delete">Supprimer</button>
		    <button type="button" data-dismiss="modal" class="btn btn-secondary  ">Annuler</button>
		  </div>
		 </div>
  	</div>
</div>
<!-- Fin : Moad Confirmation-->
<!-- Début : Moad Loading Ajax -->
<div id="loading-image" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-sm" >
        <div class="modal-content" style="width: 48px; color:orange;">
            <span class="fa fa-spinner fa-spin fa-3x"></span>
        </div>
    </div>
</div>
<!-- Fin : Moad Loading Ajax -->

	<script src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js" ></script>
	
	<script src="${pageContext.request.contextPath}/js/popper.js" type="text/javascript"></script>
	
	
	<script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/dataTables.bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/main.js" type="text/javascript"></script>
    
    
    <script src="${pageContext.request.contextPath}/js/dataTables.buttons.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/buttons.flash.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jszip.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/pdfmake.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/vfs_fonts.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/buttons.html5.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/buttons.print.min.js" type="text/javascript"></script>
    
    
  	<script type="text/javascript">
  	
  	$(document).ready(function() {
  		/**************** Début : Ajax Load Animation *************************/
  		$(document).ajaxStart(function(){
  			$('#loading-image').show();
		 });
  		$(document).ajaxStop(function(){
  			$('#loading-image').hide();
		 });
		/*******************Fin : Ajax Load Animation *************************/
		/*********** Charger les infos de la classe générique courante ********/
			$.ajax({
					url : '../ClasseGenerique/Details?id='+<%= request.getParameter("id")%>,
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						
					$('#ClasseGeneriqueInfo').html(response.code);
						
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
		
  		/************** Table : Unites **************/
	  		
	  		
			function populateUniteDataTable(){
				$('#data_table_unites tbody').html("");
				$.ajax({
					url : '../ClasseGenerique/Programme/List?id='+<%= request.getParameter("id")%>,
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						//Afficher les Unités
						for(i=0;i<response.length;i++){
							var rang =i+1;
							var btnsUnite='<div class="btn-group dropleft"> \
										  <button type="button" class="btn btn-outline-info btn-sm" title="Actions"><span class="fa fa-ellipsis-h"></span></button> \
										  <button type="button" class="btn btn-outline-info btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> \
										    <span class="sr-only">Toggle Dropdown</span> \
										  </button> \
										  <div class="dropdown-menu shadow p-3 mb-5 bg-white rounded" id="dropdownUnite"> \
										    <div class="bg-info text-white px-3 py-1"><span class="fa fa-ellipsis-h mr-4"></span> Actions</div> \
									        <div class="dropdown-divider"></div> \
										  	<a class="dropdown-item unite-details text-primary" href="#" uniteId="'+response[i].unite.id+'" classeGUniteId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
										  </div> \
										</div> ';
							var trUnite='<tr class="table-light"><td>'+rang+'</td><td colspan=5> Unité : '+response[i].unite.nom_Fr+'</td><td>'+btnsUnite+'</td></tr>';
							$('#data_table_unites tbody').append(trUnite);
							//Afficher les Matières de l'Unité
								for(j=0;j<response[i].configurationMatieres.length;j++){
									var btnsMatiere='<div class="btn-group dropleft"> \
										  <button type="button" class="btn btn-outline-info btn-sm" title="Actions"><span class="fa fa-ellipsis-h"></span></button> \
										  <button type="button" class="btn btn-outline-info btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> \
										    <span class="sr-only">Toggle Dropdown</span> \
										  </button> \
										  <div class="dropdown-menu shadow p-3 mb-5 bg-white rounded" id="dropdownUnite"> \
										    <div class="bg-info text-white px-3 py-1"><span class="fa fa-ellipsis-h mr-4"></span> Actions</div> \
									        <div class="dropdown-divider"></div> \
										  	<a class="dropdown-item matiere-details text-primary" href="#" matiereId="'+response[i].configurationMatieres[j].matiere.id+'" configurationMatiereId="'+response[i].configurationMatieres[j].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
										  	<a class="dropdown-item matiere-module-add text-primary" href="#" matiereId="'+response[i].configurationMatieres[j].matiere.id+'" configurationMatiereId="'+response[i].configurationMatieres[j].id+'"><span class="fa fa-plus mr-4"></span>Programme</a> \
										  </div> \
										</div> ';
									
									var trMatiere = '<tr><td></td><td></td><td colspan=3>'+response[i].configurationMatieres[j].matiere.nom_Fr+'</td><td>'+btnsMatiere+'</td><td></td></tr>';
									$('#data_table_unites tbody').append(trMatiere);
									
									//Afficher les Modules de la Matière
									for(k=0;k<response[i].configurationMatieres[j].configurationModules.length;k++){
										var btnsModule='<div class="btn-group dropleft"> \
											  <button type="button" class="btn btn-outline-info btn-sm" title="Actions"><span class="fa fa-ellipsis-h"></span></button> \
											  <button type="button" class="btn btn-outline-info btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> \
											    <span class="sr-only">Toggle Dropdown</span> \
											  </button> \
											  <div class="dropdown-menu shadow p-3 mb-5 bg-white rounded" id="dropdownUnite"> \
											    <div class="bg-info text-white px-3 py-1"><span class="fa fa-ellipsis-h mr-4"></span> Actions</div> \
										        <div class="dropdown-divider"></div> \
											  	<a class="dropdown-item module-details text-primary" href="#" moduleId="'+response[i].configurationMatieres[j].configurationModules[k].module.id+'" configurationModuleId="'+response[i].configurationMatieres[j].configurationModules[k].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
											  	<a class="dropdown-item module-update text-primary" href="#" moduleId="'+response[i].configurationMatieres[j].configurationModules[k].module.id+'" configurationModuleId="'+response[i].configurationMatieres[j].configurationModules[k].id+'"><span class="fa fa-pen mr-4"></span>Programme</a> \
											  </div> \
											</div> ';
										
										var trModule = '<tr><td></td><td></td><td></td><td>'+response[i].configurationMatieres[j].configurationModules[k].module.nom_Fr+'</td><td>'+btnsModule+'</td><td></td><td></td></tr>';
										$('#data_table_unites tbody').append(trModule);
									
									}
									
								}
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
			};
			
			//Chargement du programme de la classe générique courante
			populateUniteDataTable();
			
			/* Au click sur le tab Unites : 
			/* On charger la liste des Unites dans la TableData Unites
			*/
			
			$('#tab_Unites').on('click', function(e){
					// Effacer la Table Unités
					$('#data_table_unites tbody').html("");
					// Charger la liste des unites dans le DataTable Unites
		  			populateUniteDataTable();
					e.preventDefault();
			});
			
  		
  			/*********** Affichage des détails d'une Unite ****************
  			/* 1 - Récuperer l' Id du Unite séléctionner sur la DataTable Unites
  			/* 2 - Charger par ajax le Unite concerné
  			/* 3 - Afficher les détails du Unite concerné 
  			*****************************************************/
  			
  			$('#data_table_unites').on('click','.unite-details', function(evt){
  				$this = $(this);
				var classeGUniteId= $this.attr('classeGUniteId');
				$.ajax({
					url : '../ClasseGenerique/Unite/Details?classeGUniteId='+classeGUniteId,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						var codeItem ='<li class="list-group-item"><span><strong>Code unité  </strong></span><span class="float-right">'+response.unite.code+'</span></li>';
						var nom_FrItem ='<li class="list-group-item"><span><strong>Nom unité  </strong></span><span class="float-right">'+response.unite.nom_Fr+'</span></li>';
						var noteEliminItem ='<li class="list-group-item"><span><strong>Note Eliminatoire</strong></span><span class="float-right" dir="rtl">'+response.noteEliminatoire+'</span></li>';
						$("#unite_Details_Modal .list-group").html("");
						$("#unite_Details_Modal .list-group").append(codeItem);
						$("#unite_Details_Modal .list-group").append(nom_FrItem);
						$("#unite_Details_Modal .list-group").append(noteEliminItem);
						$('#unite_Details_Modal').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				
				return false;
			});
  			
  			
  			/*********** Affichage des détails d'une Matière ****************
  			/* 1 - Récuperer l' Id de la matière séléctionnée sur la DataTable Unites
  			/* 2 - Charger par ajax la matière concernée
  			/* 3 - Afficher les détails de la matière concernée 
  			*****************************************************/
  			$('#data_table_unites').on('click','.matiere-details', function(evt){
  				$this = $(this);
  				var configurationMatiereId= $this.attr('configurationMatiereId');
				$.ajax({
					url : "../ClasseGenerique/Unite/Matiere/Details?configurationMatiereId="+configurationMatiereId,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						var matiereItem   ='<li class="list-group-item"><span><strong>Matière   </strong></span><span class="float-right">'+response.matiere.nom_Fr+'</span></li>';
						var periodeItem ='<li class="list-group-item"><span><strong>Période  </strong></span><span class="float-right">'+response.periode.nom_Fr+'</span></li>';
						var volumeHoraireItem ='<li class="list-group-item"><span><strong>Volume Horaire  </strong></span><span class="float-right">'+response.volumeHoraire+'</span></li>';
						var horaireS1Item ='<li class="list-group-item"><span><strong>S1</strong></span><span class="float-right">'+response.horaireS1+'</span></li>';
						var horaireS2Item ='<li class="list-group-item"><span><strong>S2</strong></span><span class="float-right">'+response.horaireS2+'</span></li>';
						
						var nbreControlesItem ='<li class="list-group-item"><span><strong>Nombre de contrôles </strong></span><span class="float-right">'+response.nbreControles+'</span></li>';
						var formeControleItem ='<li class="list-group-item"><span><strong>Forme des controles </strong></span><span class="float-right">'+response.formeControle.nom_Fr+'</span></li>';
						var noteEliminItem ='<li class="list-group-item"><span><strong>Note Eliminatoire</strong></span><span class="float-right" dir="rtl">'+response.noteEliminatoire+'</span></li>';
						$("#matiere_Details_Modal .list-group").html("");
						$("#matiere_Details_Modal .list-group").append(matiereItem);
						$("#matiere_Details_Modal .list-group").append(periodeItem);
						$("#matiere_Details_Modal .list-group").append(volumeHoraireItem);
						$("#matiere_Details_Modal .list-group").append(horaireS1Item);
						$("#matiere_Details_Modal .list-group").append(horaireS2Item);
						$("#matiere_Details_Modal .list-group").append(nbreControlesItem);
						$("#matiere_Details_Modal .list-group").append(formeControleItem);
						$("#matiere_Details_Modal .list-group").append(noteEliminItem);
						$('#matiere_Details_Modal').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				
				return false;
			});
  			
			
  			/*********** Affichage des détails d'un Module ****************
  			/* 1 - Récuperer l' Id du Module séléctionné sur la DataTable Unites
  			/* 2 - Charger par ajax le Module concerné
  			/* 3 - Afficher les détails du Moduleconcerné 
  			*****************************************************/
  			$('#data_table_unites').on('click','.module-details', function(evt){
  				$this = $(this);
  				var configurationModuleId= $this.attr('configurationModuleId');
				$.ajax({
					url : "../ClasseGenerique/Unite/Matiere/Module/Details?configurationModuleId="+configurationModuleId,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						var moduleItem   ='<li class="list-group-item"><span><strong>Module   </strong></span><span class="float-right">'+response.module.nom_Fr+'</span></li>';
						var periodeItem ='<li class="list-group-item"><span><strong>Période  </strong></span><span class="float-right">'+response.periode.nom_Fr+'</span></li>';
						var volumeHoraireItem ='<li class="list-group-item"><span><strong>Volume Horaire  </strong></span><span class="float-right">'+response.volumeHoraire+'</span></li>';
						var horaireS1Item ='<li class="list-group-item"><span><strong>S1</strong></span><span class="float-right">'+response.horaireS1+'</span></li>';
						var horaireS2Item ='<li class="list-group-item"><span><strong>S2</strong></span><span class="float-right">'+response.horaireS2+'</span></li>';
						
						var nbreControlesItem ='<li class="list-group-item"><span><strong>Nombre de contrôles </strong></span><span class="float-right">'+response.nbreControles+'</span></li>';
						var formeControleItem ='<li class="list-group-item"><span><strong>Forme des controles </strong></span><span class="float-right">'+response.formeControle.nom_Fr+'</span></li>';
						var noteEliminItem ='<li class="list-group-item"><span><strong>Note Eliminatoire</strong></span><span class="float-right" dir="rtl">'+response.noteEliminatoire+'</span></li>';
						$("#module_Details_Modal .list-group").html("");
						$("#module_Details_Modal .list-group").append(moduleItem);
						$("#module_Details_Modal .list-group").append(periodeItem);
						$("#module_Details_Modal .list-group").append(volumeHoraireItem);
						$("#module_Details_Modal .list-group").append(horaireS1Item);
						$("#module_Details_Modal .list-group").append(horaireS2Item);
						$("#module_Details_Modal .list-group").append(nbreControlesItem);
						$("#module_Details_Modal .list-group").append(formeControleItem);
						$("#module_Details_Modal .list-group").append(noteEliminItem);
						$('#module_Details_Modal').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				
				return false;
			});
  			
  			

  	});
    </script>
   
</body>
</html>