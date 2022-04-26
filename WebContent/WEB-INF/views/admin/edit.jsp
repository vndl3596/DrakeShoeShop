<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chỉnh sửa sản phẩm</title>
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
            <h1>Sửa SP</h1>
            <form class="sign-up-form" action="${pageContext.request.contextPath}/admin/editpr.htm" method="POST" enctype="multipart/form-data">
           		<input style="display: none" type="text" value="${prd.id}" name="idSanPham" required>
                <div class="input-fm">
                    <label><b>ID SP</b></label>
                    <input style="width: 310px;height: 30px" type="text" value="${prd.product.id}" readonly="readonly" required disabled="disabled">
                    <input name="id" type="hidden" value="${prd.product.id}">
                </div>
                <div class="input-fm">
                    <label><b>Tên SP</b></label>
                    <input style="width: 310px;height: 30px"  type="text" value="${prd.product.name}" name="name" required>
                </div>
                <div class="input-fm">
	                    <label for="grid"><b>Thuộc nhóm sản phẩm :</b></label>
	                    <select style="width: 310px;height: 30px" name = "grid" >
	                       <c:forEach var="sz" items="${grpr}">
	                       		<c:choose>
	                       			<c:when test="${sz.id==prd.product.groupProduct.id}"><option selected="selected" value="${sz.id}">${sz.name}</option></c:when>
	                       			<c:otherwise><option value="${sz.id}">${sz.name}</option></c:otherwise>
	                       		</c:choose>
	                       </c:forEach>
	                    </select>
	            </div>
                <div class="input-fm">
		            	<label><b>Giới thiệu sản phẩm :</b></label>
						<textarea style="width: 310px;height: 80px"  name="content">${prd.product.content}</textarea>
		            </div>
		            <div class="input-fm">
		            	<label><b>Màu sản phẩm :</b></label>
		            	<input style="width: 310px;height: 30px"  value="${prd.product.coler}" name="coler">
		            </div>
		            <div class="input-fm">
		            	<label><b>Giá sản phẩm :</b></label>
		            	<input style="width: 310px;height: 30px"  value="${prd.product.price}"  name="p" >
		            </div>
		            <div class="input-fm">
		            	<label><b>Khuyến mãi :</b></label>
		            	<input style="width: 310px;height: 30px"  value="${prd.product.sale}"  name="s" >
		            </div>		

		            <div class="input-fm">
		            	<label><b>Ảnh SP 1 :</b></label>
		            	<input style="width: 310px;height: 30px" value="${prd.product.img1}"     type="file" name="img1"/><br>
		            	<img style="width: 80px;height: 80px"  alt="" src="${pageContext.request.contextPath}/resources/img/pro/${prd.product.img1}">
		            </div>
		            <div class="input-fm">
		            	<label><b>Ảnh SP 2 :</b></label>
		            	<input style="width: 310px;height: 30px" value="${prd.product.img2}"     type="file" name="img2"/><br>
		            	<img style="width: 80px;height: 80px"  alt="" src="${pageContext.request.contextPath}/resources/img/pro/${prd.product.img2}">
		            </div>
		            <div class="input-fm">
		            	<label><b>Ảnh SP 3 :</b></label>
		            	<input style="width: 310px;height: 30px"  value="${prd.product.img3}"    type="file" name="img3"/><br>
		            	<img style="width: 80px;height: 80px"  alt="" src="${pageContext.request.contextPath}/resources/img/pro/${prd.product.img3}">
		            </div>
		            <div class = "type">  	
                	<input type="radio" checked="checked" name = "status" value="1">Còn hàng
					<input type="radio" name = "status" value="0">Hết
					</div>
		            <div class="input-fm">
                    <label for="size"><b>Size :</b></label>
                    <input style="width: 310px;height: 30px"  value="${prd.size}" name ="size">
                </div>
                <div class="input-fm">
                    <label for="quanlity"><b>Số lượng :</b></label>
                    <input style="width: 310px;height: 30px"  value="${prd.quanlity}" name ="quanlity">
                </div>
                <button type="submit">Sửa</button>

            </form>
        </div>
    </div>
</body>
</html>