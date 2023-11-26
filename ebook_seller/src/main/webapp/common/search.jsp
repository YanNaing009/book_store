<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%> 

<nav class="navbar navbar-light bg-light" id="logo">
      <div class="container-fluid">
        <a class="navbar-brand fs-4 fw-bold">Everybody's BookStore</a>
        <form class="d-flex">
        	<input type="hidden" name="mode" value="SEARCH" />	
          <input class="form-control me-1" id="searchBar" type="search" placeholder="Search" aria-label="Search" name="search">         
          <button class="btn btn-outline-succes " type="submit" id="searchbtn">Search</button>
        </form>
      </div>
    </nav>