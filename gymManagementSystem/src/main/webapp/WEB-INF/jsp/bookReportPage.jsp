<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
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
        width: 40%;
        text-align: center;
    }
    h1.success {
        color: green;
        margin: 10px 0;
        font-size: 24px;
        font-weight: bold;
    }
    h1.info {
        color: black;
        margin: 10px 0;
        font-size: 18px;
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
<body background="/images/BGimg.jpg">
<div class="blur-overlay"></div>
<div class="container">
    <h1 class="success">Booking Successful!</h1>
    <br>
    <h1 class="info">Booking ID: ${gymbook.bookingId}</h1>
    <h1 class="info">Slot ID: ${gymbook.slotId}</h1>
    <h1 class="info">Item ID: ${gymbook.itemId}</h1>
    <h1 class="info">User ID: ${gymbook.username}</h1>
    <button onclick="window.location.href='/index'">Return</button>
</div>
</body>
</html>