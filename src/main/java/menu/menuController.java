package menu;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import menu.dao.menuDAO;
import menu.dto.menuDTO;
import menu.dto.menuviewDTO;
import page.Pager;


@WebServlet("/menu_servlet/*")
public class menuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String contextPath=request.getContextPath();
		menuDAO dao=new menuDAO();
		if(uri.indexOf("list.do")!=-1) {
			System.out.println("list조회중");
			//페이지나누기를 위한 코드
			//레코드 갯수 계산
			int count=dao.count();
			//System.out.println("count:"+count);
			//페이지 나누기를 위한 처리
			int curPage=1;
			//숫자 처리는 null 포인트 익셉션이 잘 나기때문에 if문처리해줌
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			//System.out.println("list.do 호출");
			List<menuDTO> list=dao.list(start,end);
			//System.out.println(list);
			request.setAttribute("list", list);
			//페이지 네비게이션 출력을 위한 정보 전달
			request.setAttribute("page", pager);
			String page="/jsp/list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("view.do")!=-1) { //메뉴 상세페이지로 이동 
			String name=request.getParameter("name");
			List<menuviewDTO> list=dao.view(name);
			request.setAttribute("list", list);
			
			String page="/jsp/view.jsp"; //상세화면
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
