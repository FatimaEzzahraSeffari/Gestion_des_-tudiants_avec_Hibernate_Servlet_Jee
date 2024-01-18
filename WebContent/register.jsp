<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
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
        <form action="register" method="post">
            <h1 class="page-title">Ajouter un étudiant</h1>

            <div class="form-group">
                <label for="nom">Nom :</label>
                <input type="text"class="form-control red-border white-text" name="nom" />

                <label for="email">Email:</label>
                <input type="text"class="form-control red-border white-text" name="email" />
            </div>

            <div class="form-group password-fields">
                <label for="password1">Mot de passe:</label>
                <input type="password"class="form-control red-border white-text" name="password1" />

                <label for="password2">Confirmer<br> Mot de <br>passe:</label>
                <input type="password" class="form-control red-border white-text"name="password2" />
            </div>

            <div class="form-group password-fields">
                <label for="tel">Tel:</label>
                <input type="text"class="form-control red-border white-text" name="tel" />

                <label for="ecole">Ecole:</label>
                <input type="text"class="form-control red-border white-text" name="ecole" />
            </div>

<input style="background-color: red; border-color: red; width: 15%; border-radius: 10px; font-weight: bold;height:50px;color:white;" type="submit" value="Ajouter" />
        </form>
    </div>
</div>

</body>
</html>
