/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repaso2;

import PaqueteLectura.GeneradorAleatorio;
import java.io.PrintStream;

/**
 *
 * @author juanm
 */
public class Main_punto2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Estacionamiento estacione=new Estacionamiento("nuevoE", "capital", "8:00", "22:00", 3, 3);
       int i,j,k;
       for(i=0; i<3; i++){   
           for(j=0;j<3;j++){
           Auto autonuevo=new Auto((GeneradorAleatorio.generarString(8)),GeneradorAleatorio.generarString(6) );
           estacione.agregarAuto(autonuevo, i, j);
           }
       }
        for(i=0; i<3; i++){ 
            for(j=0;j<3;j++){
              System.out.println(estacione.getMatriz(i, j));
           } 
        } 
       }
     
    
}
