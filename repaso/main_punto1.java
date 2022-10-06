/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author juanm
 */
public class main_punto1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Proyectos nuevoProyecto=new Proyectos("hola", 21312, "juan");
       Subsidio nuevoSub=new Subsidio(GeneradorAleatorio.generarDouble(5000), "pinto");
       Subsidio nuevoSub2=new Subsidio(GeneradorAleatorio.generarDouble(5000), "no se");
       Investigador inves1=new Investigador("pedro", 3, "biologo");
       Investigador inves2=new Investigador("ramiro", 2, "quimico");
       Investigador inves3=new Investigador("cami", 1, "fisico");
       nuevoProyecto.AgregarInvestigador(inves1);
       nuevoProyecto.AgregarInvestigador(inves2);
       nuevoProyecto.AgregarInvestigador(inves3);
       inves1.agregarSubsidio(nuevoSub);
    }
    
}
