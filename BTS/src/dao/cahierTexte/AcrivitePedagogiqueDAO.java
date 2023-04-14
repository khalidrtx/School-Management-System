package dao.cahierTexte;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Domaine.cahierTexte.AcrivitePedagogique;
import Domaine.cahierTexte.CahierTexte;
import Domaine.classe.Filiere;
import dao.database.Db;

public class AcrivitePedagogiqueDAO {
	
	private Connection con;
	public AcrivitePedagogiqueDAO() {
		this.con = Db.getInstance().con;
	}
	
	public void AddCahierTexte(AcrivitePedagogique AcrivitePedagogique) throws SQLException {
		String sql="insert into AcrivitePedagogique values(null,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, AcrivitePedagogique.getCode());
		st.setString(2, AcrivitePedagogique.getNom_Fr());
		st.setString(3, AcrivitePedagogique.getNom_Ar());		
		st.executeUpdate();
	}
	public void insert(AcrivitePedagogique AcrivitePedagogique,CahierTexte CahierTexte) throws SQLException {
		String sql="insert into cahiertexte_acrivitepedagogique values(?,?)";
		PreparedStatement st = con.prepareStatement(sql);
//		st.setInt(1, AcrivitePedagogique);

		st.setInt(1, CahierTexte.getId());
		st.setInt(2, AcrivitePedagogique.getId());
		st.executeUpdate();
	}
	
	
	public ArrayList<AcrivitePedagogique> getAll(){
		ArrayList<AcrivitePedagogique> tab = new ArrayList<AcrivitePedagogique>();
		try {
			String sql="select id , code,Nom_Fr,Nom_Ar from acrivitepedagogique";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			AcrivitePedagogique a = null;
			while(rs.next()) {
				a=new  AcrivitePedagogique();
				a.setId(rs.getInt("id"));
				a.setCode(rs.getString("code"));
				a.setNom_Fr(rs.getString("Nom_Fr"));
				a.setNom_Ar(rs.getString("Nom_Ar"));
				tab.add(a);
			}
			return tab;
		} catch (Exception e) {
			return null;
		}
	}
	public AcrivitePedagogique getById(int id) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("SELECT ID ,Code,Nom_Fr,Nom_Ar FROM acrivitepedagogique where ID=? ");
		statement.setInt(1, id);
		ResultSet rs = statement.executeQuery();
		AcrivitePedagogique AcrivitePedagogique = new AcrivitePedagogique();
		while (rs.next()) {
			AcrivitePedagogique.setId(rs.getInt("ID"));
			AcrivitePedagogique.setCode(rs.getString("Code"));
			AcrivitePedagogique.setNom_Fr(rs.getString("Nom_Fr"));
			AcrivitePedagogique.setNom_Ar(rs.getString("Nom_Ar"));
		}
		rs.close();
		statement.close();
		return AcrivitePedagogique;		
	}

	public void update(AcrivitePedagogique acrivitePedagogique, CahierTexte cahierTexte) throws SQLException {
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("update cahiertexte_acrivitepedagogique set  AcrivitePedagogiqueID = ? where CahierTexteID  = ?");
		statement.setInt(1, acrivitePedagogique.getId());
		statement.setInt(2, cahierTexte.getId());
		statement.executeUpdate();
		statement.close();
	}
	
	

}
