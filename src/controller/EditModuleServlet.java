package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Module;
import dao.ModuleDAO;

@WebServlet("/EditModuleServlet")
public class EditModuleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            // Retrieve the module from the database based on moduleId
            ModuleDAO moduleDAO = new ModuleDAO();
            Module module = moduleDAO.getModuleById(id);

            // Pass the module details as request attributes
            request.setAttribute("id", module.getId());
            request.setAttribute("nom", module.getNom());
            request.setAttribute("description", module.getDescription());

            request.getRequestDispatcher("editModule.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Error");
        }
    }
}
