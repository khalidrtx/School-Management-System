<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<title>Tableau De Service </title>
  	
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstap.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css" >
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		
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
#emploi .text{
z-index:-1;
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
					    <a id="tab_EmploieDuTemps" href="#content-tab-EmploieDuTemps" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-tab-EmploieDuTemps" aria-selected="false">
					        <i class="fa fa-calendar-alt mr-2"></i> Tableau de service
					    </a>
					    <a id="tab_Absences" href="#content-tab-Absencess" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-tab-Absences" aria-selected="false">
								<!-- 	 <i class="fa fa-user-check mr-2"></i> ...-->					   
 							</a>
					</nav>
			</div>
			<!-- debut	: cahierText_Add_Modal-->
			<div id="cahierText_Add_Modal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-lg">
					<form id="seance_Add_Form" method="POST" action="../CahierTexteADD" enctype="multipart/form-data">
				      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
				          	<div class="modal-header bg-info">
				        		<h4 class="modal-title text-white">
				        			Cahier de texte
				        		</h4>
				        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			    					<span aria-hidden="true">&times;</span>
			  					</button>
				        	</div>
				          	<div class="modal-body">	
					<div id="content-tab-Contact" class="tab-pane" role="tabpanel" aria-labelledby="">
					   						<!-- Début : Contact  -->
					   							<div class="row">
					   								<!-- colone Francais -->
					   								<!-- Hidden input for seancegeneriqueid -->
    														<input type="hidden" name="seanceGenerique" />
								                	<div class="col-md-6">
								             
								                        <div class="form-group row">
								                            <label for="Seance" class="control-label col-md-4">Seance </label> 
								                            <div class="col-md-8">
								                                <input type="date" name="Seance" class="form-control" required/>
								                            </div>
								                        </div>
					                      
								                        <div class="form-group row">
								                            <label for="Contenu" class="control-label col-md-4">Contenu</label> 
								                            <div class="col-md-8">
								                            
								                                <textarea type="text" name="Contenu" class="form-control" placeholder="texte..." /></textarea>
								                                
								                            </div>
								                        </div>
								                        <div class="form-group row">
								                            <label for="Activite" class="control-label col-md-4">Activite pedagogique</label> 
								                            <div class="col-md-8">
																		<select id="Activite" class="form-control" name="Activite" >
																		<option value="">Select an option</option>
				 														</select>	
				 											 </div>
								                        </div>
								                 
								                         <div class="form-group row">
								                            <label for="adresseFr" class="control-label col-md-4">Observation</label> 
								                            <div class="col-md-8">
								                            	<textarea name="Observation" class="form-control" placeholder="Observation..."></textarea>
								                            </div>
								                        </div>
								                           <div class="form-group row">
								                            <label for="adresseFr" class="control-label col-md-4">Etat de seance</label> 
								                            <div class="col-md-8">
								                            	<select name="Etat" class="form-control">
								                            		<option value="passe">passe</option>
								                            		<option value="abcence">abcense</option>
								                            		<option value="annuler">annuler</option>
								                            		<option value="jour ferie">jour ferie</option>
								                            	</select>
								                            </div>
								                        </div>
							                   		</div>
							                        <!-- colone Arabe -->
							                        <div class="col-md-6">
							                        	  <div class="form-group row">
								                            <label class="control-label col-md-4">Matiere:</label> 
								                            <div class="col-md-8">
								                            	<select name="Matiere" class="form-control" readonly>
								                            	
								                            	</select>
								                            	</div>
								                        </div>
								                        <div class="form-group row">
								                            <label class="control-label col-md-4">Module:</label> 
								                            
								                            <div class="col-md-8">
								                            	<select name="Module" class="form-control" readonly>
								                            		
								                            	</select>
								                       	</div>
								                 	       </div>
								                              <div class="form-group row">
								                            <label for="Chapitre" class="control-label col-md-4">Chapitre</label> 
								                            <div class="col-md-8">
																	<select id="Chapitre" class="form-control" name="Chapitre" >
																			<option value="">Select an option</option>
				 													</select>	
				 											 </div>
								                        </div>
								                         <div class="form-group row">
															<label for="Concepte" class="control-label col-md-4">Concept</label> 
															<div class="col-md-8">
																<div class="select-wrapper">
																	<select id="Concepte" class="form-control my-select" name="Concepte" >
																		<option value="3">select an option</option>
																	</select>	
																</div>
															</div>
														</div>
							                        </div>
					   							</div>
					   					
					   						</div>
					   						
							   		 </div>
										<div class="modal-footer ">
								        		<input type="submit" class="btn btn-primary" value="Enregistrer">
										        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							 </div>			 
					 	</div>
				 	</form>
				</div>			 
			</div>		
			<!-- Fin: cahierText_Add_Modal-->
		    <div class="panel-body">
