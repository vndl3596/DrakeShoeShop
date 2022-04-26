<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Drake Shoe Shop - Sản Phẩm</title>
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
	    <div class="container-list-produce">
        <div class="right-content" style="border-right: #2AC37D 2px solid; ">
            <div class="sort-filter">
                <select id="filter_price" class="filter_price">
                    <option value="none">Bộ lọc</option>

                    <option data-text="Dưới 300.000 đ" value="(price:product<=300000)">
                        Dưới 300.000 VND
                    </option>

                    <option data-text="300 - 500.000 đ" value="(price:product>300000)&amp;&amp;(price:product<500000)">
                        300 - 500.000 VND
                    </option>

                    <option data-text="500 - 1.000.000 đ" value="(price:product>=500000)&amp;&amp;(price:product<1000000)">
                        500 - 1.000.000 VND
                    </option>
                    <option data-text="Trên 1.000.000 đ" value="(price:product>=1000000)">
                        Trên 1.000.000 VND
                    </option>
            </select>
                <select name="SortBy" class="sort-by" id="SortBy">
                <option value="manual">Sắp xếp:</option>
                <option value="quantity-descending" data-filter="(quantity:product=desc)">Tồn Kho: Giảm dần</option>
                <option value="price-ascending" data-filter="(price:product=asc)">Giá: Tăng dần</option>
                <option value="price-descending" data-filter="(price:product=desc)">Giá: Giảm dần</option>
                <option value="title-ascending" data-filter="(title:product=asc)">Tên: A-Z</option>
                <option value="title-descending" data-filter="(title:product=desc)">Tên: Z-A</option>
                <option value="created-ascending" data-filter="(updated_at:product=asc)">Cũ nhất</option>
                <option value="created-descending" data-filter="(updated_at:product=desc)">Mới nhất</option>
                <option value="best-selling" data-filter="(sold_quantity:product=desc)">Bán chạy nhất</option>
            </select>
            </div>
            <div class="size-content ">
                <h3>SIZE</h3>
                <ul id="sort_size" class="list-size list-fm">
                    <li class="advanced-filter" data-text="24">
                        <label>
							<span data-value="(variantonhand:product**24)">24</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="25">
                        <label>
							<span data-value="(variantonhand:product**25)">25</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="26">
                        <label>
							<span data-value="(variantonhand:product**26)">26</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="27">
                        <label>
							<span data-value="(variantonhand:product**27)">27</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="28">
                        <label>
							<span data-value="(variantonhand:product**28)">28</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="29">
                        <label>
							<span data-value="(variantonhand:product**29)">29</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="30">
                        <label>
							<span data-value="(variantonhand:product**30)">30</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="31">
                        <label>
							<span data-value="(variantonhand:product**31)">31</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="32">
                        <label>
							<span data-value="(variantonhand:product**32)">32</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="33">
                        <label>
							<span data-value="(variantonhand:product**33)">33</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="34">
                        <label>
							<span data-value="(variantonhand:product**34)">34</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="35">
                        <label>
							<span data-value="(variantonhand:product**35)">35</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="36">
                        <label>
							<span data-value="(variantonhand:product**36)">36</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="37">
                        <label>
							<span data-value="(variantonhand:product**37)">37</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="38">
                        <label>
							<span data-value="(variantonhand:product**38)">38</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="39">
                        <label>
							<span data-value="(variantonhand:product**39)">39</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="40">
                        <label>
							<span data-value="(variantonhand:product**40)">40</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="41">
                        <label>
							<span data-value="(variantonhand:product**41)">41</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="42">
                        <label>
							<span data-value="(variantonhand:product**42)">42</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="43">
                        <label>
							<span data-value="(variantonhand:product**43)">43</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="44">
                        <label>
							<span data-value="(variantonhand:product**44)">44</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="45">
                        <label>
							<span data-value="(variantonhand:product**45)">45</span>
						</label>
                    </li>
                </ul>
            </div>
            <div class="coler-content list-fm">
                <h3>MÀU SẮC</h3>
                <ul id="color" class="list-color list-fm">
                    <li class="advanced-filter" data-text="Cam">
                        <label>
							<span data-value="(variantonhand:product**Cam)" class="catalog_color cam" style="background-color:#ff6600" title="Cam">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Đen">
                        <label>
							<span data-value="(variantonhand:product**Đen)" class="catalog_color den" style="background-color:#000000" title="Đen">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Đỏ đậm">
                        <label>
							<span data-value="(variantonhand:product**Đỏ đậm)" class="catalog_color do-dam" style="background-color:#cc0000" title="Đỏ đậm">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Đỏ">
                        <label>
							<span data-value="(variantonhand:product**Đỏ)" class="catalog_color do" style="background-color:#ff0000" title="Đỏ">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Nâu Đất">
                        <label>
							<span data-value="(variantonhand:product**Nâu Đất)" class="catalog_color nau-dat" style="background-color:#974706" title="Nâu Đất">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Nâu">
                        <label>
							<span data-value="(variantonhand:product**Nâu)" class="catalog_color nau" style="background-color:#9e4b07" title="Nâu">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Rêu">
                        <label>
							<span data-value="(variantonhand:product**Rêu)" class="catalog_color reu" style="background-color:#76933c" title="Rêu">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Trắng">
                        <label>
							<span data-value="(variantonhand:product**Trắng)" class="catalog_color trang" style="background-color:#f9f9f9" title="Trắng">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Vàng">
                        <label>
							<span data-value="(variantonhand:product**Vàng)" class="catalog_color vang" style="background-color:#ffff00" title="Vàng">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xám">
                        <label>
							<span data-value="(variantonhand:product**Xám)" class="catalog_color xam" style="background-color:#a6a6a6" title="Xám">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xanh Dương Đậm">
                        <label>
							<span data-value="(variantonhand:product**Xanh Dương Đậm)" class="catalog_color xanh-duong-dam" style="background-color:#000099" title="Xanh Dương Đậm">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xanh Dương">
                        <label>
							<span data-value="(variantonhand:product**Xanh Dương)" class="catalog_color xanh-duong" style="background-color:#0000ff" title="Xanh Dương">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xanh Dương Lợt">
                        <label>
							<span data-value="(variantonhand:product**Xanh Dương Lợt)" class="catalog_color xanh-duong-lot" style="background-color:#3399ff" title="Xanh Dương Lợt">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xanh Mi Nơ">
                        <label>
							<span data-value="(variantonhand:product**Xanh Mi Nơ)" class="catalog_color xanh-mi-no" style="background-color:#99ff33" title="Xanh Mi Nơ">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xanh">
                        <label>
							<span data-value="(variantonhand:product**Xanh)" class="catalog_color xanh" style="background-color:#003399" title="Xanh">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Xanh Nhớt">
                        <label>
							<span data-value="(variantonhand:product**Xanh Nhớt)" class="catalog_color xanh-nhot" style="background-color:#003399" title="Xanh Nhớt">&nbsp;</span>
						</label>
                    </li>
                    <li class="advanced-filter" data-text="Hồng">
                        <label>
							<span data-value="(variantonhand:product**Hồng)" class="catalog_color hong" style="background-color:#ff00cc" title="Hồng">&nbsp;</span>
						</label>
                    </li>
                </ul>
            </div>
        </div>
        <div class="left-content">
			<br>
            <div class="content-pro">
            	<c:forEach var="pn" items="${item}">
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
	                    <a href="${pageContext.request.contextPath}/home/shopping-list.htm?id=${pn.id }&name=${pn.name }&coler=${pn.coler}&gia=${pn.price - (pn.price*pn.sale)/100 }&image=${pn.img1}">Thêm</a>
	                </div>
            	</div>
            	</c:forEach>
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
		                    <a href="${pageContext.request.contextPath}/home/deletecart-list.htm?idSanPham=${a.idSanPham}" class="del"><i class="far fa-times-circle "></i></a>
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
        modalus.style.display = "none ";
    }
}
var modallg = document.getElementById('login');
window.onclick = function(event) {
    if (event.target == modallg) {
        modallg.style.display = "none ";
    }
}
var modalsu = document.getElementById('sign-up');
window.onclick = function(event) {
    if (event.target == modalsu) {
        modalsu.style.display = "none ";
    }
}
var modalsu = document.getElementById('cart1');
window.onclick = function(event) {
    if (event.target == modalsu) {
        modalsu.style.display = "none ";
    }
}
</script>
</html>