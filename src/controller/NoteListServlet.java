package controller;


import java.io.IOException;

import java.util.List;


import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;


import bean.Note;

import dao.NoteDAO;


@WebServlet("/noteList")

public class NoteListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        NoteDAO noteDAO = new NoteDAO();

        List<Note> noteList = noteDAO.getAllNotes();


        request.setAttribute("noteList", noteList);

        request.getRequestDispatcher("noteList.jsp").forward(request, response);

    }

}