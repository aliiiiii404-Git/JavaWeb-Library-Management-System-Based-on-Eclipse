<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书管理系统 - 管理员首页</title>
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
    
    .carousel {
        border-radius: 10px;
        overflow: hidden;
    }
    
    .carousel-item img {
        width: 100%;
        height: 400px;
        object-fit: cover;
    }
    
    .carousel-control-prev, .carousel-control-next {
        width: 5%;
    }
    
    .carousel-indicators li {
        width: 10px;
        height: 10px;
        border-radius: 50%;
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
                        <li class="list-group-item active">
                            <a href="<%=request.getContextPath()%>/bookManager/bookManager_about.jsp">
                                <i class="fas fa-home mr-2"></i>首页
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="<%=request.getContextPath()%>/BookListServlet">
                                <i class="fas fa-book mr-2"></i>图书信息
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="<%=request.getContextPath() %>/Book/AddBook.jsp">
                                <i class="fas fa-book-plus mr-2"></i>添加图书
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="<%=request.getContextPath() %>/bookManager/BorrowBook.jsp">
                                <i class="fas fa-exchange mr-2"></i>借书
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="<%=request.getContextPath() %>/BorrowNoteServlet">
                                <i class="fas fa-history mr-2"></i>借阅记录查询
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="<%=request.getContextPath()%>/Super/Super_exit.jsp">
                                <i class="fas fa-sign-out-alt mr-2"></i>退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            
            <!-- 轮播图区域 -->
            <div class="col-md-9">
                <div class="content-card p-0">
                    <div class="carousel slide" id="demo" data-ride="carousel">
                        <!-- 指示符 -->
                        <ul class="carousel-indicators">
                            <li data-target="#demo" data-slide-to="0" class="active"></li>
                            <li data-target="#demo" data-slide-to="1"></li>
                            <li data-target="#demo" data-slide-to="2"></li>
                        </ul>
                        
                        <!-- 轮播图片 -->
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="<%=request.getContextPath()%>/img/timg3.jpg" class="d-block w-100" alt="轮播图1">
                            </div>
                            <div class="carousel-item">
                                <img src="<%=request.getContextPath()%>/img/timg1.jpg" class="d-block w-100" alt="轮播图2">
                            </div>
                            <div class="carousel-item">
                                <img src="<%=request.getContextPath()%>/img/timg2.jpg" class="d-block w-100" alt="轮播图3">
                            </div>
                        </div>
                        
                        <!-- 左右切换按钮 -->
                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#demo" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
    