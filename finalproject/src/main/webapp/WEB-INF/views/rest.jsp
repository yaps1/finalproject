<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3fd7b3691ae98830f92497719a3fe238&libraries=services"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style type="text/css">
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	width:200px;
	background: white;
	border-bottom:solid 1px white;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	margin-right:5px;
	cursor: pointer;
	text-align: center;
}

ul.tabs li.current{
	border-bottom:solid 1px blue;
	background: white;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
	background: white;
}
	
</style>
</head>
<body style="height: 1500px;">
<jsp:include page="header2.jsp"></jsp:include>
<div style="display: block; margin-top: 80px;">
	<div style="width:90%;   margin: 0 auto;">
		<button class="btn btn-lg btn-primary" id="btn-close" style="float: right;">초기화</button>
	</div>
	<div id="map" style="width:90%; height:900px;margin: 0 auto; margin-top:100px; clear: both;"></div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">

</script>
<script type="text/javascript">
var overLayList = [];
$(document).ready(function(){
	 
	$("#btn-close").click(function(){
		for(var i=0;i<overLayList.length;i++){
			overLayList[i].setMap(null);
		}
		//if(customOverlay != null){
		//customOverlay.setMap(null);
		//}
	})
	
	 $(document).on("click",'ul.tabs li',function(event){   
		 
			 var tab_id = $(this).attr('data-tab');
			 $('ul.tabs li').removeClass('current');
			
			
			$(this).addClass('current');
			$('.tab-content').addClass('current');
			
			var idx = $(this).attr("idx");
			console.log(idx);
			if(idx == "li1"){
				$("#tab-1").css("display","block");
				$("#tab-1").css("visibility","visible");
				$("#tab-2").css("display","none");
				$("#tab-2").css("visibility","hidden");
			}else{
				$("#tab-2").css("display","block");
				$("#tab-2").css("visibility","visible");
				$("#tab-1").css("display","none");
				$("#tab-1").css("visibility","hidden");
				//$("#tab-1").remove();
			}
		});
	 
})
	

	
	
	//별점 매기는 함수 큰별
	function getStar(score){  
		result = "";
		width = "0";     
		for(i=1; i<=5; i++){	 
			if(score >= i){  
				width = "100%";
			}else{
				width = "0";
			}
			result +=  '<div class="star-wrap" style="width:28px; display:inline-block;"><div class="star" style="width:'+width+'; overflow:hidden;"><i class="bi bi-star-fill fs-3" style="color:yellow;"></i></div></div>' ;
		 }
		return result;  
	}
	//별점 매기는 함수 작은별
	function getStarSmall(score){  
		result = "";
		width = "0";     
		for(i=1; i<=5; i++){	 
			if(score >= i){  
				width = "100%";
			}else{
				width = "0";
			}
			result +=  '<div class="star-wrap" style="width:16px; display:inline-block;"><div class="star" style="width:'+width+'; overflow:hidden;"><i class="bi bi-star-fill" style="color:yellow;"></i></div></div>' ;
		 }
		return result;  
	}
	
