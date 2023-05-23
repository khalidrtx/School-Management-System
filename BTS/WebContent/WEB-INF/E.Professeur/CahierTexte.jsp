<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<title>Liste des classes génériques</title>
  	
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
    //to do 
/*     #Concepte:hover{
    	animation: deplacement 2s ease infinite;
    } */

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
/********************/
			

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
	<div class="alert bg-light text-secondary d-flex justify-content-between" role="alert">
	    <div>
      	  <i class="fa fa-chalkboard mr-2"></i>
    	    Classe:
       	 <span id="ClasseInfo"></span>
				<span id="AnneeScolaireInfo" style="margin-left: 90px;"></span>
    	</div>
   	 <div class="form-group row">
			   <div class="col-md-6 d-flex justify-content-end ">
			        <span id="MatiereInfo"></span>
			  </div>
			   <div class="col-md-6">
			        <select id="MatiereProf" class="form-control" name="MatiereProf">
			        </select>	
    			</div>
	</div>
    
	</div>
		    <div class="alert bg-light text-secondary" role="alert">
	   			Ajouter une seance:	   			 
		        <a href="#" data-toggle="modal" data-target="#cahierText_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter une Classe génirique"><i class="fa fa-plus"></i></a>
		    </div>
			<table id="data_table_cahierTexte" class="table table-striped table-bordered" cellspacing="0" width="100%">
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
		<!-- Début : Modal Add New Etudiant -->
				<div id="cahierText_Add_Modal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-lg">
					<form id="seance_Add_Form" method="POST" action="../CahierTexteADD" enctype="multipart/form-data">
				      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
				          	<div class="modal-header bg-info">
				        		<h4 class="modal-title text-white">
				        			Ajouter une seance
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
								                	<div class="col-md-6">
								                   <div class="form-group row">
					                            <label for="seanceGenerique" class="control-label col-md-4">Seance generique</label> 
								                	 <div class="col-md-8">
								                	 <select id="seanceGenerique" class="form-control" name="seanceGenerique" >
								                	 <option value="">Select an option</option>
				 										
				 									</select>	
				 									</div> 
					                        </div>
				 									 
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
			<!-- Fin : Modal Add New CahierTexte -->
			<!-- Début : Modal Update New CahierTexte -->
				<div id="cahierText_Update_Modal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-lg">
					<form id="seance_Update_Form" method="POST" action="../CahierTexteUpdate" enctype="multipart/form-data">
				      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
				          	<div class="modal-header bg-info">
				        		<h4 class="modal-title text-white">
				        			Mise a jour une seance
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
								                	<div class="col-md-6">
								              
								                       <div class="form-group row">
								                            <label for="Seance" class="control-label col-md-4">Seance </label> 
								                                <input  type="hidden" class="form-control" name="CahierTexteId" />
								                            	<input  type="hidden" class="form-control" name="seanceId" />
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
								                            	<!--  <input type="text" name="Etat" class="form-control" placeholder="Etat.."></textarea>-->
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
																	<select id="Concepte" class="form-control my-select" name="Concepte">
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
			<!-- Fin : Modal Update CahierTexte -->
 			<!-- Début : Modal Details cahier texte -->
											<div id="CahierTexte_Details_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
												<div class="modal-dialog modal-lg">
											      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
											          	<div class="modal-header bg-info">
											        		<h4 class="modal-title text-white">
											        			Détails de cahier texte
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
		<!-- Fin : Modal Details cahier texte -->				
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
<!-- Début : Moad Loading Ajax -->
<div id="loading-image" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-sm" >
        <div class="modal-content" style="width: 48px; color:orange;">
            <span class="fa fa-spinner fa-spin fa-3x"></span>
        </div>
    </div>
