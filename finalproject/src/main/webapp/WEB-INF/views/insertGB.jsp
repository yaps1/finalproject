<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
.container {
  background-color : #EAEAEA;
  width: 60%;
}

label{
	font-weight: bold;
	font-size: large;
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function(){
 	$("#gb_start_date,#gb_end_date").datepicker({
        dateFormat: 'yy-mm-dd' //달력 날짜 형태
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
        ,changeYear: true //option값 년 선택 가능
        ,changeMonth: true //option값  월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
        ,buttonText: "선택" //버튼 호버 텍스트              
        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
        ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    });                    
    
    //초기값을 오늘 날짜로 설정
    $('#gb_start_date').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  
    $('#gb_end_date').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  

});

</script>
</head>
<body>
	<br>
	<br>
	<h2 style="text-align : center;"><strong>공동구매 등록</strong></h2>
	<br>
	<!-- 네비게이션바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid" style="text-align : center; width: 60%">
	    <a class="navbar-brand" href="/listGB">목록</a>
	  </div>
	</nav>
	<br>
	<br>
	<div class="container">
   	<form  action="insertGB?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="hidden" id="gb_no" value="${no }" name="gb_no"><br>
		<div class="row mb-3">
		 <label for="gb_title" class="col-sm-2 col-form-label">제목</label>
		 <div class="col-sm-10">
		  <input type="text" id="gb_title" name="gb_title" class="form-control">
		 </div>
		</div>
		<div class="row mb-3">
		 <label for="gb_category" class="col-sm-2 col-form-label">카테고리</label>
		 <div class="col-sm-10">
		  <!-- 
		  <input type="text" id="gb_category" name="gb_category" class="form-control">
		   -->
		  <select class="form-select" aria-label="Default select example" id="gb_category" name="gb_category">
			  <option selected>공동구매 분류</option>
			  <option value="1">OTT</option>
			  <option value="2">음식</option>
			  <option value="3">기타</option>
		  </select>
		 </div>
		</div>
		<div class="row mb-3">
		 <label for="gb_start_date" class="col-sm-2 col-form-label">시작 기간</label>
		 <div class="col-sm-10">
		  <input type="text" name="gb_start_date" id="gb_start_date" class="form-control">
		 </div>
		</div>
		<div class="row mb-3">
		 <label for="gb_end_date" class="col-sm-2 col-form-label">종료 기간</label>
		 <div class="col-sm-10">
		  <input type="text" name="gb_end_date" id="gb_end_date" class="form-control">
		 </div>
		</div>
		<div class="row mb-3">
		 <label for="gb_capacity" class="col-sm-2 col-form-label">모집인원</label>
		 <div class="col-sm-10">
		  <input type="text" id="gb_capacity" name="gb_capacity" class="form-control">
		 </div>
		</div>
		<div class="row mb-3">
		 <label for="gb_price" class="col-sm-2 col-form-label">가격</label>
		 <div class="col-sm-10">
		  <input type="text" id="gb_price" name="gb_price" class="form-control">
		 </div>
		</div>
		<div class="row mb-3">
		 <label for="gb_content" class="col-sm-2 col-form-label">내용</label>
		 <div class="col-sm-10">
		  <textarea id="gb_content" name="gb_content" class="form-control"></textarea>
		 </div>
		</div>
		<br>
		<div class="row mb-3">
		  <label for="uploadFile" class="col-form-label">상품 이미지(1개 이상 반드시 첨부)</label>
		  <input type="file" id="uploadFile" name="uploadFile" class="form-control">
		  <input type="file" id="uploadFile2" name="uploadFile2" class="form-control">
		  <input type="file" id="uploadFile3" name="uploadFile3" class="form-control">
		</div>
		<br>
		<br>
		<div style="width: 8rem;margin: auto;">
		<input type="submit" value="등록" class="btn btn-outline-secondary" style="margin-bottom: 25px">
		<input type="reset" value="취소" class="btn btn-outline-light"  style="margin-bottom: 25px">
		</div>    
	</form>
	<br>
	</div>
	<br>
	<br>
	<br>
	<br>
</body>
</html>