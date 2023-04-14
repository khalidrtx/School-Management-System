
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Liste des classes </title>
  
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
		   			<i class="fa fa-chalkboard-teacher mr-2"></i>
		   			Classe : 
		   			
			        
		</div>
		<div class="panel with-nav-tabs panel-primary">
		     <div class="panel-heading">
					<nav class="nav nav-tabs flex-column flex-sm-row"  id="Tab-Content" role="tablist">
					    <a id="tab_Etudiants" href="#content-tab-Etudiants" class="nav-item nav-link active" data-toggle="tab" role="tab" aria-controls="content-tab-Etudiants" aria-selected="false">
					       <i class="fa fa-calendar-alt mr-2"></i> Emplois du temps 
					    </a>
					    <a id="tab_EmploieDuTemps" href="#content-tab-EmploieDuTemps" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-tab-EmploieDuTemps" aria-selected="false">
					        <i class="fa fa-calendar-alt mr-2"></i> Tableau de service
					    </a>
					    <a id="tab_Absences" href="#content-tab-Absencess" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-tab-Absences" aria-selected="false">
					        <i class="fa fa-user-check mr-2"></i> ...
					    </a>
					</nav>
			</div>
		    <div class="panel-body">
		    	<!-- Tab content -->
				<div class="tab-content" id="Tab-Content">
						<!-- Content tab 1	: Programme-->
						<div id="content-tab-Etudiants" class="tab-pane active" role="tabpanel" aria-labelledby="">
					   		<div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-users mr-2"></i>
					   			Classe 
		        <a href="#" data-toggle="modal" data-target="#classe_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter une classe"><i class="fa fa-plus"></i></a>
						        <select style="width:400px;" id="cll" name="cll" class="form-control"></select>
						    </div>
							<!-- Début : Table Etudiants -->
			<table  class="table table-striped table-bordered rounded mt-5"cellspacing="0" width="100%">
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
			            <th id="Lundi_8H_10H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Lundi_10H_12H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Lundi_14H_16H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Lundi_16H_18H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
					</tr>
					<tr>
						<th class="bg-warning text-center">MAR</th>
			            <th id="Mardi_8H_10H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Mardi_10H_12H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Mardi_14H_16H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Mardi_16H_18H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
					</tr>
					<tr>
						<th class="bg-warning text-center">MER</th>
			             <th id="Mercredi_8H_10H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Mercredi_10H_12H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Mercredi_14H_16H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Mercredi_16H_18H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
					</tr>
					<tr>
						<th class="bg-warning text-center">JEU</th>
			            <th id="Jeudi_8H_10H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Jeudi_10H_12H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Jeudi_14H_16H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Jeudi_16H_18H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
					</tr>
					<tr>
						<th class="bg-warning text-center">VEN</th>
			            <th id="Vendredi_8H_10H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Vendredi_10H_12H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Vendredi_14H_16H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Vendredi_16H_18H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
					</tr>
					<tr>
						<th class="bg-warning text-center">SAM</th>
			            <th id="Samedi_8H_10H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Samedi_10H_12H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Samedi_14H_16H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
			            <th id="Samedi_16H_18H"><span class="icons" style="display:none"></span><span class="icons" style="display:none">
			            <i class="fas fa-edit"></i>
			             <i class="fas fa-trash"></i>
			            </span></th>
					</tr>
				</tbody>
			</table>
							<!-- Fin : Table Etudiants  -->
							<!-- Début : Modal Add New Etudiants -->
			<div id="classe_Add_Modal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog">
					<form id="classe_Add_Form" method="POST" action="../Emploi/Add" >
				      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
				          	<div class="modal-header bg-info">
				        		<h4 class="modal-title text-white">
				        			Ajouter une séance 
				        		</h4>
				        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			    					<span aria-hidden="true">&times;</span>
			  					</button>
				        	</div>
				          	<div class="modal-body">
				          		<div class="form-group row">
						    		<label for="clss" class="col-sm-3 control-label">Classe</label>
								    <div class="col-sm-9">
								      <input id="clss" type="text" class="form-control" name="clss"  readonly>
								   
								    </div>
								    <div class="col-sm-9">
								     <input id="cl" type="hidden"class="form-control" name="classe"  required>
								     
								    </div>
						  		</div>
								<div class="form-group row">
								  <label for="mat" class="col-sm-3 control-label">Matière</label>
								  <div class="col-sm-9">
								    <select id="mat" class="form-control" name="matiere" required>
								    </select>
								  </div>
								</div>
						  		<div class="form-group row">
								  <label for="mod" class="col-sm-3 control-label">Module</label>
								  <div class="col-sm-9">
								    <select id="mod" class="form-control" name="module">
								    </select>
								  </div>
								</div>
								<div class="form-group row">
								  <label for="pofesseur" class="col-sm-3 control-label">Professeur</label>
								  <div class="col-sm-9">
								    <select id="professeur" class="form-control" name="prof" required>
								   
								   
								    </select>
								  </div>
								</div>
								<div class="form-group row">
								  <label for="salle" class="col-sm-3 control-label">Salle</label>
								  <div class="col-sm-9">
								    <select id="salle" class="form-control" name="salle" required>
								    <option>Salle1</option>
								    </select>
								  </div>
								</div>
								
								<div class="form-group row">
								  <label for="periode" class="col-sm-3 control-label">Période</label>
								  <div class="col-sm-9">
								   <select id="periode" class="form-control" name="periode">
								   <option value="1">An</option>
								    <option value="2">S1</option> <option value="3">S2</option>
								    </select>
								  </div>
								</div>
								
								<div class="form-group row">
								  <label for="jour" class="col-sm-3 control-label">Jour</label>
								  <div class="col-sm-9">
								    <select id="jour" class="form-control" name="jour">
								    <option>Lundi</option> <option>Mardi</option>
								    <option>Mercredi</option> <option>Jeudi</option>
								    <option>Vendredi</option> <option>Samedi</option>
								    </select>
								  </div>
								</div>
								
								<div class="form-group row">
								  <label for="hd" class="col-sm-3 control-label">Heure Début</label>
								  <div class="col-sm-9">
								    <select id="hd" class="form-control" name="heuredeb">
								    <option>8 H</option> <option>9 H</option>
								    <option>10 H</option> <option>11 H</option>
								    <option>14 H</option> <option>15 H</option>
								    <option>16 H</option> <option>17 H</option>
								    </select>
								  </div>
								</div>
								
								<div class="form-group row">
								  <label for="hf" class="col-sm-3 control-label">Heure Fin</label>
								  <div class="col-sm-9">
								    <select id="hf" class="form-control" name="heurefin">
								    <option>9 H</option> <option>10 H</option>
								    <option>11 H</option> <option>12 H</option>
								    <option>15 H</option> <option>16 H</option>
								    <option>17 H</option> <option>18 H</option>
								    </select>
								  </div>
								</div>
								
								<div class="form-group row">
								  <label for="duree" class="col-sm-3 control-label">Durée</label>
								  <div class="col-sm-9">
								    <input id="duree"  type="text" class="form-control" name="duree" readonly/>
								  </div>
								</div>
								
								<div class="form-group row">
								  <label for="obs" class="col-sm-3 control-label">Observation</label>
								  <div class="col-sm-9">
								    <input id="obs"  type="text" class="form-control" name="observation" placeholder="obs" />
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
							 <!-- Fin : Modal Add New Etudiants -->
 <!-- Début : Modal Update Classe -->
				<div id="classe_Update_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
					<div class="modal-dialog">
					<form id="classe_Update_Form" method="POST" action="../Classe/Update" >
				      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
				          	<div class="modal-header bg-info">
				        		<h4 class="modal-title text-white">
				        			Modifier une classe 
				        		</h4>
				        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			    					<span aria-hidden="true">&times;</span>
			  					</button>
				        	</div>
				          	<div class="modal-body">
				          		<div class="form-group row">
						    		<label for="classe_code" class="col-sm-3 control-label">Cycle</label>
						    		<input  type="hidden" class="form-control" name="id" />
								    <div class="col-sm-9">
								      <select id="classe_code" class="form-control" name="cycle" >
								      </select>
								    </div>
						  		</div>
								<div class="form-group row">
								  <label for="classe_Filiere" class="col-sm-3 control-label">Filière</label>
								  <div class="col-sm-9">
								    <select id="classe_Filiere" class="form-control" name="filiere" >
								    </select>
								  </div>
								</div>
						  		<div class="form-group row">
								  <label for="classe_Niveau" class="col-sm-3 control-label">Niveau</label>
								  <div class="col-sm-9">
								    <select id="classe_Niveau" class="form-control" name="niveau" >
								    </select>
								  </div>
								</div>
								<div class="form-group row">
								  <label for="classe_AnneeScolaire" class="col-sm-3 control-label">Année Scolaire</label>
								  <div class="col-sm-9">
								    <select id="classe_AnneeScolaire" class="form-control" name="anneescolaire" required>
								    </select>
								  </div>
								</div>
								<div class="form-group row">
								  <label for="classe_Label" class="col-sm-3 control-label">Label</label>
								  <div class="col-sm-9">
								    <input id="classe_Label"  type="text" class="form-control" name="label" placeholder="Exemple: 1 , 2, .. A, B, ...  " />
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
			 <!-- Fin : Modal Update Classe -->
						 <!-- Début : Modal Details Classe -->
				<div id="classe_Details_Modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" data-backdrop="false">
					<div class="modal-dialog">
				      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
				          	<div class="modal-header bg-info">
				        		<h4 class="modal-title text-white">
				        			Détails de la classe 
				        		</h4>
				        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			    					<span aria-hidden="true">&times;</span>
			  					</button>
				        	</div>
				          	<div class="modal-body">
				          		<ul class="list-group">
									<!-- ici on Affiche dynamiquement  les détails de classe-->
								</ul>
							</div>
							<div class="modal-footer ">
								<button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Fermer</button>
							</div>
				        </div>
					</div>
			    </div>
			 <!-- Fin : Modal Details Classe -->
							 
						</div>
						<!-- /Content tab 1	: Programme-->
						<!-- Content tab 2 	: EmploieDuTemps-->
						<div id="content-tab-EmploieDuTemps" class="tab-pane"  role="tabpanel" aria-labelledby="content-tab-EmploieDuTemps">
						   <div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-user-alt mr-2"></i>
					   			Professeur
						        <a href="#" data-toggle="modal" data-target="#EmploieDuTemps_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter une séance"><i class="fa fa-plus"></i></a>
						  						  <select style="width:400px;" id="profess" name="profess" class="form-control"></select>
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
			            <th id="lundi_8H_10H"></th>
			            <th id="lundi_10H_12H"></th>
			            <th id="lundi_14H_16H"></th>
			            <th id="lundi_16H_18H"></th>
					</tr>
					<tr>
						<th class="bg-warning text-center">MAR</th>
			            <th id="Mardi_8H_10H"></th>
			            <th id="Mardi_10H_12H"></th>
			            <th id="Mardi_14H_16H"></th>
			            <th id="Mardi_16H_18H"></th>
					</tr>
					<tr>
						<th class="bg-warning text-center">MER</th>
			             <th id="Mercredi_8H_10H"></th>
			            <th id="Mercredi_10H_12H"></th>
			            <th id="Mercredi_14H_16H"></th>
			            <th id="Mercredi_16H_18H"></th>
					</tr>
					<tr>
						<th class="bg-warning text-center">JEU</th>
			            <th id="Jeudi_8H_10H"></th>
			            <th id="Jeudi_10H_12H"></th>
			            <th id="Jeudi_14H_16H"></th>
			            <th id="Jeudi_16H_18H"></th>
					</tr>
					<tr>
						<th class="bg-warning text-center">VEN</th>
			            <th id="Vendredi_8H_10H"></th>
			            <th id="Vendredi_10H_12H"></th>
			            <th id="Vendredi_14H_16H"></th>
			            <th id="Vendredi_16H_18H"></th>
					</tr>
					<tr>
						<th class="bg-warning text-center">SAM</th>
			            <th id="Samedi_8H_10H"></th>
			            <th id="Samedi_10H_12H"></th>
			            <th id="Samedi_14H_16H"></th>
			            <th id="Samedi_16H_18H"></th>
					</tr>
				</tbody>
			</table>
						   </div>
						</div>
						<!-- /Content tab 2	: EmploieDuTemps-->
						<!-- Content tab 3 	: Absences-->
						<div id="content-tab-Absencess" class="tab-pane"  role="tabpanel" aria-labelledby="content-tab-Absencess">
						   <div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-user-check mr-2"></i>
					   			Absences
						        <a href="#" data-toggle="modal" data-target="#Absences_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter une absence"><i class="fa fa-plus"></i></a>
						   </div>
						   A faire : Charger ici les absences de la classe
						</div>
						<!-- /Content tab 3	: Absences-->
						<!-- Content tab 4 	: Evaluations-->
						<div id="content-tab-Evaluations" class="tab-pane"  role="tabpanel" aria-labelledby="content-tab-Evaluations">
						   <div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-file-signature mr-2"></i>
					   			Evaluations
						        <a href="#" data-toggle="modal" data-target="#Evaluations_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter une évaluation"><i class="fa fa-plus"></i></a>
						   </div>
						   A faire : Charger ici les évaluations de la classe
						</div>
						<!-- /Content tab 4	: Evaluations-->
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
 const tds=document.querySelectorAll('th');
 tds.forEach(th =>{
	
		 th.addEventListener('mouseover',() => {
			 th.querySelector('.text').style.display='none';
			 th.querySelector('.icons').style.display='inline-block';
		 });
		 th.addEventListener('mouseover',() => {
			 th.querySelector('.text').style.display='inline-block';
			 th.querySelector('.icons').style.display='none';
		 });
		 
		 
	
 });
  	
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
	  		/******* fonction pour charger la liste des Classes dans la TableData Classes ******/
			function populateClasseDataTable(){
				var tableData = $('#data_table_classes').DataTable();
				//tableData.DataTable().rows().remove().draw();		// Vider la TableData 
				$.ajax({
					url : "../Classe/List",
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
								  	<a class="dropdown-item classe-details text-primary" href="#" classeId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Infos</a> \
								  	<a class="dropdown-item classe-update text-primary" href="#" classeId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
								  	<a class="dropdown-item classe-delete text-primary" href="#" classeId="'+response[i].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
								  	<div class="dropdown-divider"></div> \
								  	<a class="dropdown-item classe-full-details text-primary" href="${pageContext.request.contextPath}/E.DirecteurEtudes/ClasseDetails?id='+response[i].id+'" classeId="'+response[i].id+'"><span class="fa fa-cog mr-4"></span>Détails</a> \
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
			
			
			
			
  			$("#profess").change(function(){
				
	  			 var id=$("#profess").val();
				 $.ajax({
					url : "../TableauDeService/List?idprof="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						console.log(response.length);
						// $("#L810").text("bonjour");
						for(i=0;i<response.length;i++){
							//console.log(response[i].jour+" "+response[i].heureDebut+" "+response[i].heureFin);
							
							var m="#"+response[i].jour.trim()+"_"+ response[i].heureDebut.trim()+"_"+response[i].heureFin.trim();//$("#"+response[i].jour+"_"+ response[i].heureDebut+"_"+response[i].heureFin).html(<p>"hhhh"+"\t|\t"+"hi"+"      "+"hola"</p>);
							$(m).html(response[i].matiere.code+"<br>"+response[i].professeur.nom_Fr+"  <br>    "+response[i].salle.code);
                       console.log(m);
							// $("#L810").text("bonjour");
							//console.log(response[i]);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	console.log("cc");
				  
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
						$('#modalError .modal-body p').modal('show'); 
			        }
			});
	
		});
  				
			
			$("#cll").focus(function(){
				
	  			 var id=$("#cll").val();
	  			//alert(id);
				 $.ajax({
					url : "../Emploi/List?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					complete: function(response,textStatus ,jqXHR){
						console.log(response.length);
						
						for(i=0;i<response.length;i++){
							
							var m="#"+response[i].jour.trim()+"_"+ response[i].heureDebut.trim()+"_"+response[i].heureFin.trim();//$("#"+response[i].jour+"_"+ response[i].heureDebut+"_"+response[i].heureFin).html(<p>"hhhh"+"\t|\t"+"hi"+"      "+"hola"</p>);
							$(m).html(response[i].matiere.code+"<br>"+response[i].professeur.nom_Fr+"  <br>    "+response[i].salle.code);
                         console.log(m);
							
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	console.log("cc");
				  
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
						$('#modalError .modal-body p').modal('show'); 
			        }
			});
	
		});
			
			
			$("#cll").change(function(){
				
	  			 var id=$("#cll").val();
				 $.ajax({
					url : "../Emploi/List?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						console.log(response.length);
						// $("#L810").text("bonjour");
						for(i=0;i<response.length;i++){
							//console.log(response[i].jour+" "+response[i].heureDebut+" "+response[i].heureFin);
							
							var m="#"+response[i].jour.trim()+"_"+ response[i].heureDebut.trim()+"_"+response[i].heureFin.trim();//$("#"+response[i].jour+"_"+ response[i].heureDebut+"_"+response[i].heureFin).html(<p>"hhhh"+"\t|\t"+"hi"+"      "+"hola"</p>);
							$(m).html(response[i].matiere.code+"<br>"+response[i].professeur.nom_Fr+"  <br>    "+response[i].salle.code);
                        console.log(m);
							// $("#L810").text("bonjour");
							//console.log(response[i]);
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	console.log("cc");
				  
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
						$('#modalError .modal-body p').modal('show'); 
			        }
			});
	
		});
			//=============================================
				
			//========================================================================
			
  			
  			
  			/*********** Suppression d'une Classe ****************
  			/* 1 - Récuperer l' Id du Classe séléctionner sur la DataTable Classes
  			/* 2 - Supprimer via ajax le Classe concerné
  			*****************************************************/
  			
  			$('#data_table_classes').on('click','.classe-delete', function(evt){
				$this = $(this);
				var id= $this.attr('classeId');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
						$.ajax({
							url : "../Classe/Delete?id="+id,
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
								$('#data_table_classes').DataTable().rows().remove().draw();
					  			//Raffrichir le DataTable Classes
								populateClasseDataTable();
					  			    
						    }
						});
				  });
				return false;
			});
  			
  			/*********** Affichage des détails d'une Classe******************
  			/* 1 - Récuperer l' Id de la filière séléctionner sur la DataTable Filiers
  			/* 2 - Charger par ajax la filière concernée
  			/* 3 - Afficher les détails de la filière concernée
  			**************************************************************************/
  			
  			$('#data_table_classes').on('click','.classe-details', function(evt){
				$this = $(this);
				var id= $this.attr('classeId');
				$.ajax({
					url : "../Classe/Details?id="+id,
					type: "GET",
					dataType: 'json',
					//contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						var codeItem ='<li class="list-group-item"><span><strong>Code 		</strong></span><span class="float-right">'+response.code+'</span></li>';
						var cycleItem ='<li class="list-group-item"><span><strong>Cycle 	</strong></span><span class="float-right">'+response.classeGenerique.cycle.code+'</span></li>';
						var filiereItem ='<li class="list-group-item"><span><strong>Filiere	</strong></span><span class="float-right">'+response.classeGenerique.filiere.code+'</span></li>';
						var niveauItem ='<li class="list-group-item"><span><strong>Niveau	</strong></span><span class="float-right">'+response.classeGenerique.niveau.code+'</span></li>';
						var labelItem ='<li class="list-group-item"><span><strong>Label	</strong></span><span class="float-right">'+response.label+'</span></li>';
						
						$("#classe_Details_Modal .list-group").html("");
						$("#classe_Details_Modal .list-group").append(codeItem);
						$("#classe_Details_Modal .list-group").append(cycleItem);
						$("#classe_Details_Modal .list-group").append(filiereItem);
						$("#classe_Details_Modal .list-group").append(niveauItem);
						$("#classe_Details_Modal .list-group").append(labelItem);
						
						$('#classe_Details_Modal').modal('show');
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