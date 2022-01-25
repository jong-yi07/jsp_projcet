package header;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//페이지 이동만 수행하는 컨트롤러
@WebServlet("/header_servlet/*")
public class header extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String contextPath=request.getContextPath();
		if(uri.indexOf("order.do")!=-1) {
			String page="/jsp/order.jsp";
			response.sendRedirect(contextPath+page);
		}else if(uri.indexOf("index.do")!=-1) {
			String page="/jsp/index.jsp";
			response.sendRedirect(contextPath+page);
		}else if(uri.indexOf("chart.do")!=-1) {
			String page="/jsp/chart.jsp";
			response.sendRedirect(contextPath+page);
		}else if(uri.indexOf("menu_insert.do")!=-1) {
			String page="/jsp/menu_insert.jsp";
			response.sendRedirect(contextPath+page);
		}else if(uri.indexOf("signup.do")!=-1) {
			String page="/jsp/signup1.jsp";
			response.sendRedirect(contextPath+page);
		}else if(uri.indexOf("login.do")!=-1) {
			String page="/jsp/login.jsp";
			response.sendRedirect(contextPath+page);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
