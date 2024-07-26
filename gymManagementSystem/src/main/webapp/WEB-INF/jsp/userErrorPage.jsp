<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete User</title>
<style>
  body {
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    font-family: Arial, sans-serif;
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
    background-color: rgba(255, 255, 255, 0.6);
    padding: 50px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    width: 50%;
    max-width: 600px;
    text-align: center;
  }
  .error-message {
    color: red;
    font-size: 24px;
    margin-bottom: 20px;
  }
  .return {
    padding: 10px 20px;
    margin: 20px 0;
    background-color: gray;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  .return:hover {
    background-color: darkgray;
  }
</style>
</head>
<body background="/images/BGimg.jpg">
<div class="blur-overlay"></div>
<div class="container">
  <h1 class="error-message">${message}</h1>
  <button type="button" class="return" onclick="window.history.back();">Return</button>
</div>
</body>
</html>