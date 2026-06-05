package com.fpt.assignment_1.controller;

import com.fpt.assignment_1.bean.PhoneBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "PhoneController", urlPatterns = {"/PhoneServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 10 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class PhoneServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Image upload processing
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        Part filePart = request.getPart("txtImage");
        String fileName = "default.png";
        if (filePart != null && filePart.getSize() > 0) {
            fileName = filePart.getSubmittedFileName();
            filePart.write(uploadPath + File.separator + fileName);
        }

        // 2. Read form data
        String name = request.getParameter("txtName");
        String priceStr = request.getParameter("txtPrice");
        BigDecimal price = BigDecimal.ZERO;

        boolean hasError = false;
        String errMsg = "";

        // 3. Validation (matched with teacher's style)
        if (name == null || name.trim().isEmpty() || 
            priceStr == null || priceStr.trim().isEmpty() || 
            fileName.equals("default.png")) {
            hasError = true;
            errMsg = "All fields (Model, Price, Image) must not be blank!";
        } else {
            try {
                price = new BigDecimal(priceStr.trim());
                if (price.compareTo(BigDecimal.ZERO) <= 0) {
                    hasError = true;
                    errMsg = "Price must be greater than zero!";
                }
            } catch (NumberFormatException e) {
                hasError = true;
                errMsg = "Price must be a valid decimal number!";
            }
        }

        if (hasError) {
            request.setAttribute("error", errMsg);
            request.getRequestDispatcher("phone/error.jsp").forward(request, response);
            return;
        }

        // 4. Save using PhoneBean
        PhoneBean bean = new PhoneBean(null, name, price, fileName);
        boolean isOK = bean.createPhone(bean);

        if (isOK) {
            request.setAttribute("success", "Insert successfully!");
            request.getRequestDispatcher("phone/success.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Database Insert Failed!");
            request.getRequestDispatcher("phone/error.jsp").forward(request, response);
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
}
