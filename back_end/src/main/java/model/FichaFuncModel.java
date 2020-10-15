package model;

public class FichaFuncModel {
    
    private String nome; 
    private String nomeDepto;
    private String cargo;
    private String qtdHoras;
    private String descProjeto;
    private int numMatricula;
    private int idProjeto;
    private int horasProjeto;

    public int getHorasProjeto() {
        return horasProjeto;
    }

    public void setHorasProjeto(int horasProjeto) {
        this.horasProjeto = horasProjeto;
    }
    

    public String getDescProjeto() {
        return descProjeto;
    }

    public void setDescProjeto(String descProjeto) {
        this.descProjeto = descProjeto;
    }

    public String getQtdHoras() {
        return qtdHoras;
    }

    public void setQtdHoras(String qtdHoras) {
        this.qtdHoras = qtdHoras;
    }

    public int getIdProjeto() {
        return idProjeto;
    }

    public void setIdProjeto(int idProjeto) {
        this.idProjeto = idProjeto;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNomeDepto() {
        return nomeDepto;
    }

    public void setNomeDepto(String nomeDepto) {
        this.nomeDepto = nomeDepto;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public int getNumMatricula() {
        return numMatricula;
    }

    public void setNumMatricula(int numMatricula) {
        this.numMatricula = numMatricula;
    }   
}