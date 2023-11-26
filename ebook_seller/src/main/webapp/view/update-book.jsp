<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<title>Update Page</title>
<c:import url="../common/header.jsp"></c:import>

</head>
<body>
	<!-- navbar -->
	<c:import url="../common/adminnav.jsp"></c:import>
	
	<div class="container mb-5" >
        <div class="row">
            <div class="col-md-7 col-lg-4 offset-md-4">
                <div class="login-form mt-4 p-4" style="background-color: #a9a9a9; border-radius: 10px;">
                    <form action="book" method="post" class="row g-3">
                       <h3>Update Book</h3>
                       
	                   <c:if test="${not empty success and not success }">
	                   	<p class="text-danger"> Book updating is fail!</p>
	                   </c:if>
                        
                        <input type="hidden" name="mode" value="UPDATE">
                        <input type="hidden" name="id" value="${book.id }">
                        
                         <div class="col-12">
                            <label>Title</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-book"></i>
                                </span>
                                <input type="text" name="name" value="${book.name }" class="form-control"required="required">
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <label>Author</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-person-circle"></i>
                                </span>
                                <input type="text" name="author" value="${book.author }" class="form-control"required="required">
                            </div>
                        </div>
                        
                         <div class="col-12">
                            <label>Price</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    $
                                </span>
                                <input type="text" name="price" value="${book.price }" class="form-control"required="required">
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <label>Rating</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                   <i class="bi bi-star-fill"></i>
                                </span>
                                <input type="text" name="rating" value="${book.rating }" class="form-control" required="required">
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <label>Release Date</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                   <i class="bi bi-calendar"></i>
                                </span>
                                <input type="date" name="releaseDate" value="${book.releaseDate }" class="form-control" required="required">
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <label>Genres</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                   <i class="bi bi-bookmark"></i>
                                </span>
                                <input type="text" name="genres" value="${book.genres }" class="form-control" required="required">
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <label>Image</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-file-image"></i>
                                </span>
                                <input type="url" name="image" value="${book.image }" class="form-control" required="required">
                            </div>
                        </div>                                         
                        
                         <div class="col-12">
                         	<label>Review</label>
							<textarea rows="12" class="form-control" name="review" required="required">
								${book.review }
							</textarea>                       
                        </div>
                        
                        
                        <div class="col-12">
                            <button type="submit" class="btn btn-dark float-end">Update</button>
                        </div>
                    </form>  
                   </div>                  
               </div>
           </div>
       </div>
    
	
        <!--footer-->
    <c:import url="../common/footer.jsp"/>
    
    <c:import url="../common/scriptlink.jsp" />	
</body>
</html>