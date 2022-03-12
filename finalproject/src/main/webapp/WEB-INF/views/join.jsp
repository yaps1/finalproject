<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}" />
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3fd7b3691ae98830f92497719a3fe238&libraries=services"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).ready(function(){
			getYear();
			getMonth();
			getlastDay();
			
			var area = ["시/도 선택","서울","인천","대전","광주","대구","울산","부산","경기","강원","충북","충남","전북","전남","경북","경남","제주"];

			$("select[name^=member_addr1]").each(function(){
				$member_addr1 = $(this);
				  $.each(eval(area), function() {
				  	$member_addr1.append("<option value='"+this+"'>"+this+"</option>");
				 });
			});
			
		});
		//생년월일 년,월,일
		function getYear(){
			let today = new Date();
			let year = "";
			let today_year = today.getFullYear();
			$("#year").append("<option value=''>년도</option>")
			for(let year=(today_year);year>=(today_year-80);year--){
				$("#year").append("<option value='"+year+"'>"+year+"년"+"</option>")
			}
		}
		function getMonth(){
			$("#month").append("<option value=''>월</option>")
			for(let month=1;month<=12;month++){
				$("#month").append("<option value='"+month+"'>"+month+"월"+"</option>")
			}
		}
		function getlastDay(month){ 
			//년과 월에 따라 마지막 일 구하기 구현 못함
			let Month=document.getElementById('month').value; 
			let day="";
			$("#day").append("<option value=''>일</option>")
			
			    if(month==4 || month==6 || month==9 || month==11)
			        last_day = 30;
			    else if(month==2){ //2월
			        if(year%4 == 0) // 2월, 윤년일 때
			            last_day = 29;
			        else    // 2월, 윤년이 아닐 때
			            last_day = 28
			    } else {
			        last_day = 31;
			    }
			for(let day=1;day<=last_day;day++){
				$("#day").append("<option value='"+day+"'>"+day+"일"+"</option>")
			}
		}
		//회원가입 빈칸 체크
		$("#btn").click(function () {
			let member_id = $("#member_id").val();
			let member_pwd = $("#member_pwd").val();
			let member_pwd_check = $("#member_pwd_check").val();
			let member_name = $("#member_name").val();
			let member_nickname = $("#member_nickname").val();
			let member_gender_male = $("#member_gender_male").val();//
			let member_gender_female = $("#member_gender_female").val();//
			let member_tel1 = $("#member_tel1").val();
			let member_tel2 = $("#member_tel2").val();
			let member_tel3 = $("#member_tel3").val();
			let year = $("#year").val();
			let month = $("#month").val();
			let day = $("#day").val();
			let member_addr1 = $("#member_addr1").val();
			let member_addr2 = $("#member_addr2").val();
			let member_loc = $("#member_loc").val();
			
			if(member_id == null || member_id == undefined || member_id == ""){ alert('아이디를 입력해주세요.'); $('#member_id').focus(); return false;} 
			if(member_pwd == null || member_pwd == undefined || member_pwd == ""){ alert('패스워드를 입력해주세요.'); $('#member_pwd').focus();  return false;}
			if(member_pwd_check == null || member_pwd_check == undefined || member_pwd_check == ""){ alert('패스워드를 입력해주세요.'); $('#member_pwd_check').focus(); return false;} 
			if(member_name == null || member_name == undefined || member_name == ""){ alert('이름을 입력해주세요.'); $('#member_name').focus(); return false;} 
			if(member_nickname == null || member_nickname == undefined || member_nickname == ""){ alert('닉네임을 입력해주세요.'); $('#member_nickname').focus(); return false;} 
		//	if(member_gender_male.checked != true || member_gender_female.checked != true){ alert('성별을 체크해주세요.'); $('#member_gender')[0].focus(); return;}
			if(member_tel1 == null || member_tel1 == undefined || member_tel1 == ""){ alert('연락처를 입력해주세요.'); $('#member_tel1').focus(); return false;}
			if(member_tel2 == null || member_tel2 == undefined || member_tel2 == ""){ alert('연락처를 입력해주세요.'); $('#member_tel2').focus(); return false;}
			if(member_tel3 == null || member_tel3 == undefined || member_tel3 == ""){ alert('연락처를 입력해주세요.'); $('#member_tel3').focus(); return false;}
			if(year == null || year == undefined || year == ""){ alert('생년월일을 입력해주세요.'); $('#year').focus(); return false;}
			if(month == null || month == undefined || month == ""){ alert('생년월일을 입력해주세요.'); $('#month').focus(); return false;}
			if(day == null || day == undefined || day == ""){ alert('생년월일을 입력해주세요.'); $('#day').focus(); return false;}
			if(member_addr1 == null || member_addr1 == undefined || member_addr1 == ""){ alert("주소를 입력해주세요."); $("#member_addr").focus(); return false;}
			if(member_addr2 == null || member_addr2 == undefined || member_addr2 == ""){ alert("주소를 입력해주세요."); $("#member_addr").focus(); return false;}
			if(member_loc == null || member_loc == undefined || member_loc == ""){ alert("지역인증을 해주세요."); $("#check_btn").focus(); return false;}
			$('#join').submit();
		});
		
		//아이디 중복검사 ajax
		$("#id_check_btn").click(function(){
			let member_id = $("#member_id").val()
			let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(member_id.match(regExp) != null){
				$.ajax({
					url:"id_check",
					type:"get",
					data:{member_id : member_id},
					success:function(data){
						if(data != 0){
							$(".IdOk").css("display","inline-block");
							$(".IdNo").css("display","none");
							$("#id_Box").css("display","none");
						}else{
							$(".IdNo").css("display","inline-block");
							$(".IdOk").css("display","none");
							$("#id_Box").css("display","none");
						}
					}			
				})
			}else{
				alert("잘못된 형식입니다.");
			}
		});//아이디 중복체크 함수 끝
		
		//비밀번호 유효성 검사 숫자 영문자 8자 이상 14자 이하
		$("#member_pwd").focusout(function checkPwd() {
			let member_pwd = $("#member_pwd").val();
			if(!/^[a-zA-Z0-9]{8,14}$/.test(member_pwd)){
				alert("숫자와 영문자 조합으로 8자이상 14자 이하를 입력해야 합니다.");
				﻿$("#join #member_pwd").val("");
				$("#join #member_pwd_check").attr("disabled",true);
				//$("#member_pwd").focus(); 
				//return false;
			}else{	
				$("#join #member_pwd_check").attr("disabled",false);
			}
			
			
		});
		
		//비밀번호 비밀번호 확인 실시간 일치여부
		$("#member_pwd_check").on("propertychange change keyup paste input", function pwd_check() {
			let member_pwd = document.getElementById("member_pwd").value;
			let member_pwd_check = document.getElementById("member_pwd_check").value;
			
				if (member_pwd == member_pwd_check ) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
				 $(".pwdOk").css("display","inline-block");
				 $(".pwdNo").css("display","none");
				 $("#pwd_box").css("display","none");
				} else {
				 $(".pwdNo").css("display","inline-block");
				 $(".pwdOk").css("display","none");
				 $("#pwd_box").css("display","none");
				}
			
		});
		
		//닉네임 중복체크
		$("#member_nickname").focusout(function(){
			let member_nickname = $("#member_nickname").val();
			//alert(member_nickname);
			$.ajax({
				url:"nickname_check",
				type:"get",
				data:{member_nickname:member_nickname},
				success:function(data){
					//alert(data); 
					if(data != 0){
						$(".nickNameNo").css("display","inline-block");
						$(".nickNameOk").css("display","none");
						
					}else{
						$(".nickNameOk").css("display","inline-block");
						$(".nickNameNo").css("display","none");
					}
				}
			})//ajax 끝
			
		})//닉네임 중복체크 함수끝
		
		
		
		let code= "";
		//핸드폰 인증 발송
		$("#tel_check_btn").click(function(){
			let member_tel1 = $("#member_tel1").val();
			let member_tel2 = $("#member_tel2").val();
			let member_tel3 = $("#member_tel3").val();
			let member_tel=member_tel1+member_tel2+member_tel3;
			
			//alert(member_tel);
			//휴대전화번호 유효성 검사
			let regTel = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			if(regTel.test(member_tel) === true){ 
				
				$.ajax({
					url:"/sendNumber",
					type:"get",
					data:{member_tel:member_tel},
					success:function(data){
						code = data;
						//alert(code);
					}
				});
				$("#check_box").css("display","none");
				$("#test").css("display","inline-block");				
			}else{
				alert("연락처를 올바르게 입력하세요.");
			}
			
		});
		
		//핸드폰 인증
		$("#code_check_btn").click(function(){
			//alert("gi");
			if(code == $("#code_check").val()){
				alert("인증번호가 일치합니다!.");
				$("#member_tel1").attr("readonly",true)
				$("#member_tel2").attr("readonly",true)
				$("#member_tel3").attr("readonly",true)
				$("#code_check").attr("readonly",true)//
			
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
				$(".modal").fadeIn();	//모달창 오픈!
				
				//alert(member_addr1);	
				//alert(member_addr2);	
				let member_addr = member_addr1+" "+member_addr2;
				//alert(member_addr);
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
	 				 	 var imageSrc = '../images/thinking.png', // 마커이미지의 주소    
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
	    			   // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	    			   kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    			       
	    			       // 클릭한 위도, 경도 정보를 가져옵니다 
	    			       var latlng = mouseEvent.latLng; 
	    			       
	    			       // 마커 위치를 클릭한 위치로 옮깁니다
	    			       marker.setPosition(latlng);
	    			       
	    			       console.log(latlng.getLat());	//확인
	    			       console.log(latlng.getLng());	//확인
	    			       
					      //주소 변환 객체
					      let geocoder = new kakao.maps.services.Geocoder();
						 
						  let callback = function(result, status) {
						      if (status === kakao.maps.services.Status.OK) {
						        addr = result[0].address.address_name
						        console.log("geocoder로 받아온 주소:",addr);	//geocoder로 받아온 주소(현재 위치)
						      	console.log("입력창으로 받아온 주소:",member_addr); //입력창으로 받아온 주소
						      	
						      	//주소 비교 위해서 문자열 잘라서 비교
						      	let addr_check = addr.substring(0,addr.lastIndexOf("동")+1);
						      	let member_addr_check = member_addr.split("동",1)+"동";
						      	//console.log(member_addr1);
						      	//console.log(member_addr2);
						      	console.log("현재위치 동",addr_check);
						      	console.log("입력창 동",member_addr_check);
						      
						      	if(addr_check == member_addr_check){	//만약 주소가 일치한다면
						      		console.log("일치");	
						      		$("#check_addr").click(function(){
						      			alert("주소가 일치해요!");
						      			$("#member_loc").val(addr_check).attr("readonly",true);
						      			$(".modal").fadeOut();
						      			$(".check_Addr").css("display","inline-block");
					
						      		});
						      	}else{
						      		alert("주소가 일치하지 않아요!");
						      	}//if 끝
						      }//status if문 끝
						   }//callback함수 끝
						   geocoder.coord2Address(latlng.getLng(), latlng.getLat(), callback);
	    			   });//mouseEvent 함수 끝
					});//getCurrentPosition함수 끝
					} else {
						alert('GPS를 지원하지 않습니다');
					}
				
				}else{
					alert("주소를 입력해주세요");
				}
				
			});//모달창 열기 함수 끝 
		
		 //모달창 닫기 
		 $(".btn-close").click(function(){
			 $(".modal").fadeOut();
		 });
		
	});//function 끝
