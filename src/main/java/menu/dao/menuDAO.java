package menu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import menu.VO.Check;
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
			//System.out.println(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}


	//메뉴 상세페이지로 이동
	public menuviewDTO view(String name) {
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


		//체크박스 누름 
		public List<menuviewDTO> list_checkbox(Check check) {
			List<menuviewDTO> list=null;
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				list=session.selectList("menu.list_checkbox", check); 						
				System.out.println("체크박스:"+list);		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return list;
		}


		//주문확인서
		public List<menuOrderDTO> myorder(String userid) {
			List<menuOrderDTO> list=null;
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				list=session.selectList("menu.myorder", userid); 							
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return list;
		}



		public int re_step(int comment_num) {
			int num=0;
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				num=session.selectOne("menu.re_step", comment_num); 							
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
			return num;
		}



		public int re_level(int comment_num) {
			int num=0;
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				num=session.selectOne("menu.re_level", comment_num); 							
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
			return num;
		}



		public int comment_ref(int comment_num) {
			int num=0;
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				num=session.selectOne("menu.comment_ref", comment_num); 							
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			
			return num;
		}



		//댓글수정
		public void commentupdate(int comment_num, String content) {
			Map<String,Object> map=new HashMap<>();
			map.put("comment_num", comment_num);
			map.put("content", content);
			
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				session.update("menu.commentupdate", map);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session!=null) session.close();
			}
			
		}



		public List<menuviewDTO> list_checkbox(String[] value) {
			List<menuviewDTO> list=null;
			SqlSession session=null;
			try {
				session=MybatisManager.getInstance().openSession();
				list=session.selectList("menu.list_checkbox2", value); 						
				System.out.println("체크박스:"+list);		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session != null) session.close();
			}
			return list;
		}



	


}
