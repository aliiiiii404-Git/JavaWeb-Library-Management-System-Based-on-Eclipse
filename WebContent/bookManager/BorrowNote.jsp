<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书管理系统 - 借阅记录查询</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<style>
    body {
        background-image: url("<%=request.getContextPath() %>/img/background (2).jpg");
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
        color: white; /* 设置整体文字颜色为白色 */
    }
    
    .sidebar {
        background-color: rgba(0, 0, 0, 0.7); /* 修改侧边栏为深色半透明 */
        border-radius: 10px;
        backdrop-filter: blur(5px);
        color: white; /* 确保侧边栏文字为白色 */
    }
    
    .content-card {
        background-color: rgba(0, 0, 0, 0.6);
        border-radius: 10px;
        backdrop-filter: blur(5px);
        padding: 30px;
    }
    
    .form-control {
        background-color: rgba(255, 255, 255, 0.1);
        color: white;
        border-color: rgba(255, 255, 255, 0.3);
    }
    
    .form-control:focus {
        background-color: rgba(255, 255, 255, 0.2);
        color: white;
        border-color: #007bff;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    }
    
    .list-group-item {
        background-color: rgba(255, 255, 255, 0.1); /* 半透明背景 */
        color: white; /* 文字颜色 */
        border-color: rgba(255, 255, 255, 0.2); /* 边框颜色 */
        transition: all 0.3s ease;
    }
    
    .list-group-item.active {
        background-color: #007bff; /* 活跃项颜色 */
        border-color: #007bff;
    }
    
    .list-group-item:hover {
        background-color: rgba(255, 255, 255, 0.2); /* 悬停效果 */
        transform: translateX(5px);
    }
    
    .list-group-item a {
        color: white; /* 链接颜色 */
    }
    
    .btn-info {
        background-color: rgba(23, 162, 184, 0.8);
        border-color: rgba(23, 162, 184, 0.8);
    }
    
    .btn-info:hover {
        background-color: rgba(23, 162, 184, 1);
        border-color: rgba(23, 162, 184, 1);
    }
    
    .btn-danger {
        background-color: rgba(220, 53, 69, 0.8);
        border-color: rgba(220, 53, 69, 0.8);
    }
    
    .btn-danger:hover {
        background-color: rgba(220, 53, 69, 1);
        border-color: rgba(220, 53, 69, 1);
    }
    
    .table {
        color: white;
    }
    
    .table thead th {
        border-bottom: 2px solid rgba(255, 255, 255, 0.3);
    }
    
    .table td, .table th {
        border-top: 1px solid rgba(255, 255, 255, 0.2);
    }
    
    .page-link {
        background-color: rgba(255, 255, 255, 0.1);
        color: white;
        border: 1px solid rgba(255, 255, 255, 0.2);
    }
    
    .page-link:hover {
        background-color: rgba(255, 255, 255, 0.2);
        color: white;
        border-color: rgba(255, 255, 255, 0.3);
    }
    
    .page-item.active .page-link {
        background-color: #007bff;
        border-color: #007bff;
    }
    
    .page-item.disabled .page-link {
        background-color: rgba(255, 255, 255, 0.1);
        color: rgba(255, 255, 255, 0.5);
        border-color: rgba(255, 255, 255, 0.2);
    }
    
    .action-btn {
        display: inline-block;
        padding: 0.25rem 0.5rem;
        margin-right: 0.5rem;
        border-radius: 0.25rem;
        text-decoration: none;
        transition: all 0.3s ease;
    }
    
    .action-btn:hover {
        text-decoration: none;
        transform: translateY(-1px);
    }
    
    .return-btn {
        background-color: rgba(23, 162, 184, 0.8);
        color: white;
    }
    
    .return-btn:hover {
        background-color: rgba(23, 162, 184, 1);
        color: white;
    }
    
    .delete-btn {
        background-color: rgba(220, 53, 69, 0.8);
        color: white;
    }
    
    .delete-btn:hover {
        background-color: rgba(220, 53, 69, 1);
        color: white;
    }
    
    .renew-btn {
        background-color: rgba(40, 167, 69, 0.8);
        color: white;
    }
    
    .renew-btn:hover {
        background-color: rgba(40, 167, 69, 1);
        color: white;
    }
</style>
<script type="text/javascript">
function doDelete(operatid) {
    var flag = confirm("是否确定删除改条记录?");
    if(flag){
        location.href="<%=request.getContextPath()%>/DeleteOperaServlet?Operaid="+operatid;
    }
}
function doReturn(userid,bookid) {
    var flag = confirm("是否确定还书?");
    if(flag){
        location.href="<%=request.getContextPath()%>/ReturnBooksServlet?userid="+userid+"&bookid="+bookid;
    }
}
function doRenew(userid,bookid) {
    var flag = confirm("是否确定续借?");
    if(flag){
        location.href="<%=request.getContextPath()%>/RenewBooksServlet?userid="+userid+"&bookid="+bookid;
    }
}
</script>
</head>
<body>
    <h2 align="center" class="mt-5 mb-4 text-white font-bold text-2xl">图书管理系统</h2>
    
    <div class="container">
        <div class="row mt-5">
            <!-- 侧边栏 -->
            <div class="col-md-3">
                <div class="sidebar">
                    <ul class="list-group">
                        <c:if test="${sessionScope.usertype=='-1'}">
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_about.jsp">
                                <i class="fas fa-home mr-2"></i>首页</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/UserListServlet">
                                <i class="fas fa-users mr-2"></i>用户信息</a></li>
                            <li class="list-group-item active"><a href="<%=request.getContextPath() %>/BorrowNoteServlet">
                                <i class="fas fa-book mr-2"></i>图书信息</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_AddUser.jsp">
                                <i class="fas fa-user-plus mr-2"></i>添加用户</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/Book/AddBook.jsp">
                                <i class="fas fa-book-plus mr-2"></i>添加图书</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_exit.jsp">
                                <i class="fas fa-sign-out-alt mr-2"></i>退出</a></li>
                        </c:if>
                        <c:if test="${sessionScope.usertype=='1'}">
                            <li class="list-group-item"><a href="<%=request.getContextPath()%>/bookManager/bookManager_about.jsp">
                                <i class="fas fa-home mr-2"></i>首页</a></li>
                            <li class="list-group-item"><a href="BorrowNoteServlet">
                                <i class="fas fa-book mr-2"></i>图书信息查询</a></li>
                            <li class="list-group-item active"><a href="<%=request.getContextPath()%>/SelectAllBook?type=student">
                                <i class="fas fa-history mr-2"></i>我的借阅记录</a></li>
                            <li class="list-group-item"><a href="Reader/exit.jsp">
                                <i class="fas fa-sign-out-alt mr-2"></i>退出</a></li>
                        </c:if>
                        <c:if test="${sessionScope.usertype=='0'}">
                            <li class="list-group-item"><a href="<%=request.getContextPath()%>/bookManager/bookManager_about.jsp">
                                <i class="fas fa-home mr-2"></i>首页</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath()%>/BookListServlet">
                                <i class="fas fa-book mr-2"></i>图书信息</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/Book/AddBook.jsp">
                                <i class="fas fa-book-plus mr-2"></i>添加图书</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/bookManager/BorrowBook.jsp">
                                <i class="fas fa-exchange mr-2"></i>借书</a></li>
                            <li class="list-group-item active"><a href="<%=request.getContextPath()%>/BorrowNoteServlet">
                                <i class="fas fa-history mr-2"></i>借阅记录查询</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath()%>/Super/Super_exit.jsp">
                                <i class="fas fa-sign-out-alt mr-2"></i>退出</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            
            <!-- 借阅记录表格 -->
            <div class="col-md-9">
                <div class="content-card">
                    <h3 class="text-center mb-4">借阅记录查询</h3>
                    
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr align="center">
                                    <td>借阅记录id</td>
                                    <td>图书id</td>
                                    <td>图书名称</td>
                                    <td>借阅者id</td>
                                    <td>借阅人姓名</td>
                                    <td>借阅时间</td>
                                    <td>借阅期限</td>
                                    <td>是否归还</td>
                                    <c:if test="${sessionScope.usertype!='1'}"><td>操作</td></c:if>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${pageBean.list }" var="book">
                                    <tr align="center">
                                        <td>${book.operatid}</td>
                                        <td>${book.bookid}</td>
                                        <td>${book.bookname}</td>
                                        <td>${book.userid}</td>
                                        <td>${book.username}</td>
                                        <td>${book.borrowtime}</td>
                                        <td>${book.renttime}</td>
                                        <td>${book.isreturn}</td>
                                        <td>
                                            <c:if test="${sessionScope.usertype==0}">
                                                <c:if test="${book.isreturn==false}">
                                                    <a href="#" onclick="doReturn(${book.userid},${book.bookid})" class="action-btn return-btn">
                                                        <i class="fas fa-book-reader mr-1"></i>还书
                                                    </a>
                                                </c:if>
                                                <a href="#" onclick="doDelete(${book.operatid})" class="action-btn delete-btn">
                                                    <i class="fas fa-trash mr-1"></i>删除
                                                </a>
                                                <c:if test="${book.renttime<60}">
                                                    <a href="#" onclick="doRenew(${book.userid},${book.bookid})" class="action-btn renew-btn">
                                                        <i class="fas fa-refresh mr-1"></i>续借
                                                    </a>
                                                </c:if>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                    <!-- 分页信息 -->
                    <div class="mt-4 text-center">
                        <div class="mb-3">
                            第 ${pageBean.currentPage } / ${pageBean.totalPage } 页
                            &nbsp;&nbsp;
                            每页显示${pageBean.pageSize }条  &nbsp;&nbsp;&nbsp;
                            总的记录数${pageBean.totalSize }
                        </div>
                        
                        <nav>
                            <ul class="pagination justify-content-center">
                                <c:if test="${pageBean.currentPage !=1 }">
                                    <li class="page-item">
                                        <a href="BorrowNoteServlet?currentPage=1" class="page-link" aria-label="First">
                                            <span aria-hidden="true">&laquo;&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a href="BorrowNoteServlet?currentPage=${pageBean.currentPage-1 }" class="page-link" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                
                                <c:forEach begin="1" end="${pageBean.totalPage }" var="i">
                                    <li class="page-item ${pageBean.currentPage == i ? 'active' : ''}">
                                        <a href="BorrowNoteServlet?currentPage=${i }" class="page-link">${i }</a>
                                    </li>
                                </c:forEach>
                                
                                <c:if test="${pageBean.currentPage !=pageBean.totalPage }">
                                    <li class="page-item">
                                        <a href="BorrowNoteServlet?currentPage=${pageBean.currentPage+1 }" class="page-link" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a href="BorrowNoteServlet?currentPage=${pageBean.totalPage }" class="page-link" aria-label="Last">
                                            <span aria-hidden="true">&raquo;&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
    