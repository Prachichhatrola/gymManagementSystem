<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Error</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
  }
  .container {
    text-align: center;
    margin-top: 100px;
  }
  .error-message {
    color: red;
    font-size: 24px;
    margin-bottom: 20px;
  }
</style>
</head>
<body>
  <div class="container">
    <h1 class="error-message">Wrong credentials... Please re-enter.</h1>
</div>
<jsp:include page="loginPage.jsp" flush="true"/>
</body>
</html>