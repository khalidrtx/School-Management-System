package dao.programme;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import Domaine.cahierTexte.AcrivitePedagogique;
import Domaine.cahierTexte.CahierTexte;
import Domaine.matiere.Matiere;
import Domaine.matiere.Module;
import Domaine.programme.Chapitre;
import Domaine.programme.Concept;
import dao.database.Db;

public class ConceptDAO {
	private Connection con;
	public ConceptDAO() {
		this.con = Db.getInstance().con;
	}
	public void insert(Concept Concept) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("insert into Concept (ID, ChapitreID, Nom, Description) values (null, ?, ?, ?)");
		statement.setInt(1, Concept.getId());
		statement.setInt(2, Concept.getChapitre().getId());
		statement.setString(3, Concept.getNom());
		statement.execute();
		statement.close();
	}
	public void insert(Concept Concept,CahierTexte CahierTexte) throws SQLException {
		String sql="insert into cahiertexte_concept values(?,?)";
		PreparedStatement st = (PreparedStatement) con.prepareStatement(sql);
//		st.setInt(1, AcrivitePedagogique);
		st.setInt(1, CahierTexte.getId());
		st.setInt(2, Concept.getId());
		st.executeUpdate();
	}
	
	public ArrayList<Concept> getAllConceptByChapitre(int chapitrId) {
		String sql="SELECT ID,ChapitreID,Nom,Description FROM `concept` WHERE ChapitreID=?";		
		try {
			PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
			statement.setInt(1, chapitrId);
			ResultSet rs= statement.executeQuery();
			ArrayList<Concept> Concepts = new ArrayList<Concept>();
			Concept Concept;
			while(rs.next()) {
				Concept=new Concept();
				Chapitre Chapitre = new Chapitre();
				Concept.setId(rs.getInt("ID"));
				Chapitre.setId(rs.getInt("ChapitreID"));
				Concept.setNom(rs.getString("Nom"));
				Concept.setDescription(rs.getString("Description"));
				Concepts.add(Concept);	
				}
			return Concepts;
		} catch (Exception e) {
			return null;
		}
	}
	
	public void update(Concept concepte, CahierTexte cahierTexte) throws SQLException {
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("update cahiertexte_concept set  ConceptID  = ? where CahierTexteID   = ?");
		statement.setInt(1, concepte.getId());
		statement.setInt(2, cahierTexte.getId());
		statement.executeUpdate();
		
	}	

}
