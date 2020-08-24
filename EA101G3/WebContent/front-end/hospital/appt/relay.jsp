<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
 
     <!-- Site Metas -->
    <title>取消預約</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">



    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/hospital/appt/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/hospital/appt/style2.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/hospital/appt/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/hospital/appt/css/custom.css">
	<script src="<%=request.getContextPath()%>/front-end/hospital/appt/js/modernizr.js"></script> 

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<meta http-equiv="refresh" content="5;url=<%=request.getContextPath()%>/front-end/hospital/appt/listAppt.jsp">
</head>
<body onload="run()">

   
    
      <div class="container">
        
		</a>
       
       
      </div>
    </nav>
	
	<section id="home" class="main-banner parallaxie" style="background: url('<%=request.getContextPath()%>/front-end/hospital/appt/images/bg.jpg')">
		<div class="heading">
			<h1>預約已成功取消!</h1>		
			
			<h3 class="cd-headline clip is-full-width">
				<span><span id="spanId">5</span>秒後自動跳轉回預約查詢頁面 </span>
				

				<div class="btn-ber">
					<a class="get_btn hvr-bounce-to-top" href="<%=request.getContextPath()%>/front-end/hospital/appt/select_page.jsp">預約門診</a>
					<a class="learn_btn hvr-bounce-to-top" href="<%=request.getContextPath()%>/front-end/hospital/appt/listAppt.jsp">預約查詢</a>
				</div>
			</h3>
		</div>
	</section>

  

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
<br>
<script type="text/javascript">
    // 頁面一加載完成，該方法就會執行
    // 讀秒，一秒鐘數字改變一次
    var x = 5;
    function run(){
        // 獲取到的是span標簽的對象
        var span = document.getElementById("spanId");
        // 獲取span標簽中間的文本
        span.innerHTML = x;
        x--;
        // 再讓run方法執行呢，一秒鐘執行一次
        window.setTimeout("run()", 1000);
    }
</script>
</html>