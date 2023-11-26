package com.hostmdy.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.sql.DataSource;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Bool;

import com.hostmdy.model.BookDAO;
import com.hostmdy.model.Books;
import com.hostmdy.model.BuyHistory;
import com.hostmdy.model.BuyHistoryDAO;
import com.hostmdy.model.Order;
import com.hostmdy.model.OrderDAO;
import com.hostmdy.model.Request;
import com.hostmdy.model.RequestDAO;
import com.hostmdy.model.User;
import com.hostmdy.model.UserDAO;

/**
 * Servlet implementation class BookController
 */
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name = "jdbc/ebook_seller")
	private DataSource dataSource;
	private BookDAO bookDAO;
	private RequestDAO requestDAO;
	private OrderDAO orderDAO;
	private BuyHistoryDAO buyHistoryDAO;
	private UserDAO userDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		bookDAO = new BookDAO(dataSource);
		requestDAO = new RequestDAO(dataSource);
		orderDAO = new OrderDAO(dataSource);
		buyHistoryDAO = new BuyHistoryDAO(dataSource);
		userDAO = new UserDAO(dataSource);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		
		if(mode == null) {
			mode = "SHOW";
		}
		switch (mode) {
		case "SHOW":
			showHome1(request,response);
			break;
		case "SHOW2":
			showHome2(request,response);
			break;
		case "SHOW3":
			showHome3(request,response);
			break;
		case "SHOW-ADD-FORM":
			showAddBook(request, response);
			break;			
		case "SEARCH":
			searchBook(request,response);
			break;
		case "ADMIN":
			showAdminPage(request,response);
			break;
		case "SINGLE":
			showSingleBook(request,response);
			break;
		case "LOAD":
			loadBook(request, response);
			break;
		case "CREATE":
			createBook(request, response);
			break;
		case "UPDATE":
			updateBook(request, response);
			break;
		case "DELETE":
			deleteBook(request,response);
			break;
		case "GENRES":
			showGenres(request,response);
			break;
		case "AUTHOR":
			showAuthor(request,response);
			break;
		case "REQUESTBOOKFORM":
			requestBookForm(request,response);
			break;
		case "REQUEST":
			requestBook(request,response);
			break;
		case "SHOW-ADMIN-REQUEST":
			showAdminRequest(request,response);
			break;
		case "REQUEST-CREATE":
			createRequestFromAdmin(request,response);
			break;
		case "REQUEST-DELETE":
			deleteRequestFromAdmin(request,response);
			break;
		case "OREDER-BOOK":
			createOrder(request,response);
			break;
		case "SHOW-ORDER-FORM":
			showOrderForm(request,response);
			break;
		case "ORDER-REMOVE":
			removeOrder(request,response);
			break;
		case "SHOW-HISTORY-FORM":
			showHistroyFormFromBuy(request,response);
			break;
		case "SHOW-HISTORY":
			showHistroyForm(request,response);
			break;
		case "SEARCHBYGENRES":
			searchBookByGenres(request,response);
			break;
		case "SEARCHBYAUTHOR":
			searchBookByAuthor(request,response);
			break;
		default:
			showHome1(request,response);
			break;
		}
	}



	private void searchBookByAuthor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		searchAny(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/author-result.jsp");
		dispatcher.forward(request, response);
	}

	private void searchBookByGenres(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		searchAny(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/genres-result.jsp");
		dispatcher.forward(request, response);
	}

	private void showHome3(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Books> books = bookDAO.getAllBooks();
		request.setAttribute("books", books);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/home3.jsp");
		dispatcher.forward(request, response);
	}

	private void showHistroyForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String userRole = user.getRole();
		if(userRole.contains("admin")) {
			boolean admin = user.getRole().contains("admin");
			request.setAttribute("checkAdmin", admin);
			List<BuyHistory> buyHistories = buyHistoryDAO.showBuyHistroy();
			request.setAttribute("buyHistoryList", buyHistories);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/buy-history.jsp");
			dispatcher.forward(request, response);
		}else {
			String username = user.getUsername();
			List<BuyHistory> buyHistories = buyHistoryDAO.getBuyHistoryByUserName(username);
			request.setAttribute("buyHistoryList", buyHistories);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/buy-history.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
	}

	private void showHistroyFormFromBuy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		createHistory(request, response);
		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");
		
		updateAddress(request, response);

		Long userId = user.getId();
		List<Order> ordersList = orderDAO.getOrderUserById(userId);
		
		for (Order order : ordersList) {
			Long orderId = order.getId();
			orderDAO.deleteOrder(orderId);
		}
		
		
		boolean admin = user.getRole().contains("admin");
		request.setAttribute("checkAdmin", admin);

		showHistroyForm(request, response);
	}
	
	private void createHistory(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Long userId = user.getId();
		List<Order> orderList = orderDAO.getOrderUserById(userId);
		for (Order history : orderList) {
			orderDAO.createHistory(history);
		}
		
	}
	
	private void updateAddress(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Long userId = user.getId();
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String payment = request.getParameter("payment");
		
		User userUpdate = new User(userId, address, city, payment);
		
		userDAO.updateUserAddress(userUpdate);
		
	}

	private void removeOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long orderId = Long.parseLong(request.getParameter("id"));
		orderDAO.deleteOrder(orderId);
		showOrderForm(request, response);
	}

	private void showOrderForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user",user);
		if(user == null) {
			response.sendRedirect("login");
			return;
		} else {
			
			if(user.getRole().contains("admin")) {
				List<Order> orderList = orderDAO.showOrder();
				request.setAttribute("orderList", orderList);
				RequestDispatcher dispatcher = request.getRequestDispatcher("view/admin-order.jsp");
				dispatcher.forward(request, response);
			} else {
				Long userId = user.getId();
				List<Order> orderList = orderDAO.getOrderUserById(userId);
				request.setAttribute("orderList", orderList);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("view/order.jsp");
				dispatcher.forward(request, response);
			}
	
		}
		
		
	}

	private void createOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			response.sendRedirect("login");
			return;
		}
		
		Long userId = user.getId();
		String userName = user.getUsername();
		Long bookId = Long.parseLong( request.getParameter("bookId"));
		String bookName = request.getParameter("bookName");
		String authorName = request.getParameter("authorName");
		Double price = Double.parseDouble(request.getParameter("price"));
		LocalDate date = LocalDate.now();
		
		Order order = new Order(bookId, userId, userName, bookName, authorName, date, price);
		Boolean success = orderDAO.createOrder(order);
		request.setAttribute("success", success);
		showOrderForm(request, response);
	}

	private void deleteRequestFromAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long requestId = Long.parseLong( request.getParameter("id"));
		requestDAO.deleteRequestBook(requestId);
		response.sendRedirect("book?mode=SHOW-ADMIN-REQUEST");
	}

	private void createRequestFromAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long requestId = Long.parseLong( request.getParameter("id"));
		Request book = requestDAO.getRequestBookById(requestId);
		request.setAttribute("requestBook",book);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/add-book.jsp");
		dispatcher.forward(request, response);
	}

	private void showAdminRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Request> adminReq = requestDAO.showRequest();
		request.setAttribute("adminRequest", adminReq);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/admin-check-request.jsp");
		dispatcher.forward(request, response);
	}

	private void requestBookForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			response.sendRedirect("login");
			return;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/request-book.jsp");
		dispatcher.forward(request, response);
	}

	private void requestBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String userName = user.getUsername();
		
		String bookName = request.getParameter("bookname");
		String authorName = request.getParameter("authorname");
		String note = request.getParameter("note");
		
		Request requestBook = new Request(bookName, authorName, note,userName);
		boolean success = requestDAO.createRequestBook(requestBook);
		request.setAttribute("success", success);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/request-book.jsp");
		dispatcher.forward(request, response);
	}

	private void showHome2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Books> books = bookDAO.getAllBooks();
		request.setAttribute("books", books);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/home2.jsp");
		dispatcher.forward(request, response);
	}

	private void showAuthor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/author.jsp");
		dispatcher.forward(request, response);
	}

	private void showGenres(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/genres.jsp");
		dispatcher.forward(request, response);
	}

	private void showAddBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/add-book.jsp");
		dispatcher.forward(request, response);
	}

	private void createBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		Double price = Double.parseDouble(request.getParameter("price"));
		Double rating = Double.parseDouble(request.getParameter("rating"));
		LocalDate releaseDate = LocalDate.parse(request.getParameter("releaseDate"));
		String genres = request.getParameter("genres");
		String image = request.getParameter("image");
		String review = request.getParameter("review");
		String status = "active";
		
		Books book = new Books(name, author, review, price, rating, releaseDate, image, status, genres);
		boolean success = bookDAO.createBook(book);
		request.setAttribute("success", success);
		
		if(request.getParameter("reqId") != null) {
			Long reqId = Long.parseLong(request.getParameter("reqId"));
			if(success) {
				requestDAO.deleteRequestBook(reqId);
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("view/add-book.jsp");
		dispatcher.forward(request, response);
		
	}

	private void loadBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long id = Long.parseLong(request.getParameter("id"));
		Books book = bookDAO.getBookById(id);
		if(book != null) {
			request.setAttribute("book",book);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/update-book.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void updateBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		Double price = Double.parseDouble(request.getParameter("price"));
		Double rating = Double.parseDouble(request.getParameter("rating"));
		LocalDate releaseDate = LocalDate.parse(request.getParameter("releaseDate"));
		String genres = request.getParameter("genres");
		String image = request.getParameter("image");
		String review = request.getParameter("review");
		Long id = Long.parseLong(request.getParameter("id"));
		
		Books book = new Books(id, name, author, review, price, rating, releaseDate, image, review, genres);
		boolean success = bookDAO.updateBook(book);
		
		if(success) {
			showSingleBook(request, response);
		}else {
			request.setAttribute("success", success);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/update-book.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long id = Long.parseLong(request.getParameter("id"));
		bookDAO.deleteFlash(id);
		response.sendRedirect("book");
	}

	private void showSingleBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long id = Long.parseLong(request.getParameter("id"));
		Books book = bookDAO.getBookById(id);
		request.setAttribute("book", book);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/details.jsp");
		dispatcher.forward(request, response);
	}

	private void showAdminPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Books> books = bookDAO.getAllBooks();
		request.setAttribute("books", books);
		
		List<Request> bookReq = requestDAO.showRequest();
		request.setAttribute("checkReq", bookReq);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/admin.jsp");
		dispatcher.forward(request, response);
	}

	private void searchBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		searchAny(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/index.jsp");
		dispatcher.forward(request, response);
	}
	
	private void searchAny(HttpServletRequest request,HttpServletResponse response) {
		String search = request.getParameter("search");
		List<Books> books = bookDAO.searchBook(search);
		request.setAttribute("books", books);
	}

	private void showHome1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Books> books = bookDAO.getAllBooks();
		request.setAttribute("books", books);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/home.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
