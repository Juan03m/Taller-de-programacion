/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repaso2;

/**
 *
 * @author juanm
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String  horaCierre;
    private Auto [][] matriz;
    private int pisos;
    private int plazas;
    

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura="8:00";
        this.horaCierre= "21:00";
        this.matriz= new Auto [5][10];
        this.pisos=5;
        this.plazas=10;
        
    }

    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int pisos, int plazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.matriz= new Auto[pisos][plazas];    
        this.pisos= pisos;
        this.plazas= plazas;
    }

    public int getPisos() {
        return pisos;
    }

    public int getPlazas() {
        return plazas;
    }

    public String getMatriz(int i ,int j) {
    String aux;
    aux= matriz[i][j].toString();
    return aux;
           
    }
    
    
    public void agregarAuto( Auto a, int x, int y){
        this.matriz[x][y]=a;
        
    }
    public String encontrarAuto(String patente){
    int i,j,pi,pl;
    String aux = null;
    pi=getPisos();
    pl=getPlazas();
    for (i=0; i<pi; i++){
        for(j=0; j<pl; j++){
            if(!patente.equals(matriz[i][j].getPatente())){
                  aux="el auto esta en el piso" + i +"y plaza"+ j;
            } else {   
                aux="el auto no existe";
            }
    }
    }
    return aux;
      
}
   public int cantidad(int y){
        int cant=0;
        int i;
        for (i=0; i<5; i++){
            if(null!=matriz[i][y]){
                cant++;
            }
        }
           
        
       return cant;
    }
    
    
}
