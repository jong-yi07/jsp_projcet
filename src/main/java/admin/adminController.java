package admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.dao.adminDAO;
import common.Constants;
import menu.dao.menuDAO;
import menu.dto.menuOrderDTO;
import menu.dto.menuviewDTO;


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
				session.setAttribute("admin_userid", userid);
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
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(data.toString());

					
		}else if(uri.indexOf("menu_insert")!=-1) { //상품등록
			//파일업로드 처리
			File uploadDir = new File(Constants.MENU_UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			
			MultipartRequest multi=new MultipartRequest(
					request, Constants.MENU_UPLOAD_PATH, Constants.MAX_UPLOAD, 
					"utf-8", new DefaultFileRenamePolicy());
			
			String name=multi.getParameter("name");
			String menu_detail=multi.getParameter("menu_detail");
			String classification=multi.getParameter("classification");
			String vol=multi.getParameter("vol");
			int count=Integer.parseInt(multi.getParameter("count"));
			int caffeine=Integer.parseInt(multi.getParameter("caffeine"));
			int fat=Integer.parseInt(multi.getParameter("fat"));
			int kcal=Integer.parseInt(multi.getParameter("kcal"));
			int natrium=Integer.parseInt(multi.getParameter("natrium"));
			int protein=Integer.parseInt(multi.getParameter("protein"));
			int sugar=Integer.parseInt(multi.getParameter("sugar"));

			String filename=" "; //공백 1개
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
			
			menuviewDTO dto=new menuviewDTO();
			dto.setName(name);
			dto.setMenu_detail(menu_detail);
			dto.setClassification(classification);
			dto.setCount(count);
			dto.setVol(vol);
			dto.setCaffeine(caffeine);
			dto.setFat(fat);
			dto.setKcal(kcal);
			dto.setNatrium(natrium);
			dto.setProtein(protein);
			dto.setSugar(sugar);
			
//			//파일 첨부를 하지 않을 경우
//			if(filename == null || filename.trim().equals("")) {
//				filename="-";
//			}
//			
//			dto.setFilename(filename);
//			dto.setFilesize(filesize);
			
			dao.insert(dto);
			String page="/jsp/order.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("edit.do")!=-1) { //수정/삭제 페이지로 이동
			//게시물 번호
			int num=Integer.parseInt(request.getParameter("num"));
			String name=request.getParameter("name");
			menuDAO dao2=new menuDAO();
			
			String page="";
			page="/jsp/menu_edit.jsp";
			request.setAttribute("dto", dao2.view(name));
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("menu_delete.do") != -1) {
			MultipartRequest multi=new MultipartRequest(request, Constants.MENU_UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			
			String name=multi.getParameter("name");
			int num=Integer.parseInt(multi.getParameter("num"));
			//첨부파일 삭제
			String filename=num+".jpg";
			System.out.println("파일이름:"+filename);
			
			System.out.println("첨부파일 이름:"+filename);
			if(filename != null && !filename.equals("-")) {//파일이 있으면 파일삭제
				String path=Constants.MENU_UPLOAD_PATH+"/";
				File f=new File(path+filename);
				System.out.println("파일존재여부 :"+f.exists());
				if(f.exists()) {//파일이 존재하면
					f.delete();//파일 목록 삭제
					System.out.println("삭제되었습니다.");
				}
			}
			//레코드 삭제
			dao.menu_delete(num,name);
			
			String page="/jsp/order.jsp";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("menu_update.do")!=-1) {
			//파일업로드 처리
			//디렉토리가 없으면 생성
			File uploadDir = new File(Constants.MENU_UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			MultipartRequest multi=new MultipartRequest(request, Constants.MENU_UPLOAD_PATH, Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			
			int num=Integer.parseInt(multi.getParameter("num"));
			String name=multi.getParameter("name");
			String menu_detail=multi.getParameter("menu_detail");
			String classification=multi.getParameter("classification");
			String vol=multi.getParameter("vol");
			int count=Integer.parseInt(multi.getParameter("count"));
			int kcal=Integer.parseInt(multi.getParameter("kcal"));
			int natrium=Integer.parseInt(multi.getParameter("natrium"));
			int fat=Integer.parseInt(multi.getParameter("fat"));
			int sugar=Integer.parseInt(multi.getParameter("sugar"));
			int protein=Integer.parseInt(multi.getParameter("protein"));
			int caffeine=Integer.parseInt(multi.getParameter("caffeine"));
			
			//파일저장
			String filename=" ";//공백 1개
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
			
			menuviewDTO dto=new menuviewDTO();
			dto.setNum(num);
			dto.setName(name);
			dto.setMenu_detail(menu_detail);
			dto.setClassification(classification);
			dto.setKcal(kcal);
			dto.setNatrium(natrium);
			dto.setFat(fat);
			dto.setSugar(sugar);
			dto.setProtein(protein);
			dto.setCaffeine(caffeine);
			dto.setCount(count);
			dto.setVol(vol);
			dao.menu_update(dto);
			String page="/jsp/order.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
