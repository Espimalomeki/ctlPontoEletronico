/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.File;
import java.io.IOException;
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
    public static void main(String[] args) throws ParseException, IOException {
//        System.getProperty("user.dir");
//        File dir1 = new File (".");
//        System.out.println ("Current dir : " + dir1.getCanonicalPath());;


    String currentDir = System.getProperty("user.dir");
    System.out.println("Current dir using System:" +currentDir);

        
        //TimeUnit.MILLISECONDS.toMinutes(diff);
        
//        
//        long seconds = diff / 1000 % 60;  
//        long minutes = diff / (60 * 1000) % 60; 
//        long hours = diff / (60 * 60 * 1000); 
//        
//        System.out.println(hours+":"+minutes+":"+seconds);
        
    }
    
}
