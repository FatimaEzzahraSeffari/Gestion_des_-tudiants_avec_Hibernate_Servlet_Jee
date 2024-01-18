<%@ page import="java.util.List" %>
<%@ page import="bean.Etudiant" %>
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
        <h1 class="page-title">Liste des étudiants</h1>
        <table class="table table-bordered table-striped red-border">
            <thead>
                <tr style="color:white;">
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Email</th>
                    <th>Tel</th>
                    <th>Ecole</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<Etudiant> etudiantList = (List<Etudiant>) request.getAttribute("etudiantList");
                if (etudiantList != null) {
                    for (Etudiant etudiant : etudiantList) {
                %>
                        <tr>
                            <td><%= etudiant.getId() %></td>
                            <td><%= etudiant.getNom() %></td>
                            <td><%= etudiant.getEmail() %></td>
                            <td><%= etudiant.getTel() %></td>
                            <td><%= etudiant.getEcole() %></td>
                            <td><a href="EditEtudiantServlet?id=<%= etudiant.getId() %>" style="background-color: green; border-color: green; width: 35%; border-radius: 10px; font-weight: bold; height: 50px; color: white; text-decoration: none; display: inline-block; text-align: center; line-height: 50px; margin-right: 5px;">Edit</a>
<a  onclick="confirmDeleteEtudiant(<%= etudiant.getId() %>)" class="delete-button">Delete</a>

<!-- Custom Modal for Etudiant Delete Confirmation -->
<div id="deleteEtudiantModal" class="modal">
    <div class="modal-content">
        <p>Êtes-vous sûr de vouloir supprimer cet élève ?</p>
        <button onclick="proceedDeleteEtudiant()" style="background-color: red;">Oui</button>
        <button onclick="cancelDeleteEtudiant()"style="background-color:blue;">Cancel</button>
    </div>
</div>

<style>
    /* Style for Delete Button */
    .delete-button {
        background-color: red;
        border-color: red;
        width: 35%;
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

    /* Style for Etudiant Delete Modal */
    #deleteEtudiantModal {
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
    function confirmDeleteEtudiant(etudiantId) {
        var modal = document.getElementById("deleteEtudiantModal");
        modal.style.display = "block";
        
        // Pass etudiantId to the modal's data attribute for later use
        modal.setAttribute("data-etudiant-id", etudiantId);
    }

    function proceedDeleteEtudiant() {
        var modal = document.getElementById("deleteEtudiantModal");
        var etudiantId = modal.getAttribute("data-etudiant-id");

        if (etudiantId) {
            window.location.href = "DeleteEtudiantServlet?id=" + etudiantId;
        }

        modal.style.display = "none";
    }

    function cancelDeleteEtudiant() {
        var modal = document.getElementById("deleteEtudiantModal");
        modal.style.display = "none";
    }
</script>

                           </td>
          
                        </tr>
                <% }} %>
            </tbody>
        </table>
<a class="btn btn-primary mt-3"style="background-color: red; border-color: red; width: 20%; border-radius: 10px; font-weight: bold;height:50px;" href="register.jsp">Ajouter un étudiant</a>
    </div>
</body>
</html>