</div>
<!-- Fin : Moad Loading Ajax -->

	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
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
	<script src="${pageContext.request.contextPath}/js/jspdf.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jspdf.plugin.autotable.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jspdf.plugin.autotable.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/pdfmake.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jspdf.plugin.autotable.mjs" type="text/javascript"></script>
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
  	  
	});

		/*******************Fin : Ajax Load Animation *************************/
  		/************** DataTable du Tab : cahierTexte **************/
  		// Initialisation du DataTable cahierTexte
		  $('#data_table_cahierTexte').DataTable(
		  {	
		    "paging": true,
		    "autoWidth": true,
		    "columnDefs": [
		      { "orderable": false, "targets": 2 }
		    ],
		    "language": {
		      "lengthMenu": "Display _MENU_ records per page",
		      "zeroRecords": "Pas d'enregistrement à afficher",
		      "info": "Affichage : _PAGE_ / _PAGES_",
		      "infoEmpty": "No records available",
		      "infoFiltered": "(filtered from _MAX_ total records)"
		    },
		    "columnDefs": [
		      {
		        "targets": [ 0 ],
		        "visible": true,
		        "searchable": false,
		        "orderable": true
		      },
		      {
		        "targets": [ 2 ],
		        "visible": true
		      }
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
		  /******* Fonction pour charger la liste des Cahiers de Textes dans la DataTable "cahierTexte" ******/
		function populateCahierTexteDataTable(){
			var tableData = $('#data_table_cahierTexte').DataTable();
			//tableData.DataTable().rows().remove().draw();		// Vider la TableData 
			var profId = "${sessionScope.userID}";
			$.ajax({
				url : "../CahierTexteList?id=" + <%= request.getParameter("id") %> + "&profId=" + profId,
				type: "GET",
				dataType: 'json',
				success: function(response,textStatus ,jqXHR){
	                data = response; // assign response to data variable
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
							  	<a class="dropdown-item CahierTexte-delete text-primary" href="#" CahierTexteId="'+response[i].seance.id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
							  	<a class="dropdown-item CahierTexte-update text-primary" href="#" CahierTexteId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
							  	<a class="dropdown-item CahierTexte-details text-primary" href="#" CahierTexteId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
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
			    	$("#modalError .modal-body p").html("");
					$("#modalError .modal-body p").html(jqXHR.responseText);
			   		$('#modalError .modal-body p').modal('show'); 
			        }
			});			
		};
		
		// Chargement des Cahiers de Textes dans le DataTable "cahierTexte"
				populateCahierTexteDataTable();	
		//Genertation du cahier de texte sous format PDF
			function generatePDF(data) {
				  // Récupérer les informations à ajouter dans le PDF
				  var nom        = "${sessionScope.userLastName_Fr}";
				  var prenom     = "${sessionScope.userFirstName_Fr}";
				  var nomClasse  = $('#ClasseInfo').text();
				  var selectedValue = $('#MatiereProf').val();
				  var Matiers;
				  if (selectedValue === 'default') {
				    Matiers = $('#MatiereProf option[value!="default"]').map(function() {
				      return $(this).text();
				    }).get();
				  } else {
				    Matiers = $('#MatiereProf option:selected').text();
				  }

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
				  doc.text("Classes :" +nomClasse,15, 50);
				  doc.text("Matieres :" + Matiers, 15, 60);
				  doc.text(schoolYear, 15, 70);

				  // Ajouter une nouvelle page
				  doc.addPage();
				  // Ajouter un titre pour la nouvelle page
				  doc.setFontSize(22);
				  doc.setTextColor(255, 0, 0);
				  doc.text("Cahiers de Textes", 15, 20);

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
			
		//fonction pour l'affichage du datatable cahierText par matiere
		
		$("#MatiereProf").change(function() {
			  // Retrieve the selected value of MatiereProf
			 var MatiereId = $(this).val();
			 var tableData = $('#data_table_cahierTexte').DataTable();
			 tableData.rows().remove().draw();		// Vider la TableData 
			var profId = "${sessionScope.userID}";
			if (MatiereId === 'default') {
			    // Show all rows in the datatable
			    populateCahierTexteDataTable();
			  } else {
					$.ajax({
							url : "../CahierTexteListByMatiere?id=" + <%= request.getParameter("id") %> + "&profId=" + profId + "&MatiereId="+MatiereId,
							type: "GET",
							dataType: 'json',
							success: function(response,textStatus ,jqXHR){
				                data = response; // assign response to data variable
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
										  	<a class="dropdown-item CahierTexte-delete text-primary" href="#" CahierTexteId="'+response[i].seance.id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
										  	<a class="dropdown-item CahierTexte-update text-primary" href="#" CahierTexteId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
										  	<a class="dropdown-item CahierTexte-details text-primary" href="#" CahierTexteId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
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
						    	$("#modalError .modal-body p").html("");
								$("#modalError .modal-body p").html(jqXHR.responseText);
						   		$('#modalError .modal-body p').modal('show'); 
						        }
						});
			  }
			  		
				});

		
		
		
			
		
		
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
				   complete: function (response,textStatus ,jqXHR) {
					 	//Effacer le DataTable cahier texte
						$('#data_table_cahierTexte').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable cahier texte
							populateCahierTexteDataTable();
			  			}
				});
				return false;
			});	
			 
  		//charegement des SeanceGeneriques..	
	$.ajax({
	  url: "../seanceGeneriqueList?id=" + <%= request.getParameter("id") %>,
	  type: "GET",
	  dataType: 'json',
	  contentType: "application/json; charset=UTF-8",
	  success: function (response, textStatus, jqXHR) {
		  var MatiereListe = []; // Crée un tableau vide pour stocker les combinaisons uniques de matiere et d'ID
		  for (var i = 0; i < response.length; i++) {
		      var matiere = response[i].matiere.code; // Récupère le code de la matière à partir de la réponse
		      var matiereID = response[i].matiere.id; // Récupère l'ID de la matière à partir de la réponse
		      
		      // Vérifie si l'ID de la matière n'existe pas déjà dans le tableau
		      if (!MatiereListe.some(m => m.id === matiereID)) {
		          MatiereListe.push({ matiere: matiere, id: matiereID }); // Ajoute la matière et son ID dans le tableau
		      }
		  }
		  // Efface les options existantes dans la liste déroulante (select)
		  $("#MatiereProf").html("");

		  // Ajoute l'option par défaut
		  $("#MatiereProf").append("<option value='default'>-------</option>");

		  // Ajoute chaque matière comme option dans la liste déroulante avec l'ID de la matière comme attribut ID
		  for (var i = 0; i < MatiereListe.length; i++) {
		      var matiereOption = '<option value="' + MatiereListe[i].id + '">' + MatiereListe[i].matiere + '</option>';
		      $("#MatiereProf").append(matiereOption);
		  }
		 
		    $('#MatiereInfo').html('<i class="fa fa-book mr-2"></i> Matières: ' );
		    
		    
		      $("#seance_Add_Form select[name=seanceGenerique]").html("");
		      $("#seance_Add_Form select[name=seanceGenerique]").append("<option value=''>veuillez choisir</option>");
		
		      for (var i = 0; i < response.length; i++) {
		        var item = '<option value="' + response[i].id + '">' + response[i].jour + ' de ' + response[i].heureDebut + ' à ' + response[i].heureFin + '</option>';
		        $("#seance_Add_Form select[name=seanceGenerique]").append(item);
		      }
		    
  		},
	  error: function (jqXHR, textStatus, errorThrown) {
	    // En cas d'erreur, afficher le message d'erreur dans une fenêtre modale
	    $("#modalError .modal-body p").html("");
	    $("#modalError .modal-body p").html(jqXHR.responseText);
	    $('#modalError').modal('show');
	 	 }
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
 
//les Matieres et les modules de la seancegenerique séléctionnée
// Lorsque l'utilisateur sélectionne une séance générique dans le formulaire d'ajout de séance,
//cette fonction s'exécute pour charger les matières et les modules associés à cette séance. 
//Elle utilise deux appels AJAX : le premier pour récupérer les informations sur les matières et les modules,
//et le deuxième pour charger les chapitres correspondants dans un autre select.
		  $("#seance_Add_Form select[name=seanceGenerique]").change(function(){
		    // On recupere l Id de la seancegen
		    var idseancegen=$(this).val();
		    // On Charge les Matieres et les modules de la seancegenerique séléctionnée
		    $.ajax({
		        url : "../ModuleMatiereBySeancegenListe?id="+idseancegen,
		        type: "GET",
		        dataType: 'json',
		        contentType: "application/json; charset=UTF-8",
		        success: function(response,textStatus ,jqXHR){
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
		

		/*********** Modification de Cahiertexte
			*****************************************************/
			
	$('#data_table_cahierTexte').on('click','.CahierTexte-update', function(evt){
			//Effacer dabord le formulaire
			$('#seance_Update_Form').trigger('reset');
			$("#seance_Update_Form select[name=Activite]").html('');
			$("#seance_Update_Form select[name=Chapitre]").html('');
			$("#seance_Update_Form select[name=Concepte]").html('');
			$("#seance_Update_Form input[name=Seance]").html('');
			$("#seance_Update_Form textarea[name=Contenu]").html('');
			$("#seance_Update_Form input[name=Seance]").html('');
			$this = $(this);
			var id= $this.attr('CahierTexteId');
			//Ajouter les valeur initiales  les selects
			$.ajax({
				url : "../CahierTexteDetails?id="+id,
				type: "GET",
				dataType: 'json',
				success: function(response,textStatus ,jqXHR){
					//var itemActivite ='<option class="bg-danger text-white" value="'+response.activites.get(0).id'">'+response.activites.get(0).nom_Fr+'</option>';
					var itemMatiere  ='<option class="bg-danger text-white" value="'+response.seance.seanceGenerique.matiere.id+'">'+response.seance.seanceGenerique.matiere.code+'</option>';
					var itemModule ='<option class="bg-danger text-white" value="'+response.seance.seanceGenerique.module.id+'">'+response.seance.seanceGenerique.module.nom_Fr+'</option>';
					$("#seance_Update_Form input[name=CahierTexteId]").val(response.id);
					$("#seance_Update_Form input[name=seanceId]").val(response.seance.id);
					$("#seance_Update_Form textarea[name=Observation]").val(response.observation);
					$("#seance_Update_Form input[name=Etat]").val(response.etat);

					//$("#seance_Update_Form select[name=Activite]").prepend(itemActivite);
					$("#seance_Update_Form select[name=Matiere]").prepend(itemMatiere);
					$("#seance_Update_Form textarea[name=Contenu]").val(response.texte);
					$("#seance_Update_Form select[name=Module]").prepend(itemModule);
					var responseDate = response.seance.date;
					var parts = responseDate.split('-');
					var formattedDate = parts[2] + '-' + parts[1] + '-' + parts[0];

					// Set the input field value to the formatted date
					$("#seance_Update_Form input[name=Seance]").val(formattedDate)
					$('#cahierText_Update_Modal').modal('show');
			    },
			    error: function(response,textStatus ,jqXHR){
			    	$("#modalError .modal-body p").html("");
					$("#modalError .modal-body p").html(jqXHR.responseText);
			   		$('#modalError .modal-body p').modal('show'); 
			        },
		        complete: function (response,textStatus ,jqXHR) {
		        	//Chargement des AcrivitePedagogique
		  			$.ajax({
		  			url : "../AcrivitePedagogiqueList",
		  			type: "GET",
		  			dataType: 'json',
		  			contentType: "application/json; charset=UTF-8",
		  			success: function(response,textStatus ,jqXHR){
		  				$("#seance_Update_Form select[name=Activite]").html("");
		  				for(i=0;i<response.length;i++){
		  					var item  ='<option value="'+response[i].id+'">'+response[i].nom_Fr +'</option>';
		  					$("#seance_Update_Form select[name=Activite] ").append(item);       
		  				}	
		  		    },
		  		    error: function(response,textStatus ,jqXHR){
		  		    	$("#modalError .modal-body p").html("");
		  				$("#modalError .modal-body p").html(jqXHR.responseText);
		  		   		$('#modalError .modal-body p').modal('show'); 
		  		        }
		  		});  
		  	         // On Charge les chapitres dans Select chapitre
		            var selectedMatiere = $("#seance_Update_Form select[name=Matiere]").val();
		            var selectedModule =  $("#seance_Update_Form select[name=Module]").val();
		            $.ajax({
		                url : "../ChapitreByMatiereModuleList?selectedMatiere=" + selectedMatiere + "&selectedModule=" + selectedModule,
		                type: "GET",
		                dataType: 'json',
		                contentType: "application/json; charset=UTF-8",
		                success: function(response,textStatus ,jqXHR){
		                    $("#seance_Update_Form select[name=Chapitre]").html("");
		                    $("#seance_Update_Form select[name=Concepte]").html("");

		                    for(i=0;i<response.length;i++){
		                        var item  ='<option value="'+response[i].id+'">'+response[i].nom+'</option>';
		                        $("#seance_Update_Form select[name=Chapitre]").append(item);       
		                    }   
		                },
		                error: function(response,textStatus ,jqXHR){
		                    $("#modalError .modal-body p").html("");
		                    $("#modalError .modal-body p").html(jqXHR.responseText);
		                    $('#modalError .modal-body p').modal('show'); 
		                }
		            });
		    		$("#seance_Update_Form select[name=Chapitre]").change(function(){
					    // On recupere l Id du chapitre
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
					                $("#seance_Update_Form select[name=Concepte]").append(item);       
					            }
					            // Add styles to the select element
					            $("#seance_Update_Form select[name=Concepte]").addClass("my-select");
					        },
					        error: function(response,textStatus ,jqXHR){
					            $("#modalError .modal-body p").html("");
					            $("#modalError .modal-body p").html(jqXHR.responseText);
					            $('#modalError .modal-body p').modal('show'); 
					        },
					        complete: function (response,textStatus ,jqXHR) {
					            $("#seance_Update_Form select[name=Concepte]").prop('disabled', false);
					        }
					    });
				});
		  			    
			    }
			});
		});
  		

/* 5- Envoie du formulaire de modification */
  				$("#seance_Update_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#cahierText_Update_Modal').modal('hide');		//Fermer la fenetre modal apres envoie du formulaire
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
						};
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(response);
				   		$('#modalError').modal('show'); 
				    },
				   complete: function (response,textStatus ,jqXHR) {
					 	//Effacer le DataTable Classes
						$('#data_table_cahierTexte').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable Classes
						populateCahierTexteDataTable();
			  			    
				    }
				});
				return false;
			});
  			//cette fonction est appelée lorsque l'utilisateur clique sur le bouton "CahierTexte-details" 
  			//dans une table de données.Elle envoie une requête ajax pour récupérer les détails
  			//du CahierTexte correspondant à l'ID de ce bouton, puis affiche ces détails dans un modal.
  			//Les détails affichés comprennent la date de la séance, le contenu et l'activité pédagogique associés au CahierTexte,
  			//l'état de la séance, la matière et le module de la séance.
  			//Si une erreur se produit pendant la requête ajax, un modal d'erreur est affiché avec le message d'erreur.

  			$('#data_table_cahierTexte').on('click','.CahierTexte-details', function(evt){
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
  						var activite ='<li class="list-group-item"><span><strong>Activite pedagogique  </strong></span><span class="float-right">'+response.texte+'</span></li>';
  						var etat ='<li class="list-group-item"><span><strong>etat  </strong></span><span class="float-right">'+response.seance.etat+'</span></li>';
  						var Matiere ='<li class="list-group-item"><span><strong>Matiere  </strong></span><span class="float-right">'+response.seance.seanceGenerique.matiere.nom_Ar+'</span></li>';
  						var Module ='<li class="list-group-item"><span><strong>Module  </strong></span><span class="float-right">'+response.texte+'</span></li>';
  						
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
  			
  			/*********** Suppression d'un cahier texte ****************
  			/* 1 - Récuperer l' Id du cahierTexte séléctionner sur la DataTable cahierTexte
  			/* 2 - Supprimer via ajax le cahierTexte concerné
  			*****************************************************/
  			$('#data_table_cahierTexte').on('click','.CahierTexte-delete', function(evt){
				$this = $(this);
				var id= $this.attr('CahierTexteId');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
						$.ajax({
							url : "../CahierTexteDelete?id="+id,
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
								$('#data_table_cahierTexte').DataTable().rows().remove().draw();
					  			//Raffrichir le DataTable 
								populateCahierTexteDataTable();
						    },
						});
				  });
				return false;
			});
  			
  			
			/*********** Charger les infos de l'annee  courante ********/
  			$.ajax({
  					url : '../Classe/Details?id='+<%= request.getParameter("id")%>,
  					type: "GET",
  					dataType: 'json',
  					success: function(response,textStatus ,jqXHR){
  					$('#ClasseInfo').html(response.code);
  				// AnneeScolaireInfo
					$('#AnneeScolaireInfo').html('<i class="fa fa-calendar-alt mr-2"></i>' + response.anneeScolaire.code);
  				    },
  				    error: function(response,textStatus ,jqXHR){
  				    	$("#modalError .modal-body p").html("");
  						$("#modalError .modal-body p").html(jqXHR.responseText);
  				   		$('#modalError .modal-body p').modal('show'); 
  				        }
  				});
    </script>
</body>
</html>