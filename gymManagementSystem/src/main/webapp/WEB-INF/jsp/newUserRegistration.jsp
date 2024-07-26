<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css');
* {
 box-sizing: border-box;
}
body {
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
h1 {
 text-align: center;
 margin: 0;
 padding: 7px 7px;
}
p {
 font-size: 14px;
 font-weight: 100;
 line-height: 20px;
 letter-spacing: 0.5px;
 margin: 20px 0 30px;
}
#message {
 font-size: 12px;
 color: #FF0000;
 padding: 5px 7px;
}
a {
 color: #333;
 font-size: 14px;
 text-decoration: none;
 margin: 15px 0;
}
button {
 border-radius: 20px;
 border: 1px solid #C21807;
 background-color: #C21807;
 color: #FFFFFF;
 font-size: 12px;
 font-weight: bold;
 padding: 12px 45px;
 letter-spacing: 1px;
 text-transform: uppercase;
 transition: transform 80ms ease-in;
 z-index: 2;
 position: relative;
}
button:active {
 transform: scale(0.95);
}
button:focus {
 outline: none;
}
button.gym {
 background-color: transparent;
 border-color: #FFFFFF;
}
form {
 background-color: #d3d3d3 ;
 display: flex;
 align-items: center;
 justify-content: center;
 flex-direction: column;
 padding: 0 50px;
 height: 100%;
 text-align: center;
}
input {
 background-color: #eee;
 border: none;
 padding: 5px 7px;
 margin: 8px 0;
 width: 100%;
}
.container {
 background-color: #d3d3d3 ;
 border-radius: 10px;
 box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
 0 10px 10px rgba(0,0,0,0.22);
 position: relative;
 overflow: hidden;
 width: 768px;
 max-width: 100%;
 min-height: 450px;
 z-index: 2;
}
.form-container {
 position: absolute;
 top: 0;
 height: auto;
 transition: all 0.6s ease-in-out;
 overflow: auto;
}
.sign-in-container {
 left: 0;
 width: 50%;
 z-index: 2;
}
.container.right-panel-active .sign-in-container {
 transform: translateX(100%);
}
.sign-up-container {
 left: 0;
 width: 50%;
 opacity: 0;
 z-index: 1;
}
.container.right-panel-active .sign-up-container {
 transform: translateX(100%);
 opacity: 1;
 z-index: 5;
 animation: show 0.6s;
}
@keyframes show {
 0%, 49.99% {
  opacity: 0;
  z-index: 1;
 }
 50%, 100% {
  opacity: 1;
  z-index: 5;
 }
}
.overlay-container {
 position: absolute;
 top: 0;
 left: 50%;
 width: 50%;
 height: 100%;
 overflow: hidden;
 transition: transform 0.6s ease-in-out;
 z-index: 100;
}
.container.right-panel-active .overlay-container {
 transform: translateX(-100%);
}
.overlay {
 background: #FF416C;
 background: -webkit-linear-gradient(to right, #C21807, #C21807);
 background: linear-gradient(to right, #C21807, #C21807);
 background-repeat: no-repeat;
 background-size: cover;
 background-position: 0 0;
 color: #FFFFFF;
 position: relative;
 left: -100%;
 height: 100%;
 width: 200%;
 transform: translateX(0);
 transition: transform 0.6s ease-in-out;
}
.container.right-panel-active .overlay {
 transform: translateX(50%);
}
.overlay-panel {
 position: absolute;
 display: flex;
 align-items: center;
 justify-content: center;
 flex-direction: column;
 padding: 0 40px;
 text-align: center;
 top: 0;
 height: 100%;
 width: 50%;
 transform: translateX(0);
 transition: transform 0.6s ease-in-out;
}
.overlay-left {
 transform: translateX(-20%);
}
.container.right-panel-active .overlay-left {
 transform: translateX(0);
}
.overlay-right {
 right: 0;
 transform: translateX(0);
}
.container.right-panel-active .overlay-right {
 transform: translateX(20%);
}
#option {
 background-color: #eee;
 border: none;
 padding: 7px 7px;
 margin: 8px 0;
 width: 100%;
 font-family: 'Montserrat', sans-serif;
}
.password-container {
 position: relative;
 width: 100%;
 display: flex;
 align-items: center;
}
.password-container input {
 flex: 1;
 padding-right: 30px;
}
.password-container .toggle-password {
 position: absolute;
 right: 10px;
 cursor: pointer;
}
</style>
</head>
<body background="/images/BGimg.jpg">
<script>
document.addEventListener('DOMContentLoaded', () => {
 const container = document.getElementById('container');
 container.classList.add("right-panel-active");
});
const signInButton = document.getElementById('signIn');
signInButton.addEventListener('click', () => {
 container.classList.add("left-panel-active");
});
function passwordCheck() {
 var pass1 = document.getElementById("pass1").value;
 var pass2 = document.getElementById("pass2").value;
 var message = document.getElementById("message");
 message.innerHTML = "";
 if (pass1 === "") {
  message.innerHTML = "**Fill the password please!";
  return false;
 }
 if (pass1.length < 4 || pass1.length > 8) {
  message.innerHTML = "**Password length must be between 4 to 8 characters";
  return false;
 }
 if (!pass1.match(/[a-z]/g) || !pass1.match(/[A-Z]/g) || !pass1.match(/[0-9]/g)) {
  message.innerHTML = "**Password must contain at least one lowercase letter, one uppercase letter and one digit";
  return false;
 }
 if (pass1 !== pass2) {
  message.innerHTML = "Passwords do not match";
  return false;
 }
 // Password is valid, submit the form
 return true;
}
</script>
<c:url value="/register" var="register"/>
<div class="blur-overlay"></div>
<div class="container" id="container">
 <div class="form-container sign-up-container">
  <form:form id="registration_form" method="post" action="${register}" modelAttribute="userRecord">
   <h1>Create Account</h1>
   <input type="text" placeholder="FirstName" name="firstName" required/>
   <input type="text" placeholder="LastName" name="lastName" required />
   <input type="email" placeholder="Email" name="email" required/>
   <select id="option" name="type">
    <option value="" disabled selected>Select user type</option>
    <option value="admin">Admin</option>
    <option value="member">Member</option>
   </select>
   <input type="text" placeholder="Username" name="username" required/>
   <div class="password-container">
    <input type="password" placeholder="Password" id="pass1" name="password" required />
    <i class="fas fa-eye toggle-password" id="togglePassword1"></i>
   </div>
   <div class="password-container">
    <input type="password" placeholder="Re-enter Password" id="pass2" required/>
    <i class="fas fa-eye toggle-password" id="togglePassword2"></i>
   </div>
   <div id="message"></div>
   <button type="submit" onclick="return passwordCheck();">Sign Up</button>
  </form:form>
 </div>
 <div class="form-container sign-in-container">
  <form:form method="post" action="${login}">
   <br/><br/>
   <h1>Sign in</h1>
   <br/><br/><br/>
   <input type="text" name="username" placeholder="User Id" required/>
   <br/><br/>
   <div class="password-container">
    <input type="password" name="password" placeholder="Password" required/>
    <i class="fas fa-eye toggle-password" id="togglePassword3"></i>
   </div>
   <br/><br/>
   <input class="si" type="submit" value="Sign In"/>
  </form:form>
 </div>
 <div class="overlay-container">
  <div class="overlay">
   <div class="overlay-panel overlay-left">
    <h1>Welcome Back!</h1>
    <p>To keep connected with us please login with your personal info</p>
    <button class="gym" id="signIn" onClick="window.location.href='/loginPage'">Sign In</button>
   </div>
   <div class="overlay-panel overlay-right">
    <h1>Hello, Friend!</h1>
    <p>Enter your personal details and start journey with us</p>
    <button class="gym" id="signUp">Sign Up</button>
   </div>
  </div>
 </div>
</div>
<script>
document.querySelectorAll('.toggle-password').forEach(item => {
 item.addEventListener('click', event => {
  const input = event.target.previousElementSibling;
  if (input.type === "password") {
   input.type = "text";
   event.target.classList.replace('fa-eye', 'fa-eye-slash');
  } else {
   input.type = "password";
   event.target.classList.replace('fa-eye-slash', 'fa-eye');
  }
 });
});
</script>
</body>
</html>