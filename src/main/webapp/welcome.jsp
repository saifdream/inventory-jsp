<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="Login/header_1.jsp" %>
<style>
#div1 {
    background: #ffffff;
}
</style>

<div class="container">
      <div id="div1" class="jumbotron" align="center">
        <h1>Inventory Management System</h1>
      </div>
    <!-- Full Page Image Background Carousel Header -->
    <div style="width:100%; hight:200%" id="myCarousel" class="carousel slide" align="center">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
            <li data-target="#myCarousel" data-slide-to="5"></li>
            <li data-target="#myCarousel" data-slide-to="6"></li>
        </ol>
        <!-- Wrapper for Slides -->
        <div class="carousel-inner">
        	<div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                <img src="img/img_3.jpg" alt="...">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <!-- Set the second background image using inline CSS below. -->
                <img src="img/img_4.jpg" alt="...">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <img src="img/img_02.jpg" alt="...">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <img src="img/img_5.jpg" alt="...">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <img src="img/img_6.jpg" alt="...">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <img src="img/img_8.jpg" alt="...">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <img src="img/img_9.jpg" alt="...">
                <div class="carousel-caption">
                </div>
            </div>
        </div>
    </div>
    <br><br>
      <div class="row" align="center">
        <div class="col-md-3">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
        <div class="col-md-3"> 
          <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>
        <div class="col-md-3"> 
          <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
        </div>
        <div class="col-md-3"> 
          <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
        </div>
        </div>
</div>
<script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>