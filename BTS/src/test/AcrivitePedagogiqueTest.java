package test;

import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

import Domaine.cahierTexte.AcrivitePedagogique;

public class AcrivitePedagogiqueTest {
    private AcrivitePedagogique activite;

    @Before
    public void setUp() {
        // Initialisation avant chaque test
        activite = new AcrivitePedagogique();
    }

    @Test
    public void testGetId() {
        // Test de la méthode getId()
        activite.setId(1);

        assertEquals(1, activite.getId());
    }

    @Test
    public void testGetCode() {
        // Test de la méthode getCode()
        activite.setCode("ABC123");

        assertEquals("ABC123", activite.getCode());
    }

    @Test
    public void testGetNom_Fr() {
        // Test de la méthode getNom_Fr()
        activite.setNom_Fr("Activité en français");

        assertEquals("Activité en français", activite.getNom_Fr());
    }

    @Test
    public void testGetNom_Ar() {
        // Test de la méthode getNom_Ar()
        activite.setNom_Ar("نشاط بالعربية");

        assertEquals("نشاط بالعربية", activite.getNom_Ar());
    }

    // Ajoutez ici d'autres méthodes de test selon vos besoins

}
