<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="utf-8">
<title>Quản lý nhóm</title>
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
      <div class="main" style="display: flex; justify-content: center;">
        <div class="main-left">
            <h1 >${tb}</h1>
            <form class="add-pr" action="${pageContext.request.contextPath}/admin/gr-product.htm"  method="post">
            <h1>Thêm Nhóm Sản phẩm</h1>
            	<div class="input-fm">
                    <label for="id"><b>ID nhóm sản phẩm :</b></label>
                    <input name ="id" required>
                </div>
                <div class="input-fm">
                    <label for="name"><b>Tên nhóm sản phẩm :</b></label>
                    <input name ="name" required>
                </div>
                <div class="input-fm">
                    <label for="content"><b>Nội dung nhóm sản phẩm :</b></label>
                    <input name ="content" required>
                </div>
                
                <div class = "type">  	
                	<input type="radio" name = "brands" value="1">My brand
					<input type="radio" name = "brands" value="0">Other brand
				</div>
				<div class="bt">
					<button>Thêm nhóm SP</button>	
				</div>
            </form>
        </div>
        <div class="main-right">
           <table style="width:60%;text-align:center;border:1px solid black;margin-left:20px;margin-right:auto;" class="table table-hover">
    		<thead class="thead-dark">
    		<tr style="background-color: #2AC37D;">
    		<th>ID Nhóm sản phẩm</td>
    		<th>Tên nhóm sản phẩm</td>
    		<th>Nội dung</td>
    		<th></th>
    		</tr>
    		</thead>
    		<tbody>
        	<c:forEach var="pn" items="${grpr}">
             <tr>
             <td style="border-left: thin solid; border-top: thin solid; border-bottom: thin solid;">${pn.id}</td>
             <td style="border-top: thin solid; border-bottom: thin solid;">${pn.name}</td>
             <td style="border-top: thin solid; border-bottom: thin solid;">${pn.content}</td>
             <td><a title="Sửa sản phẩm" href="${pageContext.request.contextPath}/admin/editgr.htm?idGroup=${pn.id}" style="color: blue;">Sửa</a> 
             		<br>
                		<a href="${pageContext.request.contextPath}/admin/deletegr.htm?idGroup=${pn.id}" style="color: red;" >Xóa</a> 	
             </tr>           
        	</c:forEach>
        	</tbody>
        	</table>
        </div>
    </div>
</body>
</html>