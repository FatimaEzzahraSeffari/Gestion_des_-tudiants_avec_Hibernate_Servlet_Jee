package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.ModuleDAO;
import bean.Module;

@WebServlet("/ModuleControllerServlet")
public class ModuleControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String nom = request.getParameter("nom");
                String description = request.getParameter("description");

                // Validate the inputs if needed

                ModuleDAO moduleDAO = new ModuleDAO();

                Module existingModule = moduleDAO.getModuleById(id);

                if (existingModule != null) {
                    existingModule.setNom(nom);
                    existingModule.setDescription(description);

                    moduleDAO.updateModuleDetails(existingModule);

                    HttpSession session = request.getSession(true);
                    session.setAttribute("successMessage", "Module modifié avec succès");

                    response.sendRedirect("ModuleListServlet"); // Redirect to a servlet for listing modules
                } else {
                    // Handle case when the module with the given ID doesn't exist
                    response.sendRedirect("Error");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("Error");
            }
        } else {
            // Handle the existing code for adding modules
            try {
                String nom = request.getParameter("nom");
                String description = request.getParameter("description");

                // Validate the inputs if needed

                ModuleDAO moduleDAO = new ModuleDAO();
                moduleDAO.addModuleDetails(nom, description);

                HttpSession session = request.getSession(true);
                session.setAttribute("successMessage", "Module ajouté avec succès");

                response.sendRedirect("ModuleListServlet"); // Redirect to a servlet for listing modules
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("Error");
            }
        }
    }
}
