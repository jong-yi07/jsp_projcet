package menu;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import menu.VO.Check;
import menu.dao.menuDAO;
import menu.dto.menuDTO;
import menu.dto.menuOrderDTO;
import menu.dto.menucommentDTO;
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

			int count=dao.count();
			int curPage=1;
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			List<menuDTO> list=dao.list(start,end);
			request.setAttribute("list", list);
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
		}else if(uri.indexOf("count_change")!=-1) { //상세페이지에서 가격정보 바꾸기 
			int num=Integer.parseInt(request.getParameter("num"));
			String vol=request.getParameter("vol");
			menuviewDTO dto=dao.count_change(num,vol);
			int result=dto.getCount();
			request.setAttribute("dto", dto);
			System.out.println("사이즈 변경:"+dto);
			PrintWriter out=response.getWriter();
			out.write(result+"");
			
			//String page="/jsp/view.jsp";
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
			
			menuOrderDTO dto=new menuOrderDTO();
			dto.setName(name);
			dto.setCount(count);
			dto.setVol(vol);
			dto.setTemp(temp);
			dto.setCup(cup);
			dto.setUserid(userid);
			dao.order_insert(dto);
			
		}else if(uri.indexOf("comment_add")!=-1) { //메뉴댓글 추가
			//파일(이미지) 업로드 처리
			File uploadDir = new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
		
			
			MultipartRequest multi=new MultipartRequest(
					request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, 
					"utf-8", new DefaultFileRenamePolicy());
			
			String filename=" ";
			int filesize=0;
			try {
				Enumeration files=multi.getFileNames();
				while(files.hasMoreElements()) {
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();//파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//파일 첨부를 하지 않을 경우
			if(filename == null || filename.trim().equals("")) {
				filename="-";
			}
			
			//
			menucommentDTO dto=new menucommentDTO();
			
			int num=Integer.parseInt(multi.getParameter("num"));
			String name=multi.getParameter("name");
			String content=multi.getParameter("content");
			int score=Integer.parseInt(multi.getParameter("score"));
			dto.setName(name);
			dto.setNum(num);
			dto.setContent(content);
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			dto.setScore(score);
			System.out.println("댓글:"+dto);
			dao.commentAdd(dto);
			
			String page="/menu_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(uri.indexOf("commentList.do") != -1) { //댓글 조회 
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("댓글을 위한 게시물 번호 : " + num);
			//댓글 목록 리턴
			List<menucommentDTO> list=dao.commentList(num);
			//request 영역에 저장
			request.setAttribute("list", list);
			System.out.println("댓글조회:"+list);
			//출력페이지로 이동
			String page="/jsp/comment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("comment_delete.do")!=-1) { //댓글삭제
			int comment_num=Integer.parseInt(request.getParameter("comment_num"));
			
			dao.commentdelete(comment_num);
			String page="/menu_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(uri.indexOf("comment_reply.do")!=-1) { //답글쓰기
				menucommentDTO dto=new menucommentDTO();
				int num=Integer.parseInt(request.getParameter("num")); //게시물 번호
				String content=request.getParameter("content");
				String name=request.getParameter("name");
				int comment_num=Integer.parseInt(request.getParameter("comment_num")); //댓글번호
				
				int ref=dao.comment_ref(comment_num);

				dto.setNum(num);
				dto.setContent(content);
				dto.setName(name);
				//dto.setRef(comment_num);
				dto.setRef(ref);
				
				//System.out.println(dto);
			
				
				//답글순서 조정
				int re_step=dao.re_step(comment_num); 
				int re_level=dao.re_level(comment_num);
				System.out.println("re_step:"+re_step);
				
				//int ref=dto.getRef();//답변그룹번호
				re_step=re_step+1;//출력순번
				re_level=re_level+1;//답변단계
				
				dto.setRe_level(re_level);
				dto.setRe_step(re_step);
				
				//답글순서 조정
				//dao.updatestep(ref,re_step);
				//dao.updatestep(comment_num,re_step);
				//System.out.println("답글그룹:"+ref);
				
				//답글 쓰기
				dao.reply(dto);
				String page="/menu_servlet/list.do";
				response.sendRedirect(contextPath+page);
			}else if(uri.indexOf("checkbox.do")!=-1) {
				String checklist[]=request.getParameterValues("check");
				Check check=new Check();
				check.setChecklist(checklist);
				
				List<menuviewDTO> list=dao.list_checkbox(check);
				request.setAttribute("list", list);
				String page="/jsp/search.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else if(uri.indexOf("myorder.do")!=-1) {//주문확인서
				HttpSession session = request.getSession();
				String userid=(String) session.getAttribute("userid");
				
				List<menuOrderDTO> list=dao.myorder(userid);
				request.setAttribute("list", list);
				String page="/jsp/myorder.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else if(uri.indexOf("comment_update.do")!=-1) {//댓글내용 수정
				//HttpSession session = request.getSession();
				//String userid=(String) session.getAttribute("userid");
				int comment_num=Integer.parseInt(request.getParameter("comment_num"));
				String content=request.getParameter("content");
				
				dao.commentupdate(comment_num,content);
				
				String page="/menu_servlet/list.do";
				response.sendRedirect(contextPath+page);
			}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
