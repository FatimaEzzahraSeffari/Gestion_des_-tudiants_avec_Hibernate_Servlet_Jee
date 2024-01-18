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
            width: 91%;
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
            width: 105%;
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
    

    <form action="EtudiantControllerServlet?action=edit" method="post">
     <h1 class="page-title">Edit Etudiant</h1>
                 <div class="form-group">
        <input type="hidden" class="form-control red-border white-text"name="id" value="<%= request.getAttribute("id") %>">
         </div>
                    <div class="form-group">
        Nom: <input type="text" class="form-control red-border white-text"name="nom" value="<%= request.getAttribute("nom") %>"><br>
         </div>
                    <div class="form-group">
        Password: <input type="password" class="form-control red-border white-text" name="password1" value="<%= request.getAttribute("password1") %>"><br>
         </div>
                    <div class="form-group">
        Email: <input type="text"  class="form-control red-border white-text" name="email" value="<%= request.getAttribute("email") %>"><br>
         </div>
                    <div class="form-group">
        Tel: <input type="text" class="form-control red-border white-text" name="tel" value="<%= request.getAttribute("tel") %>"><br>
         </div>
                    <div class="form-group">
        Ecole: <input type="text" class="form-control red-border white-text" name="ecole" value="<%= request.getAttribute("ecole") %>"><br>
         </div>
                    
        <input style="background-color: red; border-color: red; width: 15%; border-radius: 10px; font-weight: bold;height:50px;color:white;" type="submit" value="Save">
    </form>
</body>

</html>
