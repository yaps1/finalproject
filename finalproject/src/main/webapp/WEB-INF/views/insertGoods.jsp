<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
    
    // 질문유형을 선택한다.
    chnQnaType('' , '');
    
	//유효성검사
    (function () {
    	  'use strict'

    	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
    	  var forms = document.querySelectorAll('.needs-validation')

    	  // Loop over them and prevent submission
    	  Array.prototype.slice.call(forms)
    	    .forEach(function (form) {
    	      form.addEventListener('submit', function (event) {
    	        if (!form.checkValidity() ||  $('#select1').val()==-1 ||
    	        $('#schQnaType').val()==-1) {
    	          event.preventDefault()
    	          event.stopPropagation()
    	        }
				
    	        form.classList.add('was-validated')
    	      }, false)
    	    })
    	})()
});


function chnQnaType(type , select) { 
    $('#schQnaType').empty();
    if(type==''){
    	$('#schQnaType').append("<option selected disabled value='' >--선택해주세요--</option>");
    } else if(type == '1') { 
    	$('#schQnaType').append("<option selected disabled value='' >--선택해주세요--</option>");
        $('#schQnaType').append("<option value='11' name='goods_category'>아우터</option>");
        $('#schQnaType').append("<option value='12' name='goods_category'>상의</option>");
        $('#schQnaType').append("<option value='13' name='goods_category'>하의</option>");
        $('#schQnaType').append("<option value='14' name='goods_category'>언더웨어/홈웨어</option>");
    } else if (type == '2') {  
    	$('#schQnaType').append("<option selected disabled value='' >--선택해주세요--</option>");
        $('#schQnaType').append("<option value='21' name='goods_category'>신발</option>");
        $('#schQnaType').append("<option value='22' name='goods_category'>가방</option>");
        $('#schQnaType').append("<option value='23' name='goods_category'>반려동물 물품</option>");
    } else if ( type == '3') {    
    	$('#schQnaType').append("<option selected disabled value='' >--선택해주세요--</option>");
        $('#schQnaType').append("<option value='31' name='goods_category'>모바일</option>");
        $('#schQnaType').append("<option value='32' name='goods_category'>가전제품</option>");
        $('#schQnaType').append("<option value='33' name='goods_category'>PC/노트북</option>");
        $('#schQnaType').append("<option value='34' name='goods_category'>카메라</option>");
        $('#schQnaType').append("<option value='35' name='goods_category'>오디오/영상</option>");
    }else if ( type == '4') { 
    	$('#schQnaType').append("<option selected disabled value='' >--선택해주세요--</option>");
        $('#schQnaType').append("<option value='41' name='goods_category'>가구</option>");
        $('#schQnaType').append("<option value='42' name='goods_category'>인테리어</option>");

    }else if ( type == '5') {  
    	$('#schQnaType').append("<option selected disabled value='' >--선택해주세요--</option>");
        $('#schQnaType').append("<option value='51' name='goods_category'>게임</option>");
        $('#schQnaType').append("<option value='52' name='goods_category'>취미</option>");

    }else if ( type == '6') { 
    	$('#schQnaType').append("<option selected disabled value='' >--선택해주세요--</option>");
        $('#schQnaType').append("<option value='61' name='goods_category'>스포츠</option>");
        $('#schQnaType').append("<option value='62' name='goods_category'>레저</option>");
    }else if ( type == '7') { 
        $('#schQnaType').append("<option value='71' name='goods_category'>헤어/바디</option>");
        $('#schQnaType').append("<option value='72' name='goods_category'>메이크업</option>");
    }else if ( type == '8') { 
    	$('#schQnaType').append("<option selected disabled value='' >--선택해주세요--</option>");
        $('#schQnaType').append("<option value='81' name='goods_category'>도서</option>");
        $('#schQnaType').append("<option value='82' name='goods_category' >문구</option>");
        $('#schQnaType').append("<option value='83' name='goods_category'>티켓/기프티콘/상품권</option>");
    }else if ( type == '9') { 
    	$('#schQnaType').append("<option selected disabled value='' >--선택해주세요--</option>");
        $('#schQnaType').append("<option value='91' name='goods_category'>차량</option>");
        $('#schQnaType').append("<option value='92' name='goods_category'>오토바이</option>");
    }else if ( type == '0') { 
    	$('#schQnaType').append("<option selected disabled value='' >--선택해주세요--</option>");
        $('#schQnaType').append("<option value='0' name='goods_category'>기타</option>");
    }
    document.getElementById("schQnaType").style.display = "";
    
    if ($.trim(select) != "") {
        $('#select1').val(type);
        $('#schQnaType').val(select);
    }
}
function checkNumber(event) {
	  if(event.key === '.' 
	     || event.key === '-'
	     || event.key >= 0 && event.key <= 9) {
	    return true;
	  }
	  
	  return false;
	}