//HTML5의 geolocation으로 사용할 수 있는지 확인
if (navigator.geolocation) {
    // GeoLocation을 이용해서 접속 위치를 얻어옴
    navigator.geolocation.getCurrentPosition(function(position) {
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        var container = document.getElementById('map'); //지도를 표시할 div
        var options = { //지도를 생성할 때 필요한 기본 옵션
            	center: new kakao.maps.LatLng(lat, lon), //지도의 중심좌표.
            	level: 3 //지도의 레벨(확대, 축소 정도)
        };
        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
       
       	map.setZoomable(false);	//마우스 휠과 모바일 터치를 이용한 지도 확대, 축소 막음
       	var zoomControl = new kakao.maps.ZoomControl();	//지도에 확대 축소 컨트롤 생성
       	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	//지도의 우측에 확대 축소 컨트롤 추가
		
       	//맛집 리스트 ajax
       	$.ajax({
       		url:"getRestInfo",
       		type:"get",
       		success:function(data){
       			$.each(data,function(index,item){
					//console.log(item.rest_no);
					//console.log(item.rest_name);
					//console.log(item.rest_addr);
					//console.log(item);
       				var geocoder = new kakao.maps.services.Geocoder();	//주소-좌표 변환 객체를 생성
       				geocoder.addressSearch(item.rest_addr, function(result, status) {	// 주소로 좌표를 검색
					     				
      			     if (status === kakao.maps.services.Status.OK) { // 정상적으로 검색이 완료됐으면 
       			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
      			     	//마커 그림
       			   		var imageSrc = '../images/cutlery.png', // 마커이미지의 주소    
       			    	imageSize = new kakao.maps.Size(40, 40), // 마커이미지의 크기
       			    	imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정
       			      	//마커 이미지 그림
       			    	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	       			   	markerPosition = new kakao.maps.LatLng(coords); // 마커가 표시될 위치

       			        var marker = new kakao.maps.Marker({ // 결과값으로 받은 위치를 마커로 표시
       			            map: map,
       			            position: coords,
       			         	image: markerImage // 마커이미지 설정 
       			        });

       			        //var infowindow = new kakao.maps.InfoWindow({	// 인포윈도우로 장소에 대한 설명을 표시
       			        //    content: '<div style="width:150px;text-align:center;padding:6px 0;">'+item.rest_name+item.rest_tel+'</div>'});
       			   		 
       			        //커스텀 오버레이 생성 
       			        //컨테이너 생성
       			        var content = '<div class="container" style="width:700px;">';
       			  			//메뉴 탭 생성	
       			        	content	+= '<ul class="tabs">';
	      		 		    content += 	'<li idx="li1"   class="tab-link current" data-tab="tab-1">홈</li>';
       			     		content +=	'<li idx="li2"   class="tab-link" data-tab="tab-2">사진</li>';
       			     		content += '</ul>';
       			     		
       			        	//홈 탭 div 				
       			        	content +='<div class="tab-content current border rounded" id="tab-1" style="width:700px; height=800px; background-color:white; text-align:center;">';
       			        	//가게 정보 출력
       			        	content +=		  '	<div class="info mt-2">';
       			        	content +=		  '	  <div class="rest_name fw-bold fs-4">'+ item.rest_name +'</div>';
       			        	content +=		  '   <div class="rest_tel"><i class="bi bi-telephone-fill" style="padding:5px;"></i>'+ item.rest_tel +'</div>';
       			        	content +=		  '	  <div class="rest_addr"><i class="bi bi-geo-alt-fill" style="padding:5px;"></i>'+ item.rest_addr +'</div>';   
			        		//가게 별점 출력
       			        	content +=		  '	  <div class="rest_avg_score m-0" style="text-align:center;" data-rate="'+item.rest_avg_score+'" >';
       			        	content +=		  		getStar(item.rest_avg_score); 			      
       			        	content +=	      '   </div>';		        			      
       			        	//별점 출력 끝
       			        	
       			        	content +=		  '<div class="reivew">';	
       			        	//리뷰 제목, 버튼 
       			        	content +=		  '	<div class="reivew_title" style="display:inlin-block">';
       			        	content +=		  '  <div class="border-top">';
       			        	content +=		  '	   <p class="fs-5 text-bold mb-0 mx-3 text-left" style="text-align:left; float:left">리뷰</p>';
       			        	content +=		  '    <button class="btn-primary btn-sm" style="float:right">후기작성</button>';
       			        	content +=		  '  </div>';
       			        	content +=		  ' </div>';
       			        	//리뷰란 전체 div
       			        	content +=		  '<div class="review_info border-top" style="display:block; clear:both;">';
       			        			  //리뷰 출력 ajax
			        			      $.ajax({
			        			    	  url:"listRestReview",
			        			    	  type:"get",
			        			    	  data:{rest_no:item.rest_no},
			        			    	  dataType:"json",
			        			    	  success:function(data){
			        			    		 // console.log(data);
			        			    		  if(data != null && data.length > 0){
			        			    			 $.each(data,function(){
			        			    				 let member_nickname = this.member_nickname;
			        			    				 let rest_score = this.rest_score;
			        			    				 let rest_review_content = this.rest_review_content;
			        			    				// console.log(member_nickname);
			        			    				// console.log(rest_score);
			        			    				// console.log(rest_review_content);
			        			    				 
			        			    				 content += "<div class='review_box border-bottom mx-3'>"
			        			    				 content += " <span style='line-height:21px; text-align:left;float:left;margin-right:5px;'>"+member_nickname+"</span>";
			        			    				 content += " <span style='height:21px; text-align:left; float:left;'>"+getStarSmall(rest_score)+"</span>";
			        			    				 content += " <div class='review_content' style='display:block; clear:both; text-align:left;'>";
			        			    				 content += " 	<p class='mb-1'>"+rest_review_content+"</p>";
			        			    				 content += " </div>";  
			        			    				 content += "</div>";  
			        			    			 });
			        			    		  }
       			        			  			
					        			      content += '	</div>' //review_info 끝
					        			      content += '	</div>'	//review 끝		        			    		 
			        			    	  }//listRestReview success함수 끝
			        			      })//listRestReview 함수 끝      
			        			    
			        			      content +=  ' </div>'; //info 정보 
			        			      content +=  ' </div>'; //tab1 끝
			        			      
			        				 //사진탭 메뉴 	      
			        			      content += '<div id="tab-2" class="tab-content"><p>★ tab2입니다</p></div>'; //tab2끝
			        			      content +=  '</div>'; //container 끝
       			        
       			     				
       			   
       			     //ajax속도와 커스텀 오버레이 생성 속도가 달라서 setTimeout을 줌
       			     setTimeout(function(){
       			    	 //커스텀 오버레이 생성
	   	       			    var customOverlay = new kakao.maps.CustomOverlay({
				   	       			    position: marker.getPosition(),
				   	       			    content: content,
				   	       			   	map:map
				   	       			  });
			   					 	
       			    	// overLayList.push(customOverlay);
          			     customOverlay.setMap(null);
          			     
          			     kakao.maps.event.addListener(marker,'click',function(){
          			  		 // 커스텀 오버레이를 지도에 표시
          			  		 customOverlay.setMap(map);
          			  		overLayList.push(customOverlay);
          			     });
          			     
          			     kakao.maps.event.addListener(map,'click',function(){
          			  		 // 커스텀 오버레이를 지도에서 지움
          			  		 //alert("맵을 눌렀습니다.");
          			    	//customOverlay.setMap(null);
          			  		 
          			     });
          			     
          			   
          			  
       			     },1000);
       			     
       			
       			     
       			     
       			      //  map.setCenter(lat,lon); // 지도의 중심을 결과값으로 받은 위치로 이동
       			    } //geocoder.addressSearch if문 끝
       			}); //geocoder.addressSearch함수 끝
       				
       			});//ajax each함수 끝
       			
       			
       		}//ajax success함수 끝 	
       		
       	})//ajax 함수 끝
       	
    
       	
      	//var locPosition = new kakao.maps.LatLng(lat, lon) //마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
    
       //map.setCenter(locPosition); //지도 중심좌표를 접속위치로 변경
       // displayMarker(locPosition, message);	//마커와 인포윈도우를 표시 //아직 함수 없음
      

       
    });
    
   
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 
    var locPosition = new kakao.maps.LatLng(37.556547, 126.917360) //쌍용교육센터 기준
    alert('현재 위치를 찾을 수 없습니다!');
}
 
 
 
 
 



    
</script>
</body>
</html>