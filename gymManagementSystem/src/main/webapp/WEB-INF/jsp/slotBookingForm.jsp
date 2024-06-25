<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="header.jsp" %> <!-- Include the header.jsp here -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slot Booking Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('/image/BGimg.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
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
        width: 100%;
        max-width: 600px;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.8);
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        position: relative; 
        z-index: 2; 
    }
    .form-container h1 {
        font-size: 2em;
        margin-bottom: 20px;
        color: #C21807; 
    }
    .form-container input[type="text"],
    .form-container input[type="email"],
    .form-container select {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
    }
    .form-container button {
        width: 100%;
        padding: 10px;
        background-color: #C21807;
        border: none;
        border-radius: 5px;
        color: #fff;
        font-size: 1em;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .form-container button:hover {
        background-color: #d43d23; 
    }
</style>
<script>
function view() {
    alert("Booking Done Successfully!!");
}
</script>
</head>
<body>
<c:url value="/booking" var="book"/>
<div class="blur-overlay"></div> <!-- Blur overlay div -->
<div class="container" id="container" align="center">
    <!--<div class="form-container img">
        <img src="https://static.vecteezy.com/system/resources/thumbnails/025/094/280/original/gym-exercise-equipment-2d-animation-video.jpg" width="1000" alt="">
    </div>-->
    <div class="form-container booking-container">
        <form:form id="booking_form" method="post" action="${book}">
            <h1>Slot Booking Form</h1>
            <input type="text" placeholder="Username" name="username" required/>
            <br/>
            <input type="email" placeholder="Email" name="email" required/>
            <br/>
            <select id="option" name="slotType">
                <option value="" disabled selected>Select Slot Type</option>
                <option value="Basic">Basic</option>
                <option value="Standard">Standard</option>
                <option value="Premium">Premium</option>
            </select>
            <br/>
            <select id="option" name="slotTime">
                <option value="" disabled selected>Select Slot Time</option>
                <option value="6-7am">06:00 AM To 07:00 AM</option>
                <option value="7-8am">07:00 AM To 08:00 AM</option>
                <option value="8-9am">08:00 AM To 09:00 AM</option>
                <option value="6-7pm">06:00 PM To 07:00 PM</option>
                <option value="7-8pm">07:00 PM To 08:00 PM</option>
                <option value="8-9pm">08:00 PM To 09:00 PM</option>
                <option value="9-10pm">09:00 PM To 10:00 PM</option>
            </select>
            <br/>
            <button type="submit" onClick="view();">Submit</button>
        </form:form>
    </div>
</div>
</body>
</html>