<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书管理系统 - 添加用户</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="./css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="./css/bootstrap-datetimepicker.js"></script>
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
    
    .radio-label {
        margin-right: 20px;
    }
    
    .datetimepicker {
        color: #333; /* 日期选择器内部文字颜色 */
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
                        <li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_about.jsp">
                            <i class="fas fa-home mr-2"></i>首页</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath() %>/UserListServlet">
                            <i class="fas fa-users mr-2"></i>用户信息</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath() %>/BookListServlet">
                            <i class="fas fa-book mr-2"></i>图书信息</a></li>
                        <li class="list-group-item active"><a href="<%=request.getContextPath() %>/Super/Super_AddUser.jsp">
                            <i class="fas fa-user-plus mr-2"></i>添加用户</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath() %>/Book/AddBook.jsp">
                            <i class="fas fa-book-plus mr-2"></i>添加图书</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_exit.jsp">
                            <i class="fas fa-sign-out-alt mr-2"></i>退出</a></li>
                    </ul>
                </div>
            </div>
            
            <!-- 添加用户表单 -->
            <div class="col-md-9">
                <div class="content-card">
                    <h3 class="text-center mb-4">添加用户</h3>
                    
                    <form action="<%=request.getContextPath()%>/AddUserServlet" method="post">
                        <div class="form-group row">
                            <label for="username" class="col-sm-3 col-form-label text-right">用户名:</label>
                            <div class="col-sm-9">
                                <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名">
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label text-right">性别:</label>
                            <div class="col-sm-9">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="sex" value="男" checked>
                                    <label class="form-check-label">男</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="sex" value="女">
                                    <label class="form-check-label">女</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="password" class="col-sm-3 col-form-label text-right">密码:</label>
                            <div class="col-sm-9">
                                <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码">
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="birthday" class="col-sm-3 col-form-label text-right">生日:</label>
                            <div class="col-sm-9">
                                <input type="text" id="birthday" name="birthday" class="form-control form_date" placeholder="请选择日期">
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="usertype" class="col-sm-3 col-form-label text-right">用户类型:</label>
                            <div class="col-sm-9">
                                <select id="usertype" name="usertype" class="form-control">
                                    <option value="0">图书管理员</option>
                                    <option value="1">读者</option>
                                    <option value="-1">系统管理员</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-group row justify-content-center mt-4">
                            <button type="submit" class="btn btn-info mr-4">
                                <i class="fas fa-check mr-2"></i>确认信息
                            </button>
                            <a href="Super_about.jsp" class="btn btn-danger">
                                <i class="fas fa-times mr-2"></i>取消
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        $('.form_date').datetimepicker({
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
        });
    </script>
</body>
</html>
    