<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Quản lý sản phẩm</title>
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
        <div class="main-left">
            <h1 style="color: red;">${tb}</h1>
            <form  class="add-pr" action="${pageContext.request.contextPath}/admin/product.htm" method="POST" enctype="multipart/form-data">
            	<h1>Thêm sản phẩm</h1>
			        <div class="input-fm">
	                    <label for="grid"><b>Thuộc nhóm sản phẩm :</b></label>
	                    <select style="width: 310px;height: 30px" name = "grid" >
	                       <c:forEach var="sz" items="${grpr}">
	                       		<option value="${sz.id}">${sz.name}</option>
	                       </c:forEach>
	                    </select>
	                </div>
		            <div class="input-fm">
		            	<label><b>ID sản phẩm :</b></label>
		            	<input name="id">
		            </div>
		            <div class="input-fm">
		            	<label><b>Tên sản phẩm :</b></label>
		            	<input name="name">
		            </div>
		            <div class="input-fm">
		            	<label><b>Giới thiệu sản phẩm :</b></label>
		            	<textarea rows="10" cols="15" name="content"></textarea>
		            </div>
		            <div class="input-fm">
		            	<label><b>Màu sản phẩm :</b></label>
		            	<input name="coler">
		            </div>
		            <div class="input-fm">
		            	<label><b>Giá sản phẩm :</b></label>
		            	<input  name="p" value="0">
		            </div>
		            <div class="input-fm">
		            	<label><b>Khuyến mãi :</b></label>
		            	<input  name="s" value="0">
		            </div>		

		            <div class="input-fm">
		            	<label><b>Ảnh SP 1 :</b></label>
		            	<input type="file" name="img1"/><br>
		            	<img  alt="" src="img/${prod.img1}">
		            </div>
		            <div class="input-fm">
		            	<label><b>Ảnh SP 2 :</b></label>
		            	<input type="file" name="img2"/><br>
		            	<img  alt="" src="img/${prod.img2}">
		            </div>
		            <div class="input-fm">
		            	<label><b>Ảnh SP 3 :</b></label>
		            	<input type="file" name="img3"/><br>
		            	<img  alt="" src="img/${prod.img3}">
		            </div>         
		            <div class="bt">
					<button>Thêm SP</button>	
				</div>
            </form>
            <form class="add-pr" action="${pageContext.request.contextPath}/admin/productde.htm"  method="post">
            <h1>Thêm Chi Tiết Sản phẩm</h1>
            		<div class="input-fm">
	                    <label for="prid"><b>Sản phẩm :</b></label>
	                    <select style="width: 310px;height: 30px" name = "prid" >
	                       <c:forEach var="sz" items="${prr}">
	                       		<option value="${sz.id}">${sz.id} -	${sz.name}</option>
	                       </c:forEach>
	                    </select>
	                </div>
                <div class="input-fm">
                    <label for="size"><b>Size :</b></label>
                    <input name ="size">
                </div>
                <div class="input-fm">
                    <label for="quanlity"><b>Số lượng :</b></label>
                    <input name ="quanlity">
                </div>
				<div class="bt">
					<button>Thêm chi tiết</button>	
				</div>
            </form>
        </div>
        <div class="main-right">
            <table class="table table-bg-level table-hover">
                <tr style="background-color: #2AC37D;">
                	<th>Ảnh SP</th>
                    <th>Mã SP</th>
                    <th>Tên SP</th>
                    <th>Nhóm SP</th>
                    <th>Màu</th>
                    <th>Giá</th>
                    <th>Sale</th>
                    <th>Size</th>
                    <th>SL</th>
                    <th>Trạng thái</th>
                    <th></th>
                </tr>
                <c:forEach var="a" items="${listpr}">
                		<tr style="align-items: center;">              	
                		<td> <img style="align: center;width: 80px;height: 80px" alt="" src="${pageContext.request.contextPath}/resources/img/pro/${a.product.img1}"></td>
                		<td>${a.product.id}</td>
                		<td>${a.product.name}</td>
                		<td>${a.product.groupProduct.name}</td>
                		<td>${a.product.coler}</td>
                		<td>${a.product.price}</td>
                		<td>${a.product.sale}</td>
                		<td>${a.size}</td>
                		<td>${a.quanlity}</td>
                		<c:if test="${a.product.status==0}">
                			<td>Hết Hàng</td>
                		</c:if>
                		<c:if test="${a.product.status==1}">
                			<td>Đang bán</td>
                		</c:if>
                		<td><a title="Sửa sản phẩm" href="${pageContext.request.contextPath}/admin/editpr.htm?idSanPham=${a.id}&img1=${a.product.img1}&img2=${a.product.img2}&img3=${a.product.img3}" style="color: blue;">Sửa</a> 
                		<br>
                		<a href="${pageContext.request.contextPath}/admin/deletepr.htm?idSanPham=${a.id}" >Xóa Size</a> 
                		<a href="${pageContext.request.contextPath}/admin/deletepr-all.htm?idSanPham=${a.id}">Xóa SP</a></td>	
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>