<!-- Tab content -->
		<!-- Content tab 2 	: EmploieDuTemps-->
				<div id="content-tab-EmploieDuTemps" class="tab-pane"  role="tabpanel" aria-labelledby="content-tab-EmploieDuTemps">
						<div class="alert bg-light text-secondary" role="alert">
							   			
						  <table id="faty" class="table table-striped table-bordered rounded mt-5"cellspacing="0" width="100%">
								<thead class="text-center">
									<tr class="bg-warning">
										<th></th>
										<th>8-10</th>
							            <th>10-12</th>
							            <th>14-16</th>
							            <th>16-18</th>
									</tr>
								</thead>
				<tbody>
						<tr>
								<th class="bg-warning text-center">LUN</th>
					            <td id="Lundi_8H_10H"></td>
					            <td id="Lundi_10H_12H"></td>
					            <td id="Lundi_14H_16H"></td>
					            <td id="Lundi_16H_18H"></td>
					</tr>
					<tr>
								<th class="bg-warning text-center">MAR</th>
					            <td id="Mardi_8H_10H"></td>
					            <td id="Mardi_10H_12H"></td>
					            <td id="Mardi_14H_16H"></td>
					            <td id="Mardi_16H_18H"></td>
					</tr>
					<tr>
								<th class="bg-warning text-center">MER</th>
					             <td id="Mercredi_8H_10H"></td>
					            <td id="Mercredi_10H_12H"></td>
					            <td id="Mercredi_14H_16H"></td>
					            <td id="Mercredi_16H_18H"></td>
					</tr>
					<tr>
								<th class="bg-warning text-center">JEU</th>
					            <td id="Jeudi_8H_10H"></td>
					            <td id="Jeudi_10H_12H"></td>
					            <td id="Jeudi_14H_16H"></td>
					            <td id="Jeudi_16H_18H"></td>
					</tr>
					<tr>
								<th class="bg-warning text-center">VEN</th>
					            <td id="Vendredi_8H_10H"></td>
					            <td id="Vendredi_10H_12H"></td>
					            <td id="Vendredi_14H_16H"></td>
					            <td id="Vendredi_16H_18H"></td>
					</tr>
					<tr>
						<th class="bg-warning text-center">SAM</th>
			            <td id="Samedi_8H_10H"></td>
			            <td id="Samedi_10H_12H"></td>
			            <td id="Samedi_14H_16H"></td>
			            <td id="Samedi_16H_18H"></td>
					</tr>
				</tbody>
			</table>
			 </div>
			</div>
				</div>
				
			 </div>
		  
		</div>
	 <!-- /Col 1 -->
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
<!-- Début : Moad Confirmation Retirer étudiant de la classe-->
<div id="modalConfirmRemove" class="modal" tabindex="-1" role="dialog">
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
					Etes vous sûre de vouloir retirer l'étudiant sélectionné de la classe ?
				</p>
		  </div>
		  <div class="modal-footer">
		    <button type="button" data-dismiss="modal" class="btn btn-warning  mr-auto" id="remove">Confirmer</button>
		    <button type="button" data-dismiss="modal" class="btn btn-secondary  ">Annuler</button>
		  </div>
		 </div>
  	</div>
