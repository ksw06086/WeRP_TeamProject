package com.pj.erp.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pj.erp.persistence.HR_DAO;
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
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

@Service
public class HR_ServiceImpl implements HR_Service {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	HR_DAO dao;

	// 인사정보등록
	@Override
	public void inputFoundation(MultipartHttpServletRequest req, Model model) {
		MultipartFile file = req.getFile("e_picture");
		UUID uuid = UUID.randomUUID();
		String saveDir = req.getRealPath("/resources/hr_img/");
		/*
		 * F:\dev50\git\WeRPNetwork\ERPPJ_PJ\src\main\webapp\resources\hr_img\ 서버용 저장 경로
		 */
		String realDir = "F:\\dev50\\git\\WeRPNetwork\\ERPPJ_PJ\\src\\main\\webapp\\resources\\hr_img\\"; // 저장 경로
		String times = String.valueOf(System.currentTimeMillis());
		try {
			file.transferTo(new File(saveDir + times + uuid + "_" + file.getOriginalFilename()));

			FileInputStream fis = new FileInputStream(saveDir + times + uuid + "_" + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + times + uuid + "_" + file.getOriginalFilename());

			int data = 0;

			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();

			HR_VO vo = new HR_VO();

			String username = dao.getUsername();
			String e_name = req.getParameter("e_name");
			String e_picture = file.getOriginalFilename();
			if (e_picture.equals("")) {
				e_picture = "noImage.png";
			} else {
				e_picture = times + uuid + "_" + file.getOriginalFilename();
			}

			String password = passwordEncoder.encode("1234");
			int e_gender = Integer.parseInt(req.getParameter("e_gender"));

			vo.setUsername(username);
			vo.setPassword(password);
			vo.setE_picture(e_picture);
			vo.setE_name(e_name);
			vo.setE_gender(e_gender);
			vo.setE_type(req.getParameter("e_type"));
			vo.setE_code(req.getParameter("e_code"));
			vo.setE_hp(req.getParameter("e_hp"));

			String e_address = req.getParameter("e_address");

			vo.setE_address(e_address);

			vo.setE_mailcode(req.getParameter("e_mailcode"));

			vo.setLevel_step(Integer.parseInt(req.getParameter("level_step")));

			vo.setE_nfcCodeNFC(req.getParameter("e_nfcCodeNFC"));
			vo.setStart_date(new Timestamp(System.currentTimeMillis()));

			String department_code = req.getParameter("department_code");
			String authority = "";

			switch (department_code) {
			case "ct_01":
				authority = "ROLE_CT";
				break;
			case "hr_01":
				authority = "ROLE_HR";
				break;
			case "ms_01":
				authority = "ROLE_MS";
				break;
			case "st_01":
				authority = "ROLE_ST";
				break;
			case "ft_01":
				authority = "ROLE_FT";
				break;
			case "mf_01":
				authority = "ROLE_MF";
				break;
			default:
				authority = "ROLE_ADMIN";
				break;
			}

			String position_code = req.getParameter("position_code");
			String rank_code = req.getParameter("rank_code");

			vo.setDepartment_code(department_code);
			vo.setPosition_code(position_code);
			vo.setRank_code(rank_code);

			int enabled = 1;
			vo.setEnabled(enabled);

			HR_FamilyVO vo2 = new HR_FamilyVO();

			String f_name = " ";
			String f_type = " ";

			vo2.setUsername(username);
			vo2.setF_name(f_name);
			vo2.setF_type(f_type);
			vo2.setF_born(new Date(new java.util.Date().getYear(), new java.util.Date().getMonth(),
					new java.util.Date().getDay()));

			int cnt = 0;

			cnt = dao.insertMember(vo);
			dao.insertAuth(authority);
			dao.insertPhysical(username);
			dao.insertFamily(vo2);

			model.addAttribute("cnt", 1);
			model.addAttribute("insertCnt", cnt);

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 호봉테이블(직급)
	@Override
	public void selectRank(HttpServletRequest req, Model model) {
		List<HR_RankVO> vo = dao.rank();

		model.addAttribute("vo", vo);
	}

	// 호봉테이블(호봉)
	@Override
	public List<HR_PaystepVO> selectMoney(HttpServletRequest req, Model model) {
		String rank = req.getParameter("rank_code");
		List<HR_PaystepVO> vo = dao.pay(rank);
		return vo;
	}

	// 호봉테이블(호봉수정)
	@Override
	public int updateMoney(HttpServletRequest req, Model model) {
		int i = 0;
		int updateCnt = 0;
		HR_PaystepVO vo = new HR_PaystepVO();
		do {
			// 화면에서 값 입력
			int paystep_code = Integer.parseInt(req.getParameter("paystep_code" + i));
			String rank_code = req.getParameter("rank_code");
			String base = req.getParameter("BASE_PAYMENT" + i);
			String add = req.getParameter("ADD_PAYMENT" + i);
			String Extension = req.getParameter("EXTENSION_PAYMENT" + i);

			// 콤마제거
			int BASE_PAYMENT = Integer.parseInt(base.replace(",", ""));
			int ADD_PAYMENT = Integer.parseInt(add.replace(",", ""));
			int EXTENSION_PAYMENT = Integer.parseInt(Extension.replace(",", ""));

			vo.setPaystep_code(paystep_code);
			vo.setRank_code(rank_code);
			vo.setBASE_PAYMENT(BASE_PAYMENT);
			vo.setADD_PAYMENT(ADD_PAYMENT);
			vo.setEXTENSION_PAYMENT(EXTENSION_PAYMENT);

			updateCnt = dao.updatePay(vo);

			i++;
		} while (req.getParameter("paystep_code" + i) != null);

		return updateCnt;
	}

	// 부서 등록
	@Override
	public void inputDepartmentPro(HttpServletRequest req, Model model) {
		String department_code = req.getParameter("department_code");
		String department_name = req.getParameter("department_name");
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("department_code", department_code);
		map.put("department_name", department_name);

		dao.insertDepartment(map);

	}

	@Override
	public List<HR_GreetingVO> getGreeting(Map<String, Object> map, HttpServletRequest req, Model model)
			throws java.text.ParseException {

		String pa_dates = (String) map.get("pa_date");
		String pa_sDate = pa_dates.substring(0, 10);
		String pa_eDate = pa_dates.substring(13, 23);

		String syear = pa_sDate.substring(8, 10);
		String smonth = pa_sDate.substring(0, 2);
		String sday = pa_sDate.substring(3, 5);

		String eyear = pa_eDate.substring(8, 10);
		String emonth = pa_eDate.substring(0, 2);
		String eday = pa_eDate.substring(3, 5);

		String spa_date = syear + "/" + smonth + "/" + sday;
		String epa_date = eyear + "/" + emonth + "/" + eday;

		map.put("spa_date", spa_date);
		map.put("epa_date", epa_date);

		List<HR_GreetingVO> list = dao.getGreeting(map);
		return list;
	}

	@Override
	public List<HR_SalaryVO> getSalary(Map<String, Object> map, HttpServletRequest req, Model model)
			throws java.text.ParseException {

		List<HR_SalaryVO> list = dao.getSalary(map);

		return list;
	}

	@Override
	public List<HR_RecordVO> getRecord(Map<String, Object> map, HttpServletRequest req, Model model)
			throws java.text.ParseException {

		List<HR_RecordVO> list = dao.getRecord(map);

		return list;
	}

	@Override
	public void departmentList(HttpServletRequest req, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		List<HR_VO> dep = dao.getDepartmentList(map);

		model.addAttribute("dep", dep);
	}

	@Override
	public void positionList(HttpServletRequest req, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<HR_VO> poi = dao.getPositionList(map);

		model.addAttribute("poi", poi);

	}

	@Override
	public void rankList(HttpServletRequest req, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<HR_VO> rank = dao.getRankList(map);

		model.addAttribute("rank", rank);

	}

	@Override
	public void selectFoundation(HttpServletRequest req, Model model) {
		List<HR_VO> vo = dao.foundation();

		model.addAttribute("vo", vo);
	}

	@Override
	public void selectPhysical(HttpServletRequest req, Model model) {
		List<HR_PhysicalVO> phy = dao.physicalyList();

		model.addAttribute("phy", phy);
	}

	@Override
	public void modifyFoundationView(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");

		HR_VO vo = dao.getFoundation(username);

		model.addAttribute("vo", vo);
	}

	@Override
	public void modifyFoundationPro(MultipartHttpServletRequest req, Model model) {
		int updateCnt = 0;

		MultipartFile file = req.getFile("e_picture");
		UUID uuid = UUID.randomUUID();

		String saveDir = req.getRealPath("/resources/hr_img/");

		String realDir = "F:\\dev50\\git\\WeRPNetwork\\ERPPJ_PJ\\src\\main\\webapp\\resources\\hr_img\\";
		/*
		 * "F:\\dev50\\git\\WeRPNetwork\\ERPPJ_PJ\\src\\main\\webapp\\resources\\hr_img";
		 */
		String times = String.valueOf(System.currentTimeMillis());
		try {
			file.transferTo(new File(saveDir + times + uuid + "_" + file.getOriginalFilename()));

			FileInputStream fis = new FileInputStream(saveDir + times + uuid + "_" + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + times + uuid + "_" + file.getOriginalFilename());

			int data = 0;

			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();

			System.out.println(System.currentTimeMillis());

			HR_VO vo = new HR_VO();
			String username = req.getParameter("username");
			String e_name = req.getParameter("e_name");

			String e_picture = file.getOriginalFilename();
			if (e_picture.equals("")) {
				e_picture = "noImage.png";
			} else {
				e_picture = times + uuid + "_" + file.getOriginalFilename();
			}

			int e_gender = Integer.parseInt(req.getParameter("e_gender"));

			vo.setUsername(username);
			vo.setE_name(e_name);
			vo.setE_picture(e_picture);
			/*
			 * if(e_picture == null) { vo.setE_picture("noImage.png"); }
			 */
			vo.setE_gender(e_gender);
			vo.setE_type(req.getParameter("e_type"));
			vo.setE_code(req.getParameter("e_code"));
			vo.setE_hp(req.getParameter("e_hp"));

			String e_address = req.getParameter("e_address");

			vo.setE_address(e_address);

			vo.setE_mailcode(req.getParameter("e_mailcode"));

			vo.setLevel_step(Integer.parseInt(req.getParameter("level_step")));

			vo.setE_nfcCodeNFC(req.getParameter("e_nfcCodeNFC"));
			String department_code = req.getParameter("department_code");
			String position_code = req.getParameter("position_code");
			String rank_code = req.getParameter("rank_code");

			vo.setDepartment_code(department_code);
			vo.setPosition_code(position_code);
			vo.setRank_code(rank_code);

			updateCnt = dao.updateFoundation(vo);

			model.addAttribute("updateCnt", updateCnt);
			model.addAttribute("username", username);

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void modifyPhysicalyView(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");

		HR_PhysicalVO pvo = dao.getPhysicaly(username);

		model.addAttribute("pvo", pvo);
	}

	@Override
	public void modifyPhysicalyPro(HttpServletRequest req, Model model) {

		HR_PhysicalVO vo = new HR_PhysicalVO();
		String username = req.getParameter("username");
		vo.setUsername(username);
		vo.setE_height(Integer.parseInt(req.getParameter("e_height")));
		vo.setE_weight(Integer.parseInt(req.getParameter("e_weight")));
		vo.setE_left_sight(Integer.parseInt(req.getParameter("e_left_sight")));
		vo.setE_right_sight(Integer.parseInt(req.getParameter("e_right_sight")));
		vo.setE_color_blind(req.getParameter("e_color_blind"));
		vo.setE_blood_type(req.getParameter("e_blood_type"));
		String e_blood_presure = "";
		String e_blood_presure1 = req.getParameter("e_blood_presure1");
		String e_blood_presure2 = req.getParameter("e_blood_presure2");
		e_blood_presure = e_blood_presure1 + "/" + e_blood_presure2 + "mmHg";

		vo.setE_blood_presure(e_blood_presure);
		vo.setE_medical_info(req.getParameter("e_medical_info"));
		vo.setE_veteran_type(Integer.parseInt(req.getParameter("e_veteran_type")));
		vo.setE_veteran_info(req.getParameter("e_veteran_info"));
		vo.setE_veteran_level(req.getParameter("e_veteran_level"));
		vo.setE_disability_type(req.getParameter("e_disability_type"));
		vo.setE_disability_level(req.getParameter("e_disability_level"));

		int updateCnt = dao.updatePhysicaly(vo);

		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("username", username);

	}

	// 가족정보 상세페이지
	@Override
	public void modifyFamilyView(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");

		HR_FamilyVO vo = dao.getFamily(username);

		model.addAttribute("vo", vo);

	}

	// 가족정보 수정 처리
	@Override
	public void modifyFamilyPro(HttpServletRequest req, Model model) {
		HR_FamilyVO vo = new HR_FamilyVO();
		String username = req.getParameter("username");

		vo.setUsername(username);
		System.out.println(req.getParameter("f_name"));

		vo.setF_name(req.getParameter("f_name"));
		vo.setF_type(req.getParameter("f_type"));
		vo.setF_cohabitation(req.getParameter("f_cohabitation"));
		System.out.println(req.getParameter("f_born"));
		vo.setF_born(Date.valueOf(req.getParameter("f_born")));

		vo.setF_born_type(req.getParameter("f_born_type"));

		int updateCnt = dao.updateFamily(vo);

		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("username", username);
	}

	@Override
	public List<HR_VO> getUsers(Map<String, Object> map, HttpServletRequest req, Model model) throws ParseException {

		List<HR_VO> list = dao.getUsers(map);
		return list;

	}

	@Override
	public List<HR_PhysicalVO> getPhysical(Map<String, Object> map, HttpServletRequest req, Model model)
			throws ParseException {
		List<HR_PhysicalVO> list = dao.getPhysicaly(map);
		return list;
	}

	// 근태(사원목록 가져오기)
	@Override
	public List<HR_Time_VO> selectUserHR(HttpServletRequest req, Model model) {

		String username = req.getParameter("username");
		String department_code = req.getParameter("department_code");

		String e_name = req.getParameter("e_name");
		Map<String, Object> map = new HashMap<>();
		map.put("department_code", department_code);
		map.put("e_name", e_name);
		map.put("username", username);

		List<HR_Time_VO> vo = dao.selectUserTime(map);

		return vo;
	}

	// 근태(출근 입력)
	@Override
	public int InsertStartWork(HttpServletRequest req, Model model) {
		int insertCnt = 0;
		Map<String, Object> map = new HashMap<String, Object>();

		String[] username = req.getParameterValues("username");

		Calendar c = Calendar.getInstance();
		int Hour = c.get(Calendar.HOUR_OF_DAY);

		for (int i = 0; i < username.length; i++) {
			map.put("username", username[i]);
			int users = dao.selectWork(map);
			if (users == 0) {
				if (Hour > 9) {
					insertCnt = dao.StartWork(username[i]);
				} else {
					insertCnt = dao.lateWorkStart(username[i]);
				}
			}
		}

		return insertCnt;
	}

	// 근태(퇴근 입력)
	@Override
	public int InsertEndWork(HttpServletRequest req, Model model) {

		int updateCnt = 0;
		Map<String, Object> map = new HashMap<String, Object>();

		String[] username = req.getParameterValues("username");

		Calendar c = Calendar.getInstance();
		int Hour = c.get(Calendar.HOUR_OF_DAY);

		for (int i = 0; i < username.length; i++) {
			map.put("username", username[i]);
			int users = dao.selectEndWork(map);

			if (users == 0) {
				if (Hour < 18) {
					updateCnt = dao.ealryWorkEnd(username[i]);
				} else {
					updateCnt = dao.EndWork(username[i]);
				}
			}
		}

		return updateCnt;
	}

	@Override
	public List<HR_YearService_VO> getYearofservice(Map<String, Object> map, HttpServletRequest req, Model model)
			throws java.text.ParseException {
		if(map.get("day")=="") {
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy/MM/dd");
			String day = format1.format(System.currentTimeMillis());
			map.put("day", day);
		}
		List<HR_YearService_VO> list = dao.getYearofservice(map);
		return list;
	}

	// 근태(근무일별 목록 가져오기)
	@Override
	public List<HR_Time_VO> DetailUserWork(HttpServletRequest req, Model model) {

		int cnt = 0;
		int i = 1;

		String month;
		List<HR_Time_VO> dto = new ArrayList<>();
		List<HR_Time_VO> dtos = null;

		String username = req.getParameter("username");

		Calendar c = Calendar.getInstance();
		String year = String.valueOf(c.get(Calendar.YEAR));
		String years = year.substring(2);

		do {
			if (i < 10) {
				month = "0" + i;
			} else {
				month = "" + i;
			}
			HR_Time_VO vo = new HR_Time_VO();
			vo.setUsername(username);
			vo.setYear(years);
			vo.setMonth(month);
			cnt = dao.DetailWork(vo);
			if (cnt != 0) {
				dtos = dao.SelectDetailWork(vo);

				for (int j = 0; j < dtos.size(); j++) {
					HR_Time_VO temp = dtos.get(j);

					dto.add(temp);
				}

				cnt = 0;
			}
			i++;
		} while (i < 13);

		return dto;
	}

	// 인사발령 등록
	@Override
	public void HR_recordinput(HttpServletRequest req, Model model) {

		HR_RecordVO vo = new HR_RecordVO();

		String position_record_code = dao.getPositionRecord();
		String username = req.getParameter("username");
		String ap_code = req.getParameter("ap_code");
		String position_code = req.getParameter("position_code");
		String position_code_after = req.getParameter("position_code_after");
		String department_code = req.getParameter("department_code");
		String department_code_after = req.getParameter("department_code_after");

		String sDate = req.getParameter("record_date");
		sDate = sDate.replace("/", "-");
		/*
		 * String eDate = req.getParameter("record_date_after"); eDate =
		 * eDate.replace("/", "-");
		 */

		vo.setUsername(username);
		vo.setAp_code(ap_code);
		vo.setPosition_code(position_code);
		vo.setPosition_code_after(position_code_after);
		vo.setPosition_record_code(position_record_code);
		vo.setDepartment_code(department_code);
		vo.setDepartment_code_after(department_code_after);
		vo.setRecord_date(Date.valueOf(sDate));
		/* vo.setRecord_date_after(Date.valueOf(eDate)); */

		int cnt = 0;

		cnt = dao.recordInput(vo);

		model.addAttribute("cnt", 1);
		model.addAttribute("insertCnt", cnt);
	}

	@Override
	public void searchUsername(HttpServletRequest req, Model model) {
		String e_name = req.getParameter("e_name");

		int cnt = dao.selectEname(e_name);

		if (cnt > 0) {
			List<HR_VO> dto = dao.getUsernameList(e_name);
			model.addAttribute("dto", dto);
		}

		model.addAttribute("cnt", cnt);
	}

	@Override
	public void HR_APinput(HttpServletRequest req, Model model) {

		HR_ApVO ap = new HR_ApVO();

		String ap_code = dao.getAP_code();
		String ap_name = req.getParameter("ap_name");
		String ap_content = req.getParameter("ap_content");

		ap.setAp_code(ap_code);
		ap.setAp_name(ap_name);
		ap.setAp_content(ap_content);
		ap.setAp_reg_date(new Timestamp(System.currentTimeMillis()));
		ap.setAp_est_date(Date.valueOf(req.getParameter("ap_est_date")));
		ap.setAp_status(req.getParameter("ap_status"));

		int cnt = 0;

		cnt = dao.insertAp(ap);

		model.addAttribute("cnt", 1);
		model.addAttribute("insertCnt", cnt);

	}

	@Override
	public HR_VO HR_select_username(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");

		HR_VO data = dao.getFoundation(username);

		return data;
	}

	// 근태(월별 카운트)
	@Override
	public List<HR_Time_VO> selectCountMonth(HttpServletRequest req, Model model) {

		String username = req.getParameter("username");

		List<HR_Time_VO> dto = new ArrayList<>();
		HR_Time_VO sel = new HR_Time_VO();

		// 올해 년, 월 입력부분.
		Calendar c = Calendar.getInstance();
		String year = String.valueOf(c.get(Calendar.YEAR));
		String years = year.substring(2);
		String month;

		// 월 카운트를 위한 변수
		int i = 1;

		do {
			if (i < 10) {
				month = "0" + i;
			} else {
				month = "" + i;
			}
			HR_Time_VO vo = new HR_Time_VO();
			vo.setUsername(username);
			vo.setYear(years);
			vo.setMonth(month);

			sel = dao.DetailWork2(vo);
			dto.add(sel);

			i++;
		} while (i < 13);

		return dto;
	}

	@Override
	public HR_PhysicalVO HR_select_physical(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");

		HR_PhysicalVO data = dao.physicaly(username);

		return data;
	}

	@Override
	public HR_FamilyVO HR_select_family(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");

		HR_FamilyVO data = dao.getFamily(username);

		return data;
	}

	@Override
	public List<HR_nfc_log> getNfcLog(HttpServletRequest req, Model model) {

		List<HR_nfc_log> nfc_log = dao.getNfcLog();

		return nfc_log;
	}

	@Override
	public List<HR_RecordVO> getPositions(Map<String, Object> map, HttpServletRequest req, Model model)
			throws ParseException {

		List<HR_RecordVO> list = dao.getPositions(map);
		return list;

	}

	// 부서조회
	@Override
	public List<HR_VO> getDepartment(HttpServletRequest req, Model model) {

		String department_name = req.getParameter("department_name");

		Map<String, Object> map = new HashMap<>();
		map.put("department_name", department_name);

		List<HR_VO> list = dao.getDepartmentCodeName(map);

		return list;
	}

	// 사이드바 출근
	@Override
	public int sidebarWorkStart(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");

		int insertCnt = 0;
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("username", username);

		Calendar c = Calendar.getInstance();
		int Hour = c.get(Calendar.HOUR_OF_DAY);

		int users = dao.selectWork(map);
		if (users == 0) {
			if (Hour > 9) {
				insertCnt = dao.lateWorkStart(username);
			} else {
				insertCnt = dao.StartWork(username);
			}
		}

		return insertCnt;
	}

	// 사이드바 퇴근
	@Override
	public int sidebarEndWork(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");

		int updateCnt = 0;
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("username", username);
		Calendar c = Calendar.getInstance();
		int Hour = c.get(Calendar.HOUR_OF_DAY);

		int users = dao.selectEndWork(map);

		if (users == 0) {
			if (Hour < 18) {
				updateCnt = dao.ealryWorkEnd(username);
			} else {
				updateCnt = dao.EndWork(username);
			}
		}

		return updateCnt;
	}

	// 지각, 조퇴 정보 가져오기
	@Override
	public List<HR_Time_VO> LateDateSelect(HttpServletRequest req, Model model) {

		int cnt = 0;
		int i = 1;

		String month;
		List<HR_Time_VO> dto = new ArrayList<>();
		List<HR_Time_VO> dtos = null;

		String username = req.getParameter("username");

		Calendar c = Calendar.getInstance();
		String year = String.valueOf(c.get(Calendar.YEAR));
		String years = year.substring(2);

		do {
			if (i < 10) {
				month = "0" + i;
			} else {
				month = "" + i;
			}
			HR_Time_VO vo = new HR_Time_VO();
			vo.setUsername(username);
			vo.setYear(years);
			vo.setMonth(month);
			cnt = dao.LateEearlyer(vo);
			if (cnt != 0) {
				dtos = dao.selectLateEearlyEnd(vo);
				for (int j = 0; j < dtos.size(); j++) {
					HR_Time_VO temp = dtos.get(j);

					dto.add(temp);
				}
				cnt = 0;
			}
			i++;
		} while (i < 13);

		return dto;
	}

	@Override
	public int deleteNfcSelect(HttpServletRequest req, Model model) {

		int updateCnt = 0;

		String[] tag_code = req.getParameterValues("tag_code");
		for (int i = 0; i < tag_code.length; i++) {
			updateCnt = dao.deleteNfc(tag_code[i]);
		}
		return updateCnt;
	}

	// ap_name으로 ap_code 검색하기
	@Override
	public void searchAp_code(HttpServletRequest req, Model model) {
		String ap_name = req.getParameter("ap_name");

		int cnt = dao.selectAp_name(ap_name);

		if (cnt > 0) {
			List<HR_ApVO> dto = dao.getAp_codeList(ap_name);
			model.addAttribute("dto", dto);
		}

		model.addAttribute("cnt", cnt);

	}

	@Override
	public List<HR_FamilyVO> searchFamily(Map<String, Object> map, HttpServletRequest req, Model model)
			throws ParseException {
		List<HR_FamilyVO> list = dao.searchFamily(map);
		return list;
	}

	@Override
	public List<HR_RecordVO> getRecords(Map<String, Object> map, HttpServletRequest req, Model model)
			throws java.text.ParseException {

		List<HR_RecordVO> list = dao.getRecords(map);
		return list;
	}

	@Override
	public void selectAppointment(HttpServletRequest req, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<HR_ApVO> ap = dao.getAppointmentList(map);

		model.addAttribute("ap", ap);

	}

	/*
	 * @Override public void modifyUserView(MultipartHttpServletRequest req, Model
	 * model) { String username = (String)
	 * req.getSession().getAttribute("username");
	 * 
	 * HR_VO user = dao.getUserInfo(username);
	 * 
	 * model.addAttribute("user", user);
	 * 
	 * }
	 * 
	 * @Override public void modifyUserPro(MultipartHttpServletRequest req, Model
	 * model) { int updateCnt = 0;
	 * 
	 * MultipartFile file = req.getFile("e_picture"); UUID uuid = UUID.randomUUID();
	 * 
	 * String saveDir = req.getRealPath("/resources/hr_img/");
	 * 
	 * 
	 * String realDir =
	 * "F:\\dev50\\git\\WeRPNetwork\\ERPPJ_PJ\\src\\main\\webapp\\resources\\hr_img\\";
	 * "F:\\dev50\\git\\WeRPNetwork\\ERPPJ_PJ\\src\\main\\webapp\\resources\\hr_img";
	 * String times = String.valueOf(System.currentTimeMillis()); try {
	 * file.transferTo(new File(saveDir+times+uuid+"_"+file.getOriginalFilename()));
	 * 
	 * FileInputStream fis = new FileInputStream(saveDir +times+
	 * uuid+"_"+file.getOriginalFilename()); FileOutputStream fos = new
	 * FileOutputStream(realDir +times+ uuid+"_"+file.getOriginalFilename());
	 * 
	 * int data = 0;
	 * 
	 * while((data = fis.read()) != -1) { fos.write(data); } fis.close();
	 * fos.close();
	 * 
	 * System.out.println(System.currentTimeMillis());
	 * 
	 * HR_VO vo = new HR_VO(); String username = (String)
	 * req.getSession().getAttribute("username"); String password =
	 * passwordEncoder.encode(req.getParameter("password")); String e_name =
	 * req.getParameter("e_name");
	 * 
	 * String e_picture = file.getOriginalFilename(); if(e_picture.equals("")) {
	 * e_picture ="noImage.png"; } else { e_picture = times+
	 * uuid+"_"+file.getOriginalFilename(); }
	 * 
	 * int e_gender = Integer.parseInt(req.getParameter("e_gender"));
	 * 
	 * vo.setUsername(username); vo.setPassword(password); vo.setE_name(e_name);
	 * vo.setE_picture(e_picture);
	 * 
	 * if(e_picture == null) { vo.setE_picture("noImage.png"); }
	 * 
	 * vo.setE_gender(e_gender); vo.setE_type(req.getParameter("e_type"));
	 * vo.setE_code(req.getParameter("e_code"));
	 * vo.setE_hp(req.getParameter("e_hp"));
	 * 
	 * String e_address = req.getParameter("e_address");
	 * 
	 * vo.setE_address(e_address);
	 * 
	 * vo.setE_mailcode(req.getParameter("e_mailcode"));
	 * 
	 * 
	 * updateCnt = dao.updateUserInfo(vo);
	 * 
	 * model.addAttribute("updateCnt", updateCnt); model.addAttribute("username",
	 * username);
	 * 
	 * 
	 * }catch(IOException e) { e.printStackTrace(); }
	 * 
	 * }
	 */

}
