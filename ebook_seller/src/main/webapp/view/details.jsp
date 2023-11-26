<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>

<title>Detail Page</title>
<c:import url="../common/header.jsp"></c:import>
<style>
	#img img{
        	width: 308px;
            height: 475px;
        }
	@media screen and (max-width: 1350px) {
		#img {
			width: 400px;
		}
		#img img{
        	
            margin-bottom: 5px;
        }
        
		#img a{
	        	display: inline-block;
	        	height: 40px;
	        	width: 100px;
	        	margin-bottom: 5px;
	        }
	    
        }
	@media screen and (min-width: 1350px) {
		#img img{
        	
            margin-bottom: 5px;
        }
        
        #img{
            display: inline-block;
            position: absolute;
            top: 200px; 
                       
        }
       
        #img a{
        	display: block;
        	height: 40px;
        	margin-bottom: 5px;
        }
        #text{
            width: 70%;
            display: inline-block;
            position: relative;
            left: 25%;
            
        }
     }   
    </style>
</head>
<body class="bg-light">

	    <!-- Nav bar -->
	<c:import url="../common/search.jsp"></c:import>
    <c:import url="../common/navbar.jsp"></c:import>
    
    <c:choose>
    	<c:when test="${fn:contains(user.role,'admin') }">
    		<div class="container-fluid mt-5 mb-5" id="containerDiv">
	        	<div id="img" class="ms-5">
		            <img src="${book.image }" alt="book">
		            
		            <c:url var="updateLink" value="book">
						<c:param name="mode" value="LOAD"></c:param>
						<c:param name="id" value="${book.id }"></c:param>
					</c:url>
		            
		            <c:url var="delete" value="book">
						<c:param name="mode" value="DELETE" />
						<c:param name="id" value="${ book.id }" />
		 			</c:url>
		            
		            <a href="${updateLink }" class="btn btn-primary">Update</a>
		            <a href="${delete }" class="btn btn-danger">Delete</a>
	        	</div>
        		<div id="text" class="ms-5">
		            <p class="fs-4">Title : <span class="fs-3">${book.name }</span></p>
		            <p class="fs-4">Author : <span class="fs-3">${book.author }</span></p>
		            <p class="fs-4">Rating : <span class="fs-3">${book.rating }</span></p>
		            <p class="fs-4">Release Date : <span class="fs-3">${book.releaseDate }</span></p>
		            <p class="fs-4">Genres : <span class="fs-3">${book.genres }</span></p>
		            <p class="card-text fs-3">
		              	Price :  
		              	<span class="text-primary display-6">
		              		<fmt:formatNumber value="${book.price }" type="currency" maxFractionDigits="2"/>
		              	
		              	</span>
		            </p>
		            <p class="fs-3 ">Review :</p>
		            <p class="fs-4">${ book.review }</p>
            
        		</div>
   	 		</div>
    	</c:when>
    	
    	<c:otherwise>
    		<div class="container-fluid mt-5 mb-5" >
	        	<div id="img" class="ms-5">
		            <img src="${book.image }" alt="book">
		            
		            <c:url var="orderLink" value="book">
						<c:param name="mode" value="OREDER-BOOK" />
						<c:param name="bookId" value="${ book.id }" />
						<c:param name="bookName" value="${ book.name }" />
						<c:param name="authorName" value="${ book.author }" />
						<c:param name="price" value="${ book.price }" />
		 			</c:url>
		 
		            <a href="${orderLink }" class="btn btn-success"><i class="bi bi-cart3"></i>  Add to Cart</a>
	        	</div>
        		<div id="text" class="ms-5">
		            <p class="fs-4">Title : <span class="fs-3">${book.name }</span></p>
		            <p class="fs-4">Author : <span class="fs-3">${book.author }</span></p>
		            <p class="fs-4">Rating : <span class="fs-3">${book.rating }</span></p>
		            <p class="fs-4">Release Date : <span class="fs-3">${book.releaseDate }</span></p>
		            <p class="fs-4">Genres : <span class="fs-3">${book.genres }</span></p>
		            <p class="card-text fs-3">
		              	Price :  
		              	<span class="text-primary display-6">
		              		<fmt:formatNumber value="${book.price }" type="currency" maxFractionDigits="2"/>
		              	
		              	</span>
		            </p>
		            <p class="fs-3 ">Review :</p>
		            <p class="fs-4">${ book.review }</p>
            
        		</div>
   	 		</div>
    	</c:otherwise>
    </c:choose>
    
    

    
        <!--footer-->
    <c:import url="../common/footer.jsp"/>
    
    <c:import url="../common/scriptlink.jsp" />
</body>
</html>