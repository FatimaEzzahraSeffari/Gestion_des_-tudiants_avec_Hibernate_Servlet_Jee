package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.NoteDAO; // Assuming you have a DAO class for handling Note entities
import bean.Note; // Assuming you have a Note class

@WebServlet("/NoteControllerServlet")
public class NoteControllerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            try {
                int noteId = Integer.parseInt(request.getParameter("noteId"));
                String content = request.getParameter("content");
                String author = request.getParameter("author");

                // Validate the inputs if needed

                NoteDAO noteDAO = new NoteDAO(); // Assuming you have a DAO class for Note entities

                Note existingNote = noteDAO.getNoteById(noteId);

                if (existingNote != null) {
                    existingNote.setContent(content);
                    existingNote.setAuthor(author);

                    noteDAO.updateNoteDetails(existingNote);

                    HttpSession session = request.getSession(true);
                    session.setAttribute("successMessage", "Note ajoutée avec succès");

                    response.sendRedirect("NoteListServlet"); // Redirect to a servlet for listing notes
                } else {
                    // Handle case when the note with the given ID doesn't exist
                    response.sendRedirect("Error");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("Error");
            }
        } else {
            // Handle the existing code for adding notes
            try {
                String content = request.getParameter("content");
                String author = request.getParameter("author");

                // Validate the inputs if needed

                NoteDAO noteDAO = new NoteDAO();
                noteDAO.addNoteDetails(content, author);

                HttpSession session = request.getSession(true);
                session.setAttribute("successMessage", "Note added successfully");

                response.sendRedirect("NoteListServlet"); // Redirect to a servlet for listing notes
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("Error");
            }
        }
    }
}
