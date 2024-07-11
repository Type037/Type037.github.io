<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="User.lei.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="User.lei.Product" %>
<%@ page import="User.DAO.ProductDAO" %>
<%@ page import="java.util.Locale" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<%
    // 创建ProductDAO的实例
    ProductDAO productDAO = new ProductDAO();
    // 初始化连接
    productDAO.init();
    // 获取所有商品
    List<Product> productList = productDAO.getAllProducts();
%>

<%!
    // 定义一个方法来获取日期的星期几
    public String getDayOfWeek(java.util.Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("E", Locale.getDefault()); // 使用默认的 Locale
        return sdf.format(date);
    }

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grid Layout</title>
    <style>
        /* Resetting default margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            background-image: url("Pic/scent-8328482_1920.jpg");
        }
        .father-container{
            width: 1177px;
            height: 636px;
            background-color: #F5F2EC;
            margin: 200px auto 0;
            padding-top: 5px;
        }

        /* Styling the parent container */
        .parent-container {
            width: 870px;
            height: 510px;
            margin: 50px auto 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            border-radius: 10px 10px 0 0;
            background: linear-gradient(#764e2aa5, #ffffff);
            box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
        }

        /* Styling the child boxes */
        .child-box {
            display: flex;
            justify-content: center;
            align-items: center;
            border: 1px solid #BBBBBB;
            background-color: #ffffff;
            cursor: pointer;
        }

        /* First row boxes */
        .first-row {
            margin-top:30px;
            width: calc((100%) / 7);
            height: 158px;
            background-color: #EAE1D5;
            color: #907052;
            text-align: center;
            line-height: 1.5;
        }

        /* Second row boxes */
        .second-row {
            width: calc((100%) / 7);
            height: 35px;
        }
        .three-row {
            width: calc((100%) / 7);
            height: 33px;
            display: none;
        }
        .button{
            text-align:center;
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
        .box-border {
            font-size: 20px;
            border: 1px solid #6ac13c;
            background: #e9f8df;
        }

        .hero {
            text-align: center;
            padding: 50px 0;
            background-image: url("Pic/scent-8328482_1920.jpg");
            background-size: contain;
        background-repeat: no-repeat;
        }
    </style>
</head>
<body>

<%
    // Retrieving form data from request parameters
    String projectName = request.getParameter("skills");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String orderNumber = request.getParameter("Order_number");
    String email = request.getParameter("e-mail");
%>

<div class="father-container">
    <div class="parent-container">
        <!-- First row -->
        <div class="child-box first-row first-column">
            <img src="your-image.jpg" alt="Image">
        </div>

        <%-- Render the days --%>
        <%
            // Get current date
            Calendar calendar = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            for (int i = 0; i < 6; i++) {
                calendar.add(Calendar.DAY_OF_MONTH, i == 0 ? 0 : 1);
        %>
        <div class="child-box first-row">
            <%= sdf.format(calendar.getTime()) %><br>
            <%= getDayOfWeek(calendar.getTime()) %>
        </div>
        <% } %>

        <% int iid=0; for (Product product : productList) { if(iid!=0){ %>
        <div class="child-box second-row" id="<%= iid %>" onclick="changeBorder('<%= iid %>')">
            <%= product.getPname() %>
        </div>
        <% }iid++;} %>
    </div>
    <form action="RegisterServlet" method="post">
        <div class="child-box three-row">
            <input type="text" name="uproject" value="<%= projectName %>" class="input-item">
            <input type="text" name="name" value="<%= name %>" class="input-item">
            <input type="text" name="Order_number" value="<%= orderNumber %>" class="input-item">
            <input type="text" name="phone" value="<%= phone %>" class="input-item">
            <input type="text" name="email" value="<%= email %>" class="input-item">
            <input type="text" name="selectedBoxId" id="idInput" class="input-item">
        </div>
        <div class="button">
            <button class="niceButton5" type="submit"><span>Es-tu sûr</span></button>
        </div>
    </form>
</div>

<script>
    var qid=0;

    function changeBorder(id) {
        if(id%7!=1){
            var boxes = document.getElementsByClassName('child-box');
            for (var i = 0; i < boxes.length; i++) {
                boxes[i].classList.remove('box-border');
            }
            var _box = document.getElementById(id);
            _box.classList.add('box-border');
        }
        qid=id;
        // 获取输入框元素
        var emailInput = document.getElementById("idInput");

        // 将 qid 的值设置为输入框的值
        emailInput.value = qid;
    }
</script>

</body>
</html>
