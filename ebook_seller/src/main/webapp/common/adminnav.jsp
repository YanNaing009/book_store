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
				 <a class="nav-link" href="book?mode=SHOW-ADD-FORM">AddBook</a>
		    </li>
		    
		    <li class="nav-item me-3">
		        <!-- <a class="nav-link" href="book?mode=SHOW-ADMIN-REQUEST">CheckUserRequested</a> -->
		        <a href="book?mode=SHOW-ADMIN-REQUEST">
		        <button type="button" class="btn position-relative text-light fs-5">
				  CheckUserRequested
				  
				  <c:if test="${not empty checkReq }"> 
					  <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
					    <span class="visually-hidden">New alerts</span>
					  </span> 
				  </c:if>
				</button>
				</a>
		    </li>	
		    <li class="nav-item">
		        <a class="nav-link" href="book?mode=SHOW-HISTORY">BuyHistory</a>
		    </li>	         
            
            <c:if test="${user != null }">
            <li class="nav-item dropdown" id="dropdownUserNotNull">
         
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				${user.username }
				<i class="bi bi-person-circle"></i>
              </a>
              <ul class="dropdown-menu" id="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                
                <li><a class="dropdown-item" href="login?mode=LOGOUT">Logout</a></li>
                
              </ul>
              
            </li>
            
            </c:if>
            
                
                
          </ul>
        </div>
      </div>
    </nav>