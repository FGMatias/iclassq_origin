package pe.gob.ep.iclassq.util;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Util {

	public static String replaceCaracterRaro(String cadena,String caracterRaro,String valorRemplazo) {
		String replacement = Matcher.quoteReplacement(valorRemplazo);
		String searchString = Pattern.quote(caracterRaro);
		cadena = cadena.replaceAll(searchString, replacement);
		return cadena;
	}
	
	public static boolean equiv(Object e1, Object e2) {

		if(e1==null && e2==null){
			return true;
		}
		
		if (e1 != null) {
			e1 = e1.toString();
		}

		if (e2 != null) {
			e2 = e2.toString();
		}

		if(e1!=null){
			if (e1.equals(e2)) {
				return true;
			}
		}
		return false;

	}
	
	public static String listFilesForFolder(File folder) {
		String temp="";
		File f=null;
		Integer posIni=0;
		String pre="";
	    for (File fileEntry : folder.listFiles()) {
	      if (fileEntry.isDirectory()) {
	    	  f=new File(fileEntry.getAbsoluteFile()+"/");
	    	  temp+=listFilesForFolder(f);
	      } else {
	        if (fileEntry.isFile()) {
	        	posIni=folder.getAbsolutePath().indexOf("librerias");
	        	pre=folder.getAbsolutePath().substring(posIni);
	        	pre=Util.replaceCaracterRaro(pre, "\\", "/");
	        	temp += "<script src=\""+pre+"/"+fileEntry.getName()+"\"></script>\n";
	        }

	      }
	    }
	    return temp;
	  }
	
	public static String randomString(char[] characterSet, int length) {
	    Random random = new SecureRandom();
	    char[] result = new char[length];
	    for (int i = 0; i < result.length; i++) {
	        // picks a random index out of character set > random character
	        int randomCharIndex = random.nextInt(characterSet.length);
	        result[i] = characterSet[randomCharIndex];
	    }
	    return new String(result);
	}
	
	public static String generateAleatorioAlphaNumeric(int longitud){
		char[] CHARSET_AZ_09 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
		return randomString(CHARSET_AZ_09, longitud);
	}
	public static void main(String[] args) {
		FileWriter fichero = null;
        PrintWriter pw = null;
        try
        {
            fichero = new FileWriter("D:/evaluador/prueba.txt");
            pw = new PrintWriter(fichero);

            for (int i = 0; i < 10; i++)
                pw.println("Linea " + i);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           try {
           // Nuevamente aprovechamos el finally para 
           // asegurarnos que se cierra el fichero.
           if (null != fichero)
              fichero.close();
           } catch (Exception e2) {
              e2.printStackTrace();
           }
        }
		
	}
}