</div>
<!-- Fin : Moad Confirmation Retirer étudiant de la classe-->
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
		
  		/************** DataTable du Tab : Classes **************/
	  		// Initialisation du DataTable Classes
	  		$('#data_table_classes').DataTable(
	  			{	
	  				"paging": true,
	  				"autoWidth": true,
	  				
	  				"columnDefs": [
			             {
			                 "targets": [ 0 ,6],
			                 "visible": true,
			                 "searchable": false,
			                 "orderable": false
			             } ],
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
		


	  	//Effacer dabord le formulaire d'ajout
			$('#cahierText_Add_Modal').on('shown.bs.modal', function(evt){
  				$('#seance_Add_Form').trigger('reset');
  			});
			
		//Envoie du formulaire d'ajout de cahier texte
  			$("#seance_Add_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#cahierText_Add_Modal').modal('hide');		//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						if(response.success){
							$("#modalSuccess .modal-body p").html("");
							$("#modalSuccess .modal-body p").html(response.message);
					   		$('#modalSuccess').modal('show');		
						}else{
							$("#modalError .modal-body p").html("");
							$("#modalError .modal-body p").html(response.message);
					   		$('#modalError').modal('show'); 
						}
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError').modal('show'); 
				   },
				});
				return false;
			});	
		
  			 /////////////////////Chargement des AcrivitePedagogique
  			$.ajax({
  			url : "../AcrivitePedagogiqueList",
  			type: "GET",
  			dataType: 'json',
  			contentType: "application/json; charset=UTF-8",
  			success: function(response,textStatus ,jqXHR){
  				$("#seance_Add_Form select[name=Activite]").html("");
  				for(i=0;i<response.length;i++){
  					var item  ='<option value="'+response[i].id+'">'+response[i].nom_Fr +'</option>';
  					$("#seance_Add_Form select[name=Activite] ").append(item);       
  				}	
  		    },
  		    error: function(response,textStatus ,jqXHR){
  		    	$("#modalError .modal-body p").html("");
  				$("#modalError .modal-body p").html(jqXHR.responseText);
  		   		$('#modalError .modal-body p').modal('show'); 
  		        }
  		});  
  		
  		// Add click event handler for the book icons
  			$(document).on('click', '.fa.fa-book.mr-2.book-icon', function() {
  			  // Retrieve the seancegeneriqueid from the clicked book icon
 		 	var seanceGeneriqueId = $(this).closest('a').data('seancegeneriqueid');
 		   // Set the value of the hidden input in the modal
 		   $('#cahierText_Add_Modal input[name="seanceGenerique"]').val(seanceGeneriqueId);

  			 // On Charge les Matieres et les modules de la seancegenerique séléctionnée
		    $.ajax({
		        url : "../ModuleMatiereBySeancegenListe?id="+seanceGeneriqueId,
		        type: "GET",
		        dataType: 'json',
		        contentType: "application/json; charset=UTF-8",
		        success: function(response,textStatus,jqXHR){
		            $("#seance_Add_Form select[name=Matiere]").html("");
		            $("#seance_Add_Form select[name=Module]").html("");      
		
		            for(i=0;i<response.length;i++){
		                var item  ='<option value="'+response[i].matiere.id+'">'+response[i].matiere.code +'</option>';
		                var item2  ='<option value="'+response[i].module.id+'">'+response[i].module.nom_Fr +'</option>';
		                $("#seance_Add_Form select[name=Matiere]").append(item);       
		                $("#seance_Add_Form select[name=Module]").append(item2);       
		            }
		            // On Charge les chapitres dans Select chapitre
		            var selectedMatiere = $("#seance_Add_Form select[name=Matiere]").val();
		            var selectedModule =  $("#seance_Add_Form select[name=Module]").val();
		            $.ajax({
		                url : "../ChapitreByMatiereModuleList?selectedMatiere=" + selectedMatiere + "&selectedModule=" + selectedModule,
		                type: "GET",
		                dataType: 'json',
		                contentType: "application/json; charset=UTF-8",
		                success: function(response,textStatus ,jqXHR){
		                    $("#seance_Add_Form select[name=Chapitre]").html("");
		                    $("#seance_Add_Form select[name=Concepte]").html("");

		                    for(i=0;i<response.length;i++){
		                        var item  ='<option value="'+response[i].id+'">'+response[i].nom+'</option>';
		                        $("#seance_Add_Form select[name=Chapitre]").append(item);       
		                    }   
		                },
		                error: function(response,textStatus ,jqXHR){
		                    $("#modalError .modal-body p").html("");
		                    $("#modalError .modal-body p").html(jqXHR.responseText);
		                    $('#modalError .modal-body p').modal('show'); 
		                }
		            });
		        },
		        error: function(response,textStatus ,jqXHR){
		            $("#modalError .modal-body p").html("");
		            $("#modalError .modal-body p").html(jqXHR.responseText);
		            $('#modalError .modal-body p').modal('show'); 
		        },
		        complete: function (response,textStatus ,jqXHR) {
		            $("#seance_Add_Form select[name=Matiere]").prop('disabled', false);
		        }
		    });
  		});	 
  			 
