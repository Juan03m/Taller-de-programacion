/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

/**
 *
 * @author juanm
 */
public class Investigador {
    private String nombreComp;
    private int categoria;
    private String especialidad;
    private Subsidio[]subsidios;
    private int dimL;

    public Investigador(String nombreComp, int categoria, String especialidad) {
        this.nombreComp = nombreComp;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidios=new Subsidio[5];
        this.dimL=0;   
     
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        this.subsidios[dimL]= unSubsidio;
        dimL++;
    }
    public double getMOnto(){
        int i;
        double monto = 0;
        for (i=0; i<dimL; i++){
            if(subsidios[i].isAprobado()){
               monto=subsidios[i].getMontoP(); 
               
            }
        }
        return monto;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    
    public String getNombreComp() {
        return nombreComp;
    }

    public void setNombreComp(String nombreComp) {
        this.nombreComp = nombreComp;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
         
}
