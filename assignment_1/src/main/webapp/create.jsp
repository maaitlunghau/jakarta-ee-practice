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
            padding: 20px;
            background: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-top: 0;
        }
        table {
            width: 100%;
        }
        td {
            padding: 8px;
        }
        .label {
            text-align: right;
            font-weight: bold;
        }
        input[type="text"], input[type="file"] {
            width: 100%;
            padding: 4px;
            box-sizing: border-box;
        }
        .button-row {
            text-align: center;
        }
        button {
            padding: 5px 15px;
            cursor: pointer;
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
                <td><input type="text" name="txtName" required></td>
            </tr>
            <tr>
                <td class="label">Price:</td>
                <td><input type="text" name="txtPrice" required></td>
            </tr>
            <tr>
                <td class="label">Image:</td>
                <td><input type="file" name="txtImage" required></td>
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
