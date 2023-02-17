package com.pj.erp.service;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pj.erp.persistence.ERPDAO;
import com.pj.erp.persistence.HR_DAO;
import com.pj.erp.vo.MaterialVO;
import com.pj.erp.vo.ProductVO;
import com.pj.erp.vo.SalelistVO;
import com.pj.erp.vo.BlockChainVO;
import com.pj.erp.vo.HashVO;
import com.pj.erp.vo.Material_VO;
import com.pj.erp.vo.MsgVO;
import com.pj.erp.vo.HR.HR_VO;
import com.pj.erp.vo.HR.HR_nfc_log;
import com.pj.erp.vo.MS.MS_plan;
import com.pj.erp.vo.ST.ST_contrast;

@Service
public class ERPServiceImpl implements ERPService{
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	ERPDAO dao;
	
	@Autowired
	HR_DAO dao2;
	
	@Autowired
	ERPDAO dao3;
	
	Map<String, Object> map = new HashMap<String, Object>();

	@Override
	public void testreg(HttpServletRequest req, Model model) {
		
		HR_VO vo = new HR_VO();
		String e_name = "1234";
		
		String password = passwordEncoder.encode(e_name);
		vo.setPassword(password);
		vo.setE_name(e_name);
		
		String department_code = req.getParameter("department_code");
		String authority = "";
		switch(department_code) {
		case "ct_01"
			: authority = "ROLE_CT";
			break;
		case "hr_01"
			: authority = "ROLE_HR";
			break;
		case "ms_01"
			: authority = "ROLE_MS";
			break;
		case "st_01"
			: authority = "ROLE_ST";
			break;
		case "ft_01"
			: authority = "ROLE_FT";
			break;
		case "mf_01"
			: authority = "ROLE_MF";
			break;
		default 
			: authority = "ROLE_ADMIN";
			break;
	}
		
		dao2.insertMember2(vo);
		dao2.insertAuth(authority);
		
		
		
	}
	
	@Override
	public void nfc(HttpServletRequest req, Model model) {
		String nfcid = req.getParameter("nfcid");
 
		Map<String, Object> map = new HashMap<>();
		dao.nfc(nfcid); 
 
 
		HR_nfc_log nfc= dao.selectNfc(nfcid);
		
		String come = nfc.getMin();
		String leave = nfc.getMax();
		
		String comeTime="";
		String comeDay = come.substring(0, 8);
		if(come.substring(8, 9) == "0") {
			comeTime = come.substring(9, 12);
		}else {
			comeTime = come.substring(8, 12);
		}
		
		String leaveTime = leave.substring(8, 12);
		
		
		
		Calendar c = Calendar.getInstance();
		String year = String.valueOf(c.get(Calendar.YEAR));
		
		String month = String.valueOf(c.get(Calendar.MONTH) + 1);
		String day = String.valueOf(c.get(Calendar.DAY_OF_MONTH));
		
		int time = 90000;
		int end = 1800;
		
		int mon = c.get(Calendar.MONTH) + 1;
		if(mon < 10) {
			month = "0"+month;
		}
		
		
		
		String today = year+ month+ day;

		String username = nfc.getUsername();
		
		
		map.put("username", username);
		
		int leaves = Integer.parseInt(leaveTime);
		
		int todays = Integer.parseInt(today);
		int comeDays = Integer.parseInt(comeDay);
		
		int Hour = c.get(Calendar.HOUR_OF_DAY);
		
		if(todays == comeDays) {
			int cometime = Integer.parseInt(comeTime);
			if(leaves < end) {
				int selectCnt2 = dao2.selectEndWork(map);
				if(selectCnt2 == 0) {
					int insertCnt2 = dao2.ealryWorkEnd(username);
					if(insertCnt2 == 0) {
						if(Hour > 9) {
							dao2.lateWorkStart(username);
						}
						else {
							dao2.StartWork(username);
						}
					}
				}
				else if(selectCnt2 == 1) {
					if(Hour > 18) {
						dao2.EndWork(username);
					}
					else {
						dao2.ealryWorkEnd(username);
					}
				}
			}
			else if(leaves > end) {
				int selectCnt2 = dao2.selectEndWork(map);
				if(selectCnt2 == 0) {
					int insertCnt2 = dao2.EndWork(username);
					if(insertCnt2 == 0) {
					}
				}
			}
			else if(cometime < time) {
				int selectCnt = dao2.selectWork(map);
				if(selectCnt == 0) {
					int insertCnt = dao2.StartWork(username);
					if(insertCnt == 0) {
					}
				}
			}
		}
 
	}

