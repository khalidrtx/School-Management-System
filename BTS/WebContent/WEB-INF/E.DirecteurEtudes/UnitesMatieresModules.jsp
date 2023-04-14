<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<title>Unités-Matières-Modules</title>
  	
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
		<!-- Col 0 -->
		  <div class="alert bg-light text-muted">
		  	<div class="alert bg-light text-secondary" role="alert">
	   			<i class="fa fa-list-ol mr-2"></i>
	   			Unités-Matières-Modules
		   	</div>
		  </div> 
		<!--/ Col 0 -->
		<div class="row">
		<div class="col-md-9"> <!-- Col 1 -->
		<div class="panel with-nav-tabs panel-primary">
		     <div class="panel-heading">
					<nav class="nav nav-tabs flex-column flex-sm-row"  id="Tab-Content" role="tablist">
					    <a id="tab_Unites" href="#content-tab-Unites" class="nav-item nav-link active" data-toggle="tab" role="tab" aria-controls="content-tab-Unites" aria-selected="false">
					        <i class="fa fa-list-ol mr-2"></i> Unites
					    </a>
					    <a id="tab_Matieres" href="#content-tab-Matieres" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-tab-Matieres" aria-selected="false">
					        <i class="fa fa-square-root-alt mr-2"></i> Matières
					    </a>
					    <a id="tab_Modules" href="#content-tab-Modules" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-tab-Modules" aria-selected="false">
					        <i class="fa fa-stream mr-2"></i> Modules
					    </a>
					     <a id="tab_Chapitres" href="#content_tab_chapitre" class="nav-item nav-link " data-toggle="tab" role="tab" aria-controls="content_tab_chapitre" aria-selected="false">
					        <i class="fa fa-list-khalid mr-2"></i> chapitres
					    </a>
					</nav>
			</div>
		    <div class="panel-body">
		    	<!-- Tab content -->
				<div class="tab-content" id="Tab-Content">
						<!-- Content tab 1	: Unites-->
						<div id="content-tab-Unites" class="tab-pane active" role="tabpanel" aria-labelledby="content-tab-Unites">
					   		<div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-list-ol mr-2"></i>
					   			Unites
						        <a href="#" data-toggle="modal" data-target="#unite_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter une unite"><i class="fa fa-plus"></i></a>
						    </div>
							<table id="data_table_unites" class="table table-striped table-bordered" cellspacing="0" width="100%">
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
							<!-- Début : Modal Add New Unite -->
								<div id="unite_Add_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="unite_Add_Form" method="POST" action="../Unite/Add" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Ajouter une unité
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="unite_code" class="col-sm-3 control-label">Code unité</label>
												    <div class="col-sm-9">
												      <input id="unite_code" type="text" class="form-control" name="code" placeholder="Code du unite" required/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="unite_Nom_Fr" class="col-sm-3 control-label">Nom de l'unité</label>
												  <div class="col-sm-9">
												    <input id="unite_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom du unite en français" required/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="unite_Nom_Ar" class="col-sm-3 control-label">إسم الوحدة</label>
												  <div class="col-sm-9">
												    <input id="unite_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم السلك بالعربية"/>
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
								<div id="unite_Update_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="unite_Update_Form" method="POST" action="../Unite/Update" >
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
										    		<label for="unite_code" class="col-sm-3 control-label">Code unité</label>
												    <div class="col-sm-9">
												      <input  type="hidden" class="form-control" name="id" />
												      <input id="unite_code" type="text" class="form-control" name="code" placeholder="Code du unite"/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="unite_Nom_Fr" class="col-sm-3 control-label">Nom de l'unité</label>
												  <div class="col-sm-9">
												    <input id="unite_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom du unite"/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="unite_Nom_Ar" class="col-sm-3 control-label">إسم الوحدة</label>
												  <div class="col-sm-9">
												    <input id="unite_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم السلك بالعربية"/>
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
								<div id="unite_Details_Modal" class="modal" tabindex="-1" role="dialog">
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
						</div>
						<!-- /Content tab 1	: Unites-->
						<!-- Content tab 2	: Matières-->
						<div id="content-tab-Matieres" class="tab-pane" role="tabpanel" aria-labelledby="content-tab-Matieres">
							<div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-square-root-alt mr-2"></i>
					   			Matières
						        <a href="#" data-toggle="modal" data-target="#matiere_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter une matière"><i class="fa fa-plus"></i></a>
						        
							</div>
							<table id="data_table_matieres" class="table table-striped table-bordered" cellspacing="0" width="100%">
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
							<!-- Début : Modal Add New Matiere -->
								<div id="matiere_Add_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="matiere_Add_Form" method="POST" action="../Matiere/Add" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Ajouter une matière
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="matiere_code" class="col-sm-3 control-label">Code</label>
												    <div class="col-sm-9">
												      <input id="matiere_code" type="text" class="form-control" name="code" placeholder="Code de la matière" required/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="matiere_Nom_Fr" class="col-sm-3 control-label">Nom de la matière</label>
												  <div class="col-sm-9">
												    <input id="matiere_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom de la matière" required/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="matiere_Nom_Ar" class="col-sm-3 control-label">إسم المادة</label>
												  <div class="col-sm-9">
												    <input id="matiere_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم المادة بالعربية"/>
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
								<div id="matiere_Update_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="matiere_Update_Form" method="POST" action="../Matiere/Update" >
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
										    		<label for="matiere_code" class="col-sm-3 control-label">Code</label>
												    <div class="col-sm-9">
												      <input  type="hidden" class="form-control" name="id" />
												      <input id="matiere_code" type="text" class="form-control" name="code" placeholder="Code de la matière" required/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="matiere_Nom_Fr" class="col-sm-3 control-label">Nom de la matière</label>
												  <div class="col-sm-9">
												    <input id="matiere_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom de la matière" required/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="matiere_Nom_Ar" class="col-sm-3 control-label">إسم المادة</label>
												  <div class="col-sm-9">
												    <input id="matiere_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم المادة بالعربية"/>
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
								<div id="matiere_Details_Modal" class="modal" tabindex="-1" role="dialog">
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
						</div>
						<!-- /Content tab 2	: Matières-->
						<!-- Content tab 3	: Modules-->
						<div id="content-tab-Modules" class="tab-pane" role="tabpanel" aria-labelledby="content-tab-Modules">
					   		<div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-stream mr-2"></i>
					   			Modules
						        <a href="#" data-toggle="modal" data-target="#module_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter un module"><i class="fa fa-plus"></i></a>
						        
							</div>
							<table id="data_table_modules" class="table table-striped table-bordered" cellspacing="0" width="100%">
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
							<!-- Début : Modal Add New Module -->
								<div id="module_Add_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="module_Add_Form" method="POST" action="../Module/Add" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Ajouter un module
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="module_code" class="col-sm-3 control-label">Code</label>
												    <div class="col-sm-9">
												      <input id="module_code" type="text" class="form-control" name="code" placeholder="Code du module" required/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="module_Nom_Fr" class="col-sm-3 control-label">Nom du module</label>
												  <div class="col-sm-9">
												    <input id="module_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom du module" required/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="module_Nom_Ar" class="col-sm-3 control-label">إسم الوحدة</label>
												  <div class="col-sm-9">
												    <input id="module_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم الوحدة بالعربية"/>
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
								<div id="module_Update_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="module_Update_Form" method="POST" action="../Module/Update" >
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
										    		<label for="module_code" class="col-sm-3 control-label">Code</label>
												    <div class="col-sm-9">
												      <input  type="hidden" class="form-control" name="id" />
												      <input id="module_code" type="text" class="form-control" name="code" placeholder="Code du module" required/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="module_Nom_Fr" class="col-sm-3 control-label">Nom du module</label>
												  <div class="col-sm-9">
												    <input id="module_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom du module" required/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="module_Nom_Ar" class="col-sm-3 control-label">إسم الوحدة</label>
												  <div class="col-sm-9">
												    <input id="module_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم الوحدة بالعربية"/>
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
								<div id="module_Details_Modal" class="modal" tabindex="-1" role="dialog">
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
						<!-- /Content tab 3	: Modules-->
						<!-- llllllllllllllllllllllllllllllllllllllll
						the probleme was ==> class="tab-pane active"
						it should be inactive
						 -->
						<!-- Content tab 4	: chapitre-->
						<div id="content_tab_chapitre" class="tab-pane" role="tabpanel" aria-labelledby="content-tab-Chapitres">
					   		<div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-list-khalid mr-2"></i>
					   			Chaiptres
						        <a href="#" data-toggle="modal" data-target="#classe_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter une chapitre"><i class="fa fa-plus"></i></a>
						    </div>
							<table id="data_table_chapitres" class="table table-striped table-bordered" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>N°</th>
										<th>Nom</th>
										<th>Description</th>
							            <th>Action</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							<!-- Début : Modal Add New chapitre -->
				<div id="classe_Add_Modal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog">
					<form id="classe_Add_Form" method="POST" action="../Chapitre/Add" >
				      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
				          	<div class="modal-header bg-info">
				        		<h4 class="modal-title text-white">
				        			Ajouter une Chapitre 
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
							 <!-- Début : Modal Update chapitre -->
								<div id="#" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="unite_Update_Form" method="POST" action="../Unite/Update" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Modifier chapitre
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="unite_code" class="col-sm-3 control-label">Code unité</label>
												    <div class="col-sm-9">
												      <input  type="hidden" class="form-control" name="id" />
												      <input id="unite_code" type="text" class="form-control" name="code" placeholder="Code du unite"/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="unite_Nom_Fr" class="col-sm-3 control-label">Nom de l'unité</label>
												  <div class="col-sm-9">
												    <input id="unite_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom du unite"/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="unite_Nom_Ar" class="col-sm-3 control-label">إسم الوحدة</label>
												  <div class="col-sm-9">
												    <input id="unite_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم السلك بالعربية"/>
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
							 <!-- Fin : Modal Update Chapitre -->
							 <!-- Début : Modal Details chapitre -->
								<div id="#" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Détails de chapitre
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
							 <!-- Fin : Modal Details Chapitre -->
						</div>
			<!-- /Content tab 1	: Chapitre-->	
						
						
