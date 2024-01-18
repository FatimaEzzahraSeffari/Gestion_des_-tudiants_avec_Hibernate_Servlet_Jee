package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.EtudiantDAO;
import bean.Etudiant;

@WebServlet("/EtudiantControllerServlet")
public class EtudiantControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            editEtudiant(request, response);
        } else {
            // Handle the existing code for adding etudiants
            try {
                String nom = request.getParameter("nom");
                String password1 = request.getParameter("password1");
                String email = request.getParameter("email");
                String tel = request.getParameter("tel");
                String ecole = request.getParameter("ecole");

                // Validate the inputs if needed

                EtudiantDAO etudiantDAO = new EtudiantDAO();
                etudiantDAO.addEtudiantDetails(nom, password1, email, tel, ecole);

                HttpSession session = request.getSession(true);
                session.setAttribute("successMessage", "Étudiant ajouté avec succès");

                response.sendRedirect("EtudiantListServlet"); // Redirect to a servlet for listing etudiants
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("Error");
            }
        }
    }

    private void editEtudiant(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String nom = request.getParameter("nom");
            String password1 = request.getParameter("password1");
            String email = request.getParameter("email");
            String tel = request.getParameter("tel");
            String ecole = request.getParameter("ecole");

            // Validate the inputs if needed

            EtudiantDAO etudiantDAO = new EtudiantDAO();

            Etudiant existingEtudiant = etudiantDAO.getEtudiantById(id);

            if (existingEtudiant != null) {
                existingEtudiant.setNom(nom);
                existingEtudiant.setPassword1(password1);
                existingEtudiant.setEmail(email);
                existingEtudiant.setTel(tel);
                existingEtudiant.setEcole(ecole);

                etudiantDAO.updateEtudiantDetails(existingEtudiant);

                HttpSession session = request.getSession(true);
                session.setAttribute("successMessage", "Étudiant modifié avec succès");

                response.sendRedirect("EtudiantListServlet"); // Redirect to a servlet for listing etudiants
            } else {
                // Handle case when the etudiant with the given ID doesn't exist
                response.sendRedirect("Error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Error");
        }
    }
}
