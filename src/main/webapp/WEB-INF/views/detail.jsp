<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="resources/Js/detail.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="resources/css/detail.css">

<body onload="init();">
	<script type="text/javascript">
		var count;

		function init() {
			sell_price = document.productform.sell_price.value;
			count = document.productform.count.value;
			document.productform.price.value = sell_price;
			change();
		}

		function add() {
			hm = document.productform.count;
			sum = document.productform.price;
			hm.value++;

			sum.value = parseInt(hm.value) * sell_price;
		}

		function del() {
			hm = document.productform.count;
			sum = document.productform.price;
			if (hm.value > 1) {
				hm.value--;
				sum.value = parseInt(hm.value) * sell_price;
			}
		}

		function change() {
			hm = document.productform.count;
			sum = document.productform.price;

			if (hm.value < 0) {
				hm.value = 0;
			}
			sum.value = parseInt(hm.value) * sell_price;
		}
	</script>
	<section class="product_info">
		<h2 class="hidden">product_info</h2>
		<div class="container">
			<div class="row">
				<c:forEach var="get" items="${get}">
					<div class="product_pictures col-md-5">
						<img src="resources/images/close/goods/${get.product_code}.jpg"
							alt="coat" class="big_img">
						<ul class="thumb_img">
							<li class="active"><img
								src="resources/images/close/thumb/${get.product_code}.jpg"
								data-target="${get.product_code}.jpg" alt=""></li>
							<li><img
								src="resources/images/close/thumb/SHY001_2_thumb.jpg"
								data-target="SHY001_1.jpg" alt=""></li>
							<li><img
								src="resources/images/close/thumb/SHY001_3_thumb.jpg"
								data-target="SHY001_3.jpg" alt=""></li>
							<li><img
								src="resources/images/close/thumb/SHY001_0_thumb.jpg"
								data-target="SHY001_0.jpg" alt=""></li>
						</ul>
					</div>

					<div class="droduct_specs jumbotron col-md-7">
						<h2>${get.product_name}</h2>
						<p>${get.text1}</p>
						<form name="productform" method="post"
							onsubmit="return checkradio()">
							<input type="hidden" name="prodCode" value="${get.product_code}">
							<input type="hidden" name="prodName" value="${get.product_name}">
							<c:choose>
								<c:when test="${!empty userInfo.id }">
									<input type="hidden" value="${userInfo.id}" name="id">
									<input type="hidden" value="shop_db.customer_cart" name="table">
								</c:when>
								<c:when test="${empty userInfo.id }">
									<input type="hidden" value="<%=sId%>" name="id">
									<input type="hidden" value="shop_db.noncustomer_cart"
										name="table">
								</c:when>
							</c:choose>
							<hr>
							<div class="option justify-content-between">
								<div class="product">
									<h4>Color</h4>
									<input type="radio" id="BLAKC_color" name="color" value="BLACK">
									<label for="BLAKC_color">BLACK</label> - <input type="radio"
										id="BLUE_color" name="color" value="BLUE"> <label
										for="BLUE_color">BLUE</label> - <input type="radio"
										id="GRAY_color" name="color" value="GRAY"> <label
										for="GRAY_color">GRAY</label> - <input type="radio"
										id="PINK_color" name="color" value="PINK"> <label
										for="PINK_color">PINK</label>
								</div>
								<br>
								<div class="size">
									<h4>Size</h4>
									<input type="radio" id="s_size" name="size" value="s">
									<label for="s_size">S</label> - <input type="radio" id="m_size"
										name="size" value="m"> <label for="m_size">M</label> -
									<input type="radio" id="l_size" name="size" value="l">
									<label for="l_size">L</label> - <input type="radio"
										id="xl_size" name="size" value="xl"> <label
										for="xl_size">XL</label> - <input type="radio" id="F_size"
										name="size" value="f"> <label for="F_size">F</label>
								</div>
								<br>
							</div>
							<div class="option justify-content-between">
								<h4>Choose qty</h4>
								<input type="button" value=" - " onclick="del();"> <input
									type="text" name="count" value="1" size="3"
									onchange="change();"> <input type="button" value=" + "
									onclick="add();"> <input type="hidden"
									name="sell_price" value="${get.product_price}">&nbsp;
								<h4>Price</h4>
								<input type="text" name="price" size="11" readonly>???
							</div>
							<br> <br>
							<div class="order_now">
								<c:choose>
									<c:when test="${!empty userInfo.id}">
										<button type="submit" formaction="addcart.do">????????????</button>&nbsp;&nbsp;
										<ul>
											<li><button type="button" id="cartAjax" value="addcart!">????????????</button></li>
										</ul>
									</c:when>
									<c:when test="${empty userInfo.id}">
										<button type="submit" formaction="addcart.do">????????????</button>
										<ul>
											<li><button type="button" id="cartAjax" value="addcart!">????????????</button></li>
										</ul>
									</c:when>
								</c:choose>
							</div>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
</body>
<!-- ????????? ???????????? -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>
	/* serializeObject()??? ???????????? ????????? ????????? ???????????? ??????. 
		????????? ????????? ???????????? ??????*/
	/* jQuery.fn.serializeObject = function() {
		let obj = null;
		try {
			if (this[0].tagName) {
				let arr = this.serializeArray();
				if (arr) {
					obj = {};
					jQuery.each(arr, function() {
						obj[this.name] = this.value;
					});
				}
			}
		} catch (e) {
			alert(e.message);
		} finally {
		}
		return obj;
	}; */

	$('#cartAjax')
			.click(
					function() {
						let con = confirm('?????????????????????????');
						if (!con)
							return;

						let form = $('form[name=productform]').serialize();
						//serialize??? Form????????? ???????????? queryString ???????????? ????????????
						/* let form = $('form[name=productform]').serializeObject(); */
						//serialize??? Form????????? ???????????? object ???????????? ????????????
						//object??? ????????? body??? ?????? parameter??? ????????? param?????? ??????
						$
								.ajax({
									type : 'post',
									async : true, //?????????, ???????????? ?????? ?????? true??? ????????????????????????
									data : form,
									url : "cartAjax.do",
									dataType : "json",
									success : function(xml) {
										if (xml.code === 200) {
											alert("??????????????? ????????????");
										} else {
											console.log(xml.code,
													" :: error code")
											alert("?????? ????????? ?????????");
										}
									},
									error : function(request, status, error) {
										console.log("code:" + status + "\n"
												+ "message:"
												+ request.responseText + "\n"
												+ "error:" + error);
										alert('error 500');
									}
								});
					});

	function checkradio() {
		var radio1 = $(':input[name=color]:radio:checked').val();
		var radio2 = $(':input[name=size]:radio:checked').val();

		if (!radio1) {
			alert("????????? ??????????????????");
			return false;
		} else if (!radio2) {
			alert("???????????? ??????????????????");
			return false;
		} else {
			/* alert("????????? ??????????????????") */
		}
	}
</script>