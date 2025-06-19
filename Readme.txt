图书馆管理系统 - 项目部署说明
一、项目简介
本系统基于 Java Web 技术开发，实现图书馆的数字化管理，包括用户管理、图书管理、借阅流程等核心功能。系统采用 JSP+Servlet 架构，结合 MySQL 数据库、C3P0 连接池和 Apache Commons DbUtils 工具，适合作为 JavaWeb 课程大作业或中小型图书馆管理解决方案。
二、运行环境要求
	1. 硬件环境
	服务器端：CPU 双核及以上，内存 4GB 及以上，硬盘空间 50GB 及以上
	客户端：普通 PC 或笔记本电脑，支持 HTML5 和 JavaScript 的浏览器（Chrome、Firefox、Edge 等）
	2. 软件环境
	服务器端：
 	JDK 1.8 及以上（推荐 1.8）
 	Tomcat 9.0 及以上（推荐 9.0）
	MySQL 5.7.27 及以上（推荐 5.7）
	开发工具（可选）：
	Eclipse/IDEA（用于项目导入和调试）
	
三、项目部署步骤
	1. 数据库配置：执行项目根目录下的lms.sql脚本
	2. 项目部署
	（1）导入项目到 IDE
	使用 Eclipse：File -> Import -> Existing Projects into Workspace，选择项目根目录
	使用 IDEA：File -> Open，选择项目根目录并配置为 Java Web 项目
	（2）配置 Tomcat 服务器
	在 IDE 中添加 Tomcat 服务器（以 Eclipse 为例）：
	Window -> Show View -> Servers
	右键 Servers 视图 -> New -> Server -> Tomcat v9.0 Server
	配置 Tomcat 安装路径和 JDK 版本
	部署项目：
	右键项目 -> Run As -> Run on Server
	选择配置好的 Tomcat 服务器，上下文路径默认设为/LMS
	（3）修改数据库连接配置
	修改src/c3p0-config.xml文件中的数据库连接参数：
	xml
	<default-config>
   	 <property name="driverClass">com.mysql.jdbc.Driver</property>
   	 <property name="jdbcUrl">jdbc:mysql://localhost:3306/lms?serverTimezone=Asia/Shanghai</property>
   	 <property name="user">root</property>
    	<property name="password">你的数据库密码</property>
   	 <!-- 其他配置保持默认即可 -->
	</default-config>
四、系统访问与默认账号
	1. 访问地址
	启动 Tomcat 后，在浏览器中输入：
	plaintext
	http://localhost:8080/LMS
	2. 默认账号密码
	角色	用户名	密码	功能权限
	系统管理员	admin	123	全功能管理（用户 / 图书 / 系统）
	图书管理员	ali	123	图书管理、借阅办理
	普通读者 	reader	123	图书查询、个人借阅管理
五、常见问题解决方案
	1. 数据库连接失败
	检查c3p0-config.xml中的用户名、密码和数据库名是否正确
	确认 MySQL 服务已启动，端口号（默认 3306）未被占用
	2. 部署后访问 404
	检查 Tomcat 控制台日志，确认项目是否部署成功
	清理项目并重新部署（IDE 中右键项目 -> Clean）
	确认访问 URL 路径正确
	3. 登录后功能异常
	检查数据库中user_type字段是否正确（管理员 / 图书管理员 / 读者）
	确认 Servlet 路径映射是否正确（如BorrowBooksServlet的 URL 注解）
	4. 中文乱码问题
	确保 JSP 页面顶部添加编码声明：
	jsp
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	数据库连接 URL 添加编码参数：
	xml
	<property name="jdbcUrl">jdbc:mysql://localhost:3306/lms?serverTimezone=Asia/Shanghai&characterEncoding=utf8mb4</property>

六、项目结构说明
LMS/
├── src/                        # 源代码目录
│   ├── com/
│   │   └── ghy/
│   │       └── myworkplus/
│   │           ├── bean/       # 实体类（User/Book/BorrowRecord等）
│   │           ├── dao/        # 数据访问接口
│   │           ├── daoimpl/    # 数据访问实现类
│   │           ├── servlet/    # Servlet控制器
│   │           ├── tool/       # 工具类（JDBCUtil等）
│   └── META-INF/
├── WebContent/                 # Web资源目录
│   ├── bookManager/            # 图书管理相关JSP
│   ├── css/                    # 样式文件
│   ├── img/                    # 图片资源
│   ├── js/                     # JavaScript文件
│   ├── WEB-INF/
│   │   ├── lib/                # 依赖jar包
│   │   └── web.xml             # 部署描述符
│   └── index.jsp               # 登录页面           
└── c3p0-config.xml             # 连接池配置文件

通过以上步骤，即可成功部署并运行本图书馆管理系统。如有其他问题，可通过项目文档或联系开发者（13359416496 作者手机号）获取支持。
