<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="header1.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booked Slot List</title>
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
        background-color: rgba(255, 255, 255, 0.8);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        width: 50%;
        text-align: center;
        margin-top: 80px;
    }
    .table-container {
        display: flex;
        justify-content: center;
        overflow-y: auto;
        max-height: 400px;
    }
    h1 {
        color: #C21807;
        margin-bottom: 8px;
    }
    table {
        margin: 10px auto;
        border-collapse: collapse;
        width: 100%;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 5px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #C21807;
        color: white;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    a.return-button {
        display: inline-block;
        padding: 5px 10px;
        margin: 5px 0;
        background-color: #C21807;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }
    a.return-button:hover {
        background-color: #d43d23;
    }
</style>
</head>
<body>
<div class="blur-overlay"></div>
<div class="container">
    <h1>All Slots</h1>
    <div class="table-container">
    <table border="2">
        <tr>
            <th>Slot Id</th>
            <th>Item Id</th>
            <th>Seat Booked</th> 
        </tr>
        <c:forEach items="${slot_item}" var="slot">
            <tr>
                <td>${slot.embeddedId.slotId}</td>
                <td>${slot.embeddedId.itemId}</td>
                <td>${slot.seatBooked}</td>
            </tr>
        </c:forEach>
    </table>
    </div>
    <a href="/index" class="return-button">Return</a>
</div>
</body>
</html>