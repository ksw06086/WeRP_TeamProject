<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="../setting.jsp" %>
        <!-- Table datatable css -->
    </head>

    <body>
	<c:if test="${saleListWrite == 0}">
		<script type="text/javascript">
			alert("판매 등록을 실패했습니다.");
		</script>
	</c:if>
	
	<c:if test="${saleListWrite != 0}">
		<script type="text/javascript">
			alert("판매 등록이 완료되었습니다.");
			opener.location.reload();
			close();
		</script>
	</c:if>
          

        <%@ include file="../setting2.jsp" %>
        
    </body>
  
        
</html>