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
 * Servlet implementation class CourseChaptersServlet
 */
@WebServlet("/CourseChaptersServlet")
public class CourseChaptersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public CourseChaptersServlet() {
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

		CourseChaptersService server1 = new CourseChaptersService();
		
		switch(action)
		{
			case "edit":		
				int Id = Integer.valueOf(request.getParameter("Id"));		
				Integer CourseId1 = Integer.valueOf(request.getParameter("CourseId"));
				String Name1 = request.getParameter("Name");
				String Remark1 = request.getParameter("Remark");


				if(Id>0) {
					CourseChapters model = server1.getById(Id);
					model.setCourseId(CourseId1);
					model.setName(Name1);
					model.setRemark(Remark1);

					result.set_ok(server1.update(model)==0);
				}else {
					CourseChapters model = new CourseChapters();
					model.setCourseId(CourseId1);
					model.setName(Name1);
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
				CourseChapters obj = server1.getById(Id3);
				
				String jsonString = "";
				jsonString += "{";
				jsonString += "\"Id\":"+ obj.getId();
				jsonString += ",\"CourseId\":\"" + obj.getCourseId() + "\"";
				jsonString += ",\"Name\":\"" + obj.getName() + "\"";
				jsonString += ",\"Remark\":\"" + obj.getRemark() + "\"";

				jsonString += "}";
				
				result.set_ok(true);
				result.set_data(jsonString);
				break;
			case "getList":
				String Id4 = request.getParameter("cId");
				List<CourseChapters> list = server1.queryAll();
				if(list !=null && list.size()>0) {
					result.set_ok(true);
					List<String> json= new ArrayList();
					for(int i = 0; i < list.size(); i++) {
						CourseChapters obj2 = list.get(i);
						String jsonString2 = "";

						if(Id4 != null && Id4 != "" && obj2.getCourseId() != Integer.valueOf(Id4)) {
							continue;
						}
						
						jsonString2 += "{";
						jsonString2 += "\"Id\":"+ obj2.getId();
						jsonString2 += ",\"CourseId\":\"" + obj2.getCourseId() + "\"";
						jsonString2 += ",\"Name\":\"" + obj2.getName() + "\"";
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
				List<CourseChapters> list2 = server1.queryUserAll(userId);
				if(list2 !=null && list2.size()>0) {
					result.set_ok(true);
					List<String> json2= new ArrayList();
					for(int i = 0; i < list2.size(); i++) {
						CourseChapters obj2 = list2.get(i);
						String jsonString3 = "";

						jsonString3 += "{";
						jsonString3 += "\"Id\":"+ obj2.getId();
						jsonString3 += ",\"CourseId\":\"" + obj2.getCourseId() + "\"";
						jsonString3 += ",\"Name\":\"" + obj2.getName() + "\"";
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
