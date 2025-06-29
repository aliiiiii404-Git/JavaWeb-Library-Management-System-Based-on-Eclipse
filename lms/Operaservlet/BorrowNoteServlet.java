package com.ghy.myworkplus.Operaservlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ghy.myworkplus.bean.PageBean;
import com.ghy.myworkplus.dao.OperaBookDao;
import com.ghy.myworkplus.daoimpl.OperaBookDaoImpl;


@WebServlet("/BorrowNoteServlet")
public class BorrowNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BorrowNoteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage =Integer.parseInt( request.getParameter("currentPage"));
		}
		
		//2. 根据指定的页数，去获取该页的数据回来
		//List<User> --- list.jsp
		OperaBookDao bookService = new OperaBookDaoImpl();
		try {
			PageBean pageBean  = bookService.findAlls(currentPage);
			request.setAttribute("pageBean", pageBean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/bookManager/BorrowNote.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