<!-- teeeeeeeeeeeeeeeeeeeeeeeeest -->
						
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
					        <span class="fa fa-bullhorn mr-1"></span> Annonces
					    </a>
					    <a  id="tab_Actualites" href="#content-tab-Actualites" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-tab-Actualites" aria-selected="false">
					        <span class="fa fa-newspaper mr-1"></span>Actualites
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
		
		
  		/************** DataTable du Tab : Unites **************/
	  		// Initialisation du DataTable Unites
	  		$('#data_table_unites').DataTable(
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
	  		/******* fonction pour charger la liste des Unites dans la TableData Unites ******/
			function populateUniteDataTable(){
				var tableData = $('#data_table_unites').DataTable();
				//tableData.DataTable().rows().remove().draw();		// Vider la TableData 
				$.ajax({
					url : "../Unite/List",
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
										  	<a class="dropdown-item unite-details text-primary" href="#" uniteId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
										  	<a class="dropdown-item unite-update text-primary" href="#" uniteId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
										  	<a class="dropdown-item unite-delete text-primary" href="#" uniteId="'+response[i].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
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
			
			/*
			/* Au chargement de la page charger la listes des unités
			*/
			populateUniteDataTable();
			/* Au click sur le tab Unites : 
			/* On charger la liste des Unites dans la TableData Unites
			*/
			
			$('#tab_Unites').on('click', function(e){
					// Effacer le DataTable Unites
					$('#data_table_unites').DataTable().rows().remove().draw();
					// Charger la liste des unites dans le DataTable Unites
		  			populateUniteDataTable();
					e.preventDefault();
			});
			
  			/********** Ajouter un nouveau Unite **********************/
  			//Effacer dabord le formulaire
  			$('#unite_Add_Modal').on('shown.bs.modal', function(evt){
  				$('#unite_Add_Form').trigger('reset');
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
						$('#data_table_unites').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable Unites
						populateUniteDataTable();    
				    }
				});
				return false;
			});	
  			
  			/*********** Modification d'une Unite ****************
  			/* 1 - Récuperer l' Id du Unite séléctionner sur la DataTable Unites
  			/* 2 - Charger par ajax le Unite concerné
  			/* 3 - Remplir les champs de formulaire de modification avec les données du Unite concerné
  			/* 4 - Afficher le formulaire de modification
  			*****************************************************/
  			
  			$('#data_table_unites').on('click','.unite-update', function(evt){
				$this = $(this);
				var id= $this.attr('uniteId');
				$.ajax({
					url : "../Unite/Details?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#unite_Update_Form input[name=id]").val(response.id);
						$("#unite_Update_Form input[name=code]").val(response.code);
						$("#unite_Update_Form input[name=nom_Fr]").val(response.nom_Fr);
						$("#unite_Update_Form input[name=nom_Ar]").val(response.nom_Ar);
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
						$('#data_table_unites').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable Unites
						populateUniteDataTable();    
				    }   
				});
				return false;
			});	
  			/*********** Suppression d'une Unite ****************
  			/* 1 - Récuperer l' Id du Unite séléctionner sur la DataTable Unites
  			/* 2 - Supprimer par ajax le Unite concerné
  			*****************************************************/
  			
  			$('#data_table_unites').on('click','.unite-delete', function(evt){
				$this = $(this);
				var id= $this.attr('uniteId');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
					
						$.ajax({
							url : "../Unite/Delete?id="+id,
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
								$('#data_table_unites').DataTable().rows().remove().draw();
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
				var id= $this.attr('uniteId');
				$.ajax({
					url : "../Unite/Details?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						var codeItem ='<li class="list-group-item"><span><strong>Code </strong></span><span class="float-right">'+response.code+'</span></li>';
						var nom_FrItem ='<li class="list-group-item"><span><strong>Nom de l\'unité  </strong></span><span class="float-right">'+response.nom_Fr+'</span></li>';
						var nom_ArItem ='<li class="list-group-item"><span><strong>إسم الوحدة</strong></span><span class="float-right" dir="rtl">'+response.nom_Ar+'</span></li>';
						$("#unite_Details_Modal .list-group").html("");
						$("#unite_Details_Modal .list-group").append(codeItem);
						$("#unite_Details_Modal .list-group").append(nom_FrItem);
						$("#unite_Details_Modal .list-group").append(nom_ArItem);
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
  			
  			
  			
  			/************** DataTable du Tab : Matieres **************/
	  		// Initialisation du DataTable Matieres
	  		$('#data_table_matieres').DataTable(
	  			{	
	  				"paging": true,
	  				"autoWidth": true,
	  				"columnDefs": [
	  					{ "orderable": false, "targets": 3 }
	  				],
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
	  		/******* fonction pour charger la liste des Matieres dans la TableData Matieres ******/
			function populateMatiereDataTable(){
				var tableData = $('#data_table_matieres').DataTable();
				//tableData.DataTable().rows().remove().draw();		// Vider la TableData 
				$.ajax({
					url : "../Matiere/List",
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
								  <div class="dropdown-menu shadow p-3 mb-5 bg-white rounded" id="dropdownUnite"> \
								    <div class="bg-info text-white px-3 py-1"><span class="fa fa-ellipsis-h mr-4"></span> Actions</div> \
							        <div class="dropdown-divider"></div> \
								  	<a class="dropdown-item matiere-details text-primary" href="#" matiereId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
								  	<a class="dropdown-item matiere-update text-primary" href="#" matiereId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
								  	<a class="dropdown-item matiere-delete text-primary" href="#" matiereId="'+response[i].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
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
			
			/* Au click sur le tab Matieres : 
			/* On charger la liste des Matieres dans la TableData Matieres
			*/
			
			$('#tab_Matieres').on('click', function(e){
					// Effacer le DataTable Matieres
		  			$('#data_table_matieres').DataTable().rows().remove().draw();
		  			// Charger la liste des matieres dans le DataTable Matieres
		  			populateMatiereDataTable();
					e.preventDefault();
			});
  			
  			/********** Ajouter une nouvelle Matiere **********************/
  			//Effacer dabord le formulaire
  			$('#matiere_Add_Modal').on('shown.bs.modal', function(evt){
  				$('#matiere_Add_Form').trigger('reset');
  			});
  			
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
					 	//Effacer le DataTable Matieres
						$('#data_table_matieres').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable Matieres
						populateMatiereDataTable();
			  			    
				    }
				});
				return false;
			});	
  			
  			/*********** Modification d'une Matiere ****************
  			/* 1 - Récuperer l' Id de la Matiere séléctionner sur la DataTable Matieres
  			/* 2 - Charger par ajax le Matiere concerné
  			/* 3 - Remplir les champs de formulaire de modification avec les données du Matiere concerné
  			/* 4 - Afficher le formulaire de modification
  			*****************************************************/
  			
  			$('#data_table_matieres').on('click','.matiere-update', function(evt){
				$this = $(this);
				var id= $this.attr('matiereId');
				$.ajax({
					url : "../Matiere/Details?id="+id,
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						$("#matiere_Update_Form input[name=id]").val(response.id);
						$("#matiere_Update_Form input[name=code]").val(response.code);
						$("#matiere_Update_Form input[name=nom_Fr]").val(response.nom_Fr);
						$("#matiere_Update_Form input[name=nom_Ar]").val(response.nom_Ar);
						$('#matiere_Update_Modal').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
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
				    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(response);
				   		$('#modalError').modal('show'); 
				    },
				   complete: function (response,textStatus ,jqXHR) {
					 	//Effacer le DataTable Matieres
						$('#data_table_matieres').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable Matieres
						populateMatiereDataTable();
			  			    
				    }
				});
				return false;
			});
  			
  			/*********** Suppression d'une Matiere ****************
  			/* 1 - Récuperer l' Id du Matiere séléctionner sur la DataTable Matieres
  			/* 2 - Supprimer via ajax le Matiere concerné
  			*****************************************************/
  			
  			$('#data_table_matieres').on('click','.matiere-delete', function(evt){
				$this = $(this);
				var id= $this.attr('matiereId');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
						$.ajax({
							url : "../Matiere/Delete?id="+id,
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
							 	//Effacer le DataTable Matieres
								$('#data_table_matieres').DataTable().rows().remove().draw();
					  			//Raffrichir le DataTable Matieres
								populateMatiereDataTable();
					  			    
						    }
						});
				  });
				return false;
			});
  			
  			/*********** Affichage des détails d'une Matiere****************
  			/* 1 - Récuperer l' Id de la matière séléctionner sur la DataTable Filiers
  			/* 2 - Charger par ajax la matière concernée
  			/* 3 - Afficher les détails la matière concernée
  			*****************************************************/
  			
  			$('#data_table_matieres').on('click','.matiere-details', function(evt){
				$this = $(this);
				var id= $this.attr('matiereId');
				$.ajax({
					url : "../Matiere/Details?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						var codeItem ='<li class="list-group-item"><span><strong>Code </strong></span><span class="float-right">'+response.code+'</span></li>';
						var nom_FrItem ='<li class="list-group-item"><span><strong>Nom de la matière  </strong></span><span class="float-right">'+response.nom_Fr+'</span></li>';
						var nom_ArItem ='<li class="list-group-item"><span class="float-right"><strong>إسم المادة</strong></span><span class="float-left" dir="rtl">'+response.nom_Ar+'</span></li>';
						$("#matiere_Details_Modal .list-group").html("");
						$("#matiere_Details_Modal .list-group").append(codeItem);
						$("#matiere_Details_Modal .list-group").append(nom_FrItem);
						$("#matiere_Details_Modal .list-group").append(nom_ArItem);
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
  			
  			/************** DataTable du Tab : Modules **************/
	  		// Initialisation du DataTable Modules
	  		$('#data_table_modules').DataTable(
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
	  		/******* fonction pour charger la liste des Modules dans la TableData Modules ******/
			function populateModuleDataTable(){
				var tableData = $('#data_table_modules').DataTable();
				//tableData.DataTable().rows().remove().draw();		// Vider la TableData 
				$.ajax({
					url : "../Module/List",
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
								  	<a class="dropdown-item module-details text-primary" href="#" moduleId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
								  	<a class="dropdown-item module-update text-primary" href="#" moduleId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
								  	<a class="dropdown-item module-delete text-primary" href="#" moduleId="'+response[i].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
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
			/* Au click sur le tab Modules : 
			/* On charger la liste des Modules dans la TableData Modules
			*/
			
			$('#tab_Modules').on('click', function(e){
					// Effacer le DataTable Modules
					$('#data_table_modules').DataTable().rows().remove().draw();
					// Charger la liste des modules dans le DataTable Modules
		  			populateModuleDataTable();
					e.preventDefault();
			});
			
  			/********** Ajouter un nouveau Module **********************/
  			//Effacer dabord le formulaire
  			$('#module_Add_Modal').on('shown.bs.modal', function(evt){
  				$('#module_Add_Form').trigger('reset');
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
				    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError').modal('show'); 
				        },
					complete: function (response,textStatus ,jqXHR) {
				    	
						//Effacer le DataTable Modules
						$('#data_table_modules').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable Modules
						populateModuleDataTable();    
				    }
				});
				return false;
			});	
  			
  			/*********** Modification d'un Module ****************
  			/* 1 - Récuperer l' Id du Module séléctionner sur la DataTable Modules
  			/* 2 - Charger par ajax le Module concerné
  			/* 3 - Remplir les champs de formulaire de modification avec les données du Module concerné
  			/* 4 - Afficher le formulaire de modification
  			*****************************************************/
  			
  			$('#data_table_modules').on('click','.module-update', function(evt){
				$this = $(this);
				var id= $this.attr('moduleId');
				$.ajax({
					url : "../Module/Details?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#module_Update_Form input[name=id]").val(response.id);
						$("#module_Update_Form input[name=code]").val(response.code);
						$("#module_Update_Form input[name=nom_Fr]").val(response.nom_Fr);
						$("#module_Update_Form input[name=nom_Ar]").val(response.nom_Ar);
						$('#module_Update_Modal').modal('show');
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
  			
  			$("#module_Update_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#module_Update_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
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
				    	
						//Effacer le DataTable Modules
						$('#data_table_modules').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable Modules
						populateModuleDataTable();    
				    }   
				});
				return false;
			});	
  			/*********** Suppression d'un Module ****************
  			/* 1 - Récuperer l' Id du Module séléctionner sur la DataTable Modules
  			/* 2 - Supprimer par ajax le Module concerné
  			*****************************************************/
  			
  			$('#data_table_modules').on('click','.module-delete', function(evt){
				$this = $(this);
				var id= $this.attr('moduleId');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
					
						$.ajax({
							url : "../Module/Delete?id="+id,
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
						    	
								//Effacer le DataTable Modules
								$('#data_table_modules').DataTable().rows().remove().draw();
					  			//Raffrichir le DataTable Modules
								populateModuleDataTable();    
						    }
						});
				  });
				
				
				return false;
			});
  			
  			/*********** Affichage des détails d'un Module ****************
  			/* 1 - Récuperer l' Id du Module séléctionné sur la DataTable Modules
  			/* 2 - Charger par ajax le Module concerné
  			/* 3 - Afficher les détails du Module concerné 
  			*****************************************************/
  			
  			$('#data_table_modules').on('click','.module-details', function(evt){
				$this = $(this);
				var id= $this.attr('moduleId');
				$.ajax({
					url : "../Module/Details?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						var codeItem ='<li class="list-group-item"><span><strong>Code </strong></span><span class="float-right">'+response.code+'</span></li>';
						var nom_FrItem ='<li class="list-group-item"><span><strong>Nom du module  </strong></span><span class="float-right">'+response.nom_Fr+'</span></li>';
						var nom_ArItem ='<li class="list-group-item"><span><strong>إسم الوحدة </strong></span><span class="float-right" dir="rtl">'+response.nom_Ar+'</span></li>';
						$("#module_Details_Modal .list-group").html("");
						$("#module_Details_Modal .list-group").append(codeItem);
						$("#module_Details_Modal .list-group").append(nom_FrItem);
						$("#module_Details_Modal .list-group").append(nom_ArItem);
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
  	
  	
  	
  	
  	
  	
  
  	
	/************** DataTable du Tab : chapitres **************/
	// Initialisation du DataTable chapitres
	$('#data_table_chapitres').DataTable(
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
	/******* fonction pour charger la liste des chapitres dans la TableData chapitres ******/
		function populateChapitreDataTable(){
			var tableData = $('#data_table_chapitres').DataTable();
			//tableData.DataTable().rows().remove().draw();		// Vider la TableData 
			$.ajax({
				url : "../Chapitre/List",
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
							  	<a class="dropdown-item classe-details text-primary" href="#" chapitreId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Infos</a> \
							  	<a class="dropdown-item classe-update text-primary" href="#" chapitreId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
							  	<a class="dropdown-item classe-delete text-primary" href="#" chapitreId="'+response[i].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
							  	<div class="dropdown-divider"></div> \
							  	<a class="dropdown-item classe-full-details text-primary" href="${pageContext.request.contextPath}/E.DirecteurEtudes/ClasseDetails?id='+response[i].id+'" classeId="'+response[i].id+'"><span class="fa fa-cog mr-4"></span>Détails</a> \
							  </div> \
							</div> ';
						tableData.row.add( [
						             rang,
						             response[i].nom,
						             response[i].description,

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
		
	
			/* Au click sur le tab chapitre : 
	/* On charger la liste des Unites dans la TableData Unites
	*/
	//Effacer dabord le formulaire

	$('#tab_Chapitres').on('click', function(e){
			// Effacer le DataTable Unites
			$('#data_table_chapitres').DataTable().rows().remove().draw();
			// Charger la liste des unites dans le DataTable Unites
  			populateChapitreDataTable();
			e.preventDefault();
	});
	
	/********** Ajouter un nouveau Chapitre **********************/
		$('#Chapitre_Add_Modal').on('shown.bs.modal', function(evt){
			$('#chapitre_Add_Form').trigger('reset');
		});
		//Envoyer le formulaire via ajax
		$("#chapitre_Add_Form").submit(function(event){ 
		var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
		var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
		var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
		$('#Chapitre_Add_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
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
				$('#data_table_chapitres').DataTable().rows().remove().draw();
	  			//Raffrichir le DataTable Unites
				populateChapitreDataTable();    
		    }
		});
		return false;
	});	
		////////new added/////////////////////
		
		/************** DataTable du Tab : Classes **************/
  		// Initialisation du DataTable Classes

  	
  	
 
  		//Chargement des Matieres dans Select filiere
		$.ajax({
		url : "../Matiere/List",
		type: "GET",
		dataType: 'json',
		contentType: "application/json; charset=UTF-8",
		success: function(response,textStatus ,jqXHR){
			$("#classe_Add_Form select[name=Matiere]").html("");
			for(i=0;i<response.length;i++){
				var item  ='<option value="'+response[i].id+'">'+response[i].code+'</option>';
				$("#classe_Add_Form select[name=Matiere]").append(item);       
			}	
	    },
	    error: function(response,textStatus ,jqXHR){
	    	$("#modalError .modal-body p").html("");
			$("#modalError .modal-body p").html(jqXHR.responseText);
	   		$('#modalError .modal-body p').modal('show'); 
	        }
	});
  		//Chargement des Modules dans Select Module
  	    $.ajax({
		url : "../Module/List",
		type: "GET",
		dataType: 'json',
		contentType: "application/json; charset=UTF-8",
		success: function(response,textStatus ,jqXHR){
			$("#classe_Add_Form select[name=Module]").html("");
			for(i=0;i<response.length;i++){
				var item  ='<option value="'+response[i].id+'">'+response[i].code+'</option>';
				$("#classe_Add_Form select[name=Module]").append(item);       
			}	
	    },
	    error: function(response,textStatus ,jqXHR){
	    	$("#modalError .modal-body p").html("");
			$("#modalError .modal-body p").html(jqXHR.responseText);
	   		$('#modalError .modal-body p').modal('show'); 
	        }
	});
  		////////////////////////////////////////////////
  		//Envoie du formulaire d'ajout de la Classe
  			$("#classe_Add_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#classe_Add_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
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
					 	//Effacer le DataTable Classes
						$('#data_table_chapitres').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable Classes
						populateChapitreDataTable();
			  			    
				    }
				});
				return false;
			});	
  			/*********** Suppression d'une chapitre ****************
  			/* 1 - Récuperer l' Id du Classe séléctionner sur la DataTable Classes
  			/* 2 - Supprimer via ajax le Classe concerné
  			*****************************************************/
  			
  			$('#data_table_chapitres').on('click','.classe-delete', function(evt){
				$this = $(this);
				var id= $this.attr('chapitreId');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
						$.ajax({
							url : "../Chapitre/Delete?id="+id,
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
							 	//Effacer le DataTable Classes
								$('#data_table_chapitres').DataTable().rows().remove().draw();
					  			//Raffrichir le DataTable Classes
								populateChapitreDataTable();
					  			    
						    }
						});
				  });
				return false;
			});
  			
    </script>
   
</body>
</html>