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
public class Subsidio {
    private double montoP;
    private String motivo;
    private boolean aprobado;

    public Subsidio(double montoP, String motivo) {
        this.montoP = montoP;
        this.motivo = motivo;
        this.aprobado=false;
     
      
    }

    public double getMontoP() {
        return montoP;
    }

    public void setMontoP(double montoP) {
        this.montoP = montoP;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isAprobado() {
        return aprobado;
    }

    public void setAprobado(boolean aprobado) {
        this.aprobado = aprobado;
    }

    
    
}
