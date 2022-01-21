package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import menu.dto.menuOrderDTO;
import sqlmap.MybatisManager;

public class adminDAO {

	public String login(String userid, String passwd) {
		SqlSession session=null;
		String name=null;
		Map<String,String> map=new HashMap<String, String>();
		map.put("userid",userid);
		map.put("passwd",passwd);
		try {
			session=MybatisManager.getInstance().openSession();
			name=session.selectOne("member.admin_login",map); 						
			System.out.println(name);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return name;
	}

	public List<menuOrderDTO> chart() {
		List<menuOrderDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("menu.chart"); 						
			System.out.println(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	

	
}