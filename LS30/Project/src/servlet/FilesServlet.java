package servlet;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.*;
import Services.*;
import Util.DateUtil;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 * Servlet implementation class FilesServlet
 */
@WebServlet("/FilesServlet")
public class FilesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletContext sc;
    private String uploadDir = "downloads";

    /**
     * Default constructor. 
     */
    public FilesServlet() {
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		
		ResultEntity result = new ResultEntity();

		BannersService server1 = new BannersService();
		
		switch(action)
		{
			case "uploadFile":	
				String path1 = "";
				sc = getServletContext();
				DiskFileItemFactory factory = new DiskFileItemFactory();
		        ServletFileUpload upload = new ServletFileUpload(factory);
	
		        try {
		            List items = upload.parseRequest(request);
		            Iterator itr = items.iterator();
		            while (itr.hasNext()) {
		                FileItem item = (FileItem) itr.next();
		                if (item.isFormField()) {
		                    System.out.println("表单参数名：" + item.getFieldName() + ",表单参数值：" + item.getString("UTF-8"));
		                } else {
		                    if (item.getName() != null && !item.getName().equals("")) {
		                    	
	
		        				Date currentTime = new Date();
		        				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		        				String s81 = formatter.format(currentTime);
		                    	
		                        System.out.println("上传文件的大小：" + item.getSize());
		                        System.out.println("文件的类型：" + item.getContentType());
		                        System.out.println("上传文件的名称：" + item.getName());// 返回上传文件在客户端的完整路径名称
	
		                        path1 = "upload/"+ s81 +"."+ item.getName().split("\\.")[1];
		                        String path2 = request.getServletContext().getRealPath(path1);
		                        System.out.print(path2);
		                        File file = new File(path2);
		                        item.write(file);
		                    } else {
		                        response.getWriter().println("没有选择文件");
		                    }
		                }
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		            response.getWriter().println("上传文件失败");
		        }
		        
				result.set_ok(true);
				result.set_msg(path1);
				break;
			default:
				break;
		}
		
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().append(result.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
