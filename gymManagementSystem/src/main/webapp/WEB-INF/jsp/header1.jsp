<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>GYM Info Club</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            overflow: hidden;
        }
        .navbar {
            background-color: #C21807;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            box-shadow: 2px 1px 2px #eee;
            position: fixed;
            top: 0;
            width: 100%;
            height: 70px;
            z-index: 1000;
            border-radius: 0;
        }
        .navbar img {
            max-height: 60px; 
            max-width: 120px; 
            object-fit: contain;
            margin-left: 50px;
            margin-right: 50px;
        }
        .navbar div {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .navbar-item {
            padding: 10px 10px;
            color: white;
            cursor: pointer;
            position: relative;
            text-decoration: none;
        }
        .navbar-item.has-subnav::after {
            content: '\25BC';
            margin-left: 5px;
            font-size: 12px;
        }
        .navbar-item .subnav {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #C21807;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            min-width: 160px;
        }
        .navbar-item:hover .subnav {
            display: block;
        }
        .subnav-item {
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            display: block;
            white-space: nowrap;
        }
        .subnav-item:hover {
            background-color: #fff;
            color: #C21807;
        }
        .logout-button {
            background-color: #ffffff;
            color: #C21807;
            border: 2px solid #C21807;
            padding: 12px 20px;
            font-size: 0.9em;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease;
            margin-left: 20px;
            margin-right: 50px;
        }
        .logout-button:hover {
            background-color: #C21807;
            color: #ffffff;
        }
    </style>
</head>
<body>
<div class="navbar">
    <img src="/images/logo.jpg" alt="Gym Logo">
        <div>
        <div class="navbar-item">
            <a href="/index" class="navbar-item">Home</a>
        </div>
        <div class="navbar-item has-subnav">
            Item
            <div class="subnav">
                <a href="/gymitem" class="subnav-item">Add Item</a>
                <a href="/gymitems" class="subnav-item">Manage Items</a>
            </div>
        </div>
        <div class="navbar-item has-subnav">
            Slot
            <div class="subnav">
                <a href="/slot" class="subnav-item">Add Slot</a>
                <a href="/slots" class="subnav-item">Manage Slots</a>
                <a href="/booked"class="subnav-item">View Booking</a>
            </div>
        </div>
        <button class="logout-button" onclick="window.location.href='/logout'">Log Out</button>
    </div>
</div>
</body>
</html>