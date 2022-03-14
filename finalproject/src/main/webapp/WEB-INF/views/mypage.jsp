<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style type="text/css">
.member{
	background-color : #EAEAEA;
	width: 30%;
  	margin: auto;
  	padding: 20px;
  	border-radius: 5px;
}
/* 닉네임 중복x */
.nickname1{
	color : green;
	display : none;
}
/* 닉네임 중복 */
.nickname2{
	color : red;
	display : none;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3fd7b3691ae98830f92497719a3fe238&libraries=services"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	//주소
	$(document).ready(function(){
		var area = ["시/도 선택","서울","인천","대전","광주","대구","울산","부산","경기","강원","충북","충남","전북","전남","경북","경남","제주"];

		$("select[name^=member_addr1]").each(function(){
			$member_addr1 = $(this);
			  $.each(eval(area), function() {
			  	$member_addr1.append("<option value='"+this+"'>"+this+"</option>");
			 });
		});
		
	});
	
	//수정 버튼(빈칸 체크 후 등록)
	$("#updateMember").click(function(){
		let member_no = $("#member_no").val();
		let member_nickname = $("#member_nickname").val();
		let member_tel1 = $("#member_tel1").val();
		let member_tel2 = $("#member_tel2").val();
		let member_tel3 = $("#member_tel3").val();
		let member_addr = $("#member_addr").val();
		let member_loc = $("#member_loc").val();
		let member_tel = member_tel1 + member_tel2 + member_tel3;
		
		if(member_nickname == null || member_nickname == undefined || member_nickname == ""){ alert('닉네임을 입력해주세요.'); $('#member_nickname').focus(); return false;}
		if(member_tel1 == null || member_tel1 == undefined || member_tel1 == ""){ alert('연락처를 입력해주세요.'); $('#member_tel1').focus(); return false;}
		if(member_tel2 == null || member_tel2 == undefined || member_tel2 == ""){ alert('연락처를 입력해주세요.'); $('#member_tel2').focus(); return false;}
		if(member_tel3 == null || member_tel3 == undefined || member_tel3 == ""){ alert('연락처를 입력해주세요.'); $('#member_tel3').focus(); return false;}
		if(member_addr == null || member_addr == undefined || member_addr == ""){ alert('주소를 입력해주세요.'); $('#member_addr').focus(); return false;}
		if(member_loc == null || member_loc == undefined || member_loc == ""){ alert('지역인증을 진행해주세요.'); $('#member_loc').focus(); return false;}

		$.ajax({
  			url:"updateMember",
  			data:{
  				member_nickname:member_nickname,
  				member_tel:member_tel,
  				member_addr:member_addr,
  				member_loc:member_loc
  			},
  			success:function(r){
  				alert("회원 정보 수정 완료");
  				//$("#memberModal").hide();
  				//$('.modal-backdrop').hide();
  				location.href="mypage?member_no="+member_no;
  			}
  		});
  	});
	
	//회원 탈퇴 버튼
	$("#deleteMember").click(function(){
		if (confirm("정말 탈퇴하시겠습니까? (모든 정보가 삭제됩니다)") == true){  
			$.ajax({
	  			url:"/deleteMember",
	  			data:$("#f").serializeArray(),
	  			success:function(r){
	  				//alert("회원 탈퇴 완료");
	  				$("#memberModal").hide();
	  				$('.modal-backdrop').hide();
	  				location.replace("/main");
	  			}
	  		});
		 }else{   
		     return false;
		 }
  	});
	
	//취소 버튼
	$("#reset").click(function () {
		let member_no = $("#member_no").val();
		location.href="mypage?member_no="+member_no;
	});
	
	//닉네임 중복 검사
	$('#member_nickname').on("propertychange change keyup paste input", function nicknameCheck(){
		//console.log("keyup 테스트");	
		let member_nickname = $("#member_nickname").val();			
		let data = {member_nickname:member_nickname};				
		$.ajax({
			type : "post",
			url : "/nicknameCheck",
			data : data,
			success : function(result){
				 //console.log("확인:" + result);
				if(result != '중복'){
					$('.nickname1').css("display","inline-block");
					$('.nickname2').css("display", "none");				
				} else {
					$('.nickname2').css("display","inline-block");
					$('.nickname1').css("display", "none");				
				}
			}
		});
	});
	
	//비밀번호 변경
	$("#updatePwd").click(function updatePwd() {
		location.href = "/updatePwd";
	});
	
	let code= "";
	//핸드폰 인증 발송
	$("#tel_check_btn").click(function(){
		let member_tel1 = $("#member_tel1").val();
		let member_tel2 = $("#member_tel2").val();
		let member_tel3 = $("#member_tel3").val();
		let member_tel = member_tel1 + member_tel2 + member_tel3;
		
		//휴대전화번호 유효성 검사
		let regTel = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		if(regTel.test(member_tel) === true){ 
			$.ajax({
				url:"/sendNumber",
				type:"get",
				data:{member_tel:member_tel},
				success:function(data){
					code = data;
				}
			});
			$("#telCheck").css("display","none");
			$("#test").css("display","inline-block");				
		}else{
			alert("연락처를 바르게 입력하세요.");
		}
	});
	
	$("#code_check_btn").click(function(){
		if(code == $("#code_check").val()){
			alert("코드일치");
			$("#member_tel1").attr("disabled",true)
			$("#member_tel2").attr("disabled",true)
			$("#member_tel3").attr("disabled",true)
		
			$(".checkOk").css("display","inline-block");
		}else{
			alert("인증번호가 일치하지 않습니다. 다시 확인 해주세요.");
		}
	});
});
</script>
<script type="text/javascript">
	$(function(){
		//지역인증
		$("#check_btn").click(function(){
			let member_addr1 = $("#member_addr1").val();	//입력창 주소를 불러옴
			let member_addr2 = $("#member_addr2").val();	//입력창 주소를 불러옴
			if(member_addr1 != "" && member_addr1 != null && member_addr1 != undefined && member_addr1 != '시/도 선택'
					&& member_addr2 != "" && member_addr2 != null && member_addr2 != undefined){
				$(".modal").fadeIn();	//모달창 열기
				
				let member_addr = member_addr1+" "+member_addr2;
				
				$("#check_addr_box").css("display","inline-block");//
				 if (navigator.geolocation) { // GPS를 지원하면
					    navigator.geolocation.getCurrentPosition(function(position) {
					 	  let lat = position.coords.latitude; //위도
					 	  let lng = position.coords.longitude;//경도
					      console.log("위도:"+lat);
					 	  console.log("경도:"+lng);
					 	  
					 	  var container = document.getElementById('map'); //지도를 표시할 div
					      var options = { //지도를 생성할 때 필요한 기본 옵션
					            center: new kakao.maps.LatLng(lat, lng), //지도의 중심좌표. 현재위치를 지도에 표시함
					            level: 6 //지도의 레벨(확대, 축소 정도)
					      };
					      var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
					      var coords = new kakao.maps.LatLng(lat, lng);	  
	    			     
						 //마커 그림
	 				 	 var imageSrc = '../images/4989_logo.png', // 마커이미지의 주소    
	  					 imageSize = new kakao.maps.Size(40, 40), // 마커이미지의 크기
	  					 imageOption = {offset: new kakao.maps.Point(0, 0)}; // 마커이미지의 옵션 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정
	   					 //마커 이미지 그림
	  					 var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		   				 markerPosition = new kakao.maps.LatLng(coords); // 마커가 표시될 위치
						
					     var marker = new kakao.maps.Marker({ // 결과값으로 받은 위치를 마커로 표시
	    			    	 position: map.getCenter(),
	    			    	 image: markerImage
	    			     });
	    			     marker.setMap(map);
	    			     
	    			     //가짜 주소를 막기위해 지도 이동 막음
	    			     map.setDraggable(false);
	    			     map.setZoomable(false);
	    			     
	    			     
	    			   // 지도에 클릭 이벤트를 등록
	    			   // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출
	    			   kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    			       
	    			       // 클릭한 위도, 경도 정보를 가져오기 
	    			       var latlng = mouseEvent.latLng; 
	    			       
	    			       // 마커 위치를 클릭한 위치로 옮기기
	    			       marker.setPosition(latlng);
	    			       
	    			       //console.log(latlng.getLat());	
	    			       //console.log(latlng.getLng());	
	    			       
					      //주소 변환 객체
					      let geocoder = new kakao.maps.services.Geocoder();
						 
						  let callback = function(result, status) {
						      if (status === kakao.maps.services.Status.OK) {
						        addr = result[0].address.address_name
						        //console.log("geocoder로 받아온 주소:",addr);	//geocoder로 받아온 주소(현재 위치)
						      	//console.log("입력창으로 받아온 주소:",member_addr); //입력창으로 받아온 주소
						      	
						      	//주소 비교 위해서 문자열 잘라서 비교
						      	let addr_check = addr.substring(0,addr.lastIndexOf("동")+1);
						      	let member_addr_check = member_addr.split("동",1)+"동";
						      	//console.log("현재위치 동",addr_check);
						      	//console.log("입력창 동",member_addr_check);
						      
						      	if(addr_check == member_addr_check){	//만약 주소가 일치한다면
						      		//console.log("일치");	
						      		$("#check_addr").click(function(){
						      			//alert("주소가 일치해요!");
						      			$("#member_loc").val(addr_check).attr("readonly",true);
						      			$("#MapModal").fadeOut();
						      			$(".check_Addr").css("display","inline-block");
					
						      		});
						      	}else{
						      		alert("주소가 일치하지 않아요!");
						      	}
						      }
						   }
						   geocoder.coord2Address(latlng.getLng(), latlng.getLat(), callback);
	    			   });
					});
					} else {
						alert('GPS를 지원하지 않습니다');
					}
				
				}else{
					alert("주소를 입력해주세요");
				}
				
			});
		
		 //모달창 닫기 
		 $(".btn-close").click(function(){
			 $("#MapModal").fadeOut();
		 });
		
	});
