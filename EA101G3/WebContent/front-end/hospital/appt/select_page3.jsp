<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<%
	String memNO1 = (String) session.getAttribute("memNO");
%>

<head>
 <script type="text/javascript" src="//code.jquery.com/jquery-1.9.1.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>萌寵家族</title>



    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
 
     <!-- Site Metas -->
 
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
	<script src="<%=request.getContextPath()%>/front-end/hospital/appt/js/modernizr.js"></script> <!-- Modernizr -->

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<!-- HEADER -->
<%@ include file="/front-end/frontEndInclude/head.jsp"%>

<%@ include file="/front-end/frontEndInclude/header.jsp"%>
<!-- HEADER -->

    
	
    
      <div class="container">
  
            </li>
          </ul>
        </div>
      </div>
    </nav>
	
	<section id="home" class="main-banner parallaxie" style="background: url('<%=request.getContextPath()%>/front-end/hospital/appt/uploads/banner-01.jpg')">
		<div class="heading">
		
			<h1>Cute Family </h1>			
			<h3 class="cd-headline clip is-full-width">
				<span>We care for your </span>
				<span class="cd-words-wrapper">
					<b class="is-visible">Lovely Pets</b>
					
					<b>Cats</b>
					<b>Dogs</b>
					<b>other pets</b>
				</span>
				<div class="btn-ber">
				
					<a class="get_btn hvr-bounce-to-top" href="<%=request.getContextPath()%>/front-end/hospital/appt/select_page.jsp">預約門診</a>
					<a class="learn_btn hvr-bounce-to-top" href="<%=request.getContextPath()%>/front-end/hospital/appt/listAppt.jsp">預約查詢</a>
				</div>
			</h3>
			
		</div>
		
	</section>
	
	
	
	
	<div id="blog" class="section lb">
		<div class="container">
			<div class="section-title text-center">
                <h3>醫師團隊</h3>
                <p>優質醫師團隊給您的寵物安心照護</p>
            </div><!-- end title -->
			
			<div class="row">
				<div class="col-md-4 col-sm-6 col-lg-4">
					<div class="post-box">
						<div class="post-thumb">
							<img src="uploads/blog-01.jpg" class="img-fluid" alt="post-img" />
							
						</div>
						<div class="post-info">
							<h4>門診值班表</h4>
							<ul>
                                <li>檢索醫生看診值班時段</li>
  
                               
                            </ul>
							
<p><a href='<%=request.getContextPath()%>/front-end/hospital/appt/dispOpt.jsp' style="text-decoration:none;"><b>點此瀏覽門診班表</b></a></p>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <jsp:useBean id="docSvc" scope="page" class="com.doc.model.DocService" />
  <jsp:useBean id="divSvc" scope="page" class="com.div.model.DivService" />
  
<%--       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/doc/doc.do" > --%>
<!--        <b></b> -->
<!--        <select size="1" name="docno" style="width:130px"> -->
<%--          <c:forEach var="docVO" items="${docSvc.all}" >  --%>
<%--           <option value="${docVO.docno}">${docVO.docno}-${docVO.docname} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--        <input type="submit" value="送出"> -->
<!--     </FORM> -->
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 col-lg-4">
					<div class="post-box">
						<div class="post-thumb">
							<img src="uploads/blog-02.jpg" class="img-fluid" alt="post-img" />
							
						</div>
						<div class="post-info">
							<h4>科別查詢</h4>
							<ul>
                               <li>選擇科別以查詢醫師資訊</li>
                            </ul>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/div/div.do" >
       <b><font></font></b>
       <select size="1" name="divno">
         <c:forEach var="divVO" items="${divSvc.all}" > 
          <option value="${divVO.divno}">${divVO.divname}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="listDocs_ByDivno_C">
     </FORM>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 col-lg-4">
					<div class="post-box">
						<div class="post-thumb">
							<img src="uploads/blog-03.jpg" class="img-fluid" alt="post-img" />
							
						</div>
						<div class="post-info">
							<h4>全部醫師一覽</h4>
							<ul>
                                <li>查詢全部醫師</li>
                               
                            </ul>
							<p><a href='<%=request.getContextPath()%>/front-end/hospital/doc/listAllDoc.jsp' style="text-decoration:none;"><b>點此瀏覽全部醫師資訊</b></a></p>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	 <div id="services" class="section lb">
        <div class="container">
            <div class="section-title text-center">
               <h3>看診進度 </h3>
              <h4> 
              早診  Afternoon 10:00~12:00 • 午診  Noon 14:00~17:00 • 夜診  Afternoon 18:00~20:00 </h4>
                <p>為您即時顯示目前看診進度</p>
                
                	 <div id="display">
                     
                	    </div>
 <script type = "text/javascript">

    var display = document.getElementById("display");
    var div = document.createElement('div');
    var now = new Date();
    function time(now){
            if(now.getHours()>12){
                var m = "PM";
            }else{
                var hours = now.getHours();
                var m = "AM";
            }

            return "現在時間："+now.getFullYear()+"年"+(now.getMonth()+1)+"月"+now.getDate()+"日 "+now.getHours()+"點"+now.getMinutes()+"分"+now.getSeconds()+"秒";
        }

        function callback() {
            now = new Date();
            div.innerText = time(now);
            display.append(div);
        } 

        setInterval(callback, 1000);
    </script>
    
					
                <div class="morning">
                <h1>早診  Afternoon 10:00~12:00</h1></div>
                <div class="noon">
                <h1>午診  Noon 14:00~17:00</h1></div>
                <div class="evening">
                <h1>夜診  Afternoon 18:00~20:00</h1></div>
                <div class="none">
                <h1>非看診時段</h1></div>
            </div><!-- end title -->

            <div class="row">
				<div class="col-md-4">
                    <div class="services-inner-box">
						<div class="ser-icon">
							<i class="flaticon-discuss-issue"></i>
							
							 <!-- icon -->
						</div>
						<h2>張國彬醫師</h2>
						<div class="morning"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue1.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>
						<div class="noon"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue1B.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>
						<div class="evening"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue1C.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>
						<div class="none" style="height:25px;"><i class="fas fa-exclamation-circle"></i>非看診時段
					</div>
					</div>		
					</div>
                <!-- end col -->
                <script type="text/javascript">
