<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>     
<!DOCTYPE html>
<html>
<head>

<title>Genres Page</title>
<c:import url="../common/header.jsp"></c:import>
<style type="text/css">
	#link{
		margin-top: 20px;
		margin-bottom: 5px;
	}	
	#link div{
		height: 400px;
	}
	#link button{
		display: block;
	}
	
</style>
</head>
<body>
    <!-- Nav bar -->
    <c:import url="../common/search.jsp"></c:import>
    <c:import url="../common/navbar.jsp"></c:import>
    
    <div class="container-lg align-items-center justify-content-center d-flex" id="link">
    	
    	<div class="col-3 col-sm-3 col-md-3 col-lg-3">
    		<form>
	    		<input type="hidden" name="mode" value="SEARCHBYGENRES" />
	    		<button class="btn text-primary" name="search" value="biography" type="submit">Biography</button>
	    		<button class="btn text-primary" name="search" value="Cookbooks" type="submit">Cookbooks</button>
	    		
	    		<button class="btn text-primary" name="search" value="Horror" type="submit">Horror</button>
	    		
    		</form>
    	</div>
    	<div class="col-3 col-sm-3 col-md-3 col-lg-3">
    		<form>
	    		<input type="hidden" name="mode" value="SEARCHBYGENRES" />
	    		<button class="btn text-primary" name="search" value="sport" type="submit">Sport</button>
	    		<button class="btn text-primary" name="search" value="fiction" type="submit">Fiction</button>
	    		<button class="btn text-primary" name="search" value="Thriller" type="submit">Thriller</button>
    		</form>
    	</div>
    	<div class="col-3 col-sm-3 col-md-3 col-lg-3">
    		<form>
	    		<input type="hidden" name="mode" value="SEARCHBYGENRES" />
	    		<button class="btn text-primary" name="search" value="manga" type="submit">Manga</button>
	    		<button class="btn text-primary" name="search" value="Young Adult" type="submit">Young Adult</button>
	    		<button class="btn text-primary" name="search" value="Mystery" type="submit">Mystery</button>
    		</form>
    	</div>
    	<div class="col-3 col-sm-3 col-md-3 col-lg-3">
    		<form>
	    		<input type="hidden" name="mode" value="SEARCHBYGENRES" />
	    		<button class="btn text-primary" name="search" value="biography" type="submit">Biography</button>
	    		<button class="btn text-primary" name="search" value="History" type="submit">History</button>
	    		<button class="btn text-primary" name="search" value="Politics" type="submit">Politics</button>
    		</form>
    	</div>
    	
    </div>
    
    <!--footer-->
    <c:import url="../common/footer.jsp"></c:import>
    
    <c:import url="../common/scriptlink.jsp" />       
</body>
</html>