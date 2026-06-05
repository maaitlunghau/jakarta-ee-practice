<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create new Phone</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f8f9fa; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .container { background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.05); width: 100%; max-width: 450px; border: 1px solid #eee; }
        h1 { text-align: center; color: #333; margin-bottom: 2rem; font-weight: 600; }
        table { width: 100%; border-collapse: separate; border-spacing: 0 15px; }
        td { padding: 5px; }
        td:first-child { width: 80px; color: #666; font-weight: 500; }
        input[type="text"], input[type="file"] { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box; font-size: 14px; }
        input[type="text"]:focus { border-color: #4a90e2; outline: none; box-shadow: 0 0 0 3px rgba(74,144,226,0.1); }
        .btn-container { text-align: center; margin-top: 10px; }
        input[type="submit"] { background: #4a90e2; color: white; border: none; padding: 12px 30px; border-radius: 6px; font-weight: 600; cursor: pointer; transition: background 0.2s; font-size: 15px; }
        input[type="submit"]:hover { background: #357abd; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Create new Phone</h1>
        <form action="PhoneServlet" method="POST" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Model:</td>
                    <td><input type="text" name="txtName" required></td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td><input type="text" name="txtPrice" required></td>
                </tr>
                <tr>
                    <td>Image:</td>
                    <td><input type="file" name="txtImage" required></td>
                </tr>
                <tr>
                    <td colspan="2" class="btn-container">
                        <input type="submit" name="Create" value="Create">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
