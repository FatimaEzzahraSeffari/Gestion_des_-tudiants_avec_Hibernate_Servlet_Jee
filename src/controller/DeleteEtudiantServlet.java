package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.EtudiantDAO;

@WebServlet("/DeleteEtudiantServlet")
public class DeleteEtudiantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            // Delete the étudiant from the database based on étudiantId
            EtudiantDAO etudiantDAO = new EtudiantDAO();
            etudiantDAO.deleteEtudiantById(id);

            HttpSession session = request.getSession(true);
            session.setAttribute("successMessage", "Étudiant deleted successfully");

            response.sendRedirect("EtudiantListServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Error");
        }
    }
}
