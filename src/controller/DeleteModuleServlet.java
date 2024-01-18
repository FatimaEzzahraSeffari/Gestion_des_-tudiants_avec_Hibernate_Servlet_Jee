package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.ModuleDAO;

@WebServlet("/DeleteModuleServlet")
public class DeleteModuleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            // Delete the module from the database based on moduleId
            ModuleDAO moduleDAO = new ModuleDAO();
            moduleDAO.deleteModuleById(id);

            HttpSession session = request.getSession(true);
            session.setAttribute("successMessage", "Module deleted successfully");

            response.sendRedirect("ModuleListServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Error");
        }
    }
}
