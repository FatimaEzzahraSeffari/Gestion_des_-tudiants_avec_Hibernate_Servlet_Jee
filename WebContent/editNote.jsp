<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <%@include file="index.jsp" %>
    <style>
        body {
            background-color: black;
            color: white;
            margin: 0;
        }

        .container {
            margin-top: 10px;
        }

        .form-container {
            margin-left: 170px;
            position: relative;
            overflow-y: hidden;
            top: -650px;
            border: 2px solid red;
            padding: 20px;
            border-radius: 10px;
            width: 70%;
        }

        .page-title {
            text-align: center;
            font-weight: bold;
            margin-bottom: 40px;
        }

        .form-group {
            margin-bottom: 20px;
            display: flex;
            gap: 20px;
            align-items: center;
        }

        label {
            width: 120px; 
            margin: 0; 
            text-align: right; 
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 50%;
            padding: 8px;
            box-sizing: border-box;
            background-color: black;
               border: 2px solid red;
               border-radius: 10px;
        

        .password-fields {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        input[type="password"] {
            width: 100%;
        }

        input[type="submit"] {
            background-color: red;
            border: 2px solid white;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
        }

       
    </style>
</head>

<body>
    <div class="container">
    <div id="formDiv" class="form-container">

        <h1>Edit Note</h1>


    <form action="NoteControllerServlet?action=edit" method="post">
     <div class="form-group">
        <input type="hidden" class="form-control red-border white-text" name="noteId" value="<%= request.getAttribute("noteId") %>">
          </div>
         <div class="form-group">
        Content: <input type="text" class="form-control red-border white-text" name="content" value="<%= request.getAttribute("content") %>"><br>
          </div>
         <div class="form-group">
        Author: <input type="text" class="form-control red-border white-text" name="author" value="<%= request.getAttribute("author") %>"><br>
          </div>
        <input style="background-color: red; border-color: red; width: 15%; border-radius: 10px; font-weight: bold;height:50px;color:white;" type="submit" value="Save">
    </form>
</body>

</html>
