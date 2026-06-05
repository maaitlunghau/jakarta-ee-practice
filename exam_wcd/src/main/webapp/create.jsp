<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add new Book</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; background-color: #f4f4f4; margin: 0; }
        .card { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); width: 400px; }
        h2 { border-bottom: 2px solid #333; padding-bottom: 10px; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input[type="text"], .form-group input[type="number"], .form-group input[type="file"] {
            width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box;
        }
        .btn { background-color: #333; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; font-size: 16px; }
        .btn:hover { background-color: #555; }
        .error { color: red; margin-bottom: 10px; }
    </style>
</head>
<body>
    <div class="card">
        <h2>Add new Book</h2>
        <% if("empty".equals(request.getParameter("error"))) { %>
            <div class="error">Title and Author cannot be empty!</div>
        <% } %>
        <form action="BookServlet" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label>Enter title:</label>
                <input type="text" name="txtTitle" required>
            </div>
            <div class="form-group">
                <label>Enter author:</label>
                <input type="text" name="txtAuthor" required>
            </div>
            <div class="form-group">
                <label>Enter edition:</label>
                <input type="number" name="txtEdition">
            </div>
            <div class="form-group">
                <label>Upload file:</label>
                <input type="file" name="filePhoto">
            </div>
            <button type="submit" class="btn">Create</button>
            <a href="index.jsp" style="margin-left: 20px; text-decoration: none; color: #666;">Cancel</a>
        </form>
    </div>
</body>
</html>
