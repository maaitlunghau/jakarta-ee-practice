<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create new Phone</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .container {
            border: 1px solid #ccc;
            padding: 30px 40px;
            background: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            min-width: 400px;
        }
        h2 {
            text-align: center;
            margin-top: 0;
        }
        table { width: 100%; }
        td { padding: 8px 4px; }
        .label { text-align: right; font-weight: bold; width: 80px; }
        input[type="text"] { width: 250px; padding: 4px; }
        .button-row { text-align: center; padding-top: 10px; }
        button {
            padding: 5px 20px;
            cursor: pointer;
            background: #f0f0f0;
            border: 1px solid #aaa;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Create new Phone</h2>
    <form action="PhoneServlet" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td class="label">Model:</td>
                <td><input type="text" name="txtName"></td>
            </tr>
            <tr>
                <td class="label">Price:</td>
                <td><input type="text" name="txtPrice"></td>
            </tr>
            <tr>
                <td class="label">Image:</td>
                <td><input type="file" name="txtImage"></td>
            </tr>
            <tr>
                <td colspan="2" class="button-row">
                    <button type="submit">Create</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
