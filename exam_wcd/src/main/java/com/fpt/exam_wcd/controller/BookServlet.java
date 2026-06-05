package com.fpt.exam_wcd.controller;

import com.fpt.exam_wcd.bean.BookBean;
import com.fpt.exam_wcd.entity.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", urlPatterns = {"/BookServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 20 * 1024 * 1024
)
public class BookServlet extends HttpServlet {

    private BookBean bookBean = new BookBean();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // find All books to show in index.jsp
        List<Book> list = bookBean.findAll();
        request.setAttribute("books", list);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Receive parameters from create.jsp
        String title = request.getParameter("txtTitle");
        String author = request.getParameter("txtAuthor");
        String editionStr = request.getParameter("txtEdition");
        
        // 2. Process image upload
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        Part part = request.getPart("filePhoto");
        String fileName = part.getSubmittedFileName();
        if (fileName != null && !fileName.isEmpty()) {
            part.write(uploadPath + File.separator + fileName);
        }

        // 3. Validation all fields not blank (1 mark)
        if (title != null && !title.trim().isEmpty() && 
            author != null && !author.trim().isEmpty() &&
            editionStr != null && !editionStr.trim().isEmpty() &&
            fileName != null && !fileName.isEmpty()) {
            int edition = 0;
            try {
                edition = Integer.parseInt(editionStr);
            } catch (NumberFormatException e) {}

            Book newBook = new Book(0, title, author, edition, fileName);
            boolean success = bookBean.createBook(newBook);
            
            if (success) {
                // If successful, the index.jsp page will be displayed
                response.sendRedirect("BookServlet");
            } else {
                response.sendRedirect("create.jsp?error=1");
            }
        } else {
            response.sendRedirect("create.jsp?error=empty");
        }
    }
}
