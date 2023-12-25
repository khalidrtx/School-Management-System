<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<title>Années scolaires</title>
  	
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
		<div class="panel with-nav-tabs panel-primary">
		     <div class="panel-heading">
					<nav class="nav nav-tabs flex-column flex-sm-row"  id="Tab-Content" role="tablist">
					    <a id="tab_AnneeScolaires" href="#content-tab-AnneeScolaires" class="nav-item nav-link active" data-toggle="tab" role="tab" aria-controls="content-tab-AnneeScolaires" aria-selected="false">
					        <i class="fa fa-calendar-alt mr-2"></i> Année scolaire courante
					    </a>
					    <a id="tab_Gestion_AnneeScolaires" href="#content-tab-GestionAnneeScolaires" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-css" aria-selected="false">
					        <i class="fa fa-calendar-alt mr-2"></i> Gerer les années scolaires
					    </a>
					    <a id="tab_Gestion_Perioes" href="#content-tab-GestionPeriodes" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-css" aria-selected="false">
					        <i class="fa fa-calendar-alt mr-2"></i> Gerer les périodes
					    </a>
					</nav>
			</div>
		    <div class="panel-body">
		    	<!-- Tab content -->
				<div class="tab-content" id="Tab-Content">
						<!-- Content tab 1 	: Année Scolaire-->
					  	<div id="content-tab-AnneeScolaires" class="tab-pane active" role="tabpanel" aria-labelledby="content-tab-AnneeScolaires">
					   		
					   		<div class="alert alert-warning">
							  <button type="button" data-dismiss="alert" aria-hidden="true" class="close">×</button>
							  <div class="row">  
							    <div class="col-md-2">
							      <i class="fa fa-exclamation-triangle text-danger" style="font-size:6vw;"></i>
							    </div>
							    <div class="col-md-10">
							      <strong>Important !</strong>
							      <p>
							      	Au début de chaque année scolaire la personne habilité à accéder à cet espace, 
							      	doit choisir l'année scolaire courante. 
							      	Tout le fontionnement de la plate-forme est tributaire de ce choix.
							      </p>
							    </div>
							   </div>
							    
							  </div>
					   		
					   		<div class="alert bg-light text-secondary" role="alert">
					   		
					   			<div class="form-group row">
									    <label for="anneScolaireCourante" class="col-sm-5 col-form-label">
									    	<i class="fa fa-calendar-alt mr-2"></i>
					   						Année scolaire courante
									    </label>
									    <div class="col-sm-7">
									    	<div class="input-group mb-3">
											  	<div class="input-group-prepend">
											    <button id="lock_anneeScolaireCourante_Selector" class="btn btn-outline-info"><span class="fa fa-unlock" title="Déverouiller"></span></button>
											  	</div>
											  		<select id="anneeScolaireCourante_Selector" class="form-control" name="anneScolaireCourante" disabled required>
														<!-- On inserre ici dynamiquement l'année scolaire courante et autres annnées scolaire -->
													</select>
											</div>
									    </div>
								 </div> 
							</div>
							
						</div>
						<!-- /Content tab 1 : Année Scolaire-->
						<!-- Content tab 2 	: Gestion Annees Scolaires-->
						<div id="content-tab-GestionAnneeScolaires" class="tab-pane"  role="tabpanel" aria-labelledby="tab-css">
						    			<div class="alert bg-light text-secondary" role="alert">
								   			<i class="fa fa-calendar-alt mr-2"></i>
								   			Années Scolaires
									        <a href="#" data-toggle="modal" data-target="#anneeScolaire_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter une anneeScolaire"><i class="fa fa-plus"></i></a>
									        
										</div>
										<table id="data_table_anneeScolaires" class="table table-striped table-bordered" cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>N°</th>
													<th>Année Scolaire</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
										<!-- Début : Modal Add New AnneeScolaire -->
											<div id="anneeScolaire_Add_Modal" class="modal" tabindex="-1" role="dialog">
												<div class="modal-dialog">
												<form id="anneeScolaire_Add_Form" method="POST" action="../AnneeScolaire/Add" autocomplete="off" >
											      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
											          	<div class="modal-header bg-info">
											        		<h4 class="modal-title text-white">
											        			Ajouter une année scolaire
											        		</h4>
											        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										    					<span aria-hidden="true">&times;</span>
										  					</button>
											        	</div>
											          	<div class="modal-body">
											          		<div class="form-group row">
													    		<label for="anneeScolaire_code" class="col-sm-3 control-label">Code</label>
															    <div class="col-sm-9">
															      <input id="anneeScolaire_code" type="text" class="form-control" name="code" placeholder="Exemple : 2019/2020"/ required>
															    </div>
													  		</div>
															<div class="form-group row">
															  <label for="anneeScolaire_Date_Debut" class="col-sm-3 control-label">Date début</label>
															  <div class="col-sm-9">
															    <input id="anneeScolaire_Date_Debut" type="text" class="form-control text-field" name="dateDebut" placeholder="Date de début" required/>
															  </div>
															</div>
													  		<div class="form-group row">
															  <label for="anneeScolaire_Date_Fin" class="col-sm-3 control-label">Date fin</label>
															  <div class="col-sm-9">
															    <input id="anneeScolaire_Date_Fin" type="text" class="form-control" name="dateFin" placeholder="Date de fin" required/>
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
										 <!-- Fin : Modal Add New AnneeScolaire -->
										 <!-- Début : Modal Update AnneeScolaire -->
											<div id="anneeScolaire_Update_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
												<div class="modal-dialog">
												<form id="anneeScolaire_Update_Form" method="POST" action="../AnneeScolaire/Update" >
											      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
											          	<div class="modal-header bg-info">
											        		<h4 class="modal-title text-white">
											        			Modifier l'année scolaire
											        		</h4>
											        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										    					<span aria-hidden="true">&times;</span>
										  					</button>
											        	</div>
											          	<div class="modal-body">
											          		<div class="form-group row">
													    		<label for="anneeScolaire_code" class="col-sm-3 control-label">Code</label>
															    <div class="col-sm-9">
															      <input  type="hidden" class="form-control" name="id" />
															      <input id="anneeScolaire_code" type="text" class="form-control" name="code" placeholder="Exemple : 2019/2020" required/>
															    </div>
													  		</div>
															<div class="form-group row">
															  <label for="anneeScolaire_Date_Debut_Update" class="col-sm-3 control-label">Date début</label>
															  <div class="col-sm-9">
															    <input id="anneeScolaire_Date_Debut_Update" type="text" class="form-control text-field" name="dateDebut" placeholder="Date de début" required/>
															  </div>
															</div>
													  		<div class="form-group row">
															  <label for="anneeScolaire_Date_Fin_Update" class="col-sm-3 control-label">Date fin</label>
															  <div class="col-sm-9">
															    <input id="anneeScolaire_Date_Fin_Update" type="text" class="form-control text-field" name="dateFin" placeholder="Date de fin" required/>
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
										 <!-- Fin : Modal Update AnneeScolaire -->
										 
										 <!-- Début : Modal Details AnneeScolaire -->
											<div id="anneeScolaire_Details_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
												<div class="modal-dialog">
											      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
											          	<div class="modal-header bg-info">
											        		<h4 class="modal-title text-white">
											        			Détails de l'année scolaire
											        		</h4>
											        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										    					<span aria-hidden="true">&times;</span>
										  					</button>
											        	</div>
											          	<div class="modal-body">
											          		<ul class="list-group">
																<!-- Affichage dynamique des détails du anneeScolaire-->
															</ul>
														</div>
														<div class="modal-footer ">
															<button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Fermer</button>
														</div>
											        </div>
												</div>
										    </div>
										 <!-- Fin : Modal Details AnneeScolaire -->
								
							
						</div>
						<!-- /Content tab 2	: Gestion Annees Scolaires-->
						<!-- Content tab 3 	: Gestion des périodes-->
						<div id="content-tab-GestionPeriodes" class="tab-pane"  role="tabpanel" aria-labelledby="tab-css">
    						<div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-list-ol mr-2"></i>
					   			Périodes
						        <a href="#" data-toggle="modal" data-target="#periode_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter un periode"><i class="fa fa-plus"></i></a>
						    </div>
							<table id="data_table_periodes" class="table table-striped table-bordered" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>N°</th>
										<th>Code</th>
										<th>Nom</th>
							            <th>Action</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							<!-- Début : Modal Add New Periode -->
								<div id="periode_Add_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="periode_Add_Form" method="POST" action="../Periode/Add" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Ajouter une période
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="periode_code" class="col-sm-3 control-label">Code de la période</label>
												    <div class="col-sm-9">
												      <input id="periode_code" type="text" class="form-control" name="code" placeholder="Code de la période" required/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="periode_Nom_Fr" class="col-sm-3 control-label">Nom de la période</label>
												  <div class="col-sm-9">
												    <input id="periode_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom de la periode en français" required/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="periode_Nom_Ar" class="col-sm-3 control-label">إسم الفصل</label>
												  <div class="col-sm-9">
												    <input id="periode_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم الفصل  بالعربية"/>
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
							 <!-- Fin : Modal Add New Periode -->
							 <!-- Début : Modal Update Periode -->
								<div id="periode_Update_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
									<div class="modal-dialog">
									<form id="periode_Update_Form" method="POST" action="../Periode/Update" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Modifier la période
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="periode_code" class="col-sm-3 control-label">Code de la période</label>
												    <div class="col-sm-9">
												      <input  type="hidden" class="form-control" name="id" />
												      <input id="periode_code" type="text" class="form-control" name="code" placeholder="Code de la période"/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="periode_Nom_Fr" class="col-sm-3 control-label">Nom de la période</label>
												  <div class="col-sm-9">
												    <input id="periode_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom de la période en français"/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="periode_Nom_Ar" class="col-sm-3 control-label">إسم الفصل</label>
												  <div class="col-sm-9">
												    <input id="periode_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم الفصل  بالعربية"/>
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
							 <!-- Fin : Modal Update Periode -->
							 <!-- Début : Modal Details Periode -->
								<div id="periode_Details_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
									<div class="modal-dialog">
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Détails de la période
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<ul class="list-group">
													<!-- Affichage dynamique des détails du periode-->
												</ul>
											</div>
											<div class="modal-footer ">
												<button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Fermer</button>
											</div>
								        </div>
									</div>
							    </div>
							   <!-- Fin : Modal Details Periode -->
						</div>
						<!-- /Content tab 3	: Gestion des périodes-->
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
					        <span class="fa fa-newspaper"></span>Actualites
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
<!-- Début : Moad Confirmation supprimer-->
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
<!-- Fin : Moad Confirmation supprimer-->
<!-- Début : Moad Confirmation changer année scolaire courante-->
<div id="modalConfirmChange" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-confirm " role="document">
		<div class="modal-content">
		  <div class="modal-header">
				<div class="icon-box bg-warning">
					<i class="material-icons fa fa-exclamation-triangle"></i>
				</div>				
				<h4 class="modal-title text-center">Confirmation ?</h4>	
		  </div>
		  <div class="modal-body">
				<p class="text-center">
					Etes vous sûre de vouloir changer l'année scolaire courante ?
				</p>
		  </div>
		  <div class="modal-footer">
		    <button type="button" data-dismiss="modal" class="btn btn-warning  mr-auto" id="changer">Confirmer</button>
		    <button type="button" data-dismiss="modal" class="btn btn-secondary  ">Annuler</button>
		  </div>
		 </div>
  	</div>
