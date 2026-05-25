package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "Second_AnotationConfig", urlPatterns = { "/Second_AnotationConfig" })
public class Second_AnotationConfig extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Second_AnotationConfig</title>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4\"></script>");
            out.println("</head>");
            out.println("<body class=\"p-8 bg-slate-50\">");
            out.println("<div class=\"max-w-2xl mx-auto bg-white p-6 rounded-lg shadow-md\">");
            out.println("<h1 class=\"text-2xl font-bold text-indigo-600 mb-4\">Servlet Second_AnotationConfig</h1>");
            out.println("<p class=\"text-slate-600 mb-2\">Context Path: <span class=\"font-mono font-bold\">"
                    + request.getContextPath() + "</span></p>");

            // ------- Demo04 ----------------
            out.println("<div class=\"mt-6 p-4 bg-indigo-50 border-l-4 border-indigo-500\">");
            out.println(
                    "<h2 class=\"text-lg font-semibold text-indigo-800\">Demo04: Second_AnnotationConfig Servlet</h2>");
            var message = "processRequest() method is called by doPost() or doGet() method";
            out.println("<p class=\"text-indigo-600 italic mt-2\">\"" + message + "\"</p>");
            out.println("</div>");

            out.println("<div class=\"mt-8 flex gap-4\">");
            out.println(
                    "<a href=\"./Second_AnotationConfig\" class=\"bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-700 transition\">Refresh</a>");
            out.println(
                    "<a href=\"./index.html\" class=\"bg-slate-200 text-slate-700 px-4 py-2 rounded-md hover:bg-slate-300 transition\">Back to Home</a>");
            out.println("</div>");

            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
