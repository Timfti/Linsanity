package servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.*;
import Services.*;
import Util.DateUtil;

/**
 * Servlet implementation class AdminsServlet
 */
@WebServlet("/AdminsServlet")
public class AdminsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AdminsServlet() {
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

		AdminsService server1 = new AdminsService();
		
		switch(action)
		{
			case "login":
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				if(password == null || password == "") {
					result.set_ok(false);
					result.set_msg("请输入密码");
				}else {
					password = Md5(password);
					System.out.print(password);
					String resultString = server1.login(username, password);
					if(resultString == "成功") {
						result.set_ok(true);
						Admins aModel= server1.getByName(username);
						result.set_data("{\"id\":\""+aModel.getId()+"\"}");
					}
					result.set_msg(resultString);
				}
				break;
			case "edit":		
				int Id = Integer.valueOf(request.getParameter("Id"));		
				String UserName1 = request.getParameter("UserName");
				String Password1 = request.getParameter("Password");

				Password1 = Md5(Password1);
				if(Id>0) {
					Admins model = server1.getById(Id);
					model.setUserName(UserName1);
					model.setPassword(Password1);

					result.set_ok(server1.update(model)==0);
				}else {
					Admins model = new Admins();
					model.setUserName(UserName1);
					model.setPassword(Password1);

					result.set_ok(server1.insert(model)==0);
				}
				break;
			case "delete":
				int Id2 = Integer.valueOf(request.getParameter("Id"));
				if(Id2>0) {
					result.set_ok(server1.delete(Id2)==0);			
				}
				break;
			case "get":
				int Id3 = Integer.valueOf(request.getParameter("Id"));
				Admins obj = server1.getById(Id3);
				
				String jsonString = "";
				jsonString += "{";
				jsonString += "\"Id\":"+ obj.getId();
				jsonString += ",\"UserName\":\"" + obj.getUserName() + "\"";
				jsonString += ",\"Password\":\"" + obj.getPassword() + "\"";

				jsonString += "}";
				
				result.set_ok(true);
				result.set_data(jsonString);
				break;
			case "getList":
				List<Admins> list = server1.queryAll();
				if(list !=null && list.size()>0) {
					result.set_ok(true);
					List<String> json= new ArrayList();
					for(int i = 0; i < list.size(); i++) {
						Admins obj2 = list.get(i);
						String jsonString2 = "";

						jsonString2 += "{";
						jsonString2 += "\"Id\":"+ obj2.getId();
						jsonString2 += ",\"UserName\":\"" + obj2.getUserName() + "\"";
						jsonString2 += ",\"Password\":\"" + obj2.getPassword() + "\"";

						jsonString2 += "}";
						
						json.add(jsonString2);
					}
					String data = "["+String.join(",", json)+"]";
					result.set_data(data);
				}
				break;
			case "getUserList":
				int userId = Integer.valueOf(request.getParameter("userId"));
				List<Admins> list2 = server1.queryUserAll(userId);
				if(list2 !=null && list2.size()>0) {
					result.set_ok(true);
					List<String> json2= new ArrayList();
					for(int i = 0; i < list2.size(); i++) {
						Admins obj2 = list2.get(i);
						String jsonString3 = "";

						jsonString3 += "{";
						jsonString3 += "\"Id\":"+ obj2.getId();
						jsonString3 += ",\"UserName\":\"" + obj2.getUserName() + "\"";
						jsonString3 += ",\"Password\":\"" + obj2.getPassword() + "\"";

						jsonString3 += "}";
						
						json2.add(jsonString3);
					}
					String data = "["+String.join(",", json2)+"]";
					result.set_data(data);
				}
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
	
	
	private String Md5(String plainText) {
        byte[] secretBytes = null;
        try {
            secretBytes = MessageDigest.getInstance("md5").digest(
                    plainText.getBytes());
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("没有这个md5算法！");
        }
        String md5code = new BigInteger(1, secretBytes).toString(16);
        for (int i = 0; i < 32 - md5code.length(); i++) {
            md5code = "0" + md5code;
        }
        return md5code;
	}

}
