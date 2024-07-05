<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header2.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>About Us - GYM Info Club</title>
<style>
  body, html {
    height: 100%;
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f8f8f8; 
  }
  .content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: calc(100vh - 60px);  
    padding: 80px 20px 20px; 
    box-sizing: border-box;
  }
  .text-content {
    max-width: 50%;
    color: #333;
    text-align: left;
    padding: 20px;
    margin-top:40px; 
  }
  .text-content h1 {
    font-size: 3em;
    font-weight: bold;
    margin: 0;
    line-height: 1.2;
    color: black;
    font-family: 'Arial Black', Gadget, sans-serif; 
  }
  .text-content h2 {
    font-size: 2.5em;
    font-weight: bold;
    margin: 10px 0;
    line-height: 1.2;
    color: #FFD700; 
  }
  .text-content p {
    font-size: 1em;
    margin: 10px 0;
    line-height: 1.5;
  }
  .text-content .bold {
    font-weight: bold;
  }
  .text-content .small {
    font-size: 0.95em; 
  }
  .text-content .small p {
    margin: 5px 0;
  }
  .image-content {
    max-width: 50%;
    text-align: center; 
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .image-content img {
    width: 100%; 
    height: auto; 
    max-height: 80vh;
    display: block;  
    margin-top: 70px; 
    margin-left:50px;
  }
  .read-more-button {
    background-color: #C21807;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 1em;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-decoration: none;
    display: inline-block;
    margin-top: 20px; 
  }
  .read-more-button:hover {
    background-color: #971C07; 
  }
  @media (max-width: 768px) {
    .content {
      flex-direction: column-reverse; 
      padding: 10px;
    }
    .text-content, .image-content {
      max-width: 100%;
    }
  }
</style>
</head>
<body>
<div class="content">
  <div class="image-content">
    <img src="/images/about.jpg" alt="Gym Image">
  </div>
  <div class="text-content">
    <h1>A Truly Epic Gym</h1>
    <h2>Open 24/7!</h2>
    <p>To know more about our weight training classes, you can contact us on our number too long for now</p>
    <div class="small">
      <p><span class="bold">Gym and Halls:</span> Will feel like they belong and can relax</p>
      <p><span class="bold">Courts:</span> This gym belongs to our clients</p>
      <p><span class="bold">Swimmingpool:</span> We love to keep it that way for many years to come</p>
      <p><span class="bold">Sauna:</span> All you need to do is contact us</p>
    </div>
    <a href="#" class="read-more-button">Read More</a>
  </div>
</div>
</body>
</html>