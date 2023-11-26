<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>   
<!DOCTYPE html>
<html>
<head>

<title>Admin Check Request</title>
<c:import url="../common/header.jsp"></c:import>
</head>
<body>

    <!-- Nav bar -->
    <c:import url="../common/search.jsp"></c:import>
    <c:import url="../common/navbar.jsp"></c:import>
    
    <div class="bg-light" style="min-height: 500px;">
    
  	<div class="text-center fw-bold	 fs-3 mb-2 text-decoration-underline">User Request Books</div>
    
    <table class="table table-dark table-striped">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">Book Name</th>
	      <th scope="col">Author Name</th>
	      <th scope="col">User Name</th>
	      <th scope="col">Note</th>
	      <th scope="col"></th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:set var="count" value="0"></c:set>
	  	<c:forEach var="req" items="${adminRequest }">
		    <tr>
		      <th scope="row"><c:out value="${count=count+1 }"></c:out></th>
		      <td>${req.bookName }</td>
		      <td>${req.authorName }</td>	      
		      <td>${req.note }</td>
		      <td>${req.userName }</td>
		      <td><a class="btn btn-primary bg-success" href="book?mode=REQUEST-CREATE&id=${req.id }" >Create</a>  
		      <a class="btn btn-primary bg-danger" href="book?mode=REQUEST-DELETE&id=${req.id }" >Delete</a></td> 
		    </tr>
	    </c:forEach>
	    
	    <c:if test="${adminRequest.isEmpty() }">
	    	 <tr>
		      <th scope="row"></th>
		      <td>No Data To Show</td>
		      <td>No Data To Show</td>	      
		      <td>No Data To Show</td>
		      <td>No Data To Show</td>
		      <td></td>
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