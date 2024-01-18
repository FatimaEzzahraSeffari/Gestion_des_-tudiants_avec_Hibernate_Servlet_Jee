package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.Etudiant;
import dao.EtudiantDAO;

@WebServlet("/etudiantList")
public class EtudiantListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            EtudiantDAO etudiantDAO = new EtudiantDAO();
            List<Etudiant> etudiantList = etudiantDAO.getAllEtudiants();

            request.setAttribute("etudiantList", etudiantList);
            request.getRequestDispatcher("etudiantList.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
