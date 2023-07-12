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

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import Model.*;
import Services.*;
import Util.DateUtil;

/**
 * Servlet implementation class UserTiMusServlet
 */
@WebServlet("/UserTiMusServlet")
public class UserTiMusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UserTiMusServlet() {
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

		UserTiMusService server1 = new UserTiMusService();
		TiMusService server2 = new TiMusService();
		
		switch(action)
		{
			case "edit":		
				int Id = Integer.valueOf(request.getParameter("Id"));		
				Integer UserId1 = Integer.valueOf(request.getParameter("UserId"));
				Integer Score1 = Integer.valueOf(request.getParameter("Score"));
				String AddDate1 = request.getParameter("AddDate");


				if(Id>0) {
					UserTiMus model = server1.getById(Id);
					model.setUserId(UserId1);
					model.setScore(Score1);
					model.setAddDate(AddDate1);

					result.set_ok(server1.update(model)==0);
				}else {
					UserTiMus model = new UserTiMus();
					model.setUserId(UserId1);
					model.setScore(Score1);
					model.setAddDate(AddDate1);

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
				UserTiMus obj = server1.getById(Id3);
				
				String jsonString = "";
				jsonString += "{";
				jsonString += "\"Id\":"+ obj.getId();
				jsonString += ",\"UserId\":\"" + obj.getUserId() + "\"";
				jsonString += ",\"Score\":\"" + obj.getScore() + "\"";
				jsonString += ",\"AddDate\":\"" + obj.getAddDate() + "\"";

				jsonString += "}";
				
				result.set_ok(true);
				result.set_data(jsonString);
				break;
			case "getList":
				String name222 = request.getParameter("name");
				List<UserTiMus> list = server1.queryAll();
				if(list !=null && list.size()>0) {
					result.set_ok(true);
					List<String> json= new ArrayList();
					for(int i = 0; i < list.size(); i++) {
						UserTiMus obj2 = list.get(i);
						String jsonString2 = "";

						UsersService us = new UsersService();
						Users tmpUserEntity= us.getById(obj2.getUserId());

						if(name222 != null && name222 != "" && tmpUserEntity.getUserName().indexOf(name222)<0) {
							continue;
						}
						
						
						jsonString2 += "{";
						jsonString2 += "\"Id\":"+ obj2.getId();
						jsonString2 += ",\"UserId\":\"" + obj2.getUserId() + "\"";
						jsonString2 += ",\"UserName\":\"" + tmpUserEntity.getUserName() + "\"";
						jsonString2 += ",\"Score\":\"" + obj2.getScore() + "\"";
						jsonString2 += ",\"AddDate\":\"" + obj2.getAddDate() + "\"";

						jsonString2 += "}";
						
						json.add(jsonString2);
					}
					String data = "["+String.join(",", json)+"]";
					result.set_data(data);
				}
				break;
			case "getUserList":
				int userId = Integer.valueOf(request.getParameter("userId"));
				List<UserTiMus> list2 = server1.queryUserAll(userId);
				if(list2 !=null && list2.size()>0) {
					result.set_ok(true);
					List<String> json2= new ArrayList();
					for(int i = 0; i < list2.size(); i++) {
						UserTiMus obj2 = list2.get(i);
						String jsonString3 = "";

						jsonString3 += "{";
						jsonString3 += "\"Id\":"+ obj2.getId();
						jsonString3 += ",\"UserId\":\"" + obj2.getUserId() + "\"";
						jsonString3 += ",\"Score\":\"" + obj2.getScore() + "\"";
						jsonString3 += ",\"AddDate\":\"" + obj2.getAddDate() + "\"";

						jsonString3 += "}";
						
						json2.add(jsonString3);
					}
					String data = "["+String.join(",", json2)+"]";
					result.set_data(data);
				}
				break;
			case "onlineExam":
				int userId2 = Integer.valueOf(request.getParameter("userId"));
				String exam = request.getParameter("exam");

		        ObjectMapper objectMapper = new ObjectMapper();
		        TypeReference<List<OnlineExamDto>> ref = new TypeReference<List<OnlineExamDto>>(){};
		        List<OnlineExamDto> list4 = objectMapper.readValue(exam, ref);

		        if (list4 == null || list4.size()<=0){
		            result.set_ok(false);
		            result.set_msg("请答题");
		    		response.setContentType("application/json;charset=UTF-8");
		    		response.getWriter().append(result.toString());
		    		return;
		        }

		        Integer score = 0;
		        for (Integer i =0 ; i < list4.size(); i++){
		            TiMus tmEntity = server2.getById(list4.get(i).getTimuId());
		            if(tmEntity == null || tmEntity.getId()<=0){
			            result.set_ok(false);
			            result.set_msg("题目不存在");
			    		response.setContentType("application/json;charset=UTF-8");
			    		response.getWriter().append(result.toString());
			    		return;
		            }

		            if (tmEntity.getIsRight() == null || tmEntity.getIsRight() == ""){
			            result.set_ok(false);
			            result.set_msg("题目未设置答案");
			    		response.setContentType("application/json;charset=UTF-8");
			    		response.getWriter().append(result.toString());
			    		return;
		            }

                    if(list4.get(i).getDaan().equals(tmEntity.getIsRight())){
		                score += tmEntity.getScore();
		            }

		        }

		        UserTiMus entityUser = new UserTiMus();
		        entityUser.setUserId(userId2);
		        entityUser.setScore(score);
		        entityUser.setAddDate(formatYmdHms(new Date()));
		        Integer resultId = server1.insert(entityUser);
		        result.set_ok(resultId == 0);
		        if(!result.is_ok()){
		            result.set_msg("请重试1");
		    		response.setContentType("application/json;charset=UTF-8");
		    		response.getWriter().append(result.toString());
		    		return;
		        }

		        if(!result.is_ok()){
		            result.set_ok(false);
		            result.set_msg("操作失败");
		    		response.setContentType("application/json;charset=UTF-8");
		    		response.getWriter().append(result.toString());
		    		return;
		        }
		        result.set_ok(true);
		        result.set_msg("操作成功");        
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

    public String formatYmdHms(Date date) {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
    }
}
