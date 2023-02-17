package com.pj.erp.vo.HR;

import java.sql.Timestamp;

public class HR_nfc_log {
	
	//멤버변수
	String tag_date; // nfc 접촉시간
	String nfc_code; // nfc 코드
	String username; // 사번
	String e_name;	 // 사원명
	String min;
	String max;
	String tag_code;
	
	//디폴트 생성자
	public HR_nfc_log() {}

	
	//getter, setter
	public String getTag_date() {
		return tag_date;
	}

	public void setTag_date(String tag_date) {
		this.tag_date = tag_date;
	}

	public String getNfc_code() {
		return nfc_code;
	}

	public void setNfc_code(String nfc_code) {
		this.nfc_code = nfc_code;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}


	public String getMin() {
		return min;
	}


	public void setMin(String min) {
		this.min = min;
	}


	public String getMax() {
		return max;
	}


	public void setMax(String max) {
		this.max = max;
	}


	public String getTag_code() {
		return tag_code;
	}


	public void setTag_code(String tag_code) {
		this.tag_code = tag_code;
	}
	
	
	
}
