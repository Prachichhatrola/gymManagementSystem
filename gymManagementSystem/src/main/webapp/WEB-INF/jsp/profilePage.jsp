
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Profile</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        position: relative;
        overflow: hidden;
    }
    .background {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url('${pageContext.request.contextPath}/images/BGimg.jpg') center center / cover no-repeat;
        filter: blur(8px);
        z-index: 1;
    }
    .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(255, 255, 255, 0.6);
        z-index: -1;
    }
    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        width: 300px;
        text-align: left;
        z-index: 1;
    }
    .profile-header {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }
    .profile-pic {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background-color: #ccc;
        margin-left: 20px;
        margin-right: 20px;
        padding: 22px;
        font-size: 40px;
        text-align: center;
        line-height: 1;
    }
    .profile-name {
        font-size: 18px;
        font-weight: bold;
        color: #333;
    }
    .profile-email {
        font-size: 14px;
        color: #777;
    }
    .profile-info {
        margin: 10px 0;
        font-size: 16px;
        color: #333;
    }
    .profile-info span {
        font-weight: bold;
        color: #C21807;
    }
    button {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        font-size: 16px;
        background-color: #C21807;
        color: white;
        width: 100%;
    }
    button:hover {
        background-color: #a31505;
    }
</style>
</head>
<body>
    <div class="background"></div>
    <div class="overlay"></div>
    <div class="container">
        <div class="profile-header">
            <div class="profile-pic">&#128100;</div>
            <div>
                <div class="profile-name">${user.username}</div>
                <div class="profile-email">${user.email}</div>
            </div>
        </div>
        <div class="profile-info">First Name: <span>${user.firstName}</span></div>
        <div class="profile-info">Last Name: <span>${user.lastName}</span></div>
        <div class="profile-info">Type: <span>${user.type}</span></div>
        <button onclick="window.location.href='/index'">Return</button>
    </div>
</body>
</html>