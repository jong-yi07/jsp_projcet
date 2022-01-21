package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import member.dao.memberDAO;
import member.dto.memberDTO;
import menu.dto.menucommentDTO;


@WebServlet("/member_servlet/*")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		memberDAO dao=new memberDAO();
		
		if(uri.indexOf("id_check.do")!=-1) { //아이디 중복체크
			String userid=request.getParameter("userid");
			System.out.println(userid);
			
			PrintWriter out=response.getWriter();
			int idcheck=dao.idcheck(userid);
			if(idcheck==0) {
				System.out.println("이미 존재하는 아이디입니다.");
			}else if(idcheck==1){
				System.out.println("사용가능한 아이디입니다.");
			}	
			out.write(idcheck+"");
		}else if(uri.indexOf("name_check.do")!=-1) { //닉네임 중복체크
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
		}else if(uri.indexOf("signup.do")!=-1) { //회원가입
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
 		    String email=request.getParameter("email");
			String tel=request.getParameter("tel");
			String birth=request.getParameter("birth");
			
			memberDTO dto=new memberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setTel(tel);
			dto.setBirth_date(birth);
			dao.insert(dto);
		}else if(uri.indexOf("login.do")!=-1) { //로그인
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println(userid+","+passwd);
			
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
		}else if(uri.indexOf("id_find.do")!=-1) { //아이디 찾기
			String email=request.getParameter("email");
			String name=request.getParameter("name");
			
			String userid=dao.id_find(email,name);
			request.setAttribute("userid", userid);
			PrintWriter out=response.getWriter();
			out.write(userid+"");
		}else if(uri.indexOf("passwd_find.do")!=-1) { //비밀번호 찾기
			String email=request.getParameter("email");
			String userid=request.getParameter("userid");
			
			String passwd=dao.passwd_find(email,userid);
			request.setAttribute("passwd", passwd);
			PrintWriter out=response.getWriter();
			out.write(passwd+"");
		}else if(uri.indexOf("myinformation.do")!=-1) { //내 정보보기
			HttpSession session=request.getSession();
			String userid=(String)session.getAttribute("userid");
			System.out.println(userid);
			
			memberDTO dto=new memberDTO();
			dto=dao.myinformation(userid);
			request.setAttribute("dto", dto);
			
			String page="/jsp/myinformation.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do")!=-1) { //회원정보 수정 
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String tel=request.getParameter("tel");
			String email=request.getParameter("email");
			String birth_date=request.getParameter("birth_date");
			
			memberDTO dto=new memberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setTel(tel);
			dto.setBirth_date(birth_date);
			dao.update(dto);
			response.sendRedirect(context+"/jsp/body.jsp");
		}else if(uri.indexOf("delete.do")!=-1) { //회원정보 삭제
			String userid=request.getParameter("userid");
			dao.delete(userid);
			HttpSession session=request.getSession();
			session.invalidate();
			response.sendRedirect(context+"/jsp/body.jsp");
		}else if(uri.indexOf("logout.do")!=-1) { //로그아웃
			//1. 세션 변수에 저장된 값들을 제거하는 동작
			HttpSession session=request.getSession();
			session.invalidate();//세션 초기화
			//2. 페이지를 이동
			response.sendRedirect(request.getContextPath()+"/jsp/login.jsp?");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}