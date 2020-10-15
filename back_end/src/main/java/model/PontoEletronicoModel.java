package model;

public class PontoEletronicoModel {
    private int idPonto;
    private int numMatricula;
    private String dataDia;
    private String horaEntrada;
    private String horaSaida;
    private String horaInicioIntervalo;
    private String horaFimIntervalo;
    private String motivoAjuste;
    private String homeOffice;
    private String qtdHorasTrabalhadas;
    private String totalHrIntervalo;
    private String nomeUsuario;

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }
    
    public int getIdPonto() {
        return idPonto;
    }

    public void setIdPonto(int idPonto) {
        this.idPonto = idPonto;
    }

    public String getTotalHrIntervalo() {
        return totalHrIntervalo;
    }

    public void setTotalHrIntervalo(String totalHrIntervalo) {
        this.totalHrIntervalo = totalHrIntervalo;
    }

    public void setQtdHorasTrabalhadas(String qtdHorasTrabalhadas) {
        this.qtdHorasTrabalhadas = qtdHorasTrabalhadas;
    }

    public String getQtdHorasTrabalhadas() {
        return qtdHorasTrabalhadas;
    }
    

    public int getNumMatricula() {
        return numMatricula;
    }

    public String getDataDia() {
        return dataDia;
    }

    public String getHoraEntrada() {
        return horaEntrada;
    }

    public String getHoraSaida() {
        return horaSaida;
    }

    public String getHoraInicioIntervalo() {
        return horaInicioIntervalo;
    }

    public String getHoraFimIntervalo() {
        return horaFimIntervalo;
    }

    public String getMotivoAjuste() {
        return motivoAjuste;
    }

    public String getHomeOffice() {
        return homeOffice;
    }
    
    public void setNumMatricula(int numMatricula) {
        this.numMatricula = numMatricula;
    }

    public void setDataDia(String dataDia) {
        this.dataDia = dataDia;
    }

    public void setHoraEntrada(String horaEntrada) {
        this.horaEntrada = horaEntrada;
    }

    public void setHoraSaida(String horaSaida) {
        this.horaSaida = horaSaida;
    }

    public void setHoraInicioIntervalo(String horaInicioIntervalo) {
        this.horaInicioIntervalo = horaInicioIntervalo;
    }

    public void setHoraFimIntervalo(String horaFimIntervalo) {
        this.horaFimIntervalo = horaFimIntervalo;
    }

    public void setMotivoAjuste(String motivoAjuste) {
        this.motivoAjuste = motivoAjuste;
    }

    public void setHomeOffice(String homeOffice) {
        this.homeOffice = homeOffice;
    }

    public void numMatricula() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
