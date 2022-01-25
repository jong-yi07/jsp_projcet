<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../css/common.css" />
<style>
.div1{
  width: 100%;
  height: 800px;
  background: #cd000f;
}
.section{
  position: relative;
  padding-bottom: 220px;
}
.txt{
  padding-top: 80px;
  text-align: center;
  width: 410px;
  letter-spacing: 0.5rem;
}

.txt1,.txt2{
  font-size: 4rem;
  font-weight: 500;
  color: #A37356;
}

.txt1{
  display: inline-block;
  text-transform: uppercase;
}

.txt2{
  display: inline-block;
  width: 160px;
  border-bottom: 2px solid #A37356;
  margin-right: 17px;
  margin-left: 17px;
}

.txt3,.txt4{
  font-size: 150px;
  font-weight: 700;
  line-height: 9rem;
  color: #E27762;
}

ul{
  list-style: none;
}

.menu .span1{
  position: absolute;
  animation: bounce 600ms ease-in-out infinite alternate;
}

.menu1{
  bottom: 180px; 
  right: 320px;
  width: 470px;
}

.menu .menu2{
  top: 330px;
  left: 530px; 
  width: 300px;
  animation-delay: 0.2s;
}

.menu3{
  width: 200px;
  top: 320px;
  right: 200px; 
}

@keyframes bounce{
  0%{
    transform: translateY(0);
  }
  100%{
    transform: translateY(5px);
  }
}

.menu img{
  width: 283px;
}

.menu .span2{
  font-size: 20px;
  font-weight: 500;
  text-align: center;
  color: white;
  padding: 10px;
}

.menu .span3{
  display: block;
  text-align: center;
  color:white;
  font-size: 15px;
  font-weight: 700;  
}

.detail{
  border: 1px solid #A37356;
  background-color: #cd000f;
  width: 150px;
  position: absolute;
  left: 500px;
  text-align: center;
}

.details{
  bottom: 145px;
  left:140px;
  color:#A37356;
  text-decoration: none;
}

.details:hover, .details:focus{
  background-color: #E27762;
  color:#FFFCF9;
  border-color: #E27762;
}

.detail:hover, .detail:focus{
  background-color: #E27762;
}

@media ( max-width: 1024px ){
	#div1{
	height:2000px;
	}
	.menu1 img{
	left:20%;
	}
	.menu2 img{
	left:20%;
	bottom: 700px;
	}
	.menu3 img{
	left:20%;
	bottom: 100px;
	}
}

/* section2 */
.div2{
  width:100%;
  height: 800px;
  background:pink; 
}
.section2{
  position: absolute;
  top: 1100px;
  left:100px;
  width:40%;
  text-align: center;
}
.text6{
  color: white;
  font-size: 100px;
  margin:0px;
  animation-duration: 3s;
  animation-name: slidein1; 
}

.text7{
  color: white;
  font-size: 20px;
 animation-duration: 3s;
  animation-name: slidein1; 
}

@keyframes slidein1{
  from{
  margin-right:100%;
  }
  to{
  margin-right:0%;
  }
}

.img{
  position: absolute;
  top: 1150px;
  left:900px;
  animation-duration: 3s;
  animation-name: slidein2;
}

@keyframes slidein2{
  from{
  margin-left:100%;
  }
  to{
  margin-left:0%;
  }
}

.detail2{
  border: 1px solid white;
  background-color: pink;
  width: 150px;
  position: absolute;
  top:1700px;
  left: 500px;
  text-align: center;
}

.details2{
  bottom: 145px;
  left:140px;
  color:white;
  text-decoration: none;
}

.details2:hover, .details2:focus{
  background-color: white;
  color:pink;
  border-color: white;
}

.detail2:hover, .detail2:focus{
  background-color: white;
}

/* 공지사항 */
.div3{
  position:fixed;
  bottom:50px;
  left:35%;
  width:600px;
  height:60px;
  z-index:100;
  border-radius:25px;
  background-color: rgba(74, 211, 188, 0.53);
  text-align:center;
  color:white;
}
.div3 h2, .notice p{
  display:inline;
  margin: 15px;
  color:white;
}
.notice{
	display:inline;
}
#close{
	float:right;
	margin:15px;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<!-- section -->
<div class="div1">
        <section class="section1">
          <p class="txt">
            <span class="txt1">WISH YOU</span>
            <span class="txt2">A</span>
            <span class="txt3">MERRY</span>
            <span class="txt4">CHRISTMAS</span>
          </p>
          <ul>
           <li class="menu">
           <a href="#">
            <span class="menu1 span1" style="text-align: center;">
             <img src="../images/snow_mint_blended.PNG" alt="스노무 민트 초콜릿 블랜디드">
           	 <span class="menu_detail1 span2" >
           	  <span aria-hidden="true" class="span3">Snow Mint Chocolate Blended</span>
           	  스노우 민트 초콜릿 블렌디드
           	 </span>
            </span>
            </a>
            </li>          
           <li class="menu">
            <a href="#">
             <span class="menu2 span1" style="text-align: center;">
              <img src="../images/cookie_latte.PNG" alt="홀리데이 돌체 쿠키 라떼">
              <span class="menu_detail2 span2">
               <span aria-hidden="true" class="span3">
                Holiday Dolce Cookie Latte
               </span>
               홀리데이 돌체 쿠키 라떼
              </span>
             </span>
            </a>
           </li>
           <li class="menu">
            <a href="#">
             <span class="menu3 span1" style="text-align: center;">
              <img src="../images/chamomile_relaxer.PNG" alt="핑크 캐모마일 릴렉서">
              <span class="menu_detail3 span2">
               <span aria-hidden="true" class="span3">
                Pink Chamomile Relaxer
               </span>
                캐모마일 릴렉서
              </span>
             </span>
            </a>
           </li>
          </ul>
          <div class="detail"><a href="#" class="details" title="시즌음료" >자세히보기</a></div>
  		</section>
</div>

<div class="div2">
	<section class="section2">
		  <p class="text6">PICK</p>
		  <p class="text6">YOUR</p>
		  <p class="text6">FAVORITE</p>
		  <p class="text7">다양한 메뉴를 script cafe에서 만나보세요</p>
		  <p class="text7">특별함을 경험할 수 있는 최상의 선택음료</p>
	</section>
	<section class="img">
	 <img src="../images/drink.jpg" style="width:400px">
	</section>
	<div class="detail2"><a href="#" class="details2" title="시즌음료" >자세히보기</a></div>
</div>

<!-- 공지사항 -->
<div class="div3">
 <h2>공지사항</h2>
 <div class="notice">
	<p>카페 영업시간 조정안내</p>
	<p>2021.12.25</p>
 </div>
 <button type="button" id="close" onclick="this.parentElement.style.display='none'" style="width:5x;">
  <img src="../images/button.png" style="width:5px;"></button>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>