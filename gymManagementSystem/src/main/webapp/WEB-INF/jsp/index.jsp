<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>GYM Info Club</title>
<style>
  body, html {
    height: 100%;
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f8f8f8;
  }
  .content {
  	margin:50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: calc(100vh - 60px);  
    padding: 20px;
    box-sizing: border-box;
  }
  .content img {
    max-height: 80%;
    max-width: 40%;
  }
  .text-content {
    max-width: 50%;
    color: #333;
    text-align: left;
  }
  .text-content h1 {
    font-size: 3em;
    font-weight: bold;
    margin: 0;
    line-height: 1.2;
  }
  .text-content .red {
    color: #C21807;
  }
  .text-content .yellow {
    color: #FFD700;
  }
  .text-content p {
    font-size: 1em;
    margin: 20px 0;
    line-height: 1.5;
  }
  .btn-container {
    display: flex;
    align-items: center;
    margin: 40px 0; 
  }
  .btn-get-started {
    background-color: #C21807;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 1em;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-right: 20px;
  }
  .btn-get-started:hover {
    background-color: #a51406;
  }
  .video-link {
    display: flex;
    align-items: center;
    color: #C21807;
    font-weight: bold;
    cursor: pointer;
  }
  .video-link img {
    width: 24px;
    height: 24px;
    margin-right: 10px;
  }
  .video-link span {
    display: inline-block;
  }
  .stats {
    margin-top: 20px;
    font-size: 1.1em;
    font-weight: bold;
    display: flex;
    justify-content: space-around;
    align-items: center;
  }
  .stat-item {
    text-align: center;
    position: relative;
    padding: 0 20px;
  }
  .stat-item::after {
    content: '';
    position: absolute;
    top: 10%;
    bottom: 10%;
    right: 0;
    width: 1px;
    background-color: #C21807;
  }
  .stat-item:last-child::after {
    display: none;
  }
  .stat-number {
    font-size: 1.5em;
    font-weight: bold;
  }
  .stat-text {
    font-size: 1em;
  }
</style>
</head>
<body>
<div class="content">
  <img src="/images/index.jpg" alt="Gym Image">
  <div class="text-content">
    <h1><span>GET HEALTHY BODY</span></h1>
    <h1><span>WITH THE PERFECT</span></h1>
    <h1><span class="yellow">EXERCISES</span></h1>
    <p>We are always there to help you to make a healthy body and mind through the power of fitness.</p>
    <div class="btn-container">
      <button class="btn-get-started">GET STARTED</button>
      <div class="video-link">
        <img src="/images/play.jpg" alt="Video Icon">
        <span>Watch Video</span>
      </div>
    </div>
    <div class="stats">
      <div class="stat-item">
        <div class="stat-number">105+</div>
        <div class="stat-text">Expert trainers</div>
      </div>
      <div class="stat-item">
        <div class="stat-number">970+</div>
        <div class="stat-text">Members joined</div>
      </div>
      <div class="stat-item">
        <div class="stat-number">135+</div>
        <div class="stat-text">Fitness programs</div>
      </div>
    </div>
  </div>
</div>
</body>
</html>