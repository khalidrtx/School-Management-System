<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<title>Cahier Texte</title>
  	
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstap.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css" >
	<script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
		
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
	      	<%@include file="MenuInspecteur.jsp" %>
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
					      <a class="dropdown-item" href="${pageContext.request.contextPath}/E.Inspecteur/Profile?userId=${sessionScope.userID}">
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
					    <a id="tab_CahierTexte" href="#content-tab-CahierTexte" class="nav-item nav-link active" data-toggle="tab" role="tab" aria-controls="content-tab-CahierTexte" aria-selected="false">
					        <lord-icon
								    src="https://cdn.lordicon.com/qvbrkejx.json"
								    trigger="morph"
								    style="width:20px;height:20px ; padding : 5px; margin-right:4px">
								</lord-icon>  cahier texte
					        <!-- <i class="fa fa-calendar-alt mr-2"></i> Cahier Texte -->
					    </a>
					    <a id="tab_Gestion_inspection" href="#content-tab-inspection" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-css" aria-controls="content-tab-inspection" aria-selected="false">
					       <lord-icon
							    src="https://cdn.lordicon.com/msoeawqm.json"
							    trigger="hover"
							    style="width:30px;height:20px ; padding : 5px; margin-right:4px">
							</lord-icon> Inspection
					       <!-- <i class="fa fa-calendar-alt mr-2"></i> Inspection --> 
					    </a>
					    
					</nav>
			</div>
		    <div class="panel-body">
		    	<!-- Tab content -->
				<div class="tab-content" id="Tab-Content">
						<!-- Content tab 1 	: Cahier Texte-->
					  	<div id="content-tab-CahierTexte" class="tab-pane active" role="tabpanel" aria-labelledby="content-tab-CahierTexte">
					   		
					   		<div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-chalkboard mr-2"></i>
					   			Cahier Des Textes :
					   			<span id="AnneeScolaireinfo"></span>
					   			
						    </div>			
					<table id="data_table_CahierTexte" class="table table-striped table-bordered" cellspacing="0" width="100%">
						<thead>
							<tr>
						<th>Seance</th>
					    <th>activiter</th>
						<th>Texte  	 </th>
					    <th>Etat</th>
			            <th>Action</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
						<div class="text-right">
        <button id="btn-download-pdf-ChaierTexte" class="btn btn-primary">Télécharger</button>
      </div>
					<!-- Début : Modal Details cahier texte -->
				<div id="CahierTexte_Details_Modal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog">
				      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
				          	<div class="modal-header bg-info">
				        		<h4 class="modal-title text-white">
				        			Détails de Cahier Texte
				        		</h4>
				        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			    					<span aria-hidden="true">&times;</span>
			  					</button>
				        	</div>
				          	<div class="modal-body">
				          		<ul class="list-group">
									<!-- ici on Affiche dynamiquement  les détails de classeGenerique-->
								</ul>
							</div>
							<div class="modal-footer ">
								<button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Fermer</button>
							</div>
				        </div>
					</div>
			    </div>
			    
			 <!-- Fin : Modal Details cahier texte -->
					   		
										    <!-- Début : Modal Add inspection -->
								<div id="inspection_add_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
												<div class="modal-dialog">
												<form id="inspection_add_Form" method="POST" action="../inspectionADD" >
											      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
											          	<div class="modal-header bg-info">
											        		<h4 class="modal-title text-white">
											        			Ajouter une Inspection
											        		</h4>
											        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										    					<span aria-hidden="true">&times;</span>
										  					</button>
											        	</div>
											          	<div class="modal-body">
											          		
															<div class="form-group row">
														        <label for="observation" class="col-sm-3 control-label">observation</label>
														        <input  type="hidden" class="form-control" name="id" id="id"/>
														        <div class="col-sm-9">
														          <textarea id="observation" class="form-control" name="observation" placeholder="saisir une observation"  required/>Observation</textarea>
														        </div>
														      </div>
													  		<div class="form-group row">
															      <label for="etat" class="col-sm-3 control-label" >Etat</label>
															      <div class="col-sm-9">
															        <textarea id="etat" class="form-control" name="etat" placeholder="saisir l'etat"></textarea>
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
							
						</div>
						<!-- Fin : Modal Add inspection -->
						<!-- /Content tab 1 : Cahier Texte-->
						<!-- Content tab 2 	: Inspection-->
						<div id="content-tab-inspection" class="tab-pane"  role="tabpanel" aria-labelledby="tab-css">
						    			<div class="alert bg-light text-secondary" role="alert">
								   			<i class="fa fa-calendar-alt mr-2"></i>
								   			Les Inspections :
										</div>
										<table id="data_table_inspection" class="table table-striped table-bordered" cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>N°</th>
													<th>Date d'inspection</th>
													<th>Observation</th>
													<th>etat</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
										
										 <!-- Début : Modal Details Inspection -->
									<div id="Inspect_Details_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
									<div class="modal-dialog">
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Détails de l'inspection
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
													 
								<!-- Fin : Modal Details Inspection --> 
								
							 <!-- Début : Modal Add inspection -->
								<div id="inspection_update_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
												<div class="modal-dialog">
												<form id="inspection_update_Form" method="POST" action="../InspectionUpdate" >
											      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
											          	<div class="modal-header bg-info">
											        		<h4 class="modal-title text-white">
											        			Modifier une Inspection
											        		</h4>
											        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										    					<span aria-hidden="true">&times;</span>
										  					</button>
											        	</div>
											          	<div class="modal-body">
											          		
						     										
						            									<div class="col-sm-9">
																			<input id="id" type="hidden" readonly class="form-control" name="id" placeholder="IdCahierTExte" required/>
														              </div>
														      
															<div class="form-group row">
														        <label for="observation" class="col-sm-3 control-label">observation</label>
														        <input  type="hidden" class="form-control" name="id" id="id"/>
														        <div class="col-sm-9">
														          <textarea id="observation" class="form-control" name="observation" placeholder="saisir une observation"  required/>Observation</textarea>
														        </div>
														      </div>
													  		<div class="form-group row">
															      <label for="etat" class="col-sm-3 control-label" placeholder="saiir l'etat">Etat</label>
															      <div class="col-sm-9">
															        <textarea id="etat" class="form-control" name="etat">
															        </textarea>
															      </div>
															    </div>
											      	</div>
											        <div class="modal-footer ">
										        		<input type="submit" class="btn btn-primary" value="Enregistrer"/>
												        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
										      		</div>
											        </div>
											   	</form>
												</div>
										    </div>
									<!-- Fin : Modal Add inspection -->
						</div>
						<!-- /Content tab 2	: Gestion Annees Scolaires-->
						
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.14/jspdf.plugin.autotable.min.js"></script>
    
    
  	<script type="text/javascript">
  	var data;
  	$(document).ready(function() {
  		/**************** Début : Ajax Load Animation *************************/
  		$(document).ajaxStart(function(){
  			$('#loading-image').show();
		 });
  		$(document).ajaxStop(function(){
  			$('#loading-image').hide();
		 });
  	  // Ajouter l'événement click sur le bouton "Télécharger"
    	  $('#btn-download-pdf-ChaierTexte').on('click', function() {
    	    // Appeler la fonction pour générer le PDF
    	    generatePDF(data);
    	  });
  	  
		/*******************Fin : Ajax Load Animation *************************/
  	
		$('#data_table_CahierTexte').DataTable(
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
  		/************** DataTable du Tab : inspection **************/
  		// Initialisation du DataTable inspection
		$('#data_table_inspection').DataTable(
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
   	});
	
  	/******* fonction pour charger la liste les cahiers des textes dans la TableData cahierTexte ******/	
  		function populateCahierTexteDataTable(){
			var tableData = $('#data_table_CahierTexte').DataTable();
			tableData.clear().destroy();
			$.ajax({
					url : "../CahierTexteList?id="+<%= request.getParameter("idClass")%>+"&profId="+<%= request.getParameter("idProf")%>,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							data=response;
							var btns='<div class="btn-group dropleft"> \
								  <button type="button" class="btn btn-outline-info btn-sm" title="Actions"><span class="fa fa-ellipsis-h"></span></button> \
								  <button type="button" class="btn btn-outline-info btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> \
								    <span class="sr-only">Toggle Dropdown</span> \
								  </button> \
								  <div class="dropdown-menu shadow p-3 mb-5 bg-white rounded" id="dropdownCycle"> \
								    <div class="bg-info text-white px-3 py-1"><span class="fa fa-ellipsis-h mr-4"></span> Actions</div> \
							        <div class="dropdown-divider"></div> \
								  	<a class="dropdown-item CahierTexte-details text-primary" href="#" CahierTexteId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Detail</a> \
								  	<a class="dropdown-item CahierTexte-inspection text-primary" href="#" CahierTexteId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Ajouter une inspection</a> \
								  			</div> \
								</div> ';
							tableData.row.add([
								  response[i].seance.date,
								  response[i].activites[0].nom_Fr,
								  "<div style='width: 200px;'><strong>Matière : </strong>" + response[i].seance.seanceGenerique.matiere.code + 
								  "</div style='width: 200px;'><div><strong>Module : </strong>" + response[i].seance.seanceGenerique.module.nom_Fr +
								  "</div style='width: 200px;'><div><strong>Chapitre: </strong>" + response[i].concepts[0].chapitre.nom +
								  "</div style='width: 200px;'><div><strong>Concepts : </strong>" + response[i].concepts[0].nom +
								  "</div style='width: 200px;'><br><div><strong>Texte : </strong>" + response[i].texte + "</div>",
								  response[i].etat, 
								  btns
								]).draw(false);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	console.log("error");
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
		};
		populateCahierTexteDataTable();
		//Genertation du cahier de texte sous format PDF
		function generatePDF(data) {
			console.log(data);
				  // Récupérer les informations à ajouter dans le PDF
				  var classe    =data[0].seance.seanceGenerique.classe.code;
				  var nom        = "${sessionScope.userLastName_Fr}";
				  var prenom     = "${sessionScope.userFirstName_Fr}";
				  var nomClasse  = $('#ClasseInfo').text();
				  var selectedValue = $('#MatiereProf').val();
				  var Matiers=data[0].seance.seanceGenerique.matiere.code;

				  var schoolYear = $('#AnneeScolaireInfo').text();
				  // Initialiser la bibliothèque jsPDF
				  var doc = new jsPDF();
				  // Ajouter les informations dans la première page du PDF
				  doc.setFontSize(22);
				  doc.setTextColor(255, 0, 0); // changer la couleur du texte en rouge
				  doc.text("Informations générales", 60, 20);

				  doc.setFontSize(16);
				  doc.setTextColor("black"); // réinitialiser la couleur du texte en noir
				  doc.text("Nom du professeur : " + nom +" "+prenom, 15, 40);
				  doc.text("Classes :" +classe,15, 50);
				  doc.text("Matieres :" + Matiers, 15, 60);
				  doc.text(schoolYear, 15, 70);

				  // Ajouter une nouvelle page
				  doc.addPage();
				  // Ajouter un titre pour la nouvelle page
				  doc.setFontSize(22);
				  doc.setTextColor(255, 0, 0);
				//  doc.text("Cahiers de Textes", 15, 20);

				  // Ajouter le tableau des données
				  var headers = ["Seance", "Activité", "Texte", "État"];
				  var donne = [];
				  for (var i = 0; i < data.length; i++) {
					  var rowData = [        
						  data[i].seance.date,
					    data[i].activites[0].nom_Fr,
					   "Matiere : " + data[i].seance.seanceGenerique.matiere.code + "\n" +
					   "Module  : " + data[i].seance.seanceGenerique.module.nom_Fr + "\n" +
					   "Chapitre: " + data[i].concepts[0].chapitre.nom + "\n" +
					   "Concepts: " +  data[i].concepts[0].nom + "\n" +
					   "Texte   : " + data[i].texte,
					    data[i].etat
					  ];
					  donne.push(rowData);
					}
				  doc.autoTable({
				    head: [headers],
				    body: donne,
				    startY: 30
				  });
				  var totalPages = doc.internal.pages.length;
			// Télécharger le PDF 
				  doc.save('document.pdf');
			
				  // Convert the image to a data URL
			  var canvas = document.createElement("canvas");
				  var ctx = canvas.getContext("2d");
				  var img = new Image();

				  img.onload = function () {
				    canvas.width = img.width;
				    canvas.height = img.height;
				    ctx.drawImage(img, 0, 0, img.width, img.height);
				
				    var imageData = canvas.toDataURL("image/jpeg"); // Convert the image to a data URL
				
				    // Add the image to the PDF
				    doc.addImage(imageData, "JPEG", x, y, width, height); // Adjust the coordinates and dimensions as needed
				
				    // Generate the PDF
				    doc.save("document.pdf");
			};
			img.src= "C:\Users\khali\OneDrive\Documents\GitHub\School-Management-System\BTS\WebContent\images\MINISTERE-1024x192.jpg";			
}
  		
  	//detaits cahier texte
		$('#data_table_CahierTexte').on('click','.CahierTexte-details', function(evt){
	$this = $(this);
	var id= $this.attr('CahierTexteId');
	$.ajax({
		url : "../CahierTexteDetails?id="+id,
		type: "GET",
		dataType: 'json',
		contentType: "application/json; charset=UTF-8",
		success: function(response,textStatus ,jqXHR){
			var seance ='<li class="list-group-item"><span><strong>seance  </strong></span><span class="float-right">'+response.seance.date+'</span></li>';
			var contenu ='<li class="list-group-item"><span><strong>Contenu  </strong></span><span class="float-right">'+response.texte+'</span></li>';
			var activite ='<li class="list-group-item"><span><strong>Activite pedagogique  </strong></span><span class="float-right">'+response.activites[0].nom_Fr+'</span></li>';
			var etat ='<li class="list-group-item"><span><strong>etat  </strong></span><span class="float-right">'+response.seance.etat+'</span></li>';
			var Matiere ='<li class="list-group-item"><span><strong>Matiere  </strong></span><span class="float-right">'+response.seance.seanceGenerique.matiere.nom_Ar+'</span></li>';
			var Module ='<li class="list-group-item"><span><strong>Module  </strong></span><span class="float-right">'+response.seance.seanceGenerique.module.nom_Fr+'</span></li>';
			$("#CahierTexte_Details_Modal .list-group").html("");
			$("#CahierTexte_Details_Modal .list-group").append(seance);
			$("#CahierTexte_Details_Modal .list-group").append(contenu);
			$("#CahierTexte_Details_Modal .list-group").append(activite);
			$("#CahierTexte_Details_Modal .list-group").append(etat);
			$("#CahierTexte_Details_Modal .list-group").append(Module);
			$("#CahierTexte_Details_Modal .list-group").append(Matiere);
			$('#CahierTexte_Details_Modal').modal('show');
	    },
	    error: function(response,textStatus ,jqXHR){
	    	$("#modalError .modal-body p").html("");
			$("#modalError .modal-body p").html(jqXHR.responseText);
	   		$('#modalError .modal-body p').modal('show'); 
	        }
	});
	
	return false;
});			
  
  	
	function populateInspectionDataTable(){
		var tableData = $('#data_table_inspection').DataTable();
		tableData.clear().destroy();
		//tableData.DataTable().rows().remove().draw();
		$.ajax({
			url : "../InspectionList?id="+<%= request.getParameter("idProf")%>+"&idClass="+<%= request.getParameter("idClass")%>,
			type: "GET",
			dataType: 'json',
			success: function(response,textStatus ,jqXHR){
				for(i=0;i<response.length;i++){
					var rang=i+1;
					var btns='<div class="btn-group dropleft"> \
						  <button type="button" class="btn btn-outline-info btn-sm" title="Actions"><span class="fa fa-ellipsis-h"></span></button> \
						  <button type="button" class="btn btn-outline-info btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> \
						    <span class="sr-only">Toggle Dropdown</span> \
						  </button> \
						  <div class="dropdown-menu shadow p-3 mb-5 bg-white rounded" id="dropdownCycle"> \
						    <div class="bg-info text-white px-3 py-1"><span class="fa fa-ellipsis-h mr-4"></span> Actions</div> \
					        <div class="dropdown-divider"></div> \
						  	<a class="dropdown-item inspection-details text-primary" href="#" inspectionID="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Detail</a> \
						  	<a class="dropdown-item inspection-update text-primary" href="#" inspectionID="'+response[i].id+'"><span class="fa fa-cog mr-4"></span>Modifier</a> \
						  	<a class="dropdown-item inspection-supprimer text-primary" href="#" inspectionID="'+response[i].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
						  			</div> \
						</div> ';
					tableData.row.add( [
					rang,
					response[i].date,
					response[i].observation,
					response[i].etat,             
					btns
					         ] ).draw( false );
				}
		    },
		    error: function(response,textStatus ,jqXHR){
		    	console.log("echec");
		    	$("#modalError .modal-body p").html("");
				$("#modalError .modal-body p").html(jqXHR.responseText);
		   		$('#modalError .modal-body p').modal('show'); 
		        }
		});
	};
	
	//Chargement des inspections dans le DataTable inspection
		populateInspectionDataTable();
		
		//details inspection
			$('#data_table_inspection').on('click','.inspection-details', function(evt){
				$this = $(this);
				var id= $this.attr('inspectionID');
				$.ajax({
					url : "../InspectionDetails?id="+id,
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						
						var date ='<li class="list-group-item"><span><strong>Date 		</strong></span><span class="float-right">'+response.date+'</span></li>';
						var observation ='<li class="list-group-item"><span><strong>Observation 	</strong></span><span class="float-right">'+response.observation+'</span></li>';
						var etat ='<li class="list-group-item"><span><strong>Etat	</strong></span><span class="float-right">'+response.etat+'</span></li>';
						
						
						$("#Inspect_Details_Modal .list-group").html("");
						$("#Inspect_Details_Modal .list-group").append(date);
						$("#Inspect_Details_Modal .list-group").append(observation);
						$("#Inspect_Details_Modal .list-group").append(etat);
						$('#Inspect_Details_Modal').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				
				return false;
			});
			
			
			
			
			//Ajout de l'inspection
			$('#data_table_CahierTexte').on('click','.CahierTexte-inspection', function(evt){
				//Effacer d 'abord le formulaire
				$this = $(this);
						var id= $this.attr('CahierTexteId');
						$("#inspection_add_Form input[id=id]").html('');
						$("#inspection_add_Form textarea[id=observation]").html('');
						$("#inspection_add_Form textarea[id=etat]").html('');
				$.ajax({
							url : "../CahierTexteDetails?id="+id,
							type: "GET",
							dataType: 'json',
							contentType: "application/json; charset=UTF-8",
								success: function(response,textStatus ,jqXHR){
								$("#inspection_add_Form input[name=id]").val(response.id);
								$('#inspection_add_Modal').modal('show');
						    },
						 	   error: function(response,textStatus ,jqXHR){
							    	$("#modalError .modal-body p").html("");
									$("#modalError .modal-body p").html(jqXHR.responseText);
							   		$('#modalError .modal-body p').modal('show'); 
						        }
						});
						
						return false;
			});
			
			
 				
			$("#inspection_add_Form").submit(function(event){ 
				
				var request_method = $(this).attr("method"); 	
				var form_data = $(this).serialize(); 			
				$('#inspection_add_Modal').modal('hide');		
				$.ajax({
					url : "../inspectionADD",
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
					 	//Effacer le DataTable inspection
						$('#data_table_inspection').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable inspection
						populateInspectionDataTable();
			  			    
				    }
				});
				return false;
			});
			
			
			
			
			//suppression d'une inspection
			$('#data_table_inspection').on('click','.inspection-supprimer', function(evt){
				$this = $(this);
				var id= $(this).attr('inspectionID');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
						$.ajax({
							url : "../inspectionDelete?id="+id,
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
								$('#data_table_inspection').DataTable().rows().remove().draw();				  			
								populateInspectionDataTable();
								
						    }
						});
				  });
 			});
			
			
			$('#data_table_inspection').on('click','.inspection-update', function(evt){
				$this = $(this);
				var id= $this.attr('inspectionID');
				$("#inspection_update_Form input[id=id]").html('');
				$("#inspection_update_Form textarea[id=observation]").html('');
				$("#inspection_update_Form textarea[id=etat]").html('');
				$.ajax({
					url : "../InspectionDetails?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
										
						$("#inspection_update_Form input[name=id]").val(response.id);
						$("#inspection_update_Form textarea[name=observation]").val(response.observation);
						$("#inspection_update_Form textarea[name=etat]").val(response.etat);
						$('#inspection_update_Modal').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				
				return false;
			});
			
			
			
			$("#inspection_update_Form").submit(function(event){ 
			var request_method = $(this).attr("method"); 	 
			var form_data = $(this).serialize(); 			
			$('#inspection_update_Modal').modal('hide');		
			$.ajax({
				url : "../InspectionUpdate",
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
					$('#data_table_inspection').DataTable().rows().remove().draw();
					populateInspectionDataTable();  
			    }   
			});
			return false;
		});	
			
			
			
								
    </script>
   
</body>
</html>