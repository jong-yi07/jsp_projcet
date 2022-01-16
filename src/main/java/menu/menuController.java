package menu;

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

import menu.dao.menuDAO;
import menu.dto.menuDTO;
import menu.dto.menuOrderDTO;
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
			menuviewDTO dto=dao.view(name);
			request.setAttribute("dto", dto);
			
			String page="/jsp/view.jsp"; //상세화면
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("count_change")!=-1) { //상세페이지에서 영양정보와 가격정보 바꾸기 
			int num=Integer.parseInt(request.getParameter("num"));
			String vol=request.getParameter("vol");
			menuviewDTO dto=dao.count_change(num,vol);
			request.setAttribute("dto", dto);
			String result=dto.getCount();
			System.out.println(dto);
			PrintWriter out=response.getWriter();
			out.write(result+"");
			//String page="/jsp/view.jsp"; //상세화면
			//RequestDispatcher rd=request.getRequestDispatcher(page);
			//rd.forward(request, response);
		}else if(uri.indexOf("search.do")!=-1) { //검색
			String search_option=request.getParameter("search_option");
			String keyword=request.getParameter("keyword");
			System.out.println("서치중"+search_option+","+keyword);
			
			List<menuviewDTO> list=dao.searchList(search_option, keyword);
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			String page="/jsp/search.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("order_insert.do")!=-1) {
			int num=Integer.parseInt(request.getParameter("num"));
			String name=request.getParameter("name");
			//int count=Integer.parseInt(request.getParameter("count"));
			String vol=request.getParameter("vol");
			String temp=request.getParameter("temp");
			String cup=request.getParameter("cup");
			HttpSession session = request.getSession();
			String userid=(String) session.getAttribute("userid");
			
			//가격정보 얻어오기 
			int count=dao.pay(name,vol);
			
			//System.out.println(num+","+vol+","+temp+","+userid+","+name+","+count);
			menuOrderDTO dto=new menuOrderDTO();
			dto.setName(name);
			dto.setCount(count);
			dto.setVol(vol);
			dto.setTemp(temp);
			dto.setCup(cup);
			dto.setUserid(userid);
			dao.order_insert(dto);
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
