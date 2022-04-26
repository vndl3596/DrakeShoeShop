<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Drake Shoe Shop</title>
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
<%@ include file="/resources/css/home.css"%>
<%@ include file="/resources/css/list-pro.css"%>
<%@ include file="/resources/css/pro-del.css"%>
<%@ include file="/resources/css/checkout.css"%>
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
                    	<form action="${pageContext.request.contextPath}/list/search.htm" method="post">
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
	<div class="slider">
        <div class=" owl-carousel owl-theme ">
			<c:forEach var = "ban" items="${banner}">
				<c:if test="${ban.status== 1}">
				<div class="item">
                   <div class="item-con">
                    <img src="${pageContext.request.contextPath}/resources/img/banner/${ban.link}">
                  </div>
            	</div>
				</c:if>
			</c:forEach>
        </div>
    </div>
	<br>
	<div class="new-pro">
        <a href="">
            <h1>Sản phẩm mới</h1>
        </a>
        <div class="container-pro">
        	<c:forEach var="pn" items="${newproduct}">
        	<div class="item-pro">
                <div class="sale">
                    <a href="${pageContext.request.contextPath}/detail/${pn.id}.htm"><img src="${pageContext.request.contextPath}/resources/img/pro/${pn.img1}" alt=""></a>
                    <c:if test="${pn.sale!=0}">
                    	<h1>-${pn.sale}%</h1>
                    </c:if>
                </div>
                <a href="${pageContext.request.contextPath}/detail/${pn.id}.htm">${pn.name}</a>
                <h3>${pn.coler}</h3>
                <div style="margin-top: 5px" class="price">
                    <c:if test="${pn.sale==0}">
                    	<h3><fmt:formatNumber pattern="###,### đ" value="${pn.price}" type="currency" /></h3>
                    </c:if>
                    <c:if test="${pn.sale!=0}">
                    	<del><h3><fmt:formatNumber pattern="###,###" value="${pn.price}" type="currency" /> </h3></del>
                    	<h3><fmt:formatNumber pattern="###,### đ" value="${pn.price - (pn.price*pn.sale)/100}" type="currency" /></h3>
                    </c:if>
                </div>
                <div class="bt-ab">
                    <a class="bt-mua" href="${pageContext.request.contextPath}/home/shopping-now.htm?id=${pn.id }&name=${pn.name }&coler=${pn.coler}&gia=${pn.price - (pn.price*pn.sale)/100 }&image=${pn.img1}">Mua ngay</a>
                    <a class="bt-add" href="${pageContext.request.contextPath}/home/shopping.htm?id=${pn.id }&name=${pn.name }&coler=${pn.coler}&gia=${pn.price - (pn.price*pn.sale)/100 }&image=${pn.img1}">Thêm</a>
                </div>
            </div>
        	</c:forEach>
        </div>
    </div>
    <br>
    <div class="new-pro">
        <a href="">
            <h1>Sản phẩm bán chạy nhất</h1>
        </a>
        <div class="container-pro">
        	<c:forEach var="pn" items="${bestproduct}">
        	<div class="item-pro">
                <div class="sale">
                    <a href="${pageContext.request.contextPath}/detail/${pn.id}.htm"><img src="${pageContext.request.contextPath}/resources/img/pro/${pn.img1}" alt=""></a>
                    <c:if test="${pn.sale!=0}">
                    	<h1>-${pn.sale}%</h1>
                    </c:if>
                </div>
                <a href="${pageContext.request.contextPath}/detail/${pn.id}.htm">${pn.name}</a>
                <h3>${pn.coler}</h3>
                <div style="margin-top: 5px" class="price">
                    <c:if test="${pn.sale==0}">
                    	<h3><fmt:formatNumber pattern="###,### đ" value="${pn.price}" type="currency" /></h3>
                    </c:if>
                    <c:if test="${pn.sale!=0}">
                    	<del><h3><fmt:formatNumber pattern="###,###" value="${pn.price}" type="currency" /> </h3></del>
                    	<h3><fmt:formatNumber pattern="###,### đ" value="${pn.price - (pn.price*pn.sale)/100}" type="currency" /></h3>
                    </c:if>
                </div>
                <div class="bt-ab">
                    <a class="bt-mua" href="${pageContext.request.contextPath}/home/shopping-now.htm?id=${pn.id }&name=${pn.name }&coler=${pn.coler}&gia=${pn.price }&image=${pn.img1}">Mua ngay</a>
                    <a href="${pageContext.request.contextPath}/home/shopping.htm?id=${pn.id }&name=${pn.name }&coler=${pn.coler}&gia=${pn.price }&image=${pn.img1}">Thêm</a>
                </div>
            </div>
        	</c:forEach>
        </div>
    </div>
	<div class="contents">
	        <div class="container-cont">
	            <div class="slidercont">
	                <div class="owl-carousel owl-theme">
						<c:forEach var="sub" items="${subbanner}">
							<c:if test="${sub.status==2}">
								<div class="item-cont">
			                        <img src="${pageContext.request.contextPath}/resources/img/banner/${sub.link}">
			                        <a href="${pageContext.request.contextPath}/list/${sub.type}.htm">${sub.name}</a>
			                        <p>${sub.content}</p>
	                    		</div>
							</c:if>
						</c:forEach>
	                </div>
	            </div>
	        </div>
	        <div class="container-cont">
	            <div class="slidercont">
	                <div class="owl-carousel owl-theme">
						<c:forEach var="sub" items="${subbanner}">
							<c:if test="${sub.status==3}">
								<div class="item-cont">
			                        <img src="${pageContext.request.contextPath}/resources/img/banner/${sub.link}">
			                        <a href="${pageContext.request.contextPath}/list/${sub.type}.htm">${sub.name}</a>
			                        <p>${sub.content}</p>
	                    		</div>
							</c:if>
						</c:forEach>
	                </div>
	            </div>
	        </div>
    </div>
	 <div class="instagram-img">
        <h1>INSTAGRAM</h1>
        <div class="ig-content">
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/ig/ig(1).jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/ig/ig(2).jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/ig/ig(3).jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/ig/ig(4).jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/ig/ig(5).jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/ig/ig(6).jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/ig/ig(7).jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/ig/ig(8).jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/ig/ig(9).jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/ig/ig(10).jpg" alt="">
            </div>
        </div>
    </div>
    <div class="instagram-img">
    	 <h1 style="margin-bottom: 15px;">Hãng tài trợ</h1>
        <div class="ig-content">     	
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/brand/brand-1.jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/brand/brand-2.jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/brand/brand-3.jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/brand/brand-4.jpg" alt="">
            </div>
            <div class="item-ig">
                <img src="${pageContext.request.contextPath}/resources/img/brand/brand-5.jpg" alt="">
            </div>
        </div>
    </div>
    <div class="cart-left1">
        <button onclick="document.getElementById('cart1').style.display='block'">
            <span>${dem}</span>
            <i class="fas fa-shopping-cart"></i>
        </button>
    </div>
    <div id="cart1" class="cart-cont1">
        <span onclick="document.getElementById( 'cart1').style.display='none' " class="close " title="Close Modal ">&times;</span>
        <h1>Giỏ Hàng</h1>
			<c:forEach var="a" items="${cart}">
				 <div class="item-cart ">
		            <img src="${pageContext.request.contextPath}/resources/img/pro/${a.image}" alt=" ">
		            <div class="item-cart1 ">
		                <a href=" ">${a.tenSanPham} - ${a.idSanPham}</a>
		                <div class="sl-tt ">
		                	<h4><fmt:formatNumber pattern="###,### đ" value="${a.giaSanPham}" type="currency" /></h4>
		                    <h4>SL : ${a.getSoLuong()}</h4>
		                    <a href="${pageContext.request.contextPath}/home/deletecart.htm?idSanPham=${a.idSanPham}" class="del"><i class="far fa-times-circle "></i></a>
		                </div>
		                
		            </div>
        		</div>
			</c:forEach>
        <div class="sum ">
            <div class="s-t ">
                <h4>Thành Tiền</h4>
                <h4><fmt:formatNumber pattern="###,### đ" value="${tongTien}" type="currency" /></h4>
            </div>
            <a class="bt-tt " href="${pageContext.request.contextPath}/home/order.htm">Thanh Toán</a>
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
    var modallg = document.getElementById('login');
    window.onclick = function(event) {
        if (event.target == modallg) {
            modallg.style.display = "none";
        }
		
    }
    var modalsu = document.getElementById('sign-up');
    window.onclick = function(event) {
        if (event.target == modalsu) {
            modalsu.style.display = "none";
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