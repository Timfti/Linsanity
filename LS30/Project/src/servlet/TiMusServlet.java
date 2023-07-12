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
 * Servlet implementation class TiMusServlet
 */
@WebServlet("/TiMusServlet")
public class TiMusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public TiMusServlet() {
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

		TiMusService server1 = new TiMusService();
		
		switch(action)
		{
			case "edit":		
				int Id = Integer.valueOf(request.getParameter("Id"));			
				String TypeName1 = request.getParameter("TypeName");
				String UnitName1 = request.getParameter("UnitName");
				String NanYiDu1 = request.getParameter("NanYiDu");
				String Name1 = request.getParameter("Name");
				Integer Score1 = Integer.valueOf(request.getParameter("Score"));
				String A1 = request.getParameter("A");
				String B1 = request.getParameter("B");
				String C1 = request.getParameter("C");
				String D1 = request.getParameter("D");
				String IsRight1 = request.getParameter("IsRight");


				if(Id>0) {
					TiMus model = server1.getById(Id);
					model.setTypeName(TypeName1);
					model.setUnitName(UnitName1);
					model.setNanYiDu(NanYiDu1);
					model.setName(Name1);
					model.setScore(Score1);
					model.setA(A1);
					model.setB(B1);
					model.setC(C1);
					model.setD(D1);
					model.setIsRight(IsRight1);

					result.set_ok(server1.update(model)==0);
				}else {
					TiMus model = new TiMus();
					model.setTypeName(TypeName1);
					model.setUnitName(UnitName1);
					model.setNanYiDu(NanYiDu1);
					model.setName(Name1);
					model.setScore(Score1);
					model.setA(A1);
					model.setB(B1);
					model.setC(C1);
					model.setD(D1);
					model.setIsRight(IsRight1);

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
				TiMus obj = server1.getById(Id3);
				
				if(obj.getTypeName()==null) {
					obj.setTypeName("");
				}
				if(obj.getNanYiDu()==null) {
					obj.setNanYiDu("");
				}
				if(obj.getUnitName()==null) {
					obj.setUnitName("");
				}
				
				obj.setTypeName(obj.getTypeName().replaceAll("\r|\n", ""));
				obj.setUnitName(obj.getUnitName().replaceAll("\r|\n", ""));
				obj.setNanYiDu(obj.getNanYiDu().replaceAll("\r|\n", ""));
				obj.setName(obj.getName().replaceAll("\r|\n", ""));
				obj.setA(obj.getA().replaceAll("\r|\n", ""));
				obj.setB(obj.getB().replaceAll("\r|\n", ""));
				obj.setC(obj.getC().replaceAll("\r|\n", ""));
				obj.setD(obj.getD().replaceAll("\r|\n", ""));
				
				String jsonString = "";
				jsonString += "{";
				jsonString += "\"Id\":"+ obj.getId();
				jsonString += ",\"TypeName\":\"" + obj.getTypeName() + "\"";
				jsonString += ",\"UnitName\":\"" + obj.getUnitName().trim() + "\"";
				jsonString += ",\"NanYiDu\":\"" + obj.getNanYiDu() + "\"";
				jsonString += ",\"Name\":\"" + obj.getName().trim() + "\"";
				jsonString += ",\"Score\":\"" + obj.getScore() + "\"";
				jsonString += ",\"A\":\"" + obj.getA().trim() + "\"";
				jsonString += ",\"B\":\"" + obj.getB().trim() + "\"";
				jsonString += ",\"C\":\"" + obj.getC().trim() + "\"";
				jsonString += ",\"D\":\"" + obj.getD().trim() + "\"";
				jsonString += ",\"IsRight\":\"" + obj.getIsRight().trim() + "\"";

				jsonString += "}";
				
				result.set_ok(true);
				result.set_data(jsonString);
				break;
			case "getUnitList":
				List<TiMus> list222 = server1.getUnitList();
				if(list222 !=null && list222.size()>0) {
					result.set_ok(true);
					List<String> json= new ArrayList();
					for(int i = 0; i < list222.size(); i++) {
						TiMus obj2 = list222.get(i);
						String jsonString2 = "";

						if(obj2.getUnitName() == null) {
							continue;
						}
						jsonString2 += "{";
						jsonString2 += "\"UnitName\":\"" + obj2.getUnitName().trim() + "\"";
						jsonString2 += "}";
						
						json.add(jsonString2);
					}
					String data = "["+String.join(",", json)+"]";
					result.set_data(data);
				}
				break;
			case "getList":
				String userName1 = request.getParameter("name");
				List<TiMus> list = server1.queryAll();
				if(list !=null && list.size()>0) {
					result.set_ok(true);
					List<String> json= new ArrayList();
					for(int i = 0; i < list.size(); i++) {
						TiMus obj2 = list.get(i);
						String jsonString2 = "";

						if(obj2.getTypeName()==null) {
							obj2.setTypeName("");
						}
						if(obj2.getNanYiDu()==null) {
							obj2.setNanYiDu("");
						}
						if(obj2.getUnitName()==null) {
							obj2.setUnitName("");
						}
						if(userName1 != null && userName1 != "" && !obj2.getName().equals(userName1)) {
							continue;
						}
						obj2.setTypeName(obj2.getTypeName().replaceAll("\r|\n", ""));
						obj2.setUnitName(obj2.getUnitName().replaceAll("\r|\n", ""));
						obj2.setNanYiDu(obj2.getNanYiDu().replaceAll("\r|\n", ""));
						obj2.setName(obj2.getName().replaceAll("\r|\n", ""));
						obj2.setA(obj2.getA().replaceAll("\r|\n", ""));
						obj2.setB(obj2.getB().replaceAll("\r|\n", ""));
						obj2.setC(obj2.getC().replaceAll("\r|\n", ""));
						obj2.setD(obj2.getD().replaceAll("\r|\n", ""));
						
						jsonString2 += "{";
						jsonString2 += "\"Id\":"+ obj2.getId();
						jsonString2 += ",\"TypeName\":\"" + obj2.getTypeName() + "\"";
						jsonString2 += ",\"UnitName\":\"" + obj2.getUnitName().trim() + "\"";
						jsonString2 += ",\"NanYiDu\":\"" + obj2.getNanYiDu() + "\"";
						jsonString2 += ",\"Name\":\"" + obj2.getName().trim() + "\"";
						jsonString2 += ",\"Score\":\"" + obj2.getScore() + "\"";
						jsonString2 += ",\"A\":\"" + obj2.getA().trim() + "\"";
						jsonString2 += ",\"B\":\"" + obj2.getB().trim() + "\"";
						jsonString2 += ",\"C\":\"" + obj2.getC().trim() + "\"";
						jsonString2 += ",\"D\":\"" + obj2.getD().trim() + "\"";
						jsonString2 += ",\"IsRight\":\"" + obj2.getIsRight().trim() + "\"";

						jsonString2 += "}";
						
						json.add(jsonString2);
					}
					String data = "["+String.join(",", json)+"]";
					result.set_data(data);
				}
				break;
			case "getSearchList":
				String typeName11 = request.getParameter("typeName");
				String unitName11 = request.getParameter("unitName");
				String nanYiDu11 = request.getParameter("nanYiDu");
				String userName11 = request.getParameter("name");
				List<TiMus> list11 = server1.queryAll();
				if(list11 !=null && list11.size()>0) {
					result.set_ok(true);
					List<String> json= new ArrayList();
					for(int i = 0; i < list11.size(); i++) {
						TiMus obj2 = list11.get(i);
						String jsonString2 = "";

						if(obj2.getTypeName()==null) {
							obj2.setTypeName("");
						}
						if(obj2.getNanYiDu()==null) {
							obj2.setNanYiDu("");
						}
						if(obj2.getUnitName()==null) {
							obj2.setUnitName("");
						}
						if(typeName11 != null && typeName11 != "" && !obj2.getTypeName().equals(typeName11)) {
							continue;
						}
						if(unitName11 != null && unitName11 != "" && !obj2.getUnitName().equals(unitName11)) {
							continue;
						}
						if(nanYiDu11 != null && nanYiDu11 != "" && !obj2.getNanYiDu().equals(nanYiDu11)) {
							continue;
						}
						if(userName11 != null && userName11 != "" && obj2.getName().indexOf(userName11)<0) {
							continue;
						}

						obj2.setTypeName(obj2.getTypeName().replaceAll("\r|\n", ""));
						obj2.setUnitName(obj2.getUnitName().replaceAll("\r|\n", ""));
						obj2.setNanYiDu(obj2.getNanYiDu().replaceAll("\r|\n", ""));
						obj2.setName(obj2.getName().replaceAll("\r|\n", ""));
						obj2.setA(obj2.getA().replaceAll("\r|\n", ""));
						obj2.setB(obj2.getB().replaceAll("\r|\n", ""));
						obj2.setC(obj2.getC().replaceAll("\r|\n", ""));
						obj2.setD(obj2.getD().replaceAll("\r|\n", ""));
						
						jsonString2 += "{";
						jsonString2 += "\"Id\":"+ obj2.getId();
						jsonString2 += ",\"TypeName\":\"" + obj2.getTypeName() + "\"";
						jsonString2 += ",\"UnitName\":\"" + obj2.getUnitName().trim() + "\"";
						jsonString2 += ",\"NanYiDu\":\"" + obj2.getNanYiDu() + "\"";
						jsonString2 += ",\"Name\":\"" + obj2.getName().trim() + "\"";
						jsonString2 += ",\"Score\":\"" + obj2.getScore() + "\"";
						jsonString2 += ",\"A\":\"" + obj2.getA().trim() + "\"";
						jsonString2 += ",\"B\":\"" + obj2.getB().trim() + "\"";
						jsonString2 += ",\"C\":\"" + obj2.getC().trim() + "\"";
						jsonString2 += ",\"D\":\"" + obj2.getD().trim() + "\"";
						jsonString2 += ",\"IsRight\":\"" + obj2.getIsRight().trim() + "\"";

						jsonString2 += "}";
						
						json.add(jsonString2);
					}
					String data = "["+String.join(",", json)+"]";
					result.set_data(data);
				}
				break;
			case "getUserList":
				int userId = Integer.valueOf(request.getParameter("userId"));
				List<TiMus> list2 = server1.queryUserAll(userId);
				if(list2 !=null && list2.size()>0) {
					result.set_ok(true);
					List<String> json2= new ArrayList();
					for(int i = 0; i < list2.size(); i++) {
						TiMus obj2 = list2.get(i);
						String jsonString3 = "";

						if(obj2.getTypeName()==null) {
							obj2.setTypeName("");
						}
						if(obj2.getNanYiDu()==null) {
							obj2.setNanYiDu("");
						}
						if(obj2.getUnitName()==null) {
							obj2.setUnitName("");
						}
						obj2.setTypeName(obj2.getTypeName().replaceAll("\r|\n", ""));
						obj2.setUnitName(obj2.getUnitName().replaceAll("\r|\n", ""));
						obj2.setNanYiDu(obj2.getNanYiDu().replaceAll("\r|\n", ""));
						obj2.setName(obj2.getName().replaceAll("\r|\n", ""));
						obj2.setA(obj2.getA().replaceAll("\r|\n", ""));
						obj2.setB(obj2.getB().replaceAll("\r|\n", ""));
						obj2.setC(obj2.getC().replaceAll("\r|\n", ""));
						obj2.setD(obj2.getD().replaceAll("\r|\n", ""));
						
						jsonString3 += "{";
						jsonString3 += "\"Id\":"+ obj2.getId();
						jsonString3 += ",\"TypeName\":\"" + obj2.getTypeName() + "\"";
						jsonString3 += ",\"UnitName\":\"" + obj2.getUnitName().trim() + "\"";
						jsonString3 += ",\"NanYiDu\":\"" + obj2.getNanYiDu() + "\"";
						jsonString3 += ",\"Name\":\"" + obj2.getName().trim() + "\"";
						jsonString3 += ",\"Score\":\"" + obj2.getScore() + "\"";
						jsonString3 += ",\"A\":\"" + obj2.getA().trim() + "\"";
						jsonString3 += ",\"B\":\"" + obj2.getB().trim() + "\"";
						jsonString3 += ",\"C\":\"" + obj2.getC().trim() + "\"";
						jsonString3 += ",\"D\":\"" + obj2.getD().trim() + "\"";
						jsonString3 += ",\"IsRight\":\"" + obj2.getIsRight().trim() + "\"";

						jsonString3 += "}";
						
						json2.add(jsonString3);
					}
					String data = "["+String.join(",", json2)+"]";
					result.set_data(data);
				}
				break;
			case "getExamList":

				List<TiMus> list33 = server1.queryRandomAll();
				if(list33 !=null && list33.size()>0) {
					result.set_ok(true);
					List<String> json= new ArrayList();
					for(int i = 0; i < list33.size(); i++) {
						TiMus obj2 = list33.get(i);
						String jsonString2 = "";

						if(obj2.getTypeName()==null) {
							obj2.setTypeName("");
						}
						if(obj2.getNanYiDu()==null) {
							obj2.setNanYiDu("");
						}
						if(obj2.getUnitName()==null) {
							obj2.setUnitName("");
						}
						obj2.setTypeName(obj2.getTypeName().replaceAll("\r|\n", ""));
						obj2.setUnitName(obj2.getUnitName().replaceAll("\r|\n", ""));
						obj2.setNanYiDu(obj2.getNanYiDu().replaceAll("\r|\n", ""));
						obj2.setName(obj2.getName().replaceAll("\r|\n", ""));
						obj2.setA(obj2.getA().replaceAll("\r|\n", ""));
						obj2.setB(obj2.getB().replaceAll("\r|\n", ""));
						obj2.setC(obj2.getC().replaceAll("\r|\n", ""));
						obj2.setD(obj2.getD().replaceAll("\r|\n", ""));
						
						jsonString2 += "{";
						jsonString2 += "\"Id\":"+ obj2.getId();
						jsonString2 += ",\"TypeName\":\"" + obj2.getTypeName() + "\"";
						jsonString2 += ",\"UnitName\":\"" + obj2.getUnitName().trim() + "\"";
						jsonString2 += ",\"NanYiDu\":\"" + obj2.getNanYiDu() + "\"";
						jsonString2 += ",\"Name\":\"" + obj2.getName().trim() + "\"";
						jsonString2 += ",\"Score\":\"" + obj2.getScore() + "\"";
						jsonString2 += ",\"A\":\"" + obj2.getA().trim() + "\"";
						jsonString2 += ",\"B\":\"" + obj2.getB().trim() + "\"";
						jsonString2 += ",\"C\":\"" + obj2.getC().trim() + "\"";
						jsonString2 += ",\"D\":\"" + obj2.getD().trim() + "\"";
						jsonString2 += ",\"IsRight\":\"" + obj2.getIsRight().trim() + "\"";

						jsonString2 += "}";
						
						json.add(jsonString2);
					}
					String data = "["+String.join(",", json)+"]";
					result.set_data(data);
				}
				break;
			default:
				break;
		}

		response.setContentType("application/json;charset=UTF-8");
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
