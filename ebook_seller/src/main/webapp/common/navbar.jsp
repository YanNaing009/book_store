<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
	 
	  <nav class="navbar navbar-expand-lg navbar-light sticky-top" id="navbar">
      <div class="container-fluid">

        <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end fs-5" id="navbarNavDropdown">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="book">Home</a>
            </li>
   			<li class="nav-item">
				 <a class="nav-link" href="book?mode=GENRES">Genres</a>
		    </li>
		    <li class="nav-item">
		        <a class="nav-link" href="book?mode=AUTHOR">Author</a>
		    </li>
		    <li class="nav-item">
		         <a class="nav-link" href="book?mode=REQUESTBOOKFORM">RequestBook</a>
		    </li>
           
           <c:if test="${user == null }">
            <li class="nav-item dropdown" id="dropdownUserIsNull">
         
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				Login
				<i class="bi bi-person-circle"></i>
              </a>
              <ul class="dropdown-menu" id="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li><a class="dropdown-item" href="login">Login</a></li>
                <li><a class="dropdown-item" href="user">Register</a></li>
              </ul>
              
            </li>
            
            </c:if>
            
            
            <c:if test="${user != null }">
	            <li class="nav-item dropdown" id="dropdownUserNotNull">
	         
	              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					${user.username }
					<i class="bi bi-person-circle"></i>
	              </a>
	              <ul class="dropdown-menu" id="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	              	
	                
	                <c:if test="${ fn:contains(user.role,'user') }">
	               	 	 <li><a class="dropdown-item" href="book?mode=SHOW-ORDER-FORM">Cart List</a></li>
	               		 <li><a class="dropdown-item" href="book?mode=SHOW-HISTORY">Buy History</a></li>
            		</c:if>

	                <c:url var="admin" value="book">
	                	<c:param name="mode" value="ADMIN"></c:param>
	                </c:url>
	                
	                <c:if test="${ fn:contains(user.role,'admin') }">
	               		<li><a class="dropdown-item" href="${admin }">Admin dashboard</a></li>
            		</c:if>
            		<li><a class="dropdown-item" href="login?mode=LOGOUT">Logout</a></li>
              	</ul>
              
           	 </li>
            
            </c:if>
            
                
                
          </ul>
        </div>
      </div>
    </nav>