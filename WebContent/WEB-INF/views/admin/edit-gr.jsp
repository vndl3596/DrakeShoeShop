<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chỉnh sửa nhóm sản phẩm</title>
<base href="${pageContext.servletContext.contextPath }" />
<style>
<%@ include file="/resources/css/reset.css"%>
<%@ include file="/resources/css/editpr.css"%>
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
        <div class="main-left">
     		<form class="add-pr" action="${pageContext.request.contextPath}/admin/editgr.htm"  method="post" enctype="multipart/form-data">
            <h1>Sửa Nhóm Sản phẩm</h1>
            	<div class="input-fm">
                    <label for="id"><b>ID nhóm sản phẩm :</b></label>
                    <input value="${gr.id}" disabled="disabled">
                    <input name = "id" type="hidden" value="${gr.id}">
                </div>
                <div class="input-fm">
                    <label for="name"><b>Tên nhóm sản phẩm :</b></label>
                    <input name ="name" value="${gr.name}">
                </div>
                <div class="input-fm">
                    <label for="content"><b>Nội dung nhóm sản phẩm :</b></label>
                    <input name ="content" value="${gr.content}">
                </div>
                
                <div class = "type">  	
                	<input type="radio" name = "brands" value="1" >My brand
					<input type="radio" name = "brands" value="0">Other brand
				</div>
				<div class="bt">
					<button>Sửa</button>	
				</div>
            </form>
        </div>
    </div>
</body>
</html>