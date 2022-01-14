package menu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import menu.dto.menuDTO;
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

	


}
