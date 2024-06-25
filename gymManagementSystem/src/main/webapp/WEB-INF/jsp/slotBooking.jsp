<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="header.jsp" %> <!-- Include the header.jsp here -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>GYM Info Club</title>
<style>
 
  .pricing-section {
    display: flex;
    justify-content: center;
    padding: 50px;
  }
  .pricing-card {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: 0 20px;
    padding: 20px;
    text-align: center;
    width: 250px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    margin-top : 80px;
  }
  .pricing-card h2 {
    color: #C21807;
    font-size: 1.5em;
    margin-bottom: 10px;
  }
  .pricing-card p {
    font-size: 1.2em;
    margin: 10px 0;
  }
  .pricing-card .price {
    font-size: 2em;
    margin: 20px 0;
    color: #C21807;
  }
  .pricing-card button {
    background-color: #C21807;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-top: auto;
  }
  .pricing-card button:hover {
    background-color: #d43d23;
  }
  #signup1 {
    margin-top: 45px;
  }
  #signup2 {
    margin-top: 8px;
  }
</style>
</head>
<body>

<div class="pricing-section">
  <div class="pricing-card">
    <h2>Basic Plan</h2>
    <p class="price">Rs600/month</p>
    <p>10 cardio classes</p>
    <p>10 swimming session</p>
    <p>10 yoga classes</p>
    <button id="signup1" onClick="window.location.href='/booking'">Book Slot</button>
  </div>
  <div class="pricing-card">
    <h2>Standard Plan</h2>
    <p class="price">Rs800/month</p>
    <p>20 cardio classes</p>
    <p>20 swimming session</p>
    <p>20 yoga classes</p>
    <button id="signup2" onClick="window.location.href='/booking'">Book Slot</button>
  </div>
  <div class="pricing-card">
    <h2>Premium Plan</h2>
    <p class="price">Rs900/month</p>
    <p>30 cardio classes</p>
    <p>30 swimming sessions</p>
    <p>30 yoga classes</p>
    <button onClick="window.location.href='/booking'">Book Slot</button>
  </div>
</div>
</body>
</html>