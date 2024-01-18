
<%@ page import="java.util.List" %>
<%@ page import="bean.Note" %>
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
</head>

<body>

 <div class="table-responsive table-container">
        <h1 class="page-title">Liste des notes</h1>
        <table class="table table-bordered table-striped red-border">
 

        <thead>

           <tr style="color:white;">
                <th>ID</th>
                <th> la note</th>
                <th>Auteur de la note</th>
                <th>Actions</th>
            </tr>

        </thead>

        <tbody>

            <%

            List<Note> noteList = (List<Note>) request.getAttribute("noteList");
            if (noteList != null) {
            for (Note note : noteList) {

            %>

                <tr>

                    <td><%= note.getNoteId() %></td>

                    <td><%= note.getContent() %></td>

                    <td><%= note.getAuthor() %></td>
                     <td><a href="EditNoteServlet?noteId=<%= note.getNoteId() %>"style="background-color: green; border-color: green; width: 25%; border-radius: 10px; font-weight: bold; height: 50px; color: white; text-decoration: none; display: inline-block; text-align: center; line-height: 50px; margin-right: 5px;">Edit</a>
<a  onclick="confirmDelete(<%= note.getNoteId() %>)" class="delete-button">Delete</a>

<!-- Custom Modal for Delete Confirmation -->
<div id="deleteModal" class="modal">
    <div class="modal-content">
        <p>Êtes-vous sûr de vouloir supprimer cette note ?</p>
        <button onclick="proceedDelete()"style="background-color: red;">Oui</button>
        <button onclick="cancelDelete()"style="background-color: blue;">Cancel</button>
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

    /* Style for Delete Modal */
    .modal {
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
    function confirmDelete(noteId) {
        var modal = document.getElementById("deleteModal");
        modal.style.display = "block";
        
        // Pass noteId to the modal's data attribute for later use
        modal.setAttribute("data-note-id", noteId);
    }

    function proceedDelete() {
        var modal = document.getElementById("deleteModal");
        var noteId = modal.getAttribute("data-note-id");

        if (noteId) {
            window.location.href = "DeleteNoteServlet?noteId=" + noteId;
        }

        modal.style.display = "none";
    }

    function cancelDelete() {
        var modal = document.getElementById("deleteModal");
        modal.style.display = "none";
    }
</script>

</td>

                    <!-- Add other columns as needed -->

                </tr>

            <% } }%>

        </tbody>

    </table>
  <a class="btn btn-primary mt-3"style="background-color: red; border-color: red; width: 20%; border-radius: 10px; font-weight: bold;height:50px;" href="addNote.jsp">Ajouter une note</a>
</div>

</body>

</html>