$(document).ready(function () {
    var d = new Date();
    var dayOfWeek = d.getDay();
    var hour = d.getHours();
    
    // open hours Monday - Friday 9am - 5:pm = open
   if (dayOfWeek !== 6 && dayOfWeek !== 0 && hour >= 10 && hour < 12) {
    $('.morning').show();
    $('.noon').hide(); 
   	$('.evening').hide(); 
	$('.none').hide();
}
    
   else if (dayOfWeek !== 6 && dayOfWeek !== 0 && hour >= 14 && hour < 17) {
	   $('.noon').show();
	   $('.morning').hide(); 
	   $('.evening').hide(); 
 	   $('.none').hide();
   }
    
	else if (dayOfWeek !== 6 && dayOfWeek !== 0 && hour >= 18 && hour < 20) {
	   $('.evening').show();
  	   $('.morning').hide(); 
       $('.noon').hide(); 
   	   $('.none').hide();
   }
else {
	$('.morning').hide(); 
    $('.noon').hide(); 
	$('.evening').hide(); 
	$('.none').show();
}
  });

  
</script>
               <!-- ------------------------------------------------- -->
                
                <div class="col-md-4">
                    <div class="services-inner-box">
						<div class="ser-icon">
							<i class="flaticon-discuss-issue"></i>
							
							 <!-- icon -->
												</div>

						<h2>李美玲醫師</h2>
						<div class="morning"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue2.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>
						<div class="noon"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue2B.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>	
						<div class="evening"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue2C.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>
						<div class="none" style="height:25px;"><i class="fas fa-exclamation-circle"></i>非看診時段
					</div>	
					</div>
                </div>
                
               <!-- ------------------------------------------------- -->
               <div class="col-md-4">
                    <div class="services-inner-box">
						<div class="ser-icon">
							<i class="flaticon-discuss-issue"></i>
							
							 <!-- icon -->
												</div>

						<h2>黃昭文醫師</h2>
						<div class="morning"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue3.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>
						<div class="noon"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue3B.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>
						<div class="evening"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue3C.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>
						<div class="none" style="height:25px;"><i class="fas fa-exclamation-circle"></i>非看診時段
					</div>		
					</div>
                </div>
               <!-- ------------------------------------------------- -->
               <div class="col-md-4">
                    <div class="services-inner-box">
						<div class="ser-icon">
							<i class="flaticon-discuss-issue"></i>
							
							 <!-- icon -->
												</div>

						<h2>蔡旻烜醫師</h2>
						<div class="morning"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue4.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>
						<div class="noon"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue4B.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>
						<div class="evening"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue4C.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>	
						<div class="none" style="height:25px;"><i class="fas fa-exclamation-circle"></i>非看診時段
					</div>	
					</div>
                </div>
                
                <div class="col-md-4">
                    <div class="services-inner-box">
						<div class="ser-icon">
							<i class="flaticon-discuss-issue"></i>
							
							 <!-- icon -->
												</div>

						<h2>鄭柏昕醫師</h2>
						<div class="morning"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue5.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>
						<div class="noon"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue5B.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>
						<div class="evening"><iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue5C.jsp" frameborder="0" width="100%" height="60px" scrolling="no"></iframe>
						</div>	
						<div class="none" style="height:25px;"><i class="fas fa-exclamation-circle"></i>非看診時段
					</div>	
					</div>
                </div>
               <!-- ------------------------------------------------- -->
				
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end section -->
	

    

    <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>

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
<footer>
		<div class="section-5 text-center">
			<h4 style="margin-top: 5%;">最完善的寵物平台</h4>
			<h4 class="my-4">如果您有需要 請聯絡我們</h4>

			<div class="form-inline justify-content-center ">
				<input type="text" name="Email" id="email" placeholder="Email"
					size="40" class="form-control px-4 py-2"> <input
					type="button" value="Contact US"
					class="btn btn-danger px-4 py-2 ml-1">
			</div>
			<div class="social" style="margin: 5%;">
				<div class="d-flex flex-row justify-content-center">
					<i class="fab fa-facebook-f m-2"></i> <i class="fab fa-twitter m-2"></i>
					<i class="fab fa-instagram m-2"></i> <i class="fab fa-youtube m-2"></i>
				</div>
			</div>
			<hr>
			<h5 style="color: lightseagreen;">Cute Family &copy;</h5>
		</div>
	</footer>
	
	<script
		src="<%=request.getContextPath()%>/base64-js-master/base64js.min.js"></script>
	<%-- 	<script src="<%=request.getContextPath()%>/base64-js-master/index.js"></script> --%>
	
	
	</body>
	</html>
