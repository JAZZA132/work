<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.doc.model.*"%>
<%@ page import="com.div.model.*"%>

<jsp:useBean id="listDocs_ByDivno" scope="request" type="java.util.Set<DocVO>" /> <!-- 於EL此行可省略 -->
<jsp:useBean id="divSvc" scope="page" class="com.div.model.DivService" />
<%
String divno = request.getParameter("divno");
pageContext.setAttribute("divno", divno); 
%>

<!DOCTYPE html>
<html lang="en">

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
 
     <!-- Site Metas -->
    <title>科別醫師</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">



    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/hospital/div/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/hospital/div/style6.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/hospital/div/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/hospital/div/css/custom.css">
	<script src="js/modernizr.js"></script> <!-- Modernizr -->

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body id="page-top" class="politics_version">
  
	<div id="team" class="section wb">
		<div class="container">
			<div class="section-title text-center">
				<h3><b></b>
				<c:forEach var="divVO" items="${divSvc.all}">
				<c:if test="${divno==divVO.divno}"> 
 				【${(divVO.divname)}】醫師 
 				</b></h3>您現在查詢的科別編號為${(divVO.divno)}，${(divVO.divname)}醫師一覽。
 				</c:if> 
			</c:forEach>  </p>
			</div><!-- end title -->
		
			<div class="row">
				
			<!---->

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
	
	<c:forEach var="docVO" items="${listDocs_ByDivno}" >
			<div class="col-md-3 col-sm-6">
					<div class="our-team">
						<div class="pic">
							<img src="<%=request.getContextPath()%>/back-end/doc/ShowDocPic.do?docno=${docVO.docno}" height=200px width=200px; alt="meow">
							<div class="date">
								<h4>  <b>醫師編號</b> ${docVO.docno} <br> <b>診間號碼</b> ${docVO.roomno}</h4>
							</div>
						</div>
						<div class="team-content">
							<h3 class="title"> ${docVO.docname}</h3>
							<span class="post">年資 ${docVO.seniority}年</span>
							${docVO.intro}
						</div>
					</div>
				</div>
</c:forEach>

<!---->





			</div>
		</div>
	</div>
	
	

    <div class="copyrights">
        <div class="container">
            <div class="footer-distributed">
				
                    </p>
                    <p class="footer-company-name">All Rights Reserved. &copy; 2020 <a href="#">CuteFamily</a> 
                </div>
            </div>
        </div><!-- end container -->
    </div><!-- end copyrights -->

    <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
<button class="floating-btn">
	<a href="<%=request.getContextPath()%>/front-end/hospital/appt/select_page3.jsp" style="color:white;">回門診首頁</a>
</button>
    <!-- ALL JS FILES -->
    <script src="js/all.js"></script>
	<!-- Camera Slider -->
	<script src="js/jquery.mobile.customized.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script> 
	<script src="js/parallaxie.js"></script>
	<script src="js/headline.js"></script>
	<!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
    <script src="js/jquery.vide.js"></script>

</body>
</html>