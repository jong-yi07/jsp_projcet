package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import admin.dao.adminDAO;
import menu.dto.menuOrderDTO;


@WebServlet("/admin_servlet/*")
public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		adminDAO dao=new adminDAO();
		if(uri.indexOf("login.do")!=-1){
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			
			String name=dao.login(userid,passwd);
			PrintWriter out=response.getWriter();
			if(name==null) { //로그인 실패
				String result="아이디 또는 비밀번호가 일치하지 않습니다.";
				request.setAttribute("result", result);
				System.out.println("로그인 실패:"+result);
				out.write(0+"");
			}else {// 로그인 성공
				System.out.println("로그인 성공:"+name);
				HttpSession session=request.getSession();
				session.setAttribute("userid", userid);
				session.setAttribute("name", name);
				out.write(1+"");
			}
		}else if(uri.indexOf("chart.do")!=-1) {
			List<menuOrderDTO> items=dao.chart();
			
			//리턴할 최종 json 객체
			JSONObject data=new JSONObject();
			//컬럼을 정의할 json 객체
			JSONObject col1=new JSONObject();
			JSONObject col2=new JSONObject();
			JSONArray title=new JSONArray();
			//json의 cols 객체구성(헤더,제목구성)
			col1.put("label", "상품명");
			col1.put("type", "string");
			col2.put("label", "구매횟수");
			col2.put("type", "number");
			//json배열에 json 객체 추가
			title.add(col1);
			title.add(col2);
			data.put("cols", title);
			//json의 rows 객체구성(바디,내용구성)
			JSONArray body=new JSONArray();
			for(menuOrderDTO dto : items) {
				JSONObject name=new JSONObject();//JSONObject는 HashMap과 같음
				name.put("v", dto.getName());
				JSONObject money=new JSONObject();
				money.put("v", dto.getPurchases());
				JSONArray row=new JSONArray();
				row.add(name);
				row.add(money);
				JSONObject cell=new JSONObject();
				cell.put("c", row);
				body.add(cell);
			}
			data.put("rows", body);
			//request.setAttribute("data", data);
			//response.getWriter().print(data);

			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(data.toString());

			
			//System.out.println(data);
			
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
