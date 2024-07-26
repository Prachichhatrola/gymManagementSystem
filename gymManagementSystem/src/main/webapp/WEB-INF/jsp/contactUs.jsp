<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="header2.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<style>
    body {
            background-image: url('${pageContext.request.contextPath}/images/BGimg.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            font-family: 'Montserrat', sans-serif;
            height: 100vh;
            margin: -20px 0 50px;
            position: relative;
            overflow: hidden;
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
        }
    .contact-info {
        margin: 20px 0;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.8);
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        width: 100%;
        z-index: 2;
    }
    .contact-info h3 {
        margin-top: 0;
        color: #333;
    }
    .contact-info .info-item {
        margin: 15px 0;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .contact-info .info-item img {
        width: 24px;
        height: 24px;
        margin-right: 10px;
    }
    .contact-info .info-item p {
        margin: 0;
        color: #555;
    }
</style>
</head>
<body>
    <div class="blur-overlay"></div>
    <div class="container">
        <div class="contact-info">
            <h3>Contact Information</h3>
            <div class="info-item">
                <img src="${pageContext.request.contextPath}/images/address-icon.jpg" alt="Address Icon"/>
                <p>1234 Main St, City, Country</p>
            </div>
            <div class="info-item">
                <img src="${pageContext.request.contextPath}/images/email-icon.jpg" alt="Email Icon"/>
                <p>contact@example.com</p>
            </div>
            <div class="info-item">
                <img src="${pageContext.request.contextPath}/images/phone-icon.jpg" alt="Phone Icon"/>
                <p>(123) 456-7890</p>
            </div>
            <div class="info-item">
                <img src="${pageContext.request.contextPath}/images/instagram-icon.jpg" alt="Instagram Icon"/>
                <p>@example_instagram</p>
            </div>
        </div>
    </div>
</body>
</html>
