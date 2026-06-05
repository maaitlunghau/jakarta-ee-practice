<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fpt.exam_wcd.entity.Book" %>
<%
    List<Book> books = (List<Book>) request.getAttribute("books");
    if (books == null) {
        response.sendRedirect("BookServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>List of Books</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h2 { text-align: center; }
        .container { width: 80%; margin: auto; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        img { width: 60px; height: 80px; object-fit: cover; }
        .add-link { display: block; margin-bottom: 10px; text-align: right; }
    </style>
</head>
<body>
    <div class="container">
        <h2>List of Books</h2>
        <div class="add-link">
            <a href="create.jsp">Add new Book</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Edition</th>
                    <th>Photo</th>
                </tr>
            </thead>
            <tbody>
                <% if (books != null) { 
                    for (Book b : books) { %>
                    <tr>
                        <td><%= b.getId() %></td>
                        <td><%= b.getTitle() %></td>
                        <td><%= b.getAuthor() %></td>
                        <td><%= b.getEdition() %></td>
                        <td>
                            <% if (b.getPhoto() != null && !b.getPhoto().isEmpty()) { %>
                                <img src="images/<%= b.getPhoto() %>" alt="Book Photo">
                            <% } else { %>
                                No Photo
                            <% } %>
                        </td>
                    </tr>
                <%  } 
                } %>
            </tbody>
        </table>
    </div>
</body>
</html>