</div>
<!-- Fin : Moad Confirmation changer année scolaire courante-->
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
		
		/************ chargement de l'année scolaire courante *************/
		function loadAnneeScolaireCourante(){
			//Effacer le contenu du select
			$("#anneeScolaireCourante_Selector").html("");
           //Chargement de toutes les années scolaires dans le Select : anneeScolaireCourante_Selector
 				$.ajax({
				url : "../AnneeScolaire/List",
				type: "GET",
				dataType: 'json',
				contentType: "application/json; charset=UTF-8",
				success: function(response,textStatus ,jqXHR){
					for(i=0;i<response.length;i++){
						var item  ='<option value="'+response[i].id+'">'+response[i].code+'</option>';
						$("#anneeScolaireCourante_Selector").append(item);       
					}	
			    },
			    error: function(response,textStatus ,jqXHR){
			    	$("#modalError .modal-body p").html("");
					$("#modalError .modal-body p").html(jqXHR.responseText);
			   		$('#modalError .modal-body p').modal('show'); 
			        }
			});
 		    //Chargement de L'année scolaire courante dans la première option du Select : anneeScolaireCourante_Selector
 				$.ajax({
				url : "../AnneeScolaireCourante/List",
				type: "GET",
				dataType: 'json',
				contentType: "application/json; charset=UTF-8",
				success: function(response,textStatus ,jqXHR){
					for(i=0;i<response.length;i++){
						var item  ='<option class="bg-danger text-white" value="'+response[i].anneeScolaire.id+'">'+response[i].anneeScolaire.code+'</option>';
						$("#anneeScolaireCourante_Selector").prepend(item); 
						$("#anneeScolaireCourante_Selector").val(response[i].anneeScolaire.id);
					}	
			    },
			    error: function(response,textStatus ,jqXHR){
			    	$("#modalError .modal-body p").html("");
					$("#modalError .modal-body p").html(jqXHR.responseText);
			   		$('#modalError .modal-body p').modal('show'); 
			        }
			});
		};
		loadAnneeScolaireCourante();
		/********** Fin : Chargement de l'année scolaire courante **********/
		/****** Au changement du Select : anneeScolaireCourante_Selector, on Update l'année Scolaire Courante */
		$('#anneeScolaireCourante_Selector').change(function(){
			
			//On recupere l Id de l'année selectionnée
			var id=$(this).val();
			//On demande la confirmation de la modification
			$('#modalConfirmChange').modal('show');
			$('#modalConfirmChange').on('click', '#changer', function(e) {
				//On appelle le controleur de modification de l'annnée Scolaire courante
				$.ajax({
					url : "../AnneeScolaireCourante/Update?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        },
					complete: function (response,textStatus ,jqXHR) {
				    	//Reactiualiser le select
						loadAnneeScolaireCourante();  
				    }
				});
			    
			});
			// Verouillage du Select du choix de l'année scolaire
			$("#anneeScolaireCourante_Selector" ).prop( "disabled", true );
		});
		/******* Verouillage et déverouillage du select anneeScolaireCouranteSelector ****/
		/***  Etant donnée l'importance du choix de l'année scolaire courante : 
		/**	 J ai ajouter un bouton de Verouillage/Deverouiialde du Select du choix
		/** de l'année scolaire courante pour eviter de la modifier par inadvertance
		**/
		$('#lock_anneeScolaireCourante_Selector').on('click', function(e){
			var  select = $("#anneeScolaireCourante_Selector");
			if($("#anneeScolaireCourante_Selector" ).prop("disabled")){
				$("#anneeScolaireCourante_Selector" ).prop( "disabled", false );
				$("#lock_anneeScolaireCourante_Selector").prop( "title", "Verouiller" );
				$("#lock_anneeScolaireCourante_Selector span").removeClass("fa-lock");
				$("#lock_anneeScolaireCourante_Selector span").addClass("fa-unlock");
				
			}else{
				$("#anneeScolaireCourante_Selector" ).prop( "disabled", true );
				$("#lock_anneeScolaireCourante_Selector").prop( "title", "Déverouiller" );
				$("#lock_anneeScolaireCourante_Selector span").removeClass("fa-unlock");
				$("#lock_anneeScolaireCourante_Selector span").addClass("fa-lock");
			}
			
			e.preventDefault();
		});
  		/************** DataTable du Tab : AnneeScolaires **************/
  		// Initialisation du DataTable AnneeScolaires
  		$('#data_table_anneeScolaires').DataTable(
  			{	
  				"paging": true,
  				"autoWidth": true,
  				"columnDefs": [
  			  					{ "orderable": false, "targets": 2 }
  			  				],
  				dom: 'Bfrtip',
  		        buttons: [
  		            'copy', 
  		            'csv', 
  		            'excel', 
  		            'pdf', 
  		            'print'
  		        ]
  			}
  		);
  		/******* fonction pour charger la liste des AnneeScolaires dans la TableData AnneeScolaires ******/
		function populateAnneeScolaireDataTable(){
			var tableData = $('#data_table_anneeScolaires').DataTable();
			//tableData.DataTable().rows().remove().draw();		// Vider la TableData 
			$.ajax({
				url : "../AnneeScolaire/List",
				type: "GET",
				dataType: 'json',
				success: function(response,textStatus ,jqXHR){
					for(i=0;i<response.length;i++){
						var rang =i+1;
						var btns='<div class="btn-group dropleft"> \
							  <button type="button" class="btn btn-outline-info btn-sm" title="Actions"><span class="fa fa-ellipsis-h"></span></button> \
							  <button type="button" class="btn btn-outline-info btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> \
							    <span class="sr-only">Toggle Dropdown</span> \
							  </button> \
							  <div class="dropdown-menu shadow p-3 mb-5 bg-white rounded" id="dropdownUnite"> \
							    <div class="bg-info text-white px-3 py-1"><span class="fa fa-ellipsis-h mr-4"></span> Actions</div> \
						        <div class="dropdown-divider"></div> \
							  	<a class="dropdown-item anneeScolaire-details text-primary" href="#" anneeScolaireId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
							  	<a class="dropdown-item anneeScolaire-update text-primary" href="#"  anneeScolaireId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
							  	<a class="dropdown-item anneeScolaire-delete text-primary" href="#" anneeScolaireId="'+response[i].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
							  </div> \
							</div> ';
						tableData.row.add( [
						             rang,
						             response[i].code,
						             btns
						         ] ).draw( false );
					}
			    },
			    error: function(response,textStatus ,jqXHR){
			    	$("#modalError .modal-body p").html("");
					$("#modalError .modal-body p").html(jqXHR.responseText);
			   		$('#modalError .modal-body p').modal('show'); 
			        }
			});
		};
		
		/*
		/* Au chargement de la page en charge la liste des années scolaires 
		/*d ans le DataTable AnnéesScolaires
		*/
		
		populateAnneeScolaireDataTable();
	
		/* Au click sur le tab AnneeScolaires : 
		/* On charger la liste des AnneeScolaires dans la TableData AnneeScolaires
		*/
		
		$('#tab_Gestion_AnneeScolaires').on('click', function(e){
				// Effacer le DataTable AnneeScolaires
				$('#data_table_anneeScolaires').DataTable().rows().remove().draw();
				// Charger la liste des anneeScolaires dans le DataTable AnneeScolaires
	  			populateAnneeScolaireDataTable();
				e.preventDefault();
		});
		
			/********** Ajouter une nouvelle AnneeScolaire **********************/
			//Effacer dabord le formulaire
			$('#anneeScolaire_Add_Modal').on('shown.bs.modal', function(evt){
				$('#anneeScolaire_Add_Form').trigger('reset');
			});
			//Envoyer le formulaire via ajax
			$("#anneeScolaire_Add_Form").submit(function(event){ 
			var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
			var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
			var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
			$('#anneeScolaire_Add_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
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
			    	
					//Effacer le DataTable AnneeScolaires
					$('#data_table_anneeScolaires').DataTable().rows().remove().draw();
		  			//Raffrichir le DataTable AnneeScolaires
					populateAnneeScolaireDataTable();    
			    }
			});
			return false;
		});	
			
			/*********** Modification d'un AnneeScolaire ****************
			/* 1 - Récuperer l' Id du AnneeScolaire séléctionner sur la DataTable AnneeScolaires
			/* 2 - Charger par ajax le AnneeScolaire concerné
			/* 3 - Remplir les champs de formulaire de modification avec les données du AnneeScolaire concerné
			/* 4 - Afficher le formulaire de modification
			*****************************************************/
			
			$('#data_table_anneeScolaires').on('click','.anneeScolaire-update', function(evt){
			$this = $(this);
			var id= $this.attr('anneeScolaireId');
			$.ajax({
				url : "../AnneeScolaire/Details?id="+id,
				type: "GET",
				dataType: 'json',
				contentType: "application/json; charset=UTF-8",
				success: function(response,textStatus ,jqXHR){
									
					$("#anneeScolaire_Update_Form input[name=id]").val(response.id);
					$("#anneeScolaire_Update_Form input[name=code]").val(response.code);
					$("#anneeScolaire_Update_Form input[name=dateDebut]").val(response.dateDebut);
					$("#anneeScolaire_Update_Form input[name=dateFin]").val(response.dateFin);
					$('#anneeScolaire_Update_Modal').modal('show');
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
			
			$("#anneeScolaire_Update_Form").submit(function(event){ 
			var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
			var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
			var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
			$('#anneeScolaire_Update_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
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
			    	
					//Effacer le DataTable AnneeScolaires
					$('#data_table_anneeScolaires').DataTable().rows().remove().draw();
		  			//Raffrichir le DataTable AnneeScolaires
					populateAnneeScolaireDataTable();    
			    }   
			});
			return false;
		});	
			/*********** Suppression d'un AnneeScolaire ****************
			/* 1 - Récuperer l' Id du AnneeScolaire séléctionner sur la DataTable AnneeScolaires
			/* 2 - Supprimer par ajax le AnneeScolaire concerné
			*****************************************************/
			
			$('#data_table_anneeScolaires').on('click','.anneeScolaire-delete', function(evt){
			$this = $(this);
			var id= $this.attr('anneeScolaireId');
			$('#modalConfirm').modal('show');
			$('#modalConfirm').on('click', '#delete', function(e) {
				
					$.ajax({
						url : "../AnneeScolaire/Delete?id="+id,
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
					    	
							//Effacer le DataTable AnneeScolaires
							$('#data_table_anneeScolaires').DataTable().rows().remove().draw();
				  			//Raffrichir le DataTable AnneeScolaires
							populateAnneeScolaireDataTable();    
					    }
					});
			  });
			
			
			return false;
		});
			
			/*********** Affichage des détails d'un AnneeScolaire ****************
			/* 1 - Récuperer l' Id du AnneeScolaire séléctionner sur la DataTable AnneeScolaires
			/* 2 - Charger par ajax le AnneeScolaire concerné
			/* 3 - Afficher les détails du AnneeScolaire concerné 
			*****************************************************/
			
			$('#data_table_anneeScolaires').on('click','.anneeScolaire-details', function(evt){
			$this = $(this);
			var id= $this.attr('anneeScolaireId');
			$.ajax({
				url : "../AnneeScolaire/Details?id="+id,
				type: "GET",
				dataType: 'json',
				contentType: "application/json; charset=UTF-8",
				success: function(response,textStatus ,jqXHR){
					var codeItem ='<li class="list-group-item"><span><strong>Code  </strong></span><span class="float-right">'+response.code+'</span></li>';
					var nom_FrItem ='<li class="list-group-item"><span><strong>Date début  </strong></span><span class="float-right">'+response.dateDebut+'</span></li>';
					var nom_ArItem ='<li class="list-group-item"><span><strong>Date fin  </strong></span><span class="float-right">'+response.dateFin+'</span></li>';
					$("#anneeScolaire_Details_Modal .list-group").html("");
					$("#anneeScolaire_Details_Modal .list-group").append(codeItem);
					$("#anneeScolaire_Details_Modal .list-group").append(nom_FrItem);
					$("#anneeScolaire_Details_Modal .list-group").append(nom_ArItem);
					$('#anneeScolaire_Details_Modal').modal('show');
			    },
			    error: function(response,textStatus ,jqXHR){
			    	$("#modalError .modal-body p").html("");
					$("#modalError .modal-body p").html(jqXHR.responseText);
			   		$('#modalError .modal-body p').modal('show'); 
			        }
			});
			
			return false;
		});
			
		/****** Commande des Jquery DatePicker année scolaire : date début et date fin *******/
		
		  
			    $( "#anneeScolaire_Date_Debut" ).datepicker({
			    	 maxDate: 0,
			    	   changeMonth: true,
			    	   changeYear: true,
			    	   dateFormat: 'dd-mm-yy',
			    	   yearRange: '2000:2040'
			    	   
			    });
		 
			    $( "#anneeScolaire_Date_Fin" ).datepicker({
			    	 	maxDate: 0,
			    	   changeMonth: true,
			    	   changeYear: true,
			    	   dateFormat: 'dd-mm-yy',
			    	   yearRange: '2000:2040'
			    });
			    
			    $( "#anneeScolaire_Date_Debut_Update" ).datepicker({
			    	 maxDate: 0,
			    	   changeMonth: true,
			    	   changeYear: true,
			    	   dateFormat: 'dd-mm-yy',
			    	   yearRange: '2000:2040'
			    	   
			    });
		 
			    $( "#anneeScolaire_Date_Fin_Update" ).datepicker({
			    	 	maxDate: 0,
			    	   changeMonth: true,
			    	   changeYear: true,
			    	   dateFormat: 'dd-mm-yy',
			    	   yearRange: '2000:2040'
			    });
			
			    /************** DataTable du Tab : Periodes **************/
		  		// Initialisation du DataTable Periodes
		  		$('#data_table_periodes').DataTable(
		  			{	
		  				"paging": true,
		  				"autoWidth": true,
		  				"columnDefs": [
		  					{ "orderable": false, "targets": 3 }
		  				],
		  				dom: 'Bfrtip',
		  		        buttons: [
		  		            'copy', 
		  		            'csv', 
		  		            'excel', 
		  		            'pdf', 
		  		            'print'
		  		        ]
		  			}
		  		);
		  		/******* fonction pour charger la liste des Periodes dans la TableData Periodes ******/
				function populatePeriodeDataTable(){
					var tableData = $('#data_table_periodes').DataTable();
					//tableData.DataTable().rows().remove().draw();		// Vider la TableData 
					$.ajax({
						url : "../Periode/List",
						type: "GET",
						dataType: 'json',
						success: function(response,textStatus ,jqXHR){
							for(i=0;i<response.length;i++){
								var rang =i+1;
								var btns='<div class="btn-group dropleft"> \
											  <button type="button" class="btn btn-outline-info btn-sm" title="Actions"><span class="fa fa-ellipsis-h"></span></button> \
											  <button type="button" class="btn btn-outline-info btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> \
											    <span class="sr-only">Toggle Dropdown</span> \
											  </button> \
											  <div class="dropdown-menu shadow p-3 mb-5 bg-white rounded" id="dropdownPeriode"> \
											    <div class="bg-info text-white px-3 py-1"><span class="fa fa-ellipsis-h mr-4"></span> Actions</div> \
										        <div class="dropdown-divider"></div> \
											  	<a class="dropdown-item periode-details text-primary" href="#" periodeId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
											  	<a class="dropdown-item periode-update text-primary" href="#" periodeId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
											  	<a class="dropdown-item periode-delete text-primary" href="#" periodeId="'+response[i].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
											  </div> \
											</div> ';
								tableData.row.add( [
								             rang,
								             response[i].code,
								             response[i].nom_Fr,
								             btns
								         ] ).draw( false );
							}
					    },
					    error: function(response,textStatus ,jqXHR){
					    	$("#modalError .modal-body p").html("");
							$("#modalError .modal-body p").html(jqXHR.responseText);
					   		$('#modalError .modal-body p').modal('show'); 
					        }
					});
				};
				/* Au click sur le tab Periodes : 
				/* On charger la liste des Priodes dans la TableData Periodess
				*/
				
				$('#tab_Gestion_Perioes').on('click', function(e){
						// Effacer le DataTable Periodes
						$('#data_table_periodes').DataTable().rows().remove().draw();
						// Charger la liste des periodes dans le DataTable Periodess
			  			populatePeriodeDataTable();
						e.preventDefault();
				});
				
	  			/********** Ajouter une nouvelle Periode **********************/
	  			//Effacer dabord le formulaire
	  			$('#periode_Add_Modal').on('shown.bs.modal', function(evt){
	  				$('#periode_Add_Form').trigger('reset');
	  			});
	  			//Envoyer le formulaire via ajax
	  			$("#periode_Add_Form").submit(function(event){ 
					var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
					var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
					var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
					$('#periode_Add_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
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
					    	
							//Effacer le DataTable Periodes
							$('#data_table_periodes').DataTable().rows().remove().draw();
				  			//Raffrichir le DataTable Periodes
							populatePeriodeDataTable();    
					    }
					});
					return false;
				});	
	  			
	  			/*********** Modification d'une Periode ****************
	  			/* 1 - Récuperer l' Id de la Periode séléctionnée sur la DataTable Periodes
	  			/* 2 - Charger par ajax la Periode concernée
	  			/* 3 - Remplir les champs de formulaire de modification avec les données de la Periode concernée
	  			/* 4 - Afficher le formulaire de modification
	  			*****************************************************/
	  			
	  			$('#data_table_periodes').on('click','.periode-update', function(evt){
					$this = $(this);
					var id= $this.attr('periodeId');
					$.ajax({
						url : "../Periode/Details?id="+id,
						type: "GET",
						dataType: 'json',
						contentType: "application/json; charset=UTF-8",
						success: function(response,textStatus ,jqXHR){
							$("#periode_Update_Form input[name=id]").val(response.id);
							$("#periode_Update_Form input[name=code]").val(response.code);
							$("#periode_Update_Form input[name=nom_Fr]").val(response.nom_Fr);
							$("#periode_Update_Form input[name=nom_Ar]").val(response.nom_Ar);
							$('#periode_Update_Modal').modal('show');
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
	  			
	  			$("#periode_Update_Form").submit(function(event){ 
					var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
					var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
					var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
					$('#periode_Update_Modal').modal('hide');		//Fermer la fenetre modal apres envoie du formulaire
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
					    	
							//Effacer le DataTable Periodes
							$('#data_table_periodes').DataTable().rows().remove().draw();
				  			//Raffrichir le DataTable Periodes
							populatePeriodeDataTable();    
					    }   
					});
					return false;
				});	
	  			/*********** Suppression d'une Periode ****************
	  			/* 1 - Récuperer l' Id de la Periode séléctionnée sur la DataTable Periodes
	  			/* 2 - Supprimer par ajax la Periode concernée
	  			*****************************************************/
	  			
	  			$('#data_table_periodes').on('click','.periode-delete', function(evt){
					$this = $(this);
					var id= $this.attr('periodeId');
					$('#modalConfirm').modal('show');
					$('#modalConfirm').on('click', '#delete', function(e) {
						
							$.ajax({
								url : "../Periode/Delete?id="+id,
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
							    	
									//Effacer le DataTable Periodes
									$('#data_table_periodes').DataTable().rows().remove().draw();
						  			//Raffrichir le DataTable Periodes
									populatePeriodeDataTable();    
							    }
							});
					  });
					
					
					return false;
				});
	  			
	  			/*********** Affichage des détails d'une Periode ****************
	  			/* 1 - Récuperer l' Id de la Periode séléctionnée sur la DataTable Periodes
	  			/* 2 - Charger par ajax la Periode concernée
	  			/* 3 - Afficher les détails de la Periode concernée 
	  			*****************************************************/
	  			
	  			$('#data_table_periodes').on('click','.periode-details', function(evt){
					$this = $(this);
					var id= $this.attr('periodeId');
					$.ajax({
						url : "../Periode/Details?id="+id,
						type: "GET",
						dataType: 'json',
						contentType: "application/json; charset=UTF-8",
						success: function(response,textStatus ,jqXHR){
							var codeItem ='<li class="list-group-item"><span><strong>Code  </strong></span><span class="float-right">'+response.code+'</span></li>';
							var nom_FrItem ='<li class="list-group-item"><span><strong>Nom de la periode  </strong></span><span class="float-right">'+response.nom_Fr+'</span></li>';
							var nom_ArItem ='<li class="list-group-item"><span><strong>إسم الفصل  </strong></span><span class="float-right" dir="rtl">'+response.nom_Ar+'</span></li>';
							$("#periode_Details_Modal .list-group").html("");
							$("#periode_Details_Modal .list-group").append(codeItem);
							$("#periode_Details_Modal .list-group").append(nom_FrItem);
							$("#periode_Details_Modal .list-group").append(nom_ArItem);
							$('#periode_Details_Modal').modal('show');
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