<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/header.jsp"/>
<title>Login Page</title>
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
	<!-- navbar -->
	<c:import url="../common/navbar.jsp"></c:import>

	<div class="container" style="margin-top:100px; color: whitesmoke;">
        <div class="row">
            <div class="col-xl-6 offset-xl-3 col-lg-8 col-md-8 offset-md-2 col-sm-10 col-10 offset-1">
                <div class="login-form mt-4 p-4 h-80" style="background-color: #734F46; border-radius: 20px;">
                    <form action="login" method="post" class="row g-3">
                        <h4>Welcome Back</h4>
                        
                        <input type="hidden" name="mode" value="LOGIN" />
	                   
	                   <c:if test="${not empty success and not success }">
	                   	<p class="text-danger"> username of password is incorrect </p>
	                   </c:if>
	                   
                        <div class="col-12">
                            <label>Username</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-people-fill"></i>
                                </span>
                                <input type="text" name="username" class="form-control hrllo" placeholder="Username or Email" >
                            </div>
                        </div>
                        <div class="col-12">
                            <label>Password</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-lock-fill"></i>
                                </span>
                                <input type="password" name="password" class="form-control" placeholder="Password">
                            </div>
                            
                        </div>
                       
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary float-end">Login</button>
                        </div>
                    </form>
                    <hr class="mt-4">
                    <div class="col-12">
                        <p class="text-center mb-0">Have not account yet? <a href="user">Signup</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<c:import url="../common/scriptlink.jsp" />
</body>
</html>