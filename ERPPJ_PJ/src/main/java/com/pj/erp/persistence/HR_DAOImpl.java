package com.pj.erp.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.erp.vo.BlockChainVO;
import com.pj.erp.vo.HR.HR_ApVO;
import com.pj.erp.vo.HR.HR_FamilyVO;
import com.pj.erp.vo.HR.HR_GreetingVO;
import com.pj.erp.vo.HR.HR_PaystepVO;
import com.pj.erp.vo.HR.HR_PhysicalVO;
import com.pj.erp.vo.HR.HR_RankVO;
import com.pj.erp.vo.HR.HR_RecordVO;
import com.pj.erp.vo.HR.HR_SalaryVO;
import com.pj.erp.vo.HR.HR_Time_VO;
import com.pj.erp.vo.HR.HR_VO;
import com.pj.erp.vo.HR.HR_YearService_VO;
import com.pj.erp.vo.HR.HR_nfc_log;

@Repository
public class HR_DAOImpl implements HR_DAO{

	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public int insertMember(HR_VO vo) {
		return sqlSession.insert("com.pj.erp.persistence.HR_DAO.insertMember", vo);
	}	
	
	@Override
	public int insertMember2(HR_VO vo) {
		return sqlSession.insert("com.pj.erp.persistence.HR_DAO.insertMember2", vo);
	}
	
	@Override
	public int insertPhysical(String username) {
		return sqlSession.insert("com.pj.erp.persistence.HR_DAO.insertPhysical", username);
	}
	
	@Override
	public int insertAuth(String authority) {
		return sqlSession.insert("com.pj.erp.persistence.HR_DAO.insertAuth", authority);
	}

	//호봉테이블 (직급)
	@Override
	public List<HR_RankVO> rank() {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.rank");
		
	}

	//호봉테이블 (금액)
	@Override
	public List<HR_PaystepVO> pay(String rank) {
		
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.pay", rank);
	}
	
	//호봉테이블(금액수정)
	@Override
	public int updatePay(HR_PaystepVO vo) {
		return sqlSession.update("com.pj.erp.persistence.HR_DAO.updatePay", vo);
	}

	@Override
	public int insertDepartment(Map<String, Object> map) {		
		return sqlSession.insert("com.pj.erp.persistence.HR_DAO.insertDepartment", map);
	}

	@Override
	public List<HR_GreetingVO> getGreeting(Map<String, Object> map) {
		
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getGreeting", map);
	}
	
