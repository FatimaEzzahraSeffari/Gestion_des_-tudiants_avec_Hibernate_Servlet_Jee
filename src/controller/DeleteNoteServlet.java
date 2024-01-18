package controller;

import java.io.IOException;


import java.util.List;


import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;

import bean.Note;

import dao.NoteDAO;


@WebServlet("/DeleteNoteServlet")

public class DeleteNoteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        try {

            int noteId = Integer.parseInt(request.getParameter("noteId"));

            

            // Delete the note from the database based on noteId

            NoteDAO noteDAO = new NoteDAO();

            noteDAO.deleteNoteById(noteId);

            

            HttpSession session = request.getSession(true);

            session.setAttribute("successMessage", "Note deleted successfully");

            

            response.sendRedirect("NoteListServlet");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("Error");

        }

    }

}