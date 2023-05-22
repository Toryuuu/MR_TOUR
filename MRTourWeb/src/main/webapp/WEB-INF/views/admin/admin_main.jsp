<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset = "utf-8">
    <link rel="stylesheet" href="resources/css/admin_css/admin_main.css">
    <script src = "resources/js/login.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>MRT Admin</title>
</head>

<body>
    <div class="container right-panel-active">
        <!-- Sign Up -->
        <div class="container__form container--signup">
            <form action="#" class="form" id="form1">
                <button type="button" class="btn" onclick="location.href='main'">메인으로</button>
                <button type="button" class="btn" onclick="location.href='admin_mem'">회원관리</button>
                <button type="button" class="btn" onclick="location.href='productList'">상품관리</button>
            </form>
        </div>


        <!-- Overlay -->
        <div class="container__overlay">
            <div class="overlay">
                <div class="overlay__panel overlay--left">
                    <p style="font-size: 80px; color:#fff; text-shadow:0px 0px 50px #a1e4ff"><b>MIRAE<br>TOUR</b></p>
            </div>
        </div>
    </div>



    <script>
        const signUpBtn = document.getElementById("signUp");
        const fistForm = document.getElementById("form1");
        const container = document.querySelector(".container");


        signUpBtn.addEventListener("click", () => {
            container.classList.add("right-panel-active");
        });

        fistForm.addEventListener("submit", (e) => e.preventDefault());

    </script>
</body>

</html>