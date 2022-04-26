<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quên mật khẩu</title>
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
<%@ include file="/resources/css/user-login.css"%>
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
	<div class="login-container">
		<div class="login-img">
			<img alt="" src="${pageContext.request.contextPath}/resources/img/login/login.jpg" style="height: 600px; width: 400px;">
		</div>
        <div id="login" class="login-box">
            <div class="login-content">
                <img src="/img/AN.png" alt="">
                <lable>${tinnhan}</lable>
                <h1>Quên mật khẩu</h1>
                <form class="login-form"  action="${pageContext.request.contextPath}/home/forget-pass.htm" method="post">
                    <div class="usern">
                        <label for="uname"><b>Username</b></label>
                        <input type="text" placeholder="Enter Username" name="username" required>
                    </div>
                    <button >Gửi mail</button>
                </form>
                <div class="login-bottom" style="margin-top: 20px;">
                    	<span><a href="${pageContext.request.contextPath}/home/login.htm" style="color: black; font-size: 14px;">Đăng nhập?</a></span>
                    	<span><a href="${pageContext.request.contextPath}/home/sign-up.htm" style="color: black; font-size: 14px;">Đăng kí?</a></span>
                </div>
            </div>
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