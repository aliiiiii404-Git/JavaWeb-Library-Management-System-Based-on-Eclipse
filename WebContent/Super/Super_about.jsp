<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书管理系统首页</title>
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
    
    .carousel-container {
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    }
    
    .carousel-item {
        transition: transform 0.6s ease-in-out;
    }
    
    .carousel-control-prev, .carousel-control-next {
        width: 8%;
    }
    
    .carousel-control-prev-icon, .carousel-control-next-icon {
        width: 30px;
        height: 30px;
        background-color: #007bff; /* 确保控制按钮可见 */
        border-radius: 50%;
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
    
    .imgs {
        width: 100%;
        height: 400px;
        object-fit: cover;
        background-position: center;
        background-size: cover;
    }
    
    .content-container {
        min-height: calc(100vh - 100px);
    }
    
    /* 轮播指示符样式 */
    .carousel-indicators li {
        width: 12px;
        height: 12px;
        border-radius: 50%;
        background-color: rgba(255, 255, 255, 0.5);
        border: none;
    }
    
    .carousel-indicators .active {
        background-color: #007bff;
    }
</style>
</head>
<body>
    <h2 align="center" class="mt-5 text-white font-bold text-2xl">图书管理系统首页</h2>
    
    <div class="container content-container">
        <div class="row mt-5">
            <!-- 侧边栏导航 -->
            <div class="col-md-3">
                <div class="sidebar">
                    <ul class="list-group">
                        <li class="list-group-item active bg-primary text-white">
                            <a href="<%=request.getContextPath() %>/Super/Super_about.jsp" class="text-white">
                                <i class="fas fa-home mr-2"></i>首页
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="<%=request.getContextPath() %>/UserListServlet" class="text-white">
                                <i class="fas fa-users mr-2"></i>用户信息
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="<%=request.getContextPath() %>/BookListServlet" class="text-white">
                                <i class="fas fa-book mr-2"></i>图书信息
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="<%=request.getContextPath() %>/Super/Super_AddUser.jsp" class="text-white">
                                <i class="fas fa-user-plus mr-2"></i>添加用户
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="<%=request.getContextPath() %>/Book/AddBook.jsp" class="text-white">
                                <i class="fas fa-book-plus mr-2"></i>添加图书
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="<%=request.getContextPath() %>/Super/Super_exit.jsp" class="text-white">
                                <i class="fas fa-sign-out-alt mr-2"></i>退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            
            <!-- 轮播图区域 -->
            <div class="col-md-9 carousel-container">
                <div class="carousel slide" id="demo" data-ride="carousel">
                    <!-- 指示符 -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                        <li data-target="#demo" data-slide-to="3"></li>
                        <li data-target="#demo" data-slide-to="4"></li>
                        <li data-target="#demo" data-slide-to="5"></li>
                        <li data-target="#demo" data-slide-to="6"></li>
                        <li data-target="#demo" data-slide-to="7"></li>
                    </ul>

                    <!-- 轮播图片 -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="imgs" src="<%=request.getContextPath() %>/img/a.png" alt="图片1">
                        </div>
                        <div class="carousel-item">
                            <img class="imgs" src="<%=request.getContextPath() %>/img/b.png" alt="图片2">
                        </div>
                        <div class="carousel-item">
                            <img class="imgs" src="<%=request.getContextPath() %>/img/c.png" alt="图片3">
                        </div>
                        <div class="carousel-item">
                            <img class="imgs" src="<%=request.getContextPath() %>/img/d.png" alt="图片4">
                        </div>
                        <div class="carousel-item">
                            <img class="imgs" src="<%=request.getContextPath() %>/img/e.png" alt="图片5">
                        </div>
                        <div class="carousel-item">
                            <img class="imgs" src="<%=request.getContextPath() %>/img/timg3.jpg" alt="图片6">
                        </div>
                        <div class="carousel-item">
                            <img class="imgs" src="<%=request.getContextPath() %>/img/timg1.jpg" alt="图片7">
                        </div>
                        <div class="carousel-item">
                            <img class="imgs" src="<%=request.getContextPath() %>/img/timg2.jpg" alt="图片8">
                        </div>
                    </div>

                    <!-- 左右切换按钮 -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon rounded-circle"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon rounded-circle"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // 初始化轮播图，设置自动播放间隔
        $(document).ready(function(){
            $('#demo').carousel({
                interval: 3000,  // 每3秒切换一张图片
                pause: false     // 鼠标悬停时不暂停
            });
        });
    </script>
</body>
</html>
    