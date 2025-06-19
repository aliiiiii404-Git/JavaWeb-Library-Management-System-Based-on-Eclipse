<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书管理系统 - 用户管理</title>
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
        color: white;
    }
    
    .sidebar {
        background-color: rgba(0, 0, 0, 0.7);
        border-radius: 10px;
        backdrop-filter: blur(5px);
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
    
    .btn-default {
        background-color: rgba(255, 255, 255, 0.1);
        color: white;
        border-color: rgba(255, 255, 255, 0.3);
    }
    
    .btn-default:hover {
        background-color: rgba(255, 255, 255, 0.2);
    }
    
    .list-group-item {
        background-color: rgba(255, 255, 255, 0.1);
        color: white;
        border-color: rgba(255, 255, 255, 0.3);
    }
    
    .list-group-item.active {
        background-color: #007bff;
        border-color: #007bff;
    }
    
    .list-group-item a {
        color: white;
    }
    
    .list-group-item:hover {
        background-color: rgba(255, 255, 255, 0.2);
    }
    
    a {
        color: #42a5f5;
    }
    
    a:hover {
        color: #90caf9;
    }
</style>
<script type="text/javascript">
    function doDelete(userid) {
        var flag = confirm("是否确定删除?");
        if(flag){
            location.href="DeleteServlet?Userid="+userid;
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
                        <li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_about.jsp">
                            <i class="fas fa-home mr-2"></i>首页</a></li>
                        <li class="list-group-item active"><a href="<%=request.getContextPath() %>/UserListServlet">
                            <i class="fas fa-users mr-2"></i>用户信息</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath() %>/BookListServlet">
                            <i class="fas fa-book mr-2"></i>图书信息</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_AddUser.jsp">
                            <i class="fas fa-user-plus mr-2"></i>添加用户</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath() %>/Book/AddBook.jsp">
                            <i class="fas fa-book-plus mr-2"></i>添加图书</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_exit.jsp">
                            <i class="fas fa-sign-out-alt mr-2"></i>退出</a></li>
                    </ul>
                </div>
            </div>
            
            <!-- 用户列表内容 -->
            <div class="col-md-9">
                <div class="content-card">
                    <table class="table table-bordered table-hover">
                        <tr class="bg-dark">
                            <th>用户id</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>生日</th>
                            <th>性别</th>
                            <th>用户类型</th>
                            <th>账号状态</th>
                            <th>欠费金额</th>
                            <th>操作</th>
                        </tr>

                        <c:forEach items="${pageBean.list }" var="users">
                        <tr align="center">
                            <td>${users.userid }</td>
                            <td>${users.username }</td>
                            <td>${users.passwords }</td>
                            <td>${users.birthday }</td>
                            <td>${users.sex }</td>
                            <td>
                                <c:if test="${users.usertype == 0}">图书管理员</c:if>
                                <c:if test="${users.usertype == 1}">读者</c:if>
                                <c:if test="${users.usertype == -1}">系统管理员</c:if> 
                            </td>
                            <td>
                                <c:if test="${users.isfull == '0'}">正常</c:if>
                                <c:if test="${users.isfull == '1'}">欠费</c:if>
                            </td>
                            <td>${users.money }</td>
                            <td>
                                <a href="EditUserServlet?userid=${users.userid }" class="text-info">更新</a>
                                <a href="#" onclick="doDelete(${users.userid})" class="text-danger">删除</a>
                            </td>
                        </tr>
                        </c:forEach>
                        
                        <tr>
                            <td colspan="9">
                                <div class="text-center">
                                    第 ${pageBean.currentPage } / ${pageBean.totalPage } 页
                                    &nbsp;&nbsp;
                                    每页显示${pageBean.pageSize }条  &nbsp;&nbsp;&nbsp;
                                    总的记录数${pageBean.totalSize } &nbsp;&nbsp;&nbsp;
                                    
                                    <c:if test="${pageBean.currentPage !=1 }">
                                        <a href="UserListServlet?currentPage=1" class="btn btn-sm btn-default">首页</a>
                                        <a href="UserListServlet?currentPage=${pageBean.currentPage-1 }" class="btn btn-sm btn-default">上一页</a>
                                    </c:if>
                                    
                                    <c:forEach begin="1" end="${pageBean.totalPage }" var="i">
                                        <c:if test="${pageBean.currentPage == i }">
                                            <span class="btn btn-sm btn-primary disabled">${i }</span>
                                        </c:if>
                                        <c:if test="${pageBean.currentPage != i }">
                                            <a href="UserListServlet?currentPage=${i }" class="btn btn-sm btn-default">${i }</a>
                                        </c:if>
                                    </c:forEach>
                                    
                                    <c:if test="${pageBean.currentPage !=pageBean.totalPage }">
                                        <a href="UserListServlet?currentPage=${pageBean.currentPage+1 }" class="btn btn-sm btn-default">下一页</a>
                                        <a href="UserListServlet?currentPage=${pageBean.totalPage }" class="btn btn-sm btn-default">尾页</a>
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                    </table>
                    
                    <!-- 分页导航 -->
                    <nav class="text-center">
                        <ul class="pagination justify-content-center">
                            <li class="page-item ${pageBean.currentPage == 1 ? 'disabled' : ''}">
                                <a href="UserListServlet?currentPage=${pageBean.currentPage-1 }" class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            
                            <c:forEach begin="1" end="${pageBean.totalPage }" var="i">
                                <li class="page-item ${pageBean.currentPage == i ? 'active' : ''}">
                                    <a href="UserListServlet?currentPage=${i }" class="page-link">${i }</a>
                                </li>
                            </c:forEach>
                            
                            <li class="page-item ${pageBean.currentPage == pageBean.totalPage ? 'disabled' : ''}">
                                <a href="UserListServlet?currentPage=${pageBean.currentPage+1 }" class="page-link" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    
                    <a href="admin_addStudent.jsp" class="btn btn-default"><i class="fas fa-plus mr-2"></i>添加单个用户</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
    