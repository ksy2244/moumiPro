package com.moumi.app.mypage.mypayment;

import java.util.List;
import java.util.Map;

public interface MypaymentService {
	public List<Mypayment> listMypaymentCurrent(Map<String, Object> map);
	
	public List<Mypayment> listMypaymentDetail(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
