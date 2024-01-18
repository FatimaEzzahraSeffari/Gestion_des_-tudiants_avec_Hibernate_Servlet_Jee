<%@ page import="java.util.List" %>
<%@ page import="bean.Module" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
 <%@include file="index.jsp" %>
  <style>
        .table-red-borders td {
     color: white;
 }

 .red-border {
     border: 2px solid red;
 }

 .table-container {
     margin-left: 260px;
     position: relative;
     top: -650px;
     overflow-y: hidden;
     
 }

 
 .page-title {
     text-align: center;
     font-weight: bold;
     margin-right: 120px;
     margin-bottom: 40px;
     
 }
    </style>

    <!-- <link rel="stylesheet" type="text/css" href="style.css"> -->
</head>
   
<body>
  <div class="table-responsive table-container">
        <h1 class="page-title">Liste des modules</h1>
        <table class="table table-bordered table-striped red-border">
        <thead>
             <tr style="color:white;">
                <th>ID</th>
                <th>Nom</th>
                <th>Description</th>
                <th>Actions</th>
                
            </tr>
        </thead>
        <tbody>
            <%
            List<Module> moduleList = (List<Module>) request.getAttribute("moduleList");
            if (moduleList != null) {
            for (Module module : moduleList) {
            %>
                <tr>
                    <td><%= module.getId() %></td>
                    <td><%= module.getNom() %></td>
                    <td><%= module.getDescription() %></td>
<td><a href="EditModuleServlet?id=<%= module.getId() %>"style="background-color: green; border-color: green; width: 25%; border-radius: 10px; font-weight: bold; height: 50px; color: white; text-decoration: none; display: inline-block; text-align: center; line-height: 50px; margin-right: 5px;">Edit</a>
<a onclick="confirmDeleteModule(<%= module.getId() %>)" class="delete-button">Delete</a>

<!-- Custom Modal for Module Delete Confirmation -->
<div id="deleteModuleModal" class="modal">
    <div class="modal-content">
        <p>Êtes-vous sûr de vouloir supprimer ce module ?</p>
        <button onclick="proceedDeleteModule()"style="background-color: red;">Oui</button>
        <button onclick="cancelDeleteModule()"style="background-color: blue;">Cancel</button>
    </div>
</div>

<style>
    /* Style for Delete Button */
    .delete-button {
        background-color: red;
        border-color: red;
        width: 25%;
        border-radius: 10px;
        font-weight: bold;
        height: 50px;
        color: white;
        text-decoration: none;
        display: inline-block;
        text-align: center;
        line-height: 50px;
        cursor: pointer;
    }

    /* Style for Module Delete Modal */
    #deleteModuleModal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
        background-color: white;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 40%;
        text-align: center;
        border-radius: 10px;
    }

    button {
        
        color: white;
        border: none;
        padding: 10px 20px;
        margin: 5px;
        border-radius: 5px;
        cursor: pointer;
    }
</style>

<script>
    function confirmDeleteModule(moduleId) {
        var modal = document.getElementById("deleteModuleModal");
        modal.style.display = "block";
        
        // Pass moduleId to the modal's data attribute for later use
        modal.setAttribute("data-module-id", moduleId);
    }

    function proceedDeleteModule() {
        var modal = document.getElementById("deleteModuleModal");
        var moduleId = modal.getAttribute("data-module-id");

        if (moduleId) {
            window.location.href = "DeleteModuleServlet?id=" + moduleId;
        }

        modal.style.display = "none";
    }

    function cancelDeleteModule() {
        var modal = document.getElementById("deleteModuleModal");
        modal.style.display = "none";
    }
</script>

</td>
                    <!-- Ajoutez d'autres colonnes selon vos besoins -->
                </tr>
            <% }} %>
        </tbody>
    </table>
    <a class="btn btn-primary mt-3"style="background-color: red; border-color: red; width: 20%; border-radius: 10px; font-weight: bold;height:50px;" href="moduleadd.jsp">Ajouter un module</a>
    
</div>
</body>
</html>
