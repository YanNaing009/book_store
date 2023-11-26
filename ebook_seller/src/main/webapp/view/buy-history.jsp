<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>Order Page</title>

<c:import url="../common/header.jsp"></c:import>
</head>
<body>

    <!-- Nav bar -->
    <c:import url="../common/search.jsp"></c:import>
    <c:import url="../common/navbar.jsp"></c:import>
    
    <div class="bg-light" style="min-height: 500px;">
    
    <div class="text-center fw-bold fs-3 mb-2 text-decoration-underline">Buy History</div>
    
    <table class="table table-dark table-striped">

	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">Book Name</th>
	      <th scope="col">Author Name</th>
	      <c:if test="${checkAdmin }"><th scope="col">User Name</th></c:if> 
	      <th scope="col">Date</th>
	    </tr>
	  </thead>
	  
	  <tbody>
	  	<c:set var="count" value="0" />
	  	<c:forEach var="buyHistory" items="${buyHistoryList }">
		    <tr>
		      <th scope="row"><c:out value="${count=count + 1}" /></th>
		      <td>${buyHistory.bookName }</td>
		      <td>${buyHistory.authorName }</td>
		      <c:if test="${checkAdmin }"><td>${buyHistory.userName }</td></c:if>   
		      <td>${buyHistory.date }</td>
		    </tr> 
	    </c:forEach>
	    
	   
	    	
	    
	    <c:if test="${buyHistory.isEmpty() }">
	    	 <tr>
		      <th scope="row"></th>
		      <td>No Data To Show</td>
		      <td>No Data To Show</td>
		      <td>No Data To Show</td>	      
		      <c:if test="${checkAdmin }"><td>No Data To Show</td></c:if>  
		      <td>No Data To Show</td>
		      
		    </tr>
		</c:if>
		
		
	  </tbody>
</table>

</div>    
 
    <!--footer-->
    <c:import url="../common/footer.jsp"></c:import>
    
    <c:import url="../common/scriptlink.jsp" />	    
</body>
</html>