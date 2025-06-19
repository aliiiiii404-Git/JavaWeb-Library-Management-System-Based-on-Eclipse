<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书馆管理系统 - 登录</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
body {
    background-image: url("img/background (3).jpg");
    background-size: cover;
    background-attachment: fixed;
    color: white;
    min-height: 100vh;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
}

.container {
    flex-grow: 1;
    display: flex;
    justify-content: center;
    align-items: center;
}

.marquee-container {
    background-color: rgba(0, 0, 0, 0.7);
    padding: 10px;
    margin-bottom: 20px;
}

.marquee-text {
    color: white;
    font-size: 1.2rem;
    font-weight: bold;
}

.info-box {
    background-color: rgba(0, 0, 0, 0.7);
    padding: 10px;
    margin: 10px auto;
    border-radius: 5px;
    width: fit-content;
}

.login-card {
    background-color: rgba(0, 0, 0, 0.7);
    padding: 40px;
    border-radius: 10px;
    width: 100%;
    max-width: 450px;
    backdrop-filter: blur(5px);
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
}

.login-title {
    text-align: center;
    margin-bottom: 30px;
    color: white;
}

.form-group {
    margin-bottom: 25px;
}

.form-control, .dropdown {
    background-color: rgba(255, 255, 255, 0.1);
    border-color: rgba(255, 255, 255, 0.3);
    color: white;
    border-radius: 5px;
    padding: 8px 15px;
}

.form-control:focus, .dropdown:focus {
    background-color: rgba(255, 255, 255, 0.2);
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    color: white;
}

label {
    margin-bottom: 8px;
    color: white;
    font-weight: 500;
}

.btn {
    background-color: #007bff;
    border-color: #007bff;
    color: white;
    padding: 10px 20px;
    font-weight: 500;
    transition: all 0.3s ease;
    width: 100%;
}

.btn:hover {
    background-color: #0056b3;
    border-color: #0056b3;
    transform: translateY(-2px);
}

.error-message {
    color: #dc3545;
    background-color: rgba(220, 53, 69, 0.1);
    padding: 10px;
    border-radius: 5px;
    margin-bottom: 20px;
    text-align: center;
}
</style>
</head>
<body>
    <!-- 文字滚动 -->
    <div class="marquee-container">
        <marquee class="marquee-text" scrollamount="10" direction="left">
            兰州理工大学的校训是 “奋进求是”
        </marquee>
    </div>
    
    <!-- 学号和姓名信息 -->
    <div class="info-box">
        <span><i class="fas fa-user-circle mr-2"></i>学号：2335506190 姓名：邸泽昊</span>
    </div>
    
    <!-- 登录表单 -->
    <div class="container">
        <div class="login-card">
            <h3 class="login-title">
                <i class="fas fa-book-open mr-2"></i>图书馆管理系统
            </h3>
            
            <!-- 登录失败提示 -->
            <c:if test="${not empty message}">
                <div class="error-message">
                    <i class="fas fa-exclamation-circle mr-2"></i>${message}
                </div>
            </c:if>
            
            <form action="LoginCheck" method="post">
                <div class="form-group">
                    <label for="username"><i class="fas fa-user mr-2"></i>账户：</label>
                    <input type="text" id="username" name="username" 
                           class="form-control" placeholder="请输入用户名" required>
                </div>
                
                <div class="form-group">
                    <label for="password"><i class="fas fa-lock mr-2"></i>密码：</label>
                    <input type="password" id="password" name="password" 
                           class="form-control" placeholder="请输入密码" required>
                </div>
                
                <div class="form-group">
                    <label for="usertype"><i class="fas fa-user-tag mr-2"></i>用户类型：</label>
                    <select class="form-control dropdown" name="usertype" required>
                        <option value="-1">系统管理员</option>
                        <option value="0">图书管理员</option>
                        <option value="1">读者</option>
                    </select>
                </div>
                
                <button type="submit" class="btn">
                    <i class="fas fa-sign-in-alt mr-2"></i>登录
                </button>
            </form>
        </div>
    </div>
</body>
</html>