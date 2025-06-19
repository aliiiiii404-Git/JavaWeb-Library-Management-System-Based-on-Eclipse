<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书管理系统 - 修改图书信息</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="./css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script src="./css/bootstrap-datetimepicker.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        background-image: url("<%=request.getContextPath() %>/img/background (2).jpg");
        background-size: cover;
        background-attachment: fixed;
        color: white;
        margin: 0;
        padding: 0;
    }

    .wrapper {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    .header {
        padding: 20px 0;
        background-color: rgba(0, 0, 0, 0.5);
        margin-bottom: 30px;
    }

    .container {
        flex-grow: 1;
        display: flex;
        gap: 20px;
        padding: 0 20px 30px;
    }

    .sidebar {
        background-color: rgba(0, 0, 0, 0.7);
        border-radius: 10px;
        padding: 20px;
        min-width: 250px;
        backdrop-filter: blur(5px);
    }

    .main-content {
        flex-grow: 1;
        background-color: rgba(0, 0, 0, 0.6);
        border-radius: 10px;
        padding: 30px;
    }

    .list-group-item {
        background-color: transparent;
        border: none;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        padding: 12px 20px;
        transition: all 0.3s ease;
    }

    .list-group-item:last-child {
        border-bottom: none;
    }

    .list-group-item.active {
        background-color: #007bff !important;
        border-radius: 5px;
        transform: translateX(5px);
    }

    .list-group-item a {
        color: white;
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .form-control {
        background-color: rgba(255, 255, 255, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.3);
        color: white;
    }

    .form-control:focus {
        background-color: rgba(255, 255, 255, 0.2);
        border-color: #007bff;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.15);
    }

    .btn {
        padding: 8px 25px;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .btn-info {
        background-color: #007bff;
        border-color: #007bff;
    }

    .btn-danger {
        background-color: #dc3545;
        border-color: #dc3545;
    }

    .icon {
        min-width: 24px;
        text-align: center;
    }
</style>
</head>
<body>
    <h2 align="center" class="mt-5 mb-4 text-white font-bold text-2xl">
        <i class="fas fa-book-edit icon"></i>
        修改图书信息
    </h2>

    <div class="container">
        <!-- 侧边栏导航 -->
        <div class="col-md-3">
            <div class="sidebar">
                <ul class="list-group">
                    <li class="list-group-item">
                        <a href="<%=request.getContextPath() %>/Super/Super_about.jsp">
                            <i class="fas fa-home icon"></i> 首页
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="<%=request.getContextPath() %>/UserListServlet">
                            <i class="fas fa-users icon"></i> 用户信息
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="<%=request.getContextPath() %>/BookListServlet">
                            <i class="fas fa-book icon"></i> 图书信息
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="<%=request.getContextPath() %>/Super/Super_AddUser.jsp">
                            <i class="fas fa-user-plus icon"></i> 添加用户
                        </a>
                    </li>
                    <li class="list-group-item active">
                        <a href="<%=request.getContextPath() %>/SBook/AddBook.jsp">
                            <i class="fas fa-book-plus icon"></i> 添加图书
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="<%=request.getContextPath() %>/Super/Super_exit.jsp">
                            <i class="fas fa-sign-out-alt icon"></i> 退出
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 主内容区域 -->
        <div class="col-md-9 main-content">
            <form action="<%=request.getContextPath()%>/UpdateBookServlet" method="post">
                <input type="hidden" name="bookid" value="${Book.bookid}">
                
                <div class="form-group row">
                    <label for="bookname" class="col-sm-3 col-form-label text-right">
                        <i class="fas fa-book icon"></i> 图书名称:
                    </label>
                    <div class="col-sm-9">
                        <input type="text" id="bookname" name="bookname" 
                               value="${Book.bookname}" class="form-control"
                               placeholder="请输入图书名称" required>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="author" class="col-sm-3 col-form-label text-right">
                        <i class="fas fa-pen icon"></i> 作者:
                    </label>
                    <div class="col-sm-9">
                        <input type="text" id="author" name="author" 
                               value="${Book.author}" class="form-control"
                               placeholder="请输入作者">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="publish" class="col-sm-3 col-form-label text-right">
                        <i class="fas fa-building icon"></i> 出版社:
                    </label>
                    <div class="col-sm-9">
                        <input type="text" id="publish" name="publish" 
                               value="${Book.publish}" class="form-control"
                               placeholder="请输入出版社">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="bookcount" class="col-sm-3 col-form-label text-right">
                        <i class="fas fa-boxes icon"></i> 图书库存:
                    </label>
                    <div class="col-sm-9">
                        <input type="number" id="bookcount" name="bookcount" 
                               value="${Book.bookcount}" class="form-control"
                               placeholder="请输入库存数量" min="0" required>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="booktype" class="col-sm-3 col-form-label text-right">
                        <i class="fas fa-layer-group icon"></i> 图书类型:
                    </label>
                    <div class="col-sm-9">
                        <input type="text" id="booktype" name="booktype" 
                               value="${Book.booktype}" class="form-control"
                               placeholder="请输入图书类型">
                    </div>
                </div>

                <div class="form-group row justify-content-center mt-4">
                    <button type="submit" class="btn btn-info mr-4">
                        <i class="fas fa-save icon"></i> 保存修改
                    </button>
                    <a href="<%=request.getContextPath()%>/Super/Super_about.jsp" class="btn btn-danger">
                        <i class="fas fa-ban icon"></i> 取消
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>