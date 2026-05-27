package com.fpt.controller;

import com.fpt.bean.BrandBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/controller")
public class BrandController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 1. Parameter list
        String action = request.getParameter("action");
        Integer id = null;
        String name, contact, website;

        BrandBean bean = new BrandBean();

        // 2. CRUD
        // kiểm tra xem action này có đang null ko ?
        if (action == null || action.isEmpty()) {
            request.setAttribute("list", bean.findAll());
            request.getRequestDispatcher("brand/index.jsp").forward(request, response);
        } else {
            switch (action) {
                case "create" -> {
                    response.sendRedirect("brand/create.jsp");
                }
                case "process-create" -> {
                    // 1. Read create form data
                    name = request.getParameter("txtName");
                    contact  = request.getParameter("txtContact");
                    website = request.getParameter("txtWeb");

                    // 2. Set data to BrandBean class
                    // 2.1. Validation
                    Map<String, String> errors = new HashMap<>();
                    if (name == null || name.isBlank()) {
                        errors.put("name", "Brand name is required!");
                    }
                    if (contact == null || contact.isBlank()) {
                        errors.put("contact", "Brand contact is required!");
                    }
                    if (website == null || website.isBlank()) {
                        errors.put("website", "Brand website is required!");
                    }
                    if (!errors.isEmpty()) {
                        request.setAttribute("errors", errors);
                        request.setAttribute("errMes", "Please, correct! ...");
                        request.getRequestDispatcher("brand/create.jsp").forward(request, response);
                    }

                    // 2.2. Set data to class
                    bean = new BrandBean(id, name, contact, website);

                    // 3. Insert data into database
                }
                case "update" -> {

                }
                case "process-update" -> {

                }
                case "delete" -> {

                }
                default -> {
                    throw new AssertionError();
                }
            }
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