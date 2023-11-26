<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>

<title>Home Page</title>
<c:import url="../common/header.jsp"></c:import>
	
</head>
<body class="bg-light">
	
    <!-- Nav bar -->
    <c:import url="../common/search.jsp"></c:import>
    <c:import url="../common/navbar.jsp"></c:import>
    

    <!--card-->
    <div class="d-flex justify-content-center" style="min-height: 450px;">
    <section id="card-Holder" class="mt-5 mb-5">
      <div class="container-lg align-items-center justify-content-center">
         <div class="row">
         
         <c:forEach var="book" items="${books }">

         <c:url var="detailsLink" value="book">
				<c:param name="mode" value="SINGLE" />
				<c:param name="id" value="${ book.id }" />
		 </c:url>
		 
		 <c:url var="orderLink" value="book">
				<c:param name="mode" value="OREDER-BOOK" />
				<c:param name="bookId" value="${ book.id }" />
				<c:param name="bookName" value="${ book.name }" />
				<c:param name="authorName" value="${ book.author }" />
				<c:param name="price" value="${ book.price }" />
		 </c:url>
		 
               
          <div class="card col-12 col-sm-8 col-md-4 col-lg-3 mb-2" style="border-radius: 15px; border-color: #878787;">
            <img src="${book.image }" class="card-img-top" alt="book">
            <div class="card-body text-center">
              <h4 class="card-title">${book.name }</h4>
              <h5 class="card-title">${book.author }</h5>
              <p class="card-text">
              
              	<span class="text-primary display-6">
              		<fmt:formatNumber value="${book.price }" type="currency" maxFractionDigits="2"/>
              	
              	</span>
              </p>

              <p class="card-text">${ fn:length(book.review) gt 100 ? fn:substring(book.review,0,100) : book.review }....</p>
              <a href="${orderLink }" class="btn btn-success"><i class="bi bi-cart3"></i>  Add to Cart</a>
              <a href="${detailsLink }" class="btn btn-primary">view more</a>
            </div>
          </div>
          
          </c:forEach>
          
          <c:if test="${books.isEmpty() }">
          	<h3>No Book To Show</h3>
          </c:if>
          
        </div>
      </div>
    </section>
	</div>


    <!--footer-->
    <c:import url="../common/footer.jsp"></c:import>
    
    <c:import url="../common/scriptlink.jsp" />
</body>
</html>