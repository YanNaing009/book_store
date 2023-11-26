<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/header.jsp" />
<title>SignUp Page</title>
<style type="text/css">
	.row input::placeholder{
		color: whitesmoke;
	}
	.row input{
		 background-color: #734F46;
		 color: whitesmoke;
	}
    .row input:focus {
         background-color: #734F46;
         color: whitesmoke;
    }
	.row span{
		background-color: transparent;
		color: whitesmoke;
	}
</style>
</head>
<body class="bg-light">

	<c:import url="../common/navbar.jsp"></c:import>
	
	<div class="container" style="margin-top:30px; color: whitesmoke;">
        <div class="row">
            <div class="col-md-8 offset-md-2 col-lg-6 offset-lg-3">
                <div class="login-form mt-4 p-4" style="background-color: #734F46; border-radius: 20px;">
                    <form action="user" method="post" class="row g-3">
                        <h4>Fill all Fields</h4>
                        
	                   <c:if test="${not empty success and success }">
	                   	<p class="text-success"> account is created!</p>
	                   </c:if>
	                   
	                   <c:if test="${not empty success and not success }">
	                   	<p class="text-danger"> account creation is fail!</p>
	                   </c:if>
                        
                        <input type="hidden" name="mode" value="CREATE">
                        
                         <div class="col-12">
                            <label>FirstName</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-person-vcard-fill"></i>
                                </span>
                                <input type="text" name="firstname" class="form-control" placeholder="firstname" required="required">
                            </div>
                        </div>
                        
                         <div class="col-12">
                            <label>LastName</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-person-vcard-fill"></i>
                                </span>
                                <input type="text" name="lastname" class="form-control" placeholder="lastname" required="required">
                            </div>
                        </div>
                        <div class="col-12">
                            <label>Username</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                   <i class="bi bi-person-fill"></i>
                                </span>
                                <input type="text" name="username" class="form-control" placeholder="Username" required="required">
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <label>Email</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-envelope-at-fill"></i>
                                </span>
                                <input type="email" name="email" class="form-control" placeholder="email" required="required">
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <label>Password</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-lock-fill"></i>
                                </span>
                                <input type="password" name="password" class="form-control" placeholder="Password" required="required">
                            </div>
                            
                        </div>
                        
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary float-end">Create</button>
                        </div>
                    </form>
                    <hr class="mt-4">
                    <div class="col-12">
                        <p class="text-center mb-0">Already have an account? <a href="login">Login</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<c:import url="../common/scriptlink.jsp" />
</body>
</html>