//////////////Chargement des conceptes dans la select conceptes
  			$("#seance_Add_Form select[name=Chapitre]").change(function(){
  				    // On recupere l concept Id du chapitre
  				    var chapitreId=$(this).val();
  				    // On Charge les  dans select conceptes
  				    $.ajax({
  				        url : "../ConcepteByChapitreList?chapitreId="+chapitreId,
  				        type: "GET",
  				        dataType: 'json',
  				        contentType: "application/json; charset=UTF-8",
  				        success: function(response,textStatus ,jqXHR){
  				            $("#seance_Add_Form select[name=Concepte]").html("");      
  				            for(i=0;i<response.length;i++){
  				            	var item = '<option value="' + response[i].id + '" style="white-space: pre-wrap; word-break: break-all">' + response[i].nom + '</option>';
  				                $("#seance_Add_Form select[name=Concepte]").append(item);       
  				            }
  				            // Add styles to the select element
  				            $("#seance_Add_Form select[name=Concepte]").addClass("my-select");
  				        },
  				        error: function(response,textStatus ,jqXHR){
  				            $("#modalError .modal-body p").html("");
  				            $("#modalError .modal-body p").html(jqXHR.responseText);
  				            $('#modalError .modal-body p').modal('show'); 
  				        },
  				        complete: function (response,textStatus ,jqXHR) {
  				            $("#seance_Add_Form select[name=Concepte]").prop('disabled', false);
  				        }
  				    });
  			});
  					 			 
  			 
		
		//////////////////////////////////////////////////////////

		
		
		$.ajax({
		  		  url: "../TableauService/List",
		  		  type: "GET",
		  		  dataType: "json",
		  		  contentType: "application/json; charset=UTF-8",
		  		  success: function(response, textStatus, jqXHR) {
		  		    for (var i = 0; i < response.length; i++) {
		  		      var m =
		  		        "#" +
		  		        response[i].jour +
		  		        "_" +
		  		        response[i].heureDebut +
		  		        "_" +
		  		        response[i].heureFin;

		  		      var bookIcon = "<i class='fa fa-book mr-2 book-icon' style='color: black'></i>";
		  		   	  var bookLink =
		  		        "<a href='#' data-toggle='modal' data-target='#cahierText_Add_Modal' data-seancegeneriqueid='" +
		  		        response[i].id +
		  		        "'>" +
		  		        bookIcon +
		  		        "</a>";
		  		      var AbsenceIcon = "<a href='#' class='classe-update' href='#' seanceid=" + response[i].id + "><i class='fa fa-user-check' style='color: black'></i></a>";
		  		      $(m).html(
		  		        response[i].matiere.code +
		  		          "<br>" +
		  		          response[i].classe.code +
		  		          "  <br>   " +
		  		          response[i].salle.code +
		  		          "<br> " +
		  		          bookLink + " "+AbsenceIcon
		  		      );
		  		    }
		  		    // Add click event handler for the book icons
		  		    $(".fa fa-book mr-2 book-icon").click(function() {
		  		      // Show the modal here
		  		      $('#cahierText_Add_Modal').modal('show');
		  		    });
		  		  },
		  		  error: function(response, textStatus, jqXHR) {
		  		    $("#modalError .modal-body p").html("");
		  		    $("#modalError .modal-body p").html(jqXHR.responseText);
		  		    $("#modalError .modal-body p").modal("show");
		  		  }
		  		});

				
	 });	
 </script>
  	
  
</body>
</html>