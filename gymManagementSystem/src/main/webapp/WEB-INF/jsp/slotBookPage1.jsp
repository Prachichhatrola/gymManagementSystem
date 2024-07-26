<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="header1.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Slot</title>
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
        margin-top: 70px;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        width: 50%;
        text-align: center;
    }
    h1, h2, h3 {
        margin: 10px 0;
    }
    h1 {
        color: #C21807;
    }
    h2 {
        color: #333;
    }
    h3 {
        color: #666;
    }
    .table-container {
        display: flex;
        justify-content: center;
    }
    table {
        border-collapse: collapse;
        width: 100%;
        background-color: #fff;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        margin: 20px 0;
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
    button {
        padding: 10px 20px;
        margin: 20px 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    button.book {
        background-color: #C21807;
        color: white;
    }
    button.book:hover {
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
    .error-message {
            color: red;
            font-size: 14px;
            margin-top: 20px;
        }
</style>
<!-- <script>
function showAlert() {
    var alertBox = document.getElementById('success-alert');
    alertBox.classList.add('show');
    setTimeout(function() {
        alertBox.classList.remove('show');
    }, 10000);
}
</script> -->
</head>
<body>
<c:url value="/slot-book" var="book"/>
<div class="blur-overlay"></div>
<div class="container">
    <h3>Slot ID: ${slot.slotId}</h3>
    <h2>Slot Time: ${slot.slotTime}</h2>
    <h1>Price: ${slot.pricing}</h1>
    <form:form id="booking_form" method="post" action="${book}">
        <input type="hidden" value="${slot.slotId}" name="slotId"/>
        Select User Id:<input list="users" name="userId"/>
        <datalist id="users">
          <c:forEach items="${userList}" var="usr">
          <option value=${usr}>
          </option>
          </c:forEach>
        </datalist> 
        <div class="table-container">
            <table border="1" cellspacing="3" cellpadding="3">
                <tr>
                    <th>Item No</th>
                    <th>Item Name</th>

<th>Total Seat</th>
                    <th>Available Seat</th>
                    <th>Select</th>
                </tr>
                <c:forEach items="${itemList}" var="item">
                    <tr>
                        <td>${item.itemId}</td>
                        <td>${item.itemName}</td>
                        <td>${item.totalSeat}</td>
                        <td>${item.seatVacant }</td>
                        <td><input name="selectItem" type="radio" value="${item.itemId}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <button type="submit" class="book" onClick="showAlert();">Book</button>
        <button type="button" class="return" onclick="window.history.back();">Return</button>
    </form:form>
</div>
<!-- <div id="success-alert" class="alert-success">Booking Done Successfully!</div> -->
</body>
</html>
