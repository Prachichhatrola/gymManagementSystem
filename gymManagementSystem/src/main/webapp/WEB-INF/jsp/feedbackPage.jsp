<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="header2.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback</title>
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
        background-color: rgba(255, 255, 255, 0.8);
        margin-top: 70px;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        width: 80%;
        max-width: 500px;
        text-align: center;
    }
    h2 {
        margin: 10px 0;
        color: #333;
    }
    button {
        padding: 10px 20px;
        margin: 20px 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    button.submit {
        background-color: #C21807;
        color: white;
    }
    button.submit:hover {
        background-color: #d43d23;
    }
    button.return {
        background-color: grey;
        color: white;
    }
    button.return:hover {
        background-color: #5a5a5a;
    }
    .alert-success {
        display: none;
        position: fixed;
        top: 20px;
        left: 50%;
        transform: translateX(-50%);
        background-color: #4CAF50;
        color: white;
        padding: 15px;
        border-radius: 5px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        z-index: 1000;
        font-size: 1.2em;
        text-align: center;
        opacity: 0;
        transition: opacity 0.5s ease-in-out;
    }
    .alert-success.show {
        display: block;
        opacity: 1;
    }
    form label {
        display: block;
        margin-top: 15px;
        font-weight: bold;
    }
</style>
<script>
function showAlert() {
    var alertBox = document.getElementById('success-alert');
    alertBox.classList.add('show');
    setTimeout(function() {
        alertBox.classList.remove('show');
    }, 20000);
}
</script>
</head>
<body background="/images/BGimg.jpg">
<c:url value="/feedback" var="submit"/>
<div class="blur-overlay"></div>
<div class="container">
    <h2>Feedback</h2>
    <form:form id="feedback_form" method="post" action="${submit}" modelAttribute="feedbackRecord">
        <label for="userName">Enter Name:</label>
        <form:input path="userName" id="userName"/>
        <label for="content">Enter Feedback:</label>
        <form:textarea rows="5" cols="50" path="content" id="content"/>
        <div>
            <button type="submit" class="submit" onClick="showAlert();">Submit</button>
            <button type="button" class="return" onclick="window.history.back();">Return</button>
        </div>
    </form:form>
</div>
<div id="success-alert" class="alert-success">Feedback submitted Successfully!</div> 
</body>
</html>
