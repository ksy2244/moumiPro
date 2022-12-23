package com.moumi.app.member;

import java.util.Map;

public interface MemberService {
	
	public void insertMember(Member dto) throws Exception;
	
//	public void updateMembership(Map<String, Object> map) throws Exception;
	public void updateLastLogin(String email) throws Exception;
//	public void updateMember(Member dto) throws Exception;
	
	public Member readMember(String email);
	public Member readMember(long userCode);

//	public void generatePwd(Member dto) throws Exception;
	
//	public boolean isPasswordCheck(String email, String userPwd);
//	public void updatePwd(Member dto) throws Exception;
	public int checkFailureCount(String email);
	public void updateFailureCount(String email) throws Exception;
	public void updateFailureCountReset(String email) throws Exception;
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
	public void insertMemberState(Member dto) throws Exception;
}
