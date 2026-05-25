<%--
  Created by IntelliJ IDEA.
  User: maaitlunghau
  Date: 25/5/26
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  </head>
  <body>
    <h1>Demo02: Calculator</h1>
     <h3>
        <%
            int a = 10, b = 20;
            out.print(a + " - " + b + " = " + (a - b));
        %>
    </h3>

    <div class="bg-blue-100 border-blue-400 text-blue-800 m-3 p-2">
        Note:
        <br/><!-- comment -->
        1. Trang JSP có thể chạy trực tiếp từ trình duyệt web, <br/>
        2. Các thay đổi tĩnh sẽ không cần biên dịch lại
    </div>

    <h3>
        <a href="./ADMIN/index.html">Open Admin Page</a>
    </h3>
  </body>
</html>
