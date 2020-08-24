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


	<span class="mainTitle">�d�ߵ��G</span>


	<hr class="mainTitlehr">
	
	<c:if test="${not empty errorMsgs}">
		<font color='red'>�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table class="table table-striped">
	
		<tr>
<!-- 			<th>���u�s��</th> -->
			<th>�������X</th>
			<th>�w���H�m�W</th>
			<th>�w���~��</th>
			<th>���</th>
			<th>�ɬq</th>
			<th>�d���W��</th>
			<th>�d���g��</th>
			<th>�g���Ϥ�</th>
			<th>���A</th>
			<th>�T�{</th>

		</tr>
		<c:forEach var="apptVO" items="${listAppt}">
		<tr>
		<jsp:useBean id="petSvc" scope="page" class="com.MemberPet.model.MemberPetService" />
			<td class="seqno">${apptVO.seqno}</td>
			<td>${apptVO.memName}</td>
			<td>${apptVO.docname}</td>
			
			<td><fmt:formatDate value="${apptVO.optDate}"
					pattern="yyyy/MM/dd" /></td>

			<td>${(apptVO.optSession=='10:00~12:00')?'<font color="DodgerBlue">10:00~12:00(���E)':(apptVO.optSession=='14:00~17:00')?'<font color="DarkOrange">14:00~17:00(�ȶE)':'<font color="DarkOrchid">18:00~20:00(�߶E)'}</td>
			<td>
			<c:forEach var="petVO" items="${petSvc.all}">
			<c:if test="${apptVO.petNo==petVO.petNo}">
	         ${petVO.petName}(${apptVO.petNo})
            </c:if>
            </c:forEach>
            <c:if test="${apptVO.petNo==null}">
            	����g
            </c:if>
			</td>
			<td>${apptVO.symdesc}</td>
			<td style="padding-top:23px"><button type="button" class="btn btn-info" id="${apptVO.apptno}" onclick="getDetail(this)">�I���[��</button>
		
<%-- 			<img src="<%= request.getContextPath()%>/back-end/hospital/appt/img.do?apptno=${apptVO.apptno}"> --%>
			</td>
			<td>${(apptVO.optstate =='0')?'<font color="goldenrod">���ݶE':(apptVO.optstate =='1')?'<font color="green">�w�ݶE':'<font color="red">�w����'}</td>
			<td style="padding-top:23px"><FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/hospital/appt/appt.do"
						style="margin-bottom: 0px;">
						<c:if test="${apptVO.optstate =='0'}">
						<button type="submit" class="btn btn-success">�ݶE����</button>
                    	</c:if>
                    	<c:if test="${apptVO.optstate !='0'}">
	                    <button type="submit" class="btn btn-secondary" disabled>�ݶE����</button>
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
						<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
						<input type="hidden" name="action" value="update">
						
					</FORM></td>	
		</tr>
		</c:forEach>
	</table>
<!-- 		<input class="addEmpBtn" type="button" value="��^���u�޲z" onclick="location.href='listAllEmp.jsp'"> -->

<input type="hidden" id="detile" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">�g���Ϥ�</h5>
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
            window.URL.revokeObjectURL(img.src); // ��Ϥ����J������M������
        };
        img.src = window.URL.createObjectURL(blob);
        $("#demo").before(img);// �o�̤]�i�H�ϥ�dom
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
//         url: "appt.do",   //��ݪ�URL
//         type: "POST",   //��POST���覡
//         dataType: "json",   //response����Ʈ榡
//         cache: false,   //�O�_�Ȧs
//         data: {action : 'getDetail',apptno : temp}, //�ǰe����ݪ����
//         success: function(response) {
//             console.log(response);  //���\��^�Ǫ����

//           	$("#detile").trigger("click");
//             $('#demo').html(response);
            
//         }
//     });

// }

</script>

</html>

