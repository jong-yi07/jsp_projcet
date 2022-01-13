package menu.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import menu.dto.menuDTO;
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



	//게시물 목록,mybatis 활용
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
	
	

}
