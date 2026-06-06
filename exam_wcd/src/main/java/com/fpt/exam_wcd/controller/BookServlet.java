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

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
        List<Book> list = bookBean.findAll();
        request.setAttribute("books", list);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Receive parameters
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

        // 3. Validation
        Book newBook = new Book(0, title, author, 0, fileName);
        try {
            newBook.setEdition(Integer.parseInt(editionStr));
        } catch (NumberFormatException e) {}

        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        Set<ConstraintViolation<Book>> violations = validator.validate(newBook);

        if (violations.isEmpty()) {
            boolean success = bookBean.createBook(newBook);
            if (success) {
                response.sendRedirect("BookServlet");
            } else {
                request.setAttribute("error", "Database error occurred.");
                request.getRequestDispatcher("create.jsp").forward(request, response);
            }
        } else {
            // Collect error messages
            Map<String, String> errors = new HashMap<>();
            for (ConstraintViolation<Book> violation : violations) {
                errors.put(violation.getPropertyPath().toString(), violation.getMessage());
            }
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("create.jsp").forward(request, response);
        }
    }
}
