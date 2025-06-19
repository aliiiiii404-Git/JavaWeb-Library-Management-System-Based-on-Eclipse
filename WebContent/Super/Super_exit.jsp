<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书管理系统 - 用户退出</title>
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
</style>
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
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/BookListServlet">
                                <i class="fas fa-book mr-2"></i>图书信息</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_AddUser.jsp">
                                <i class="fas fa-user-plus mr-2"></i>添加用户</a></li>
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/Book/AddBook.jsp">
                                <i class="fas fa-book-plus mr-2"></i>添加图书</a></li>
                            <li class="list-group-item active"><a href="<%=request.getContextPath() %>/Super/Super_exit.jsp">
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
                            <li class="list-group-item"><a href="<%=request.getContextPath() %>/BorrowNoteServlet">
                                <i class="fas fa-history mr-2"></i>借阅记录查询</a></li>
                            <li class="list-group-item active"><a href="<%=request.getContextPath()%>/Super/Super_exit.jsp">
                                <i class="fas fa-sign-out-alt mr-2"></i>退出</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
            
            <!-- 退出确认区域 -->
            <div class="col-md-9">
                <div class="content-card">
                    <h3 class="text-center mb-4">确定要退出吗？</h3>
                    
                    <div class="row justify-content-center mt-6">
                        <a href="<%=request.getContextPath()%>/ExitServlet" class="btn btn-danger mr-6">
                            <i class="fas fa-sign-out-alt mr-2"></i>退出
                        </a>
                        <a href="javascript:history.back()" class="btn btn-info">
                            <i class="fas fa-arrow-left mr-2"></i>返回
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
    