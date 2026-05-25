package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/First_WebConfig")
public class First_WebConfig extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>First Servlet</title>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4\"></script>");
            out.println("</head>");
            out.println("<body class=\"p-8\">");
            out.println("<h1 class=\"text-2xl font-bold mb-4\">Servlet First_WebConfig at " + request.getContextPath()
                    + "</h1>");

            // Demo 03
            out.println("<table class=\"table-auto border-collapse border border-slate-400 w-full mb-4\">");
            out.println("<thead><tr class=\"bg-slate-100\">");
            out.println("<th class=\"border border-slate-300 p-2\">Name</th>");
            out.println("<th class=\"border border-slate-300 p-2\">Value</th>");
            out.println("</tr></thead><tbody>");

            var headers = request.getHeaderNames();
            while (headers.hasMoreElements()) {
                String headerName = headers.nextElement();
                String content = request.getHeader(headerName);
                out.print("<tr>");
                out.print("<td class=\"border border-slate-300 p-2 font-medium\">" + headerName + "</td>");
                out.print("<td class=\"border border-slate-300 p-2\">" + content + "</td>");
                out.print("</tr>");
            }
            out.println("</tbody></table>");
            out.println(
                    "<a href=\"./First_WebConfig\" class=\"inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600\">Refresh</a>");
            out.println("<br><br><a href=\"./index.html\" class=\"text-blue-500 hover:underline\">Back to Home</a>");

            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }
}