	//물품구매 목록
	@Override
	public void materialList(HttpServletRequest req, Model model) {
		List<MaterialVO> dto = dao.getMaterialList();
		
		model.addAttribute("dto", dto);
	}
	
	//암호화폐 예산 편성목록 가져오기
	public List<HashVO> selectDept(HttpServletRequest req, Model model) {
		String department_code = req.getParameter("d_name");
		List<HashVO> vo = dao.selectHashDept(department_code);
		return vo;
	}

	//물품판매목록
	@Override
	public void productList(HttpServletRequest req, Model model) {
		List<ProductVO> shop = dao.getProductList();
		
		model.addAttribute("shop", shop);
	}

	//물품 상세페이지
	@Override
	public void productDetailList(HttpServletRequest req, Model model) {
		
			String product_code = req.getParameter("product_code");
			ProductVO shop = dao.gerProductDetail(product_code);
			
			model.addAttribute("shop", shop);
	}
	
	
	//암호화폐로 산 목록 뿌리기
	@Override
	public void selectMaterals(HttpServletRequest req, Model model) {
		
		List<Material_VO> vo = dao.selectMateral();
		
		model.addAttribute("dto", vo);
	}
	
	// ST_contrast_pp 검색 기능
	@Override
	public void getcontrast(Model model) {
		List<SalelistVO> list = dao.getContrast();
		List<SalelistVO> list2 = dao.getContrast2();
		for(int i = 1 ; i < 13; i++) {
			if(i<10) {
				model.addAttribute("amount0"+i, 0);
				model.addAttribute("price0"+i, 0);
			}else {
				model.addAttribute("amount"+i, 0);
				model.addAttribute("price"+i, 0);
			}
		}
		for(int i = 0 ; i < list.size(); i++) {
			model.addAttribute("amount"+list.get(i).getMonth(), list.get(i).getAmount());
			model.addAttribute("price"+list.get(i).getMonth(),list.get(i).getPrice());
		}
		for(int i = 1 ; i < 13; i++) {
			if(i<10) {
				model.addAttribute("aamount0"+i, 0);
				model.addAttribute("aprice0"+i, 0);
			}else {
				model.addAttribute("aamount"+i, 0);
				model.addAttribute("aprice"+i, 0);
			}
		}
		for(int i = 0 ; i < list2.size(); i++) {
			model.addAttribute("aamount"+list2.get(i).getMonth(), list2.get(i).getAamount());
			model.addAttribute("aprice"+list2.get(i).getMonth(),list2.get(i).getAprice());
		}
	}

	//사내메신저 사원 찾기
	@Override
	public List<MsgVO> selectMsgUser(HttpServletRequest req, Model model) {
		String e_name = req.getParameter("e_name");
		String department_name = req.getParameter("department_name");
		
		Map<String, Object> map = new HashMap<>();
		map.put("e_name", e_name);
		map.put("department_name", department_name);
		
		List<MsgVO> vo = dao.selectUserMsg(map);
		
		return vo;
	}

	//사내 메신저 입력 폼
	@Override
	public void MsgWriteForm(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");
		MsgVO vo = dao.WriteForm(username);
		
		model.addAttribute("vo", vo);
	}
	

	// 사내 입력폼 작성 완료
	@Override
	public void Msg_Write_Pro(HttpServletRequest req, Model model) {
		String to_user = req.getParameter("to_user");
		String content = req.getParameter("msg_content");
		String from_user = req.getParameter("from_user");
		
		MsgVO vo = new MsgVO();
		vo.setMsg_content(content);
		vo.setTo_user(to_user);
		vo.setFrom_user(from_user);
		
		int insertCnt = dao.WritePro(vo);
		
		model.addAttribute("insertCnt", insertCnt);
		
	}

	//부서 지갑 가져오기
	@Override
	public String department_wallet_Search(HttpServletRequest req, Model model) {
		String dept_code = req.getParameter("dept_code");
		BlockChainVO vo = dao.getGroupCode(dept_code);
		
		String wallet = vo.getWallet_code();
		
		return wallet;
	}
	
	@Override
	public String department_price_req(HttpServletRequest req) {
		String price = req.getParameter("money");
		return price;
	}
	
	//예산편성 DB Insert
	@Override
	public void InsertDBbudget(HttpServletRequest req, String hash) {
		String dept_code = req.getParameter("dept_code");
		String purpose = req.getParameter("purpose");
		
		HashVO vos = new HashVO();
		vos.setDepartment_code(dept_code);
		vos.setE_subject(purpose);
		vos.setE_hashcode(hash);
		
		int insertCnt = dao.insertLog(vos);
		if(insertCnt == 1) {
			System.out.println("등록되었습니다.");
		}
	}
}
