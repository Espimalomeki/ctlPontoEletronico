
package model;

public class RegistraProjetoModel {
    
    private String descProjeto;
    private String statusProjeto;
    private String cargaTotalHr;
    private int idProjeto;

    public int getIdProjeto() {
        return idProjeto;
    }

    public void setIdProjeto(int idProjeto) {
        this.idProjeto = idProjeto;
    }
    
    public String getDescProjeto() {
        return descProjeto;
    }

    public void setDescProjeto(String descProjeto) {
        this.descProjeto = descProjeto;
    }

    public String getStatusProjeto() {
        return statusProjeto;
    }

    public void setStatusProjeto(String statusProjeto) {
        this.statusProjeto = statusProjeto;
    }

    public String getCargaTotalHr() {
        return cargaTotalHr;
    }

    public void setCargaTotalHr(String cargaTotalHr) {
        this.cargaTotalHr = cargaTotalHr;
    }

   
    
}
