<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Details</title>
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
    .container {
        position: relative;
        z-index: 2;
        background-color: rgba(255, 255, 255, 0.9);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        width: 50%;
        text-align: center;
    }
    h1 {
        color: black;
        margin: 10px 0;
        font-weight: bold;
    }
    .info {
        color: red;
        font-weight: normal;
    }
    button {
        padding: 10px 20px;
        margin: 20px 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        font-size: 16px;
        background-color: grey;
        color: white;
    }
    button:hover {
        background-color: #5a5a5a;
    }
</style>
</head>
<body>
<div class="blur-overlay"></div>
<div class="container">
    <h1>Booking ID: <span class="info">${gymbook.bookingId}</span></h1>
    <h1>Slot ID: <span class="info">${gymbook.slotId}</span></h1>
    <h1>Item ID: <span class="info">${gymbook.itemId}</span></h1>
    <h1>User ID: <span class="info">${gymbook.username}</span></h1>
    <button onclick="window.location.href='/index'">Return</button>
</div>
</body>
</html>