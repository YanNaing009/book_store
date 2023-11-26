<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<title>Add Book Page</title>
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
                       <h3>Add Book</h3>                      
	                   <c:if test="${not empty success and success }">
	                   	<p class="text-success"> Book is updated!</p>
	                   </c:if>
	                   
	                   <c:if test="${not empty success and not success }">
	                   	<p class="text-danger"> Book updating is fail!</p>
	                   </c:if>
                        
                        <input type="hidden" name="mode" value="CREATE">
                        
                         <div class="col-12">
                            <label>Title</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-book"></i>
                                </span>
                             <c:choose>
                             	<c:when test="${requestBook != null }">
                             		<input type="hidden" name="reqId" value="${requestBook.id }">
                             		<input type="text" name="name" class="form-control" placeholder="Title" required="required" value="${requestBook.bookName }">
                             	</c:when>
                             	<c:otherwise>
                             		<input type="text" name="name" class="form-control" placeholder="Title" required="required">
                             	</c:otherwise>
                             </c:choose>
                                
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <label>Author</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-person-circle"></i>
                                </span>
                             <c:choose>
	                             <c:when test="${requestBook != null }">
	                             	<input type="text" name="author" placeholder="Author" class="form-control"required="required" value="${requestBook.authorName }">
	                             </c:when>
	                             <c:otherwise>
	                             	<input type="text" name="author" placeholder="Author" class="form-control"required="required">
	                             </c:otherwise>
                             </c:choose>
                            </div>
                        </div>
                        
                         <div class="col-12">
                            <label>Price</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    $
                                </span>
                                <input type="text" name="price" placeholder="Price" class="form-control"required="required">
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <label>Rating</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                   <i class="bi bi-star-fill"></i>
                                </span>
                                <input type="text" name="rating" placeholder="rating" class="form-control" required="required">
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <label>Release Date</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                   <i class="bi bi-calendar"></i>
                                </span>
                                <input type="date" name="releaseDate" placeholder="Release Date" class="form-control" required="required">
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <label>Genres</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                   <i class="bi bi-bookmark"></i>
                                </span>
                                <input type="text" name="genres" placeholder="Genres" class="form-control" required="required">
                            </div>
                        </div>                        
                        
                        <div class="col-12">
                            <label>Image</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-file-image"></i>
                                </span>
                                <input type="url" name="image" placeholder="Image URL" class="form-control" required="required">
                            </div>
                        </div>                                         
                        
                         <div class="col-12">
                         	<label>Review</label>
							<textarea rows="12" class="form-control" name="review" required="required">
								
							</textarea>                       
                        </div>
                        
                        
                        <div class="col-12">
                            <button type="submit" class="btn btn-dark float-end">Create</button>
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