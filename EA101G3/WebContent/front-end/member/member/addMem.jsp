<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>會員資料新增 - addMem.jsp</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/member/member/viewpic.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/frontEndIndex/style.css">
<style>
#img {
	width: 250px;
	height: 200px;
}

#errormsg {
	margin-top: 270px;
}

label {
	font-weight: bold;
	font-size: 20px;
}
#mybody{
	background-color:#E6E3E8;
}
</style>



</head>
<body id="mybody">
		
<%	
	MemberVO memVO = (MemberVO) request.getAttribute("memVobject");
	String memNO = (String) session.getAttribute("memNO");
	String memName = (String) session.getAttribute("memName");
%>

<header>
	<nav class="navbar navbar-expand-lg navbar-light ">
			<a href="<%=request.getContextPath()%>/front-end/frontEndIndex/index.jsp" class="navbar-brand ml-3">
				Cute:)
				<span style="color: #00E8E8;">Family</span>
			</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle Navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse"></div>
		<div class="collapse navbar-collapse" id="navbarMenu">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a href="<%=request.getContextPath()%>/front-end/frontEndIndex/index.jsp" class="nav-link">首頁</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/member/member/membercenter.jsp" class="nav-link">會員專區</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/hospital/appt/select_page3.jsp" class="nav-link">門診專區</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/Hotel/hotelIndex.jsp" class="nav-link">寵物旅館</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/product/shopindex.jsp" class="nav-link">寵物商城</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/adopt/adoptedpets/listAllPets.jsp" class="nav-link">領養專區</a>
				</li>
			</ul>
			<div style="<%=(memNO == null) ? "visibility:hidden" : "visibility:"%>" id="loginFonts">
				<img alt="" src="<%=request.getContextPath()%>/Puppy/pic.do?memNo=${memNO}" style="height: 50px" id="mempic">
				<%=memName%>您好~
			</div>
			<a href="#">
				<button class="btn menu-right-btn border" type="button" style="<%=(memNO == null) ? "display:" : "display:none"%>">註冊</button>
			</a>
			<a href="<%=request.getContextPath()%>/front-end/member/member/login.jsp">
				<button class="btn menu-right-btn border" type="submit" id="login" style="<%=(memNO == null) ? "display:" : "display:none"%>">登入</button>
			</a>
			<form class="form-inline my-2 my-lg-0" action="<%=request.getContextPath()%>/Puppy/logout.do">
				<button class="btn menu-right-btn border" type="submit" id="logout" style="<%=(memNO != null) ? "display:" : "display:none"%>">登出</button>
			</form>
		</div>
	</nav>
