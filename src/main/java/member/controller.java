package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.memberDAO;


@WebServlet("/member_servlet/*")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String contextPath=request.getContextPath();
		memberDAO dao=new memberDAO();
		
		if(uri.indexOf("id_check.do")!=-1) { //아이디 중복체크
			String userid=request.getParameter("userid");
			System.out.println(userid);
//			String passwd=request.getParameter("passwd");
//			String name=request.getParameter("name");
//			String email=request.getParameter("email");
//			String tel=request.getParameter(name);
			
			PrintWriter out=response.getWriter();
			int idcheck=dao.idcheck(userid);
			if(idcheck==0) {
				System.out.println("이미 존재하는 아이디입니다.");
			}else if(idcheck==1){
				System.out.println("사용가능한 아이디입니다.");
			}	
			out.write(idcheck+"");
		}else if(uri.indexOf("name_check.do")!=-1) {
			String name=request.getParameter("name");
			System.out.println(name);
			
			PrintWriter out=response.getWriter();
			int namecheck=dao.namecheck(name);
			if(namecheck==0) {
				System.out.println("이미 존재하는 아이디입니다.");
			}else if(namecheck==1){
				System.out.println("사용가능한 아이디입니다.");
			}	
			out.write(namecheck+"");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
