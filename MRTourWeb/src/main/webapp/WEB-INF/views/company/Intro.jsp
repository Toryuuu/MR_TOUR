<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/Intro.css">
<title>미래투어</title>
</head>
<body>
    <div class="mlogo"><a href = "main" id = "logo"><img src = "resources/images/mr_logo.png" height = "81px" width = "120px" id = "logo"></a></div>

    <div class="tabs">
        <input id="all" type="radio" name="tab_item" checked>
        <label class="tab_item" for="all">인사말</label>
        <input id="programming" type="radio" name="tab_item">
        <label class="tab_item" for="programming">연혁</label>
        <div class="tab_content" id="all_content">
            <div id="wel_cont">
                <div id = "mainTxt">같이 여행갈래요?</div>
             
                <div id = "subTxt">
                   <p>더 나은 미래를 위한 여정에 함께하는 미래투어</p>
                   <p>미래투어를 통해 여행의 꿈을 시작하고 , 설레는 여행의 꿈을 현실로 이어주어
                      여행의 시작부터 끝까지 모든 것을 함께 할 수 있도록
                      일상 속 꿈꾸는 모든 여정 속에 미래투어가 함께 하겠습니다.</p>
                </div>
                <div>
                <img src = "resources/images/Intro.jpg" >
                </div>
             </div>
             
        </div>
        <div class="tab_content" id="programming_content">
            <div id="wel_cont">
                <div id = "mainTxt">미래투어가 걸어온 길</div>
             
                <div id = "subTxt">
                   <div id = "set">
                      <div id = "year">
                         2023.4.
                      </div>
                      <div id = "activity">
                         소비자 만족도 1위기업 선정
                      </div>
                   </div>
                   
                   <div id = "set">
                      <div id = "year">
                         2023.3.
                      </div>
                      <div id = "activity">
                         홈페이지 개편
                      </div>
                   </div>
                   
                   <div id = "set">
                      <div id = "year">
                         2023.2.
                      </div>
                      <div id = "activity">
                         미래투어 뉴욕사무소 OPEN
                      </div>
                   </div>
                   
                   <div id = "set">
                      <div id = "year">
                         2022.12.
                      </div>
                      <div id = "activity">
                         올해의 여행상품 선정
                      </div>
                   </div>
                   
                   <div id = "set">
                      <div id = "year">
                         2022.10.
                      </div>
                      <div id = "activity">
                         컨퍼런스 참석
                      </div>
                   </div>
                   
                   <div id = "set">
                      <div id = "year">
                         2022.5.
                      </div>
                      <div id = "activity">
                         미래투어 사업시작
                      </div>
                   </div>
                </div>
             </div>
             
    </div>
        
</body>
</html>