	@Override
	public List<HR_SalaryVO> getSalary(Map<String, Object> map) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getSalary", map);
	}
	
	public List<HR_VO> getDepartmentList(Map<String, Object> map) {
		List<HR_VO> dep = null;
		HR_DAO dao = sqlSession.getMapper(HR_DAO.class);
		dep = dao.getDepartmentList(map);
		return dep;
	}

	@Override
	public List<HR_VO> getPositionList(Map<String, Object> map) {
		List<HR_VO> poi = null;
		HR_DAO dao = sqlSession.getMapper(HR_DAO.class);
		poi = dao.getPositionList(map);
		return poi;
	}

	@Override
	public List<HR_VO> getRankList(Map<String, Object> map) {
		List<HR_VO> rank = null;
		HR_DAO dao = sqlSession.getMapper(HR_DAO.class);
		rank = dao.getRankList(map);
		return rank;
	}		
	
	/*
	@Override
	public int userChk(String username) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.userChk", username);
	}
	*/
	
	@Override
	public String getUsername() {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.getUsername");
	}

	@Override
	public int insertFamily(HR_FamilyVO vo2) {
		return sqlSession.insert("com.pj.erp.persistence.HR_DAO.insertFamily", vo2);
	}

	@Override
	public List<HR_VO> foundation() {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.foundation");
	}
	
	@Override
	public HR_VO getFoundation(String username) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.getFoundation", username);
	}
	
	@Override
	public List<HR_PhysicalVO> physicalyList() {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.physicalyList");
	}
	
	@Override
	public HR_PhysicalVO physicaly(String username) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.physicaly", username);
	}

	@Override
	public HR_PhysicalVO getPhysicaly(String username) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.getPhysicaly", username);
	}

	@Override
	public int updatePhysicaly(HR_PhysicalVO vo) {
		return sqlSession.update("com.pj.erp.persistence.HR_DAO.updatePhysicaly", vo);
	}

	@Override
	public int updateFoundation(HR_VO vo) {
		return sqlSession.update("com.pj.erp.persistence.HR_DAO.updateFoundation", vo);
	}

	@Override
	public List<HR_VO> getUsers(Map<String, Object> map) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getUsers", map);
	}

	@Override
	public List<HR_PhysicalVO> getPhysicaly(Map<String, Object> map) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getPhysicaly", map);
	}

	//근태(사원정보 검색)
	@Override
	public List<HR_Time_VO> selectUserTime(Map<String, Object> map) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.selectUserTime", map);
	}
	
	//근태(출근확인)
	@Override
	public int selectWork(Map<String, Object> map) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.selectWork", map);
	}

	//근태(출근입력)
	@Override
	public int StartWork(String username) {
		return sqlSession.insert("com.pj.erp.persistence.HR_DAO.StartWork", username);
	}
	
	//근태(퇴근확인)
	@Override
	public int selectEndWork(Map<String, Object> map) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.selectEndWork", map);
	}

	//근태(퇴근입력)
	@Override
	public int EndWork(String username) {
		return sqlSession.update("com.pj.erp.persistence.HR_DAO.EndWork", username);
	}
	
	// 가족정보 가져오기
	@Override
	public HR_FamilyVO getFamily(String username) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.getFamily", username);
	}

	@Override
	public List<HR_YearService_VO> getYearofservice(Map<String, Object> map) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getYearofservice", map);
	}	

	@Override
	public int recordInput(HR_RecordVO vo) {
		return sqlSession.insert("com.pj.erp.persistence.HR_DAO.recordInput", vo);
	}

	//근태(근무월별 있는가)
	@Override
	public int DetailWork(HR_Time_VO vo) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.DetailWork", vo);
	}

	// 근태(기록 가져오기)
	@Override
	public List<HR_Time_VO> SelectDetailWork(HR_Time_VO vo) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.SelectDetailWork", vo);
	}

	@Override
	public List<HR_Time_VO> SelectDetailWork2(Map<String, Object> map) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.SelectDetailWork2", map);
	}

	//근태(근무월별 있는가)
	@Override
	public HR_Time_VO DetailWork2(HR_Time_VO vo) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.DetailWork2", vo);
	}

	public String getPositionRecord() {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.getPositionRecord");
	}

	@Override
	public String getAP_code() {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.getAP_code");
	}

	@Override
	public int insertAp(HR_ApVO ap) {
		return sqlSession.insert("com.pj.erp.persistence.HR_DAO.insertAp", ap);
	}
	
	@Override 
	public List<HR_nfc_log> getNfcLog() {
		 
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getNfcLog");
	}

	@Override
	public List<HR_RecordVO> getPositions(Map<String, Object> map) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getPositions", map);
	}

	// 부서조회
	@Override
	public List<HR_VO> getDepartmentCodeName(Map<String, Object> map) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getDepartmentCodeName", map);
	}

	@Override
	public int lateWorkStart(String username) {
		return sqlSession.insert("com.pj.erp.persistence.HR_DAO.lateWorkStart", username);
	}

	@Override
	public int ealryWorkEnd(String username) {
		return sqlSession.update("com.pj.erp.persistence.HR_DAO.ealryWorkEnd", username);
	}

	@Override
	public int LateEearlyer(HR_Time_VO vo) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.LateEearlyer", vo);
	}

	@Override
	public List<HR_Time_VO> selectLateEearlyEnd(HR_Time_VO vo) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.selectLateEearlyEnd", vo);
	}

	@Override
	public int deleteNfc(String tag_code) {
		return sqlSession.delete("com.pj.erp.persistence.HR_DAO.deleteNfc", tag_code);
	}

	@Override
	public HR_ApVO getApInfo(String ap_code) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.getApInfo", ap_code);
	}

	@Override
	public int selectEname(String e_name) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.selectEname", e_name);
	}

	@Override
	public List<HR_VO> getUsernameList(String e_name) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getUsernameList", e_name);
	}

	@Override
	public int selectAp_name(String ap_name) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.selectAp_name", ap_name);
	}

	@Override
	public List<HR_ApVO> getAp_codeList(String ap_name) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getAp_codeList", ap_name);
	}

	@Override
	public List<HR_RecordVO> getRecord(Map<String, Object> map) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getRecord", map);
	}

	@Override
	public List<HR_FamilyVO> searchFamily(Map<String, Object> map) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.searchFamily", map);
	}

	@Override
	public int updateFamily(HR_FamilyVO vo) {
		return sqlSession.update("com.pj.erp.persistence.HR_DAO.updateFamily", vo);
	}

	@Override
	public List<HR_RecordVO> getRecords(Map<String, Object> map) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getRecords", map);
	}

	@Override
	public List<HR_ApVO> getAppointmentList(Map<String, Object> map) {
		return sqlSession.selectList("com.pj.erp.persistence.HR_DAO.getAppointmentList", map);
	}
	
	/*
	@Override
	public HR_VO getUserInfo(String username) {
		return sqlSession.selectOne("com.pj.erp.persistence.HR_DAO.getUserInfo", username);
	}

	@Override
	public int updateUserInfo(HR_VO vo) {
		return sqlSession.update("com.pj.erp.persistence.HR_DAO.getUserInfo", vo);
	}
	*/
}
