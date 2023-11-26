<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>     
<!DOCTYPE html>
<html>
<head>

<title>Author Page</title>
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
    		<input type="hidden" name="mode" value="SEARCHBYAUTHOR" />
    		<button class="btn text-primary" name="search" value="Walter Isaacson" type="submit">Walter Isaacson</button>
    		<button class="btn text-primary" name="search" value="Jon Lee Anderson" type="submit">Jon Lee Anderson</button>
    		
    		</form>

    	</div>
    	<div class="col-3 col-sm-3 col-md-3 col-lg-3">
    		<form>
    		<input type="hidden" name="mode" value="SEARCHBYAUTHOR" />
    		<button class="btn text-primary" name="search" value="J.K. Rowling" type="submit">J.K. Rowling</button>
    		<button class="btn text-primary" name="search" value="Rachel Moore" type="submit">Rachel Moore</button>
    		</form>
    	</div>
    	<div class="col-3 col-sm-3 col-md-3 col-lg-3">
    		<form>
    		<input type="hidden" name="mode" value="SEARCHBYAUTHOR" />
    		<button class="btn text-primary" name="search" value="Rich Cohen" type="submit">Rich Cohen</button>
    		<button class="btn text-primary" name="search" value="Gordon Ramsay" type="submit">Gordon Ramsay</button>
    		</form>
    	</div>
    	<div class="col-3 col-sm-3 col-md-3 col-lg-3">
    		<form>
    		<input type="hidden" name="mode" value="SEARCHBYAUTHOR" />
    		<button class="btn text-primary" name="search" value="Tatsuya Endo" type="submit">Tatsuya Endo</button>
    		<button class="btn text-primary" name="search" value="Hajime Isayama" type="submit">Hajime Isayama</button>
    		<button class="btn text-primary" name="search" value="Kazuo Ishiguro" type="submit">Kazuo Ishiguro</button>
    		
    		</form>
    	</div>
    	
    </div>
    
    <!--footer-->
    <c:import url="../common/footer.jsp"></c:import>
    
    <c:import url="../common/scriptlink.jsp" />       
</body>
</html>