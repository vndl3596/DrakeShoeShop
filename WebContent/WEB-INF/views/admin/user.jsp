<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="utf-8">
<title>Quản lý thành viên</title>
<base href="${pageContext.servletContext.contextPath }" />
<style>
<%@ include file="/resources/css/reset.css"%>
<%@ include file="/resources/css/manager-pr.css"%>
</style>
</head>
<body>
	    <div class="header">
        <div class="container-header">
            <div class="left-header">
                <img src=" ${pageContext.request.contextPath}/resources/img/logo/HLogo.PNG" alt="">
            </div>
            <div class="right-header">
                <ul>
                	<li><a href="../drakeshop-final/admin/donhang.htm">Đơn hàng</a></li>
                    <li><a href="../drakeshop-final/admin/product.htm">Sản phẩm</a></li>
                    <li><a href="../drakeshop-final/admin/group-product.htm">Nhóm sản phẩm</a></li>
                    <li><a href="../drakeshop-final/admin/user.htm">Thành viên</a></li>
                    <li><a href="../drakeshop-final/admin/stats.htm">Thống kê</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="main">
        <div class="main-right" style="width: 100%; margin-left: 15px;">
            <table class="table table-hover">
                <tr style="background-color: #2AC37D;">
                	<th>Username</th>
                	<th>Họ và tên</th>
                    <th>Giới tính</th>
                    <th>Ngày sinh</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Địa chỉ</th>
                    <th></th>
                </tr>
            	
				<c:forEach var="a" items="${userlist}">
                		<tr>              	
                			<td>${a.username}</td>
                			<td>${a.fullname}</td>
                			<c:choose>
                			<c:when test="${a.gender > 0}"><td>Nam</td></c:when>
                			<c:otherwise><td>Nữ</td></c:otherwise>
                			</c:choose>
                			<td>${a.birthday}</td>
                			<td>${a.email}</td>
                			<td>0${a.phone}</td>
                			<td>${a.address}</td>
                			<td><a href="${pageContext.request.contextPath}/admin/deleteuser.htm?username=${a.username}">Xóa User</a></td>
                		</tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>