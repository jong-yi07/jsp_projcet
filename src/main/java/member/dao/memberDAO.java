package member.dao;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;

public class memberDAO {

	public int idcheck(String userid) { //아이디 중복체크
		int idcheck=0;
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession(); //mybatis객체 생성
			result=session.selectOne("member.logincheck",userid);
			System.out.println("아이디 확인:"+result);
			if(result==null) { //아이디 존재안함
				idcheck=1;
			}else { //아이디 존재안함
				idcheck=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return idcheck;
	}

	public int namecheck(String name) {
		int name_check=0;
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession(); //mybatis객체 생성
			result=session.selectOne("member.nameCheck",name);
			System.out.println("닉네임 확인:"+result);
			if(result==null) { //아이디 존재하지 않음
				name_check=1;
			}else { //아이디 존재
				name_check=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return name_check;
	}

}