</header>
	<div class="container">
		<div class="row">
			<div class="col-3">
				<c:if test="${not empty errorMsgs}">
					<ul id="errormsg">
						<c:forEach var="message" items="${errorMsgs}">
							<h4 style="color:#585ACF">${message}</h4>
						</c:forEach>
					</ul>
				</c:if>
			</div>
			<div class="col-6 mt-5">
				<div class="card">

					<h5 class="card-header bg-info info-color white-text text-center py-4">
						<strong>加入會員</strong>
					</h5>

					<!--Card content-->
					<div class="card-body px-lg-5 pt-0" style="background-color:#E5E5F3;">

						<!-- Form -->
						<form class="text-center p-0 " METHOD="post"
							ACTION="<%=request.getContextPath()%>/Puppy/mem.do" name="form1"
							enctype="multipart/form-data">
							<div class="form-row mb-4 d-none" id="showimg">
								<div class="col mt-2">
									<img id="img" class="form-control d-flex mr-auto ml-auto">
								</div>
							</div>
							<div class="form-row mb-4 mt-4">
								<div class="col">
									<input id="myname" class="form-control" type="TEXT" name="memname"
										size="45"
										value="<%=(memVO == null) ? "" : memVO.getMemName()%>"
										placeholder="會員姓名">
								</div>
								<div class="col">
									<input id="myemail" class="form-control" type="EMAIL" name="mememail"
										size="45"
										value="<%=(memVO == null) ? " " : memVO.getMemEmail()%>"
										placeholder="E-mail">
								</div>
							</div>
							<div class="form-row mb-1">
								<div class="col">
									<input id="myaccount" class="form-control" type="TEXT" name="memaccount"
										size="45"
										value="<%=(memVO == null) ? "" : memVO.getMemAccount()%>"
										placeholder="輸入帳號">
								</div>
							</div>
							<div class="form-row mb-2">
								<div class="col  id="checkaccount">
									<strong id="mystrong"  class="d-flex justify-content-start mt-3 "></strong>
								</div>
							</div>
							<div class="form-row mb-4">
								<div class="col">
									<input id="mypassword" class=" form form-control" type="password"
										name="mempassword" size="4"
										value="<%=(memVO == null) ? "" : memVO.getMemPassword()%>"
										placeholder="輸入密碼" />
								</div>
							</div>
							<div class="form-row mb-4">
								<div class="col">
									<input id="mycardnum" onkeyup="value=value.replace(/[^\d]/g,'')"
										maxlength="16" class=" form form-control" type="TEXT"
										name="memcreditcardid" size="45"
										value="<%=(memVO == null) ? "" : memVO.getMemCreditCardId()%>"
										placeholder="輸入信用卡號" />
								</div>
							</div>
							<div class="form-row mb-4">
								<div class="col">
									<input id="mycellphone" onkeyup="value=value.replace(/[^\d]/g,'')"
										maxlength="10" class=" form form-control" type="TEXT"
										name="memphone" size="45"
										value="<%=(memVO == null) ? "" : memVO.getMemPhone()%>"
										placeholder="輸入手機號碼" />
								</div>
							</div>
							<div class="form-row mb-4">
								<div class="col">
									<input id="myaddress" class=" form form-control" type="TEXT" name="memaddress"
										size="45"
										value="<%=(memVO == null) ? "" : memVO.getMemAddress()%>"
										placeholder="輸入住址" />
								</div>
							</div>
							<div class="form-row mb-4">
								<div class="col d-flex justify-content-start">
									<input type="file" name="mempic" id="pic" placeholder="上傳圖片" />
								</div>
							</div>
							<div class="form-row mb-4">
								<div class="col d-flex justify-content-start">
									<input type="hidden" name="action" value="insert">
									<button type="button" class="btn btn-info form-control mr-2" id="magicbtn">神奇小按鈕</button>
									<input type="submit" value="送出新增"
										class="btn btn-info form-control">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
			<footer>
			<div class="section-5 text-center">
				<h4 style="margin-top: 5%;">最完善的寵物平台</h4>
				<h4 class="my-4">如果您有需要 請聯絡我們</h4>
				<div class="form-inline justify-content-center">
					<input type="text" name="Email" id="email" placeholder="Email" size="40" class="form-control px-4 py-2">
					<input type="button" value="Contact US" class="btn btn-danger px-4 py-2 ml-1">
				</div>
				<a href="">
					<button class="btn btn-outline-secondary" style="margin-top: 2%;">
						<h5>我要客訴</h5>
					</button>
				</a>
				<div class="social" style="margin: 3%;">
					<div class="d-flex flex-row justify-content-center">
						<i class="fab fa-facebook-f m-2"></i>
						<i class="fab fa-twitter m-2"></i>
						<i class="fab fa-instagram m-2"></i>
						<i class="fab fa-youtube m-2"></i>
					</div>
				</div>
				<hr>
				<h5 style="color: lightseagreen;">Cute Family &copy;</h5>
			</div>
		</footer>
		
		<script>
			$(function(){
				$('#myaccount').change(function() {	
				   $.ajax({
					   url:"<%=request.getContextPath()%>/Puppy/mem.do",
					   type:"POST",
					   data:{
						   action:"checkaccount",
						   account:$("#myaccount").val(),
					   },
					   success:function(data){
						   console.log(data);
						  if(data==="1"){
							  $("#mystrong").removeClass("text-danger");
							  	$("#mystrong").addClass("text-success");
								$("#mystrong").text("此帳號可以使用");
						  }else{
							  $("#mystrong").addClass("text-danger");
								$("#mystrong").text("此帳號已被使用");
						  }
					   }
				   })
				  });
				
				$("#magicbtn").click(function(){
					$("#myname").val("小傑");
					$("#myemail").val("xuanjia961121@gmail.com");
					$("#myaccount").val("ea101g3");
					$("#mypassword").val("123456");
					$("#mycardnum").val("5489663521474847");
					$("#mycellphone").val("0968521456");
					$("#myaddress").val("桃園市中壢區中央路200號");
				});
			});
		</script>
</body>

</html>