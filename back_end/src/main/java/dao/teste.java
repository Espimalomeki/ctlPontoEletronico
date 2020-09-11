/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.PontoEletronicoModel;

/**
 *
 * @author filip
 */
public class teste {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
        
        ptEletronico.inserePonto();
    }
    
}
