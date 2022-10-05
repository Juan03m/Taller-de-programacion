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
public class Proyectos {
    private String nombre;
    private int codigo;
    private String director;
    private Investigador[]investigadores;
    private int dimL;

    public Proyectos(String nombre, int codigo, String director) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.director = director;
        this.investigadores=new Investigador[50];
        this.dimL=0;
    }
    public void AgregarInvestigador(Investigador unInvestigador){
        this.investigadores[dimL]=unInvestigador;
        dimL++;
    }
    
      public double dineroTotalOtorgado(){
        double montoTotal= 0;
        int i;
        for(i=0; i<dimL; i++){
            montoTotal=this.investigadores[i].getMOnto();
        }
        return montoTotal;    
        }
    
     public void otorgarTodos(String nombre_investigador){
        int i;
        int j;
        int dimen;
        for(i=0; i<dimL; i++){
            if(!this.investigadores[i].getNombreComp().equals(nombre_investigador)) {
                dimen=this.investigadores[i].getDimL();
                for(j=0; j<dimen; j++){
                    
                }
                    }
            } else {
             }
    }
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }
   
    
    
    
    
    
}
