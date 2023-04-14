package dao.cahierTexte;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import Domaine.cahierTexte.CahierTexte;
import Domaine.cahierTexte.Inspection;
import Domaine.classe.AnneeScolaire;
import Domaine.classe.Cycle;
import Domaine.emploiDuTemps.Seance;
import Domaine.personnel.Inspecteur;
import Domaine.personnel.Professeur;
import Domaine.personnel.Specialite;
import dao.database.Db;

public class InspectionDAO {
	private Connection con;
	public InspectionDAO() {
		this.con = Db.getInstance().con;
	}
	public ArrayList<Professeur> getAllProfByInsp(int id) throws SQLException{
		
			String sql = "SELECT\r\n"
					+ "    `professeur`.`UtilisateurID`,\r\n"
					+ "    `professeur`.`CycleID`,\r\n"
					+ "    `professeur`.`SpecialiteID`,\r\n"
					+ "    `utilisateur`.`Photo`,\r\n"
					+ "    `utilisateur`.`Nom_Fr`,\r\n"
					+ "    `utilisateur`.`Nom_Ar`,\r\n"
					+ "    `utilisateur`.`Prenom_Fr`,\r\n"
					+ "    `utilisateur`.`Prenom_Ar`,\r\n"
					+ "    `utilisateur`.`Sexe`,\r\n"
					+ "    `utilisateur`.`Titre`,\r\n"
					+ "    `utilisateur`.`Cin`,\r\n"
					+ "    `utilisateur`.`Nationalite`,\r\n"
					+ "    `utilisateur`.`DateNais`,\r\n"
					+ "    `utilisateur`.`LieuNais_Fr`,\r\n"
					+ "    `utilisateur`.`LieuNais_Ar`,\r\n"
					+ "    `utilisateur`.`Adresse_Fr`,\r\n"
					+ "    `utilisateur`.`Adresse_Ar`,\r\n"
					+ "    `utilisateur`.`Email`,\r\n"
					+ "    `utilisateur`.`SituationF`,\r\n"
					+ "    `utilisateur`.`TeleMobile`,\r\n"
					+ "    `utilisateur`.`TeleDomicile`,\r\n"
					+ "    specialite.Code  as 'specialiteCode',\r\n"
					+ "    specialite.Nom_Fr as 'specialiteNom_Fr',\r\n"
					+ "    specialite.Nom_Ar as 'specialiteNom_Ar',\r\n"
					+ "    cycle.Code as 'cycleCode',\r\n"
					+ "    cycle.Nom_Fr as 'cycleNom_Fr',\r\n"
					+ "    cycle.Nom_Ar as 'cycleNom_Ar'\r\n"
					+ "FROM\r\n"
					+ "    `professeur`\r\n"
					+ "INNER join cycle on professeur.CycleID= cycle.ID\r\n"
					+ "INNER JOIN specialite on professeur.SpecialiteID= specialite.ID\r\n"
					+ "INNER JOIN `utilisateur` ON `professeur`.`UtilisateurID` = `utilisateur`.`ID`\r\n"
					+ "INNER JOIN seancegenerique on`professeur`.`UtilisateurID`=seancegenerique.ProfesseurUtilisateurID \r\n"
					+ "INNER JOIN matiere on seancegenerique.MatiereID = matiere.ID\r\n"
					+ "INNER JOIN matiere_inspecteur on matiere.ID= matiere_inspecteur.MatiereID\r\n"
					+ "INNER JOIN inspecteur on inspecteur.UtilisateurID=matiere_inspecteur.InspecteurUtilisateurID\r\n"
					+ "where inspecteur.UtilisateurID=?;";
			PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
			statement.setInt(1, id);
			ArrayList<Professeur> prof=new ArrayList<Professeur>();
			ResultSet rs=statement.executeQuery();
			while(rs.next()) {
				Professeur p = new Professeur(rs.getInt("UtilisateurID"),
						rs.getString("Nom_Fr"),
						rs.getString("Nom_Ar"),
						rs.getString("Prenom_Fr"),
						rs.getString("Prenom_Ar"),
						rs.getString("Sexe"),
						rs.getString("Cin"),
						rs.getString("Nationalite"),
						rs.getDate("DateNais"),
						rs.getString("LieuNais_Fr"),
						rs.getString("LieuNais_Ar"),
						rs.getString("Adresse_Fr"),
						rs.getString("Adresse_Ar"),
						rs.getString("Email"),
						rs.getString("SituationF"),
						rs.getString("Titre"),
						rs.getString("TeleMobile"),
						rs.getString("TeleDomicile"),
						rs.getString("Photo"),
						new Specialite(rs.getInt("SpecialiteID"),rs.getString("specialiteCode"),rs.getString("specialiteNom_Fr"),rs.getString("specialiteNom_Ar")),
						new Cycle(rs.getInt("cycleID"),
						rs.getString("cycleCode"),
						rs.getString("cycleNom_Fr"),
						rs.getString("cycleNom_Ar")) );
				//System.out.println(p);
				prof.add(p);
				
			}
			return prof;
		
	}
	public ArrayList<Inspection> getAllByiId2(int idIns , int idProf) throws SQLException{
		String sql="SELECT\r\n"
				+ "    `inspection`.`ID`,\r\n"
				+ "    `inspection`.`InspecteurUtilisateurID`,\r\n"
				+ "    `inspection`.`CahierTexteID`,\r\n"
				+ "    `inspection`.`Date`,\r\n"
				+ "    `inspection`.`Observation`,\r\n"
				+ "    `inspection`.`Etat`,\r\n"
				+ "    `inspecteur`.`SpecialiteID` as 'inspecteurSpecialiteID',\r\n"
				+ "    `cahiertexte`.`SeanceID`,\r\n"
				+ "    `cahiertexte`.`Texte`,\r\n"
				+ "    `cahiertexte`.`Observation` as 'cahiertexteObservation',\r\n"
				+ "    `cahiertexte`.`Etat` as 'cahiertexteEtat',\r\n"
				+ "    `seance`.`SeanceGeneriqueID`,\r\n"
				+ "    `seance`.`Date` as 'seanceDate',\r\n"
				+ "    `seance`.`Etat` as 'seanceEtat',\r\n"
				+ "    `seance`.`Observation` as 'seanceObservation',\r\n"
				+ "    `seancegenerique`.`ClasseID`,\r\n"
				+ "    `seancegenerique`.`MatiereID`,\r\n"
				+ "    `seancegenerique`.`ModuleID`,\r\n"
				+ "    `seancegenerique`.`ProfesseurUtilisateurID`,\r\n"
				+ "    `seancegenerique`.`SalleID`,\r\n"
				+ "    `seancegenerique`.`PeriodeID`,\r\n"
				+ "    `seancegenerique`.`Jour`,\r\n"
				+ "    `seancegenerique`.`HeureDebut`,\r\n"
				+ "    `seancegenerique`.`HeureFin`,\r\n"
				+ "    `seancegenerique`.`Duree`,\r\n"
				+ "    `seancegenerique`.`Observation` as 'seancegeneriqueObservation',\r\n"
				+ "    `professeur`.`CycleID`,\r\n"
				+ "    `professeur`.`SpecialiteID`\r\n"
				+ "FROM\r\n"
				+ "    `inspection`\r\n"
				+ "INNER JOIN `inspecteur` ON `inspection`.`InspecteurUtilisateurID` = `inspecteur`.`UtilisateurID`\r\n"
				+ "INNER JOIN `cahiertexte` ON `inspection`.`CahierTexteID` = `cahiertexte`.`ID`\r\n"
				+ "INNER JOIN `seance` ON `cahiertexte`.`SeanceID` = `seance`.`ID`\r\n"
				+ "INNER JOIN `seancegenerique` ON `seance`.`SeanceGeneriqueID` = `seancegenerique`.`ID`\r\n"
				+ "INNER JOIN `professeur` ON `seancegenerique`.`ProfesseurUtilisateurID` = `professeur`.`UtilisateurID`\r\n"
				+ "WHERE\r\n"
				+ "    inspecteur.UtilisateurID = ? AND professeur.UtilisateurID = ?;";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
		statement.setInt(1, idIns);
		statement.setInt(2, idProf);
		ArrayList<Inspection> ins=new ArrayList<Inspection>();
		ResultSet rs=statement.executeQuery();
		while(rs.next()) {
			Inspection inspection = new Inspection();
			inspection.setId(rs.getInt("ID"));
			Inspecteur i = new Inspecteur(); 
			i.setId(rs.getInt("InspecteurUtilisateurID"));
			Specialite s = new Specialite();
			s.setId(rs.getInt("inspecteurSpecialiteID"));
			i.setSpecialite(s);
			inspection.setInspecteur(i);
			CahierTexte cahier = new CahierTexte();
			cahier.setId(rs.getInt("CahierTexteID"));
			cahier.setSeance(new Seance(rs.getInt("SeanceID"),rs.getDate("seanceDate"),rs.getString("seanceEtat"),rs.getString("seanceObservation"),null));
			cahier.setTexte(rs.getString("Texte"));
			cahier.setObservation(rs.getString("cahiertexteObservation"));
			cahier.setEtat(rs.getString("cahiertexteEtat"));
			inspection.setCahierTexte(cahier);
			inspection.setDate(rs.getDate("Date"));
			inspection.setObservation(rs.getString("Observation"));
			inspection.setEtat(rs.getString("Etat"));
			
			ins.add(inspection);
		}
		return ins;
	}
	
	
	
	
	public ArrayList<Inspection> getAllByiId(int id) throws SQLException{
		String sql="SELECT\r\n"
				+ "    `inspection`.`ID`,\r\n"
				+ "    `inspection`.`InspecteurUtilisateurID`,\r\n"
				+ "    `inspection`.`CahierTexteID`,\r\n"
				+ "    `inspection`.`Date`,\r\n"
				+ "    `inspection`.`Observation`,\r\n"
				+ "    `inspection`.`Observation`,\r\n"
				+ "    `inspection`.`Etat`\r\n"
				+ "FROM\r\n"
				+ "    `inspection`\r\n"
				+ "INNER JOIN `inspecteur` ON `inspection`.`InspecteurUtilisateurID` = `inspecteur`.`UtilisateurID`\r\n"
				+ "WHERE `inspecteur`.`UtilisateurID`=?;";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
		statement.setInt(1, id);
		ArrayList<Inspection> ins=new ArrayList<Inspection>();
		ResultSet rs=statement.executeQuery();
		while(rs.next()) {
			Inspection inspecteur = new Inspection(rs.getInt("ID"),rs.getDate("Date"),rs.getString("Observation"),rs.getString("Etat"),new Inspecteur(null,null,rs.getInt("InspecteurUtilisateurID"),null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null),new CahierTexte(rs.getInt("CahierTexteID"), null , null , null,null));
			//System.out.println(inspecteur);
			ins.add(inspecteur);
		}
		return ins;
	}
	public Inspection getById(int id) throws SQLException{
		String sql="SELECT\r\n"
				+ "    `inspection`.`ID`,\r\n"
				+ "    `inspection`.`InspecteurUtilisateurID`,\r\n"
				+ "    `inspection`.`CahierTexteID`,\r\n"
				+ "    `inspection`.`Date`,\r\n"
				+ "    `inspection`.`Observation`,\r\n"
				+ "    `inspection`.`Etat`\r\n"
				+ "FROM\r\n"
				+ "    `inspection`\r\n"
				+ "WHERE	`inspection`.`ID` = ? ;";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
		statement.setInt(1, id);
		Inspection ins=new Inspection();
		ResultSet rs=statement.executeQuery();
		if(rs.next()) {
			ins= new Inspection(rs.getInt("ID"),rs.getDate("Date"),rs.getString("Observation"),rs.getString("Etat"),new Inspecteur(null,null,rs.getInt("InspecteurUtilisateurID"),null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null),new CahierTexte(rs.getInt("CahierTexteID"), null , null , null,null));
		}
		return ins;
	}
	
	public void insert(Inspection inspection) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("INSERT INTO `inspection` ( `InspecteurUtilisateurID`, `CahierTexteID`, `Date`, `Observation`, `Etat`) VALUES (?,?,CURRENT_DATE,?,?)");
		statement.setInt(1,inspection.getInspecteur().getId());
		statement.setInt(2,inspection.getCahierTexte().getId());
		statement.setString(3,inspection.getObservation());
		statement.setString(4,inspection.getEtat());
		statement.executeUpdate();
		statement.close();
	}
	public void delete(Inspection inspection) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("DELETE FROM `inspection` where ID = ?");
			statement.setInt(1, inspection.getId());
			statement.execute();
			statement.close();
		}
	public void update (Inspection inspection ) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("update `inspection` set Observation = ? , Date=CURRENT_DATE , Etat = ?  where ID = ?");
		statement.setString(1,inspection.getObservation());
		statement.setString(2,inspection.getEtat());
		statement.setInt(3,inspection.getId());
		statement.execute();
	}
	}

