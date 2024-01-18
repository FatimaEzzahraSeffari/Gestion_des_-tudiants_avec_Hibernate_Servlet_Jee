package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Note;
import dao.NoteDAO;

@WebServlet("/EditNoteServlet")
public class EditNoteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int noteId = Integer.parseInt(request.getParameter("noteId"));

            // Retrieve the note from the database based on noteId
            NoteDAO noteDAO = new NoteDAO();
            Note note = noteDAO.getNoteById(noteId);

            // Pass the note details as request attributes
            request.setAttribute("noteId", note.getNoteId());
            request.setAttribute("content", note.getContent());
            request.setAttribute("author", note.getAuthor());

            request.getRequestDispatcher("editNote.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Error");
        }
    }
}
