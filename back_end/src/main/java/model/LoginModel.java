package model;

public class LoginModel {
    
    private static int numMatricula;
    private static String senha;
    private static String permissao;

    /**
     * @return the numMatricula
     */
    public static int getNumMatricula() {
        return numMatricula;
    }

    /**
     * @param aNumMatricula the numMatricula to set
     */
    public static void setNumMatricula(int aNumMatricula) {
        numMatricula = aNumMatricula;
    }

    /**
     * @return the senha
     */
    public static String getSenha() {
        return senha;
    }

    /**
     * @param aSenha the senha to set
     */
    public static void setSenha(String aSenha) {
        senha = aSenha;
    }

    /**
     * @return the permissao
     */
    public static String getPermissao() {
        return permissao;
    }

    /**
     * @param aPermissao the permissao to set
     */
    public static void setPermissao(String aPermissao) {
        permissao = aPermissao;
    }

    
    
    
}
