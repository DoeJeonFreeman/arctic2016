package kr.go.seaice.common.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import kr.go.seaice.common.WebContants;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/file")
public class DownloadController {
	
	private String characters2block[] = {"..", "../", "..\\"};
	
	/**
	 * aovoid dir traversal haha
	 * @param filePath
	 * 
	 */
	private boolean isDirectoryTraversalAttack(String filePath){
		boolean goFxxkUrself = false;
		for(int i=0; i<characters2block.length;i++) {
			if( filePath.indexOf(characters2block[i]) != -1 ){
				goFxxkUrself = true;
//				System.out.println("[ !! ] "+blockCharacters[i] + " detected!!");
				break;
			}
		}
		String meAllowPath = filePath.substring(0, filePath.lastIndexOf("/")+1);
		if( !meAllowPath.equals(WebContants.UPLOAD_PATH)){
//			System.out.println("[ ! ] "+meAllowPath);
			goFxxkUrself = true;
		}
		return goFxxkUrself;
	}
	
    @RequestMapping(value="/download",method=RequestMethod.POST)
//    @RequestMapping(value="/download",method={RequestMethod.GET,RequestMethod.POST})
    public void download(String filename, String pseudoname, 
            HttpServletRequest req, 
            HttpServletResponse resp) {
            
        OutputStream outputStream = null;
        
        try {
        	
        	if(isDirectoryTraversalAttack(WebContants.UPLOAD_PATH + pseudoname)){
        		return;
    		}
//          File file = new File(WebContants.UPLOAD_PATH + filename);
            File file = new File(WebContants.UPLOAD_PATH + pseudoname);
            String filetype = filename.substring(filename.indexOf(".") + 1, filename.length());
    
            if (filetype.trim().equalsIgnoreCase("txt")) {
                resp.setContentType("text/plain");
            } else {
                resp.setContentType("application/octet-stream");
            }
    
            resp.setContentLength((int) file.length());
    
            boolean ie = req.getHeader("User-Agent").indexOf("MSIE") != -1;
            if (ie) {
                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " ");
            } else {
            	filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1"); //itWorksOnWIN7!!
//              filename = new String(filename.getBytes("UTF-8"), "8859_1"); //itWorksOnWIN7
        	    resp.setHeader("Content-Type", "application/octet-stream");
                resp.setHeader("Content-Transfer-Encoding", "binary;");
                resp.setHeader("Pragma", "no-cache;");
                resp.setHeader("Expires", "-1;");
            }
    
            resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
    
            outputStream = resp.getOutputStream();
            FileInputStream fis = null;
            
            try {
                fis = new FileInputStream(file);
                FileCopyUtils.copy(fis, outputStream);
            } finally {
                if (fis!= null) {
                    fis.close();
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try {
            	if(outputStream !=null){
            		outputStream.close();
            	}
                resp.flushBuffer();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
    
/*    @RequestMapping(value="/download",method=RequestMethod.POST)
    public void download(String filename, String pseudoname, 
            HttpServletRequest req, 
            HttpServletResponse resp) {
            
        OutputStream outputStream = null;
        
        try {
//            File file = new File(WebContants.UPLOAD_PATH + filename);
            File file = new File(WebContants.UPLOAD_PATH + pseudoname);
            String filetype = filename.substring(filename.indexOf(".") + 1, filename.length());
    
            if (filetype.trim().equalsIgnoreCase("txt")) {
                resp.setContentType("text/plain");
            } else {
                resp.setContentType("application/octet-stream");
            }
    
            resp.setContentLength((int)file.length());
            resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
    
            boolean ie = req.getHeader("User-Agent").indexOf("MSIE") != -1;
            
            if (ie) {
            	filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " ");
//                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
                resp.setHeader("Content-Disposition", "attachment; filename=" + filename + ";");
            } else {
                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
            }
    
                resp.setHeader("Content-Type", "application/octet-stream");
//            resp.setContentLength((int) file.getSize());
                resp.setHeader("Content-Transfer-Encoding", "binary;");
                resp.setHeader("Pragma", "no-cache;");
                resp.setHeader("Expires", "-1;");
            
    
            outputStream = resp.getOutputStream();
            FileInputStream fis = null;
            
            try {
                fis = new FileInputStream(file);
                FileCopyUtils.copy(fis, outputStream);
            } finally {
                if (fis!= null) {
                    fis.close();
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                outputStream.close();
                resp.flushBuffer();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }*/
    
    
    

}