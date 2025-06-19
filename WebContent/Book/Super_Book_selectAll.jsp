<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书管理系统 - 图书信息</title>
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
        padding: 20px;
    }
    
    .table {
        color: white;
    }
    
    .table-bordered th, .table-bordered td {
        border-color: rgba(255, 255, 255, 0.3);
    }
    
    .table-hover tbody tr:hover {
        background-color: rgba(255, 255, 255, 0.1);
    }
    
    .pagination .page-link {
        background-color: rgba(0, 0, 0, 0.5);
        color: white;
        border-color: rgba(255, 255, 255, 0.3);
    }
    
    .pagination .page-link:hover {
        background-color: rgba(255, 255, 255, 0.2);
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
    
    a {
        color: #42a5f5;
    }
    
    a:hover {
        color: #90caf9;
    }
    
    .btn-action {
        display: inline-block;
        padding: 5px 10px;
        border-radius: 5px;
        text-decoration: none;
        transition: all 0.3s ease;
    }
    
    .btn-update {
        background-color: rgba(3, 169, 244, 0.7);
        color: white;
    }
    
    .btn-update:hover {
        background-color: rgba(3, 169, 244, 0.9);
        color: white;
        text-decoration: none;
    }
    
    .btn-delete {
        background-color: rgba(244, 67, 54, 0.7);
        color: white;
    }
    
    .btn-delete:hover {
        background-color: rgba(244, 67, 54, 0.9);
        color: white;
        text-decoration: none;
    }
    
    .btn-borrow {
        background-color: rgba(76, 175, 80, 0.7);
        color: white;
    }
    
    .btn-borrow:hover {
        background-color: rgba(76, 175, 80, 0.9);
        color: white;
        text-decoration: none;
    }
</style>
<script type="text/javascript">
    function doDelete(bookid) {
        var flag = confirm("是否确定删除?");
        if(flag){
            location.href="DeleteBookServlet?bookid="+bookid;
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
                        <!-- 系统管理员菜单 -->
                        <c:if test="${sessionScope.usertype=='-1'}">
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_about.jsp">
                                <i class="fas fa-home mr-2"></i>首页</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/UserListServlet">
                                <i class="fas fa-users mr-2"></i>用户信息</a></li>
                            <li class="list-group-item active"><a href="<%=request.getContextPath() %>/BookListServlet">
                                <i class="fas fa-book mr-2"></i>图书信息</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_AddUser.jsp">
                                <i class="fas fa-user-plus mr-2"></i>添加用户</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/Book/AddBook.jsp">
                                <i class="fas fa-book-plus mr-2"></i>添加图书</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_exit.jsp">
                                <i class="fas fa-sign-out-alt mr-2"></i>退出</a></li>
                        </c:if>
                        
                        <!-- 读者菜单 -->
                        <c:if test="${sessionScope.usertype=='1'}">
                            <li class="list-group-item"><span>
                                <i class="fas fa-home mr-2"></i>首页</span></li>
                            <li class="list-group-item active"><a href="<%=request.getContextPath() %>/BookListServlet">
                                <i class="fas fa-book mr-2"></i>图书信息查询</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/SearchOperatServlet?username=${username}">
                                <i class="fas fa-history mr-2"></i>我的借阅记录</a></li>
                            <li class="list-group-item"><a href="Reader/exit.jsp">
                                <i class="fas fa-sign-out-alt mr-2"></i>退出</a></li>
                        </c:if>
                        
                        <!-- 图书管理员菜单 -->
                        <c:if test="${sessionScope.usertype=='0'}">
                            <li class="list-group-item"><a href="<%=request.getContextPath()%>/bookManager/bookManager_about.jsp">
                                <i class="fas fa-home mr-2"></i>首页</a></li>
                            <li class="list-group-item active"><a href="<%=request.getContextPath()%>/BookListServlet">
                                <i class="fas fa-book mr-2"></i>图书信息</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/Book/AddBook.jsp">
                                <i class="fas fa-book-plus mr-2"></i>添加图书</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/bookManager/BorrowBook.jsp">
                                <i class="fas fa-exchange-alt mr-2"></i>借书</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath()%>/BorrowNoteServlet">
                                <i class="fas fa-list-alt mr-2"></i>借阅记录查询</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath()%>/exit.jsp">
                                <i class="fas fa-sign-out-alt mr-2"></i>退出</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            
            <!-- 图书列表内容 -->
            <div class="col-md-9">
                <div class="content-card">
                    <table class="table table-bordered table-hover">
                        <tr class="bg-dark">
                            <th>图书id</th>
                            <th>图书名称</th>
                            <th>作者</th>
                            <th>出版社</th>
                            <th>图书库存</th>
                            <th>图书类型</th>
                            <c:if test="${sessionScope.usertype!='1'}"><th>操作</th></c:if>
                        </tr>
                        
                        <c:forEach items="${pageBean.list }" var="book">
                        <tr align="center">
                            <td>${book.bookid}</td>
                            <td>${book.bookname}</td>
                            <td>${book.author}</td>
                            <td>${book.publish}</td>
                            <td>${book.bookcount}</td>
                            <td>${book.booktype}</td>
                            
                            <c:if test="${sessionScope.usertype=='-1'}">
                                <td>
                                    <a href="EditBookServlet?bookid=${book.bookid }" class="btn-update">
                                        <i class="fas fa-edit mr-1"></i>更新
                                    </a>
                                    <a href="#" onclick="doDelete(${book.bookid})" class="btn-delete ml-2">
                                        <i class="fas fa-trash mr-1"></i>删除
                                    </a>
                                </td>	
                            </c:if>
                            
                            <c:if test="${sessionScope.usertype=='0'}">
                                <c:if test="${book.bookcount>0}">
                                    <td>
                                        <a href="BorrowBooksServlet?bookid=${book.bookid }" class="btn-borrow">
                                            <i class="fas fa-book mr-1"></i>借书
                                        </a>
                                    </td>
                                </c:if>
                                <c:if test="${book.bookcount<=0}">
                                    <td class="text-danger">无库存</td>
                                </c:if>
                            </c:if>				
                        </tr>
                        </c:forEach>
                        
                        <tr>
                            <td colspan="7">
                                <div class="text-center">
                                    第 ${pageBean.currentPage } / ${pageBean.totalPage } 页
                                    &nbsp;&nbsp;
                                    每页显示${pageBean.pageSize }条  &nbsp;&nbsp;&nbsp;
                                    总的记录数${pageBean.totalSize } &nbsp;&nbsp;&nbsp;
                                    
                                    <c:if test="${pageBean.currentPage !=1 }">
                                        <a href="BookListServlet?currentPage=1" class="btn btn-sm btn-default">首页</a>
                                        <a href="BookListServlet?currentPage=${pageBean.currentPage-1 }" class="btn btn-sm btn-default">上一页</a>
                                    </c:if>
                                    
                                    <c:forEach begin="1" end="${pageBean.totalPage }" var="i">
                                        <c:if test="${pageBean.currentPage == i }">
                                            <span class="btn btn-sm btn-primary disabled">${i }</span>
                                        </c:if>
                                        <c:if test="${pageBean.currentPage != i }">
                                            <a href="BookListServlet?currentPage=${i }" class="btn btn-sm btn-default">${i }</a>
                                        </c:if>
                                    </c:forEach>
                                    
                                    <c:if test="${pageBean.currentPage !=pageBean.totalPage }">
                                        <a href="BookListServlet?currentPage=${pageBean.currentPage+1 }" class="btn btn-sm btn-default">下一页</a>
                                        <a href="BookListServlet?currentPage=${pageBean.totalPage }" class="btn btn-sm btn-default">尾页</a>
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                    </table>
                    
                    <!-- 分页导航 -->
                    <nav class="text-center">
                        <ul class="pagination justify-content-center">
                            <li class="page-item ${pageBean.currentPage == 1 ? 'disabled' : ''}">
                                <a href="BookListServlet?currentPage=${pageBean.currentPage-1 }" class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            
                            <c:forEach begin="1" end="${pageBean.totalPage }" var="i">
                                <li class="page-item ${pageBean.currentPage == i ? 'active' : ''}">
                                    <a href="BookListServlet?currentPage=${i }" class="page-link">${i }</a>
                                </li>
                            </c:forEach>
                            
                            <li class="page-item ${pageBean.currentPage == pageBean.totalPage ? 'disabled' : ''}">
                                <a href="BookListServlet?currentPage=${pageBean.currentPage+1 }" class="page-link" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
    