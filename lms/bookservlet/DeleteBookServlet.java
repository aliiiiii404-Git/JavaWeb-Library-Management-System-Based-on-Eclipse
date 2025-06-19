package com.ghy.myworkplus.bookservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ghy.myworkplus.dao.BookDao;
import com.ghy.myworkplus.daoimpl.BookDaoImpl;


/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteBookServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1. 接收id
			String Bookid = request.getParameter("bookid");
			System.out.println(Bookid);
			//2. 执行删除
			BookDao service = new BookDaoImpl();
			service.delete(Integer.parseInt(Bookid));
			//3. 跳转到列表页。
			request.getRequestDispatcher("BookListServlet").forward(request, response);
		}catch (Exception e) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
