
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"/>

        <title>UEL Page</title>
        <style>
            *{
                font-family: "consolas";

            }
            span{
                color:blue;
                font-size: 15pt;
            }
        </style>
    </head>
    <body class="container">
        <h1 class="fw-bold">Unified Expression Language</h1>
        <div>
            1. An Expression Language (EL -> \${...}):
            <span>
                10+20 = ${10+20}
            </span>

        </div>
        <%
            int num = 100;
            // Dùng pageContext
            pageContext.setAttribute("number", num);

        %>
        <div>
            2. Dùng Scriptlet (&lt;% =num %&gt;) :
            <span>
                num => <%= num%>
            </span>

        </div>
        <div>
            3. Đọc từ Scriptlet, hiển thị trong EL (EL -> \${...}) :
            <span>
                num => ${number}
            </span>

        </div>
        <div>
            4. Dùng pageScope với dot Operator :
            <span>
                pageScope.number => ${pageScope.number}
            </span>

        </div>
        <div>
            5. Dùng pageScope với Square Brackets :
            <span>
                pageScope.number => ${pageScope["number"]}
            </span>

        </div>

    </body>
</html>
