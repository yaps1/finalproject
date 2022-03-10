<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
		$(document).ready(function(){
			//댓글목록 로드
			load_listSGC();
			
			//댓글 목록에 답글 클릭시 폼생성 이벤트
			 $(document).on("click","#replySGC",function(){     
				 let sg_comment_no = $(this).parent().parent().attr("sg_comment_no");
				
				 //alert(sg_comment_no);
				 console.log("부모댓글의 댓글번호:",sg_comment_no);
				 
				 let div = $("<div></div>").css("width","100%").addClass("input").addClass("border");
				 let input = $("<input></input>").attr("type","hidden").attr("value",sg_comment_no).attr("id","sg_commnet_no");
				 
				 let pDiv = $("<div></div>");
				 let p = $("<p></p>").addClass("text-secondary").addClass("mx-3").addClass("mb-0").html("답댓글 달기");
				 pDiv.append(p);
				 
				 let textarea = $("<textarea></textarea>").css("width","94%").addClass("form-control").addClass("mx-3").attr("id","inputSGC");				 
				 let comment = $(this).parent().parent();
				 
				 let btnDiv = $("<div></div>").css("float","right");
				 btnDiv.append($("<button></button>").addClass("btn btn-secondary btn-sm mx-1").attr("id","answerSGC").html("등록"));
				 btnDiv.append($("<button></button>").addClass("btn btn-secondary btn-sm").attr("id","canselSGC").html("취소"));
				 
				 div.append(pDiv);
				 div.append(textarea);
				 div.append(input);
				 div.append(btnDiv);
				 
				 comment.after(div);
		     });
			 //답댓글 저장
			 $(document).on("click","#answerSGC",function(){
				// alert("test");
				//let sg_level = sg_level.val().replace("\n","<br>"); 
				//let sg_comment_val = sg_comment.val().replace("\n","<br>"); 
				//let sg_ref = sg_ref.val();
				//alert(sg_level);
				//let sg_no = $("#insertForm #sg_no").val()
				//alert(sg_no);
				let sg_comment_no = $("#sg_commnet_no").val();
				
				//alert(sg_comment_no);
				$.ajax({
						url:"insertSGC",
						type:"post",
						data:{	
							sg_comment : ﻿$("#inputSGC").val(),
							sg_no : $("#insertForm #sg_no").val(), 
							member_no : $("#insertForm #member_no").val(),	 
							member_nickname : $("#insertForm #member_nickname").val(),
							sg_comment_no : sg_comment_no
							
							
						},
						success:function(result){	
							alert("댓글등록에 성공하였습니다");
							﻿$("#inputSGC").val("");
							load_listSGC();
						}
					});
					
			 });
			
			//댓글 목록 수정 클릭시 수정가능 폼 생성 이벤트
			 $(document).on("click","#updateSGC",function(){
		      
				 //alert($(this).parent().parent().attr("sg_comment_no"));
				 //alert($(this).parent().parent().attr("sg_comment"));
				 
				 let sg_comment_no = $(this).parent().parent().attr("sg_comment_no");
				 let sg_comment = $(this).parent().parent().attr("sg_comment");
				 
				 let comment = $(this).parent().parent();
				 
				 let div = $("<div></div>").css("width","100%").addClass("input").addClass("border");
				 let input = $("<input></input>").attr("type","hidden").attr("value",sg_comment_no).attr("id","sg_commnet_no");
				//
				 let pDiv = $("<div></div>");
				 let p = $("<p></p>").addClass("text-secondary").addClass("mx-3").addClass("mb-0").html("댓글 수정");
				 pDiv.append(p);
				 //
				 let textarea = $("<textarea>"+sg_comment+"</textarea>").css("width","97%").addClass("mx-3").addClass("form-control").attr("id","inputSGC");				 
				 
				 let btnDiv = $("<div></div>").css("float","right");
				 btnDiv.append($("<button></button>").addClass("btn btn-secondary btn-sm mx-1").attr("id","commitSGC").html("등록"));
				 btnDiv.append($("<button></button>").addClass("btn btn-secondary btn-sm").attr("id","canselSGC").html("취소"));
				 
				 div.append(pDiv);
				 div.append(textarea);
				 div.append(input);
				 div.append(btnDiv);
				 
				 comment.after(div);
		     });
			 
			//댓글 수정하면 저장하는 이벤트
			 $(document).on("click","#commitSGC",function(){
				 let sg_comment_no = $("#sg_commnet_no").val();
				//alert(sg_comment_no);	
				 let sg_comment = $("#inputSGC").val();
				 //alert(sg_comment);
				
				 $.ajax({
					 url:"updateSGC",
					 type:"post",
					 data:{
						 sg_comment:sg_comment,
						 sg_comment_no:sg_comment_no
					},
				 	success:function(data){
				 		if(data==1){
				 			alert("댓글 수정에 성공하였습니다.");
				 			$(".input").remove();
				 			load_listSGC();
				 		}
				 	}//댓글 수정 저장 success끝
				 })//댓글 수정 저장 ajax끝
			 });//댓글 수정 이벤트 함수 끝
			      
			 //댓글 수정 폼에서 취소 클릭시 이벤트
			 $(document).on("click","#canselSGC",function(){
				 $(".input").remove();
			 });
			 
			 
			 //댓글 목록에 삭제 클릭시 이벤트
			 $(document).on("click","#deleteSGC",function(){
				
				 con = confirm("댓글을 정말 삭제하시겠습니까?");
				 if(con == true){
					 let sg_comment_no = $(this).parent().parent().attr("sg_comment_no");
					 //alert(sg_comment_no);	
			         $.ajax({
			        	 url:"deleteSGC",
			        	 type:"post",
			        	 data:{sg_comment_no:sg_comment_no},
			        	 success:function(result){
			        		 if(result==1){
			        			 alert("댓글 삭제에 성공하였습니다.");
			        			 load_listSGC();
			        		 }else{
			        			 alert("댓글 삭제에 실패하였습니다.");
			        		 }
			        	 }//댓글 삭제 success 끝
			         })//댓글 삭제 ajax 끝
				 }else{
					 alert("댓글 삭제가 취소되었습니다");
				 }
				 
		     });//댓글 삭제 함수 끝

		});//document.ready함수 끝
		
		
		//댓글 입력
		$("#insertSGC").on("click",function wirte_insertSGC(form){
			﻿$("#insertForm #sg_comment").val().trim();  
			if(﻿$("#insertForm #sg_comment").val()==0){
				alert("댓글을 입력해주세요");
				$("#insertForm #sg_comment").focus();
				return false;
			}
			
			$.ajax({
				url:"insertSGC",
				type:"post",
				data:{	
					sg_comment : ﻿$("#insertForm #sg_comment").val(),
					sg_no : $("#insertForm #sg_no").val(), 
					member_no : $("#insertForm #member_no").val(),	 
					member_nickname : $("#insertForm #member_nickname").val()
				},
				success:function(result){	
					alert("댓글등록에 성공하였습니다");
					﻿$("#insertForm #sg_comment").val("");
					load_listSGC();
				}
			});	
		});//댓글 등록 함수 끝
		
		//댓글 리스트
		function load_listSGC(){
			
	 		let nickname = $("#member_nickname").val();
			
			$.ajax({
				url:"listSGC",
				type:"get",
				data : {sg_no:${s.sg_no}},
				success:function(data){
					$("#listSGC").empty();
					//let output = "<table>";
					$.each(data,function(index,item){
						//console.log(item.member_nickname);
						//console.log(item.sg_comment_date);
						//console.log(item.sg_comment);
						//console.log(item);
						let sg_level = item.sg_level
						//console.log(sg_level);
						
						let li = $("<li></li>").css("display","block").addClass("list-group-item").addClass("m-0").attr("sg_comment_no",this.sg_comment_no);
						$(li).append($("<span></span>").html(item.member_nickname));
						$(li).append($("<span></span>").addClass("mx-2").html(item.sg_comment_date));
						//버튼그룹 생성
						let btn = $("<div></div>").css("float","right");
						//댓글 답글 버튼 생성
						btn.append($("<button></button>").addClass("btn btn-primary btn-sm mx-0").attr("id","replySGC").html("답글"))
						$(li).append(btn);
						//댓글 작성자와 접속자의 닉네임이 같다면 수정, 삭제버튼 생성
						if(item.member_nickname == nickname){
							btn.append($("<button></button>").addClass("btn btn-primary btn-sm mx-1").attr("id","updateSGC").attr("index",index).html("수정"))
							btn.append($("<button></button>").addClass("btn btn-primary btn-sm mx-0").attr("id","deleteSGC").html("삭제"));
							$(li).append(btn);
						}
						
							if(sg_level==0){
								$(li).append($("<p></p>").addClass("my-3").html(item.sg_comment)).attr("sg_comment",this.sg_comment);
							}else{
								let p = $("<p></p>").addClass("mt-3");
								//$(li).append($("<span></span>").addClass("bi bi-arrow-return-right").addClass("text-primary"));
								//$(li).append($("<span></span>").addClass("my-3").html(item.sg_comment)).attr("sg_comment",this.sg_comment);
								//$(li).append($("<p></p>").addClass("bi bi-arrow-return-right").addClass("text-secondary").addClass("my-3").html(item.sg_comment)).attr("sg_comment",this.sg_comment);
									for(let i=1;i<=sg_level;i++){
										p.append($("<span></span>").addClass("bi bi-arrow-return-right").addClass("text-primary").addClass("fs-5")) ;
									}
									p.append($("<span></span>").addClass("my-3").addClass("mx-1").html(item.sg_comment)).attr("sg_comment",this.sg_comment);
									$(li).append(p);
							}
						$("#listSGC").append(li).trigger("create");
					})
				}
			});
		}//댓글 등록 함수 끝
		
		//게시판 삭제 
		$("#deleteSG").on("click",function(){
			let sg_no = ${s.sg_no}
			//let member_no = ${s.member_no }
			con = confirm("게시물을 정말 삭제하시겠습니까?");
			if(con == true){
				$.ajax({
					url : "countSGC",
					type : "get",
					data : {sg_no:sg_no},
					success:function(count){
						if(count>0){
							alert("댓글이 있는 게시물은 삭제할 수 없습니다.");
							return;
						}
						$.ajax({
							url : "deleteSG",
							type :"post",
							data:{sg_no:sg_no},
							success:function(data){
								if(data == 1){
									alert("게시물삭제에 성공하였습니다.");
									location.href='listSG';
								}
							}
						});//deleteSG ajax끝
					}//countSGC success끝
				})//countSGC ajax끝
			}else{
				alert("게시물삭제를 취소하였습니다.");
			}
		});//게시판 삭제 함수 끝
		
});
</script>
</head>
<jsp:include page="header2.jsp"></jsp:include>
<body>
  <div style="width: 100%; height: 1400px;">
	<!-- 소모임 상세 보기 -->
	<div style="margin: 0 auto; padding:130px 600px 100px;">
		<!-- 소모임 상세 보기 제목 -->
		<div class="mb-5">
			<h1 class="fw-bold display-3 text-secondary text-center">소모임 상세</h1>
		</div>
		<!-- 소모임 상세보기 내용 -->
		<div class="mb-3">
			<table class="table table-bordered table-responsive">
				<tr>
					<th class="table-secondary col-lg-2">제목</th>
					<td >${s.sg_title }</td>
				</tr>
				<tr>
					<th class="table-secondary col-lg-2">작성자</th>
					<td>${s.member_nickname }</td>
				</tr>
				<tr>
					<th class="table-secondary col-lg-2">작성일</th>
					<td>${s.sg_date }</td>
				</tr>
				<tr>
					<th class="table-secondary col-lg-2">내용</th>
					<td>${s.sg_content }</td>
				</tr>
			</table>
		</div>
		
		<div style="display: inline-block; width: 100%;">
				<div style="float: left;">
				<button class="mb-2 btn btn-lg rounded-4 btn-primary" style="width: 130px; height: 50px;" type="button" onclick="location.href='/listSG?PageNum=1'">목록</button>
				</div>
				
				<c:if test="${m.member_nickname == s.member_nickname }">
				<div style="float: right;">
				
				<button class="mb-2 btn btn-lg rounded-4 btn-primary mx-0" id="deleteSG" style="width: 130px; height: 50px;" type="button">삭제하기</button>
				</div>
				<div style="float: right;">
				<button class="mb-2 btn btn-lg rounded-4 btn-primary mx-1" style="width: 130px; height: 50px;" type="button" onclick="location.href='/updateSG?sg_no=${s.sg_no}'">수정하기</button>
				</div>
				</c:if>
				
		</div>
		
		
		<!-- 댓글 작성 -->
		<div class="mt-5" style="margin: 0 auto; width: 100%;">
			<div class="mb-3">
				<h2 class="fw-bold h-5 text-secondary text-center">댓글 작성</h2>
			</div>
			<div>
				<div style="margin: 0 auto; width: 100%;">
					<form action="insertSGC" method="post" id="insertForm" name="insertForm" onsubmit="wirte_insertSGC(this) return false;" style="width: 100%;">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<input type="hidden" id="sg_no" name="sg_no" value="${s.sg_no}">
						<input type="hidden" id="sg_comment_no" name="sg_comment_no" value="0">
						<textarea class="form-control" rows="" cols="15" id="sg_comment" name="sg_comment" style="width: 100%; height:80px"></textarea>
						<input type="hidden" id="member_no" name="member_no" value="${m.member_no }">
						<input type="hidden" id="member_nickname" name="member_nickname" value="${m.member_nickname }">
						
				</div>	
					<div style="float: right;">
						<button class="mb-2 btn btn-sm rounded-4 btn-primary" id="insertSGC" type="button">댓글등록</button>
					</div>
					</form>
			</div>
		</div>
		
		
		<!-- 댓글 목록 리스트 -->
		<div class="mt-5 " style="margin: 0 auto;">
			<!-- 댓글 목록 제목 -->
			<div>
			<h2 class="fw-bold h-5 mb-3 text-secondary text-center">댓글 목록</h2>
		 	</div>
		 	<!-- 댓글 목록 ajax으로 append할 div -->
		 	<div style="width: 100%;">
		 		<ol class="list-group p-0" id="listSGC" style="width: 100%;"></ol>
			</div>
		</div>
		
	</div>
		
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>