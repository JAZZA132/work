<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.appt.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<jsp:useBean id="listAppt" scope="request" type="java.util.List<ApptVO>" />


<html>
<head>


<style>
/* table { */
/* 	width: 100%; */
/* 	background-color: white; */
/* 	margin-top: 5px; */
/* 	margin-bottom: 5px; */
/* 	border: 1px solid #CCCCFF; */
/* } */

table {
	text-align: center;
	background-color: white;
	
}

 th { 
/* 	padding: 5px; */
 	background-color: lightcoral;
} 

/* th, td { */
/* 	padding: 5px; */
/* 	border-bottom: dotted; */
/* 	border-width: 1px; */
/* 	border-color: rgba(0, 0, 0, 0.5); */
/* } */

td{
line-height:60px;
height:60px;
}

.seqno{
font-size:28px; 
color:red; 
font-weight:bold; 
}

#img {
	max-width: 1100px;
}

/* .modal-body img{ */
/* width:800px; */
/* } */




</style>

</head>
<body>


	<span class="mainTitle">查詢結果</span>


	<hr class="mainTitlehr">
	
	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table class="table table-striped">
	
		<tr>
<!-- 			<th>員工編號</th> -->
			<th>掛號號碼</th>
			<th>預約人姓名</th>
			<th>預約獸醫</th>
			<th>日期</th>
			<th>時段</th>
			<th>寵物名稱</th>
			<th>寵物症狀</th>
			<th>症狀圖片</th>
			<th>狀態</th>
			<th>確認</th>

		</tr>
		<c:forEach var="apptVO" items="${listAppt}">
		<tr>
		<jsp:useBean id="petSvc" scope="page" class="com.MemberPet.model.MemberPetService" />
			<td class="seqno">${apptVO.seqno}</td>
			<td>${apptVO.memName}</td>
			<td>${apptVO.docname}</td>
			
			<td><fmt:formatDate value="${apptVO.optDate}"
					pattern="yyyy/MM/dd" /></td>

			<td>${(apptVO.optSession=='10:00~12:00')?'<font color="DodgerBlue">10:00~12:00(早診)':(apptVO.optSession=='14:00~17:00')?'<font color="DarkOrange">14:00~17:00(午診)':'<font color="DarkOrchid">18:00~20:00(晚診)'}</td>
			<td>
			<c:forEach var="petVO" items="${petSvc.all}">
			<c:if test="${apptVO.petNo==petVO.petNo}">
	         ${petVO.petName}(${apptVO.petNo})
            </c:if>
            </c:forEach>
            <c:if test="${apptVO.petNo==null}">
            	未填寫
            </c:if>
			</td>
			<td>${apptVO.symdesc}</td>
			<td style="padding-top:23px"><button type="button" class="btn btn-info" id="${apptVO.apptno}" onclick="getDetail(this)">點我觀看</button>
		
<%-- 			<img src="<%= request.getContextPath()%>/back-end/hospital/appt/img.do?apptno=${apptVO.apptno}"> --%>
			</td>
			<td>${(apptVO.optstate =='0')?'<font color="goldenrod">未看診':(apptVO.optstate =='1')?'<font color="green">已看診':'<font color="red">已取消'}</td>
			<td style="padding-top:23px"><FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/hospital/appt/appt.do"
						style="margin-bottom: 0px;">
						<c:if test="${apptVO.optstate =='0'}">
						<button type="submit" class="btn btn-success">看診完畢</button>
                    	</c:if>
                    	<c:if test="${apptVO.optstate !='0'}">
	                    <button type="submit" class="btn btn-secondary" disabled>看診完畢</button>
                    	</c:if>
						<jsp:useBean id="docSvc" scope="page" class="com.doc.model.DocService" />
						<input type="hidden" name="apptno" value="${apptVO.apptno}"> 
						<c:forEach var="docVO" items="${docSvc.all}">
						<c:if test="${docVO.docname==apptVO.docname}">
						<input type="hidden" name="docno" value="${docVO.docno}">
            			</c:if>
						</c:forEach>
<!-- 						<input type="hidden" name="docno" value="DR01">  -->
						<input type="hidden" name="petno" value="${apptVO.petNo}"> 
						<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
						<input type="hidden" name="action" value="update">
						
					</FORM></td>	
		</tr>
		</c:forEach>
	</table>
<!-- 		<input class="addEmpBtn" type="button" value="返回員工管理" onclick="location.href='listAllEmp.jsp'"> -->

<input type="hidden" id="detile" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">症狀圖片</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modal-body">

       <H1 id="demo"></H1>
	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="clearImg()">Close</button>
      </div>
    </div>
  </div>
</div>



</body>

<script type="text/javascript">
function getDetail(get){
	var temp = get.id;
	
	var url = 'img.do?apptno='+temp;
	console.log(url);
var xhr = new XMLHttpRequest();
xhr.open("get", url, true);
xhr.responseType = "blob";
xhr.onload = function() {
    if (this.status == 200) {
        var blob = this.response;
        var img = document.createElement("img");
        img.setAttribute('id','img');
        img.onload = function(e) {
            window.URL.revokeObjectURL(img.src); // 當圖片載入完成後清除釋放
        };
        img.src = window.URL.createObjectURL(blob);
        $("#demo").before(img);// 這裡也可以使用dom
        $("#detile").trigger("click");
    }
}
xhr.send();
}


	
// 	function clearImg(){

// 		var img = document.getElementsByClassName('test');
		
		$('#exampleModal').on('hidden.bs.modal', function (e) {
			document.getElementById('modal-body').removeChild(document.getElementById('img'));
			})
		
// 		var obj = document.getElementById('modal-body');
// 		   var imgParent = obj.parentNode;
// 		   imgParent.removeChild(obj);
// var obj = document.getElementById('');
// console.log(obj);

// 	}


// function getDetail(get){
	

//     console.log(get.id);
    
//     var temp = get.id;

// 	$.ajax({
//         url: "appt.do",   //後端的URL
//         type: "POST",   //用POST的方式
//         dataType: "json",   //response的資料格式
//         cache: false,   //是否暫存
//         data: {action : 'getDetail',apptno : temp}, //傳送給後端的資料
//         success: function(response) {
//             console.log(response);  //成功後回傳的資料

//           	$("#detile").trigger("click");
//             $('#demo').html(response);
            
//         }
//     });

// }

</script>

</html>

