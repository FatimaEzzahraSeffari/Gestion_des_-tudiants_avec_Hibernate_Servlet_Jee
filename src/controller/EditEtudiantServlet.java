package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Etudiant;
import dao.EtudiantDAO;

@WebServlet("/EditEtudiantServlet")
public class EditEtudiantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            // Retrieve the etudiant from the database based on etudiantId
            EtudiantDAO etudiantDAO = new EtudiantDAO();
            Etudiant etudiant = etudiantDAO.getEtudiantById(id);

            // Pass the etudiant details as request attributes
            request.setAttribute("id", etudiant.getId());
            request.setAttribute("nom", etudiant.getNom());
            request.setAttribute("password1", etudiant.getPassword1());
            request.setAttribute("email", etudiant.getEmail());
            request.setAttribute("tel", etudiant.getTel());
            request.setAttribute("ecole", etudiant.getEcole());

            request.getRequestDispatcher("editEtudiant.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Error");
        }
    }
}
