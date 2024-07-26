<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booked Slots</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('${pageContext.request.contextPath}/images/BGimg.jpg');
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
        overflow-y: auto;
        max-height: 400px;
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
    button.cancel {
        background-color: #f1f1f1;
        padding: 5px 20px;
        margin: 2px 10px;
    }
    button.cancel:hover {
        background-color: #f1f1f1;
    }
    button.return {
        background-color: grey;
        color: white;
    }
    button.return:hover {
        background-color: #5a5a5a;
    }
    /* Modal styles */
    .modal {
        display: none;
        position: fixed;
        z-index: 3;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4);
    }
    .modal-content {
        background-color: white;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 400px;
        border-radius: 10px;
        text-align: center;
    }
    .modal-buttons {
        margin-top: 20px;
    }
    .modal-button {
        padding: 10px 20px;
        margin: 0 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .modal-button.yes {
        background-color: #C21807;
        color: white;
    }
    .modal-button.no {
        background-color: grey;
        color: white;
    }
</style>
<script>
    function showModal(slotId, itemId, bookingId) {
        const modal = document.getElementById('confirmationModal');
        const confirmButton = document.getElementById('confirmButton');
        modal.style.display = 'block';

        confirmButton.onclick = function() {
            window.location.href = '/cancel?slotId=' + slotId + '&itemId=' + itemId + '&selectBookingId=' + bookingId;
        }
    }

    function closeModal() {
        const modal = document.getElementById('confirmationModal');
        modal.style.display = 'none';
    }
</script>
</head>
<body>
<div class="blur-overlay"></div>
<div class="container">
    <div class="table-container">
        <table>
            <tr>
                <th>Booking Id</th>
                <th>Slot Id</th>
                <th>Item Id</th>
                <th>Cancel Booking</th>
            </tr>
            <c:forEach items="${bookList}" var="item">
                <tr>
                    <td>${item.bookingId}</td>
                    <td>${item.slotId}</td>
                    <td>${item.itemId}</td>
                    <td><button class="cancel" onclick="showModal('${item.slotId}', '${item.itemId}', '${item.bookingId}')">Cancel</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <button class="return" onclick="window.location.href='/index'">Return</button>
</div>

<!-- The Modal -->
<div id="confirmationModal" class="modal">
    <div class="modal-content">
        <h2>Cancel Booking</h2>
        <p>Are you sure you want to cancel this booking?</p>
        <div class="modal-buttons">
            <button id="confirmButton" class="modal-button yes">Yes</button>
            <button onclick="closeModal()" class="modal-button no">No</button>
        </div>
    </div>
</div>
</body>
</html>