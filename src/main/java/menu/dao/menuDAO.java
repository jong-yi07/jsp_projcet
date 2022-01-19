package menu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import menu.dto.menuDTO;
import menu.dto.menuOrderDTO;
import menu.dto.menucommentDTO;
import menu.dto.menuviewDTO;
import sqlmap.MybatisManager;

public class menuDAO {

	//게시물(레코드) 갯수 파악
	public int count() {
		int result=0;
		
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result = session.selectOne("menu.count");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}



	//게시물 목록
	public List<menuDTO> list(int start, int end) {
		List<menuDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("menu.list", map); 						
			System.out.println(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}


	//메뉴 상세페이지로 이동
	public menuviewDTO view(String name) {
		System.out.println("name:"+name);
		menuviewDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("menu.view",name); 						
			System.out.println(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}


	//상세페이지에서 vol옵션에 따라 가격정보와 영양정보 바꾸기
	public menuviewDTO count_change(int num, String vol) {
		System.out.println("vol:"+vol);
		menuviewDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("num", num);
			map.put("vol", vol);
			dto=session.selectOne("menu.count_change",map); 						
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}


	//검색
	public List<menuviewDTO> searchList(String search_option, String keyword) {
		List<menuviewDTO> list=null;
		System.out.println("서치중"+search_option+","+keyword);
		
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,String> map=new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", "%"+keyword+"%"); 
			list=session.selectList("menu.searchList", map);
			System.out.println(list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	//메뉴 장바구니에 넣기
	public void order_insert(menuOrderDTO dto) {
		System.out.println("주문:"+dto);
		SqlSession session=null;
		
		session=MybatisManager.getInstance().openSession(); 
		session.insert("menu.order_insert",dto);
		
		session.commit();
		session.close();
		
	}


	//가격정보
	public int pay(String name, String vol) {
		
		SqlSession session=null;
		Map<String,String>map = new HashMap<String,String>();
		map.put("name",name);
		map.put("vol",vol);
		
		session=MybatisManager.getInstance().openSession(); 
		int pay=session.selectOne("menu.pay",map);
		
		session.close();
		
		return pay;
	}


	//메뉴리뷰 추가
	public void commentAdd(menucommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("menu.commentAdd", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}


	//메뉴 리뷰 출력 
	public List<menucommentDTO> commentList(int num) {
		List<menucommentDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("menu.commentList", num);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}


	//댓글삭제
	public void commentdelete(int comment_num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.delete("menu.commentdelete", comment_num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}


	//답글 순서 조정
		public void updatestep(int ref, int re_step) {
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				menucommentDTO dto=new menucommentDTO();
				dto.setRef(ref);
				dto.setRe_step(re_step);
				session.update("menu.updateStep", dto);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session!=null) session.close();
			}
		}


		//댓글쓰기 
		public void reply(menucommentDTO dto) {
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				session.insert("menu.reply", dto);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session!=null) session.close();
			}
			
		}



	


}
