package dao.programme;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import Domaine.matiere.Matiere;
import Domaine.programme.*;
import dao.database.Db;
import Domaine.matiere.Module;
public class ChapitreDAO {
	private Connection con;
	public ChapitreDAO() {
		this.con = Db.getInstance().con;
	}
	public void insert(Chapitre Chapitre) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("insert into chapitre (ID, MatiereID, ModuleID,Nom, Description) values (null,?,?,?,?)");
		statement.setInt(1, Chapitre.getMatiere().getId());
		statement.setInt(2, Chapitre.getModule().getId());
		statement.setString(3, Chapitre.getNom());
		statement.setString(4, Chapitre.getDescription());
		statement.execute();
		statement.close();
	}
	public ArrayList<Chapitre> getAll() {
		String sql="select chapitre.ID as chapitreID ,chapitre.Nom as chapitreNom ,chapitre.Description as chapitreDescription\r\n"
				+ ",matiere.code as matierecode, module.Code as moduleCode  from chapitre,module ,matiere where chapitre.MatiereID=matiere.ID and chapitre.ModuleID=module.ID";
		
		try {
			Statement statement = (Statement) con.createStatement();
			ResultSet rs= statement.executeQuery(sql);
			ArrayList<Chapitre> Chapitres = new ArrayList<Chapitre>();
			Chapitre chapitre;
			while(rs.next()) {
				chapitre=new Chapitre();
				chapitre.setId(rs.getInt("chapitreID"));
				chapitre.setNom(rs.getString("chapitreNom"));
				chapitre.setDescription(rs.getString("chapitreDescription"));

				Matiere Matiere= new Matiere();
				Matiere.setCode(rs.getString("matierecode"));
				Module  Module =new Module();
				Module.setCode(rs.getString("moduleCode"));
				chapitre.setMatiere(Matiere);
				chapitre.setModule(Module);
				Chapitres.add(chapitre);	
				
				}
			return Chapitres;
		} catch (Exception e) {
			return null;
		}
	}	
		public void Delete(Chapitre Chapitre) throws SQLException {
			String s="delete from chapitre where ID=?";
				PreparedStatement st=(PreparedStatement) con.prepareStatement(s);
				st.setInt(1, Chapitre.getId());
				st.executeUpdate();						
		}
	
		
		
		public ArrayList<Chapitre> getAllChapitreByModuleMatiere(int matiereId,int moduleId){
			String sql="SELECT\r\n"
					+ "    `chapitre`.`ID` as 'chapitreID',\r\n"
					+ "    `chapitre`.`MatiereID` as 'MatiereID',\r\n"
					+ "    `chapitre`.`ModuleID` as 'ModuleID',\r\n"
					+ "    `chapitre`.`Nom` as 'chapitreNom',\r\n"
					+ "    `chapitre`.`Description` as 'chapitreDescription',\r\n"
					+ "    `module`.`Code` AS 'moduleCode',\r\n"
					+ "    `module`.`Nom_Fr` as 'moduleNom_Fr',\r\n"
					+ "    `module`.`Nom_Ar`   as 'moduleNom_Ar',\r\n"
					+ "    `matiere`.`Code`  as 'matiereCode',\r\n"
					+ "    `matiere`.`Nom_Fr`  as 'matiereNom_Fr',\r\n"
					+ "    `matiere`.`Nom_Ar`  as 'matiereNom_Ar'\r\n"
					+ "FROM\r\n"
					+ "    `chapitre`\r\n"
					+ "INNER JOIN `module` ON `chapitre`.`ModuleID` = `module`.`ID`\r\n"
					+ "INNER JOIN `matiere` ON `chapitre`.`MatiereID` = `matiere`.`ID`\r\n"
					+ "WHERE  `chapitre`.`MatiereID`=? and`chapitre`.`ModuleID`=? ;";
			try {
				
				PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
				statement.setInt(1,matiereId);
				statement.setInt(2, moduleId);
				ResultSet rs= statement.executeQuery();
				ArrayList<Chapitre> Chapitres = new ArrayList<Chapitre>();
				Chapitre chapitre;
				while(rs.next()) {
					chapitre=new Chapitre();
					chapitre.setId(rs.getInt("chapitreID"));
					chapitre.setNom(rs.getString("chapitreNom"));
					chapitre.setDescription(rs.getString("chapitreDescription"));
					
					Matiere Matiere= new Matiere();
					Matiere.setId(rs.getInt("MatiereID"));
					Matiere.setCode(rs.getString("matiereCode"));
					
					Module  Module =new Module();
					Module.setId(rs.getInt("ModuleID"));
					Module.setCode(rs.getString("moduleCode"));
					chapitre.setMatiere(Matiere);
					chapitre.setModule(Module);
					Chapitres.add(chapitre);	
					}
				return Chapitres;
			} catch (Exception e) {
				return null;
			}
		}
		
	}



