<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users List</title>
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
    <h1>All Users</h1>
    <table border="2">
        <tr>
            <th>User Name</th>
            <th>E-mail</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Type</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.type}</td>
            <td>
                <a href="/users/${user.username}" class="delete-button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"></path>
                        <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"></path>
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