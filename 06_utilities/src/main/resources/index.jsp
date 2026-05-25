

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Index Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"/>
        <style>
            .display{
                font-family: "consolas";
                font-size: 18pt;
            }
            a{
                text-decoration: none;
            }
        </style>
    </head>
    <body class="container">
        <h1>Utilites</h1>
        <div class="display">
            <ol>
                <li>
                    <a href="./src01_Filter.jsp">Test Filter</a>
                </li>
                <li><a href="./src02_UEL.jsp">Test UEL - Unified Expression Language</a></li>
                <li><a href="./src03_TLD.jsp">Test TLD - Tag Library Descriptor</a></li>
                <!--Đặt sai tên để không mở được trang -> export 404 Error-->
                <li><a href="./src04_404_error_.jsp">Test 404 error Code</a></li>
                <li><a href="error_500">Test 500 error Code</a></li>
                <li><a href="url">Test Page without Session</a></li>
                <li><a href="url">Test Page with Session</a></li>
                <li><a href="url">Test Internationalization | Localization</a></li>

            </ol>
        </div>

    </body>
</html>
