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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).ready(function(){
			getYear();
			getMonth();
			getlastDay();
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
			let day = $("#day").val
			
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
		
		
		$("#code_check_btn").click(function(){
			//alert("gi");
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
<style type="text/css">
	
</style>
</head>
<body>
	

<div style="padding:100px 300px; height: 1300px;">
	<div class="col-md-7 col-lg-8 border" style="margin: 0 auto; padding: 0 300px;">
		<!-- 회원가입 제목 -->
        <h1 class="mb-5 mt-5 display-4 text-secondary text-bold text-center">회원가입</h1>
        <form action="join" method="post" id="join" style="width: 650px;">
        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		
		<!-- 폼 감싸는 div -->
          <div class="row g-3">
           	
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
              	<span>**숫자 영문 대/소문자를 혼합하여 15글자 이상 입력**</span>
              </div>
             </div>
             
            </div>
            
			<!-- 비밀번호 확인 input -->
            <div class="col-12">
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
            <div class="col-12">
              <div style="display: inline-block; float: left; line-height: 40px; width: 120px; text-align: right;"> 
              	<label for="member_name" class="form-label" style="font-size: 20px;">이름</label>
              </div>
              <div style="display: inline-block; float: right;">
              	<input type="text" class="form-control" name="member_name" id="member_name" placeholder="이름을 입력해주세요" style="width: 430px; height: 45px;">
           	  </div>
            </div>
			
			<!-- 닉네임 input -->
            <div class="col-12">
             <div style="display: inline-block; float: left; line-height: 40px; width: 120px; text-align: right;"> 
              	<label for="member_nickname" class="form-label" style="font-size: 20px;">닉네임</label>
             </div>
              <div style="display: inline-block; float: right;">
              	<input type="text" class="form-control" name="member_nickname" id="member_nickname" placeholder="닉네임을 입력해주세요" style="width: 430px; height: 45px;">
             	  <!-- 닉네임 유효성검사 결과 div -->
	              <div class="m-0 p-0">
	                <span class="nickNameNo" style="color: red; display: none;"><i class="bi bi-check-all" style="padding-right: 5px;"></i>사용중인 닉네임 입니다</span>
					<span class="nickNameOk" style="color: green; display: none;"><i class="bi bi-exclamation-lg" style="padding-right: 5px;"></i>사용가능한 닉네임 입니다</span>
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
   			<div class="d-flex m-3" style="display: inline-block; ">
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
					
					<div style="display: inline-block; float: right; padding-right: 15px;">
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
            <div class="d-flex m-0" style="display: inline-block; width: 100%;">
   				<div style="display: inline-block; padding-right: 15px; line-height: 40px; width: 120px; text-align: right;">
            		<label for="member_birth" style="width: 120px; font-size: 20px;">생년월일</label> 
            	</div>
            	<div class="col-md-12" style="display: inline-block; padding-left: 95px;">
	             	<div class="col-md-3 mx-1" style="display: inline-block;">
						<select style="float: left; height: 45px;" name="year" id="year" class="member_birth form-control"></select> 
					</div>
				 	<div class="col-md-2 mx-1" style="display: inline-block;">
						<select style="float: left; height: 45px;" name="month" id="month" class="member_birth form-control"></select> 
					</div>
					<div class="col-md-2 mx-1" style="display: inline-block;">
						<select style="float: left; height: 45px;" name="day" id="day" class="member_birth form-control"></select> 
					</div>
				</div>
			</div>
			
			<!-- 주소 input -->
              <div class="col-12">
              	<div style="display: inline-block; float: left; line-height: 40px; width: 120px; text-align: right;">
              		<label for="member_addr" class="form-label" style="font-size: 20px;">주소</label>
               	</div>
              <div style="display: inline-block; float: right;">
              	<input type="text" class="form-control" name="member_addr" id="member_addr" placeholder="주소" style="width: 430px; height: 45px;">
              </div>
            </div>
			
			<!-- 상세 주소 input -->
            <div class="col-12">
            	<div style="display: inline-block; float: left; line-height: 40px; width: 120px; text-align: right;">
              		<label for="member_loc" class="form-label" style="font-size: 20px;">상세주소</label>
            	</div>
            	<div style="display: inline-block; float: right;">
              		<input type="text" class="form-control" name="member_loc" id="member_loc" placeholder="상세주소" style="width: 430px; height: 45px;">
          		</div>
            </div>
            
            <!--지역인증 구현x -->
            <div style="display: inline-block; float: left; line-height: 40px; width: 90px; text-align: right;">
	           <label>지역인증 : </label>
	           <input type="button" value="확인"> <br>
           </div>
			
           
           <!-- 회원가입 버튼 -->
           <div class="pt-1 mb-5">
        		 <button class="w-100 btn btn-primary btn-lg" id="btn" type="button" style="height: 60px;" >회원가입</button>
        	</div>
          
          
          </div>
        </form>
      </div>
    </div>
	
	
</body>
</html>