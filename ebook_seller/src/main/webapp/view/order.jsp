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
<body class="bg-light">

    <!-- Nav bar -->
    <c:import url="../common/search.jsp"></c:import>
    <c:import url="../common/navbar.jsp"></c:import>
    
  
    
	    <div class="col-lg-6 me-4" style="min-height: 500px; display: inline-block; ">
	    
	    <div class="text-center fw-bold fs-3 mb-2 text-decoration-underline">Cart List</div>
	    
	    <table class="table table-dark table-striped">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Book Name</th>
		      <th scope="col">Author Name</th>
		      <th scope="col">Price</th>
		      <th scope="col">Date</th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  
		  <tbody>
		  	<c:set var="count" value="0" />
	    	<c:set var="total" value="0.0" />
		  	<c:forEach var="userOrder" items="${orderList }">
			    <tr>
			      <th scope="row"><c:out value="${count=count + 1}" /></th>
			      <td>${userOrder.bookName }</td>
			      <td>${userOrder.authorName }</td>	  
			      <td>${userOrder.price } $</td>    
			      <td>${userOrder.date }</td>
			      <td> 
			      <a class="btn btn-primary bg-danger" href="book?mode=ORDER-REMOVE&id=${userOrder.id }" >Remove</a>
			      </td> 
			    </tr>
			    <c:set var="total" value="${total + userOrder.price}" />
		    </c:forEach>
		    
		    <c:if test="${!orderList.isEmpty() }">
				
		    	<tr>
		    		<th scope="row"></th>
		    		<td>Total Price :</td> 
			      <td></td>
			         
			      <td>
			      	<fmt:formatNumber value=" ${total }"
						maxFractionDigits="2" /> $
				  </td>
			      <td></td>
			      <td> </td>
		    	</tr>
		    	
		    </c:if>
		    	
		    
		    <c:if test="${orderList.isEmpty() }">
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
	
	<div class="col-lg-6" style="display: inline-block; width: 600px;">
		<form class="row g-3">
		
		<input type="hidden" name="mode" value="SHOW-HISTORY-FORM">
		 
		  <div class="col-12">
		    <label for="inputAddress" class="form-label">Address</label>
		    <input type="text" class="form-control bg-light" name="address" placeholder="1234 Main St" required="required" value="${user.address }">
		  </div>
	
		  <div class="col-md-4">
		    <label for="inputCity" class="form-label">City</label>
		    <input type="text" class="form-control bg-light" name="city" required="required" value="${user.city }">
		  </div>
		  <div class="col-md-3">
		    <label for="payment" class="form-label">Payment type</label>
		    <select class="form-select bg-light">
		      <option selected>KBZ pay</option>
		    </select>
		  </div>
		  <div class="col-md-5">
		    <label for="inputPayment" class="form-label">Payment No.</label>
		    <input type="text" class="form-control bg-light" name="payment" required="required"  value="${user.payment }">
		  </div>
		<div class="col-12">
			<a class="btn btn-warning float-end" href="book">Continue Shopping</a>
	    	<button type="submit" class="btn btn-success float-end me-3" style="width: 100px;">Buy</button>
	    	
	  	</div>
		</form>
	</div>  
 
    <!--footer-->
    <c:import url="../common/footer.jsp"></c:import>
    
    <c:import url="../common/scriptlink.jsp" />	    
</body>
</html>