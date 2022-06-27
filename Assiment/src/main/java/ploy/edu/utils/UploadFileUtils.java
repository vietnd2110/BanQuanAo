package ploy.edu.utils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

public class UploadFileUtils {

	public static String UploadFile(String filename, 
			HttpServletRequest request,
			String storeFoder) throws IOException, ServletException  {	
		
		String storeFd = request.getServletContext().getRealPath(storeFoder);
				
		if(!Files.exists(Path.of(storeFd))) {
			Files.createDirectory(Path.of(storeFd));
		}
		
		Part imagePart = request.getPart(filename);
		
		String imageFileName = Path.of(imagePart.getSubmittedFileName()).getFileName().toString();
		
		imagePart.write(storeFd + "/" + imageFileName);
		
		return imageFileName;
		
	}
	
}
