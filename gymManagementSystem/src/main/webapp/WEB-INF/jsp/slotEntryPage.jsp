<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="header1.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gym Slot Entry</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('/images/BGimg.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        position: relative; 
    }
    .blur-overlay {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: inherit;
        filter: blur(8px);
        z-index: 1; 
    }
    .form-container {
    position: relative;
    z-index: 2;
    background-color: rgba(255, 255, 255, 0.8);
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    width: 400px;
    text-align: center;
    margin-top: 80px; 
	}
    h3 {
        color: #C21807; 
        margin-bottom: 20px;
    }
    label {
        display: block;
        margin-bottom: 8px;
        color: #333;
    }
    input {
        width: calc(100% - 22px);
        padding: 12px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }
    button {
        background-color: #C21807; 
        color: white;
        border: none;
        padding: 12px 24px;
        border-radius: 5px;
        cursor: pointer;
        margin: 5px;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }
    button:hover {
        background-color: #d43d23; 
    }
    button[type="reset"] {
        background-color: #ccc;
    }
    button[type="reset"]:hover {
        background-color: #999;
    }
    .return-button {
        background-color: #C21807;  
        color: white;
        border: none;
        padding: 12px 24px;
        border-radius: 5px;
        cursor: pointer;
        margin: 5px;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }
    .return-button:hover {
        background-color: #d43d23; 
    }
</style>
</head>
<body>
<div class="blur-overlay"></div>
<div class="form-container">
    <h3>Enter Gym Slot Details</h3>
    <form:form action="/slot" method="post" modelAttribute="slotRecord">
        <form:hidden path="slotId"/>
        <label for="slotTime">Enter Slot Time:</label>
        <form:input path="slotTime" id="slotTime"/>
        <br/>
        <label for="pricing">Enter Slot Price:</label>
        <form:input path="pricing" id="pricing"/>
        <br/>
        <button type="submit">Submit</button>
        <button type="reset">Reset</button>
        <button type="button" class="return-button" onclick="window.location.href='/index'">Return</button>
    </form:form>
</div>
</body>
</html>