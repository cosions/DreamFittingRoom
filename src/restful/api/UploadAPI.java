package restful.api;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import restful.annotation.Power;
import restful.bean.Result;
import restful.database.EM;
import restful.entity.Clothing;

@Path("/upload")
public class UploadAPI {

	@Context
	HttpServletRequest request;
	
	@POST
	@Path("/uploadImage")
	@Produces("application/json;charset=UTF-8")
	@Power("admin")
	public Result uploadImage(@QueryParam("code") String suitCode) throws UnsupportedEncodingException {
		
		System.out.println("suitCode:"+suitCode);
		// 创建DiskFileItem工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置缓存目录
		String tempPath = request.getServletContext().getRealPath("images")+"\\uploadCache";
		System.out.println("tempPath----:"+tempPath);
		if(!new File(tempPath).isDirectory())
			new File(tempPath).mkdirs();
		factory.setRepository(new File(tempPath));
		// 设置缓冲区大小,文件体积超出缓冲区大小将保持至缓存目录然后再进行后续处理，这里设置为1M bytes
		factory.setSizeThreshold(1024 * 1024); // 设定了1M的缓冲区
		// 创建文件上传解析对象
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 按照UTF-8编码格式读取
		upload.setHeaderEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		// 设置每个文件最大为5M
		upload.setFileSizeMax(5242880);
		// 一共最多能上传10M
		long MAXSIZE = 1024 * 1024 * 10; // 单位是byte，所以这里指定的是10M
		upload.setSizeMax(MAXSIZE);
		// 获取文件保存目录
		try {
			List<FileItem> fileItems = upload.parseRequest(request);// 解析request请求
			// 解析并保存
			for (FileItem fileItem : fileItems) {
				String fileName = fileItem.getName();
				String savePath = request.getServletContext().getRealPath("images")+"\\clothing\\";
				File saveFile = new File(savePath+fileName);
				//saveFile.createNewFile();
				System.out.println(saveFile);
				System.out.println("fileName="+fileName);
				fileItem.write(saveFile);
				//获取当前工作目录
//				String workPath = System.getProperty("user.dir");
//				System.out.println("workPath:----"+workPath);
				fileItem.write(new File("C:\\Users\\xy\\eclipse-workspace\\suit\\WebContent\\images\\clothing\\"+fileName));
				
				List<Clothing> result = EM.getEntityManager()
						.createNamedQuery("cloth.getClothingByCode", Clothing.class)
						.setParameter("code", suitCode)
						.getResultList();
				Clothing c = result.get(0);
				c.setImage(fileName);
				EM.getEntityManager().merge(c);
				EM.getEntityManager().persist(c);
				EM.getEntityManager().getTransaction().commit();			
				return new Result(0, fileName, null, "");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(-1, "服务器文件解析错误", null, "");
		}
		return new Result(-1, "未发现可供服务保存的数据", null, "");
	}
}
