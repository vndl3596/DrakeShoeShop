<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Drake Shoe Shop - ${user.fullname}</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/slider.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/sub.js"></script>
<base href="${pageContext.servletContext.contextPath }" />
<style>
<%@ include file="/resources/css/reset.css"%>
<%@ include file="/resources/css/index.css"%>
<%@ include file="/resources/css/user-detail.css"%>
*[id$=errors]{
	color:red;
	font-style: italic;
}
</style>
</head>
<body>
	<header>
		<div class="container">
			<div class="contener1">
					<ul class="navbar" style="padding-top: 10px; padding-bottom: 10px;">
					<a href=""><img src=" ${pageContext.request.contextPath}/resources/img/logo/HLogo.PNG" alt="" width="230px" height="75px" style="margin-bottom: 10px; margin-top: 10px;"></a>
					<c:forEach var="menu1" items="${menu}">
							<c:if test="${menu1.parentid==null}">
								<li>
									<a href="${pageContext.request.contextPath}/${menu1.link}">${menu1.name}</a>
									<c:if test="${menu1.name=='Sản Phẩm'}">
										<div class="sub-menu">
										<div class="sub-menu1">
											<ul>
												<c:forEach var="menu2" items="${menu}">
													<c:if test="${menu2.parentid==menu1.id}">
														<li><a href="${pageContext.request.contextPath}/list/${menu2.link}.htm">${menu2.name }</a></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</div>
									</c:if>
								</li>
							</c:if>
						</c:forEach>
					</ul>
                <div class="navbar-right">
                    <div class="search">
                    	<form action="home/search.htm" method="post">
                    		<input class="ip-search" name="search"/>
                        	<button type="submit"><i class="fas fa-search icon-search"></i></button>
                    	</form>
                    </div>
                    <button onclick="document.getElementById('user').style.display='block'"><i class="fas fa-user"></i></button>
                </div>
			</div>
		</div>
		        <div id="user" class="user-box">
            <span onclick="document.getElementById('user').style.display='none'" class="close" title="Close Modal">&times;</span>
            <div class="user-content">
                <div class="content-top">
                    <c:if test="${username != 'Guest'}">
                    	<i class="fas fa-user-circle"></i>
                    	<a href="${pageContext.request.contextPath}/home/user.htm?username=${username}" style="font-size: 14px;">${user.fullname}</a>
                   	</c:if>
                </div>
                <div class="content-bottom">
                    <c:choose>
                    	<c:when test="${username=='Guest'}">
                    		<button > <a href="${pageContext.request.contextPath}/home/login.htm"> Đăng nhập</a> </button>
                    		<button > <a href="${pageContext.request.contextPath}/home/sign-up.htm"> Đăng kí</a> </button>
                    		
                    	</c:when>
                    	<c:otherwise><button > <a href="${pageContext.request.contextPath}/home/login.htm"> Đăng xuất</a> </button></c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
	</header>
	<div class="user-detail" style="display: flex; height: 100%; width: 100%; justify-content: center;  background-color: whitesmoke;">
		<div class="left-content" style="height: 100%;">
			<img alt="" src="${pageContext.request.contextPath}/resources/img/login/login.jpg" style="height: 500px; width: 400px;">
		</div>
		<div class="right-content" style="padding: 20px 20px 20px 20px; background-color: white;">
					<div style="display: flex; justify-content: center;">
						<img alt="" src="${pageContext.request.contextPath}/resources/img/login/user.png" width="70px" height="70px" style="border-radius: 50px; align-self: center; margin: 0 10px 0 10px;">
					</div> 
					<h2 style="margin-left: 115px;">${message}</h2>
					<form:form class="user-detail" action="${pageContext.request.contextPath}/home/user.htm?username=${username}" modelAttribute="user" method="post">
						<h4>1. Thông tin cá nhân:</h4>
						<div class="row" style="justify-content: space-between;">
							<div style="display: flex; justify-content: space-between;">
								<label>Họ và tên</label>
								<label style="margin-right: 30%;">Ngày sinh</label>
							</div>
							<form:input path="fullname"/>
							<form:errors path="fullname"/>
							<form:input placeholder="MM/DD/YYYY" path="birthday"/>
							<form:errors path="birthday"/>
						</div>
						<div>
						<label>Giới tính:</label>
						<form:radiobutton path="gender" value="1" label="Nam"/>
						<form:radiobutton path="gender" value="0" label="Nữ" />
						<form:errors path="gender"/>
						</div>
						<div class="row" style="justify-content: space-between;">
							<div style="display: flex; justify-content: space-between;">
								<label style="margin-top: 10px;">Email</label>
								<label style="margin-right: 24%; margin-top: 10px;">Số điện thoại</label>
							</div>
							<form:input type="email" path="email"/>
							<form:errors path="email"/>
							<form:input path="phone"/>
							<form:errors path="phone"/>
						</div>
						<div style="width: 100%;">
							<div>Địa chỉ</div>
							<form:input path="address" cssClass="in-long"/>
							<form:errors path="address"/>
						</div>							
						<h4>2. Thông tin đăng nhập:</h4>
						<div>
							<div>Tài khoản</div>
							<form:input path="username" disabled="true"/>
							<form:errors path="username"/>
						</div>
						<div>
							<div>Mật khẩu</div>
							<form:input type="password" path="password"/>
							<form:errors path="password"/>
						</div>
						<div style="display: flex; justify-content: center;">
							<button type="submit" style="  width: 120px; height: 30px; background-color: #2AC37D; border: #2AC37D 2px solid; color: white;">Lưu thông tin</button>
						</div>
					</form:form>
		</div>
	</div>
        <footer>
        <div class="footer-cont">
            <img src="${pageContext.request.contextPath}/resources/img/logo/FLogo1.PNG" alt="" height="200px" width="400px">
            <ul>
                Sản phẩm
                <li><a href="${pageContext.request.contextPath}/list/new.htm">News</li>
                <li><a href="${pageContext.request.contextPath}/hlist/best.htm">Trending</a></li>
                <li><a href="${pageContext.request.contextPath}/list/sale.htm">Sale-off</a></li>
            </ul>
            <ul>
                Hỗ Trợ
                <li><a href="">FAQs</a></li>
                <li><a href="">Chính sách chung</a></li>
                <li><a href="">Tra cứu đơn hàng</a></li>
            </ul>
            <ul>
                Chăm sóc khách hàng
                <li><a href="mailto:drakeshop456@gmail.com">Email : drakeshop456@gmail.com</a></li>
                <li><a href="Tel: +84937220747">Hotline : 0937220747</a></li>
            </ul>
        </div>
        <span style="color: gray; font-size: 15px; font-weight: bold;">Copyright © 2021 DreakShop. All rights reserved.</span>
    </footer>
</body>
<script>
    // Get the modal
    var modalus = document.getElementById('user');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modalus) {
            modalus.style.display = "none";
        }
    }
    var modalsu = document.getElementById('cart');
    window.onclick = function(event) {
        if (event.target == modalsu) {
            modalsu.style.display = "none";
        }
    }
</script>
</html>