package com.pj.erp.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pj.erp.service.CT_Service;
import com.pj.erp.service.ERPService;
import com.pj.erp.service.HR_Service;
import com.pj.erp.service.MateralServiceImpl;
import com.pj.erp.service.OriginService;
import com.pj.erp.service.ProductSell;
import com.pj.erp.vo.HashVO;
import com.pj.erp.vo.MsgVO;

@Controller
public class ERPController {
	
	@Autowired
	ERPService service; 
	
	@Autowired 
	HR_Service service2;
	
	@Autowired 
	CT_Service CT;
	
	@Autowired
	MateralServiceImpl MSI;
	
	@Autowired
	OriginService OS;
	
	@Autowired
	ProductSell PS;
	
	private static final Logger logger = LoggerFactory.getLogger(ERPController.class);
	
	@RequestMapping(value="/", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate ); 
		 
		return "login";
	}
	
 
	@RequestMapping("index")
	public String index(Locale locale, Model model) {
		logger.info("log => index");
		service.getcontrast(model);
		return "index";
	}
	
	@RequestMapping("index2")
	public String index2(HttpServletRequest req, Model model) {
		logger.info("log => index2");
		service.testreg(req, model); 
		return "index";
	}
	
	@RequestMapping("nfc") 
	public String nfc(HttpServletRequest req, Model model )  {
		logger.info("log => nfc");
		service.nfc(req, model);
 
		 
		return "nfc";
	}
 
	
	@RequestMapping("admin-grid")
	public String admingrid(Locale locale, Model model) {
		logger.info("log => admin-grid"); 
		return "admin-grid";  
	}
	
	@RequestMapping("admin-nestable")
	public String adminnestable(Locale locale, Model model) {
		logger.info("log => admin-nestable");
		
		return "admin-nestable";
	}
	
	@RequestMapping("admin-rangeslider")
	public String adminrangeslider(Locale locale, Model model) {
		logger.info("log => admin-rangeslider");
		
		return "admin-rangeslider";
	}
	
	@RequestMapping("admin-ratings")
	public String adminratings(Locale locale, Model model) {
		logger.info("log => admin-ratings");
		
		return "admin-ratings";
	}
	
	@RequestMapping("admin-sweet-alert")
	public String adminsweetalert(Locale locale, Model model) {
		logger.info("log => admin-sweet-alert");
		
		return "admin-sweet-alert";
	}
	
	@RequestMapping("admin-widqets")
	public String adminwidqets(Locale locale, Model model) {
		logger.info("log => admin-widqets");
		
		return "admin-widqets"; 
	}
	
	@RequestMapping("calender")
	public String calender(Locale locale, Model model) {
		logger.info("log => calender");
		
		return "calender";
	} 
	
	@RequestMapping("charts-c3")
	public String chartsc3(Locale locale, Model model) {
		logger.info("log => charts-c3");
		
		return "charts-c3";
	}
	
	@RequestMapping("charts-chartist")
	public String chartschartist(Locale locale, Model model) {
		logger.info("log => charts-chartist");
		
		return "charts-chartist";
	}
	
	@RequestMapping("charts-chartjs")
	public String chartschartjs(Locale locale, Model model) {
		logger.info("log => charts-chartjs");
		
		return "charts-chartjs";
	}
	
	@RequestMapping("charts-flot")
	public String chartsflot(Locale locale, Model model) {
		logger.info("log => charts-flot");
		
		return "charts-flot";
	}
	
	@RequestMapping("charts-knob")
	public String chartsknob(Locale locale, Model model) {
		logger.info("log => charts-knob");
		
		return "charts-knob";
	}
	
	@RequestMapping("charts-morris")
	public String chartsmorris(Locale locale, Model model) {
		logger.info("log => charts-morris");
		
		return "charts-morris"; 
	}
	
	@RequestMapping("charts-google")
	public String chartsgoogle(Locale locale, Model model) {
		logger.info("log => charts-google");
		
		return "charts-google";
	}
	
	@RequestMapping("charts-sparkline")
	public String chartssparkline(Locale locale, Model model) {
		logger.info("log => charts-sparkline");
		
		return "charts-sparkline";
	}
	
	@RequestMapping("extras-about")
	public String extrasabout(Locale locale, Model model) {
		logger.info("log => extras-about");
		
		return "extras-about";
	}
	
	@RequestMapping("extras-coming-soon")
	public String extrascomingsoon(Locale locale, Model model) {
		logger.info("log => extras-coming-soon");
		
		return "extras-coming-soon";
	}
	
	@RequestMapping("extras-contact")
	public String extrascontact(Locale locale, Model model) {
		logger.info("log => extras-contact");
		
		return "extras-contact";
	}
	
	@RequestMapping("extras-faq")
	public String extrasfaq(Locale locale, Model model) {
		logger.info("log => extras-faq");
		
		return "extras-faq";
	}
	
	
	@RequestMapping("extras-invoice")
	public String extrasinvoice(Locale locale, Model model) {
		logger.info("log => extras-invoice");
		
		return "extras-invoice";
	}
	
	@RequestMapping("extras-maintenance")
	public String extrasmaintenance(Locale locale, Model model) {
		logger.info("log => extras-maintenance");
		
		return "extras-maintenance";
	}
	@RequestMapping("extras-members")
	public String extrasmembers(Locale locale, Model model) {
		logger.info("log => extras-members");
		
		return "extras-members";
	}
	
	@RequestMapping("extras-pricing")
	public String extraspricing(Locale locale, Model model) {
		logger.info("log => extras-pricing");
		
		return "extras-pricing";
	}
	
	@RequestMapping("extras-timeline")
	public String extrastimeline(Locale locale, Model model) {
		logger.info("log => extras-timeline");
		
		return "extras-timeline";
	}
	
	@RequestMapping("form-advanced")
	public String formadvanced(Locale locale, Model model) {
		logger.info("log => form-advanced");
		
		return "form-advanced";
	}
	
	@RequestMapping("form-elements")
	public String formelements(Locale locale, Model model) {
		logger.info("log => form-elements");
		
		return "form-elements";
	}
	
	@RequestMapping("form-mask")
	public String formmask(Locale locale, Model model) {
		logger.info("log => form-mask");
		
		return "form-mask";
	}
	
	@RequestMapping("form-pickers")
	public String formpickers(Locale locale, Model model) {
		logger.info("log => form-pickers");
		
		return "form-pickers";
	}
	
	@RequestMapping("form-quilljs")
	public String formquilljs(Locale locale, Model model) {
		logger.info("log => form-quilljs");
		
		return "form-quilljs";
	}
	
	@RequestMapping("form-summernote")
	public String formsummernote(Locale locale, Model model) {
		logger.info("log => form-summernote");
		
		return "form-summernote";
	}
	
	@RequestMapping("form-uploads")
	public String formuploads(Locale locale, Model model) {
		logger.info("log => form-uploads");
		
		return "form-uploads";
	}
	@RequestMapping("form-validation")
	public String formvalidation(Locale locale, Model model) {
		logger.info("log => form-validation");
		
		return "form-validation";
	}
	
	@RequestMapping("form-wizard")
	public String formwizard(Locale locale, Model model) {
		logger.info("log => form-wizard");
		
		return "form-wizard";
	}
	
	@RequestMapping("icons-colored")
	public String iconscolored(Locale locale, Model model) {
		logger.info("log => icons-colored");
		
		return "icons-colored";
	}
	
	@RequestMapping("icons-dripicons")
	public String iconsdripicons(Locale locale, Model model) {
		logger.info("log => icons-dripicons");
		
		return "icons-dripicons";
	}
	
	@RequestMapping("icons-feather")
	public String iconsfeather(Locale locale, Model model) {
		logger.info("log => icons-feather");
		
		return "icons-feather";
	}
	
	@RequestMapping("icons-fontawesome")
	public String iconsfontawesome(Locale locale, Model model) {
		logger.info("log => icons-fontawesome");
		
		return "icons-fontawesome";
	}
	
	@RequestMapping("icons-materialdesign")
	public String iconsmaterialdesign(Locale locale, Model model) {
		logger.info("log => icons-materialdesign");
		
		return "icons-materialdesign";
	}
	
	@RequestMapping("layouts-boxed")
	public String layoutsboxed(Locale locale, Model model) {
		logger.info("log => layouts-boxed");
		
		return "layouts-boxed";
	}
	
	@RequestMapping("layouts-dark-sidebar")
	public String layoutsdarksidebar(Locale locale, Model model) {
		logger.info("log => layouts-dark-sidebar");
		
		return "layouts-dark-sidebar";
	}
	
	@RequestMapping("layouts-sidebar-collapsed")
	public String layoutssidebarcollapsed(Locale locale, Model model) {
		logger.info("log => layouts-sidebar-collapsed");
		
		return "layouts-sidebar-collapsed";
	}
	
	@RequestMapping("layouts-small-sidebar")
	public String layoutssmallsidebar(Locale locale, Model model) {
		logger.info("log => layouts-small-sidebar");
		
		return "layouts-small-sidebar";
	}
	
	@RequestMapping("maps-google")
	public String mapsgoogle(Locale locale, Model model) {
		logger.info("log => maps-google");
		
		return "maps-google";
	}
	
	@RequestMapping("maps-mapael")
	public String mapsmapael(Locale locale, Model model) {
		logger.info("log => maps-mapael");
		
		return "maps-mapael";
	}
	
	@RequestMapping("maps-vector")
	public String mapsvector(Locale locale, Model model) {
		logger.info("log => maps-vector");
		
		return "maps-vector";
	}
	
	@RequestMapping("pages-404-alt")
	public String pages404alt(Locale locale, Model model) {
		logger.info("log => pages-404-alt");
		
		return "pages-404-alt";
	}
	
	@RequestMapping("pages-404")
	public String pages404(Locale locale, Model model) {
		logger.info("log => pages-404");
		
		return "pages-404";
	}
	
	@RequestMapping("pages-500")
	public String pages500(Locale locale, Model model) {
		logger.info("log => pages-500");
		
		return "pages-500";
	}
	//
	
	@RequestMapping("tables-datatable")
	public String tablesdatatable(Locale locale, Model model) {
		logger.info("log => tables-datatable");
		
		return "tables-datatable";
	}
	
	//
	@RequestMapping("pages-comfirm-mail")
	public String pagescomfirmmail(Locale locale, Model model) {
		logger.info("log => pages-comfirm-mail");
		
		return "pages-comfirm-mail";
	}
	
	@RequestMapping("pages-lock-screen")
	public String pageslockscreen(Locale locale, Model model) {
		logger.info("log => pages-lock-screen");
		
		return "pages-lock-screen";
	}
	
	@RequestMapping("pages-login")
	public String pageslogin(Locale locale, Model model) {
		logger.info("log => pages-login");
		
		return "pages-login";
	}
	
	@RequestMapping("pages-logout")
	public String pageslogout(Locale locale, Model model) {
		logger.info("log => pages-logout");
		
		return "pages-logout";
	}
	
	@RequestMapping("pages-recoverpw")
	public String pagesrecoverpw(Locale locale, Model model) {
		logger.info("log => pages-recoverpw");
		
		return "pages-recoverpw";
	}
	
	@RequestMapping("pages-starter")
	public String pagesstarter(Locale locale, Model model) {
		logger.info("log => pages-starter");
		
		return "pages-starter";
	}
	
	@RequestMapping("tables-basic")
	public String tablesbasic(Locale locale, Model model) {
		logger.info("log => tables-basic");
		
		return "tables-basic";
	}
	
	@RequestMapping("tables-layouts")
	public String tableslayouts(Locale locale, Model model) {
		logger.info("log => tables-layouts");
		
		return "tables-layouts";
	}
	
	@RequestMapping("tables-tablesaw")
	public String tablestablesaw(Locale locale, Model model) {
		logger.info("log => tables-tablesaw");
		
		return "tables-tablesaw";
	}
	
	@RequestMapping("tables-responsive")
	public String tablesresponsive(Locale locale, Model model) {
		logger.info("log => tables-responsive");
		
		return "tables-responsive";
	}
	
	@RequestMapping("tables-editable")
	public String tableseditable(Locale locale, Model model) {
		logger.info("log => tables-editable");
		
		return "tables-editable";
	}
	
	@RequestMapping("ui-bootstrap")
	public String uibootstrap(Locale locale, Model model) {
		logger.info("log => ui-bootstrap");
		
		return "ui-bootstrap";
	}
	
	@RequestMapping("ui-buttons")
	public String uibuttons(Locale locale, Model model) {
		logger.info("log => ui-buttons");
		
		return "ui-buttons";
	}
	
	@RequestMapping("ui-cards")
	public String uicards(Locale locale, Model model) {
		logger.info("log => ui-cards");
		
		return "ui-cards";
	}
	
	@RequestMapping("ui-carousel")
	public String uicarousel(Locale locale, Model model) {
		logger.info("log => ui-carousel");
		
		return "ui-carousel";
	}
	
	@RequestMapping("ui-checkbox-radio")
	public String uicheckboxradio(Locale locale, Model model) {
		logger.info("log => ui-checkbox-radio");
		
		return "ui-checkbox-radio";
	}
	
	@RequestMapping("ui-images")
	public String uiimages(Locale locale, Model model) {
		logger.info("log => ui-images");
		
		return "ui-images";
	}
	
	@RequestMapping("ui-modals")
	public String uimodals(Locale locale, Model model) {
		logger.info("log => ui-modals");
		
		return "ui-modals";
	}
	
	@RequestMapping("ui-notifications")
	public String uinotifications(Locale locale, Model model) {
		logger.info("log => ui-notifications");
		
		return "ui-notifications";
	}
	
	@RequestMapping("ui-progressbars")
	public String uiprogressbars(Locale locale, Model model) {
		logger.info("log => ui-progressbars");
		
		return "ui-progressbars";
	}
	
	@RequestMapping("ui-tabs")
	public String uitabs(Locale locale, Model model) {
		logger.info("log => ui-tabs");
		
		return "ui-tabs";
	}
	
	@RequestMapping("ui-tooltips-popovers")
	public String uitooltipspopovers(Locale locale, Model model) {
		logger.info("log => ui-tooltips-popovers");
		
		return "ui-tooltips-popovers";
	}
	
	@RequestMapping("ui-typography")
	public String uitypography(Locale locale, Model model) {
		logger.info("log => ui-typography");
		
		return "ui-typography";
	}
	@RequestMapping("ui-video")
	public String uivideo(Locale locale, Model model) {
		logger.info("log => ui-video");
		
		return "ui-video"; 
	}
	
	//관리자 및 공통
	
	//로그인 페이지
	@RequestMapping("login") 
	public String login(Locale locale, Model model) {
		logger.info("log => login");
		
		return "login"; 
	}
	 
	// 권한 없을 경우 
	@RequestMapping("denied")
	public String denied(Locale locale, Model model) {
		logger.info("log => denied");
		
		return "denied"; 
	}
	
	// 블록체인 신청 입력
	@RequestMapping("FT_apply_input2")
	public String FT_apply_input2(Locale locale, Model model) {
		logger.info("log => FT_apply_input2");

		return "FT/FT_apply_input2";
	}
	
	// 블록체인 신청 입력처리
	@RequestMapping("FT_apply_input2_pro")
	public String FT_apply_input2_pro(HttpServletRequest req, Model model) {
		logger.info("log => FT_apply_input2_pro");
		
		try {
			MSI.budgetAdd(req, model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/*
		try {
			String wallet = service.department_wallet_Search(req, model);
			String price = service.department_price_req(req);
			String hash = MSI.BudgetAdd(wallet, price);
			service.InsertDBbudget(req, hash);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		return "FT/FT_plan2";
	}
	
	// 암호화폐 편성
	@RequestMapping("FT_plan2")
	public String FT_plan2(Locale locale, Model model) {
		logger.info("log => FT_plan2");

		return "FT/FT_plan2";
	}
	
	// 부서검색을 통한 가상화폐 편성 내역 가져오기
	@RequestMapping("FT_Ether_SelectDept")
	@ResponseBody
	public List<HashVO> FT_Ether_SelectDept(HttpServletRequest req, Model model) {
		logger.info("log => FT_Ether_SelectDept");
		List<HashVO> vo = service.selectDept(req, model);
		
		return vo;
	}
	
	// 재료 구매하는 페이지
	@RequestMapping("CM_productList")
	public String CM_productList(HttpServletRequest req, Model model) {
		logger.info("log => productList");
		service.materialList(req, model);
		return "page/productList"; 
	}
	
	//물품판매
	@RequestMapping("public_shop")
	public String home(HttpServletRequest req, Model model) {
		logger.info("log => home");
		service.productList(req, model);
		
		return "page/home"; 
	}
	
	// 재료 구매.
	@RequestMapping("CM_InsertMaterialIo")
	public String CM_InsertMaterialIo(HttpServletRequest req, Model model){
		logger.info("log => InsertMaterialIo");
		try {
			OS.payOriginMaterial(req, model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.info("log => productList");
		service.materialList(req, model);
		return "page/productList"; 
	}
	
	// 재료 구매하는 페이지
	@RequestMapping("MF_materialsManagement2")
	public String MF_materialsManagement2(HttpServletRequest req, Model model) {
		logger.info("log => MF_materialsManagement2");
		
		service.selectMaterals(req, model);
		
		return "MF/MF_materialsManagement2"; 
	}
	
	//판매 상품 상세 productDetail
	@RequestMapping("public_productDetail")
	public String productDetail(HttpServletRequest req, Model model) {
		logger.info("log => productDetail");
		service.productDetailList(req, model);
		
		return "page/productDetail"; 
	}
	
	
	//판매 상품 구매처리
	@RequestMapping("CM_EproductBuy")
	public String EproductBuy(HttpServletRequest req, Model model) throws Exception {
		logger.info("log => EproductBuy");
		
		PS.SellProduct(req, model);
		
		return "page/insertResult"; 
	}
	
	//사내 메신저
	@RequestMapping("CM_MSGdeploy")
	public String MSGdeploy(HttpServletRequest req, Model model) throws Exception {
		logger.info("log => MSGdeploy");
		
		return "index2"; 
	}
	
	//사내메신저 수신자 검색
	@RequestMapping("CM_MSG_Select_User")
	@ResponseBody
	public List<MsgVO> MSG_Select_User(HttpServletRequest req, Model model) {
		logger.info("log => MSG_Select_User");
		
		List<MsgVO> vo = service.selectMsgUser(req, model);
		
		return vo;
	}
	
	//사내 메신저
	@RequestMapping("CM_MSG_Write_Form")
	public String MSG_Write_Form(HttpServletRequest req, Model model) throws Exception {
		logger.info("log => MSG_Write_Form");
		service.MsgWriteForm(req, model);
		return "MSG_Write_Form"; 
	}
	
	//사내 메신저 작성 후 insert
	@RequestMapping("CM_MsgWritePro")
	public String MsgWritePro(HttpServletRequest req, Model model) throws Exception {
		logger.info("log => MsgWritePro");
		service.Msg_Write_Pro(req, model);
		return "Msg_WritePro"; 
	}
	

	//A/S 입력 폼
	@RequestMapping("CM_write_AS")
	public String CT_write_AS(HttpServletRequest req, Model model) {
		logger.info("log => CT_write_AS");
		CT.selectDeptS(req, model);
		return "CT/CT_write_AS";
	}
	
	//AS등록
	@RequestMapping("CM_AS_add")
	@ResponseBody
	public int CT_AS_add(HttpServletRequest req, Model model) {
		logger.info("log => CT_AS_add");
		int insertCnt = CT.AS_insert_ct(req, model);
		return insertCnt;
	}
	
	
	// 에러 처리용 컨트롤러 
	@RequestMapping("cm_400")
	public String cm_error_400(Locale locale, Model model) {
		logger.info("ERPController => cm_error_400");
		model.addAttribute("msg","400");
		return "cm";
	}
	@RequestMapping("cm_404")
	public String cm_error_404(Locale locale, Model model) {
		logger.info("ERPController => cm_error_404");
		model.addAttribute("msg","404");
		return "cm";
	}
	@RequestMapping("cm_500")
	public String cm_error_500(Locale locale, Model model) {
		logger.info("ERPController => cm_error_500");
		model.addAttribute("msg","500");
		return "cm";
	}
	
}
