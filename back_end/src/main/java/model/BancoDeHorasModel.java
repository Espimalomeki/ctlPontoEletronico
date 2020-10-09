package model;

public class BancoDeHorasModel {
    private int numMatricula;
    private String dataInicial;
    private String dataFinal;

    public int getNumMatricula() {
        return numMatricula;
    }

    public String getDataInicial() {
        return dataInicial;
    }

    public String getDataFinal() {
        return dataFinal;
    }

    public void setNumMatricula(int numMatricula) {
        this.numMatricula = numMatricula;
    }

    public void setDataInicial(String dataInicial) {
        this.dataInicial = dataInicial;
    }

    public void setDataFinal(String dataFinal) {
        this.dataFinal = dataFinal;
    }
       
    
}
