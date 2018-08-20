package com.firedogs.grandpringles.util;


import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.FileOutputStream;

import javax.swing.ImageIcon;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ResizeImageUtil {
	
	
	//�썝蹂몄씠誘몄�瑜� �겕湲곗뿉 留욊쾶 �떎�떆 �씠誘몄�瑜�
	//留뚮뱾�뼱二쇰뒗 硫붿꽌�뱶
	
	//1踰덉㎏�씤�옄 : �썝蹂몄냼�뒪寃쎈줈
	//2踰덉㎏�씤�옄 : ���옣�맆寃쎈줈
	//3踰덉㎏�씤�옄 : width
	//4踰덉㎏�씤�옄 : height
	public static boolean resize(String source, String target, int targetW, int targetH)  {
		
		Image imgSource = new ImageIcon(source).getImage(); 

        int oldW = imgSource.getWidth(null); 
        int oldH = imgSource.getHeight(null);
        
        int sW = 0;
        int sH = 0;
        int newW = 0;
        int newH = 0;
        int cutW = 0;
        int cutH = 0;
        	
    	newW = targetW; 
        newH = (targetW * oldH) / oldW; 
        
        
        if(targetH>newH) {
        	newW = (targetH * oldW) / oldH;
        	newH = targetH;
        	
        	sW = (newW - targetW)/2;
        }else {
        	sH = (newH - targetH)/2;
        }
        
        cutW = targetW;
        cutH = targetH;
        
       return process(source, target, sW,sH, newW, newH, cutW, cutH);
		
	}
	
	//硫붿꽌�뱶 �삤踰꾨줈�뵫
	//�씤�옄 3媛쒖쭨由�
	public static boolean resize(String source,String target,int size) {
		
		return resize(source,target,size,size);
	}
	
	
	
	private static boolean process(String source, String target,int sW ,int sH,int newW, int newH, int cutW, int cutH) {
		
	 Image imgSource = new ImageIcon(source).getImage(); 
		
		Image imgTarget = imgSource.getScaledInstance(newW, newH, Image.SCALE_SMOOTH); 

        int pixels[] = new int[newW * newH]; 
        
        FileOutputStream fos = null;
        
        try {
        
        PixelGrabber pg = new PixelGrabber(imgTarget, sW, sH, cutW, cutH, pixels, 0, cutW); 
        pg.grabPixels(); 

        for(int i = 0; i< newW * newH ; i++) {
        	
        	int onePixel = pixels[i];
        	
        	int alpha = (onePixel >> 24) & 0xff;
        	
        	if(alpha==0) {
        		pixels[i] = -1;
        	}
        }
        
        BufferedImage bi = new BufferedImage(cutW, cutH, BufferedImage.TYPE_INT_RGB); 
        bi.setRGB(0, 0, cutW, cutH, pixels, 0, cutW); 

        fos = new FileOutputStream(target); 

        JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(fos); 

        JPEGEncodeParam jep = jpeg.getDefaultJPEGEncodeParam(bi); 
        jep.setQuality(1, false); 

        jpeg.encode(bi, jep); 
        return true;
        
        }catch(Exception e) {
        	e.printStackTrace();
        	
        	return false;
        }finally {
        	try {
        		fos.close(); 
			} catch (Exception e2) {
			}
        }
        
	}
	
}
