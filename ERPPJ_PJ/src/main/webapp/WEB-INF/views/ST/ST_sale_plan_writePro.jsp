<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="../setting.jsp" %>
        <!-- Table datatable css -->
    </head>

    <body>
	<c:if test="${salePlanWrite == 0}">
		<script type="text/javascript">
			alert("판매 계획 등록을 실패하였습니다.");
		</script>
	</c:if>
	
	<c:if test="${salePlanWrite != 0}">
		<script type="text/javascript">
			alert("판매 계획 등록이 완료되었습니다.");
			window.location='ST_sale_plan';
		</script>
	</c:if>
          

        <%@ include file="../setting2.jsp" %>
        
    </body>
  
        
</html>