</script>
</head>
<body>
<!-- 모달창 시작-->
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
<!-- 모달창 끝 -->

<div style="padding:100px 100px; height: 1300px;">
	<div class="col-md-7 col-lg-8 border" style="margin: 0 auto; padding: 0 250px;">
		<!-- 회원가입 제목 -->
		<div class="pt-3 mt-5 mb-5" style="display: inline-block; width: 100%; padding-left: 90px;">
		<div style="float: left;" >
		<img src="../images/4989_logo.png" width="300px;" height="70px;">
       	</div>
       	<div style="float: left;">
        <p class="display-4 text-secondary text-bold text-center"><strong>회원가입</strong></p>
      	</div>
        </div>
        
        <form action="join" method="post" id="join" style="width: 650px;">
        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		
		<!-- 폼 감싸는 div -->
          <div class="row g-3" style="clear: both;">
           	
           	<!-- 아이디 input -->
            <div class="col-12">
              <div style="display: inline-block; float: left; line-height: 40px; width: 120px; text-align: right;">
              	<label for="email" class="form-label" style="font-size: 20px;">아이디 </label>
              </div>
              <div style="display: inline-block; float: right;">
              	<div style="display: inline-block; float: left">
              	<input type="email" class="form-control" name="member_id" id="member_id" placeholder="아이디(이메일형식)" style="width: 355px; height: 45px;">
            	</div>
            	<div style="display: inline-block; float: right;">
            	<button type="button" id="id_check_btn" class="btn btn-secondary btn-sm" style="height:45px;">중복확인</button>     	
              	</div>
              	
           	<!-- 아이디 중복검사 결과 div -->
              	<div class="m-0 p-0" id="duplicate_check">
	              	<div id="id_Box">
	              	<span>**아이디 입력후 중복확인을 해주세요.**</span>
	              	</div>
             		<span class="IdOk" style="color: red; display: none;"><i class="bi bi-exclamation-lg" style="padding-right: 5px;"></i>사용중인 아이디 입니다</span>
					<span class="IdNo" style="color: green; display: none;"><i class="bi bi-check-all" style="padding-right: 5px;"></i>사용가능한 아이디 입니다</span>
             	</div>
              </div>
              
            </div>
			
			<!-- 비밀번호 input -->
            <div class="col-12">
             <div style="display: inline-block; float: left; line-height: 40px; width: 120px; text-align: right;"> 
              <label for="member_pwd" class="form-label" style="font-size: 20px;">비밀번호</label>
             </div>
             <div style="display: inline-block; float: right;">
              <input type="password" class="form-control" name="member_pwd" id="member_pwd" placeholder="비밀번호를 입력해주세요" style="width: 430px; height: 45px;">
              <div id="pwd_box">
              	<span>**숫자 영문 대/소문자를 혼합, 8자 이상 14자 이하 입력**</span>
              </div>
             </div>
             
            </div>
            
			<!-- 비밀번호 확인 input -->
            <div class="col-12 mb-1">
             <div style="display: inline-block; float: left; line-height: 40px; width: 120px; text-align: right;"> 
              <label for="member_pwd_check" class="form-label" style="font-size: 20px;">비밀번호확인</label>
             </div>
             <div style="display: inline-block; float: right;">
              <input type="password" class="form-control" name="member_pwd_check" id="member_pwd_check" placeholder="비밀번호 확인" style="width: 430px; height: 45px;">
           		  <!-- 비밀번호 유효성검사 결과 div -->
	              <div class="m-0 p-0">
	                <span class="pwdOk" style="color: green; display: none;"><i class="bi bi-check-all" style="padding-right: 5px;"></i>비밀번호 일치</span>
					<span class="pwdNo" style="color: red; display: none;"><i class="bi bi-exclamation-lg" style="padding-right: 5px;"></i>비밀번호 불일치</span>
	              </div>
             </div>
             
            </div>
            
            <!-- 이름 input -->
            <div class="col-12 mb-1">
              <div style="display: inline-block; float: left; line-height: 40px; width: 120px; text-align: right;"> 
              	<label for="member_name" class="form-label" style="font-size: 20px;">이름</label>
              </div>
              <div style="display: inline-block; float: right;">
              	<input type="text" class="form-control" name="member_name" id="member_name" placeholder="이름을 입력해주세요" style="width: 430px; height: 45px;">
           	  </div>
            </div>
			
			<!-- 닉네임 input -->
            <div class="col-12 mb-1">
             <div style="display: inline-block; float: left; line-height: 40px; width: 120px; text-align: right;"> 
              	<label for="member_nickname" class="form-label" style="font-size: 20px;">닉네임</label>
             </div>
              <div style="display: inline-block; float: right;">
              	<input type="text" class="form-control" name="member_nickname" id="member_nickname" placeholder="닉네임을 입력해주세요" style="width: 430px; height: 45px;">
             	  <!-- 닉네임 유효성검사 결과 div -->
	              <div class="m-0 p-0">
	                <span class="nickNameNo" style="color: red; display: none;"><i class="bi bi-exclamation-lg" style="padding-right: 5px;"></i>사용중인 닉네임 입니다</span>
					<span class="nickNameOk" style="color: green; display: none;"><i class="bi bi-check-all" style="padding-right: 5px;"></i>사용가능한 닉네임 입니다</span>
	              </div>
              </div>
              
            </div>
            
            <!-- 성별 input -->
             <div class="form-check col-12">
              <div style="display: inline-block; float: left; line-height: 40px; width: 120px; text-align: right;"> 
              	<label class="form-label" for="member_gender" style="padding-right: 20px; font-size: 20px;">성별</label>
              </div>
              <div style="display: inline-block; float: left; line-height: 40px; padding-left: 80px;">
	          	  <input type="radio" class="form-radio-input mx-1" id="member_gender_male" name="member_gender" value="남">남&nbsp;&nbsp;&nbsp;
	          	  <input type="radio" class="form-radio-input mx-1" id="member_gender_female" name="member_gender" value="여">여
	           </div>
            </div>
            
            <!-- 연락처 input -->
   			<div class="d-flex m-3 pb-0" style="display: inline-block; ">
   				<div style="display: inline-block; padding-right: 15px; line-height: 40px; width: 120px; text-align: right;">
	   				<label for="member_tel" style="width: 100px; font-size: 20px; padding-left: 10px;">연락처</label> 
				</div>
				<div style="display: inline-block; padding-left: 85px; margin-right: 0px;">
					<div>
						<div class="col-md mx-0" style="float: left; width: 90px;">
							<input type="text" class="form-control" name="member_tel1" id="member_tel1" maxlength="3" style="height: 45px;" placeholder="010">
						</div>
						<div class="col-md mx-2" style="float: left; width: 110px;">
							<input type="text" class="form-control" name="member_tel2" id="member_tel2" maxlength="4" style="height: 45px;" placeholder="앞번호"> 
						</div>
						<div class="col-md mx-0" style="float: left; width: 110px;">
							<input type="text" class="form-control" name="member_tel3" id="member_tel3" maxlength="4" style="height: 45px;" placeholder="뒷번호">
						</div>
						
						<div style="display: inline-block; float: right; padding-right: 20px;">
	            			<button type="button" id="tel_check_btn" class="btn btn-secondary btn-sm" style="height:45px; width: 90px;">휴대폰인증</button> 
	              		</div>
	              		<div class=" p-0 m-0" id="check_box" style="display:inline-block;">
	              			<span>**연락처 입력후 휴대폰인증을 해주세요.**</span>
	              		</div>
	              	</div>
	              		
	             	<!-- 본인인증 div -->
	             	<div class="mt-3 mb-2" id="test" style="display: none;">
	              		<div style="display: inline-block; float: left;">
							<input type="text" class="form-control" id="code_check" style="width: 355px; height:45px;">
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
 
 			<!-- 생년월일 input -->
            <div class="d-flex mb-1" style="display: inline-block; width: 100%;">
   				<div style="display: inline-block; padding-right: 15px; line-height: 40px; width: 120px; text-align: right;">
            		<label for="member_birth" style="width: 120px; font-size: 20px;">생년월일</label> 
            	</div>
            	<div class="col-md-12" style="display: inline-block; padding-left: 95px;">
	             	<div class="col-md-3" style="display: inline-block;">
						<select style="float: left; height: 45px;" name="year" id="year" class="member_birth form-control"></select> 
					</div>
				 	<div class="col-md-3 mx-1" style="display: inline-block;">
						<select style="float: left; height: 45px;" name="month" id="month" class="member_birth form-control"></select> 
					</div>
					<div class="col-md-3" style="display: inline-block;">
						<select style="float: left; height: 45px;" name="day" id="day" class="member_birth form-control"></select> 
					</div>
				</div>
			</div>
			
			<!-- 주소 input -->
              <div class="col-12 mb-3">
              	<div style="display: inline-block; float: left; line-height: 40px; width: 120px; text-align: right;">
              		<label for="member_addr" class="form-label" style="font-size: 20px;">주소</label>
               	</div>
              <div style="display: inline-block; float: right;">
             		<div class="mx-3" style="float: left;">
	              		<!-- 시/도 선택 -->
	              		<select class="member_addr1 form-control" name="member_addr1" id="member_addr1" style="width:115px; height: 45px;"></select>
	              	</div>
	              	<div style="float: left;">
	              		<!-- 나머지 주소 -->
	              		<input type="text" class="form-control" name="member_addr2" id="member_addr2" placeholder="나머지 주소" style="width: 300px; height: 45px;">
           		 		
           		 	</div>
           		 	<div style="display: block;">
           		 		<span class="mx-3">**주소 입력후 지역인증을 해주세요.**</span>
	              	</div>
           		 </div>
              </div>
            
			
            <!--지역인증 -->
			  <div class="col-12 pb-3">
              	<div style="display: inline-block; float: left; padding-left: 40px; line-height: 40px; width: 120px; text-align: right;">
              	 	<label for="check_loc" class="form-label" style="font-size: 20px;float: left;">지역인증</label>
               	</div>
                <div style="display: inline-block; float: right;">
              	 	<button type="button" id="check_btn" class="w-100 btn btn-secondary btn-sm text-bold" style="height:45px; padding:0 185px; float: left; font-size: 15px;">지역인증</button> 
                </div>
	        	<!-- 지역인증 결과 div -->
              	<div class="mb-2" id="check_addr_box" style="display: none;">
	                <!-- 지역인증 input -->
	              	<div style="display: inline-block; float: right; width: 430px;">
              			<input type="text" class="form-control" name="member_loc" id="member_loc" placeholder="지역인증 주소" style="width: 430px; height: 45px;">
          			</div>
				    <!-- 지역인증 결과 div -->
		            <div class="m-0 p-0" style="display: inline-block; float: right; padding-left: 120px; width: 430px;">
		              	<span class="check_Addr" id="check_Addr" style="color: green; display: none;"><i class="bi bi-check-all" style="padding-right: 5px;"></i>지역인증 완료!</span>
		            </div>
				</div>
      		<!-- 지역인증 div 끝 -->
            </div>
		<!-- 폼감싸는 div 끝 -->
		</div>	

           <!-- 회원가입 버튼 -->
           <div class="pt-3 mb-5" style="text-align: center;">
        		 <button class="w-100 btn btn-primary btn-lg mb-1" id="btn" type="button" style="height: 60px;" >회원가입</button>
          		 <a href="/login" class="fs-4">취소</a>
           </div>
          
          
          </div>
        </form>
      </div>
    </div>
	
	
</body>
</html>