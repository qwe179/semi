<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
//AJAX 객체인 XHR을 생성하는 함수
//크로스 브라우징 처리
function createXMLHttpRequest() {
	//XHR 객체 변수
	var xmlReq = null;
	if(window.XMLHttpRequest){ //XMLHttpRequest 내장객체가 존재할 때
		//IE 7.0 이상
		//IE 브라우저가 아닐 때 (크롬, 사파리, 오페라 등등)
	
		xmlReq = new XMLHttpRequest();
		
	} else if(window.ActiveXObject) { //ActiveXObject 내장객체가 존재할 때     //크로스브라우징
		//IE 계열 부라우저
		
		try{
			//비교적 최근 버전의 IE
			xmlReq= new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e1){
			try{
				//비교적 예전 버전의 IE
				xmlReq= new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e2){
				//XHR 내장객체가 아예 없는 경우
				console.log("AJAX 객체 생성 실패");
	
			}	
		}
		
		
	}
	return xmlReq; //XHR 객체 반환
}
</script>
<script type="text/javascript">
//AJAX 객체 변수
var xmlHttp= null;

function send(){
	console.log("send called")
	
	//XHR 객체 생성
	xmlHttp = createXMLHttpRequest();
	console.log(xmlHttp)
	
	//입력 데이터 구하기
	var n1 = num1.value;
	var n2 = num2.value;
	var op = oper.value;
	
	console.log(n1 + "," + n2 + ",")
	
	//------AJAX 요청 전 설정 ----
	
	//요청 URL
	var query = "num1=" +n1 + "&num2=" + n2+"&oper=" +op; //쿼리스트링 생성
	var url = "/views/ajax_02_ok.jsp" + "?" + query; //전송 URL 작성
	
	console.log(url);
	
	//요청 Method
	var method = "GET";
	
	//서버로부터 전달된 응답 데이터를 처리하는 콜백함수 지정
	xmlHttp.onreadystatechange=callback;
	
	
	//-------AJAX 요청 준비--------------------
	//XHR 객체가 서버로 통신할 준비를 한다
	// 서버로 접속함(통신 스트림 개설)
	xmlHttp.open(method,url);
	//-------------------------------
	
	//AJAX 요청 보내기 ----
	//XHR 객체가 서버로 요청메시지를 전송한다
	// 서버로 요청파라미터를 전송함
	xmlHttp.send(null);
	//---------------------------------

}

//응답 완료 시 데이터를 처리할 콜백함수
function callback(){
   console.log("callback called");
   
   //readyState 4, DONE, 응답 완료
   if(xmlHttp.readyState == 4){
      console.log("응답 받기 완료")
      if(xmlHttp.status == 200){//정상적인 응답 완료
         
         console.log(xmlHttp.responseText);
         //결과 표시하는 DIV의 내용으로 반영하기
         resultLayout.innerHTML = xmlHttp.responseText;
         
      }
   }
   
}


</script>
<body>

<h1>계산기_02</h1>
<h3>AJAX HTTP 통신(비동기식)</h3>
<hr>

<input type="text" id="num1" />
<select id="oper">
	<option value="add">더하기</option>
	<option value="sub">뻭;</option>
	<option value="mul">곱하기</option>
	<option value="div">나누기</option>
</select>
<input type="text" id="num2"/>

<button onclick="send();"> =</button>

<hr>

<!--  AJAX요청의 결과를 추가할 결과 DIV -->
<div id="resultLayout"></div>

</body>
</html>