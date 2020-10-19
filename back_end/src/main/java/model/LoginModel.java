package model;

public class LoginModel {
    
    private int numMatricula;
    private String senha;
    private String permissao;
    private String nome;
    private int codDepto;
    private String nomeDepto;

    
    public int getNumMatricula() {
        return numMatricula;
    }

    public void setNumMatricula(int aNumMatricula) {
        numMatricula = aNumMatricula;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String aSenha) {
        senha = aSenha;
    }

    public String getPermissao() {
        return permissao;
    }

    public void setPermissao(String aPermissao) {
        permissao = aPermissao;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String aNome) {
        nome = aNome;
    }

    public int getCodDepto() {
        return codDepto;
    }

    public void setCodDepto(int aCodDepto) {
        codDepto = aCodDepto;
    }

    public String getNomeDepto() {
        return nomeDepto;
    }

    public void setNomeDepto(String aNomeDepto) {
        nomeDepto = aNomeDepto;
    }    
}
