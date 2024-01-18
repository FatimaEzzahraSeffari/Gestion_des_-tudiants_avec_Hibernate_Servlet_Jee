package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Module;
import dao.ModuleDAO;

@WebServlet("/moduleList")
public class ModuleListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ModuleDAO moduleDAO = new ModuleDAO();
            List<Module> moduleList = moduleDAO.getAllModules();

            request.setAttribute("moduleList", moduleList);
            request.getRequestDispatcher("moduleList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
