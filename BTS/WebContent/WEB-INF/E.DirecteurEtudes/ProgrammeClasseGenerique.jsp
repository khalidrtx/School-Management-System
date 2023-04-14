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
	      	<%@include file="MenuDirecteurEtudes.jsp" %>
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
					      <a class="dropdown-item" href="${pageContext.request.contextPath}/E.DirecteurEtudes/Profile?userId=${sessionScope.userID}">
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
						        <a href="#" data-toggle="modal" data-target="#unite_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter une unite"><i class="fa fa-plus"></i></a>
						    </div>
							<!-- Début : Table Unités -->
								<table id="data_table_unites" class="table " cellspacing="0" width="100%">
									<thead>
										
									</thead>
									<tbody>
									</tbody>
								</table>
							<!-- Fin : Table Unités  -->
							
							<!-- Début : Modal Add New Unite -->
								<div id="unite_Add_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="unite_Add_Form" method="POST" action="../ClasseGenerique/Unite/Add" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Ajouter une unite au programme
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="unite_code" class="col-sm-3 control-label">Unité</label>
										    		<div class="col-sm-9">
										    		  <input type="hidden" name="classeGeneriqueId" value="<%= request.getParameter("id") %>"/>
												      <select id="unite_code" class="form-control" name="unite"  required>
												      </select>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="unite_NoteEliminatoire" class="col-sm-3 control-label">Note Eliminatoire</label>
												  <div class="col-sm-9">
												    <input id="unite_NoteEliminatoire" type="text" class="form-control" name="noteEliminatoire" placeholder="Note éliminatoire" required/>
												  </div>
												</div>
								      		</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
									</div>
							    </div>
							 <!-- Fin : Modal Add New Unite -->
							 <!-- Début : Modal Update Unite -->
								<div id="unite_Update_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
									<div class="modal-dialog">
									<form id="unite_Update_Form" method="POST" action="../ClasseGenerique/Unite/Update" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Modifier l'unité
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>			
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="unite_code" class="col-sm-3 control-label">Unité</label>
										    		<div class="col-sm-9">
										    		  <input type="hidden" name="classeGUnitId" value=""/>
										    		  <input type="hidden" name="classeGeneriqueId" value="<%= request.getParameter("id") %>"/>
												      <select id="unite_code" class="form-control" name="unite"  required>
												      </select>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="unite_NoteEliminatoire" class="col-sm-3 control-label">Note Eliminatoire</label>
												  <div class="col-sm-9">
												    <input id="unite_NoteEliminatoire" type="text" class="form-control" name="noteEliminatoire" placeholder="Note éliminatoire" required/>
												  </div>
												</div>
								      		</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
									</div>
							    </div>
							 <!-- Fin : Modal Update Unite -->
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
							 <!-- Début : Modal Add New Matiere -->
								<div id="matiere_Add_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
									<div class="modal-dialog">
									<form id="matiere_Add_Form" method="POST" action="../ClasseGenerique/Unite/Matiere/Add" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Ajouter une matière à l'unité
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
								          			<label for="matiere_Code" class="col-sm-3 control-label">Matière</label>
									          		<div class="col-sm-9">
											    		  <input type="hidden" name="classeGUniteId" value=""/>
													      <select id="matiere_Code" class="form-control" name="matiere"  required>
													      </select>
													</div>
												</div>
												<div class="form-group row">
								          			<label for="matiere_Periode" class="col-sm-3 control-label">Période</label>
									          		<div class="col-sm-9">
											    		  <select id="matiere_Periode" class="form-control" name="periode"  required>
													      </select>
													</div>
												</div>
												<div class="form-group row">
												  <label for="matiere_VolumeHoraire" class="col-sm-3 control-label">Volume horaire</label>
												  <div class="col-sm-9">
												    <input id="matiere_VolumeHoraire" type="text" class="form-control" name="volumeHoraire" placeholder="Nombre d'heures"/>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="matiere_horaireS1" class="col-sm-3 control-label">Semestre 1</label>
												  <div class="col-sm-9">
												    <input id="matiere_horaireS1" type="text" class="form-control" name="horaireS1" placeholder="Nombre d'heures/semaine"/>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="matiere_horaireS2" class="col-sm-3 control-label">Semestre 2</label>
												  <div class="col-sm-9">
												    <input id="matiere_horaireS2" type="text" class="form-control" name="horaireS2" placeholder="Nombre d'heures/semaine"/>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="matiere_NbreControles" class="col-sm-3 control-label">Nbre de controles</label>
												  <div class="col-sm-9">
												    <input id="matiere_NbreControles" type="text" class="form-control" name="nbreControles" placeholder="Nombre de contrôles"/>
												  </div>
												</div>
												<div class="form-group row">
								          			<label for="matiere_FormeControle" class="col-sm-3 control-label">Formes controles</label>
									          		<div class="col-sm-9">
											    		  <select id="matiere_FormeControle" class="form-control" name="formeControle"  required>
													      </select>
													</div>
												</div>
												<div class="form-group row">
												  <label for="matiere_NoteEliminatoire" class="col-sm-3 control-label">Note éliminatoire</label>
												  <div class="col-sm-9">
												    <input id="matiere_NoteEliminatoire" type="text" class="form-control" name="noteEliminatoire" placeholder="Note éliminatoire"/>
												  </div>
												</div>
								      	</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
									</div>
							    </div>
							 <!-- Fin : Modal Add New Matiere -->
							 <!-- Début : Modal Update Matiere -->
								<div id="matiere_Update_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
									<div class="modal-dialog">
									<form id="matiere_Update_Form" method="POST" action="../ClasseGenerique/Unite/Matiere/Update" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Modifier la matière
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
								          			<label for="matiere_Code" class="col-sm-3 control-label">Matière</label>
									          		<div class="col-sm-9">
											    		  <input type="hidden" name="configurationMatiereId" value=""/>
											    		  <input type="hidden" name="classeGUniteId" value=""/>
													      <select id="matiere_Code" class="form-control" name="matiere"  required>
													      </select>
													</div>
												</div>
												<div class="form-group row">
								          			<label for="matiere_Periode" class="col-sm-3 control-label">Période</label>
									          		<div class="col-sm-9">
											    		  <select id="matiere_Periode" class="form-control" name="periode"  required>
													      </select>
													</div>
												</div>
												<div class="form-group row">
												  <label for="matiere_VolumeHoraire" class="col-sm-3 control-label">Volume horaire</label>
												  <div class="col-sm-9">
												    <input id="matiere_VolumeHoraire" type="text" class="form-control" name="volumeHoraire" placeholder="Nombre d'heures"/>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="matiere_horaireS1" class="col-sm-3 control-label">Semestre 1</label>
												  <div class="col-sm-9">
												    <input id="matiere_horaireS1" type="text" class="form-control" name="horaireS1" placeholder="Nombre d'heures/semaine"/>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="matiere_horaireS2" class="col-sm-3 control-label">Semestre 2</label>
												  <div class="col-sm-9">
												    <input id="matiere_horaireS2" type="text" class="form-control" name="horaireS2" placeholder="Nombre d'heures/semaine"/>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="matiere_NbreControles" class="col-sm-3 control-label">Nbre de controles</label>
												  <div class="col-sm-9">
												    <input id="matiere_NbreControles" type="text" class="form-control" name="nbreControles" placeholder="Nombre de contrôles"/>
												  </div>
												</div>
												<div class="form-group row">
								          			<label for="matiere_FormeControle" class="col-sm-3 control-label">Formes controles</label>
									          		<div class="col-sm-9">
											    		  <select id="matiere_FormeControle" class="form-control" name="formeControle"  required>
													      </select>
													</div>
												</div>
												<div class="form-group row">
												  <label for="matiere_NoteEliminatoire" class="col-sm-3 control-label">Note éliminatoire</label>
												  <div class="col-sm-9">
												    <input id="matiere_NoteEliminatoire" type="text" class="form-control" name="noteEliminatoire" placeholder="Note éliminatoire"/>
												  </div>
												</div>
								      	</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
								</div>
							</div>
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
							 <!-- Début : Modal Add New Module -->
								<div id="module_Add_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="module_Add_Form" method="POST" action="../ClasseGenerique/Unite/Matiere/Module/Add" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Ajouter un module à la matière
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
								          			<label for="module_Code" class="col-sm-3 control-label">Module</label>
									          		<div class="col-sm-9">
											    		  <input type="hidden" name="configurationMatiereId" value=""/>
													      <select id="module_Code" class="form-control" name="module"  required>
													      </select>
													</div>
												</div>
												<div class="form-group row">
								          			<label for="module_Periode" class="col-sm-3 control-label">Période</label>
									          		<div class="col-sm-9">
											    		  <select id="module_Periode" class="form-control" name="periode"  required>
													      </select>
													</div>
												</div>
												<div class="form-group row">
												  <label for="module_VolumeHoraire" class="col-sm-3 control-label">Volume horaire</label>
												  <div class="col-sm-9">
												    <input id="module_VolumeHoraire" type="text" class="form-control" name="volumeHoraire" placeholder="Nombre d'heures"/>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="module_horaireS1" class="col-sm-3 control-label">Semestre 1</label>
												  <div class="col-sm-9">
												    <input id="module_horaireS1" type="text" class="form-control" name="horaireS1" placeholder="Nombre d'heures/semaine"/>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="module_horaireS2" class="col-sm-3 control-label">Semestre 2</label>
												  <div class="col-sm-9">
												    <input id="module_horaireS2" type="text" class="form-control" name="horaireS2" placeholder="Nombre d'heures/semaine"/>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="module_NbreControles" class="col-sm-3 control-label">Nbre de controles</label>
												  <div class="col-sm-9">
												    <input id="module_NbreControles" type="text" class="form-control" name="nbreControles" placeholder="Nombre de contrôles"/>
												  </div>
												</div>
												<div class="form-group row">
								          			<label for="module_FormeControle" class="col-sm-3 control-label">Formes controles</label>
									          		<div class="col-sm-9">
											    		  <select id="module_FormeControle" class="form-control" name="formeControle"  required>
													      </select>
													</div>
												</div>
												<div class="form-group row">
												  <label for="matiere_NoteEliminatoire" class="col-sm-3 control-label">Note éliminatoire</label>
												  <div class="col-sm-9">
												    <input id="matiere_NoteEliminatoire" type="text" class="form-control" name="noteEliminatoire" placeholder="Note éliminatoire"/>
												  </div>
												</div>
								      	</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
									</div>
							    </div>
							 <!-- Fin : Modal Add New Module -->
							 <!-- Début : Modal Update Module -->
								<div id="module_Update_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
									<div class="modal-dialog">
									<form id="module_Update_Form" method="POST" action="../ClasseGenerique/Unite/Matiere/Module/Update" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Modifier le module
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
								          			<label for="module_Code" class="col-sm-3 control-label">Module</label>
									          		<div class="col-sm-9">
											    		  <input type="hidden" name="configurationMatiereId" value=""/>
											    		  <input type="hidden" name="configurationModuleId" value=""/>
													      <select id="module_Code" class="form-control" name="module"  required>
													      </select>
													</div>
												</div>
												<div class="form-group row">
								          			<label for="module_Periode" class="col-sm-3 control-label">Période</label>
									          		<div class="col-sm-9">
											    		  <select id="module_Periode" class="form-control" name="periode"  required>
													      </select>
													</div>
												</div>
												<div class="form-group row">
												  <label for="module_VolumeHoraire" class="col-sm-3 control-label">Volume horaire</label>
												  <div class="col-sm-9">
												    <input id="module_VolumeHoraire" type="text" class="form-control" name="volumeHoraire" placeholder="Nombre d'heures"/>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="module_horaireS1" class="col-sm-3 control-label">Semestre 1</label>
												  <div class="col-sm-9">
												    <input id="module_horaireS1" type="text" class="form-control" name="horaireS1" placeholder="Nombre d'heures/semaine"/>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="module_horaireS2" class="col-sm-3 control-label">Semestre 2</label>
												  <div class="col-sm-9">
												    <input id="module_horaireS2" type="text" class="form-control" name="horaireS2" placeholder="Nombre d'heures/semaine"/>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="module_NbreControles" class="col-sm-3 control-label">Nbre de controles</label>
												  <div class="col-sm-9">
												    <input id="module_NbreControles" type="text" class="form-control" name="nbreControles" placeholder="Nombre de contrôles"/>
												  </div>
												</div>
												<div class="form-group row">
								          			<label for="module_FormeControle" class="col-sm-3 control-label">Formes controles</label>
									          		<div class="col-sm-9">
											    		  <select id="module_FormeControle" class="form-control" name="formeControle"  required>
													      </select>
													</div>
												</div>
												<div class="form-group row">
												  <label for="matiere_NoteEliminatoire" class="col-sm-3 control-label">Note éliminatoire</label>
												  <div class="col-sm-9">
												    <input id="matiere_NoteEliminatoire" type="text" class="form-control" name="noteEliminatoire" placeholder="Note éliminatoire"/>
												  </div>
												</div>
								      	</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
									</div>
							    </div>
							 <!-- Fin : Modal Update Module -->
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
							 <!-- Début : Modal Add New chapitre -->
								<div id="chapitre_Add_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="chapitre_Add_Form" method="POST" action="../ClasseGenerique/Unite/Add" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Ajouter une chapitre au programme
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								      <div class="modal-body">
												<div class="form-group row">
												  <label for="classe_Label" class="col-sm-3 control-label">Nom de chapitre</label>
												  <div class="col-sm-9">
												    <input id="classe_Label"  type="text" class="form-control" name="chapitre" required  />
												  </div>
												</div>
								          		<div class="form-group row">
										    		<label for="classe_code" class="col-sm-3 control-label">Matiere</label>
												    <div class="col-sm-9">
												      <select id="classe_Cycle" class="form-control" name="Matiere"  required>
												      </select>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="classe_Filiere" class="col-sm-3 control-label">Module</label>
												  <div class="col-sm-9">
												    <select id="classe_Filiere" class="form-control" name="Module" required>
												    </select>
												  </div>
												</div>
												<div class="form-group row">
												  <label for="classe_Label" class="col-sm-3 control-label">Description</label>
												  <div class="col-sm-9">
												    <textarea id="classe_Label"   class="form-control" name="descri">
												    </textarea>
												  </div>
												</div>								
								      	</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
									</div>
							    </div>
							 <!-- Fin : Modal Add New chapitre -->
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
										  	<a class="dropdown-item unite-update text-primary" href="#" uniteId="'+response[i].unite.id+'" classeGUniteId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
										  	<a class="dropdown-item unite-matiere-add text-primary" href="#" uniteId="'+response[i].unite.id+'" classeGUniteId="'+response[i].id+'"><span class="fa fa-plus mr-4"></span>Ajouter une matière</a> \
										  	<a class="dropdown-item unite-delete text-primary" href="#" uniteId="'+response[i].unite.id+'" classeGUniteId="'+response[i].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
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
										  	<a class="dropdown-item matiere-update text-primary" href="#" matiereId="'+response[i].configurationMatieres[j].matiere.id+'" configurationMatiereId="'+response[i].configurationMatieres[j].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
										  	<a class="dropdown-item matiere-module-add text-primary" href="#" matiereId="'+response[i].configurationMatieres[j].matiere.id+'" configurationMatiereId="'+response[i].configurationMatieres[j].id+'"><span class="fa fa-plus mr-4"></span>Ajouter un module</a> \
										  	<a class="dropdown-item matiere-delete text-primary" href="#" matiereId="'+response[i].configurationMatieres[j].matiere.id+'" configurationMatiereId="'+response[i].configurationMatieres[j].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
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
											  	<a class="dropdown-item module-update text-primary" href="#" moduleId="'+response[i].configurationMatieres[j].configurationModules[k].module.id+'" configurationModuleId="'+response[i].configurationMatieres[j].configurationModules[k].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
											  	<a class="dropdown-item chapitre-Ajouter text-primary" href="#" moduleId="'+response[i].configurationMatieres[j].configurationModules[k].module.id+'" configurationModuleId="'+response[i].configurationMatieres[j].configurationModules[k].id+'"><span class="fa fa-pen mr-4"></span>Ajouter un chapitre</a> \
											  	<a class="dropdown-item module-delete text-primary" href="#" moduleId="'+response[i].configurationMatieres[j].configurationModules[k].module.id+'" configurationModuleId="'+response[i].configurationMatieres[j].configurationModules[k].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
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
			
  			/********** Ajouter une nouvelle Unité **********************/
  			//Effacer dabord le formulaire
  			$('#unite_Add_Modal').on('shown.bs.modal', function(evt){
  				//Effacer le formulaire
  				$('#unite_Add_Form').trigger('reset');
  				//Effacer le select des Unités
  				$('#unite_Add_Form select[name=unite]').html("");
  				//Charger toutes les Unités dans le select Unité
  				$.ajax({
					url : "../Unite/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#unite_Add_Form select[name=unite]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				
  			});
  			
  			//Envoyer le formulaire via ajax
  			$("#unite_Add_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#unite_Add_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError').modal('show'); 
				        },
					complete: function (response,textStatus ,jqXHR) {
				    	
						//Effacer le DataTable Unites
						$('#data_table_unites tbody').html("");
			  			//Raffrichir le DataTable Unites
						populateUniteDataTable();    
				    }
				});
				return false;
			});	
  			
  			/*********** Modification d'un Unite ****************
  			/* 1 - Récuperer l' Id du Unite séléctionner sur la DataTable Unites
  			/* 2 - Charger par ajax le Unite concerné
  			/* 3 - Remplir les champs de formulaire de modification avec les données du Unite concerné
  			/* 4 - Afficher le formulaire de modification
  			*****************************************************/
  			
  			$('#data_table_unites').on('click','.unite-update', function(evt){
				$this = $(this);
				var classeGUniteId=$this.attr('classeGUniteId');
				//Effacer le formulaire
  				$('#unite_Update_Form').trigger('reset');
  				//Effacer le select des Unités
  				$('#unite_Update_Form select[name=unite]').html("");
  				//Charger toutes les Unités dans le select Unité
  				$.ajax({
					url : "../Unite/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#unite_Update_Form select[name=unite]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				//Charger les anciennes valeurs à modifier
				$.ajax({
					url : '../ClasseGenerique/Unite/Details?classeGUniteId='+classeGUniteId,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						var option = '<option class="bg-danger text-white" value="'+response.unite.id+'">'+response.unite.nom_Fr+'</option>';
						$('#unite_Update_Form select[name=unite]').prepend(option);
						$('#unite_Update_Form select[name=unite]').val(response.unite.id);
						$('#unite_Update_Form input[name=noteEliminatoire]').val(response.noteEliminatoire);
						$('#unite_Update_Form input[name=classeGUnitId]').val(response.id);
						
						$('#unite_Update_Modal').modal('show');
						
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				
				return false;
			});
  			
  			/* 5- Envoie du formulaire de modification */
  			
  			$("#unite_Update_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#unite_Update_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
						
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(response);
				   		$('#modalError').modal('show'); 
				        },
				    complete: function (response,textStatus ,jqXHR) {
				    	
						//Effacer le DataTable Unites
						$('#data_table_unites tbody').html("");
			  			//Raffrichir le DataTable Unites
						populateUniteDataTable();    
				    }   
				});
				return false;
			});	
  			/*********** Suppression d'un Unite ****************
  			/* 1 - Récuperer l' Id du Unite séléctionner sur la DataTable Unites
  			/* 2 - Supprimer par ajax le Unite concerné
  			*****************************************************/
  			
  			$('#data_table_unites').on('click','.unite-delete', function(evt){
				$this = $(this);
				var classeGUniteId= $this.attr('classeGUniteId');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
					
						$.ajax({
							url : '../ClasseGenerique/Unite/Delete?classeGUniteId='+classeGUniteId,
							type: "GET",
							dataType: 'json',
							success: function(response,textStatus ,jqXHR){
								$("#modalSuccess .modal-body p").html("");
								$("#modalSuccess .modal-body p").html(response);
						   		$('#modalSuccess').modal('show');
						    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
						    	
						    },
						    error: function(response,textStatus ,jqXHR){
						    	$("#modalError .modal-body p").html("");
								$("#modalError .modal-body p").html(jqXHR.responseText);
						   		$('#modalError').modal('show'); 
						    },
						    complete: function (response,textStatus ,jqXHR) {
						    	
								//Effacer le DataTable Unites
								$('#data_table_unites tbody').html("");
					  			//Raffrichir le DataTable Unites
								populateUniteDataTable();    
						    }
						});
				  });
				
				
				return false;
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
  			
  			
  			/********** Ajouter une nouvelle Matiere à l'unité**********************/
  			
  			$('#data_table_unites').on('click','.unite-matiere-add', function(evt){
  				$this = $(this);
				var classeGUniteId= $this.attr('classeGUniteId'); 
  				//Effacer le formulaire
  				$('#matiere_Add_Form').trigger('reset');
  				//Effacer les select du formulaire
  				$('#matiere_Add_Form select[name=matiere]').html("");
  				$('#matiere_Add_Form select[name=periode]').html("");
  				$('#matiere_Add_Form select[name=formeControle]').html("");
  				
  				/*
  				/* Induquer l'id de l'enregistrement de la table ClasseGunite correspondant 
  				/* à l'unité sur laquelle on veut ajouter la matière. 
  				*/
  				
  				$('#matiere_Add_Form input[name=classeGUniteId]').val(classeGUniteId);
  				//Charger toutes les Matères dans le select Matière 
  				$.ajax({
					url : "../Matiere/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].code+'</option>';
							$('#matiere_Add_Form select[name=matiere]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				//Charger toutes les périodes dans le select Periodes
  				$.ajax({
					url : "../Periode/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#matiere_Add_Form select[name=periode]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				//Charger toutes les formes d'examen dans le select Forme Controle
  				$.ajax({
					url : "../FormeEvaluation/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#matiere_Add_Form select[name=formeControle]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				$('#matiere_Add_Modal').modal('show');
  			});
  			//Envoyer le formulaire via ajax
  			$("#matiere_Add_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#matiere_Add_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError').modal('show'); 
				        },
					complete: function (response,textStatus ,jqXHR) {
						//Effacer le DataTable Unites
						$('#data_table_unites tbody').html("");
			  			//Raffrichir le DataTable Unites
						populateUniteDataTable();    
				    }
				});
				return false;
			});	
  			
  			/*********** Modification d'une Matiere *************
  			/* 1 - Récuperer l'Id de la Matière séléctionnée sur la DataTable Matieres
  			/* 2 - Charger par ajax le Matiere concernée
  			/* 3 - Remplir les champs de formulaire de modification avec les données de la Matière concernée
  			/* 4 - Afficher le formulaire de modification
  			*****************************************************/
  			
  			$('#data_table_unites').on('click','.matiere-update', function(evt){
				$this = $(this);
				var configurationMatiereId= $this.attr('configurationMatiereId');
				
				//Effacer le formulaire
  				$('#matiere_Update_Form').trigger('reset');
  				//Effacer les select du formulaire
  				$('#matiere_Update_Form select[name=matiere]').html("");
  				$('#matiere_Update_Form select[name=periode]').html("");
  				$('#matiere_Update_Form select[name=formeControle]').html("");
  				
  			//Charger toutes les Matères dans le select Matière 
  				$.ajax({
					url : "../Matiere/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#matiere_Update_Form select[name=matiere]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				//Charger toutes les périodes dans le select Periodes
  				$.ajax({
					url : "../Periode/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#matiere_Update_Form select[name=periode]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				//Charger toutes les formes d'examen dans le select Forme Controle
  				$.ajax({
					url : "../FormeEvaluation/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#matiere_Update_Form select[name=formeControle]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				
  				//Charger la configuration ancienne de la matière à changer
  				
				$.ajax({
					url : "../ClasseGenerique/Unite/Matiere/Details?configurationMatiereId="+configurationMatiereId,
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						$("#matiere_Update_Form input[name=configurationMatiereId]").val(response.id);
						$("#matiere_Update_Form input[name=classeGUniteId]").val(response.classeGUnite.id);
						$("#matiere_Update_Form input[name=volumeHoraire]").val(response.volumeHoraire);
						$("#matiere_Update_Form input[name=horaireS1]").val(response.horaireS1);
						$("#matiere_Update_Form input[name=horaireS2]").val(response.horaireS2);
						$("#matiere_Update_Form input[name=nbreControles]").val(response.nbreControles);
						$("#matiere_Update_Form input[name=noteEliminatoire]").val(response.noteEliminatoire);
						
						var optMatiere = '<option class="bg-danger text-white" value="'+response.matiere.id+'">'+response.matiere.nom_Fr+'</option>';
						$('#matiere_Update_Form select[name=matiere]').prepend(optMatiere);
						$('#matiere_Update_Form select[name=matiere]').val(response.matiere.id);
						
						var optPeriode = '<option class="bg-danger text-white" value="'+response.periode.id+'">'+response.periode.nom_Fr+'</option>';
						$('#matiere_Update_Form select[name=periode]').prepend(optPeriode);
						$('#matiere_Update_Form select[name=periode]').val(response.periode.id);
						
						var optFormeControle = '<option class="bg-danger text-white" value="'+response.formeControle.id+'">'+response.formeControle.nom_Fr+'</option>';
						$('#matiere_Update_Form select[name=formeControle]').prepend(optFormeControle);
						$('#matiere_Update_Form select[name=formeControle]').val(response.formeControle.id);
			
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				$('#matiere_Update_Modal').modal('show');
			});
  			/* 5- Envoie du formulaire de modification */
  			
  			$("#matiere_Update_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#matiere_Update_Modal').modal('hide');		//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(response);
				   		$('#modalError').modal('show'); 
				    },
				   complete: function (response,textStatus ,jqXHR) {
					 	//Effacer le DataTable Unites
						$('#data_table_unites tbody').html("");
			  			//Raffrichir le DataTable Unites
						populateUniteDataTable(); 
			  			    
				    }
				});
				return false;
			});
  			
  			/*********** Suppression d'une Matière ****************
  			/* 1 - Récuperer l' Id de la matière séléctionnée sur la DataTable Unites
  			/* 2 - Supprimer par ajax la matière concernée
  			*****************************************************/
  			
  			$('#data_table_unites').on('click','.matiere-delete', function(evt){
				$this = $(this);
				var configurationMatiereId= $this.attr('configurationMatiereId');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
					
						$.ajax({
							url : "../ClasseGenerique/Unite/Matiere/Delete?configurationMatiereId="+configurationMatiereId,
							type: "GET",
							dataType: 'json',
							success: function(response,textStatus ,jqXHR){
								$("#modalSuccess .modal-body p").html("");
								$("#modalSuccess .modal-body p").html(response);
						   		$('#modalSuccess').modal('show');
						    	
						    },
						    error: function(response,textStatus ,jqXHR){
						    	$("#modalError .modal-body p").html("");
								$("#modalError .modal-body p").html(jqXHR.responseText);
						   		$('#modalError').modal('show'); 
						    },
						    complete: function (response,textStatus ,jqXHR) {
						    	
								//Effacer le DataTable Unites
								$('#data_table_unites tbody').html("");
					  			//Raffrichir le DataTable Unites
								populateUniteDataTable();    
						    }
						});
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
  			
			/********** Ajouter un nouveau Module à la Matiere de l'unité**********************/
  			
  			$('#data_table_unites').on('click','.matiere-module-add', function(evt){
  				$this = $(this);
				var configurationMatiereId= $this.attr('configurationMatiereId'); 
  				//Effacer le formulaire
  				$('#module_Add_Form').trigger('reset');
  				//Effacer les select du formulaire
  				$('#module_Add_Form select[name=module]').html("");
  				$('#module_Add_Form select[name=periode]').html("");
  				$('#module_Add_Form select[name=formeControle]').html("");
  				
  				/*
  				/* Induquer l'id de l'enregistrement de la table ConfigurationMatiere correspondant 
  				/* à la matière sur laquelle on veut ajouter le module. 
  				*/
  				
  				$('#module_Add_Form input[name=configurationMatiereId]').val(configurationMatiereId);
  				//Charger tout les modules dans le select Module
  				$.ajax({
					url : "../Module/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#module_Add_Form select[name=module]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				//Charger toutes les périodes dans le select Periodes
  				$.ajax({
					url : "../Periode/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#module_Add_Form select[name=periode]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				
  				//Charger toutes les formes d'examen dans le select Forme Controle
  				$.ajax({
					url : "../FormeEvaluation/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#module_Add_Form select[name=formeControle]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				$('#module_Add_Modal').modal('show');
  			});
  			//Envoyer le formulaire via ajax
  			$("#module_Add_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#module_Add_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError').modal('show'); 
				        },
					complete: function (response,textStatus ,jqXHR) {
						//Effacer le DataTable Unites
						$('#data_table_unites tbody').html("");
			  			//Raffrichir le DataTable Unites
						populateUniteDataTable();    
				    }
				});
				return false;
			});	
  			
  			
  			
  			
  			
  			/*********** Modification d'un Module *************
  			/* 1 - Récuperer l'Id du module séléctionné sur la DataTable unites
  			/* 2 - Charger par ajax le Module concerné
  			/* 3 - Remplir les champs de formulaire de modification avec les données du Module concerné
  			/* 4 - Afficher le formulaire de modification
  			*****************************************************/
  			
  			$('#data_table_unites').on('click','.module-update', function(evt){
				$this = $(this);
				var configurationModuleId= $this.attr('configurationModuleId');
				
				//Effacer le formulaire
  				$('#module_Update_Form').trigger('reset');
  				//Effacer les select du formulaire
  				$('#module_Update_Form select[name=module]').html("");
  				$('#module_Update_Form select[name=periode]').html("");
  				$('#module_Update_Form select[name=formeControle]').html("");
  				
  			//Charger tout les Module dans le select Module 
  				$.ajax({
					url : "../Module/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#module_Update_Form select[name=module]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				//Charger toutes les périodes dans le select Periodes
  				$.ajax({
					url : "../Periode/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#module_Update_Form select[name=periode]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				//Charger toutes les formes d'examen dans le select Forme Controle
  				$.ajax({
					url : "../FormeEvaluation/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var option = '<option value="'+response[i].id+'">'+response[i].nom_Fr+'</option>';
							$('#module_Update_Form select[name=formeControle]').append(option);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
  				
  				//Charger la configuration ancienne du Module à changer
  				
				$.ajax({
					url : "../ClasseGenerique/Unite/Matiere/Module/Details?configurationModuleId="+configurationModuleId,
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						$("#module_Update_Form input[name=configurationModuleId]").val(response.id);
						$("#module_Update_Form input[name=configurationMatiereId]").val(response.configurationMatiere.id);
						$("#module_Update_Form input[name=volumeHoraire]").val(response.volumeHoraire);
						$("#module_Update_Form input[name=horaireS1]").val(response.horaireS1);
						$("#module_Update_Form input[name=horaireS2]").val(response.horaireS2);
						
						$("#module_Update_Form input[name=nbreControles]").val(response.nbreControles);
						$("#module_Update_Form input[name=noteEliminatoire]").val(response.noteEliminatoire);
						
						var optModule = '<option class="bg-danger text-white" value="'+response.module.id+'">'+response.module.nom_Fr+'</option>';
						$('#module_Update_Form select[name=module]').prepend(optModule);
						$('#module_Update_Form select[name=module]').val(response.module.id);
						
						var optPeriode = '<option class="bg-danger text-white" value="'+response.periode.id+'">'+response.periode.nom_Fr+'</option>';
						$('#module_Update_Form select[name=periode]').prepend(optPeriode);
						$('#module_Update_Form select[name=periode]').val(response.periode.id);
						
						var optFormeControle = '<option class="bg-danger text-white" value="'+response.formeControle.id+'">'+response.formeControle.nom_Fr+'</option>';
						$('#module_Update_Form select[name=formeControle]').prepend(optFormeControle);
						$('#module_Update_Form select[name=formeControle]').val(response.formeControle.id);
			
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				$('#module_Update_Modal').modal('show');
			});
  			/* 5- Envoie du formulaire de modification */
  			
  			$("#module_Update_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#module_Update_Modal').modal('hide');		//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(response);
				   		$('#modalError').modal('show'); 
				    },
				   complete: function (response,textStatus ,jqXHR) {
					 	//Effacer le DataTable Unites
						$('#data_table_unites tbody').html("");
			  			//Raffrichir le DataTable Unites
						populateUniteDataTable(); 
			  			    
				    }
				});
				return false;
			});


  			/*********** Suppression d'un Module ****************
  			/* 1 - Récuperer l' Id du Module séléctionné sur la DataTable Unites
  			/* 2 - Supprimer par ajax le Module concerné
  			*****************************************************/
  			
  			$('#data_table_unites').on('click','.module-delete', function(evt){
				$this = $(this);
				var configurationModuleId= $this.attr('configurationModuleId');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
					
						$.ajax({
							url : "../ClasseGenerique/Unite/Matiere/Module/Delete?configurationModuleId="+configurationModuleId,
							type: "GET",
							dataType: 'json',
							success: function(response,textStatus ,jqXHR){
								$("#modalSuccess .modal-body p").html("");
								$("#modalSuccess .modal-body p").html(response);
						   		$('#modalSuccess').modal('show');
						    	
						    },
						    error: function(response,textStatus ,jqXHR){
						    	$("#modalError .modal-body p").html("");
								$("#modalError .modal-body p").html(jqXHR.responseText);
						   		$('#modalError').modal('show'); 
						    },
						    complete: function (response,textStatus ,jqXHR) {
						    	
								//Effacer le DataTable Unites
								$('#data_table_unites tbody').html("");
					  			//Raffrichir le DataTable Unites
								populateUniteDataTable();    
						    }
						});
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
  	
  
  		 /********** Ajouter une nouvelle chapitre **********************/
  		//Effacer dabord le formulaire
  		$('#data_table_unites').on('click','.chapitre-Ajouter', function(evt){
  			//Effacer le formulaire
  			$('#chapitre_Add_Form').trigger('reset');
  			//Effacer les select du formulaire
  			$('#chapitre_Add_Form select[name=Matiere]').html("");
  			$('#chapitre_Add_Form select[name=Module]').html("");
  			$('#chapitre_Add_Modal').modal('show');
  		});
  			
        // Chargement des chapitres dans Select chapitre

    </script>
   
</body>
</html>