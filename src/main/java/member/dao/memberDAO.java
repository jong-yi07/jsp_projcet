package member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import member.dto.memberDTO;
import menu.dto.menucommentDTO;
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

	public void insert(memberDTO dto) { //회원가입
		System.out.println(dto.toString());
		SqlSession session=null;
		
		session=MybatisManager.getInstance().openSession(); //mybatis객체 생성
		session.insert("member.insert",dto);
		
		session.commit();
		session.close();
		
		
	}

	public String login(String userid, String passwd) { //로그인
		SqlSession session=null;
		Map<String,String>map = new HashMap<String,String>();
		map.put("userid",userid);
		map.put("passwd",passwd);
		
		session=MybatisManager.getInstance().openSession(); 
		String name=session.selectOne("member.login",map);
		
		session.close();
		
		return name;
	}

	public String id_find(String email, String name) { //아이디 찾기
		SqlSession session=null;
		Map<String,String>map = new HashMap<String,String>();
		map.put("email",email);
		map.put("name",name);
		
		session=MybatisManager.getInstance().openSession(); 
		String userid=session.selectOne("member.id_find",map);
		
		session.close();
		
		return userid;
	}

	//비밀번호 찾기
	public String passwd_find(String email, String userid) {
		SqlSession session=null;
		Map<String,String>map = new HashMap<String,String>();
		map.put("email",email);
		map.put("userid",userid);
		
		session=MybatisManager.getInstance().openSession(); 
		String passwd=session.selectOne("member.passwd_find",map);
		System.out.println("passwd:"+passwd);
		
		session.close();
		
		return passwd;
	}
	
	//내 정보보기
	public memberDTO myinformation(String userid) {
		System.out.println(userid);
		memberDTO dto=new memberDTO();
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("member.myinformation",userid);
			System.out.println(dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return dto;
	}

	//회원정보 수정
	public void update(memberDTO dto) {
		System.out.println(dto);
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.selectOne("member.update",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}

	//회원정보 삭제
	public void delete(String userid) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.selectOne("member.delete",userid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	//장바구니 삭제
	public void mymenu_delete(String userid) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.selectOne("member.mymenu_delete",userid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}


}