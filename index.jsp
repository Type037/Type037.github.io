<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        html {
            height: 100%;
        }
        body {
            height: 100%;
        }
        .container {
            height: 100%;
            background-image: linear-gradient(to right, #f9e4d1, #ffffff);
        }
        .login-wrapper {
            background-color: #fff;
            width: 358px;
            height: 588px;
            border-radius: 15px;
            padding: 0 50px;
            position: relative;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }
        .header {
            font-size: 25px;
            font-weight: bold;
            text-align: center;
            line-height: 200px;
        }
        .input-item {
            display: block;
            width: 100%;

            border: 0;
            padding: 10px;
            border-bottom: 1px solid rgb(128, 125, 125);
            font-size: 15px;
            outline: none;
        }
        .input-item::placeholder {
            text-transform: uppercase;
        }
        .msg {
            text-align: center;
            line-height: 80px;
        }
        a {
            text-decoration-line: none;
            color: #abc1ee;
        }

        .dropbtn {
            text-align: center;
            background-color: #ffffff;
            color: #3f3f3f;
            padding: 16px;
            font-size: 12px;
            cursor: pointer;
            border-style:inset;
            border-width:2px;
            border-radius:10px;
        }

        .niceButton5 {
            display: inline-block;
            border-radius: 20px;
            background-color: #f4511e;
            border: none;
            color: #ffff;
            text-align: center;
            font-size: 12px;
            font-weight: 400;
            padding: 6px;
            width:125px;
            transition: all 0.5s;
            cursor: pointer;
            margin: 5px;
            margin-top: 15px;
            vertical-align: middle;
        }
        .niceButton5 span {
            cursor: pointer;
            display: inline-block;
            position: relative;
            transition: 0.5s;
        }
        .niceButton5 span::after {
            content: ">";
            position: absolute;
            opacity: 0;
            top: 0;
            right: -20px;
            transition: 0.5s;
        }
        .niceButton5:hover span {
            padding-right: 30px;
        }
        .niceButton5:hover span::after {
            opacity: 1;
            right: 0;
        }
        .button{
            text-align:center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="login-wrapper">
        <div class="header">Sélection des projets</div>
        <form action="rili.jsp" method="post">
        <div class="form-wrapper">
            <select id="uproject" class="dropbtn" name="skills">
                <option value="1">Une heure massage au tête </option>
                <option value="2">Une heure massage au tête+massage aux yeux+Hydratation</option>
                <option value="3">une heure massage au huil chaud en solo</option>
                <option value="4">une heure massage au huil chaud en solo+gommage+Hamam</option>
            </select>
            <br/>
            <input type="text" name="name" placeholder="name(Required)" class="input-item">
            <input type="text" name="phone" placeholder="phone(Required)" class="input-item">
            <input type="text" name="Order_number" placeholder="Order number(Required)" class="input-item">
            <input type="text" name="e-mail" placeholder="e-mail(Optional)" class="input-item">
            <div class="button">   <button class="niceButton5" type="submit"><span>Es-tu sûr</span></button></div>
        </div>
        </form>
        <div class="msg">
            <a href="/index.jsp">Vous ne connaissez pas ces articles?</a>
        </div>

    </div>
</div>
</body>
</html>
