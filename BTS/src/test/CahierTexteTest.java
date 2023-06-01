package test;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

import Domaine.cahierTexte.AcrivitePedagogique;
import Domaine.cahierTexte.CahierTexte;
import Domaine.programme.Concept;

public class CahierTexteTest {
    private CahierTexte cahierTexte;

    @Before
    public void setUp() {
        // Initialisation avant chaque test
        cahierTexte = new CahierTexte();
    }

    @Test
    public void testGetId() {
        // Test de la méthode getId()
        cahierTexte.setId(1);

        assertEquals(1, cahierTexte.getId());
    }

    @Test
    public void testGetTexte() {
        // Test de la méthode getTexte()
        cahierTexte.setTexte("Lorem ipsum");

        assertEquals("Lorem ipsum", cahierTexte.getTexte());
    }

    @Test
    public void testGetObservation() {
        // Test de la méthode getObservation()
        cahierTexte.setObservation("Some observation");

        assertEquals("Some observation", cahierTexte.getObservation());
    }

    @Test
    public void testGetEtat() {
        // Test de la méthode getEtat()
        cahierTexte.setEtat("In progress");

        assertEquals("In progress", cahierTexte.getEtat());
    }

    @Test
    public void testAddActivite() {
        // Test de la méthode addActivite()
        AcrivitePedagogique activite = new AcrivitePedagogique();

        cahierTexte.addActivite(activite);

        assertEquals(1, cahierTexte.getActivites().size());
        assertTrue(cahierTexte.getActivites().contains(activite));
    }

    @Test
    public void testAddConcept() {
        // Test de la méthode addConcept()
        Concept concept = new Concept();

        cahierTexte.addConcept(concept);

        assertEquals(1, cahierTexte.getConcept().size());
        assertTrue(cahierTexte.getConcept().contains(concept));
    }


}
