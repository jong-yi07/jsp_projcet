package menu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

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
	public List<menuDAO> list(int start, int end) {
		List<menuDAO> list=null;
		SqlSession session=null;
		//혹시 있을지 모를 예외발생을 처리하기 위해 try문 쓰는게 좋다.
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("menu.list", map); //네임스페이스:board id:list
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

}
