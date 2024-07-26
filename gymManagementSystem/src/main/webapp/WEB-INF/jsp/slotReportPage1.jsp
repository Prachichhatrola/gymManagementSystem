<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="header1.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slot List</title>
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
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        width: 50%;
        text-align: center;
        margin-top: 80px;
    }
    h1 {
        color: #C21807;
        margin-bottom: 20px;
    }
    table {
        margin: 20px auto;
        border-collapse: collapse;
        width: 100%;
        background-color: #fff;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 12px;
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
        padding: 10px 20px;
        margin: 20px 0;
        background-color: #C21807;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }
    a.return-button:hover {
        background-color: #d43d23;
    }
    .delete-button {
        display: inline-block;
        padding: 4px;
        cursor: pointer;
        text-decoration: none;
        color: #333;
    }
    .delete-button:hover {
        color: #dc3545;
    }
    .edit-button {
        display: inline-block;
        padding: 4px;
        cursor: pointer;
        text-decoration: none;
        color: #333;
    }
    .edit-button:hover {
        color: #dc3545;
    }
</style>
</head>
<body>
<div class="blur-overlay"></div>
<div class="container">
    <h1>All Slots</h1>
    <table border="2">
        <tr>
            <th>Slot Number</th>
            <th>Slot Time</th>
            <th>Slot Price</th>
            <th>Enquire</th>
            <th>Actions</th> 
        </tr>
        <c:forEach items="${slotList}" var="slot">
            <tr>
                <td>${slot.slotId}</td>
                <td>${slot.slotTime}</td>
                <td>${slot.pricing}</td>
                <td><a href="/slot-book/${slot.slotId}">Slot Enquire</a></td>
                <td>
                    <a href="/slot/edit/${slot.slotId}" class="edit-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
                            <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001m-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708z"/>
                        </svg>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br/><br/>
    <a href="/index" class="return-button">Return</a>
</div>
</body>
</html>