</script>
<style type="text/css">
	#container{
		margin: 0 auto;	
		justify-content: center;
		width: 80%;

	}
	a{
	text-decoration: none; /* 링크의 밑줄 제거 */
  	color: inherit; /* 링크의 색상 제거 */
  	}
  	textarea {
	    width: 100%;
	    height: 6.25em;
	    border: none;
	    resize: none;
	  }
	img{
	  	width: 100px;
	  	height: 100px;
	}
</style>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<hr>
<div id="container">
	<div style="border: 1px solid;" class="d-grid gap-3">
	<br>
	<p class="fs-1 text-center fw-bold" style="text-align: center">중고거래 상품등록</p>
	<div style="width: 90%;margin: 0 auto;">
		<form action="insertGoods" method="post" enctype="multipart/form-data" class="row g-3 needs-validation" novalidate>
		<input type="hidden" name="member_no" value="${m.member_no }">
		<input type="hidden" name="goods_addr" value="${m.member_addr }">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<div class="row g-3 mb-3 row">	
				<div class="col-md-3">
					<p style="display: inline;"	 >카테고리 선택 </p>
				</div>
				<div class="col-auto">
				    <select name="questType" id="select1" onChange="chnQnaType(this.value)"style="width: 200px; display: inline-flex;" class="form-select" required>
					    <option selected disabled value="">--선택해주세요--</option>
					    <option value="1">의류</option>
					    <option value="2">잡화</option>
					    <option value="3">생활가전</option>
					    <option value="4">가구/인테리어</option>
					    <option value="5">게임/취미</option>
					    <option value="6">스포츠/레저</option>
					    <option value="7">뷰티/미용</option>
					    <option value="8">도서/티켓/문구</option>
					    <option value="9">차량/오토바이</option>
					    <option value="0">기타</option>
					</select>  
					<div class="invalid-feedback">
				      분류를 선택해주세요.
				    </div> 
				</div>
				
				<div class="col-auto">
					<select id="schQnaType" name="goods_category"  style="width:200px; display:inline;" class="form-select" required></select>
					<div class="invalid-feedback">
				      분류를 선택해주세요.
				    </div>
				</div>

			</div>
			<div>
				<div class="mb-3 row">
				    <label for="goods_name" class="col-sm-2 col-form-label">상품명</label>
				    <div class="col-sm-10">
			      		<input type="text" class="form-control" id="goods_name" name="goods_name" required>
				    	<div class="invalid-feedback">
					        상품명을 입력해주세요.
					    </div>
			    	</div>
				</div>
			</div>
			<div>
				<div class="mb-3 row">
				    <label for="goods_price" class="col-sm-2 col-form-label">가격</label>
				    <div class="col-sm-10">
			      		<div class="input-group">
						  <input type="text" class="form-control text-end" aria-label="Dollar amount (with dot and two decimal places)" id="goods_price" name="goods_price" required onkeypress='return checkNumber(event)'>
						  <span class="input-group-text">원</span>
						  <div class="invalid-feedback">
					        가격을 입력해주세요.
					      </div>
						</div>
			    	</div>
				</div>
			</div>
			<div>
				<label for="goods_name" class="col-sm-2 col-form-label">상품상태</label>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="goods_state" id="inlineRadio1" value="1" required>
				  <label class="form-check-label" for="inlineRadio1">미개봉</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="goods_state" id="inlineRadio2" value="2" required>
				  <label class="form-check-label" for="inlineRadio2">거의 새 것</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="goods_state" id="inlineRadio3" value="3" required>
				  <label class="form-check-label" for="inlineRadio3">사용감 있음</label>
				</div>
				<div class="invalid-feedback">
			        Please choose a username.
			    </div>
			</div>
			<div>
				<label for="goods_name" class="col-sm-2 col-form-label">배송 방법</label>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="goods_deliver" id="inlineRadio4" value="1" required>
				  <label class="form-check-label" for="inlineRadio4">직거래</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="goods_deliver" id="inlineRadio5" value="2" required> 
				  <label class="form-check-label" for="inlineRadio5">택배거래</label>
				</div>
			</div>
			<div>
				<div class="mb-3 row">
				    <label for="goods_content" class="col-sm-2 col-form-label">내용</label>
				    <div class="col-sm-10">
						<textarea class="form-control" name="goods_content" required></textarea>
				    </div>
				    <div class="invalid-feedback">
			       	 내용을 입력해주세요.
			   		</div>
				 </div>
			</div>
			<div>
				<div class="input-group mb-3">
				  	<label class="input-group-text" for="uploadFile[]">상품이미지</label>
				 	<input type="file" class="form-control" id="myFile" multiple size="5" name="uploadFile[]" accept=".png,.jpg,.jpeg" onchange="myFunction(), setThumbnail(event);" multiple required>
					<div class="invalid-feedback">
				        파일을 선택해주세요.
				    </div>
				</div>				
			</div>
	
			<p id="demo"></p>
			<div id="image_container"></div>
			<script>
			//파일 정보 띄우기
			function myFunction(){
			  var x = document.getElementById("myFile");
			  $("img").remove("img");
			  //console.log(x.value);
			  var txt = "";
			  if ('files' in x) {
				  if (x.files.length > 4) {
				        alert("파일 개수가 초과되었습니다.");
				        document.getElementById("myFile").value = "";
				        return;
				    }
				  
				  
				    if (x.files.length == 0) {
				      txt = "파일을 선택해주세요.";
				    } else {
				      for (var i = 0; i < x.files.length; i++) {
				        txt += "<br><strong>" + (i+1) + ". file</strong><br>";
				        var file = x.files[i];
				        if ('name' in file) {
				          txt += "이미지 이름: " + file.name + "<br>";
				        }
/* 				        if ('size' in file) {
				          txt += "size: " + file.size + " bytes <br>";
				        } */

				      }
				    }
				  } 
				  else {
				    if (x.value == "") {
				      txt += "Select one or more files.";
				    } else {
				      txt += "The files property is not supported by your browser!";
				      txt  += "<br>The path of the selected file: " + x.value; // If the browser does not support the files property, it will return the path of the selected file instead. 
				    }
				  }
				  document.getElementById("demo").innerHTML = txt;
			}
			//파일 이미지 띄우기
			function setThumbnail(event) { for (var image of event.target.files) { var reader = new FileReader(); reader.onload = function(event) { var img = document.createElement("img"); img.setAttribute("src", event.target.result); document.querySelector("div#image_container").appendChild(img); }; console.log(image); reader.readAsDataURL(image); } }
			</script>
			
			<button type="submit" class="btn btn-primary btn-lg col-sm-6 mx-auto" >등록</button>
			<button type="reset" class="btn btn-secondary btn-lg col-sm-6 mx-auto">취소</button>
			<br>
		</form>
		</div>
	</div>
</div>
<br>
<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>