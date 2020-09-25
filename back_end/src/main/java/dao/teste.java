/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import model.PontoEletronicoModel;

/**
 *
 * @author filip
 */
public class teste {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ParseException {
        PontoEletronicoDao ptEletronico = new PontoEletronicoDao();
        ArrayList<PontoEletronicoModel> pontoAtual = ptEletronico.pontoDeHoje();
        System.out.println(pontoAtual);
        
        
        //TimeUnit.MILLISECONDS.toMinutes(diff);
        
//        
//        long seconds = diff / 1000 % 60;  
//        long minutes = diff / (60 * 1000) % 60; 
//        long hours = diff / (60 * 60 * 1000); 
//        
//        System.out.println(hours+":"+minutes+":"+seconds);
        
    }
    
}
