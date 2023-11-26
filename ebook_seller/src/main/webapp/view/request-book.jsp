<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>Request Book Page</title>
<c:import url="../common/header.jsp"></c:import>
<style type="text/css">
	#inputform{
		width: 500px;
		border-radius: 20px;
		margin-top: 100px;;
		margin-bottom: 100px;
		background-color: #a9a9a9
	}
	#div{
		width: 500px;		
	}
	
</style>

</head>
<body>

    <!-- Nav bar -->
    <c:import url="../common/search.jsp"></c:import>
    <c:import url="../common/navbar.jsp"></c:import>	
	<div class="container" id="div">
		<form class="row g-3" id="inputform">
		
			<c:if test="${not empty success and success }">
	            <p class="text-success"> Book request is success!</p>
	            </c:if>       
	            <c:if test="${not empty success and not success }">
	            <p class="text-danger"> Book requesting is fail!</p>
	        </c:if>
	        
			<input type="hidden" name="mode" value="REQUEST" />
			
		  <div class="col-md-6">
		    <label for="inputEmail4" class="form-label">Book Name</label>
		    <input type="text" placeholder="Bookname" class="form-control" name="bookname" id="inputEmail4" required="required">
		  </div>
		  <div class="col-md-6">
		    <label for="inputPassword4" class="form-label">Author Name</label>
		    <input type="textt" class="form-control" placeholder="Author Name" name="authorname" id="inputPassword4" required="required">
		  </div>	  
		  <div class="col-12">
	         <label class="form-label">Note</label>
			<textarea rows="5" class="form-control" name="note"></textarea>                       
	     </div>
		  
		  <div class="col-12">
		    <button type="submit" class="btn btn-primary float-end mb-4 me-3">Request</button>
		  </div>
		</form>
	</div>

    <!--footer-->
    <c:import url="../common/footer.jsp"></c:import>
    
    <c:import url="../common/scriptlink.jsp" />

</body>
</html>