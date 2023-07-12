package servlet;

import java.io.IOException;
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
 * Servlet implementation class CoursesServlet
 */
@WebServlet("/CoursesServlet")
public class CoursesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public CoursesServlet() {
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

		CoursesService server1 = new CoursesService();
		
		switch(action)
		{
			case "edit":		
				int Id = Integer.valueOf(request.getParameter("Id"));		
				String Name1 = request.getParameter("Name");
				String FilePath1 = request.getParameter("FilePath");
				String TimeLength1 = request.getParameter("TimeLength");
				String Remark1 = request.getParameter("Remark");


				if(Id>0) {
					Courses model = server1.getById(Id);
					model.setName(Name1);
					model.setFilePath(FilePath1);
					model.setTimeLength(TimeLength1);
					model.setRemark(Remark1);

					result.set_ok(server1.update(model)==0);
				}else {
					Courses model = new Courses();
					model.setName(Name1);
					model.setFilePath(FilePath1);
					model.setTimeLength(TimeLength1);
					model.setRemark(Remark1);

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
				Courses obj = server1.getById(Id3);
				
				String jsonString = "";
				jsonString += "{";
				jsonString += "\"Id\":"+ obj.getId();
				jsonString += ",\"Name\":\"" + obj.getName() + "\"";
				jsonString += ",\"FilePath\":\"" + obj.getFilePath() + "\"";
				jsonString += ",\"TimeLength\":\"" + obj.getTimeLength() + "\"";
				jsonString += ",\"Remark\":\"" + obj.getRemark() + "\"";

				jsonString += "}";
				
				result.set_ok(true);
				result.set_data(jsonString);
				break;
			case "getList":
				String key11 = request.getParameter("key");
				List<Courses> list = server1.queryAll();
				if(list !=null && list.size()>0) {
					result.set_ok(true);
					List<String> json= new ArrayList();
					for(int i = 0; i < list.size(); i++) {
						Courses obj2 = list.get(i);
						String jsonString2 = "";

						if(key11!= null && key11 != "" && obj2.getName().indexOf(key11) < 0) {
							continue;
						}
						
						jsonString2 += "{";
						jsonString2 += "\"Id\":"+ obj2.getId();
						jsonString2 += ",\"Name\":\"" + obj2.getName() + "\"";
						jsonString2 += ",\"FilePath\":\"" + obj2.getFilePath() + "\"";
						jsonString2 += ",\"TimeLength\":\"" + obj2.getTimeLength() + "\"";
						jsonString2 += ",\"Remark\":\"" + obj2.getRemark() + "\"";

						jsonString2 += "}";
						
						json.add(jsonString2);
					}
					String data = "["+String.join(",", json)+"]";
					result.set_data(data);
				}
				break;
			case "getUserList":
				int userId = Integer.valueOf(request.getParameter("userId"));
				List<Courses> list2 = server1.queryUserAll(userId);
				if(list2 !=null && list2.size()>0) {
					result.set_ok(true);
					List<String> json2= new ArrayList();
					for(int i = 0; i < list2.size(); i++) {
						Courses obj2 = list2.get(i);
						String jsonString3 = "";

						jsonString3 += "{";
						jsonString3 += "\"Id\":"+ obj2.getId();
						jsonString3 += ",\"Name\":\"" + obj2.getName() + "\"";
						jsonString3 += ",\"FilePath\":\"" + obj2.getFilePath() + "\"";
						jsonString3 += ",\"TimeLength\":\"" + obj2.getTimeLength() + "\"";
						jsonString3 += ",\"Remark\":\"" + obj2.getRemark() + "\"";

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

}