</script>
</head>
<body>
	<input type="hidden" name="member_no" value="${m.member_no }">
	<jsp:include page="header2.jsp"></jsp:include>
	<br>
	<br>
	<h2 style="text-align : center;"><strong>마이페이지</strong></h2>
	<br>
	<br>
	<div class="member">
	<h4 style="text-align : center;"><strong>${m.member_name }</strong></h4>
	<h5 style="text-align : center;">${m.member_id }</h5>
	</div>
	<br>
	
	<div style="text-align : center;">
		<a href="#"  data-toggle="modal" data-target="#memberModal" id="member"><img src="/images/내정보수정.png" height="400" width="400"></a>
		<a href="/memberWriting?member_no=${m.member_no }"><img src="/images/작성글관리.png" height="400" width="400"></a>
		<a href="/memberGoods?member_no=${m.member_no }"><img src="/images/상품.png" height="400" width="400"></a>
	</div>
	
	<!-- 내정보 수정 모달 -->
	<div class="modal fade" id="memberModal" data-backdrop="static">
      <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
       <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><strong>내 정보 수정</strong></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        
        <form id="f"> 
        <input type="hidden" name="member_no" id="member_no" value="${m.member_no}">
        <h5>회원정보 수정을 위해서는 지역인증이 반드시 필요합니다</h5>
        <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">아이디</label>
		    <div class="col-sm-10">
		      <input type="email" class="form-control" id="inputEmail3"  value="${m.member_id }" readonly="readonly" style="width: 400px;">
		    </div>
		</div>

		<div class="row mb-3">
		    <label for="inputPassword3" class="col-sm-2 col-form-label">비밀번호</label>
		    <div class="col-sm-10">
		      <button id="updatePwd" type="button" class="btn btn-secondary">비밀번호 변경</button>
            </div>
		</div>
		
		<div class="row mb-3">
		    <label for="member_name" class="col-sm-2 col-form-label">이름</label>
		    <div class="col-sm-10">
		      <input type="text"  value="${m.member_name }" id="member_name" readonly="readonly" class="form-control" style="width: 400px;">
		    </div>
		</div>
		
		<div class="row mb-3">
		   	<label for="member_nickname" class="col-sm-2 col-form-label">닉네임</label>
		    <div class="col-sm-10">
		      <input type="text" name="member_nickname" id="member_nickname" value="${m.member_nickname }" class="form-control"  style="width: 400px;">
		    </div>
		    <span class="nickname1">사용 가능한 닉네임입니다.</span>
			<span class="nickname2">해당 닉네임이 이미 존재합니다.</span>
		</div>
		
		<div class="row mb-3">
		    <label for="member_gender" class="col-sm-2 col-form-label">성별</label>
		    <div class="col-sm-10">
		      <input type="text" value="${m.member_gender }" id="member_gender" class="form-control" readonly="readonly" style="width: 400px;">
		    </div>
		</div>
		
		<div class="row mb-3">
		    <label for="member_tel" class="col-sm-2 col-form-label">연락처</label>
		    <div style="display: inline-block; " class="col-sm-10">
				<div>
				<div class="col-md mx-0" style="float: left; width: 70px;">
					<input type="text" class="form-control" value="${tel1 }" name="member_tel1" id="member_tel1" maxlength="3" placeholder="010">
				</div>
				<div class="col-md mx-2" style="float: left; width: 90px;">
					<input type="text" class="form-control" value="${tel2 }" name="member_tel2" id="member_tel2" maxlength="4" placeholder="중간번호"> 
				</div>
				<div class="col-md mx-0" style="float: left; width: 90px;">
					<input type="text" class="form-control" value="${tel3 }" name="member_tel3" id="member_tel3" maxlength="4" placeholder="뒷번호">
				</div>
				<div style="display: inline-block; float: right; padding-right: 15px;">
           			<button type="button" id="tel_check_btn" class="btn btn-secondary btn-sm" style="height:40px; width: 90px;margin-left: -295px">휴대폰인증</button> 
             	</div>
             	<div class="p-0 m-0" id="telCheck" style="display:inline-block;">
             		<span>(연락처를 입력한 후 휴대폰인증을 진행해주세요)</span>
             	</div>
             	</div>
             		
             	<!-- 본인인증 -->
            	<div class="mt-3 mb-2" id="test" style="display: none;">
	             	<div style="display: inline-block; float: left;">
						<input type="text" class="form-control" id="code_check" style="width: 300px; height:45px; margin-right: 25px;">
					</div>
					<div style="display: inline-block; float: left;">
						<button type="button" id="code_check_btn" class="btn btn-secondary btn-sm" style="height:45px;">본인인증</button> 
					</div>
					<!-- 본인인증 검사 결과 div -->
	             	<div class="m-0 p-0">
	               		<span class="checkOk" style="color: green; display: none;"><i class="bi bi-check-all" style="padding-right: 5px;"></i>인증번호가 일치합니다.</span>
	             	</div>
				</div>
			</div>
		</div>
		
		<div class="row mb-3">
		    <label for="member_birth" class="col-sm-2 col-form-label">생년월일</label>
		    <div class="col-sm-10">
		      <input type="text" id="member_birth" value="${m.member_birth }" readonly="readonly" class="form-control" style="width: 400px;">
		    </div>
		</div>
		<!-- 
		
		<!-- 주소 input -->
        <div class="row mb-3">
            <label for="member_addr" class="col-sm-2 col-form-label">주소</label>
            <div style="display: inline-block; " class="col-sm-10">
            	<div class="col-sm-10">
			      <input type="text"  value="${m.member_addr }" id="member_addr" readonly="readonly" class="form-control" style="margin-bottom: 10px;width: 400px;">
			    </div>
	            <div class="col-md mx-0" style="float: left; width: 100px;">
		        <!-- 시/도 선택 -->
	            	<select class="member_addr1 form-control" name="member_addr1" id="member_addr1" style="height: 45px;"></select>
	            </div>
	            <div class="col-md mx-0" style="float: left; width: 290px;">
	            <!-- 나머지 주소 -->
	            	<input type="text" class="form-control" name="member_addr2" id="member_addr2" placeholder="나머지 주소" style=" height: 45px;margin-left: 10px;">	
	          	</div>
          		<div style="display: inline-block;">
          			<span>(주소를 입력한 후 지역인증을 해주세요)</span>
            	</div>
            </div>
        </div>  	  
            
		<!--지역인증 -->
	    <div class="row mb-3">
            <label for="check_loc" class="col-sm-2 form-label">지역인증</label>
            <div class="col-sm-10" style="display: inline-block;">
            	<button type="button" id="check_btn" class="btn btn-secondary btn-sm" style="float: left;height: 40px;margin-right: 20px;">지역인증</button> 
	       		<!-- 지역인증 결과 div -->
	            <div class="col-sm-10" id="check_addr_box" style="display: none;">
	            <!-- 지역인증 input -->
	            <div class="col-md mx-0">
	            	<input type="text" class="form-control" name="member_loc" id="member_loc" placeholder="지역인증 주소" style="width: 250px;">
	        	</div>
			    <!-- 지역인증 결과 div -->
	            <div class="col-md mx-0">
	              	<span class="check_Addr" id="check_Addr" style="color: green;display: none;"><i class="bi bi-check-all" style="padding-right: 5px;"></i>지역인증 완료</span>
	            </div>
				</div>
			</div>
		</div>
        </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" id="updateMember">수정</button>
          <button type="button" class="btn btn-outline-secondary" id="reset">취소</button>
          <button type="button" class="btn btn-secondary" id="deleteMember">회원탈퇴</button>
        </div>
	   </div>
	  </div>
	</div>
	
	<!-- 지역인증 모달-->
	<div id="MapModal" class="modal" role="dialog" style="padding-right: 300px; padding-top: 100px;">
		<div class="modal-dialog" role="document">
		<!-- Modal content-->
	   		<div class="modal-content rounded-5 shadow" style="width: 800px; height:700px; margin: 0 auto;">
			  <!-- 닫기 버튼 -->
			  <div class="modal-close bg-secondary bg-gradient border-bottom-1 mb-3">
			    <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close" style="float: right; margin: 10px;"></button>
			  </div> 
		      <!-- 아이디 찾기 표시 -->
		      <div class="modal-header p-3 pb-1 border-bottom-0" style="margin: 0 auto;">	      
		        <p class="display-5 fw-bold mb-0 text-secondary">지역인증</p>
		      </div>
		      <div style="margin: 0 auto;">
		      	<span class="fs-5 text-muted text-secondary">위치가 <strong>부정확</strong>하다면 클릭을 통해 <strong>정확한 위치</strong>로 옮겨주세요!</span>
			  </div>
				<!-- 맵 출력 -->
			  <div class="modal-body">
				<div id="map" style="width: 100%; height: 400px;"></div>
			  </div>
			  <div class="modal-footer">
				<button type="button" id="check_addr" class="btn w-100 btn-lg btn-primary" data-dismiss="modal" style="margin: 0 auto;">확인</button>
			  </div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>